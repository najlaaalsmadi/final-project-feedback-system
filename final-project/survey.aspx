<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="survey.aspx.cs" Inherits="final_project.survey" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Survey Details</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .form-header {
            background-color: #f8f9fa;
            padding: 30px 15px;
            border-bottom: 1px solid #e9ecef;
            margin-bottom: 20px;
        }
        .form-container {
            max-width: 600px;
            margin: auto;
            padding: 15px;
            border: 1px solid #e9ecef;
            border-radius: 5px;
            margin-bottom: 15px;
        }
        .form-title {
            margin-bottom: 0;
        }
        .custom-text-color {
            color: #f5a732; /* Set the text color to #f5a732 (orange-yellow) /
            / You can add additional styles here if needed */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="text-center">
                <h1 class="form-title">Survey Details</h1>
                <!-- Add a button for downloading the PDF -->
            </div>
            <div class="form-header">
                <!-- Your form content goes here -->
                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            </div>
        </div>

    </form>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>