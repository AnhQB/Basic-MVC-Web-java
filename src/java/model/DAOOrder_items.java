/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Order_items;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOOrder_items extends ConnectDB {
    public int addOrder_item(Order_items orderI){
        int n=0;
        String sql="INSERT INTO [order_items] ([order_id], [item_id]"
                    +",[product_id],[quantity]"
                    +",[list_price],[discount])"
                    +" VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement pre=conn.prepareStatement(sql);
            pre.setInt(1, orderI.getOrder_id());
            pre.setInt(2, orderI.getItem_id());
            pre.setInt(3, orderI.getProduct_id());
            pre.setInt(4, orderI.getQuantity());
            pre.setDouble(5, orderI.getList_price());
            pre.setDouble(6, orderI.getDiscount());
            
            n=pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
    
    public int updateOrder_items(Order_items orderI){
        int n=0;
        String sql="update Order_items set "
                    +"[product_id]=?,[quantity]=?"
                    +",[list_price]=?,[discount]=?"
                    + " where [order_id]=? and [item_id]=?";
        try {
            PreparedStatement pre= conn.prepareStatement(sql);
            
            pre.setInt(1, orderI.getProduct_id());
            pre.setInt(2, orderI.getQuantity());
            pre.setDouble(3, orderI.getList_price());
            pre.setDouble(4, orderI.getDiscount());
            pre.setInt(5, orderI.getOrder_id());
            pre.setInt(6, orderI.getItem_id());
            n=pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder_items.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int removeOrder_item(int order_id, int item_id){
        int n=0;
        String sql="delete from Order_items where order_id="+order_id +" and item_id="+item_id;
        try {
            Statement state = conn.createStatement();
            n=state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder_items.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public Vector<Order_items> listAll(String sql){
        //String sql="select *from Order_items";
        Vector<Order_items> vector= new Vector<>();
        try {
            Statement state=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while(rs.next()){
                int order_id=rs.getInt(1);
                int item_id=rs.getInt(2);
                int product_id=rs.getInt(3);
                int quantity=rs.getInt(4);
                double list_price=rs.getDouble(5);
                double discount=rs.getDouble(6);
                Order_items o=new Order_items(order_id, item_id, product_id, quantity, list_price, discount);
                //System.out.println(o);
                vector.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder_items.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    
    public static void main(String[] args) {
        DAOOrder_items dao= new DAOOrder_items();
        int n=dao.addOrder_item(new Order_items(10, 4, 20, 3, 3627.32));
        if(n>0){
            System.out.println("inserted");
        }
    }
}
