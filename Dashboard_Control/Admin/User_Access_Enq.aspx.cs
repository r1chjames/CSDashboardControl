using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class User_Access_Enq : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            listUser.Items.Clear();
            listUser.DataSource = Membership.GetAllUsers();
            listUser.DataBind();
        }
        protected void PopulateRoleList(string username)
        {
            string lc_varuser = "morrisonsplc\\" + txtboxUser.Text;
            listRole.Items.Clear();
            string[] roleNames = Roles.GetRolesForUser(lc_varuser);

            foreach (string roleName in roleNames)
            {
                ListItem roleListItem = new ListItem();
                roleListItem.Text = roleName;
                roleListItem.Selected = Roles.IsUserInRole(username, roleName);
                listRole.Items.Add(roleListItem);
            }
        }
        protected void PopulateUserList(string username)
        {
            listUser.Items.Clear();
            listUser.DataSource = Membership.GetAllUsers();
            listUser.DataBind();

            //foreach (string listUsername in listUser.ToString)
            //{
            //    ListItem ListNameItem = new ListItem();
            //    ListNameItem.Text = listUsername;
            //    ListNameItem.Selected = Roles.IsUserInRole(username, listUsername);
            //    listRole.Items.Add(ListNameItem);
            //}
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string lc_varuser = "morrisonsplc\\" + txtboxUser.Text;
            PopulateRoleList(lc_varuser);
        }
        protected void TxtUserName_TextChanged(object sender, EventArgs e)
        {

        }
        protected void RoleList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }


