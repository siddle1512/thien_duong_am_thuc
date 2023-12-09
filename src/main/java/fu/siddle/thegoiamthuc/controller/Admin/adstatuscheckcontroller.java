package fu.siddle.thegoiamthuc.controller.Admin;

import fu.siddle.thegoiamthuc.model.Order;
import fu.siddle.thegoiamthuc.model.dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "adstatuscheckcontroller", urlPatterns = {"/adstatuscheckcontroller"})
public class adstatuscheckcontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        HttpSession session = request.getSession();

        List<Order> listO = OrderDAO.getInstance().getAll();
        List<Order> listOrPro = new ArrayList<Order>();

        for (Order o : listO) {
            if (o.getStatus().equalsIgnoreCase("Đang xử lý")) {
                listOrPro.add(o);
            }
        }

        session.setAttribute("listOrPro", listOrPro);

        RequestDispatcher rd = request.getRequestDispatcher("/views/dashboard/status.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
