using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final_project
{
    public partial class StudentPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string name = Session["Name"] as string;
                if (!string.IsNullOrEmpty(name))
                {
                    UsernameLabel.Text = name;
                    LoadCoursesDropdown();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void LoadCoursesDropdown()
        {
            string coursesDirectoryPath = Server.MapPath("~/QuestionsPerTechnology/");
            if (Directory.Exists(coursesDirectoryPath))
            {
                string[] courseFiles = Directory.GetFiles(coursesDirectoryPath);
                foreach (string courseFile in courseFiles)
                {
                    string courseName = Path.GetFileNameWithoutExtension(courseFile);
                    CourseDropDownList.Items.Add(new ListItem(courseName, courseFile));
                }
            }
        }

        protected void CourseDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedCourseFilePath = CourseDropDownList.SelectedValue;
            if (!string.IsNullOrEmpty(selectedCourseFilePath))
            {
                List<Question> questions = LoadQuestions(selectedCourseFilePath);
                QuestionsRepeater.DataSource = questions;
                QuestionsRepeater.DataBind();

                QuestionsPanel.Visible = true;
            }
            else
            {
                QuestionsPanel.Visible = false;
            }
        }

        private List<Question> LoadQuestions(string courseFilePath)
        {
            var questions = new List<Question>();
            if (File.Exists(courseFilePath))
            {
                string[] lines = File.ReadAllLines(courseFilePath);
                foreach (string line in lines)
                {
                    // Ensure the question ends with a "?"
                    if (!line.Trim().EndsWith("?"))
                    {
                        line = line.Trim() + "?";
                    }
                    questions.Add(new Question { QuestionText = line });
                }
            }
            return questions;
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string username = Session["Name"].ToString().ToLower();
            string courseName = Path.GetFileNameWithoutExtension(CourseDropDownList.SelectedItem.Text);
            string formattedCourseName = string.Concat(courseName.Where(c => !Path.GetInvalidFileNameChars().Contains(c)));
            string feedbackPath = Server.MapPath($"~/files/Feedback/{username}_{formattedCourseName}.txt");

            using (StreamWriter writer = new StreamWriter(feedbackPath, false))
            {
                foreach (RepeaterItem item in QuestionsRepeater.Items)
                {
                    string question = ((Label)item.FindControl("QuestionLabel")).Text;
                    RadioButtonList answerList = (RadioButtonList)item.FindControl("AnswerRadioButtonList");
                    string answer = answerList.SelectedValue;
                    writer.WriteLine($"{question} {answer}");
                }
            }

            Response.Write("<script>alert('Feedback submitted successfully.');</script>");
            CourseDropDownList.Items.Remove(CourseDropDownList.SelectedItem); // Remove the course from DropDownList
            QuestionsPanel.Visible = false; // Hide questions panel after submission
        }

        public class Question
        {
            public string QuestionText { get; set; }
        }
    }
}
