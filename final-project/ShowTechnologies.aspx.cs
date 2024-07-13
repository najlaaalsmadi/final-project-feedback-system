using System;
using System.IO;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace FeedbackSystem
{
    public partial class ShowTechnologies : Page
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
            string techFilePath = Server.MapPath("~/technologies.txt");

            if (File.Exists(techFilePath))
            {
                string[] lines = File.ReadAllLines(techFilePath);
                foreach (string line in lines)
                {
                    string[] parts = line.Split(',');

                    if (parts.Length == 3)
                    {
                        string name = parts[0].Trim();
                        string description = parts[1].Trim();
                        string level = parts[2].Trim();

                        HtmlGenericControl cardCol = new HtmlGenericControl("div");
                        cardCol.Attributes.Add("class", "col-md-4 mb-4 bigContainer");

                        HtmlGenericControl card = new HtmlGenericControl("div");
                        card.Attributes.Add("class", "card");

                        HtmlGenericControl cardBody = new HtmlGenericControl("div");
                        cardBody.Attributes.Add("class", "card-body");

                        HtmlGenericControl cardTitle = new HtmlGenericControl("h5");
                        cardTitle.Attributes.Add("class", "card-title");
                        cardTitle.InnerText = name;

                        HtmlGenericControl cardText = new HtmlGenericControl("p");
                        cardText.Attributes.Add("class", "card-text");
                        cardText.InnerText = description;

                        HtmlGenericControl cardLevel = new HtmlGenericControl("p");
                        cardLevel.Attributes.Add("class", "card-level");

                        switch (level.ToLower())
                        {
                            case "beginner":
                                card.Attributes.Add("class", "card /*bg-primary*/");
                                cardLevel.InnerText = "Level: Beginner";
                                break;
                            case "intermediate":
                                card.Attributes.Add("class", "card /*bg-success*/");
                                cardLevel.InnerText = "Level: Intermediate";
                                break;
                            case "advanced":
                                card.Attributes.Add("class", "card /*bg-danger*/");
                                cardLevel.InnerText = "Level: Advanced";
                                break;
                        }

                        cardBody.Controls.Add(cardTitle);
                        cardBody.Controls.Add(cardText);
                        cardBody.Controls.Add(cardLevel);
                        card.Controls.Add(cardBody);
                        cardCol.Controls.Add(card);
                        cardsContainer.Controls.Add(cardCol);
                    }
                }
            }
        }
    }
}
