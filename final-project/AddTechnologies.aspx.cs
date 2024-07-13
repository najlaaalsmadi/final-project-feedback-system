using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final_project
{
    public partial class AddTechnologies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ButtonAddTechnology_Click(object sender, EventArgs e)
        {
            string techFilePath = Server.MapPath("technologies.txt");

            try
            {
                // Create directory if it doesn't exist
                string directoryPath = Path.GetDirectoryName(techFilePath);
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                // Create the file if it doesn't exist
                if (!File.Exists(techFilePath))
                {
                    using (StreamWriter writer = File.CreateText(techFilePath)) { }
                }

                // Collect text from the textboxes and dropdown
                string name = TextBoxName.Text;
                string description = TextBoxDescription.Text;
                string level = DropDownListLevel.SelectedValue;

                // Create a new line with the collected data
                string newLine = $"{name}, {description}, {level}";

                // Check if the new line already exists in the file
                bool exists = false;
                string[] lines = File.ReadAllLines(techFilePath);
                foreach (string line in lines)
                {
                    if (line == newLine)
                    {
                        exists = true;
                        break;
                    }
                }

                if (exists)
                {
                    // Display error message if the course already exists
                    errorMsg.Text = "This course already exists";
                }
                else
                {
                    // Append the new line to the file if it doesn't exist
                    using (StreamWriter writer = new StreamWriter(techFilePath, true))
                    {
                        writer.WriteLine(newLine);
                        errorMsg.Text = "";
                    }

                    // Optionally, clear the textboxes and dropdown
                    TextBoxName.Text = string.Empty;
                    TextBoxDescription.Text = string.Empty;
                    DropDownListLevel.SelectedIndex = 0;
                }
            }
            catch (Exception ex)
            {
                // Handle the error (display message, log it, etc.)
                errorMsg.Text = "Error writing to the tech file: " + ex.Message;
            }
        }

        protected void ButtonShowTechnology_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShowTechnologies.aspx");
        }
    }
}