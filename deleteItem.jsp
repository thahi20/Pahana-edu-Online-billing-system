<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Delete Item</title></head>
<body>
<h2>Delete Item</h2>

<p>Are you sure you want to delete item with ID <b><%= request.getParameter("id") %></b>?</p>

<form action="item" method="post">
    <input type="hidden" name="action" value="delete">
    <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
    <button type="submit">Yes, Delete</button>
</form>

<a href="listItems.jsp">Cancel</a>
</body>
</html>
