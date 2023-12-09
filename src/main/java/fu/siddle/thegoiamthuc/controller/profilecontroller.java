package fu.siddle.thegoiamthuc.controller;

import fu.siddle.thegoiamthuc.model.Order;
import fu.siddle.thegoiamthuc.model.Order_data;
import fu.siddle.thegoiamthuc.model.User;
import fu.siddle.thegoiamthuc.model.dao.OrderDAO;
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

@WebServlet(name = "profilecontroller", urlPatterns = {"/profilecontroller"})
public class profilecontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        HttpSession session = request.getSession();
        session.removeAttribute("active");

        List<User> listU = (List<User>) session.getAttribute("listuserlogin");
        User u = listU.get(0);

        if (listU == null) {
            response.sendRedirect("./logincontroller");
        }

        String idu = Integer.toString(u.getId());

        List<Order> listO = OrderDAO.getInstance().getById(idu);

        //Đã thanh toán
        List<Order> listPa = new ArrayList<Order>();
        for (Order ou : listO) {
            if (ou.getStatus().equalsIgnoreCase("Đã thanh toán")) {
                listPa.add(ou);
            }
        }
        //Đang xử lý
        List<Order> listPr = new ArrayList<Order>();
        for (Order ou : listO) {
            if (ou.getStatus().equalsIgnoreCase("Đang xử lý")) {
                listPr.add(ou);
            }
        }
        //Đã hủy
        List<Order> listRe = new ArrayList<Order>();
        for (Order ou : listO) {
            if (ou.getStatus().equalsIgnoreCase("Đã hủy")) {
                listRe.add(ou);
            }
        }

        session.setAttribute("listPa", listPa);
        session.setAttribute("listPr", listPr);
        session.setAttribute("listRe", listRe);

        session.setAttribute("listOu", listO);
        session.setAttribute("user", u);

        RequestDispatcher rd = request.getRequestDispatcher("views/web/profile.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
