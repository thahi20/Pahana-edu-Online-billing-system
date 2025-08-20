package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Customer;
import dao.CustomerDAO;
import java.nio.file.Paths;

@WebServlet("/customer")
public class CustomerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String projectPath = Paths.get("C:", "Users", "ashen", "eclipse-workspace", "PahanaBillingSystem", "data").toString();
            CustomerDAO dao = new CustomerDAO(projectPath);

            String action = req.getParameter("action");

            if ("add".equals(action)) {
                int accNo = Integer.parseInt(req.getParameter("accountNo"));
                String name = req.getParameter("name");
                String address = req.getParameter("address");
                String phone = req.getParameter("phone");
                int units = Integer.parseInt(req.getParameter("units"));

                Customer c = new Customer(accNo, name, address, phone, units);
                dao.addCustomer(c);
                res.sendRedirect("dashboard.jsp?msg=Customer added");

            } else if ("edit".equals(action)) {
                int accNo = Integer.parseInt(req.getParameter("accountNo"));
                String name = req.getParameter("name");
                String address = req.getParameter("address");
                String phone = req.getParameter("phone");
                int units = Integer.parseInt(req.getParameter("units"));

                Customer updated = new Customer(accNo, name, address, phone, units);
                boolean success = dao.updateCustomer(updated);

                if (success) {
                    res.sendRedirect("listCustomers.jsp?msg=Customer updated");
                } else {
                    res.sendRedirect("listCustomers.jsp?error=Update failed");
                }

            } else if ("delete".equals(action)) {
                int accNo = Integer.parseInt(req.getParameter("accountNo"));
                boolean deleted = dao.deleteCustomer(accNo);

                if (deleted) {
                    res.sendRedirect("listCustomers.jsp?msg=Customer deleted");
                } else {
                    res.sendRedirect("listCustomers.jsp?error=Delete failed");
                }
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            res.sendRedirect("dashboard.jsp?error=Invalid input format");
        } catch (IOException e) {
            e.printStackTrace();
            throw new ServletException("Failed to create data folder or file", e);
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String projectPath = Paths.get("C:", "Users", "ashen", "eclipse-workspace", "PahanaBillingSystem", "data").toString();
        CustomerDAO dao = new CustomerDAO(projectPath);

        String action = req.getParameter("action");

        if ("editForm".equals(action)) {
            int accNo = Integer.parseInt(req.getParameter("accountNo"));
            Customer c = dao.getCustomerById(accNo);

            if (c != null) {
                req.setAttribute("customer", c);
                req.getRequestDispatcher("editCustomer.jsp").forward(req, res);
            } else {
                res.sendRedirect("listCustomers.jsp?error=Customer not found");
            }
        }
    }
}
