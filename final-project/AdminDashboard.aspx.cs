using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
namespace final_project
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
       
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    // Check if there is an admin logged in
                    string adminName = Session["Name"] as string;
                    if (adminName != null)
                    {
                        AdminNameLabel.InnerText = $"Welcome, {adminName}!";
                    }
                    else
                    {
                        // Redirect to login page if admin not logged in
                        Response.Redirect("Login.aspx");
                    }
                }
            }

            protected void AddCourse_Click(object sender, EventArgs e)
            {
                // Redirect to AddCourse page
                Response.Redirect("AddTechnologies.aspx");
            }

            protected void AddQuestions_Click(object sender, EventArgs e)
            {
                // Redirect to AddQuestions page
                Response.Redirect("AddQuestions.aspx");
            }

            protected void DisplayStudentsButton_Click(object sender, EventArgs e)
            {
                // Redirect to DisplayStudents page
                Response.Redirect("ShowStudentInformation.aspx");
            }

            protected void DisplayQuestionsButton_Click(object sender, EventArgs e)
            {
                // Redirect to DisplayQuestions page
                Response.Redirect("ShowQuestions.aspx");
            }

            protected void AddStudentsButton_Click(object sender, EventArgs e)
            {
                // Redirect to AddStudents page
                Response.Redirect("AddStudentInformation.aspx");
            }

            protected void ResultsPageButton_Click(object sender, EventArgs e)
            {
                // Redirect to ResultsPage page
                Response.Redirect("ShowResult.aspx");
            }

            protected void LogoutButton_Click(object sender, EventArgs e)
            {
                // Clear session and redirect to login page
                Session.Clear();
                Response.Redirect("Login.aspx");
            }
        }
    }