<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowTechnologies.aspx.cs" Inherits="FeedbackSystem.ShowTechnologies" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Show Technologies</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />


    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700;900&display=swap');

        *, body {
            font-family: 'Poppins', sans-serif;
            font-weight: 400;
            /*-webkit-font-smoothing: antialiased;
            text-rendering: optimizeLegibility;
            -moz-osx-font-smoothing: grayscale;*/
            /*  background-color: #152733;*/
        }

        section {
            background: linear-gradient(rgba(21, 56, 89, 0.7), rgba(21, 56, 89, 0.7)), url('img/ShowTech.png');
            background-repeat: no-repeat;
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: center; /* Horizontal centering */
            align-items: center; /* Vertical centering */
            text-align: center; /* Center text */
            color: white;
        }

            section > div {
                max-width: 600px; /* Adjust as needed */
                padding: 20px;
            }

        #form1 i {
            color: white !important;
            font-size: 7em;
            cursor: pointer;
            transition: 0.5s ease;
        }

            #form1 i:hover {
                transform: scale(1.1)
            }





        body {
            /*background-color: #152733;*/
            color: #fff;
            /* background: #17a2b8;*/
            /*background: url('Images/ShowTech.png');*/
            background-color: #152733
        }

        #mainTitle {
            font-weight: 750;
            padding: 0 !important;
            margin-bottom: 10px !important;
            font-size: 80px;
        }

        #descriptionPara {
            text-align: center;
            padding: 0;
        }

        .card {
            color: #fff;
            border-radius: 10px;
            height: 220px; /* Fixed height */
            display: flex;
            flex-direction: column;
            opacity: 0.8;
            background-color: #153859;
            transition: 1s ease;
        }

        .card:hover {
            
            opacity: 0.8;
            background-color: #15273354;
            transform:scale(1.1);
        }

        .card-body {
            padding: 20px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .card-title {
            font-size: 3em;
            text-transform: capitalize;
            font-weight: 750;
            /*color: #ff5f1f;*/
            color: white;
        }

        .card-text {
            font-size: 1.1em;
            font-weight: 500;
        }

        .card-level {
            font-size: 1em;
            font-weight: 500;
            /*color: #d2d6de;*/
            color: #ff5f1f;
        }


        @media (max-width: 426px) {
            .col-md-4 {
                flex: 0 0 100%;
                max-width: 100%;
            }
        }

        /*.bg-primary {
            background-color: #0275d8 !important;
        }

        .bg-success {
            background-color: #5cb85c !important;
        }

        .bg-danger {
            background-color: #d9534f !important;
        }*/
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <section>

            <div>
                <h1 id="mainTitle" class="text-center mb-4">Available Technologies</h1>
                <p id="descriptionPara">Here are the courses that will be available in your academy!</p>

                <a href="#sectionTwo">

                    <i class="fa-solid fa-circle-chevron-down"></i>
                </a>
            </div>
        </section>

        <div id="sectionTwo" class="container mt-5">

            <div class="row" id="cardsContainer" runat="server">
                <!-- Dynamic cards will be inserted here -->
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>