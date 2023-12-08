package fu.siddle.thegoiamthuc.controller;

import fu.siddle.thegoiamthuc.model.User;
import fu.siddle.thegoiamthuc.model.dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "deleteaddresscontroller", urlPatterns = {"/deleteaddresscontroller"})
public class deleteaddresscontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");

        List<String> listaddrr = u.getAdress();

        String query = request.getParameter("query");
        int index = Integer.parseInt(query);

        listaddrr.remove(index - 1);

        User us = new User(u.getId(), u.getUsername(), u.getBirth_year(), u.getGender(), u.getEmail(), u.getHashed_password(), u.getAvatar_path(), listaddrr);

        UserDAO.getInstance().update(us);

        String email = (String) session.getAttribute("email");
        List<User> listuserlogin = UserDAO.getInstance().get(email);
        session.setAttribute("listuserlogin", listuserlogin);

        response.sendRedirect("./profilecontroller");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
