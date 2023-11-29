package fu.siddle.thegoiamthuc.model.dao;

import fu.siddle.thegoiamthuc.model.Order_data;
import fu.siddle.thegoiamthuc.service.JDBC;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class Order_dataDAO implements DAO<Order_data> {

    private static final Order_dataDAO instance = new Order_dataDAO();

    public static Order_dataDAO getInstance() {
        return instance;
    }

    @Override
    public List<Order_data> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Order_data obj) {
        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("INSERT INTO order_data(order_id, footitem_id, amout) VALUES (?, ?, ?)");
            smt.setInt(1, obj.getOrder_id());
            smt.setInt(2, obj.getFooditem_id());
            smt.setInt(3, obj.getAmout());

            smt.executeUpdate();
            JDBC.closeConnection(conn);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public List<Order_data> get(String email) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Order_data> getID(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Order_data> getSEARCH(String txt) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Order_data> get4new() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int getCountfood() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Order_data> getFoodoffset(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Order_data> getFid(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Order_data> getLast() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
