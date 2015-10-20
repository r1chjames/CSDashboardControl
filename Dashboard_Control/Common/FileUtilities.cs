using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Drawing;
using System.IO;

namespace Dashboard_Control.Common
{
    public class FileUtilities
    {
        private static string GetConnectionString()
        {
            return ConfigurationManager.AppSettings["Dashboard_Control"];
        }

        private static void OpenConnection(SqlConnection connection)
        {
            connection.ConnectionString = GetConnectionString();
            connection.Open();
        }

        // Get the list of the files in the database
        public static DataTable GetFileList()
        {
            DataTable fileList = new DataTable();
            using (SqlConnection connection = new SqlConnection())
            {
                OpenConnection(connection);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;
                cmd.CommandTimeout = 0;

                cmd.CommandText = "SELECT [ID], [Name], [Site], [Date], [ContentType] FROM Dashboard_Images where [Date] > getdate() - 30 ORDER BY ID DESC";
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter adapter = new SqlDataAdapter();

                adapter.SelectCommand = cmd;
                adapter.Fill(fileList);

                connection.Close();
            }

            return fileList;
        }

        private static Image byteArrayToImage(byte[] byteArrayIn)
        {
            MemoryStream ms = new MemoryStream(byteArrayIn);
            Image returnImage = Image.FromStream(ms);
            return returnImage;
        }

        private static byte[] ScaleImage(byte[] data, int maxWidth, int maxHeight)
            {
                //Convert to image from byte[]
                Image image = byteArrayToImage(data);
                var ratioX = (double)maxWidth / image.Width;
                var ratioY = (double)maxHeight / image.Height;
                var ratio = Math.Min(ratioX, ratioY);

                var newWidth = (int)(image.Width * ratio);
                var newHeight = (int)(image.Height * ratio);
                
                //Resize image
                var newImage = new Bitmap(newWidth, newHeight);
                using (Graphics gr = Graphics.FromImage(newImage))
                {
                    gr.SmoothingMode = SmoothingMode.HighQuality;
                    gr.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    gr.PixelOffsetMode = PixelOffsetMode.HighQuality;
                    gr.DrawImage(image, new Rectangle(0, 0, newWidth, newHeight));
                }

                //Convert the image back to byte[] so it can be stored in the database
                MemoryStream ms = new MemoryStream();
                newImage.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                return ms.ToArray();
            }

      
        // Save a file into the database
        public static void SaveFile(string name, string site, string contentType,
            int size, byte[] data)
        {
            //reduce the size of the image
            byte[] img = ScaleImage(data, 1120, 780);
            using (SqlConnection connection = new SqlConnection())
            {
                OpenConnection(connection);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;
                cmd.CommandTimeout = 0;

                string commandText = "INSERT INTO Dashboard_Images VALUES(@Name, @Site, @Date, @ContentType, ";
                commandText = commandText + "@Size, @Data)";
                cmd.CommandText = commandText;
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 100);
                cmd.Parameters.Add("@Date", SqlDbType.DateTime);
                cmd.Parameters.Add("@Site", SqlDbType.NVarChar,10);
                cmd.Parameters.Add("@ContentType", SqlDbType.VarChar, 50);
                cmd.Parameters.Add("@size", SqlDbType.Int);
                cmd.Parameters.Add("@Data", SqlDbType.VarBinary);

                cmd.Parameters["@Name"].Value = name;
                cmd.Parameters["@Date"].Value = DateTime.Now.ToString();
                cmd.Parameters["@Site"].Value = site;
                cmd.Parameters["@ContentType"].Value = contentType;
                cmd.Parameters["@size"].Value = size;
                cmd.Parameters["@Data"].Value = img;
                cmd.ExecuteNonQuery();

                connection.Close();
            }
        }

        // Get a file from the database by ID
        public static DataTable GetAFile(int id)
        {
            DataTable file = new DataTable();
            using (SqlConnection connection = new SqlConnection())
            {
                OpenConnection(connection);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;
                cmd.CommandTimeout = 0;

                cmd.CommandText = "SELECT ID, Name, ContentType, Data FROM Dashboard_Images "
                    + "WHERE ID = @ID";
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter adapter = new SqlDataAdapter();

                cmd.Parameters.Add("@ID", SqlDbType.Int);
                //cmd.Parameters.Add("@site", SqlDbType.NVarChar,3) ;
                cmd.Parameters["@ID"].Value = id;
                //cmd.Parameters["@site"].Value = site;

                adapter.SelectCommand = cmd;
                adapter.Fill(file);

                connection.Close();
            }

            return file;
        }
        // Get a file from the database by ID
        public static DataTable GetLatestFile(string site)
        {
            DataTable file = new DataTable();
            using (SqlConnection connection = new SqlConnection())
            {
                OpenConnection(connection);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = connection;
                cmd.CommandTimeout = 0;

                cmd.CommandText = "SELECT TOP 1 ID, Name, ContentType, Site, Data FROM Dashboard_Images WHERE [site] = @site "
                    + "ORDER BY ID desc";
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter adapter = new SqlDataAdapter();

                cmd.Parameters.Add("@site", SqlDbType.NVarChar, 10);
                cmd.Parameters["@site"].Value = site;

                adapter.SelectCommand = cmd;
                adapter.Fill(file);

                connection.Close();
            }

            return file;
        }
    }
}