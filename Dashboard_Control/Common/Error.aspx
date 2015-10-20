<%@ Page Language="C#" AutoEventWireup="True" Codebehind="Error.aspx.cs" Inherits="Error" MasterPageFile="~/Site.Master"%>
<asp:Content id="myContent" runat="server" ContentPlaceholderId="ContentPlaceHolder1">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"/>

        <h1>Oops!</h1>
        
        <div class="error_block">

            <p>The page failed to load. Please try again in a few minutes.</p>

            <p>Alternatively, <a href="~/Default.aspx" runat="server"><u>return to home</u></a> if you want to try a different page.</p>

            <br /><br />

            <p><img id="Img1" src="~/Styles/images/Back.png" alt="Back" title="Back" runat="server" style="cursor: pointer;" onclick="JavaScript: window.history.back(1); return false;" /></p>
                        
            <p><a href="~/Common/Help.aspx" runat="server"><u>Help</u></a></p>

        </div>

         </form>
        </body>
</html>
</asp:Content>
