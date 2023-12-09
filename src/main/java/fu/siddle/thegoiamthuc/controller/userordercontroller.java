package fu.siddle.thegoiamthuc.controller;

import fu.siddle.thegoiamthuc.model.Order_data;
import fu.siddle.thegoiamthuc.model.dao.Order_dataDAO;
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

@WebServlet(name = "userordercontroller", urlPatterns = {"/userordercontroller"})
public class userordercontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        HttpSession session = request.getSession();

        String id = request.getParameter("query");

        List<Order_data> listOdata = Order_dataDAO.getInstance().getID(id);

        session.setAttribute("listOdata", listOdata);

        RequestDispatcher rd = request.getRequestDispatcher("views/web/profile_1.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
