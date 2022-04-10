/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Customers;
import entity.Order_items;
import entity.Orders;
import entity.Products;
import entity.Staffs;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOOrders extends ConnectDB{
    public int addOrder(Orders order){
        int n=0;
        String sql="INSERT INTO [orders] ([order_id],[customer_id]"
                    +",[order_status],[order_date],[required_date]"
                    +",[shipped_date],[store_id],[staff_id])"
                    +" VALUES (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, order.getOrder_id());
            pre.setInt(2, order.getCustomer_id());
            pre.setInt(3, order.getOrder_status());
            pre.setString(4, order.getOrder_date());
            pre.setString(5, order.getRequired_date());
            pre.setString(6, order.getShipped_date());
            pre.setInt(7, order.getStore_id());
            pre.setInt(8, order.getStaff_id());
            n=pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
    
    public int updateOrder(Orders o){
        int n=0;
        String sql="update Orders set "
                + "[customer_id]=?"
                +",[order_status]=?,[order_date]=?,[required_date]=?"
                +",[shipped_date]=?,[store_id]=?,[staff_id]=?"
                +" where [order_id]=?";
        try {
            PreparedStatement pre =conn.prepareStatement(sql);
            pre.setInt(1, o.getCustomer_id());
            pre.setInt(2, o.getOrder_status());
            pre.setString(3, o.getOrder_date());
            pre.setString(4, o.getRequired_date());
            pre.setString(5, o.getShipped_date());
            pre.setInt(6, o.getStore_id());
            pre.setInt(7, o.getStaff_id());
            pre.setInt(8, o.getOrder_id());
            n=pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrders.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int removeOrder(int id){
        int n=0;
        String sql="delete from Orders where id="+id;
        try {
            Statement state=conn.createStatement();
            n=state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrders.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public Vector<Orders> listAll(String sql){
        //String sql="select *from Orders";
        Vector<Orders> vector = new Vector<>();
        try {
            Statement state=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while(rs.next()){
                int order_id=rs.getInt(1);
                int customer_id=rs.getInt(2);
                int order_status=rs.getInt(3);
                String order_date=rs.getString(4);
                String required_date=rs.getString(5);
                String shipped_date=rs.getString(6);
                int store_id=rs.getInt(7);
                int staff_id=rs.getInt(8);
                
                Orders o = new Orders(order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id);
                //System.out.println(o);
                vector.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrders.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public void displayOrderJCustomer(){
        int last_customer_id=0;
        int key=0;
        Customers cus=new Customers();
        String sql="select *from orders join customers on customers.customer_id=orders.customer_id order by order_id";
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while(rs.next()){
                int order_id=rs.getInt(1);
                int customer_id=rs.getInt(2);
                int order_status=rs.getInt(3);
                String order_date=rs.getString(4);
                String required_date=rs.getString(5);
                String shipped_date=rs.getString(6);
                int store_id=rs.getInt(7);
                int staff_id=rs.getInt(8);
                String first_name=rs.getString(10);
                String last_name=rs.getString(11);
                String phone= rs.getString(12);
                String email=rs.getString(13);
                String street=rs.getString(14);
                String city=rs.getString(15);
                String state1=rs.getString(16);
                String zip_code=rs.getString(17);
                if(last_customer_id!=customer_id && key !=0){
                    
                    System.out.println(cus);
                    System.out.println("=========");
                }
                Orders o = new Orders(order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id);
                System.out.println(o);
                
                cus = new Customers(customer_id, first_name, last_name, phone, email, street, city, state1, zip_code);
                last_customer_id=customer_id;
                key=1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrders.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void displayOrdersJOrder_items(){
        int last_order_id=0;
        int key=0;
        String sql="select *from orders join order_items on order_items.order_id=orders.order_id order by orders.order_id";
        ResultSet rs=getData(sql);
        try {
            while(rs.next()){
                int order_id=rs.getInt(1);
                int customer_id=rs.getInt(2);
                int order_status=rs.getInt(3);
                String order_date=rs.getString(4);
                String required_date=rs.getString(5);
                String shipped_date=rs.getString(6);
                int store_id=rs.getInt(7);
                int staff_id=rs.getInt(8);
                
                int item_id=rs.getInt(10);
                int product_id=rs.getInt(11);
                int quantity=rs.getInt(12);
                double list_price=rs.getDouble(13);
                double discount=rs.getDouble(14);
                if(last_order_id!=order_id || key==0){
                    if(key!=0){
                        System.out.println("======");
                    }
                    Orders o = new Orders(order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id);
                    System.out.println(o);
                }
                
                Order_items oItems=new Order_items(order_id, item_id, product_id, quantity, list_price, discount);
                System.out.println(oItems);
                
                last_order_id=order_id;
                key=1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrders.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void displayOrdersJProducts(){
        int last_order_id=0;
        int key=0;
        String sql="select *from orders " +
                    "left join order_items on order_items.order_id=orders.order_id " +
                    "join products on products.product_id=order_items.product_id " +
                    "order by orders.order_id";
        ResultSet rs = getData(sql);
        try {
            while(rs.next()){
                int order_id=rs.getInt(1);
                int customer_id=rs.getInt(2);
                int order_status=rs.getInt(3);
                String order_date=rs.getString(4);
                String required_date=rs.getString(5);
                String shipped_date=rs.getString(6);
                int store_id=rs.getInt(7);
                int staff_id=rs.getInt(8);
                
                int product_id=rs.getInt(9);
                String product_name=rs.getString(10);
                int model_year=rs.getInt(11);
                double list_price=rs.getDouble(12);
                String brand_name=rs.getString(13);
                String category_name=rs.getString(14);
                
                if(last_order_id!=order_id || key==0){
                    if(key!=0){
                        System.out.println("======");
                    }
                    
                    Orders o = new Orders(order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id);
                    System.out.println(o);
                }
                
                Products p = new Products(product_id, product_name, model_year, list_price, brand_name, category_name);
                System.out.println(p);
                
                last_order_id=order_id;
                key=1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrders.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void displayOrdersJStaffs(){
        int last_staff_id=0;
        int key=0;
        Staffs s=new Staffs();
        String sql="select *from orders " +
                "join staffs on orders.staff_id=staffs.staff_id " +
                "order by orders.order_id";
        ResultSet rs = getData(sql);
        try {
            while(rs.next()){
                int order_id=rs.getInt(1);
                int customer_id=rs.getInt(2);
                int order_status=rs.getInt(3);
                String order_date=rs.getString(4);
                String required_date=rs.getString(5);
                String shipped_date=rs.getString(6);
                int store_id=rs.getInt(7);
                int staff_id=rs.getInt(8);
               
                String first_name=rs.getString(10);
                String last_name=rs.getString(11);
                String email=rs.getString(12);
                String phone=rs.getString(13);
                int active=rs.getInt(14);
                int manager_id=rs.getInt(16);
                
                if(last_staff_id!=staff_id && key !=0){
                    
                    System.out.println(s);
                    System.out.println("=========");
                }
                
                Orders o = new Orders(order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id);
                System.out.println(o);
                s=new Staffs(staff_id, first_name, last_name, email, phone, active, store_id, manager_id);
                
                last_staff_id=staff_id;
                key=1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrders.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Vector<Object> OrderDetail(){
        String sql="select *from orders " +
            "inner join customers on customers.customer_id=orders.customer_id " +
            "inner join order_items on order_items.order_id=orders.order_id " +
            "inner join products on products.product_id=order_items.product_id " +
            "inner join staffs on staffs.staff_id=orders.staff_id";
        
        ResultSet rs = getData(sql);
        Vector<Object> vec=new Vector<>();
        try {
            while(rs.next()){
                int order_id=rs.getInt(1);
                int customer_id=rs.getInt(2);
                int order_status=rs.getInt(3);
                String order_date=rs.getString(4);
                String required_date=rs.getString(5);
                String shipped_date=rs.getString(6);
                int store_id=rs.getInt(7);
                int staff_id=rs.getInt(8);
                
                String first_name=rs.getString(10);
                String last_name=rs.getString(11);
                String phone= rs.getString(12);
                String email=rs.getString(13);
                String street=rs.getString(14);
                String city=rs.getString(15);
                String state1=rs.getString(16);
                String zip_code=rs.getString(17);
                
                int item_id=rs.getInt(19);
                int product_id=rs.getInt(20);
                int quantity=rs.getInt(21);
                double list_price_OI=rs.getDouble(22);
                double discount=rs.getDouble(23);
                
                String product_name=rs.getString(25);
                int model_year=rs.getInt(26);
                double list_price_P=rs.getDouble(27);
                String brand_name=rs.getString(28);
                String category_name=rs.getString(29);
                
                String first_name_staff=rs.getString(32);
                String last_name_staff=rs.getString(32);
                String email_staff=rs.getString(33);
                String phone_staff=rs.getString(34);
                int active=rs.getInt(35);
                int store_id_staff=rs.getInt(36);
                int manager_id=rs.getInt(37);
                
                Orders o = new Orders(order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id);
                //System.out.println(o);
                
                Customers cus = new Customers(customer_id, first_name, last_name, phone, email, street, city, state1, zip_code);
                //System.out.println(cus);
                
                Order_items oI=new Order_items(order_id, item_id, product_id, quantity, list_price_OI, discount);
                //System.out.println(oI);
                
                Products p = new Products(product_id, product_name, model_year, list_price_P, brand_name, category_name);
                //System.out.println(p);
                
                Staffs s=new Staffs(staff_id, first_name_staff, last_name_staff, email_staff, phone_staff, active, store_id_staff, manager_id);
                //System.out.println(s);
                //System.out.println("========");
                
                vec.add(o);
                vec.add(cus);
                vec.add(oI);
                vec.add(p);
                vec.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrders.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vec;
    }
    
    public int updateStatus(String id,int status){
        int n=0;
        String sql="update Orders set order_status="+status +" where order_id="+id;
        try {
            Statement state= conn.createStatement();
            n=state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrders.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public Vector<Orders> searchOrder(int id){
        Vector<Orders> vector=new Vector<>();
        String sql="select *from orders where order_id="+id;
        ResultSet rs = getData(sql);
        try {
            while(rs.next()){
                int order_id=rs.getInt(1);
                int customer_id=rs.getInt(2);
                int order_status=rs.getInt(3);
                String order_date=rs.getString(4);
                String required_date=rs.getString(5);
                String shipped_date=rs.getString(6);
                int store_id=rs.getInt(7);
                int staff_id=rs.getInt(8);
                
                Orders o = new Orders(order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id);
                //System.out.println(o);
                vector.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrders.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public static void main(String[] args) {
        DAOOrders dao= new DAOOrders();
//        int n=dao.addOrder(new Orders(2, 175, 3, "2016-02-08", "2016-02-01", "2016-02-20", 1, 2));
//        if(n>0){
//            System.out.println("inserted");
//        }
        //dao.displayOrderJCustomer();
        //dao.displayOrdersJOrder_items();
        //dao.displayOrdersJProducts();
        //dao.displayOrdersJStaffs();
        //dao.OrderDetail();
        //Vector<Object> vec = dao.OrderDetail();
        //for(Object o: vec){
//           System.out.println(o);
//            
//        }
    }
}
