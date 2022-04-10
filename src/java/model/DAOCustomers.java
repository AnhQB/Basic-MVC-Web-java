/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Customers;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Stack;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOCustomers extends ConnectDB{
    public int addCustomer(Customers cus){
        int n=0;
        String sql= "INSERT INTO [customers]([customer_id]"
                    +",[first_name],[last_name],[phone]"
                    +",[email],[street],[city],[state],[zip_code])"
                    +" VALUES(?,?,?,?,?,?,?,?,?)";
        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setInt(1, cus.getCustomer_id());
            pre.setString(2, cus.getFirst_name());
            pre.setString(3, cus.getLast_name());
            pre.setString(4, cus.getPhone());
            pre.setString(5, cus.getEmail());
            pre.setString(6, cus.getStreet());
            pre.setString(7, cus.getCity());
            pre.setString(8, cus.getState());
            pre.setString(9, cus.getZip_code());
            
            n=pre.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomers.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return n;
    }
    
    public int updateCustomer(Customers cus){
        int n=0;
        String sql="update Customers set "
                    +"[first_name]=?,[last_name]=?,[phone]=?"
                    +",[email]=?,[street]=?,[city]=?,[state]=?,[zip_code]=? "
                    + "where [customer_id] =?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            
            pre.setString(1, cus.getFirst_name());
            pre.setString(2, cus.getLast_name());
            pre.setString(3, cus.getPhone());
            pre.setString(4, cus.getEmail());
            pre.setString(5, cus.getStreet());
            pre.setString(6, cus.getCity());
            pre.setString(7, cus.getState());
            pre.setString(8, cus.getZip_code());
            pre.setInt(9, cus.getCustomer_id());
            
            n=pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
    
    public int removeCustomer(int id){
        int n=0;
        String sql="delete from Customers where [customer_id]="+id;
        //check foreign key constraint 
        try {
            Statement state= conn.createStatement();
            n=state.executeUpdate(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
    
    public Vector<Customers> searchCity(String city){
        Vector<Customers> vector = new Vector();
        String sql="select *from Customers where city='"+city+"'";
        ResultSet rs = getData(sql);
        try {
            while(rs.next()){
                //get customer
                int customer_id=rs.getInt(1);
                String first_name=rs.getString(2);
                String last_name=rs.getString(3);
                String phone= rs.getString(4);
                String email=rs.getString(5);
                String street=rs.getString(6);
                String city1=rs.getString(7);
                String state1=rs.getString(8);
                String zip_code=rs.getString(9);
                Customers cus = new Customers(customer_id, first_name, last_name, phone, email, street, city1, state1, zip_code);
                vector.add(cus);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }
    
    public Vector<Customers> searchCus(int id){
        Vector<Customers> vec = new Vector<>();
        String sql="select *from Customers where customer_id ="+id;
        ResultSet rs = getData(sql);
        try {
            while(rs.next()){
                int customer_id=rs.getInt(1);
                String first_name=rs.getString(2);
                String last_name=rs.getString(3);
                String phone= rs.getString(4);
                String email=rs.getString(5);
                String street=rs.getString(6);
                String city=rs.getString(7);
                String state1=rs.getString(8);
                String zip_code=rs.getString(9);
                Customers cus = new Customers(customer_id, first_name, last_name, phone, email, street, city, state1, zip_code);
                vec.add(cus);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomers.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return vec;
    }
    
    public Vector<Customers> searchCus(String name){
        Vector<Customers> vec = new Vector<>();
        String sql="select *From customers where first_name + ' '+last_name like '%"+name+"%'" ;
        ResultSet rs = getData(sql);
        try {
            while(rs.next()){
                int customer_id=rs.getInt(1);
                String first_name=rs.getString(2);
                String last_name=rs.getString(3);
                String phone= rs.getString(4);
                String email=rs.getString(5);
                String street=rs.getString(6);
                String city=rs.getString(7);
                String state1=rs.getString(8);
                String zip_code=rs.getString(9);
                Customers cus = new Customers(customer_id, first_name, last_name, phone, email, street, city, state1, zip_code);
                vec.add(cus);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomers.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return vec;
    }
    
    public Vector<Customers>  listAll(String sql){
        Vector<Customers> vector= new Vector<>();
        //String sql="select *from Customers";
        try {
            Statement state= conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            //ResultSet rs1=getData(sql);
            while(rs.next()){
                int customer_id=rs.getInt(1);
                String first_name=rs.getString("first_name");
                String last_name=rs.getString(3);
                String phone= rs.getString(4);
                String email=rs.getString(5);
                String street=rs.getString(6);
                String city=rs.getString(7);
                String state1=rs.getString(8);
                String zip_code=rs.getString(9);
                Customers cus = new Customers(customer_id, first_name, last_name, phone, email, street, city, state1, zip_code);
                //System.out.println(cus);
                vector.add(cus);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }
    
    public int checkAccount(String username,String password){
        int n=0;
        String sql="select *from Customers where username=? and password=?";
        try {
            PreparedStatement pre=conn.prepareStatement(sql);
            pre.setString(1, username);
            pre.setString(2, password);
            
            ResultSet rs=pre.executeQuery();
            if(rs.next()){
                n=1;
            }else{
                n=-1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return n;
    }
    
    public int checkAccount(String username){
        int n=0;
        String sql="select *from Customers where username=?";
        try {
            PreparedStatement pre=conn.prepareStatement(sql);
            pre.setString(1, username);            
            ResultSet rs=pre.executeQuery();
            if(rs.next()){
                n=1;
            }else{
                n=-1;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        return n;
    }
    
    public static void main(String[] args) {
       DAOCustomers dao= new DAOCustomers();
//        int n=dao.addCustomer(new Customers(501,"anh", "anh", "", "fu3@gmai.com", "382", "buu", "QB", "38293"));
//        if(n>0){
//            System.out.println("inserted");
//        }
        //dao.listAll();
    }
}
