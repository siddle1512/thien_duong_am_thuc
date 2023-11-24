package fu.siddle.thegoiamthuc.model.dao;

import fu.siddle.thegoiamthuc.model.Category;
import fu.siddle.thegoiamthuc.model.User;
import fu.siddle.thegoiamthuc.service.JDBC;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO implements DAO<Category> {
    
    private static final CategoryDAO instance = new CategoryDAO();
    
    public static CategoryDAO getInstance() {
        return instance;
    }
    
    @Override
    public List<Category> getAll() {
        List<Category> list = new ArrayList<>();
        
        try {
            Connection conn = JDBC.getConnection();
            
            PreparedStatement smt = conn.prepareStatement("SELECT * FROM category");
            
            ResultSet rs = smt.executeQuery();
            
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                
                list.add(new Category(id, name));
            }
            
            JDBC.closeConnection(conn);
            
        } catch (SQLException ex) {
        }
        
        return list;
    }
    
    @Override
    public void insert(Category obj
    ) {
        
    }
    
    @Override
    public List<Category> get(String email
    ) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Category> getID(String string) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Category> getSEARCH(String string) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
