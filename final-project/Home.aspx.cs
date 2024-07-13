using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.IO;
namespace final_project
{
    public partial class Home : System.Web.UI.Page
    {
        private object txtCourseName;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCourses();
            }
        }

        private void LoadCourses()
        {
            try
            {
                string filePath = Server.MapPath("~/technologies.txt");
                List<Course> courses = new List<Course>();

                if (File.Exists(filePath))
                {
                    string[] lines = File.ReadAllLines(filePath);
                    foreach (string line in lines)
                    {
                        string[] parts = line.Split(',');

                        if (parts.Length >= 3)
                        {
                            Course course = new Course
                            {
                                Title = parts[0],
                                Description = parts[1],
                                Level = parts[2]
                            };
                            courses.Add(course);
                        }
                    }
                }
                //else
                //{
                //    // If file not found, display error message
                //    HtmlGenericControl errorMessage = new HtmlGenericControl("div");
                //    errorMessage.Attributes["class"] = "alert alert-danger";
                //    errorMessage.InnerText = "File not found: " + filePath;
                //    coursesContainer.Controls.Add(errorMessage);
                //    return;
                //}

                // Add courses to the Panel dynamically
                foreach (var course in courses)
                {
                    AddCourseCard(course);
                }
            }
            catch (Exception ex)
            {
                // Display error message
                HtmlGenericControl errorMessage = new HtmlGenericControl("div");
                errorMessage.Attributes["class"] = "alert alert-danger";
                errorMessage.InnerText = "Error loading courses: " + ex.Message;
                coursesContainer.Controls.Add(errorMessage);
            }


            void AddCourseCard(Course course)
            {
                HtmlGenericControl divCol = new HtmlGenericControl("div");
                divCol.Attributes["class"] = "col-md-4 mb-4";

                HtmlGenericControl divCard = new HtmlGenericControl("div");
                divCard.Attributes["class"] = "card";

                HtmlGenericControl divCardBody = new HtmlGenericControl("div");
                divCardBody.Attributes["class"] = "card-body";

                HtmlGenericControl h5Title = new HtmlGenericControl("h5");
                h5Title.Attributes["class"] = "card-title";
                h5Title.InnerText = course.Title;

                HtmlGenericControl pDescription = new HtmlGenericControl("p");
                pDescription.Attributes["class"] = "card-text";
                pDescription.InnerText = course.Description;

                HtmlGenericControl pLevel = new HtmlGenericControl("p");
                pLevel.Attributes["class"] = "card-text";
                pLevel.InnerText = "Level: " + course.Level;

                HtmlAnchor aEnroll = new HtmlAnchor();
                aEnroll.HRef = "Contact.aspx"; // Replace with actual link or function
                aEnroll.Attributes["class"] = "btn btn-warning";
                aEnroll.InnerText = "Enroll Now";

                divCardBody.Controls.Add(h5Title);
                divCardBody.Controls.Add(pDescription);
                divCardBody.Controls.Add(pLevel);
                divCardBody.Controls.Add(aEnroll);

                divCard.Controls.Add(divCardBody);
                divCol.Controls.Add(divCard);

                coursesContainer.Controls.Add(divCol);
            }
        }

        public class Course
        {
            public string Title { get; set; }
            public string Description { get; set; }
            public string Level { get; set; }
        }
    }
}