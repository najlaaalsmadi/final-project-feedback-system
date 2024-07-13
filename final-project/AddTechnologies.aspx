<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTechnologies.aspx.cs" Inherits="final_project.AddTechnologies" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700;900&display=swap');



        
        *, body {
            font-family: 'Poppins', sans-serif;
            font-weight: 400;
            -webkit-font-smoothing: antialiased;
            text-rendering: optimizeLegibility;
            -moz-osx-font-smoothing: grayscale;
          
        }

         html, body {
       height: 100%;
       overflow: hidden;
        background: linear-gradient(rgba(21, 56, 89, 0.7), rgba(21, 56, 89, 0.7)), url('img/AddTech.png');
       background-repeat: no-repeat;
       background-size: cover;
       height: 100vh;
   }

        .form-holder {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            min-height: 100vh;
        }

            .form-holder .form-content {
                position: relative;
                text-align: center;
                display: -webkit-box;
                display: -moz-box;
                display: -ms-flexbox;
                display: -webkit-flex;
                display: flex;
                -webkit-justify-content: center;
                justify-content: center;
                -webkit-align-items: center;
                align-items: center;
                padding: 60px;
            }

        .form-content .form-items {
            border: 3px solid #fff;
            padding: 40px;
            display: inline-block;
            width: 100%;
            min-width: 540px;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            text-align: left;
            -webkit-transition: all 0.4s ease;
            transition: all 0.4s ease;
        }

        .form-content h3 {
            color: #fff;
            text-align: left;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 5px;
        }

            .form-content h3.form-title {
                margin-bottom: 30px;
            }

        .form-content p {
            color: #fff;
            text-align: left;
            font-size: 17px;
            font-weight: 300;
            line-height: 20px;
            margin-bottom: 30px;
        }

        .form-content label, .was-validated .form-check-input:invalid ~ .form-check-label, .was-validated .form-check-input:valid ~ .form-check-label {
            color: #fff;
        }

        .form-content input[type=text], .form-content input[type=password], .form-content input[type=email], .form-content select {
            width: 100%;
            padding: 9px 20px;
            text-align: left;
            border: 0;
            outline: 0;
            border-radius: 6px;
            background-color: #fff;
            font-size: 15px;
            font-weight: 300;
            color: #8D8D8D;
            -webkit-transition: all 0.3s ease;
            transition: all 0.3s ease;
            margin-top: 16px;
        }

        .btn-primary {
            background-color: green;
            outline: none;
            border: 0px;
            box-shadow: none;
        }

            .btn-primary:hover, .btn-primary:focus, .btn-primary:active {
                background-color: #495056;
                outline: none !important;
                border: none !important;
                box-shadow: none;
            }

        .form-content textarea {
            position: static !important;
            width: 100%;
            padding: 8px 20px;
            border-radius: 6px;
            text-align: left;
            background-color: #fff;
            border: 0;
            font-size: 15px;
            font-weight: 300;
            color: #8D8D8D;
            outline: none;
            resize: none;
            height: 120px;
            -webkit-transition: none;
            transition: none;
            margin-bottom: 14px;
        }

        .buttonsContainer {
            display: flex;
            justify-content: space-between;
        }

        .showTechButton {
            background-color: #ff5f1f;
        }

        .form-content textarea:hover, .form-content textarea:focus {
            border: 0;
            background-color: #ebeff8;
            color: #8D8D8D;
        }

        .mv-up {
            margin-top: -9px !important;
            margin-bottom: 8px !important;
        }

        .invalid-feedback {
            color: #ff606e;
        }

        .valid-feedback {
            color: #2acc80;
        }

        .text-danger {
            font-size: 12px;
            display: inline-block;
            min-height: 20px;
        }
        .form-items {

        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="requires-validation">
        <div>
            <div class="form-body">
                <div class="row">
                    <div class="form-holder">
                        <div class="form-content">
                            <div class="form-items">
                                <h3>Add your technologies</h3>
                                <p>Fill in the data below.</p>

                                <div class="col-md-12">
                                    <asp:TextBox ID="TextBoxName" runat="server" CssClass="form-control" placeholder="Technology Name" required="true"></asp:TextBox>
                                </div>

                                <div class="col-md-12">
                                    <asp:TextBox ID="TextBoxDescription" runat="server" CssClass="form-control" placeholder="Technology Description" required="true"></asp:TextBox>
                                </div>

                                <div class="col-md-12">
                                    <asp:DropDownList ID="DropDownListLevel" runat="server" CssClass="form-select mt-3" required="true">
                                        <asp:ListItem Text="Select Level" Value="" />
                                        <asp:ListItem Text="Beginner" Value="Beginner" />
                                        <asp:ListItem Text="Intermediate" Value="Intermediate" />
                                        <asp:ListItem Text="Advanced" Value="Advanced" />
                                    </asp:DropDownList>
                                </div>


                                <asp:Panel ID="buttonsContainer" runat="server" CssClass="buttonsContainer">

                                    <div class="form-button mt-3">
                                        <asp:Button ID="ButtonAddTechnology" runat="server" CssClass="btn btn-primary" Text="Add Technology" OnClick="ButtonAddTechnology_Click" />
                                        <div class="col-md-12">
                                            <asp:Label ID="errorMsg" runat="server" CssClass="text-danger"></asp:Label>
                                        </div>

                                    </div>
                                    <div class="form-button mt-3">
                                        <button type="button" class="btn btn-primary showTechButton" onclick="window.location.href='ShowTechnologies.aspx';">Show Technology</button>
                                    </div>


                                </asp:Panel>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>