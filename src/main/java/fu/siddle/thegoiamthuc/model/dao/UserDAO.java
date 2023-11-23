/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.siddle.thegoiamthuc.model.dao;

import fu.siddle.thegoiamthuc.model.Admin;
import fu.siddle.thegoiamthuc.model.User;
import fu.siddle.thegoiamthuc.service.JDBC;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tranh
 */
public class UserDAO implements DAO<User> {

    private static final UserDAO instance = new UserDAO();

    public static UserDAO getInstance() {
        return instance;
    }

    @Override
    public List<User> getAll() {
        List<User> list = new ArrayList<>();

        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("SELECT * FROM user");

            ResultSet rs = smt.executeQuery();

            while (rs.next()) {
                String username = rs.getString("username");
                String birth_year = rs.getString("birth_year");
                String gender = rs.getString("gender");
                String email = rs.getString("email");
                String hashed_password = rs.getString("hashed_password");
                String avatar_path = rs.getString("avatar_path");
                String adress = rs.getString("adress");

                list.add(new User(username, birth_year, gender, email, hashed_password, avatar_path, adress));
            }

            JDBC.closeConnection(conn);

        } catch (SQLException ex) {
        }

        return list;
    }

    @Override
    public void insert(User obj) {
        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("INSERT INTO user(username, birth_year, gender, email, hashed_password, avatar_path, adress) VALUES (?, ?, ?, ?, ?, ?, ?)");
            smt.setString(1, obj.getUsername());
            smt.setString(2, obj.getBirth_year());
            smt.setString(3, obj.getGender());
            smt.setString(4, obj.getEmail());
            smt.setString(5, obj.getHashed_password());
            smt.setString(6, obj.getAvatar_path());
            smt.setString(7, obj.getAdress());

            smt.executeUpdate();
            JDBC.closeConnection(conn);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public List<User> get(String e) {
        List<User> list = new ArrayList<>();

        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("SELECT * FROM user WHERE email = ?");
            smt.setString(1, e);

            ResultSet rs = smt.executeQuery();

            while (rs.next()) {
                String username = rs.getString("username");
                String birth_year = rs.getString("birth_year");
                String gender = rs.getString("gender");
                String email = rs.getString("email");
                String hashed_password = rs.getString("hashed_password");
                String avatar_path = rs.getString("avatar_path");
                String adress = rs.getString("adress");

                list.add(new User(username, birth_year, gender, email, hashed_password, avatar_path, adress));
            }

            JDBC.closeConnection(conn);

        } catch (SQLException ex) {
        }
        
        return list;
    }
}
