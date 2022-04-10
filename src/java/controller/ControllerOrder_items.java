/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Order_items;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAOOrder_items;

/**
 *
 * @author LAPTOP VINH HA
 */
@WebServlet(name = "ControllerOrder_items", urlPatterns = {"/ControllerOrder_items"})
public class ControllerOrder_items extends HttpServlet {

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
        DAOOrder_items dao = new DAOOrder_items();
        String service = request.getParameter("s");
        String search = request.getParameter("search");
        if (service == null) {
            service = "display";
        }
        try (PrintWriter out = response.getWriter()) {
            if (service.equalsIgnoreCase("insert")) {
                String order_id = request.getParameter("order_id");
                String item_id = request.getParameter("item_id");
                String product_id = request.getParameter("product_id");
                String quantity = request.getParameter("quantity");
                String list_price = request.getParameter("list_price");
                String discount = request.getParameter("discount");

                int order_idI = Integer.parseInt(order_id);
                int item_idI = Integer.parseInt(order_id);
                int product_idI = Integer.parseInt(order_id);
                int quantityI = Integer.parseInt(order_id);
                double list_priceD = Double.parseDouble(list_price);
                double discountD = Double.parseDouble(discount);

                int n = dao.addOrder_item(new Order_items(order_idI, item_idI, product_idI, quantityI, list_priceD, discountD));
                if (n > 0) {
                    out.println("<h2 style='color:green'>inserted</h2>");
                }
            } else if (service.equalsIgnoreCase("display")) {
                Vector<Order_items> vector = dao.listAll("select *from Order_items");
                String titlepage="Order_items page";
                String titletable="Order_items table";
                
                
                RequestDispatcher dispath=request.getRequestDispatcher("/JSP/displayOrder_items.jsp");
                request.setAttribute("Order_itemsList", vector);
                request.setAttribute("titlepage",titlepage );
                request.setAttribute("titletable", titletable);
                
                dispath.forward(request, response);
            } else if (service.equalsIgnoreCase("update")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    String idOrder = request.getParameter("idOrder");
                    String idItem = request.getParameter("idItem");
                    ResultSet rs = dao.getData("select *from Order_items where order_id=" + idOrder + " and item_id=" + idItem);
                    ResultSet rs1 = dao.getData("select distinct(item_id) from order_items");
                    ResultSet rs2 = dao.getData("select product_id, product_name from Products");
                    
                    request.setAttribute("Order_itemList", rs);
                    request.setAttribute("ItemList", rs1);
                    request.setAttribute("ProductList", rs2);
                    
                    dispath(request, response, "/JSP/updateOrder_item.jsp");

                } else {
                    String order_id = request.getParameter("order_id");
                    String item_id = request.getParameter("item_id");
                    String product_id = request.getParameter("product_id");
                    String quantity = request.getParameter("quantity");
                    String list_price = request.getParameter("list_price");
                    String discount = request.getParameter("discount");

                    int order_idI = Integer.parseInt(order_id);
                    int item_idI = Integer.parseInt(item_id);
                    int product_idI = Integer.parseInt(product_id);
                    int quantityI = Integer.parseInt(quantity);
                    double list_priceD = Double.parseDouble(list_price);
                    double discountD = Double.parseDouble(discount);

                    int n = dao.updateOrder_items(new Order_items(order_idI, item_idI, product_idI, quantityI, list_priceD, discountD));
                    if (n > 0) {
                        response.sendRedirect("ControllerOrder_items");
                    }
                }

            }
        }
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
    
    public void dispath(HttpServletRequest request, HttpServletResponse response,String page) 
            throws ServletException, IOException
            {
        //select jsp to view
                RequestDispatcher dispath
                        = request.getRequestDispatcher(page);
                //run
                dispath.forward(request, response);
    }
}
