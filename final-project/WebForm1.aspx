<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="final_project.WebForm1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Page</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
    <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
    <link href="plugins/video-js/video-js.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="styles/main_styles.css">
    <link rel="stylesheet" type="text/css" href="styles/responsive.css">
    
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .container {
            flex: 1;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #ff8a00;
            color: white;
            border-radius: 10px 10px 0 0;
        }
        .btn-custom {
            background-color: #ff8a00;
            color: white;
        }
        .btn-custom:hover {
            background-color: #ffa200;
            color: white;
        }
        .footer {
            margin-top: 5%;
        }
        h2 {
            color: white !important;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <header class="header">
        <div class="header_container">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="header_content d-flex flex-row align-items-center justify-content-start">
                            <div class="logo_container">
                                <a href="#">
                                    <div class="logo_content d-flex flex-row align-items-end justify-content-start">
                                        <div class="logo_img"><img src="images/logo.png" alt=""></div>
                                        <div class="logo_text">learn</div>
                                    </div>
                                </a>
                            </div>
                            <nav class="main_nav_container ml-auto">
                                <ul class="main_nav">
                                    <li><a href="Home.aspx">home</a></li>
                                    <li><a href="About.aspx">about us</a></li>
                                    <li><a href="Contact.aspx">contact</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <br /><br /><br /><br /><br /><br />
    <div class="container">
        <div class="card">
            <div class="card-header text-center">
                <h2>Welcome, <asp:Label ID="UsernameLabel" runat="server"></asp:Label></h2>
            </div>
            <div class="card-body">
                <form id="form1" runat="server">
                    <div class="form-group">
                        <label for="courses">Select Course:</label>
                        <asp:DropDownList ID="CourseDropDownList" runat="server" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="CourseDropDownList_SelectedIndexChanged">
                            <asp:ListItem Selected="False" Text="Choose Course" ID="selectedvalue" runat="Server"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <asp:Panel ID="QuestionsPanel" runat="server" Visible="False">
                        <asp:Repeater ID="QuestionsRepeater" runat="server">
                            <ItemTemplate>
                                <div class="form-group">
                                    <asp:Label ID="QuestionLabel" runat="server" Text='<%# Eval("QuestionText") %>' CssClass="font-weight-bold"></asp:Label>
                                    <asp:RadioButtonList ID="AnswerRadioButtonList" runat="server" CssClass="form-check">
                                        <asp:ListItem Text="Excellent" Value="Excellent" CssClass="form-check-label"></asp:ListItem>
                                        <asp:ListItem Text="Very Good" Value="Very Good" CssClass="form-check-label"></asp:ListItem>
                                        <asp:ListItem Text="Good" Value="Good" CssClass="form-check-label"></asp:ListItem>
                                        <asp:ListItem Text="Poor" Value="Poor" CssClass="form-check-label"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-custom btn-block" OnClick="SubmitButton_Click" />
                    </asp:Panel>
                </form>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 footer_col">
                    <div class="footer_about">
                        <div class="logo_container">
                            <a href="#">
                                <div class="logo_content d-flex flex-row align-items-end justify-content-start">
                                    <div class="logo_img"><img src="images/logo.png" alt=""></div>
                                    <div class="logo_text">learn</div>
                                </div>
                            </a>
                        </div>
                        <div class="footer_about_text">
                            <p>Maecenas rutrum viverra sapien sed fermentum. Morbi tempor odio eget lacus tempus pulvinar.</p>
                        </div>
                        <div class="footer_social">
                            <ul>
                                <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                        <div class="copyright">
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 footer_col">
                    <div class="footer_links">
                        <div class="footer_title">Quick menu</div>
                        <ul class="footer_list">
                            <li><a href="Home.aspx">Home</a></li>
                            <li><a href="About.aspx">About us</a></li>
                            <li><a href="Courses.aspx">Courses</a></li>
                            <li><a href="Contact.aspx">Contact</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 footer_col">
                    <div class="footer_contact">
                        <div class="footer_title">Contact Us</div>
                        <div class="footer_contact_info">
                            <div class="footer_contact_item">
                                <div class="footer_contact_title">Address:</div>
                                <div class="footer_contact_line">1481 Creekside Lane Avila Beach, CA 93424</div>
                            </div>
                            <div class="footer_contact_item">
                                <div class="footer_contact_title">Email:</div>
                                <div class="footer_contact_line">yourmail@gmail.com</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
