<%@ Page Language="C#" AutoEventWireup="true" Codebehind="Admin.aspx.cs" Inherits="Admin" MasterPageFile="~/Site.Master"%>
<asp:Content id="myContent" runat="server" ContentPlaceholderId="ContentPlaceHolder1">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"/>

            <h1>Administration</h1>

            <div class="block_wrapper">

                <a href="User_Access_Admin.aspx" class="block_grey_large" title="User Access Administration">User Access <br /> Administration</a>
                <a href="Page_Audit_Trail.aspx" class="block_grey_large" title="Page Audit Trail">Page Audit <br /> Trail</a>
                <a href="Query_Audit_Trail.aspx" class="block_grey_large" title="Query Audit Trail">Query Audit <br /> Trail</a>
                <a href="Active_Users.aspx" class="block_grey_large" title="Active users">Active <br /> Users</a>
                <a href="~/elmah.axd" runat="server" class="block_grey_large" title="ELMAH Error Log">ELMAH <br /> Error Log</a>

           </div>

      </form>
</body>
</html>
</asp:Content>
