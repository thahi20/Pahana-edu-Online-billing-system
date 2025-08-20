<%@ page import="java.util.*, dao.BillDAO, model.Bill" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bill List</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f9fc;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px 30px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #2196F3;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a.back {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #2196F3;
            text-decoration: none;
            font-weight: bold;
        }

        a.back:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Bill List</h2>

    <table>
        <tr>
            <th>Bill ID</th>
            <th>Account No</th>
            <th>Total</th>
        </tr>
        <%
            try {
                String dataPath = "C:\\Users\\ashen\\eclipse-workspace\\PahanaBillingSystem\\data";
                BillDAO dao = new BillDAO(dataPath);
                List<Bill> bills = dao.getAllBills();

                for(Bill b : bills){
        %>
        <tr>
            <td><%= b.getBillId() %></td>
            <td><%= b.getAccountNo() %></td>
            <td>Rs. <%= String.format("%.2f", b.getTotal()) %></td>
        </tr>
        <%
                }
            } catch(Exception e) {
        %>
        <tr>
            <td colspan="3" style="color:red;">Error loading bills: <%= e.getMessage() %></td>
        </tr>
        <%
            }
        %>
    </table>

    <a class="back" href="dashboard.jsp">Back to Dashboard</a>
</div>
</body>
</html>

