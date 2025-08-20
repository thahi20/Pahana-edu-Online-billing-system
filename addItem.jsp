<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Item</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f9fc;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #2196F3;
            color: white;
            text-align: center;
            padding: 20px;
            font-size: 1.6em;
            font-weight: bold;
        }

        .container {
            max-width: 400px;
            margin: 30px auto;
            padding: 25px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #2196F3;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 12px;
            margin-bottom: 4px;
            font-weight: bold;
        }

        input[type="text"], input[type="number"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            margin-top: 20px;
            padding: 10px;
            background-color: #2196F3;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background-color: #1976D2;
        }

        .error {
            text-align: center;
            color: red;
            margin-bottom: 15px;
        }

        a.back {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #2196F3;
            font-weight: bold;
            text-decoration: none;
        }

        a.back:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<header>Add New Item</header>

<div class="container">
    <% if (request.getParameter("error") != null) { %>
        <p class="error">Invalid input. Please try again.</p>
    <% } %>

    <form action="item" method="post">
        <input type="hidden" name="action" value="add">
        
        <label for="id">ID:</label>
        <input type="number" id="id" name="id" required>
        
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        
        <label for="price">Price:</label>
        <input type="number" id="price" step="0.01" name="price" required>
        
        <button type="submit">Add Item</button>
    </form>

    <a class="back" href="listItems.jsp">View Items</a>
</div>
</body>
</html>
