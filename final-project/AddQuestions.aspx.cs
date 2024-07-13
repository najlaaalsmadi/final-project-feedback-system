using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final_project
{
    public partial class AddQuestions : System.Web.UI.Page
    {
        private const string QuestionsViewStateKey = "Questions";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // قراءة البيانات من الملف النصي
                string filePath = Server.MapPath("~/technologies.txt");
                List<string> technologies = new List<string>();

                if (File.Exists(filePath))
                {
                    // قراءة كل الأسطر من الملف واختيار العنصر الأول من كل سطر
                    foreach (string line in File.ReadAllLines(filePath))
                    {
                        string[] parts = line.Split(',');
                        if (parts.Length > 0)
                        {
                            technologies.Add(parts[0].Trim()); // اضافة العنصر الأول من كل سطر
                        }
                    }
                }

                // أضف العناصر إلى DropDownList
                DropDownList1.DataSource = technologies;
                DropDownList1.DataBind();
            }
            else
            {
                // إعادة تحميل الأسئلة المحفوظة في ViewState
                LoadQuestionsFromViewState();
            }
        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // معالجة التغيير في تحديد القائمة المنسدلة هنا
            string selectedValue = DropDownList1.SelectedValue;
            // تنفيذ أي عملية بناءً على القيمة المختارة
        }

        protected void btnAddQuestion_Click(object sender, EventArgs e)
        {
            // إضافة سؤال جديد إلى الحاوية
            AddQuestionControl();
        }

        private void AddQuestionControl()
        {
            int questionIndex = questionsContainer.Controls.Count / 2 + 1;

            // إنشاء عناصر جديدة للسؤال
            Label lbl = new Label { Text = "Question " + questionIndex + ": ", CssClass = "form-label" };
            TextBox txt = new TextBox { ID = "Question" + questionIndex, CssClass = "form-control mb-2" };

            // إضافة العناصر إلى الحاوية
            questionsContainer.Controls.Add(lbl);
            questionsContainer.Controls.Add(txt);

            // حفظ الأسئلة في ViewState
            SaveQuestionsToViewState();
        }

        private void SaveQuestionsToViewState()
        {
            List<string> questions = new List<string>();
            foreach (Control control in questionsContainer.Controls)
            {
                if (control is TextBox txt)
                {
                    questions.Add(txt.Text);
                }
            }
            ViewState[QuestionsViewStateKey] = questions;
        }

        private void LoadQuestionsFromViewState()
        {
            if (ViewState[QuestionsViewStateKey] is List<string> questions)
            {
                foreach (string question in questions)
                {
                    AddQuestionControl();
                    if (questionsContainer.Controls[questionsContainer.Controls.Count - 1] is TextBox txt)
                    {
                        txt.Text = question;
                    }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string selectedTechnology = DropDownList1.SelectedValue;
            string directoryPath = Server.MapPath("~/QuestionsPerTechnology/");
            string filePath = Path.Combine(directoryPath, selectedTechnology + ".txt");

            try
            {
                // تأكد من وجود الدليل، وإنشاؤه إذا لم يكن موجوداً
                if (!Directory.Exists(directoryPath))
                {
                    Directory.CreateDirectory(directoryPath);
                }

                // كتابة الأسئلة إلى ملف نصي منفصل لكل تقنية مختارة
                using (StreamWriter writer = new StreamWriter(filePath, append: false))
                {
                    int questionIndex = 1;
                    foreach (Control control in questionsContainer.Controls)
                    {
                        if (control is TextBox txt && !string.IsNullOrWhiteSpace(txt.Text))
                        {
                            writer.WriteLine($"Q{questionIndex}: {txt.Text.Trim()}?");
                            questionIndex++;
                        }
                    }
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);

                //Response.Write("<script>alert('Questions have been sent successfully.')</script>");
                // عرض رسالة النجاح
                lblStatus.Text = "Questions have been sent successfully " + selectedTechnology;
                lblStatus.CssClass = "text-success"; // قم بتعيين أي فئة CSS لتنسيق الرسالة

                // إعادة تعيين الحقول بعد الإرسال
                foreach (Control control in questionsContainer.Controls)
                {
                    if (control is TextBox txt)
                    {
                        txt.Text = string.Empty;
                    }
                }
            }
            catch (Exception ex)
            {
                // معالجة الأخطاء وعرض رسالة الفشل
                lblStatus.Text = "فشل في إرسال الأسئلة لتقنية: " + selectedTechnology + " - " + ex.Message;
                lblStatus.CssClass = "text-danger"; // قم بتعيين أي فئة CSS لتنسيق الرسالة
            }
        }

        private void SaveQuestionsToFile()
        {
            string filePath = Server.MapPath("~/questions.txt");

            try
            {
                using (StreamWriter writer = new StreamWriter(filePath, append: false))
                {
                    foreach (Control control in questionsContainer.Controls)
                    {
                        if (control is TextBox txt)
                        {
                            writer.WriteLine(txt.Text);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // معالجة الأخطاء أو عرض رسالة للمستخدم
            }
        }
    }
}