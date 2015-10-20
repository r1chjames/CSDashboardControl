using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class User_Access_Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        if (!Roles.RoleExists("Dashboard Image Change"))
        {
            // Create the role
            Roles.CreateRole("Dashboard Image Change");
        }
        if (!Roles.RoleExists("Administrators"))
        {
            // Create the role
            Roles.CreateRole("Administrators");
        }

    }

        protected void PopulateRoleList(string username)
        {
            listRole.Items.Clear();
            string[] roleNames = Roles.GetAllRoles();

            foreach (string roleName in roleNames)
            {
                ListItem roleListItem = new ListItem();
                roleListItem.Text = roleName;
                roleListItem.Selected = Roles.IsUserInRole(username, roleName);
                listRole.Items.Add(roleListItem);
            }
        }
        protected void UpdateRolesFromList()
        {
            foreach (ListItem roleListItem in listRole.Items)
            {
                string roleName = roleListItem.Value;
                string userName = "morrisonsplc\\" + txtboxUser.Text;
                bool enableRole = roleListItem.Selected;

                if (enableRole && !Roles.IsUserInRole(userName, roleName))
                {
                    Roles.AddUserToRole(userName, roleName);
                }
                else if (!enableRole && Roles.IsUserInRole(userName, roleName))
                {
                    Roles.RemoveUserFromRole(userName, roleName);
                }
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string lc_varuser = "morrisonsplc\\" + txtboxUser.Text;
            PopulateRoleList(lc_varuser);
            btnUpdate.Visible = true;
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            UpdateRolesFromList();
            string lc_varuser = "morrisonsplc\\" + txtboxUser.Text;
            PopulateRoleList(lc_varuser);
            listRole.Items.Clear();
        }
        protected void TxtUserName_TextChanged(object sender, EventArgs e)
        {

        }
        protected void RoleList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }


