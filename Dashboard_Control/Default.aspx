<%@ Page Language="C#" AutoEventWireup="true" Inherits="Default" MasterPageFile="~/Site.Master" Codebehind="Default.aspx.cs" %>
<asp:Content id="myContent" runat="server" ContentPlaceholderId="ContentPlaceHolder1">
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"/>
        <h1>ISL Support</h1>

<div class="block_wrapper">

    <a href="Innova_Dashboard/Innova_Dashboard.aspx" class="block_home_left" title="Innova Dashboards">Dashboard<br /><span class="block_home_fresh">Update</span></a>
    <a href="Common/Help.aspx" class="block_home_help" title="Help">WEBSITE<br /><span class="block_home_help_fresh">Help</span></a>

</div>
    
</form>
</body>
</html>
</asp:Content>
