package fu.siddle.thegoiamthuc.controller.Admin;

import fu.siddle.thegoiamthuc.model.Fooditem;
import fu.siddle.thegoiamthuc.model.User;
import fu.siddle.thegoiamthuc.model.dao.FooditemDAO;
import fu.siddle.thegoiamthuc.model.dao.UserDAO;
import fu.siddle.thegoiamthuc.service.Email;
import fu.siddle.thegoiamthuc.service.Hash;
import jakarta.mail.Session;
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

@WebServlet(name = "adaddcontroller", urlPatterns = {"/adaddcontroller"})
public class adaddcontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("views/dashboard/adadd.jsp");
        rd.forward(request, response);
        

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");


        String name = request.getParameter("name");
        String category_id = request.getParameter("category_id");
        String price = request.getParameter("price");
        String image = request.getParameter("image");

        int cate_id = Integer.parseInt(category_id);
        int pr = Integer.parseInt(price);

        Fooditem f = new Fooditem(name, cate_id, pr, image);
        FooditemDAO.getInstance().insertFooditem(f);

        response.sendRedirect("./adlistfooditemcontroller");

    }

}
