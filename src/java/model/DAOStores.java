/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Stores;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Stack;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOStores extends ConnectDB{
    public int addStore(Stores sto){
        int n=0;
        String sql="INSERT INTO [stores] ([store_id],[store_name]"
                    +",[phone],[email],[street]"
                    +",[city],[state],[zip_code])"
                    +" VALUES(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, sto.getStore_id());
            pre.setString(2, sto.getStore_name());
            pre.setString(3, sto.getPhone());
            pre.setString(4, sto.getEmail());
            pre.setString(5, sto.getStreet());
            pre.setString(6, sto.getCity());
            pre.setString(7, sto.getState());
            pre.setString(8, sto.getZip_code());
            n=pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
    
    public int updateStore(Stores sto){
        int n=0;
        String sql="update Stores set [store_name]=?"
                    +",[phone]=?,[email]=?,[street]=?"
                    +",[city]=?,[state]=?,[zip_code]=?"
                    + " where [store_id] =?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1,sto.getStore_name());
            pre.setString(2,sto.getPhone());
            pre.setString(3,sto.getEmail());
            pre.setString(4,sto.getStreet());
            pre.setString(5,sto.getCity());
            pre.setString(6,sto.getState());
            pre.setString(7,sto.getZip_code());
            pre.setInt(8,sto.getStore_id());
            n=pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOStores.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int removeStore(int id){
        int n=0;
        String sql="delete from Stores where id ="+id;
        try {
            Statement state = conn.createStatement();
            n=state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOStores.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public Vector<Stores> listAll(String sql){
        Vector<Stores> vector = new Vector<>();
        //String sql="select *from Stores";
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs= state.executeQuery(sql);
            while(rs.next()){
                int store_id=rs.getInt(1);
                String store_name=rs.getString(2);
                String phone=rs.getString(3);
                String email=rs.getString(4);
                String street=rs.getString(5);
                String city=rs.getString(6);
                String state1=rs.getString(7);
                String zip_code=rs.getString(8);
                Stores s = new Stores(store_id, store_name, phone, email, street, city, state1, zip_code);
                //System.out.println(s);
                vector.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOStores.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public static void main(String[] args) {
        DAOStores dao= new DAOStores();
//        int n=dao.addStore(new Stores(5, "anh", "920193", "anh@anh", "ahf", "djas", "fias", "38293"));
//        if(n>0){
//            System.out.println("inserted");
//        }
        //dao.listAll();
    }
}
