<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pahana Billing System</title>
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
            padding: 20px 40px;
            text-align: center;
            font-size: 1.8em;
            font-weight: bold;
        }

        .container {
            max-width: 900px;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .msg {
            padding: 10px 15px;
            margin-bottom: 20px;
            border-radius: 6px;
            font-weight: bold;
        }

        .msg.success { background-color: #d4edda; color: #155724; }
        .msg.error { background-color: #f8d7da; color: #721c24; }

        h2 {
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 5px;
            margin-top: 30px;
            color: #4CAF50;
        }

        .links {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-top: 10px;
        }

        .links a {
            flex: 1 1 200px;
            text-align: center;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            transition: background-color 0.3s;
        }

        .links a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<header>Pahana Billing System</header>

<div class="container">

    <%-- Display messages --%>
    <c:if test="${not empty param.msg}">
        <div class="msg success">${param.msg}</div>
    </c:if>
    <c:if test="${not empty param.error}">
        <div class="msg error">${param.error}</div>
    </c:if>

    <h2>Customer</h2>
    <div class="links">
        <a href="addCustomer.jsp">Add Customer</a>
        <a href="listCustomers.jsp">View Customers</a>
        <a href="accountDetails.jsp">View Account Details</a>
    </div>

    <h2>Item</h2>
    <div class="links">
        <a href="addItem.jsp">Add Item</a>
        <a href="listItems.jsp">View Items</a>
    </div>

    <h2>Bill</h2>
    <div class="links">
        <a href="bill.jsp">Create Bill</a>
        <a href="listBills.jsp">View Bills</a>
    </div>

</div>

</body>
</html>
