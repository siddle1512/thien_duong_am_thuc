package fu.siddle.thegoiamthuc.controller;

import fu.siddle.thegoiamthuc.model.User;
import fu.siddle.thegoiamthuc.model.dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "updateaddresscontroller", urlPatterns = {"/updateaddresscontroller"})
public class updateaddresscontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String addr = request.getParameter("address");

        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");

        String address = addr + ", " + ward + ", " + district + ", " + city;
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");

        List<String> listaddrr = u.getAdress();

        listaddrr.add(address);

        User us = new User(u.getId(), u.getUsername(), u.getBirth_year(), u.getGender(), u.getEmail(), u.getHashed_password(), u.getAvatar_path(), listaddrr);

        UserDAO.getInstance().update(us);

        String email = (String) session.getAttribute("email");
        List<User> listuserlogin = UserDAO.getInstance().get(email);
        session.setAttribute("listuserlogin", listuserlogin);

        response.sendRedirect("./profilecontroller");
    }

}
