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

@WebServlet(name = "detailcontroller", urlPatterns = {"/detailcontroller"})
public class detailcontroller extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        //kiem tra data
        List<Fooditem> listf = FooditemDAO.getInstance().get4new();
        for (Fooditem f : listf) {
            System.out.println(f.getName());
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("listf", listf);
        
        String id = request.getParameter("id");
        List<Fooditem> listdetailf = FooditemDAO.getInstance().getFid(id);
        session.setAttribute("listdetailf", listdetailf);
        
        RequestDispatcher rd = request.getRequestDispatcher("/views/web/detail.jsp");
        rd.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    
}
