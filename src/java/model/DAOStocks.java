/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Stocks;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Stack;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOStocks extends ConnectDB{
    public int addStock(Stocks stock){
        int n=0;
        String sql ="INSERT INTO [stocks]"
           +"([store_id]"
           +",[product_id]"
           +",[quantity])"
           +" VALUES(?,?,?)";
        
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, stock.getStore_id());
            pre.setInt(2, stock.getProduct_id());
            pre.setInt(3, stock.getQuantity());
            
            n=pre.executeUpdate();
            System.out.println("inserted");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
    
    public int updateStock(Stocks sto){
        int n=0;
        String sql="update Stocks set "
                +"[quantity]=?"
                + " where [store_id]=? and [product_id]=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            
            pre.setInt(1, sto.getQuantity());
            pre.setInt(2, sto.getStore_id());
            pre.setInt(3, sto.getProduct_id());
            n=pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOStocks.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int removeStock(int store_id, int product_id){
        int n=0;
        String sql="delete from stocks where store_id="+store_id+" and product_id="+product_id;
        try {
            Statement state= conn.createStatement();
            n=state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOStocks.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public Vector<Stocks> listAll(String sql){
        Vector<Stocks> vector= new Vector<>();
        //String sql="select *from Stocks";
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while(rs.next()){
                int store_id=rs.getInt(1);
                int product_id=rs.getInt(2);
                int quantity=rs.getInt(3);
                Stocks s = new Stocks(store_id, product_id, quantity);
                //System.out.println(s);
                vector.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOStocks.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public static void main(String[] args) {
        DAOStocks dao= new DAOStocks();
        int n=dao.addStock(new Stocks(3, 202, 30));
        if(n>0){
            System.out.println("inserted");
        }
    }
}
