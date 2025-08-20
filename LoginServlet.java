package controller;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.UserDAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        
        String dataPath = "C:\\Users\\ashen\\eclipse-workspace\\PahanaBillingSystem\\data";

        try {
            UserDAO dao = new UserDAO(dataPath);

            if (dao.validateUser(username, password)) {
                HttpSession session = req.getSession();
                session.setAttribute("user", username); 
                res.sendRedirect("dashboard.jsp");
            } else {
                res.sendRedirect("index.jsp?error=Invalid+credentials");
            }

        } catch (IOException e) {
            e.printStackTrace();
            res.sendRedirect("index.jsp?error=Server+error");
        }
    }
}
