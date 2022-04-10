/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Customers;
import entity.Staffs;
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
import javax.servlet.http.HttpSession;
import model.DAOCustomers;
import model.DAOStaffs;

/**
 *
 * @author LAPTOP VINH HA
 */
@WebServlet(name = "ControllerLogin", urlPatterns = {"/ControllerLogin"})
public class ControllerLogin extends HttpServlet {

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
        DAOCustomers daoCus = new DAOCustomers();
        DAOStaffs daoSta = new DAOStaffs();
        HttpSession session = request.getSession();

        String service = request.getParameter("s");
        if (service == null) {
            service = "login";
        }
        try (PrintWriter out = response.getWriter()) {
            if (service.equalsIgnoreCase("login")) {
                //session = request.getSession();
                //check logged
                if (session.getAttribute("username") != null ) {
                    //response.sendRedirect("ControllerCart");
                    String username = (String)session.getAttribute("username");
                    int n = daoCus.checkAccount(username);
                    int n1 = daoSta.checkAccount(username);
                    if(n>0){
                        response.sendRedirect("ControllerCart");
                    }
                    else if(n1>0){
                        dispath(request, response, "/JSP/admin_index.jsp");
                    }else{
                        dispath(request, response, "/JSP/login.jsp");
                    }
                }else{
//                    String success=request.getParameter("success");
//                    if(success!=null){
//                        request.setAttribute("success", success);
//                    }
                    dispath(request, response, "/JSP/login.jsp");
                }
                
                //dispath(request, response, "/JSP/login.jsp");
            } else if (service.equalsIgnoreCase("processLogin")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                int n = daoCus.checkAccount(username, password);
                int n1 = daoSta.checkAccount(username, password);
                if (n > 0) {
                    //HttpSession session = request.getSession();
                    //add cus session
                    ResultSet rsCus=daoCus.getData("select *from Customers where username='" + username+"'");
                    Vector<Customers> vec = new Vector<>();
                    if(rsCus.next()){
                        vec = daoCus.searchCus(rsCus.getInt(1));
                    }
                    session.setAttribute("username", username);
                    session.setAttribute(username, vec.get(0));
                    response.sendRedirect("ControllerCart");
                } else if (n1 > 0) {
                    //HttpSession session = request.getSession();
                    //add staff session
                    ResultSet rsStaf=daoCus.getData("select *from Staffs where username='" + username+"'");
                    Vector<Staffs> vec = new Vector<>();
                    if(rsStaf.next()){
                        vec = daoSta.searchStaff(rsStaf.getInt(1));
                    }
                    //Staffs sta = (Staffs) daoSta.getData("select *from Staffs where username='" + username+"'");
                    session.setAttribute("username", username);
                    session.setAttribute(username, vec.get(0));
//                    int idStaff=vec.get(0).getStaff_id();
//                    String staff_Name=vec.get(0).getFirst_name()+" "+vec.get(0).getLast_name();
//                    request.setAttribute("id", String.valueOf(idStaff));
//                    request.setAttribute("name", staff_Name);
//                    request.setAttribute("username",username);
                    dispath(request, response, "/JSP/admin_index.jsp");
                } else {
                    //back to login
                    ResultSet rsCus = daoCus.getData("select *from Customers where username='" + username+"'");
                    ResultSet rsStaf = daoSta.getData("select *from Staffs where username='" + username+"'");
                    try {
                        if (rsCus.next() == false && rsStaf.next() == false) {
                            String str="ControllerLogin?error=The username you entered isn't connected to an account.";
                            response.sendRedirect(str);
                            
                        } else {
                            String str="ControllerLogin?error=Passsword is wrong you ui !&username="+username;
                            //request.setAttribute("username", username);
                            response.sendRedirect(str);
                        }

                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                }
            }else if(service.equalsIgnoreCase("home")){
                dispath(request, response, "/JSP/admin_index.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ControllerLogin.class.getName()).log(Level.SEVERE, null, ex);
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
