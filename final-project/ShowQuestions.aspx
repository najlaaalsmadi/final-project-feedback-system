<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowQuestions.aspx.cs" Inherits="final_project.ShowQuestions" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Questions Display</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
   <style>
    body {
        color: white;
        min-height: 100%;
        /*overflow: hidden;*/
        background: linear-gradient(rgba(21, 56, 89, 0.7), rgba(21, 56, 89, 0.7)), url('img/add.jpeg');
        background-repeat: no-repeat;
        background-size: cover;
        min-height: 100vh;
    }

    .question-card .card-header {
        background-color: #ff5f1f;
        color: white;
        font-weight: bold;
    }

    .row {
        justify-content: center;
    }

    .container {
        margin-top: 50px;
    }

    .question-card {
          border-radius: 10px;
 
    }

        .question-card .card-body {
            background-color: #fff;
        }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row mb-4">
                <div class="col-md-3">
                    <h4>Select a Technology</h4>
                    <asp:DropDownList ID="DropDownList2" runat="server" class="form-select" AutoPostBack="true" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row" id="questionsContainer" runat="server">
                <!-- هنا سيتم عرض الأسئلة -->
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
