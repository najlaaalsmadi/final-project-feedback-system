using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final_project
{
    public partial class addStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCheckBoxList();
            }
        }

        private void BindCheckBoxList()
        {
            string filePath = Server.MapPath("~/technologies.txt");

            if (File.Exists(filePath))
            {
                string[] lines = File.ReadAllLines(filePath);

                foreach (string line in lines)
                {
                    string[] parts = line.Split(',');

                    if (parts.Length == 3)
                    {
                        checkBoxListCourses.Items.Add(new ListItem(parts[0]));
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string basePath = Server.MapPath("~/files/Courses/");

            string id = studentId.Text;
            string name = studentName.Text;
            string email = studentEmail.Text;
            bool studentAdded = false;

            foreach (ListItem item in checkBoxListCourses.Items)
            {
                if (item.Selected)
                {
                    string course = item.Text;
                    string filePath = Path.Combine(basePath, $"{course}Student.txt");

                    bool emailOrIdExists = false;

                    if (File.Exists(filePath))
                    {
                        // Check if the email or ID already exists in the file
                        var lines = File.ReadAllLines(filePath);
                        foreach (var line in lines)
                        {
                            var parts = line.Split(',');
                            if ((parts.Length > 0 && parts[0].Trim() == id) ||
                                (parts.Length > 2 && parts[2].Trim() == email))
                            {
                                emailOrIdExists = true;
                                break;
                            }
                        }
                    }

                    if (!emailOrIdExists)
                    {
                        using (StreamWriter w = File.AppendText(filePath))
                        {
                            w.WriteLine($"{id},{name},{email}");
                        }
                        studentAdded = true; // Set flag indicating student was added
                        //break; // Exit loop once added to one course
                    }
                }
            }

            if (studentAdded)
            {
                // Clear the form fields
                studentName.Text = "";
                studentEmail.Text = "";
                studentId.Text = "";

                // Clear the selected items in the CheckBoxList
                foreach (ListItem item in checkBoxListCourses.Items)
                {
                    item.Selected = false;
                }

                // Show success message
                lblMessage.Text = "Successful student addition";
            }
            else
            {
                lblMessage.Text = "Error: Unable to add student. The email or ID may already exist.";
            }
        }
    }
}
