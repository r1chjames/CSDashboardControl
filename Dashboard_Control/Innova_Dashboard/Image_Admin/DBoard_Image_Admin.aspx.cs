using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Collections.Generic;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using Dashboard_Control.Common;

namespace Dashboard_Control
{
    public partial class DBoard_Image_Admin : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            lblValidator.Visible = false;
            if (!IsPostBack)
            {
                DataTable fileList = FileUtilities.GetFileList();
                gvFiles.DataSource = fileList;
                gvFiles.DataBind();
            }
            if (IsPostBack && fileUpload.PostedFile != null)

            {

                if (fileUpload.PostedFile.FileName.Length > 0)
                {
                    btnUpload_Click(null, null);
                }
            }
        }

        //protected void btnPopup_Click(object sender, EventArgs e)
        //{
        //    pupError.HidePopupWindow();
        //}

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            HttpFileCollection files = Request.Files;
            foreach (string fileTagName in files)
            {
                HttpPostedFile file = Request.Files[fileTagName];
                if (file.ContentLength > 0)
                {
                    // Due to the limit of the max for a int type, the largest file can be
                    // uploaded is 2147483647
                    int size = file.ContentLength;
                    string name = file.FileName;
                    string fileExn = name.Substring(name.LastIndexOf('.') + 1);
                    List<string> safeExn = new List<string> { "JPG", "PNG", "BMP", "GIF" }; //list of supported file types
                    if (safeExn.Contains(fileExn, StringComparer.OrdinalIgnoreCase)) // check if the file extension is in the allowed list
                    {
                        int position = name.LastIndexOf("\\");
                        name = name.Substring(position + 1);
                        string contentType = file.ContentType;
                        byte[] fileData = new byte[size];
                        file.InputStream.Read(fileData, 0, size);
                        string site = RadioButtonListSite.SelectedValue;
                        FileUtilities.SaveFile(name, site, contentType, size, fileData);
                    }
                    else
                    {
                        //        pupError.ShowPopupWindow();
                        lblValidator.Visible = true;
                    }
                }
                DataTable fileList = FileUtilities.GetFileList();
                gvFiles.DataSource = fileList;
                gvFiles.DataBind();
            }
        }
    }
}

