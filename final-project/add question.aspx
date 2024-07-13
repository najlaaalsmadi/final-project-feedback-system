<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add question.aspx.cs" Inherits="final_project.add_question" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dynamic DropDownList Example</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color:#d2d6de; /* لون خلفية بلون أزرق فاتح */
        }
        .container {
            width:60%;
            background-color: #ffffff; /* لون خلفية للحاوية */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.5); /* ظل للحاوية */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>Add a question</h2>
            
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Select the course:" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="form-control">
                </asp:DropDownList>
            </div>
            
            <div id="questionsContainer" runat="server" class="mt-3">
                <!-- This div will dynamically contain questions -->
            </div>
            
            <asp:Button ID="btnAddQuestion" runat="server" Text="Add Question" CssClass="btn btn-primary mt-3" OnClick="btnAddQuestion_Click" />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Questions" OnClick="btnSubmit_Click" CssClass="btn btn-success mt-3" />
            
            <asp:Label ID="lblStatus" runat="server" Text="" CssClass="text-success mt-3"></asp:Label>
        </div>
    </form>
    
    <!-- Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
