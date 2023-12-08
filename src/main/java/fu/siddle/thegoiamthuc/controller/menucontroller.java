package fu.siddle.thegoiamthuc.controller;

import fu.siddle.thegoiamthuc.model.Cart;
import fu.siddle.thegoiamthuc.model.Category;
import fu.siddle.thegoiamthuc.model.Fooditem;
import fu.siddle.thegoiamthuc.model.Item;
import fu.siddle.thegoiamthuc.model.Order;
import fu.siddle.thegoiamthuc.model.dao.CategoryDAO;
import fu.siddle.thegoiamthuc.model.dao.FooditemDAO;
import fu.siddle.thegoiamthuc.model.dao.OrderDAO;
import fu.siddle.thegoiamthuc.service.Email;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "menucontroller", urlPatterns = {"/menucontroller"})
public class menucontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");       

        String id = "1";
        List<Fooditem> listF = FooditemDAO.getInstance().getFoodoffset(id);

        HttpSession session = request.getSession();

        session.setAttribute("listfood", listF);

        String a = "menu";
        session.setAttribute("active", a);

        List<Category> listC = CategoryDAO.getInstance().getAll();
        session.setAttribute("listcate", listC);

        int countP = FooditemDAO.getInstance().getCountfood();

        int endPage = countP / 6;
        if (countP % 6 != 0) {
            endPage++;
        }

        session.setAttribute("endPage", endPage);

        RequestDispatcher rd = request.getRequestDispatcher("views/web/menu.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
