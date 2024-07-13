<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="final_project.About" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <title>About Us</title>
    <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
    <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
    <link href="plugins/video-js/video-js.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="styles/main_styles.css">
    <link rel="stylesheet" type="text/css" href="styles/responsive.css">
    <style>
        .header {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            background-color: white; /* Ensure background color */
        }

        .about-container {
            padding: 100px 0 50px; /* Adjust padding to account for fixed header */
        }

        .section_title h2 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        .section_subtitle {
            font-size: 18px;
            line-height: 1.8;
        }

        .about-content {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .about-content img {
            max-width: 150px;
            margin-right: 20px;
        }

        .about-image {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
        }

        .team-member {
            text-align: center;
            margin-bottom: 30px;
        }

        .team-member img {
            max-width: 150px;
            border-radius: 50%;
        }

        .team-member h3 {
            font-size: 20px;
            margin-top: 10px;
        }

        .team-member p {
            font-size: 16px;
        }

        .footer {
            background-color: #f8f9fa;
            padding: 20px 0;
            text-align: center;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .images-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px;
            margin-top: 30px;
        }

        .images-container img {
            max-width: 45%;
            border-radius: 5px;
        }
        .img{
            height:400px;
            width:800px;
        }
    </style>
</head>
<body>
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
    </header>

    <form id="form1" runat="server">
        <div class="container about-container">
            <h1>About Us</h1>
            <div class="images-container">
                <img src="images/course_9.jpg" class="img" alt="Mission Image"/>
                <div>
                    <h2>Our Mission</h2>
                    <p>Our mission is to make quality education accessible to everyone, everywhere. We believe that learning should be engaging, interactive, and convenient. Our platform offers a variety of courses that cater to different learning styles and preferences.</p>
                </div>
            </div>
          <div class="images-container">
              <div>
               <h2>Our Vision</h2>
                    <p>We envision a world where education transcends geographical boundaries and is accessible to all, regardless of their location or financial status. Our aim is to empower individuals by providing them with the knowledge and skills they need to succeed in their personal and professional lives.</p>
              </div>
                             <img src="images/course_5.jpg" class="img" alt="Mission Image"/>

             </div>
            
           
            <div class="images-container">
                
            </div>
        </div>
    </form>

    <footer class="footer">
        <div class="footer_col">
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
        <div class="footer_col">
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
        <div class="footer_col">
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

