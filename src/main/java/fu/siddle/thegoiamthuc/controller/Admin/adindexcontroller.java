package fu.siddle.thegoiamthuc.controller.Admin;

import fu.siddle.thegoiamthuc.model.Order;
import fu.siddle.thegoiamthuc.model.User;
import fu.siddle.thegoiamthuc.model.dao.OrderDAO;
import fu.siddle.thegoiamthuc.model.dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "adindexcontroller", urlPatterns = {"/adindexcontroller"})
public class adindexcontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        HttpSession session = request.getSession();

        List<Order> listO = OrderDAO.getInstance().getAll();

        List<User> listU = UserDAO.getInstance().getAll();

        List<User> listUst = UserDAO.getInstance().getByStatus("activate");

        String a = "index";

        session.setAttribute("activead", a);
        session.setAttribute("listO", listO);
        session.setAttribute("listU", listU);
        session.setAttribute("listUst", listUst);

        RequestDispatcher rd = request.getRequestDispatcher("/views/dashboard/adindex.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
