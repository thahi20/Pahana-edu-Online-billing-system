<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Item</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f9fc;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 400px;
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

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        input[type=text], input[type=number] {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            width: 100%;
            margin-top: 20px;
            padding: 10px;
            background-color: #2196F3;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1em;
            cursor: pointer;
        }

        button:hover {
            background-color: #1976D2;
        }

        a.back {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #4CAF50;
            text-decoration: none;
        }

        a.back:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Update Item</h2>

    <form action="item" method="post">
        <input type="hidden" name="action" value="update">

        <label>ID:</label>
        <input type="number" name="id" value="<%= request.getParameter("id") %>" readonly>

        <label>Name:</label>
        <input type="text" name="name" value="<%= request.getParameter("name") %>" required>

        <label>Price:</label>
        <input type="number" step="0.01" name="price" value="<%= request.getParameter("price") %>" required>

        <button type="submit">Update Item</button>
    </form>

    <a class="back" href="listItems.jsp">Back to Item List</a>
</div>
</body>
</html>
