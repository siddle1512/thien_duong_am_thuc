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

@WebServlet(name = "categorycontroller", urlPatterns = {"/categorycontroller"})
public class categorycontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String cid = request.getParameter("id");
        String n = "1";

        List<Fooditem> listF = FooditemDAO.getInstance().getFoodoffsetIdCid(cid, n);

        List<Fooditem> listFs = FooditemDAO.getInstance().getID(cid);

        HttpSession session = request.getSession();

        int countP = listFs.size();

        int endPage = countP / 6;
        if (countP % 6 != 0) {
            endPage++;
        }

        session.setAttribute("endPage", endPage);

        session.setAttribute("cid", cid);
        session.setAttribute("listfood", listF);

        RequestDispatcher rd = request.getRequestDispatcher("views/web/menu_1.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
