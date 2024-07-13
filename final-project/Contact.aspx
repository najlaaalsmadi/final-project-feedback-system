<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="final_project.Contact" %>



<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>

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
            background: #153859;
            /*min-height: 100vh;*/
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .contact-section {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            max-width: 900px;
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            margin: 0 auto; /* Center the form horizontally */
        }

        .contact-info {
            flex: 1;
            padding: 20px;
            text-align: center; /* Center the content inside */
        }

        .contact-form {
            flex: 1;
            padding: 20px;
            max-width: 500px; /* Set a maximum width */
            width: 100%; /* Ensure it takes up the full width */
        }

        ```
        .courses {
            padding: 50px 0;
        }

        .section_title h2 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        .section_subtitle {
            font-size: 18px;
            line-height: 1.8;
        }

        .course_search {
            margin-bottom: 20px;
        }

        .course_button {
            margin-top: 10px;
        }

        .card {
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .card-body {
            padding: 20px;
        }

        .card-title {
            font-size: 20px;
            font-weight: bold;
        }

        .card-text {
            font-size: 16px;
        }

        body {
            background: #153859;
            /*min-height: 100vh;*/
            display: flex;
            justify-content: center;
            align-items: center;
        }

        h2 {
            font-size: 1.5em !important;
            font-weight: 900 !important;
        }

        .contact-form .btn {
            background: #ff8a00 !important;
        }

        .contact-section {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            max-width: 900px;
            width: 100%;
            display: flex;
            flex-wrap: wrap;
        }

        .contact-info {
            flex: 1;
            padding: 20px;
        }

            .contact-info h2 {
                font-size: 24px;
                margin-bottom: 20px;
                font-weight: 600;
            }

            .contact-info p {
                margin-bottom: 20px;
                line-height: 1.6;
            }

            .contact-info img {
                max-width: 100%;
                border-radius: 10px;
            }

        .contact-form {
            flex: 1;
            padding: 20px;
        }

            .contact-form .form-control {
                border-radius: 5px;
                border: 1px solid #ccc;
                margin-bottom: 10px;
            }

            .contact-form .btn {
                background: #9b59b6;
                border: none;
                border-radius: 5px;
                color: #fff;
                padding: 10px 20px;
                cursor: pointer;
            }

                .contact-form .btn:hover {
                    background: #8e44ad;
                }

        @media (max-width: 768px) {
            .contact-section {
                flex-direction: column;
            }
        }

        .header {
            position: absolute;
        }

        .footer {
            margin-top: 5%;
        }
    </style>
</head>
<body>

    <!-- Header -->

    <header class="header">



        <!-- Header Content -->
        <div class="header_container">

            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="header_content d-flex flex-row align-items-center justify-content-start">
                            <div class="logo_container">
                                <a href="#">
                                    <div class="logo_content d-flex flex-row align-items-end justify-content-start">
                                        <div class="logo_img">
                                            <img src="images/logo.png" alt=""></div>
                                        <div class="logo_text">learn</div>
                                    </div>
                                </a>
                            </div>
                            <nav class="main_nav_contaner ml-auto">
                                <ul class="main_nav">
                                    <li><a href="Home.aspx">home</a></li>
                                    <li><a href="About.aspx">about us</a></li>

                                    <li><a href="Contact.aspx">contact</a></li>
                                    <li class="active"><a href="Login.aspx">Login</a></li>
                                </ul>
                            </nav>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Header Search Panel -->

        <br />
        <br />
        <br />
        <form id="form1" runat="server">
            <div class="contact-section">
                <div class="contact-info">
                    <h2>Let's talk about everything!</h2>
                    <p>Thank you for using our services. Reach out to us to make business together.</p>
                    <img src="/img/contact.jpeg" alt="Contact Image">
                </div>
                <div class="contact-form">
                    <asp:Label ID="success" runat="server" CssClass="alert alert-success" Visible="false"></asp:Label>
                    <div class="form-group">
                        <label for="name">Name</label>
                        <asp:TextBox ID="name" runat="server" CssClass="form-control" Placeholder="Your Name"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="email">Email address</label>
                        <asp:TextBox ID="email" runat="server" CssClass="form-control" Placeholder="Your Email"></asp:TextBox>
                        <asp:Label ID="emailError" runat="server" CssClass="help-block text-danger" Visible="false"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label for="subject">Subject</label>
                        <asp:TextBox ID="subject" runat="server" CssClass="form-control" Placeholder="Subject"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="message">Message</label>
                        <asp:TextBox ID="message" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" Placeholder="Your Message"></asp:TextBox>
                    </div>
                    <asp:Button ID="sendMessageButton" runat="server" Text="Send Message" CssClass="btn btn-primary" OnClick="sendMessageButton_Click" />
                </div>
            </div>
        </form>


        </form>
        	<footer class="footer">
                <div class="container">
                    <div class="row">

                        <!-- About -->
                        <div class="col-lg-4 footer_col">
                            <div class="footer_about">
                                <div class="logo_container">
                                    <a href="#">
                                        <div class="logo_content d-flex flex-row align-items-end justify-content-start">
                                            <div class="logo_img">
                                                <img src="images/logo.png" alt=""></div>
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
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                    Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                                    All rights reserved
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 footer_col">
                            <div class="footer_links">
                                <div class="footer_title">Quick menu</div>
                                <ul class="footer_list">
                                    <li><a href="index.html">Home</a></li>
                                    <li><a href="about.html">About us</a></li>
                                    <li><a href="courses.html">Courses</a></li>
                                    <li><a href="contact.html">Contact</a></li>

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
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/greensock/TweenMax.min.js"></script>
        <script src="plugins/greensock/TimelineMax.min.js"></script>
        <script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
        <script src="plugins/greensock/animation.gsap.min.js"></script>
        <script src="plugins/greensock/ScrollToPlugin.min.js"></script>
        <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="plugins/video-js/video.min.js"></script>
        <script src="plugins/video-js/Youtube.min.js"></script>
        <script src="plugins/parallax-js-master/parallax.min.js"></script>
        <script src="js/custom.js"></script>
</body>
</html>

