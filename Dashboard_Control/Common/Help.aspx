<%@ Page Language="C#" AutoEventWireup="True" Codebehind="Help.aspx.cs" Inherits="Help" MasterPageFile="~/Site.Master"%>
<asp:Content id="myContent" runat="server" ContentPlaceholderId="ContentPlaceHolder1">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#q1').click(function (event) {
                $('#a1').slideToggle(500);
            });
            $('#q2').click(function (event) {
                $('#a2').slideToggle(500);
            });
            $('#q3').click(function (event) {
                $('#a3').slideToggle(500);
            });
            $('#q4').click(function (event) {
                $('#a4').slideToggle(500);
            });
            $('#q5').click(function (event) {
                $('#a5').slideToggle(500);
            });
            $('#q6').click(function (event) {
                $('#a6').slideToggle(500);
            });
            $('#q7').click(function (event) {
                $('#a7').slideToggle(500);
            });
            $('#q8').click(function (event) {
                $('#a8').slideToggle(500);
            });
        });
    </script>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"/>

         <h1>Help</h1>

         <div class="form_block">
         <div style="width: 100%; text-align: center;"><img id="Img1" src="~/Styles/images/Help_icon.png" alt="IT Service Desk" title="IT Service Desk" runat="server" /></div>
         <br />
         Please log all IT incidents to our 24/7 Service Desk. This will help us to assist you, as quickly as possible.
         <br /> <br />
         IT Service Desk
         <br />
         <span style="font-size: 23px; font-weight: normal;">0845 611 6500</span>
         <br /><br />
         Low priority?
         <br />
         <a href="mailto:help@email.com">help@email.com</a>
         </div>
         <div style="display: inline-block; vertical-align: top;">
          
            <h2 style="text-align: left;">UPDATING A DASHBOARD</h2>
            <br />
            <h4 id="q2">How do I create an image file from PowerPoint?</h4>
            <div id="a2" class="answer">
                If you are using PowerPoint to design your dashboard slide then you can easily save your file, as an image.
                <br /><br />
                When you have finished designing, go to <strong>File</strong> and <strong>Save As</strong>
                <br /><br />
                Choose somewhere to store your file but don't press Save. Instead change the <strong>Save as type</strong> box to read <strong>JPEG File Interchange Format (*.jpg)</strong> and then <strong>Save</strong>
                <br /><br />
                <img id="Type" src="~/Styles/images/Type.png" alt="Save as JPEG" title="Save as JPEG" runat="server" />
                <br /><br />
                Once you have saved your JPEG image you can now upload it.
            </div>
            <br />
            <h4 id="q3">Can I change my image once uploaded?</h4>
            <div id="a3" class="answer">
                There is no edit feature for the files you upload. If you have made a mistake with your image then simply upload a new one, which will override whatever is currently being displayed.
            </div>

            <br /> <br /> <br /> <br />

            <h2 style="text-align: left;">GENERAL ERRORS</h2>
            <br />
            <h4 id="q4">Why am I being asked to enter a username and password?</h4>
            <div id="a4" class="answer">
                If you keep being asked to enter your username and password then you're attempting to access a part of the site that you do not have permission to do so. If you believe you should have access to a specific area then you can contact the Morrisons IT Service Desk (details on the left), who can pass on your request to be reviewed.
            </div>
        

  
       </div>



         </form>
        </body>
</html>
</asp:Content>
