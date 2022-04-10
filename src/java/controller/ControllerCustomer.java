/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Customers;
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
import model.DAOCustomers;

/**
 *
 * @author LAPTOP VINH HA
 */
@WebServlet(name = "ControllerCustomer", urlPatterns = {"/ControllerCustomer"})
public class ControllerCustomer extends HttpServlet {

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

        DAOCustomers dao = new DAOCustomers();
        String service = request.getParameter("s");
        String search = request.getParameter("search");
        if (service == null) {
            service = "display";
        }
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if (service.equalsIgnoreCase("insert")) {
                String submit = request.getParameter("submit");
                if (submit == null) {
                    ResultSet rs = dao.getData("select MAX(customer_id)+1 from customers");
                    String customer_id = "";
                    try {
                        if (rs.next()) {
                            customer_id = rs.getString(1);
                        }
                    } catch (SQLException ex) {
                        Logger.getLogger(ControllerCustomer.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    ResultSet rs1 = dao.getData("select distinct(city) from customers");
                    ResultSet rs2 = dao.getData("select distinct(state) from customers");

                    ResultSet rs3 = dao.getData("select distinct(zip_code) from customers");

                    request.setAttribute("customer_id", customer_id);
                    request.setAttribute("CityList", rs1);
                    request.setAttribute("StateList", rs2);
                    request.setAttribute("Zip_codeList", rs3);
                    dispath(request, response, "/JSP/addCustomer.jsp");
                } else {
                    String customer_id = request.getParameter("customer_id");
                    String first_name = request.getParameter("fname");
                    String last_name = request.getParameter("lname");
                    String phone = request.getParameter("phone");
                    String email = request.getParameter("email");
                    String street = request.getParameter("street");
                    String city = request.getParameter("city");
                    String state = request.getParameter("state");
                    String zip_code = request.getParameter("zip_code");
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    
                    ResultSet rs = dao.getData("select *from Customers where username='" + username + "'");
                    try {
                        if (!rs.next()) {
                            //no duplicate
                            //add
                            int customer_idI = Integer.parseInt(customer_id);
                            int n = dao.addCustomer(new Customers(customer_idI, first_name, last_name, phone, email, street, city, state, zip_code, username, password));
                            if (n > 0) {
                                response.sendRedirect("ControllerLogin?success=register success bru..");
                            }
                        } else {
                            //duplicate
                            //back with error mess
                            int customer_idI = Integer.parseInt(customer_id);
                            Customers cus = new Customers(customer_idI, first_name, last_name, phone, email, street, city, state, zip_code, username, password);
                            request.setAttribute("InforCus", cus);
                            
                            ResultSet rs1 = dao.getData("select distinct(city) from customers");
                            ResultSet rs2 = dao.getData("select distinct(state) from customers");
                            ResultSet rs3 = dao.getData("select distinct(zip_code) from customers");

                            request.setAttribute("customer_id", customer_id);
                            request.setAttribute("CityList", rs1);
                            request.setAttribute("StateList", rs2);
                            request.setAttribute("Zip_codeList", rs3);
                            
                            String error = "";
                            dispath(request, response, "/JSP/addCustomer.jsp?error=username existed");

                        }
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }

                    //validate
                    checkEmpty(customer_id, "customer id", response);
                    checkEmpty(first_name, "first name", response);
                    checkEmpty(last_name, "last name", response);
                    checkEmpty(phone, "phone", response);
                    checkEmpty(email, "email", response);
                    checkEmpty(street, "street", response);
                    checkEmpty(city, "city", response);
                    checkEmpty(state, "state", response);
                    checkEmpty(zip_code, "zip code", response);
                    int check = checkNumber(customer_id, "customer id");
                    if (check == 0) {
                        out.println("<p style='color:red'>customer id must be a digit</p>");
                    }

                    check = checkNumber(customer_id, "customer id");
                    if (check == 0) {
                        out.println("<p style='color:red'>zip code must be a digit</p>");
                    }

                    //int n = dao.addCustomer(new Customers(Integer.parseInt(customer_id), first_name, last_name, phone, email, street, city, state, zip_code));
//                    if (n > 0) {
//                        out.println("<h2 style='color:green'>inserted</h2>");
//                    }
                }
            }
            if (service.equalsIgnoreCase("display")) {
                Vector<Customers> vector;
                if (search == null) {
                    vector = dao.listAll("select *from Customers");
                } else {
                    String name = request.getParameter("cname");
                    vector = dao.searchCus(name);
                }
                String titlepage = "Customers page";
                String titletable = "Customers list";

                //RequestDispatcher dispath=request.getRequestDispatcher();
                request.setAttribute("customerlist", vector);
                request.setAttribute("titlepage", titlepage);
                request.setAttribute("titletable", titletable);

                //dispath.forward(request, response);
                dispath(request, response, "/JSP/displayCustomers.jsp");

            }

            if (service.equalsIgnoreCase("update")) {

                String submit = request.getParameter("submit");
                if (submit == null) {
                    String id = request.getParameter("id");
                    ResultSet rs = dao.getData("select *from Customers where Customer_id=" + id);
                    ResultSet rs1 = dao.getData("select distinct(city) from customers");
                    ResultSet rs2 = dao.getData("select distinct(state) from customers");

                    ResultSet rs3 = dao.getData("select distinct(zip_code) from customers");

                    request.setAttribute("CustomerList", rs);
                    request.setAttribute("CityList", rs1);
                    request.setAttribute("StateList", rs2);
                    request.setAttribute("Zip_codeList", rs3);
                    dispath(request, response, "/JSP/updateCustomer.jsp");

                } else {
                    String customer_id = request.getParameter("customer_id");
                    String first_name = request.getParameter("fname");
                    String last_name = request.getParameter("lname");
                    String phone = request.getParameter("phone");
                    String email = request.getParameter("email");
                    String street = request.getParameter("street");
                    String city = request.getParameter("city");
                    String state = request.getParameter("state");
                    String zip_code = request.getParameter("zip_code");

                    //validate
                    checkEmpty(customer_id, "customer id", response);
                    checkEmpty(first_name, "first name", response);
                    checkEmpty(last_name, "last name", response);
                    checkEmpty(phone, "phone", response);
                    checkEmpty(email, "email", response);
                    checkEmpty(street, "street", response);
                    checkEmpty(city, "city", response);
                    checkEmpty(state, "state", response);
                    checkEmpty(zip_code, "zip code", response);
                    int check = checkNumber(customer_id, "customer id");
                    if (check == 0) {
                        out.println("<p style='color:red'>customer id must be a digit</p>");
                    }

                    check = checkNumber(customer_id, "customer id");
                    if (check == 0) {
                        out.println("<p style='color:red'>zip code must be a digit</p>");
                    }
//                    int n = dao.updateCustomer(new Customers(Integer.parseInt(customer_id), first_name, last_name, phone, email, street, city, state, zip_code));
//                    if (n > 0) {
//                        response.sendRedirect("ControllerCustomer");
//                    }
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
            Logger.getLogger(ControllerCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private int checkNumber(String value, String alert) {
        int n = 0;
        try {
            n = Integer.parseInt(value);
        } catch (Exception e) {
            return 0;
        }
        return n;
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
