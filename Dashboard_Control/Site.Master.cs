using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Dashboard_Control
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection("SERVER=WMM0772MANUAP01;Trusted_Connection=Yes;DATABASE=Dashboard_Control"))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    //cmd.CommandText = "Cache_clear";
                    //cmd.CommandType = CommandType.StoredProcedure;
                    //cmd.Connection = con;
                    //SqlDataAdapter adapter = new SqlDataAdapter();
                    //adapter.SelectCommand = cmd;
                    //adapter.Fill(ds);

                }
                con.Close();
            }

            string connectionString = null;
            SqlConnection connection;
            SqlCommand command = new SqlCommand();
            connectionString = "Data Source=WMM0772MANUAP01;Initial Catalog=Dashboard_Control;Integrated Security=True";
            connection = new SqlConnection(connectionString);
            command.Connection = connection;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "Page_Audit";

            SqlParameter param1 = new SqlParameter();
            param1.ParameterName = "@PageName";
            param1.SqlDbType = SqlDbType.NVarChar;
            param1.Direction = ParameterDirection.Input;
            param1.Value = Request.Url.AbsolutePath;
            command.Parameters.Add(param1);

            SqlParameter param2 = new SqlParameter();
            param2.ParameterName = "@User";
            param2.SqlDbType = SqlDbType.NVarChar;
            param2.Direction = ParameterDirection.Input;
            param2.Value = HttpContext.Current.User.Identity.Name;
            command.Parameters.Add(param2);

            SqlParameter param3 = new SqlParameter();
            param3.ParameterName = "@client";
            param3.SqlDbType = SqlDbType.NVarChar;
            param3.Direction = ParameterDirection.Input;
            param3.Value = Dns.GetHostEntry(Request.ServerVariables["remote_addr"]).HostName;
            command.Parameters.Add(param3);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Console.WriteLine("{0}: {1:C}", reader[0], reader[1]);
                }
            }
            else
            {
                Console.WriteLine("No rows found.");
            }
            reader.Close();
            connection.Close();
            DataSet ds1 = new DataSet();
            connectionString = "Data Source=WMM0772MANUAP01;Initial Catalog=Dashboard_Control;Integrated Security=True";
            connection = new SqlConnection(connectionString);
            command.CommandText = "select data from site_config where application = 'Dashboard_Control' and area = 'general' and item = 'announcement_banner'";
            command.CommandType = CommandType.Text;
            command.Connection = connection;
            SqlDataAdapter adapter1 = new SqlDataAdapter();
            adapter1.SelectCommand = command;
            adapter1.Fill(ds1);
            command.Connection.Open();

            Label mpLabel = (Label)FindControl("LblAnn");
            mpLabel.Text = command.ExecuteScalar().ToString();

            command.Connection.Close();
        }
    }
}