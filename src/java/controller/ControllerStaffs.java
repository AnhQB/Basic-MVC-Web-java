/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
import model.DAOStaffs;

/**
 *
 * @author LAPTOP VINH HA
 */
@WebServlet(name = "ControllerStaffs", urlPatterns = {"/ControllerStaffs"})
public class ControllerStaffs extends HttpServlet {

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

            DAOStaffs dao = new DAOStaffs();
            String service = request.getParameter("s");

            if (service == null) {
                service = "DisplayAllStaffs";
            }

            if (service.equalsIgnoreCase("InsertStaffs")) {

                /* TODO output your page here. You may use following sample code. */
                String staff_id = request.getParameter("staff_id");
                String first_name = request.getParameter("fname");
                String last_name = request.getParameter("lname");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String active = request.getParameter("active");
                String store_id = request.getParameter("store_id");
                String manager_id = request.getParameter("manager_id");

                checkEmpty(staff_id, "staff id", response);
                checkEmpty(first_name, "first name", response);
                checkEmpty(last_name, "last name", response);
                checkEmpty(email, "email", response);
                checkEmpty(phone, "phone", response);
                checkEmpty(active, "active", response);
                checkEmpty(store_id, "store id", response);
                checkEmpty(manager_id, "manager id", response);

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet ControllerStaffs</title>");
                out.println("</head>");
                out.println("<body>");

                out.println("<h2>" + first_name + "</h2>");
                out.println("<h2>" + last_name + "</h2>");
                out.println("<h2>" + email + "</h2>");
                out.println("<h2>" + phone + "</h2>");
                out.println("<h2>" + active + "</h2>");
                out.println("<h2>" + store_id + "</h2>");
                out.println("<h2>" + manager_id + "</h2>");
                int n = dao.addStaff(new Staffs(Integer.parseInt(staff_id), first_name, last_name,
                        email, phone, Integer.parseInt(active), Integer.parseInt(store_id),
                        Integer.parseInt(manager_id)));
                if (n > 0) {
                    out.println("<h2 style='color:green'>inserted</h2>");
                }

                out.println("</body>");
                out.println("</html>");

            }

            if (service.equalsIgnoreCase("DisplayAllStaffs")) {
                //display
                Vector<Staffs> vector = dao.listAll("select *from Staffs");
                String titlepage = "staffs page";
                String titletable = "staffs list";

                //select jsp to view
//                RequestDispatcher dispath
//                        = request.getRequestDispatcher();
                request.setAttribute("stafflist", vector);
                request.setAttribute("titlepage", titlepage);
                request.setAttribute("titletable", titletable);
                
                dispath(request, response, "/JSP/displayStaffs.jsp");
                //run
                //dispath.forward(request, response);
            }
            if (service.equalsIgnoreCase("updateStaffs")) {

                String submit = request.getParameter("submit");
                if (submit == null) {
                    String id = request.getParameter("staffID");
                    ResultSet rs = dao.getData("select *from staffs where staff_id=" + id);

                    ResultSet rs1 = dao.getData("select *from stores");

                    ResultSet rs2 = dao.getData("with x as (select distinct(manager_id)from staffs)\n"
                            + "select s.first_name,s.last_name,x.manager_id from staffs s\n"
                            + "right join x on x.manager_id=s.staff_id");
//                            int tmp;
//                            while (rs2.next()) {
//
//                                if (rs2.getString(3) == null) {
//                                    tmp = 0;
//                                } else {
//                                    tmp = rs2.getInt(3);
//                                }
//
//                            }
                    request.setAttribute("StaffList", rs);
                    request.setAttribute("StoreList", rs1);
                    request.setAttribute("ManagerList", rs2);
                    dispath(request, response, "/JSP/updateStaff.jsp");

                } else {
                    String staff_id = request.getParameter("staff_id");
                    String first_name = request.getParameter("fname");
                    String last_name = request.getParameter("lname");
                    String email = request.getParameter("email");
                    String phone = request.getParameter("phone");
                    String active = request.getParameter("active");
                    String store_id = request.getParameter("store_id");
                    String manager_id = request.getParameter("manager_id");

                    checkEmpty(staff_id, "staff id", response);
                    checkEmpty(first_name, "first name", response);
                    checkEmpty(last_name, "last name", response);
                    checkEmpty(email, "email", response);
                    checkEmpty(phone, "phone", response);
                    checkEmpty(active, "active", response);
                    checkEmpty(store_id, "store id", response);
                    checkEmpty(manager_id, "manager id", response);

                    int n = dao.updateStaff(new Staffs(Integer.parseInt(staff_id), first_name, last_name,
                            email, phone, Integer.parseInt(active), Integer.parseInt(store_id),
                            Integer.parseInt(manager_id)));
                    if (n > 0) {
                        response.sendRedirect("ControllerStaffs");
                    }
                    //response.sendRedirect("ControllerStaffs");
                }
            }

            if (service.equalsIgnoreCase("deleteStaffs")) {
                String id = request.getParameter("staffID");
                dao.removeStaff(Integer.parseInt(id));
                response.sendRedirect("ControllerStaffs");
            }
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
}
