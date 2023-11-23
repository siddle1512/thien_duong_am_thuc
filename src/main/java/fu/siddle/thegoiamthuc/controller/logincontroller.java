package fu.siddle.thegoiamthuc.controller;

import fu.siddle.thegoiamthuc.model.dao.AdminDAO;
import fu.siddle.thegoiamthuc.model.Admin;
import fu.siddle.thegoiamthuc.model.User;
import fu.siddle.thegoiamthuc.model.dao.UserDAO;
import fu.siddle.thegoiamthuc.service.Hash;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "logincontroller", urlPatterns = {"/logincontroller"})
public class logincontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/views/web/login.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(true);

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        //hash password
        String hashed_password = Hash.SHA256(password);

        boolean isValidUser = checkUserLogin(email, hashed_password);
        boolean isValidAdmin = checkAdminLogin(email, password);

        if (isValidUser) {
            session.setAttribute("username", email);
            response.sendRedirect("./indexcontroller");
        } else if (isValidAdmin) {
            session.setAttribute("username", email);
            response.sendRedirect("./adindexcontroller");
        } else {
            response.sendRedirect("./logincontroller");
            String err = "Sai email hoặc mật khẩu vui lòng kiểm tra lại!";
            session.setAttribute("err", err);
        }
    }

    private boolean checkUserLogin(String email, String password) {
        User usr = new User(email, password);

        //lay data
        List<User> list = UserDAO.getInstance().getAll();

        for (User u : list) {
            if (u.getEmail().equals(usr.getEmail()) && u.getHashed_password().equals(usr.getHashed_password())) {
                return true;
            }
        }

        return false;
    }

    private boolean checkAdminLogin(String email, String password) {
        Admin ad = new Admin(email, password);

        //lay data
        List<Admin> list = AdminDAO.getInstance().getAll();

        for (Admin a : list) {
            if (ad.getEmail().equals(a.getEmail()) && ad.getPassword().equals(a.getPassword())) {
                return true;
            }
        }

        return false;
    }
}
