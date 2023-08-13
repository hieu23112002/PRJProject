/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HIEUPC
 */
public class DAOProduct extends DBConnect {// DAO:database access object

    public int insertProduct(Product pro) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[products]\n"
                + "           ([product_id]\n"
                + "           ,[product_name]\n"
                + "           ,[model_year]\n"
                + "           ,[list_price]\n"
                + "           ,[brand_name]\n"
                + "           ,[category_name])\n"
                + "     VALUES(" + pro.getProduct_id() + ",'" + pro.getProduct_name() + "'," + pro.getModel_year() + ""
                + "," + pro.getList_price() + ",'" + pro.getBrand_name() + "','" + pro.getCategory_name() + "')";
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return n;
    }

    public int insertProductByPre(Product pro) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[products]\n"
                + "           ([product_id]\n"
                + "           ,[product_name]\n"
                + "           ,[model_year]\n"
                + "           ,[list_price]\n"
                + "           ,[brand_name]\n"
                + "           ,[category_name])\n"
                + "     VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            //pre.setDataType(indefOf,value);
            //Data is dataType of fieldName , indexOf: index start 1
            pre.setInt(1, pro.getProduct_id());
            pre.setString(2, pro.getProduct_name());
            pre.setInt(3, pro.getModel_year());
            pre.setDouble(4, pro.getList_price());
            pre.setString(5, pro.getBrand_name());
            pre.setString(6, pro.getCategory_name());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int updateProduct(Product pro) {
        int n = 0;
        String sql = "UPDATE [dbo].[products]\n"
                + "   SET [product_name] = ?"
                + "      ,[model_year] = ?"
                + "      ,[list_price] = ?"
                + "      ,[brand_name] = ?"
                + "      ,[category_name] = ?"
                + " WHERE [product_id] = ?";

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, pro.getProduct_name());
            pre.setInt(2, pro.getModel_year());
            pre.setDouble(3, pro.getList_price());
            pre.setString(4, pro.getBrand_name());
            pre.setString(5, pro.getCategory_name());
            pre.setInt(6, pro.getProduct_id());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }

        return n;
    }

    public int changePrice(int id, double newPrice) {
        int n = 0;

        String sql = "UPDATE [dbo].[products] SET [list_price] = " + newPrice
                + " WHERE [product_id] = " + id;

        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;

    }

    public int deleteProduct(int id) {
        int n = 0;
        String sql = "DELETE FROM [dbo].[products]\n"
                + "      WHERE [product_id] = " + id;
        try {
            Statement state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public Vector searchByName(String name){
        Vector<Product> vector = new Vector<Product>();
        String sql ="select * from Products where product_name LIKE '%" + name + "%'";
        ResultSet rs = getData(sql);
        try {
            while(rs.next()){
                //dataType varName = rs.getDataType(fieldName|index);
                //int id = rs.getInt("product_id");
                int id = rs.getInt(1);
                String name1 = rs.getString(2);
                int year = rs.getInt(3);
                double price = rs.getDouble(4);
                String brand = rs.getString(5);
                String category = rs.getString(6);
                Product pro = new Product(id, name1, year, price, brand, category);
                vector.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public Vector searchByID(int id){
        Vector<Product> vector = new Vector<Product>();
        String sql ="select * from Products where product_name = " + id + "";
        ResultSet rs = getData(sql);
        try {
            while(rs.next()){
                //dataType varName = rs.getDataType(fieldName|index);
                //int id = rs.getInt("product_id");
                int id1 = rs.getInt(1);
                String name1 = rs.getString(2);
                int year = rs.getInt(3);
                double price = rs.getDouble(4);
                String brand = rs.getString(5);
                String category = rs.getString(6);
                Product pro = new Product(id, name1, year, price, brand, category);
                vector.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public Vector getAllProduct(String sql){
        Vector<Product> vector = new Vector<Product>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while(rs.next()){
                //dataType varName = rs.getDataType(fieldName|index);
                //int id = rs.getInt("product_id");
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int year = rs.getInt(3);
                double price = rs.getDouble(4);
                String brand = rs.getString(5);
                String category = rs.getString(6);
                Product pro = new Product(id, name, year, price, brand, category);
                vector.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
//    public void displayAll(){
//        String sql ="select * from Products";
//        try {
//            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
//            ResultSet rs = state.executeQuery(sql);
//            while(rs.next()){
//                //dataType varName = rs.getDataType(fieldName|index);
//                //int id = rs.getInt("product_id");
//                int id = rs.getInt(1);
//                String name = rs.getString(2);
//                int year = rs.getInt(3);
//                double price = rs.getDouble(4);
//                String brand = rs.getString(5);
//                String category = rs.getString(6);
//                Product pro = new Product(id, name, year, price, brand, category);
//                System.out.println(pro);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        
//    }

    public static void main(String[] args) {
        DAOProduct dao = new DAOProduct();
//       Product pro = new Product(2001, "demo", 2024, 200, "demo", "demo");
//        int n = dao.insertProduct(pro);
//        if (n > 0) {
//            System.out.println("done");
//        }
//        int m = dao.updateProduct(pro);
//        if(m > 0){
//            System.out.println("oke");
//        }
            //dao.displayAll();
            Vector<Product> vector = dao.searchByName("Trek 820");
            for (Product pro : vector) {
                System.out.println(pro);
        }

    }
}
