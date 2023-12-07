package fu.siddle.thegoiamthuc.controller;

import fu.siddle.thegoiamthuc.model.Cart;
import fu.siddle.thegoiamthuc.model.Item;
import fu.siddle.thegoiamthuc.model.Order;
import fu.siddle.thegoiamthuc.model.Order_data;
import fu.siddle.thegoiamthuc.model.User;
import fu.siddle.thegoiamthuc.model.dao.OrderDAO;
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

@WebServlet(name = "paysuccessfulcontroller", urlPatterns = {"/paysuccessfulcontroller"})
public class paysuccessfulcontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();

        List<User> lisU = (List<User>) session.getAttribute("listuserlogin");

        Cart cart = null;

        Object o = session.getAttribute("cart");

        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }

        List<Item> listI = cart.getItems();

        int total = 0;
        for (Item t : listI) {
            total += (t.getPrice() * t.getQuantity());
        }

        OrderDAO.getInstance().insert(new Order(lisU.get(0).getId(), total, "Vnpay", "done"));

        List<Order> lastOrder = OrderDAO.getInstance().getLast();

        int lastId = lastOrder.get(0).getId();

        for (Item t : listI) {
            Order_dataDAO.getInstance().insert(new Order_data(lastId, t.getFooditem().getId(), t.getQuantity()));
        }

        session.removeAttribute("size");
        session.removeAttribute("cart");

        RequestDispatcher rd = request.getRequestDispatcher("views/web/paysuccessful.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
