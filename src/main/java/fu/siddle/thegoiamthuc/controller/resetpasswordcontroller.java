package fu.siddle.thegoiamthuc.controller;

import fu.siddle.thegoiamthuc.model.User;
import fu.siddle.thegoiamthuc.model.dao.UserDAO;
import static fu.siddle.thegoiamthuc.service.Hash.SHA256;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "resetpasswordcontroller", urlPatterns = {"/resetpasswordcontroller"})
public class resetpasswordcontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String current = request.getParameter("current");
        String newpassword = request.getParameter("confirmPassword");

        User u = (User) session.getAttribute("user");

        if (SHA256(current).equals(u.getHashed_password())) {
            User us = new User(u.getId(), u.getUsername(), u.getBirth_year(), u.getGender(), u.getEmail(), SHA256(newpassword), u.getAvatar_path(), u.getAdress());
            UserDAO.getInstance().update(us);
            session.invalidate();
            response.sendRedirect("./logincontroller");
        } else {
            response.sendRedirect("./profilecontroller");
        }
    }

}
