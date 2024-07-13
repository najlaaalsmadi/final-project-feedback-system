using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace final_project
{
    public partial class survey : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve parameters from the URL
                string id = Request.QueryString["id"];
                string name = Request.QueryString["name"];
                string course = Request.QueryString["course"];

                if (!string.IsNullOrEmpty(id) && !string.IsNullOrEmpty(course))
                {
                    // Build the file path
                    string filePath = Path.Combine(Server.MapPath("~/files/Feedback"), $"{name}_{course}.txt");
                    if (File.Exists(filePath))
                    {
                        try
                        {
                            // Read the file content line by line
                            string[] fileLines = File.ReadAllLines(filePath);
                            foreach (string line in fileLines)
                            {
                                // Split the line based on question mark or period
                                string[] parts = line.Split(new char[] { '?', '.' });

                                // Now parts[0] will contain the question, and parts[1] will contain the answer
                                if (parts.Length >= 2)
                                {
                                    string question = parts[0].Trim() + "?"; // Add back the question mark if it was split
                                    string answer = parts[1].Trim();

                                    // Create a new Panel for each line
                                    Panel panel = new Panel { CssClass = "form-container" };

                                    // Create a new Label for the question
                                    Label lblQuestion = new Label
                                    {
                                        Text = question
                                    };

                                    // Create a new Label for the answer with Bootstrap class for color
                                    Label lblAnswer = new Label
                                    {
                                        Text = answer,
                                        CssClass = "form-label custom-text-color"
                                    };

                                    // Add the Labels to the Panel
                                    panel.Controls.Add(lblQuestion);
                                    panel.Controls.Add(new LiteralControl("<br />")); // Add line break
                                    panel.Controls.Add(lblAnswer);

                                    // Add the Panel to the PlaceHolder
                                    PlaceHolder1.Controls.Add(panel);
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            // Display the error message in a Label
                            Label lblError = new Label
                            {
                                Text = "An error occurred while reading the file: " + ex.Message,
                                CssClass = "form-label text-danger"
                            };
                            PlaceHolder1.Controls.Add(lblError);
                        }
                    }
                    else
                    {
                        // Display a "File not found" message in a Label
                        Label lblNotFound = new Label
                        {
                            Text = "File not found.",
                            CssClass = "form-label text-warning"
                        };
                        PlaceHolder1.Controls.Add(lblNotFound);
                    }
                }
                else
                {
                    // Display an "Invalid parameters" message in a Label
                    Label lblInvalidParams = new Label
                    {
                        Text = "Invalid parameters.",
                        CssClass = "form-label text-warning"
                    };
                    PlaceHolder1.Controls.Add(lblInvalidParams);
                }
            }
        }
    }
}
