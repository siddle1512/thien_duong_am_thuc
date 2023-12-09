package fu.siddle.thegoiamthuc.controller.Admin;

import fu.siddle.thegoiamthuc.model.Category;
import fu.siddle.thegoiamthuc.model.Fooditem;
import fu.siddle.thegoiamthuc.model.dao.CategoryDAO;
import fu.siddle.thegoiamthuc.model.dao.FooditemDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "adupdatecontroller", urlPatterns = {"/adupdatecontroller"})
public class adupdatecontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String id = request.getParameter("query");

        HttpSession session = request.getSession();

        List<Fooditem> listf = FooditemDAO.getInstance().getFid(id);
        session.setAttribute("listff", listf);

        List<Category> listC = CategoryDAO.getInstance().getAll();
        session.setAttribute("listC", listC);

        RequestDispatcher rd = request.getRequestDispatcher("/views/dashboard/adupdate.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        HttpSession session = request.getSession();

        String name = request.getParameter("name");
        String category_id = request.getParameter("category_id");
        String price = request.getParameter("price");
        String image = request.getParameter("image");

        int cate = Integer.parseInt(category_id);
        int pr = Integer.parseInt(price);

        List<Fooditem> list = (List<Fooditem>) session.getAttribute("listff");

        Fooditem f = list.get(0);

        Fooditem ff = new Fooditem(f.getId(), name, cate, pr, image);

        FooditemDAO.getInstance().update(ff);

        response.sendRedirect("./adlistfooditemcontroller");
    }

}
