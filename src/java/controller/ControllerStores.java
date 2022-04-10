/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Stores;
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
import model.DAOStores;

/**
 *
 * @author LAPTOP VINH HA
 */
@WebServlet(name = "ControllerStores", urlPatterns = {"/ControllerStores"})
public class ControllerStores extends HttpServlet {

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
        DAOStores dao = new DAOStores();
        String service = request.getParameter("s");
        if (service == null) {
            service = "display";
        }
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //DAOStores dao = new DAOStores();
            if (service.equalsIgnoreCase("insert")) {
                String store_id = request.getParameter("store_id");
                String store_name = request.getParameter("store_name");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String street = request.getParameter("street");
                String city = request.getParameter("city");
                String state = request.getParameter("state");
                String zip_code = request.getParameter("zip_code");
                
                checkEmpty(store_id, "store id", response);
                checkEmpty(store_name, "store name", response);
                checkEmpty(phone, "phone", response);
                checkEmpty(email, "email", response);
                checkEmpty(street, "street", response);
                checkEmpty(city, "city", response);
                checkEmpty(state, "state", response);
                checkEmpty(zip_code, "zip code", response);
                
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet ControllerStores</title>");
                out.println("</head>");
                out.println("<body>");
                
                out.println("<h2>" + store_name + "</h2>");
                out.println("<h2>" + phone + "</h2>");
                out.println("<h2>" + email + "</h2>");
                out.println("<h2>" + street + "</h2>");
                out.println("<h2>" + city + "</h2>");
                out.println("<h2>" + state + "</h2>");
                out.println("<h2>" + zip_code + "</h2>");
                
                int n = dao.addStore(new Stores(Integer.parseInt(store_id), store_name, phone, email,
                        street, city, state, zip_code));
                if (n > 0) {
                    out.println("<h2 style='color:green'>inserted</h2>");
                }
                
                out.println("</body>");
                out.println("</html>");
            }
            
            if (service.equalsIgnoreCase("display")) {
                Vector<Stores> vector = dao.listAll("select *from Stores");
                String titlepage="Store page";
                String titletable="Store table";
                
                RequestDispatcher dispath=request.getRequestDispatcher("/JSP/displayStores.jsp");
                request.setAttribute("StoreList", vector);
                request.setAttribute("titlepage", titlepage);
                request.setAttribute("titletable", titletable);
                dispath.forward(request, response);
            }
            
            if (service.equalsIgnoreCase("update")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    String id = request.getParameter("id");
                    ResultSet rsStore = dao.getData("select *from Stores where store_id=" + id);
                    ResultSet rsState = dao.getData("select distinct(state) from stores");
                    ResultSet rsCode = dao.getData("select distinct(zip_code) from stores");
                    
                    request.setAttribute("StoreList", rsStore);
                    request.setAttribute("StateList", rsState);
                    request.setAttribute("Zip_CodeList", rsCode);
                    
                    dispath(request, response, "/JSP/updateStore.jsp");
                    
                }else{
                    String store_id = request.getParameter("store_id");
                String store_name = request.getParameter("store_name");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String street = request.getParameter("street");
                String city = request.getParameter("city");
                String state = request.getParameter("state");
                String zip_code = request.getParameter("zip_code");
                
                checkEmpty(store_id, "store id", response);
                checkEmpty(store_name, "store name", response);
                checkEmpty(phone, "phone", response);
                checkEmpty(email, "email", response);
                checkEmpty(street, "street", response);
                checkEmpty(city, "city", response);
                checkEmpty(state, "state", response);
                checkEmpty(zip_code, "zip code", response);
                int n = dao.updateStore(new Stores(Integer.parseInt(store_id), store_name, phone, email,
                        street, city, state, zip_code));
                if (n > 0) {
                    response.sendRedirect("ControllerStores");
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
