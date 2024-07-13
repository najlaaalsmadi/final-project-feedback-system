using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace final_project
{
    public partial class ShowStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Bind DropDownList with technologies from addTechnology.txt
                BindDropDownList();
            }

            // Read student data and create dynamic table based on DropDownList selection
            ReadAndCreateDynamicTable();
        }

        private void BindDropDownList()
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
                        string technology = parts[0];
                        ListItem item = new ListItem(technology);

                        courseDropDownList.Items.Add(item);
                    }
                }
            }
        }

        protected void courseDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Read student data based on selected course from DropDownList
            ReadAndCreateDynamicTable();
        }

        private void ReadAndCreateDynamicTable()
        {
            // Get the selected course value
            string selectedCourse = courseDropDownList.SelectedValue;

            // Construct the file path based on the selected course
            string basePath = Server.MapPath("~/files/Courses/");
            string filePath = Path.Combine(basePath, $"{selectedCourse}Student.txt");

            if (File.Exists(filePath))
            {
                // Read all lines from the file
                string[] lines = File.ReadAllLines(filePath);

                // Create a 2D array to hold the data
                string[,] data = new string[lines.Length, 3]; // Assuming each line has 3 fields (ID, Name, Email)

                for (int i = 0; i < lines.Length; i++)
                {
                    // Split each line by comma to get individual data elements
                    string[] parts = lines[i].Split(',');

                    // Ensure the line has enough parts (ID, Name, Email)
                    if (parts.Length >= 3)
                    {
                        // Add the parts to the data array
                        data[i, 0] = parts[0]; // ID
                        data[i, 1] = parts[1]; // Name
                        data[i, 2] = parts[2]; // Email
                    }
                }

                // Call method to create dynamic table with the retrieved data
                CreateDynamicTable(data);
            }
            else
            {
                TablePlaceHolder.Controls.Clear(); // Clear any existing table
            }
        }

        private void CreateDynamicTable(string[,] data)
        {
            Table table = new Table();
            table.ID = "myTable2"; // Ensure this ID matches the one in JavaScript
            table.CssClass = "table table-bordered text-light";

            // Create table header row
            TableHeaderRow headerRow = new TableHeaderRow();
            headerRow.CssClass = "thead-dark";

            // Add table headers with sort icons
            string[] headers = { "ID", "Name", "Email", "Show Details", "Download" };
            for (int i = 0; i < headers.Length; i++)
            {
                TableHeaderCell headerCell = new TableHeaderCell();
                headerCell.Text = headers[i] + " <i class='fas fa-sort' onclick='sortTable(" + i + ")'></i>";
                headerCell.Attributes.Add("style", "cursor:pointer;");
                headerRow.Cells.Add(headerCell);
            }

            // Add header row to the table
            table.Rows.Add(headerRow);

            // Create table data rows
            for (int i = 0; i < data.GetLength(0); i++)
            {
                TableRow dataRow = new TableRow();

                for (int j = 0; j < 3; j++) // Assuming 3 columns (ID, Name, Email)
                {
                    TableCell cell = new TableCell();
                    cell.Text = data[i, j];
                    dataRow.Cells.Add(cell);
                }

                // Add Show Details link
                TableCell linkCell = new TableCell();
                HyperLink link = new HyperLink();
                link.Text = "Show Details";
                link.ForeColor = System.Drawing.ColorTranslator.FromHtml("#f5a732"); // Set the color here

                // Encode URL parameters to handle special characters
                string id = HttpUtility.UrlEncode(data[i, 0]);
                string name = HttpUtility.UrlEncode(data[i, 1]);
                string course = HttpUtility.UrlEncode(courseDropDownList.SelectedValue);

                link.NavigateUrl = $"survey.aspx?course={course}&id={id}&name={name}";
                linkCell.Controls.Add(link);
                dataRow.Cells.Add(linkCell);

                // Add Download button
                TableCell downloadCell = new TableCell();
                Button downloadButton = new Button();
                downloadButton.Text = "Download";
                downloadButton.CssClass = "btn btn-primary";
                downloadButton.Attributes.Add("onclick", $"downloadRowData('{data[i, 0]}', '{data[i, 1]}', '{data[i, 2]}')");
                downloadCell.Controls.Add(downloadButton);
                dataRow.Cells.Add(downloadCell);

                // Add data row to the table
                table.Rows.Add(dataRow);
            }

            // Clear any existing table before adding new one
            TablePlaceHolder.Controls.Clear();

            // Add the table to the page
            TablePlaceHolder.Controls.Add(table);

            // Register the script to reinitialize the table for sorting
            ScriptManager.RegisterStartupScript(this, GetType(), "reinitializeTable", "reinitializeTable();", true);
        }
    }
}
