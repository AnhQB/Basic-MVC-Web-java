/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Customers;
import entity.Order_items;
import entity.Orders;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAOOrder_items;
import model.DAOOrders;

/**
 *
 * @author LAPTOP VINH HA
 */
@WebServlet(name = "ControllerLogout", urlPatterns = {"/ControllerLogout"})
public class ControllerLogout extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            if (!username.equalsIgnoreCase("admin")) {
                if (checkCart(request, response)) {
                    DAOOrders daoOrder = new DAOOrders();
                    DAOOrder_items daoOItem = new DAOOrder_items();
                    //get orderid
                    ResultSet rs = daoOrder.getData("select MAX(order_id) from orders");
                    int orderId = 0;
                    if (rs.next()) {
                        orderId = rs.getInt(1) + 1;
                    }
                    //get value cus
                    Customers cus = (Customers) session.getAttribute(username);
                    //get date 
                    String order_date = getDate();
                    daoOrder.addOrder(new Orders(orderId, cus.getCustomer_id(), 1, order_date, order_date, null, 1, 1));
                    //add to order item
                    Enumeration em = session.getAttributeNames();
                    List<String> list;
                    int n = 0;
                    while (em.hasMoreElements()) {
                        String key = em.nextElement().toString();

                        if (!key.equalsIgnoreCase(username) && !key.equalsIgnoreCase("username")) {
                            //get value of key id
                            int productId = Integer.parseInt(key.trim());
                            Object value = session.getAttribute(key); //get value
                            list = (ArrayList<String>) value;
                            int quantity = Integer.parseInt(list.get(0));
                            double price = Double.parseDouble(list.get(2));
                            n = daoOItem.addOrder_item(new Order_items(orderId, productId, productId, quantity, price, 0));
                            
                        }
                    }
                    
                    if (n > 0) {
                        logout(request, response, session);
                    }
                } else {//cart empty
                    logout(request, response, session);
                }
                //String username=(String)session.getAttribute("username");
                //out.print(username);
            } else if(username.equalsIgnoreCase("admin")) {
                logout(request, response, session);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ControllerLogout.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getDate() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
        Date dateNow = java.util.Calendar.getInstance().getTime();
        String dateStr = df.format(dateNow);
        return dateStr;
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

    private boolean checkCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Enumeration em = session.getAttributeNames();
        String username = (String) session.getAttribute("username");
        int n = 0;
        while (em.hasMoreElements()) {
            String key = em.nextElement().toString();
            if (!key.equalsIgnoreCase(username) && !key.equalsIgnoreCase("username")) {
                n = 1;
                break;
            }
        }
        return n == 1;
    }

    private void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws ServletException, IOException {
        session.invalidate();
        session = request.getSession();
        if (session.getAttribute("username") == null || session.getAttribute("username").equals("")) {
            response.sendRedirect("ControllerCart");
        }
    }
    
    public void dispath(HttpServletRequest request, HttpServletResponse response, String page)
            throws ServletException, IOException {
        //select jsp to view
        RequestDispatcher dispath
                = request.getRequestDispatcher(page);
        //run
        dispath.forward(request, response);
    }

}
