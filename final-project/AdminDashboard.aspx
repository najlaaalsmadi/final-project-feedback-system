<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="final_project.AdminDashboard" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .sidebar a.active {
            background-color: #495057;
            font-weight: bold;
            background-image : url('C:\Users\Orange\source\repos\final-project\final-project\img\blog-1.jpg') !important;
        }

        body {
            /*background-color: red;*/
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
                        background-image : url('C:\Users\Orange\source\repos\final-project\final-project\img\blog-1.jpg') !important;

        }
        form#form1{
                width: 100%;
    position: relative;
        }
        .sidebar {
            height: 100vh;
            background-color: #1e2a38;
            color: white;
            padding-top: 20px;
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            z-index: 100;
            overflow-y: auto;
                width: 285px; /* تم تحديد العرض الثابت هنا */
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 10px;
            transition: background-color 0.3s;
        }

        .sidebar a:hover {
            background-color: #495057;
        }

        .main-content {
            margin: auto; /* هنا يتم تعيين هوامش الجانب الأيسر للإطار الرئيسي */
            overflow: hidden; /* يمنع تسرب المحتوى خارج الحدود */
        }

        iframe {
            position: absolute;
    width: 81%;
    height: 100vh;
        }

        @media (max-width: 768px) {
            .main-content {
                margin-left: 0; /* يعنلل الإطار الرئيسي بالإمتداد التلقائي */
            }

            .sidebar {
                width: 100%; /* أسنا الحفاظ على أقصى استفادة من المساحة المتاحة */
                position: static;
                height: auto;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-3 sidebar">
                    <div class="text-center mb-4">
                        <h4 id="AdminNameLabel" runat="server"></h4>
                    </div>
                    <a href="AddTechnologies.aspx" target="mainFrame">Add Course</a>
                    <a href="AddQuestions.aspx" target="mainFrame">Add Questions</a>
                    <a href="ShowStudent.aspx" target="mainFrame">Display Students</a>
                    <a href="ShowTechnologies.aspx" target="mainFrame">Display Course</a>

                    <a href="ShowQuestions.aspx" target="mainFrame">Display Questions</a>
                    <a href="AddStudent.aspx" target="mainFrame" class="active">Add Students</a> <!-- Added class="active" here -->
                    <a href="ShowResult.aspx" target="mainFrame">Results Page</a>
                    <asp:Button ID="LogoutButton" runat="server" Text="Logout" OnClick="LogoutButton_Click" CssClass="btn btn-danger w-100 mt-4" />
                </div>
                <div class="col-md-9 main-content">
                    <iframe id="mainFrame" name="mainFrame" src="AddStudent.aspx"></iframe> <!-- Set the default iframe src -->
                </div>
            </div>
        </div>
    </form>

    <!-- JavaScript for updating active class and iframe content -->
    <script>
        // Function to handle sidebar links click event
        document.addEventListener('DOMContentLoaded', function () {
            const links = document.querySelectorAll('.sidebar a');
            links.forEach(link => {
                link.addEventListener('click', function (event) {
                    event.preventDefault();
                    const targetPage = this.getAttribute('href');
                    const iframe = document.getElementById('mainFrame');
                    iframe.src = targetPage;

                    // Remove active class from all links
                    links.forEach(l => l.classList.remove('active'));
                    // Add active class to the clicked link
                    this.classList.add('active');
                });
            });
        });
    </script>
</body>
</html>
