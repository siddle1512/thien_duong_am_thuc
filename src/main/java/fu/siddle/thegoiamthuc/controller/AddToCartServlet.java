package fu.siddle.thegoiamthuc.controller;

import fu.siddle.thegoiamthuc.model.Cart;
import fu.siddle.thegoiamthuc.model.Fooditem;
import fu.siddle.thegoiamthuc.model.dao.FooditemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AddToCartServlet", urlPatterns = {"/AddToCartServlet"})
public class AddToCartServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String num = request.getParameter("num");

        // lay fooditem bang id
        List<Fooditem> listf = FooditemDAO.getInstance().getFid(id);
        
        Cookie[] arr = request.getCookies();
        String txt = "";

        //????
        if (arr != null) {
            for (Cookie c : arr) {
                if (c.getName().equals("cart")) {
                    txt += c.getValue();
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
            }
        }

        //chenh ro hang co fooditem chua
        if (txt.isEmpty()) {
            txt = id + ":" + num;
        } else {
            txt = txt + "," + id + ":" + num;
        }
        
        //add cookie vao trinh duyet
        Cookie newc = new Cookie("cart", txt);
        newc.setMaxAge(3600);
        response.addCookie(newc);
        
    }
    
}
