<%@ page import="java.util.*,dao.ItemDAO,model.Item" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Item List</title>
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
            font-size: 1.6em;
            font-weight: bold;
        }

        .container {
            max-width: 800px;
            margin: 30px auto;
            padding: 20px;
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
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
        }

        th {
            background-color: #f2f2f2;
        }

        a.action-btn {
            display: inline-block;
            padding: 6px 12px;
            margin: 2px;
            border-radius: 6px;
            text-decoration: none;
            color: white;
            font-weight: bold;
        }

        a.update {
            background-color: #2196F3;
        }

        a.update:hover {
            background-color: #1976D2;
        }

        a.delete {
            background-color: #f44336;
        }

        a.delete:hover {
            background-color: #d32f2f;
        }

        .msg {
            text-align: center;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .msg.success { color: green; }
        .msg.error { color: red; }

        a.add-new {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
            color: #4CAF50;
            text-decoration: none;
        }

        a.add-new:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<header>Item List</header>

<div class="container">
    <% if (request.getParameter("msg") != null) { %>
        <p class="msg success"><%= request.getParameter("msg") %></p>
    <% } %>
    <% if (request.getParameter("error") != null) { %>
        <p class="msg error"><%= request.getParameter("error") %></p>
    <% } %>

    <%
        String projectPath = "C:\\Users\\ashen\\eclipse-workspace\\PahanaBillingSystem\\data";
        ItemDAO dao = new ItemDAO(projectPath);
        List<Item> items = dao.getAllItems();
    %>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Actions</th>
        </tr>
        <% for (Item i : items) { %>
        <tr>
            <td><%= i.getId() %></td>
            <td><%= i.getName() %></td>
            <td><%= i.getPrice() %></td>
            <td>
                <a class="action-btn update" href="updateItem.jsp?id=<%= i.getId() %>&name=<%= i.getName() %>&price=<%= i.getPrice() %>">Update</a>
                <a class="action-btn delete" href="deleteItem.jsp?id=<%= i.getId() %>" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>

    <a class="add-new" href="addItem.jsp">Add New Item</a>
</div>
</body>
</html>
