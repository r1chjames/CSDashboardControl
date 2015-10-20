
<%@ Page Language="C#" AutoEventWireup="true" Codebehind="User_Access_Enq.aspx.cs" Inherits="User_Access_Enq" MasterPageFile="~/Site.Master"%>
<asp:Content id="myContent" runat="server" ContentPlaceholderId="ContentPlaceHolder1">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"/>

        <h1>User Access Enquiry</h1>

        <hr />   

        <div class="form_block"> 
        Username
        <br />
        <asp:TextBox ID="txtboxUser" runat="server" ontextchanged="TxtUserName_TextChanged" /></asp:TextBox>
        <br />
        <asp:Button ID="btnSearch" runat="server" Text="Search" onclick="btnSearch_Click" class="submit_button" />
        <br />
        </div>

        <div style="display: inline-block; width: 200px; vertical-align: top;">
        <asp:BulletedList ID="listRole" runat="server" onselectedindexchanged="RoleList_SelectedIndexChanged" />



        <asp:BulletedList ID="listUser" runat="server" onselectedindexchanged="RoleList_SelectedIndexChanged" />
        </div>

      </form>
    </body>
</html>
</asp:Content>
