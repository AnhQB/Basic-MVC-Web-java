/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Products;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.ResultSet;
import java.util.Stack;

public class DAOProducts extends ConnectDB {
    public int addProduct(Products pro){
        int n=0;
        String sql="INSERT INTO [products] ([product_id],[product_name]"
                    +",[model_year],[list_price],[brand_name]"
                    +",[category_name])"
                    +"VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, pro.getProduct_id());
            pre.setString(2, pro.getProduct_name());
            pre.setInt(3, pro.getModel_year());
            pre.setDouble(4, pro.getList_price());
            pre.setString(5, pro.getBrand_name());
            pre.setString(6, pro.getCategory_name());
            
            n=pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
    
    public int updateProduct(Products p){
        int n=0;
        String sql="update Products set"
                + "[product_name]=?"
                +",[model_year]=?,[list_price]=?,[brand_name]=?"
                +",[category_name]=? where [product_id]=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, p.getProduct_name());
            pre.setInt(2, p.getModel_year());
            pre.setDouble(3, p.getList_price());
            pre.setString(4, p.getBrand_name());
            pre.setString(5, p.getCategory_name());
            pre.setInt(6, p.getProduct_id());
            n=pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int removeProduct(int id){
        int n=0;
        String sql="delete from Products where product_id="+id;
        try {
            Statement state = conn.createStatement();
            n=state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public Vector<Products> listAll(String sql){
        Vector<Products> vector=new Vector<>();
        //String sql="select *from Products";
        try {
            Statement state= conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = (ResultSet) state.executeQuery(sql);
            while(rs.next()){
                int product_id=rs.getInt(1);
                String product_name=rs.getString(2);
                int model_year=rs.getInt(3);
                double list_price=rs.getDouble(4);
                String brand_name=rs.getString(5);
                String category_name=rs.getString(6);
                Products p = new Products(product_id, product_name, model_year, list_price, brand_name, category_name);
                vector.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public Vector<Products> searchProduct(String name){
        Vector<Products> v=new Vector<>();
        String sql="select *from Products where product_name like '%"+name+"%'";
        ResultSet rs= getData(sql);
        try {
            while(rs.next()){
                int product_id=rs.getInt(1);
                String product_name=rs.getString(2);
                int model_year=rs.getInt(3);
                double list_price=rs.getDouble(4);
                String brand_name=rs.getString(5);
                String category_name=rs.getString(6);
                Products p = new Products(product_id, product_name, model_year, list_price, brand_name, category_name);
                v.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        return v;
    }
    
    public Vector<Products> searchProduct(double fromPrice, double toPrice){
        Vector<Products> vector = new Vector<>();
        String sql="select *from Products where list_price >="+fromPrice+"and list_price <="+toPrice;
        ResultSet rs = getData(sql);
        try {
            while(rs.next()){
                int product_id=rs.getInt(1);
                String product_name=rs.getString(2);
                int model_year=rs.getInt(3);
                double list_price=rs.getDouble(4);
                String brand_name=rs.getString(5);
                String category_name=rs.getString(6);
                Products p = new Products(product_id, product_name, model_year, list_price, brand_name, category_name);
                vector.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProducts.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return vector;
    }
    
    public static void main(String[] args) {
        DAOProducts dao= new DAOProducts();
//        int n=dao.addProduct(new Products(202, "abc", 2021, 2799.99, "trek", "Electric Bikes"));
//        if(n>0){
//            System.out.println("inserted");
//        }

        Vector<Products> v = dao.searchProduct(300,2000);
        for(Products p: v){
            System.out.println(p);
        }
    }
}
