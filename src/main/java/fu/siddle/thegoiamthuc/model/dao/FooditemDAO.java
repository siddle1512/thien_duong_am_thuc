package fu.siddle.thegoiamthuc.model.dao;

import fu.siddle.thegoiamthuc.model.Fooditem;
import fu.siddle.thegoiamthuc.model.User;
import fu.siddle.thegoiamthuc.service.JDBC;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FooditemDAO implements DAO<Fooditem> {

    private static final FooditemDAO instance = new FooditemDAO();

    public static FooditemDAO getInstance() {
        return instance;
    }

    @Override
    public List<Fooditem> getAll() {
        List<Fooditem> list = new ArrayList<>();

        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("SELECT * FROM fooditem");

            ResultSet rs = smt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int category_id = rs.getInt("category_id");
                int price = rs.getInt("price");
                String image = rs.getString("image");

                list.add(new Fooditem(id, name, category_id, price, image));
            }

            JDBC.closeConnection(conn);

        } catch (SQLException ex) {
        }

        return list;
    }

    @Override
    public void insert(Fooditem obj) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Fooditem> get(String email) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Fooditem> getID(String id) {
        List<Fooditem> list = new ArrayList<>();

        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("SELECT * FROM fooditem WHERE category_id = ?");
            smt.setString(1, id);

            ResultSet rs = smt.executeQuery();

            while (rs.next()) {
                int cid = rs.getInt("id");
                String name = rs.getString("name");
                int category_id = rs.getInt("category_id");
                int price = rs.getInt("price");
                String image = rs.getString("image");

                list.add(new Fooditem(cid, name, category_id, price, image));
            }

            JDBC.closeConnection(conn);

        } catch (SQLException ex) {
        }

        return list;
    }

}
