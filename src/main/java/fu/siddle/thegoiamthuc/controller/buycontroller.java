package fu.siddle.thegoiamthuc.controller;

import fu.siddle.thegoiamthuc.model.Cart;
import fu.siddle.thegoiamthuc.model.Fooditem;
import fu.siddle.thegoiamthuc.model.Item;
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

@WebServlet(name = "buycontroller", urlPatterns = {"/buycontroller"})
public class buycontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String num_request = request.getParameter("num");
        String id_request = request.getParameter("id");

        //System.out.println(num + id);
        HttpSession session = request.getSession();

        Cart cart = null;

        Object o = session.getAttribute("cart");

        //co r
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }

        int num, id;
        try {
            num = Integer.parseInt(num_request);
            id = Integer.parseInt(id_request);
            //handle input

            if (num < 0) {
                num = 1;
            }

            List<Fooditem> l = FooditemDAO.getInstance().getFid(id_request);
            Fooditem f = l.get(0);

            Item t = new Item(f, num, f.getPrice());

            cart.addItem(t);

        } catch (Exception e) {

        }

        List<Item> list = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());

        System.out.println(list.get(0).getFooditem().getPrice());

        response.sendRedirect("./menucontroller");

    }

}
