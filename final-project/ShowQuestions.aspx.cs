using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
namespace final_project
{
    public partial class ShowQuestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTechnologies();
            }
        }

        private void LoadTechnologies()
        {
            string filePath = Server.MapPath("~/technologies.txt");
            List<string> technologies = new List<string>();

            if (File.Exists(filePath))
            {
                // Read all lines from the file
                string[] lines = File.ReadAllLines(filePath);

                // Iterate through each line and add the first item to technologies list
                foreach (string line in lines)
                {
                    // Split the line by comma to get individual items
                    string[] items = line.Split(',');

                    // Add the first item to technologies list
                    if (items.Length > 0)
                    {
                        technologies.Add(items[0].Trim()); // Trim to remove any leading or trailing spaces
                    }
                }
            }

            // Bind the DropDownList with the technologies list
            DropDownList2.DataSource = technologies;
            DropDownList2.DataBind();
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            // معالجة التغيير في تحديد القائمة المنسدلة
            string selectedTechnology = DropDownList2.SelectedValue;
            LoadQuestionsFromFile(selectedTechnology);
        }

        private void LoadQuestionsFromFile(string technology)
        {
            string filePath = Server.MapPath($"~/QuestionsPerTechnology/{technology}.txt");
            List<string> questions = new List<string>();

            if (File.Exists(filePath))
            {
                questions = new List<string>(File.ReadAllLines(filePath));
            }

            questionsContainer.Controls.Clear(); // Clear previous questions

            for (int i = 0; i < questions.Count; i++)
            {
                string question = questions[i];
                int questionNumber = i + 1;

                // إزالة الأجزاء مثل "q1:" من بداية السؤال
                if (question.StartsWith("q", StringComparison.OrdinalIgnoreCase) && char.IsDigit(question[1]))
                {
                    int colonIndex = question.IndexOf(':');
                    if (colonIndex != -1)
                    {
                        question = question.Substring(colonIndex + 1).Trim();
                    }
                }

                if (!string.IsNullOrWhiteSpace(question))
                {
                    // Create a div to hold the question card
                    Panel questionPanel = new Panel { CssClass = "col-md-7 question-card mb-1" };

                    // Create a Bootstrap card
                    Panel card = new Panel { CssClass = "card shadow-sm" };

                    // Create card header
                    Panel cardHeader = new Panel { CssClass = "card-header" };
                    Label headerLabel = new Label { Text = $"Question {questionNumber}" };
                    cardHeader.Controls.Add(headerLabel);

                    // Create card body
                    Panel cardBody = new Panel { CssClass = "card-body" };
                    Label lbl = new Label { Text = question, CssClass = "card-text" };
                    cardBody.Controls.Add(lbl);

                    // Add header and body to the card
                    card.Controls.Add(cardHeader);
                    card.Controls.Add(cardBody);

                    // Add the card to the question panel
                    questionPanel.Controls.Add(card);

                    // Add the question panel to the questions container
                    questionsContainer.Controls.Add(questionPanel);
                }
            }
        }
    }
}