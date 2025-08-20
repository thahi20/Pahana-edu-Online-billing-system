<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Bill</title>
</head>
<body>
    <h2>Create Bill</h2>
    <form action="bill" method="get">
        Customer Account No: <input type="text" name="accountNo"><br><br>
        <input type="submit" value="Generate Bill">
    </form>
    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>
