<%@ page import="dao.CustomerDAO,model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Account Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f9fc;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 20px;
            font-size: 1.8em;
            font-weight: bold;
        }

        .container {
            max-width: 600px;
            margin: 30px auto;
            padding: 25px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 25px;
        }

        form {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
            gap: 10px;
        }

        input[type="number"] {
            padding: 8px;
            width: 60%;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            padding: 8px 16px;
            border: none;
            border-radius: 6px;
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            text-align: left;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        th {
            width: 40%;
            background-color: #f2f2f2;
        }

        .msg {
            text-align: center;
            color: red;
            font-weight: bold;
            margin-top: 15px;
        }

        a.back {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }

        a.back:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<header>Customer Account Details</header>

<div class="container">
    <form method="get" action="accountDetails.jsp">
        <input type="number" name="accountNo" placeholder="Enter Account No" required>
        <button type="submit">Search</button>
    </form>

<%
    String accParam = request.getParameter("accountNo");
    if (accParam != null) {
        try {
            int accNo = Integer.parseInt(accParam);
            String projectPath = "C:\\Users\\ashen\\eclipse-workspace\\PahanaBillingSystem\\data";
            CustomerDAO dao = new CustomerDAO(projectPath);
            Customer customer = dao.getCustomerById(accNo);

            if (customer != null) {
%>
                <table>
                    <tr><th>Account No</th><td><%= customer.getAccountNo() %></td></tr>
                    <tr><th>Name</th><td><%= customer.getName() %></td></tr>
                    <tr><th>Address</th><td><%= customer.getAddress() %></td></tr>
                    <tr><th>Phone</th><td><%= customer.getPhone() %></td></tr>
                    <tr><th>Units</th><td><%= customer.getUnits() %></td></tr>
                </table>
<%
            } else {
%>
                <p class="msg">No customer found with Account No <%= accNo %></p>
<%
            }
        } catch (NumberFormatException e) {
%>
            <p class="msg">Invalid account number format</p>
<%
        }
    }
%>
    <a class="back" href="dashboard.jsp">Back to Dashboard</a>
</div>
</body>
</html>
