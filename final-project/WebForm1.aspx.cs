using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final_project
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private string studentCoursesDirectory = @"C:\project-csharp-feedback-system-main\project04\final-project\files\Courses\";
        private string feedbackDirectory = @"C:\project-csharp-feedback-system-main\project04\final-project\files\Feedback\";
        private string questionsDirectoryPath = @"C:\project-csharp-feedback-system-main\project04\final-project\QuestionsPerTechnology\";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCourses();
                UsernameLabel.Text = Session["Name"]?.ToString() ?? "Guest";
            }
        }

        private void LoadCourses()
        {
            var email = Session["email"]?.ToString();
            if (string.IsNullOrEmpty(email))
            {
                CourseDropDownList.Items.Add("No courses available");
                return;
            }

            var studentFiles = Directory.GetFiles(studentCoursesDirectory, "*student.txt");
            var courses = new List<string>();
            var completedCourses = new HashSet<string>();

            // قراءة المواد التي تم تقييمها
            var feedbackFiles = Directory.GetFiles(feedbackDirectory, "*.txt");
            foreach (var feedbackFile in feedbackFiles)
            {
                var fileName = Path.GetFileName(feedbackFile);
                var courseName = fileName.Substring(fileName.IndexOf('_') + 1).Replace(".txt", "");
                var studentName = fileName.Substring(0, fileName.IndexOf('_'));
                completedCourses.Add($"{studentName}_{courseName}");
            }

            foreach (var file in studentFiles)
            {
                var lines = File.ReadAllLines(file);
                if (lines.Any(line => line.Contains(email)))
                {
                    var course = Path.GetFileNameWithoutExtension(file).Replace("Student", "");
                    var studentName = lines.FirstOrDefault(line => line.Contains(email))?.Split(',')[1]; // استخرج اسم الطالب

                    // تحقق من عدم وجود تقييم سابق
                    if (!completedCourses.Contains($"{studentName}_{course}"))
                    {
                        courses.Add(course);
                    }
                }
            }

            if (courses.Any())
            {
                CourseDropDownList.Items.Clear();
                CourseDropDownList.Items.Add(new ListItem("Choose Course", ""));
                foreach (var course in courses)
                {
                    CourseDropDownList.Items.Add(new ListItem(course, course));
                }
            }
            else
            {
                CourseDropDownList.Items.Clear();
                CourseDropDownList.Items.Add("No courses available");
            }
        }

        protected void CourseDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            var selectedCourse = CourseDropDownList.SelectedValue;
            if (!string.IsNullOrEmpty(selectedCourse) && selectedCourse != "Choose Course")
            {
                LoadQuestions(selectedCourse);
            }
            else
            {
                QuestionsPanel.Visible = false;
            }
        }

        private void LoadQuestions(string course)
        {
            var questionsFilePath = Path.Combine(questionsDirectoryPath, $"{course}.txt");
            if (File.Exists(questionsFilePath))
            {
                var questions = File.ReadAllLines(questionsFilePath).Select(q => new Question { QuestionText = q }).ToList();
                QuestionsRepeater.DataSource = questions;
                QuestionsRepeater.DataBind();
                QuestionsPanel.Visible = true;
            }
            else
            {
                QuestionsPanel.Visible = false;
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            var selectedCourse = CourseDropDownList.SelectedValue;
            var studentName = Session["Name"]?.ToString() ?? "Unknown";
            var feedbackFilePath = Path.Combine(feedbackDirectory, $"{studentName}_{selectedCourse}.txt");

            if (!Directory.Exists(feedbackDirectory))
            {
                Directory.CreateDirectory(feedbackDirectory);
            }

            // التأكد من أن الملف موجود، وإذا لم يكن موجودًا يتم إنشاؤه
            if (!File.Exists(feedbackFilePath))
            {
                using (var writer = new StreamWriter(feedbackFilePath, false)) // false لإنشاء ملف جديد
                {
                    writer.WriteLine($"Feedback by {studentName} for {selectedCourse}");
                }
            }

            using (var writer = new StreamWriter(feedbackFilePath, true)) // true للإضافة إلى الملف
            {
                foreach (RepeaterItem item in QuestionsRepeater.Items)
                {
                    var questionLabel = item.FindControl("QuestionLabel") as Label;
                    var answerList = item.FindControl("AnswerRadioButtonList") as RadioButtonList;

                    if (questionLabel != null && answerList != null && answerList.SelectedItem != null)
                    {
                        writer.WriteLine($"{questionLabel.Text}: {answerList.SelectedItem.Text}");
                    }
                }
                writer.WriteLine("-----");
            }

            // إزالة المادة من قائمة الاختيار
            CourseDropDownList.Items.Remove(selectedCourse);

            // عرض رسالة تأكيد
            Response.Write("<script>alert('Thank you for your feedback!');</script>");
            CourseDropDownList.ClearSelection();
            QuestionsPanel.Visible = false;

            // تسجيل الخروج وإعادة التوجيه إلى صفحة تسجيل الدخول
            Session.Abandon(); // إنهاء الجلسة
            Response.Redirect("Login.aspx"); // إعادة التوجيه إلى صفحة تسجيل الدخول
        }

        public class Question
        {
            public string QuestionText { get; set; }
        }
    }
}
