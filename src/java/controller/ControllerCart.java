/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Customers;
import entity.Products;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;
import model.DAOCustomers;
import model.DAOProducts;

/**
 *
 * @author LAPTOP VINH HA
 */
@WebServlet(name = "ControllerCart", urlPatterns = {"/ControllerCart"})
public class ControllerCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        

        DAOProducts dao = new DAOProducts();
        String service = request.getParameter("s");
        String search = request.getParameter("search");
        String notiCart = request.getParameter("notiCart");

        if (service == null) {
            service = "itemList";
        }
        try (PrintWriter out = response.getWriter()) {
            if (service.equalsIgnoreCase("itemList")) {
                String titlepage = "Shopping page";
                String titletable = "Product table";
                Vector<Products> vector = new Vector<>();
                
                String pname = "";
                String from = "", to = "";
                if (search == null) {
                    vector = dao.listAll("select *from Products");
                } else {
                    if (search.equalsIgnoreCase("search by name")) {
                        pname = request.getParameter("pname");
                        vector = dao.searchProduct(pname);
                    } else if (search.equalsIgnoreCase("search by price")) {
                        from = request.getParameter("from");
                        to = request.getParameter("to");
                        if (checkDigit(from) && checkDigit(to)) {
                            double fromD = Double.parseDouble(from);
                            double toD = Double.parseDouble(to);
                            vector = dao.searchProduct(fromD, toD);
                        }
                    }else if(search.equalsIgnoreCase("brand")){
                        String brand=request.getParameter("brand");
                        vector=dao.listAll("select *from products where brand_name='"+brand+"'");
                    }
                }

                //RequestDispatcher dispath = request.getRequestDispatcher("/JSP/itemList.jsp");
                request.setAttribute("ProductList", vector);
                request.setAttribute("titlepage", titlepage);
                request.setAttribute("titletable", titletable);
                request.setAttribute("pname", pname);
                request.setAttribute("from", from);
                request.setAttribute("to", to);
                //get username
                HttpSession session=request.getSession();
                /*
                Enumeration em = session.getAttributeNames();
                while(em.hasMoreElements()){
                    String username=em.nextElement().toString();
                    if(!"admin".equals(username)){
                        Customers cus=(Customers)session.getAttribute(username);
                        DAOCustomers daoCus=new DAOCustomers();
                        request.setAttribute("username",cus.getFirst_name()+" "+cus.getLast_name());
                    }   
                }
                */
                String username=(String)session.getAttribute("username");
                if(username!=null && !username.isEmpty()){
                    Customers cus=(Customers)session.getAttribute(username);
                    request.setAttribute("fullname",cus.getFirst_name()+" "+cus.getLast_name());
                   
                    request.setAttribute("rollNumber", String.valueOf(cus.getCustomer_id()));
                    request.setAttribute("username", username);
                    //request.setAttribute("username", username);
                }
                request.setAttribute("notiCart", notiCart);
                
                //get all brand name
                ResultSet vector1=dao.getData("select distinct(brand_name) from products");
                request.setAttribute("brandList",vector1);
                
                //dispath.forward(request, response);
                //dispath(request, response, "/JSP/itemList.jsp");
                dispath(request, response, "/JSP/index.jsp");
            } else if (service.equalsIgnoreCase("add2cart")) {
                HttpSession session = request.getSession();
                String key = request.getParameter("id");
                ResultSet rs = dao.getData("select *from Products where product_id=" + key);
                List<String> list=new ArrayList<>();
                // id - key
                //get infor of product: name, price, images...
                // create product 
                Object value = session.getAttribute(key);
                
                //list=(ArrayList<String>)session.getAttribute(key);
                if(value==null){
                    list.add("1");
                    if(rs.next()){
                        list.add(rs.getString(2));
                        list.add(rs.getString(4));
                    }
                    session.setAttribute(key, list);
                }else{
                    list=(ArrayList<String>)value;
                    int count = Integer.parseInt(list.get(0))+1;
                    list.set(0, String.valueOf(count));
                }
                //ArrayList<String> list1 = (ArrayList<String>)session.getAttribute(key);
                //getKey(id)
                //Products pro=(Products)session.getAttribute(key);
                //the first time the product is selected
//                list.add("2");
//                    if(rs.next()){
//                        list.add(rs.getString(2));
//                        list.add(rs.getString(4));
//                    }
//                session.setAttribute(key, list);
                

//                  Object value = session.getAttribute(key);
//                if(value==null){
//            //set quantity of product is 1
//		//put name-value pair into session object (see HttpSession)
//		session.setAttribute(key,"1"); // put(key,value)
////                pro.setQuantity(1);
////                session.setAttribute(id,pro);
//	}
//	//the second/third... time the product is selected
//	else{
//		int count = Integer.parseInt(
//                        value.toString())+1;
////                pro.setQuantitty(pro.getQuantity()+1);
//		//put name-value pair into session object (see HttpSession)
//		session.setAttribute(key,String.valueOf(count));
////                session.setAttribute(id,pro);
//		
//	}	
                String str = "ControllerCart?notiCart=" + "Item with id=" + key + " was added to the Shopping Cart";
                response.sendRedirect(str);

            } else if (service.equalsIgnoreCase("showcart")) {
                HttpSession session = request.getSession();
                Enumeration em = session.getAttributeNames();
                
                request.setAttribute("Cart", em);
//                int checkCart = checkCart(request, response);
//                request.setAttribute("checkCart", checkCart);
                dispath(request, response, "/JSP/showCart.jsp");
            }else if(service.equalsIgnoreCase("remove")){
                HttpSession session = request.getSession();
                String id=request.getParameter("id");
                session.removeAttribute(id);
                response.sendRedirect("ControllerCart?s=showcart");
            }else if(service.equalsIgnoreCase("remove_all")){
                HttpSession session = request.getSession();
                Enumeration em = session.getAttributeNames();
                String username =(String)session.getAttribute("username");
                while(em.hasMoreElements()){
                    String key=em.nextElement().toString();
                    if(!key.equalsIgnoreCase(username) && !key.equalsIgnoreCase("username")){
                        session.removeAttribute(key);
                    }
                }
                response.sendRedirect("ControllerCart?s=showcart");
            }else if(service.equalsIgnoreCase("updateQuantity")){
                HttpSession session = request.getSession();
                Enumeration em = session.getAttributeNames();
                String username =(String)session.getAttribute("username");
                List<String> list = new ArrayList();
                while(em.hasMoreElements()){
                    String key=em.nextElement().toString();
                    if(!key.equalsIgnoreCase(username) && !key.equalsIgnoreCase("username")){
                        String quantity=request.getParameter(key);
                        if(quantity!=null){
                            Object value = session.getAttribute(key); //get value
                            list = (ArrayList<String>) value;
                            list.set(0,quantity);
                            //session.setAttribute(key, Integer.parseInt(quantity));
                        }
                    }
                }
                response.sendRedirect("ControllerCart?s=showcart");
                //request.setAttribute("Cart", em);
//                int checkCart = checkCart(request, response);
//                request.setAttribute("checkCart", checkCart);
                //dispath(request, response, "/JSP/showCart.jsp");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ControllerCart.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }

    private void checkEmpty(String value, String alert, HttpServletResponse response) {
        PrintWriter out;
        try {
            out = response.getWriter();
            if (value == null || value.equals("")) {
                out.print("<p style='color:red'>" + alert + " is not empty" + "</p>");
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    private boolean checkDigit(String number) {
        try {
            Double.parseDouble(number);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public void dispath(HttpServletRequest request, HttpServletResponse response, String page)
            throws ServletException, IOException {
        //select jsp to view
        RequestDispatcher dispath
                = request.getRequestDispatcher(page);
        //run
        dispath.forward(request, response);
    }
    
    private int checkCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Enumeration em = session.getAttributeNames();
        int count=0;
            while (em.hasMoreElements())
            {
                em.nextElement();
                count++;
            }
        return count;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
