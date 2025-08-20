<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Bill</title>
    <style>
        /* Reset some default styles */
        * { box-sizing: border-box; margin: 0; padding: 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }

        body {
            background: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 450px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
            font-weight: 600;
            color: #555;
        }

        input[type="number"] {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        input[type="number"]:focus {
            border-color: #4CAF50;
            outline: none;
        }

        input[type="submit"] {
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .msg, .error {
            text-align: center;
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 5px;
        }

        .msg { background: #e6f7e6; color: #2d662d; }
        .error { background: #fdecea; color: #a33a3a; }

        a {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #4CAF50;
            text-decoration: none;
            font-weight: 500;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Create Bill</h2>

        <%
            String msg = request.getParameter("msg");
            String error = request.getParameter("error");
            if (msg != null) { %>
                <div class="msg"><%= msg %></div>
        <% } else if (error != null) { %>
                <div class="error"><%= error %></div>
        <% } %>

        <form action="bill" method="post">
            <label for="accountNo">Customer Account No:</label>
            <input type="number" name="accountNo" id="accountNo" placeholder="Enter account number" required />
            <input type="submit" value="Generate Bill" />
        </form>

        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>

