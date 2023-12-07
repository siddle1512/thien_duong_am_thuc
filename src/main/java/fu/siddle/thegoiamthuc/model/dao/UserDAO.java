package fu.siddle.thegoiamthuc.model.dao;

import fu.siddle.thegoiamthuc.model.User;
import fu.siddle.thegoiamthuc.service.JDBC;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import java.util.ArrayList;
import java.util.List;
import org.json.simple.parser.ParseException;

public class UserDAO implements DAO<User> {

    private static final UserDAO instance = new UserDAO();

    public static UserDAO getInstance() {
        return instance;
    }

    private static List<String> toList(String json) {
        List<String> list = new ArrayList<>();

        try {
            JSONArray arr = (JSONArray) new JSONParser().parse(json);
            for (Object address : arr) {
                list.add((String) address);
            }
        } catch (ParseException e) {
            System.err.println(e.getMessage());
        }

        return list;
    }

    private static String toJson(List<String> list) {
        JSONArray json = new JSONArray();

        for (String img : list) {
            json.add(img);
        }

        return json.toJSONString();
    }

    @Override
    public List<User> getAll() {
        List<User> list = new ArrayList<>();

        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("SELECT * FROM user");

            ResultSet rs = smt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String birth_year = rs.getString("birth_year");
                String gender = rs.getString("gender");
                String email = rs.getString("email");
                String hashed_password = rs.getString("hashed_password");
                String avatar_path = rs.getString("avatar_path");
                List<String> adress = toList(rs.getString("adress"));

                list.add(new User(id, username, birth_year, gender, email, hashed_password, avatar_path, adress));
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
            smt.setString(7, toJson(obj.getAdress()));

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
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String birth_year = rs.getString("birth_year");
                String gender = rs.getString("gender");
                String email = rs.getString("email");
                String hashed_password = rs.getString("hashed_password");
                String avatar_path = rs.getString("avatar_path");
                List<String> adress = toList(rs.getString("adress"));

                list.add(new User(id, username, birth_year, gender, email, hashed_password, avatar_path, adress));
            }

            JDBC.closeConnection(conn);

        } catch (SQLException ex) {
        }

        return list;
    }

    @Override
    public List<User> getID(String string) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<User> getSEARCH(String string) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<User> get4new() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int getCountfood() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<User> getFoodoffset(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<User> getFid(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<User> getLast() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public List<User> getByStatus(String e) {
        List<User> list = new ArrayList<>();

        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("SELECT * FROM user WHERE status = ?");
            smt.setString(1, e);

            ResultSet rs = smt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String birth_year = rs.getString("birth_year");
                String gender = rs.getString("gender");
                String email = rs.getString("email");
                String hashed_password = rs.getString("hashed_password");
                String avatar_path = rs.getString("avatar_path");
                List<String> adress = toList(rs.getString("adress"));

                list.add(new User(id, username, birth_year, gender, email, hashed_password, avatar_path, adress));
            }

            JDBC.closeConnection(conn);

        } catch (SQLException ex) {
        }

        return list;
    }

    public void update(User obj) {
        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("UPDATE user SET username = ?, birth_year = ?, gender = ?, email = ?, hashed_password = ?, avatar_path = ?, adress = ? WHERE id = ?");

            smt.setString(1, obj.getUsername());
            smt.setString(2, obj.getBirth_year());
            smt.setString(3, obj.getGender());
            smt.setString(4, obj.getEmail());
            smt.setString(5, obj.getHashed_password());
            smt.setString(6, obj.getAvatar_path());
            smt.setString(7, toJson(obj.getAdress()));
            smt.setInt(8, obj.getId());

            smt.executeUpdate();
            JDBC.closeConnection(conn);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

}
