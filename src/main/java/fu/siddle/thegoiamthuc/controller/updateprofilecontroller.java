package fu.siddle.thegoiamthuc.controller;

import fu.siddle.thegoiamthuc.model.User;
import fu.siddle.thegoiamthuc.model.dao.UserDAO;
import fu.siddle.thegoiamthuc.service.Hash;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet(name = "updateprofilecontroller", urlPatterns = {"/updateprofilecontroller"})
public class updateprofilecontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String username = request.getParameter("username");

        Part file = request.getPart("profilePicture");
        String imageFileName = file.getSubmittedFileName();

        String uploadPath = "D:/webjava/amthucnew/thien_duong_am_thuc/src/main/webapp/assets/images/" + imageFileName;

        System.out.println("Upload Path : " + uploadPath);

        try {

            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        User u = (User) session.getAttribute("user");

        String usn = username;
        String path = imageFileName;

        if (path.equalsIgnoreCase("")) {
            path = u.getAvatar_path();
        }

        //add vao model
        User us = new User(u.getId(), usn, u.getBirth_year(), u.getGender(), u.getEmail(), u.getHashed_password(), path, u.getAdress());
        //insert database

        UserDAO.getInstance().update(us);

        String email = (String) session.getAttribute("email");
        List<User> listuserlogin = UserDAO.getInstance().get(email);
        session.setAttribute("listuserlogin", listuserlogin);

        response.sendRedirect("./profilecontroller");
    }

}
