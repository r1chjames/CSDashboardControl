<%@ Page Language="C#" AutoEventWireup="true" Inherits="Innova_Dashboard" MasterPageFile="~/Site.Master" Codebehind="Innova_Dashboard.aspx.cs" %>
<asp:Content id="myContent" runat="server" ContentPlaceholderId="ContentPlaceHolder1">
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"/>
        <h1>Dashboard Update</h1>

<div class="block_wrapper">

    <a href="Image_Admin/DBoard_Image_Admin.aspx" class="block_business_left" title="Image Upload">Image<br /><span class="block_home_fresh">Upload</span></a>
    <a target="_blank" href="Image_Viewer/GY1_DBoard_Image_Viewer.aspx" class="block_business_right" title="View Pegasus">View<br /><span class="block_home_fresh">Pegasus</span></a>
    <a target="_blank" href="Image_Viewer/GY2_DBoard_Image_Viewer.aspx" class="block_business_right_2" title="View Lakeside">View<br /><span class="block_home_fresh">Lakeside</span></a>

</div>
    
</form>
</body>
</html>
</asp:Content>
