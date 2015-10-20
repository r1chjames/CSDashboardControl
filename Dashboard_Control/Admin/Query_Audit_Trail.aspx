
<%@ Page Language="C#" AutoEventWireup="true" Codebehind="Query_Audit_Trail.aspx.cs" Inherits="Query_Audit_Trail" MasterPageFile="~/Site.Master"%>
<asp:Content id="myContent" runat="server" ContentPlaceholderId="ContentPlaceHolder1">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"/>

        <h1>Query Audit Trail</h1>

        <asp:GridView ID="GridView1" align="center" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" PageSize="100" AllowSorting="True" RowStyle-HorizontalAlign="Left" AlternatingRowStyle-BackColor="#d5e4ff" GridLines="None" CssClass="add_border">
            <Columns>
                <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                <asp:BoundField DataField="User" HeaderText="User" SortExpression="User" />
            </Columns>
                        <PagerSettings Mode="NumericFirstLast" Position="Bottom" PageButtonCount="10" NextPageText=">>" PreviousPageText="<<" />
            <PagerStyle CssClass="pager-row" />
            <RowStyle CssClass="row" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Dashboard_Control %>" 
            SelectCommand="Admin_Query_Audit_Trail" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>
      </form>

</body>
</html>
</asp:Content>
