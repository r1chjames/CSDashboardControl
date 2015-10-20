<%@ Page Language="C#" AutoEventWireup="true" Codebehind="Active_Users.aspx.cs" Inherits="Active_Users" MasterPageFile="~/Site.Master"%>
<asp:Content id="myContent" runat="server" ContentPlaceholderId="ContentPlaceHolder1">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"/>

        <h1>Active Users</h1>

        <table style="width: 100%; border: 0; text-align: center;">
        <tr>
        <td style="vertical-align: top; width: 50%; text-align: center;">
        <h2>Who's online?</h2>
        <asp:GridView ID="GridView2" align="Center" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" PageSize="100" AllowSorting="True" RowStyle-HorizontalAlign="Left" AlternatingRowStyle-BackColor="#d5e4ff" GridLines="None" CssClass="add_border">
            <Columns>
                <asp:BoundField DataField="User" HeaderText="User" SortExpression="User" />
            </Columns>
            <PagerSettings Mode="NumericFirstLast" Position="Bottom" PageButtonCount="10" NextPageText=">>" PreviousPageText="<<" />
            <PagerStyle CssClass="pager-row" />
            <RowStyle CssClass="row" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Dashboard_Control %>" 
            SelectCommand="Active_Users_Detail_10mins" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        </td>
        <td style="vertical-align: top; width: 50%; text-align: center;">
        <h2>Active today</h2>
        <asp:GridView ID="GridView3" align="Center" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" PageSize="100" AllowSorting="True" RowStyle-HorizontalAlign="Left" AlternatingRowStyle-BackColor="#d5e4ff" GridLines="None" CssClass="add_border">
            <Columns>
                <asp:BoundField DataField="User" HeaderText="User" SortExpression="User" />
            </Columns>
            <PagerSettings Mode="NumericFirstLast" Position="Bottom" PageButtonCount="10" NextPageText=">>" PreviousPageText="<<" />
            <PagerStyle CssClass="pager-row" />
            <RowStyle CssClass="row" />
        </asp:GridView>        
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Dashboard_Control %>" 
            SelectCommand="Active_Users_Detail_allday" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
        </td>
        </tr>
        </table>
      </form>

</body>
</html>
</asp:Content>