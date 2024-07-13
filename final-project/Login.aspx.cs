using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final_project
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // No operations performed on page load event here
        }

        protected void Login_check_Click(object sender, EventArgs e)
        {
            string id = ID1.Text.Trim();
            string gmail = Gmail.Text.Trim();
            string name = Name.Text.Trim();
            if (string.IsNullOrEmpty(id) || string.IsNullOrEmpty(gmail) || string.IsNullOrEmpty(name))
            {
                SetErrorState("ID, Email, and Name fields cannot be empty.");
                return;
            }

            List<User> users = GetUsersFromDirectory(Server.MapPath("~/files/Courses/"));
            List<User> admins = GetAdminsFromDirectory(Server.MapPath("~/files/Login/Admin.txt"));

            if (IsAdmin(id, gmail, name, admins))
            {
                Session["Name"] = name;
                Session["email"] = gmail;
                Response.Redirect("AdminDashboard.aspx");
            }
            else if (IsUser(id, gmail, name, users))
            {
                User user = users.First(u => u.ID == id && u.Gmail == gmail);
                Session["Name"] = user.Name;
                Session["email"] = user.Gmail;
                Response.Redirect("WebForm1.aspx");
            }
            else
            {
                SetErrorState("Invalid ID, Email, or Name.");
            }
        }

        private List<User> GetUsersFromDirectory(string directoryPath)
        {
            var users = new List<User>();

            if (Directory.Exists(directoryPath))
            {
                string[] filePaths = Directory.GetFiles(directoryPath);
                foreach (var filePath in filePaths)
                {
                    if (File.Exists(filePath))
                    {
                        var lines = File.ReadAllLines(filePath);
                        foreach (var line in lines)
                        {
                            var parts = line.Split(',');
                            if (parts.Length == 3)
                            {
                                users.Add(new User
                                {
                                    ID = parts[0].Trim(),
                                    Name = parts[1].Trim(),
                                    Gmail = parts[2].Trim()
                                });
                            }
                        }
                    }
                }
            }

            return users;
        }

        private List<User> GetAdminsFromDirectory(string adminFilePath)
        {
            var admins = new List<User>();

            if (File.Exists(adminFilePath))
            {
                var lines = File.ReadAllLines(adminFilePath);
                foreach (var line in lines)
                {
                    var parts = line.Split(',');
                    if (parts.Length == 3)
                    {
                        admins.Add(new User
                        {
                            ID = parts[0].Trim(),
                            Name = parts[1].Trim(),
                            Gmail = parts[2].Trim()
                        });
                    }
                }
            }

            return admins;
        }

        private bool IsAdmin(string id, string gmail, string name, List<User> admins)
        {
            return admins.Any(u => u.ID == id && u.Gmail == gmail && u.Name == name);
        }

        private bool IsUser(string id, string gmail, string name, List<User> users)
        {
            return users.Any(u => u.ID == id && u.Gmail == gmail && u.Name == name);
        }

        private void SetErrorState(string errorMessage)
        {
            // ID.CssClass = "form-control is-invalid";
            // Gmail.CssClass = "form-control is-invalid";
            // Name.CssClass = "form-control is-invalid";

            // error_id.Text = errorMessage;
            // error_Gmail.Text = errorMessage;
            // error_Name.Text = errorMessage;
        }
    }

    public class User
    {
        public string ID { get; set; }
        public string Name { get; set; }
        public string Gmail { get; set; }
    }
}
