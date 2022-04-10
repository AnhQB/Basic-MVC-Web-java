/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Orders;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAOOrders;

/**
 *
 * @author LAPTOP VINH HA
 */
@WebServlet(name = "ControllerOrders", urlPatterns = {"/ControllerOrders"})
public class ControllerOrders extends HttpServlet {

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
        DAOOrders dao = new DAOOrders();
        String service = request.getParameter("s");
        String search =request.getParameter("search");
        if (service == null) {
            service = "display";
        }
        try (PrintWriter out = response.getWriter()) {
            if (service.equalsIgnoreCase("insert")) {
                String order_id = request.getParameter("order_id");
                String customer_id = request.getParameter("customer_id");
                String order_status = request.getParameter("order_status");
                String order_date = request.getParameter("order_date");
                String required_date = request.getParameter("required_date");
                String shipped_date = request.getParameter("shipped_date");
                String store_id = request.getParameter("store_id");
                String staff_id = request.getParameter("staff_id");

                int order_idI = Integer.parseInt(order_id);
                int customer_idI = Integer.parseInt(customer_id);
                int order_statusI = Integer.parseInt(order_status);
                int store_idI = Integer.parseInt(store_id);
                int staff_idI = Integer.parseInt(staff_id);

                int n = dao.addOrder(new Orders(order_idI, customer_idI, order_statusI, order_date, required_date, shipped_date, store_idI, staff_idI));
                if (n > 0) {
                    out.println("<h2 style='color:green'>inserted</h2>");
                }
            } else if (service.equalsIgnoreCase("display")) {
                //Vector<Orders> vector= dao.listAll("select *from Orders");
                Vector<Orders> vector=new Vector<>();
                String status=request.getParameter("sta");
                //int statusI=0;
                
                String id=request.getParameter("id");
                if(search==null||id.isEmpty()){
                    vector= dao.listAll("select *from Orders");
                }
                else{
                    int idI=Integer.parseInt(id);
                    vector=dao.searchOrder(idI);
                }
                
                if(status!=null){
                    //statusI=Integer.parseInt(status);
                    vector=dao.listAll("select *from Orders where order_status="+status);
                    
                }
                ResultSet rsCus=dao.getData("select *from customers");
                ResultSet rsSto=dao.getData("select *from stores");
                ResultSet rsStatus=dao.getData("select distinct(order_status) from orders");
                
                
                String titlepage = "Order page";
                String titletable = "Order table";
                
                RequestDispatcher dispath = request.getRequestDispatcher("/JSP/displayOrders.jsp");
                request.setAttribute("OrderList", vector);
                request.setAttribute("CustomerList", rsCus);
                request.setAttribute("StoreList", rsSto);
                request.setAttribute("StatusList", rsStatus);
                
                request.setAttribute("titlepage", titlepage);
                request.setAttribute("titletable", titletable);
                dispath.forward(request, response);

            } else if (service.equalsIgnoreCase("detail")) {
                String id = request.getParameter("id");
                ResultSet rs = dao.getData("with x as (select *from Orders where order_id="+id
                        + ") select x.order_id,x.customer_id,x.order_status,x.order_date"
                        + ",(c.first_name+' '+c.last_name) as cusname,o.list_price,o.discount,o.quantity"
                        + ",p.product_id,p.product_name"
                        + ",s.store_name  from x "
                        + " left join customers c on c.customer_id=x.customer_id "
                        + " left join order_items o on o.order_id=x.order_id "
                        + " left join products p on p.product_id=o.product_id "
                        + " left join stores s on s.store_id=x.store_id");
                
                ResultSet rsStatus=dao.getData("select distinct(order_status) from orders");
                //RequestDispatcher dispath = request.getRequestDispatcher("/JSP/displayOrderDetail.jsp");
                String titletable = "Order Detail";
                String titlepage = "Order page";

                request.setAttribute("titletable", titletable);
                request.setAttribute("titlepage", titlepage);
                request.setAttribute("OrderList", rs);
                request.setAttribute("titletable", titletable);
                request.setAttribute("StatusList", rsStatus);
                
                dispath(request, response, "/JSP/displayOrderDetail.jsp");
                //dispath.forward(request, response);

            } else if (service.equalsIgnoreCase("update")) {
                String submit = request.getParameter("submit");
                if (submit == null) {

                    String id = request.getParameter("id");
                    ResultSet rs = dao.getData("select *from Orders where order_id=" + id);
                    
                    ResultSet rs1 = dao.getData("select customer_id,first_name,last_name from customers");
                    ResultSet rs2 = dao.getData("select distinct(order_status) from orders");
                    ResultSet rs3 = dao.getData("select store_id,store_name from stores");
                    ResultSet rs4 = dao.getData("select staff_id,first_name,last_name from staffs");
                            
                    request.setAttribute("OrderList", rs);
                    request.setAttribute("CustomerList", rs1);
                    request.setAttribute("OStatusList", rs2);
                    request.setAttribute("StoreList", rs3);
                    request.setAttribute("StaffList", rs4);
                    dispath(request, response, "/JSP/updateOrder.jsp");
                    
                    
                } else {
                    String order_id = request.getParameter("order_id");
                    String customer_id = request.getParameter("customer_id");
                    String order_status = request.getParameter("order_status");
                    String order_date = request.getParameter("order_date");
                    String required_date = request.getParameter("required_date");
                    String shipped_date = request.getParameter("shipped_date");
                    String store_id = request.getParameter("store_id");
                    String staff_id = request.getParameter("staff_id");

                    int order_idI = Integer.parseInt(order_id);
                    int customer_idI = Integer.parseInt(customer_id);
                    int order_statusI = Integer.parseInt(order_status);
                    int store_idI = Integer.parseInt(store_id);
                    int staff_idI = Integer.parseInt(staff_id);

                    int n = dao.updateOrder(new Orders(order_idI, customer_idI, order_statusI, order_date, required_date, shipped_date, store_idI, staff_idI));
                    if (n > 0) {
                        response.sendRedirect("ControllerOrders");
                    }

                }
            }else if(service.equalsIgnoreCase("updateStatus")){
                String id=request.getParameter("id");
                String order_status=request.getParameter("order_status");
                //String detail=request.getap
                
                int n=dao.updateStatus(id,Integer.parseInt(order_status));
                if(n>0 ){
                    response.sendRedirect("ControllerOrders");
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
