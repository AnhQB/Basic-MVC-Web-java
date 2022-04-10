/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Staffs;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Stack;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOStaffs extends ConnectDB {
    public int addStaff(Staffs staff){
        int n=0;
        String sql="INSERT INTO [staffs] ([staff_id],[first_name]"
                +",[last_name],[email],[phone]"
                +",[active],[store_id],[manager_id])"
                + " VALUES(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement pre=conn.prepareStatement(sql);
            pre.setInt(1, staff.getStaff_id());
            pre.setString(2, staff.getFirst_name());
            pre.setString(3, staff.getLast_name());
            pre.setString(4, staff.getEmail());
            pre.setString(5, staff.getPhone());
            pre.setInt(6, staff.getActive());
            pre.setInt(7, staff.getStore_id());
            pre.setInt(8, staff.getManager_id());
            n=pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
    
    public int updateStaff(Staffs s){
        int n=0;
        String sql="update Staffs set "
                + "[first_name]=?"
                +",[last_name]=?,[email]=?,[phone]=?"
                +",[active]=?,[store_id]=?,[manager_id]=?"
                + " where [staff_id]=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, s.getFirst_name());
            pre.setString(2, s.getLast_name());
            pre.setString(3, s.getEmail());
            pre.setString(4, s.getPhone());
            pre.setInt(5, s.getActive());
            pre.setInt(6, s.getStore_id());
            pre.setInt(7, s.getManager_id());
            pre.setInt(8, s.getStaff_id());
            
            n=pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOStaffs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int removeStaff(int id){
        int n=0;
        String sql="delete from Staffs where staff_id="+id;
        try {
            Statement state = conn.createStatement();
            n=state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOStaffs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public Vector<Staffs> listAll(String sql){
        Vector<Staffs> vector= new Stack<>();
        //String sql="select *from Staffs";
        try {
            Statement state= conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while(rs.next()){
                int staff_id=rs.getInt(1);
                String first_name=rs.getString(2);
                String last_name=rs.getString(3);
                String email=rs.getString(4);
                String phone=rs.getString(5);
                int active=rs.getInt(6);
                int store_id=rs.getInt(7);
                int manager_id=rs.getInt(8);
                Staffs s=new Staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id);
                vector.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOStaffs.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public Vector<Staffs> searchStaff(int id){
        Vector<Staffs> vec = new Vector<>();
        String sql="select *from Staffs where staff_id ="+id;
        ResultSet rs = getData(sql);
        try {
            while(rs.next()){
                int staff_id=rs.getInt(1);
                String first_name=rs.getString(2);
                String last_name=rs.getString(3);
                String email=rs.getString(4);
                String phone=rs.getString(5);
                int active=rs.getInt(6);
                int store_id=rs.getInt(7);
                int manager_id=rs.getInt(8);
                Staffs s=new Staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id);
                vec.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomers.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return vec;
    }
    
    public Vector<Staffs> searchStaff(String username){
        Vector<Staffs> vec = new Vector<>();
        String sql="select *from Staffs where username='"+username+"'";
        ResultSet rs = getData(sql);
        try {
            while(rs.next()){
                int staff_id=rs.getInt(1);
                String first_name=rs.getString(2);
                String last_name=rs.getString(3);
                String email=rs.getString(4);
                String phone=rs.getString(5);
                int active=rs.getInt(6);
                int store_id=rs.getInt(7);
                int manager_id=rs.getInt(8);
                Staffs s=new Staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id);
                vec.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomers.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return vec;
    }
    
    public int checkAccount(String username,String password){
        int n=0;
        String sql="select *from Staffs where username=? and password=?";
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
        String sql="select *from Staffs where username=?";
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
        DAOStaffs dao= new DAOStaffs();
//        int n=dao.addStaff(new Staffs(11, "anh", "pham", "anh@gmail.com", "027837", 1, 3,7));
//        if(n>0){
//            System.out.println("inserted");
//        }
//        int n= dao.updateStaff(new Staffs(10, "Bernardine 2", "Houston", "bernardine.houston@bikes.shop", "(972) 530-5557", 1, 3, 7));
//        if(n>0){
//            System.out.println("ok");
//        }
    dao.removeStaff(10);
    }
}
