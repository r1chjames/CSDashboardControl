<%@ Page Language="C#" AutoEventWireup="True" Inherits="Dashboard_Control.DBoard_Image_Admin" MasterPageFile="~/Site.Master" Codebehind="DBoard_Image_Admin.aspx.cs" %>
<asp:Content id="myContent" runat="server" ContentPlaceholderId="ContentPlaceHolder1">
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
    <%@ Register Assembly="ASP.Web.UI.PopupControl" Namespace="ASP.Web.UI.PopupControl" TagPrefix="ASPP" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<script language="javascript" type="text/javascript">
    function UploadFileNow() {
        var value = $("#FileUpload2").val();
        if (value != '')
        {
            $("#form1").submit();
        }
    };
</script>

<body>
    <form id="form1" runat="server" enctype="multipart/form-data" defaultbutton="btnUpload" defaultfocus="RadioButtonListSite">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />
        
        <h1>Image Upload</h1>

        <div class="form_block">
        <asp:RadioButtonList id="RadioButtonListSite" runat="server" RepeatDirection="Horizontal" class="radio_list">
            <asp:ListItem value="Pegasus" Selected="True">Pegasus</asp:ListItem>
            <asp:ListItem value="Lakeside">Lakeside</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        Image
        <br />
        <label class="choose">
            <asp:FileUpload ID="fileUpload" runat="server" ClientIDMode="Static" onchange="UploadFileNow()" class="upload_button" />
        </label>
        <asp:Label runat="server" ID="lblValidator" Visible="false" class="upload_error">Image format only<br />(jpg, gif, png, bmp).</asp:Label>
        <br />
        <asp:Button ID="btnUpload" Text="Upload File" runat="server" onclick="btnUpload_Click" visible="false"/>
        <br />
        Please note - only upload images in image format<br />(jpg, gif, png, bmp).
        <br /><br />    
        Dashboards should update within 60 seconds.</div>

        <asp:GridView ID="gvFiles" AutoGenerateColumns="true" runat="server" AlternatingRowStyle-BackColor="#d5e4ff" GridLines="None" CssClass="add_border" style="text-align: center;">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink target="_blank" runat="server" NavigateUrl='<%# Eval("ID", "Dboard_Image_Display.aspx?ID={0}") %>'><img runat="server" src="~/Styles/Images/Search.png" alt="Search" title="Search" /></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerSettings Mode="NumericFirstLast" Position="Bottom" PageButtonCount="10" NextPageText=">>" PreviousPageText="<<" />
            <PagerStyle CssClass="pager-row" />
            <RowStyle CssClass="row" />
        </asp:GridView>

        <div style="display: inline-block; vertical-align: top;">
        <br />
        </div>
        </form>
        </body>
</html>
</asp:Content>
