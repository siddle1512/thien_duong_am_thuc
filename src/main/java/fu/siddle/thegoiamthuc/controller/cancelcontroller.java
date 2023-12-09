package fu.siddle.thegoiamthuc.controller;

import fu.siddle.thegoiamthuc.model.Order;
import fu.siddle.thegoiamthuc.model.dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "cancelcontroller", urlPatterns = {"/cancelcontroller"})
public class cancelcontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String query = request.getParameter("query");
        int id = Integer.parseInt(query);
        String a = "Đã hủy";

        Order o = new Order(id, a);

        OrderDAO.getInstance().updateStatus(o);
        response.sendRedirect("./profilecontroller");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
