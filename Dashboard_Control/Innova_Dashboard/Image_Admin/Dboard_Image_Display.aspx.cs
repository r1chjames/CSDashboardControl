using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Dashboard_Control.Common;

namespace Dashboard_Control
{
    public partial class Dboard_Image_Display : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get the file id from the query string
            int id = Convert.ToInt16(Request.QueryString["ID"]);

            // Get the file from the database
            DataTable file = FileUtilities.GetAFile(id);
            DataRow row = file.Rows[0];

            string name = (string)row["Name"];
            string contentType = (string)row["ContentType"];
            Byte[] data = (Byte[])row["Data"];

            // Send the file to the browser
            Response.AddHeader("Content-type", contentType);
            //Response.AddHeader("Content-Disposition", "attachment; filename=" + name);
            Response.AddHeader("Content-Disposition", "inline");
            Response.BinaryWrite(data);
            Response.Flush();
            Response.End();
        }
    }
}




