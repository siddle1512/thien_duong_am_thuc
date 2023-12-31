package fu.siddle.thegoiamthuc.model.dao;

import fu.siddle.thegoiamthuc.model.Admin;
import fu.siddle.thegoiamthuc.service.JDBC;
import java.sql.*;
import java.util.*;

public class AdminDAO implements DAO<Admin> {

    private static final AdminDAO instance = new AdminDAO();

    public static AdminDAO getInstance() {
        return instance;
    }

    @Override
    public List<Admin> getAll() {
        List<Admin> list = new ArrayList<>();

        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("SELECT * FROM admin");

            ResultSet rs = smt.executeQuery();

            while (rs.next()) {
                String email = rs.getString("username");
                String password = rs.getString("hashed_password");

                list.add(new Admin(email, password));
            }

            JDBC.closeConnection(conn);

        } catch (SQLException ex) {
        }

        return list;
    }

    @Override
    public void insert(Admin obj) {
    }

    @Override
    public List<Admin> get(String string) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Admin> getID(String string) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Admin> getSEARCH(String string) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Admin> get4new() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int getCountfood() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Admin> getFoodoffset(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Admin> getFid(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Admin> getLast() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
