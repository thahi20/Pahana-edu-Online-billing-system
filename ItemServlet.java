package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Item;
import dao.ItemDAO;
import java.nio.file.Paths;

@WebServlet("/item")
public class ItemServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String projectPath = Paths.get("C:", "Users", "ashen", "eclipse-workspace", "PahanaBillingSystem", "data").toString();
            ItemDAO dao = new ItemDAO(projectPath);

            String action = req.getParameter("action");

            if ("add".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                String name = req.getParameter("name");
                double price = Double.parseDouble(req.getParameter("price"));

                Item item = new Item(id, name, price);
                dao.addItem(item);

                res.sendRedirect("listItems.jsp?msg=Item added");
            }
            else if ("update".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                String name = req.getParameter("name");
                double price = Double.parseDouble(req.getParameter("price"));

                Item updated = new Item(id, name, price);
                if (dao.updateItem(updated)) {
                    res.sendRedirect("listItems.jsp?msg=Item updated");
                } else {
                    res.sendRedirect("listItems.jsp?error=Item not found");
                }
            }
            else if ("delete".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                if (dao.deleteItem(id)) {
                    res.sendRedirect("listItems.jsp?msg=Item deleted");
                } else {
                    res.sendRedirect("listItems.jsp?error=Item not found");
                }
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            res.sendRedirect("listItems.jsp?error=Invalid input");
        }
    }
}
