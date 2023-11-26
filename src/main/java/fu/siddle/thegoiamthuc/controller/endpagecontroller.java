package fu.siddle.thegoiamthuc.controller;

import fu.siddle.thegoiamthuc.model.Fooditem;
import fu.siddle.thegoiamthuc.model.dao.FooditemDAO;
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

@WebServlet(name = "endpagecontroller", urlPatterns = {"/endpagecontroller"})
public class endpagecontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String i = request.getParameter("id");
        int id = Integer.parseInt(i);
        
        List<Fooditem> listF = FooditemDAO.getInstance().getFoodoffset(i);

        HttpSession session = request.getSession();
        session.setAttribute("listfood", listF);
        session.setAttribute("id", id);

        RequestDispatcher rd = request.getRequestDispatcher("views/web/menu.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
