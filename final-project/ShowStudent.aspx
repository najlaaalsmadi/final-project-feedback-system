<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowStudent.aspx.cs" Inherits="final_project.ShowStudent" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Information</title>
    <style>
        .btn-primary{
            background-color:#ff5f1f !important;
            border:none !important;
        }
        body{
            background: linear-gradient(rgba(21, 56, 89, 0.7), rgba(21, 56, 89, 0.7)), url('img/show.jpeg');
        }
        .dropdown-list-custom {
            display: inline-block;
        }

        .search-bar {
            margin-bottom: 20px;
        }

        .sortable-header {
            cursor: pointer;
        }
        h2{
            font-size:2.5em !important;         
            font-weight:700 !important;
            color:#ff5f1f !important;
        }
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>

    <script>
        function sortTable(n) {
            var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
            table = document.getElementById("myTable2");
            switching = true;
            dir = "asc";
            while (switching) {
                switching = false;
                rows = table.rows;
                for (i = 1; i < (rows.length - 1); i++) {
                    shouldSwitch = false;
                    x = rows[i].getElementsByTagName("TD")[n];
                    y = rows[i + 1].getElementsByTagName("TD")[n];
                    if (dir == "asc") {
                        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                            shouldSwitch = true;
                            break;
                        }
                    } else if (dir == "desc") {
                        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                            shouldSwitch = true;
                            break;
                        }
                    }
                }
                if (shouldSwitch) {
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    switching = true;
                    switchcount++;
                } else {
                    if (switchcount == 0 && dir == "asc") {
                        dir = "desc";
                        switching = true;
                    }
                }
            }
        }

        function myFunction() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("myTable2");
            tr = table.getElementsByTagName("tr");

            for (i = 1; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }

        function reinitializeTable() {
            document.getElementById("myInput").addEventListener("keyup", myFunction);
            myFunction();
        }
        function downloadRowData(id, name, email) {
            // Create a CSV formatted string
            const csvContent = `ID,Name,Email\n${id},${name},${email}`;

            // Create a Blob from the CSV string
            const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });

            // Create a link element
            const link = document.createElement("a");
            const url = URL.createObjectURL(blob);
            link.setAttribute("href", url);
            link.setAttribute("download", `student_${id}.csv`);

            // Append the link to the body (required for Firefox)
            document.body.appendChild(link);

            // Programmatically click the link to trigger the download
            link.click();

            // Remove the link after downloading
            document.body.removeChild(link);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <h2 class="text-center mt-5">Student Information</h2>
        <div class="container mt-5">
            <div class="row mb-3">
                <div class="col-md-6">
                    <div class="input-group">
                        <asp:DropDownList ID="courseDropDownList" runat="server" CssClass="form-control" OnSelectedIndexChanged="courseDropDownList_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                        <div class="input-group-append ml-2">
                            <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." class="form-control"/>
                        </div>
                    </div>
                </div>
            </div>

            <asp:PlaceHolder ID="TablePlaceHolder" runat="server"></asp:PlaceHolder>
        </div>
    </form>
</body>
</html>