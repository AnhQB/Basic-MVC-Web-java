/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Stocks;
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
import model.DAOStocks;

/**
 *
 * @author LAPTOP VINH HA
 */
@WebServlet(name = "ControllerStocks", urlPatterns = {"/ControllerStocks"})
public class ControllerStocks extends HttpServlet {

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
        
        DAOStocks dao = new DAOStocks();
        String service = request.getParameter("s");
        if (service == null) {
            service = "display";
        }
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //DAOStocks dao = new DAOStocks();
            if (service.equalsIgnoreCase("insert")) {
                String store_id = request.getParameter("store_id");
                String product_id = request.getParameter("product_id");
                String quantity = request.getParameter("quantity");
                
                checkEmpty(store_id, "store id", response);
                checkEmpty(product_id, "product id", response);
                checkEmpty(quantity, "quantity", response);
                
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet ControllerStocks</title>");
                out.println("</head>");
                out.println("<body>");
                
                out.println("<h2>" + store_id + "</h2>");
                out.println("<h2>" + product_id + "</h2>");
                out.println("<h2>" + quantity + "</h2>");
                int n = dao.addStock(new Stocks(Integer.parseInt(store_id), Integer.parseInt(product_id),
                        Integer.parseInt(quantity)));
                if (n > 0) {
                    out.println("<h2 style='color:green'>inserted</h2>");
                }
                
                out.println("</body>");
                out.println("</html>");
            }
            
            if (service.equalsIgnoreCase("display")) {
                Vector<Stocks> vector = dao.listAll("select *from Stocks");
                String titlepage="Stock page";
                String titletable="Stock table";
                ResultSet rs1 = dao.getData("select *from Stores");
                ResultSet rs2 = dao.getData("select *from Products");
                
                request.setAttribute("StockList", vector);
                request.setAttribute("StoreList", rs1);
                request.setAttribute("ProductList", rs2);
                request.setAttribute("titlepage", titlepage);
                request.setAttribute("titletable", titletable);
                dispath(request, response, "/JSP/displayStocks.jsp");
                
            }
            if (service.equalsIgnoreCase("update")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    String idStore = request.getParameter("idStore");
                    String idProduct = request.getParameter("idProduct");
                    ResultSet rs = dao.getData("select *from Stocks where store_id=" + idStore + " and product_id=" + idProduct);
                    ResultSet rs1 = dao.getData("select store_id, store_name from stores");
                    ResultSet rs2 = dao.getData("select product_id,product_name from products");
                    
                    request.setAttribute("StockList", rs);
                    request.setAttribute("StoreList", rs1);
                    request.setAttribute("ProductList", rs2);
                    
                    dispath(request, response, "/JSP/updateStock.jsp");
                   
                } else {
                    String store_id = request.getParameter("store_id");
                    String product_id = request.getParameter("product_id");
                    String quantity = request.getParameter("quantity");
                    
                    checkEmpty(store_id, "store id", response);
                    checkEmpty(product_id, "product id", response);
                    checkEmpty(quantity, "quantity", response);
                    int n = dao.updateStock(new Stocks(Integer.parseInt(store_id), Integer.parseInt(product_id),
                            Integer.parseInt(quantity)));
                    if (n > 0) {
                        response.sendRedirect("ControllerStocks");
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
