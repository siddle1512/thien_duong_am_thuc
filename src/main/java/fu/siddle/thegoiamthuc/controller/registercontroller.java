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
@WebServlet(name = "registercontroller", urlPatterns = {"/registercontroller"})
public class registercontroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String a = "register";
        session.setAttribute("active", a);

        RequestDispatcher rd = request.getRequestDispatcher("views/web/register.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String username = request.getParameter("username");
        String birth_year = request.getParameter("birth_year");
        String gender = request.getParameter("gender");
        String adress = request.getParameter("adress");

        List<String> address = new ArrayList<>();;
        address.add(adress);

        String email = request.getParameter("email");

        String password = request.getParameter("password");

        String hashed_password = Hash.SHA256(password);

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

        User u = new User(username, birth_year, gender, email, hashed_password, imageFileName, address);

        UserDAO.getInstance().insert(u);
        
        response.sendRedirect("./logincontroller");
    }

}
