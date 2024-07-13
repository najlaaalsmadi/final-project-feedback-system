<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowResult.aspx.cs" Inherits="final_project.ShowResult" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" sizes="32x32" href="./assets/images/favicon-32x32.png">
    <title>Results Summary</title>
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com/">
    <link href="https://fonts.googleapis.com/css2?family=Handlee&family=Nunito&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="showresult.css" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: "HankenGrotesk", sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            max-width: 100vw;
            flex-direction: column;
            background: #153859;
            background-repeat: no-repeat;
            background-size: cover;
            overflow: hidden;
        }

        .listItems{
            align-content: center;
        }

        .container {
            background: #ffffff;
            width: 100%;
            display: flex;
            height: auto;
            gap: 2rem;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            padding: 20px;
            margin: 20px 0;
        }

        .dashboard {
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            padding: 20px;
        }

        .dashboard__header {
            font-size: 3rem;
            font-weight: 600;
            color: #343a40;
            margin-bottom: 20px;
            margin-top: 10px;
            padding: 20px;
        }

        .dashboard__score {
            width: 150px;
            height: 150px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            border-radius: 50%;
            background-color: whitesmoke;
            color: white;
            margin-bottom: 20px;
        }

        .score-number {
            font-size: 3rem;
            font-weight: 700;
            color: black;
        }

        .score-text {
            font-size: 1rem;
            font-weight: 400;
            color: black;
        }

        .dashboard__grade {
            display: flex;
            justify-content: space-around;
            align-items: center;
            flex-direction: column;
            text-align: center;
            width: 100%;
            height: 50vh;
            background-color: #e9ecef;
        }

        .grade-text {
            font-size: 2em;
            font-weight: 600;
            letter-spacing: 1px;
            margin-bottom: 10px;
            color: black;
            padding: 20px;
        }

        .grade-description {
            font-size: 1rem;
            font-weight: 400;
            letter-spacing: 2px;
            line-height: 1.5;
        }

        .summary {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: flex-start;
            padding: 2rem 1.5rem;
            border-radius: 15px;
        }

        .summary__header {
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 20px;
            text-align: left;
            color: #343a40;
        }

        h1 {
            margin-top: 0.5em;
            margin-bottom: 0.2em;
            font-size: 3em;
            color: white;
        }

        p {
            color: white;
            font-size: 1em;
            font-weight: 500;
            margin: 0;
            padding: 0;
        }
        #summary__category {
            display: flex;
            justify-content: space-between;
            flex-direction: column;
            width: 100%;
            height: auto;
        }

        .categoryicon {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            height: auto;
            margin-top: 1rem;
            padding: 0.5rem 10px;
            border-radius: 10px;
            background-color: #e9ecef;
        }

            .categoryicon img {
                width: 24px;
                height: 24px;
            }

        .category-text {
            font-size: 1.5rem;
            font-weight: 600;
            letter-spacing: 1px;
            color: #495057;
        }

        .score {
            font-weight: 600;
            letter-spacing: 1px;
            text-align: right;
        }

            .score h2 {
                font-size: 20px;
                font-weight: 700;
                color: #343a40;
            }

                .score h2 span {
                    font-weight: 400;
                    font-size: 17px;
                    color: #6c757d;
                }

        .summary button, .summary select {
            width: 100%;
            height: 50px;
            font-size: 1.3em;
            font-weight: 400;
            margin-top: 20px;
            border-radius: 50px;
            letter-spacing: 1.5px;
            cursor: pointer;
            border: none;
            outline: none;
            transition: background-color 0.3s ease-in-out;
            background-color: #ff5f1f ;
            color: white;
            text-align: center;
        }

       

        .summary select option {
            text-align: center;
        }

        @media screen and (max-width: 960px) {
            .container {
                width: 90%;
                max-width: 960px;
                gap: 20px;
                grid-template-columns: 1fr;
                height: auto;
                border: 25px;
                margin: 10px 0;
            }

            .summary__header {
                font-size: 1.5rem;
            }

            .dashboard {
                border-radius: 10px;
                padding: 15px;
                height: auto;
            }

            .dashboard__header {
                font-size: 1.5rem;
                font-weight: 500;
                margin-bottom: 20px;
                margin-top: 5px
            }

            .categoryicon img {
                width: 18px;
                height: 18px;
            }

            .score h2 {
                font-size: 18px;
            }

            .dashboard__score {
                width: 90px;
                height: 90px;
                margin-bottom: 20px;
            }

            .score-number {
                font-size: 1.5rem;
            }

            .summary button, .summary select {
                height: 40px;
                font-size: 1em;
                margin-top: 8px;
                border-radius: 30px;
            }

            .score-text {
                font-size: 13px;
            }

            .grade-text {
                font-size: 1.8rem;
                margin-bottom: 10px;
            }

            .category-text {
                font-size: 1rem;
            }

            .summary {
                padding: 1rem 1rem;
            }
        }
    </style>
</head>
<body>

    <h1>Feedback Results</h1>
    <p>This page displays feedback results from surveys.</p>
    <form id="form1" runat="server">
        <main class="container">
            <div class="dashboard">
                <asp:Panel ID="ResultPanel" runat="server" class="dashboard__grade">
                    <h1 class="dashboard__header">Your Result</h1>
                    <div class="dashboard__score">
                        <asp:Label ID="ResultLabel" runat="server" Text="" class="score-number"></asp:Label>
                        <p class="score-text">of 100</p>
                    </div>
                    <h2 class="grade-text" runat="server">
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label></h2>
                </asp:Panel>
            </div>
            <div class="summary">

                <div>
                    <h1 class="summary__header">Overview</h1>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="summary__button continue" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Text="Select Category" Value="" CssClass ="listItems"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Panel ID="summary__category" runat="server">
                        <!-- Add your summary categories here -->
                    </asp:Panel>

                </div>
                <button type="submit" class="summary__button">Back</button>
            </div>
        </main>
    </form>
</body>
</html>
