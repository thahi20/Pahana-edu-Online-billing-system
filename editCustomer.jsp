<%@ page import="model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Customer c = (Customer) request.getAttribute("customer");
    if(c == null){
        response.sendRedirect("listCustomers.jsp?error=Customer not found");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Customer</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f9fc;
            color: #333;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 1.8em;
            font-weight: bold;
        }

        .container {
            max-width: 500px;
            margin: 40px auto;
            padding: 30px;
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
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"], input[type="number"] {
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 1em;
        }

        input[type="submit"] {
            padding: 12px;
            border-radius: 8px;
            border: none;
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<header>Edit Customer</header>

<div class="container">
    <form method="post" action="customer">
        <input type="hidden" name="action" value="edit">

        <label>Account No:</label>
        <input type="number" name="accountNo" value="<%=c.getAccountNo()%>" readonly>

        <label>Name:</label>
        <input type="text" name="name" value="<%=c.getName()%>" required>

        <label>Address:</label>
        <input type="text" name="address" value="<%=c.getAddress()%>" required>

        <label>Phone:</label>
        <input type="text" name="phone" value="<%=c.getPhone()%>" required>

        <label>Units:</label>
        <input type="number" name="units" value="<%=c.getUnits()%>" required>

        <input type="submit" value="Update Customer">
    </form>

    <a class="back-link" href="listCustomers.jsp">Back to Customer List</a>
</div>
</body>
</html>
