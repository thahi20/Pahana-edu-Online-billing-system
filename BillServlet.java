package controller;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Customer;
import model.Bill;
import dao.CustomerDAO;
import dao.BillDAO;

@WebServlet("/bill")
public class BillServlet extends HttpServlet {

    // Handle GET request (optional: view bill details)
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.sendRedirect("listBills.jsp"); // or show bills list
    }

    // Handle POST request (create bill)
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String projectPath = Paths.get("C:", "Users", "ashen", "eclipse-workspace", "PahanaBillingSystem", "data").toString();

            int accNo = Integer.parseInt(req.getParameter("accountNo"));
            CustomerDAO customerDAO = new CustomerDAO(projectPath);
            Customer c = customerDAO.getCustomerById(accNo);

            if(c != null) {
                double rate = 50.0; // per unit rate
                double total = c.getUnits() * rate;

                // Save bill record
                BillDAO billDAO = new BillDAO(projectPath);
                int billId = (int)(System.currentTimeMillis() % 100000); // simple unique id
                Bill bill = new Bill(billId, accNo, total);
                billDAO.addBill(bill);

                req.setAttribute("customer", c);
                req.setAttribute("bill", bill);
                req.getRequestDispatcher("bill.jsp").forward(req, res);
            } else {
                res.sendRedirect("addBill.jsp?error=Invalid+Account+Number");
            }

        } catch(NumberFormatException e) {
            res.sendRedirect("addBill.jsp?error=Invalid+Account+Number");
        } catch(Exception e) {
            e.printStackTrace();
            res.sendRedirect("addBill.jsp?error=Unable+to+create+bill");
        }
    }
}

