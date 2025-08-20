<%@ page import="java.util.*, dao.CustomerDAO, model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer List</title>
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
            max-width: 900px;
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
            text-align: center;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
            margin: 0 5px;
        }

        a:hover {
            text-decoration: underline;
        }

        input[type="submit"] {
            padding: 6px 12px;
            border-radius: 6px;
            border: none;
            background-color: #f44336;
            color: white;
            cursor: pointer;
            font-weight: bold;
            margin: 0 5px;
        }

        input[type="submit"]:hover {
            background-color: #d32f2f;
        }

        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 5px;
        }
    </style>
</head>
<body>
<header>Customer List</header>

<div class="container">
    <table>
        <tr>
            <th>Account No</th>
            <th>Name</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Units</th>
            <th>Actions</th>
        </tr>
        <%
            try {
                String dataPath = "C:\\Users\\ashen\\eclipse-workspace\\PahanaBillingSystem\\data";
                CustomerDAO dao = new CustomerDAO(dataPath);
                List<Customer> customers = dao.getAllCustomers();

                for(Customer c : customers){
        %>
        <tr>
            <td><%= c.getAccountNo() %></td>
            <td><%= c.getName() %></td>
            <td><%= c.getAddress() %></td>
            <td><%= c.getPhone() %></td>
            <td><%= c.getUnits() %></td>
            <td class="action-buttons">
                <a href="customer?action=editForm&accountNo=<%=c.getAccountNo()%>">Edit</a>
                <form method="post" action="customer" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="accountNo" value="<%=c.getAccountNo()%>">
                    <input type="submit" value="Delete" onclick="return confirm('Are you sure?');">
                </form>
            </td>
        </tr>
        <%
                }
            } catch(Exception e) {
                out.println("<tr><td colspan='6'>Error loading customers: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>
</div>
</body>
</html>
