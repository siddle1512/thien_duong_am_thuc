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

@WebServlet(name = "endpagecatecontroller", urlPatterns = {"/endpagecatecontroller"})
public class endpagecatecontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();

        String cid = (String) session.getAttribute("cid");
        String n = request.getParameter("id");

        List<Fooditem> listF = FooditemDAO.getInstance().getFoodoffsetIdCid(cid, n);

        session.setAttribute("cid", cid);
        session.setAttribute("listfood", listF);

        request.setAttribute("active", n);

        RequestDispatcher rd = request.getRequestDispatcher("views/web/menu_1.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
