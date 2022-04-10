/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Products;
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
import model.DAOProducts;

/**
 *
 * @author LAPTOP VINH HA
 */
@WebServlet(name = "ControllerProducts", urlPatterns = {"/ControllerProducts"})
public class ControllerProducts extends HttpServlet {

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
        if (service == null) {
            service = "display";
        }

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //DAOProducts dao = new DAOProducts();
            if (service.equalsIgnoreCase("insert")) {
                String product_id = request.getParameter("product_id");
                String product_name = request.getParameter("pname");
                String model_year = request.getParameter("model_year");
                String list_price = request.getParameter("list_price");
                String brand_name = request.getParameter("brand_name");
                String category_name = request.getParameter("cname");

                checkEmpty(product_id, "product id", response);
                checkEmpty(product_name, "product name", response);
                checkEmpty(model_year, "model year", response);
                checkEmpty(list_price, "list price", response);
                checkEmpty(brand_name, "brand name", response);
                checkEmpty(category_name, "category name", response);

                out.println("<h2>" + product_name + "</h2>");
                out.println("<h2>" + model_year + "</h2>");
                out.println("<h2>" + list_price + "</h2>");
                out.println("<h2>" + brand_name + "</h2>");
                out.println("<h2>" + category_name + "</h2>");

                int n = dao.addProduct(new Products(Integer.parseInt(product_id), product_name,
                        Integer.parseInt(model_year), Integer.parseInt(list_price), brand_name, category_name));
                if (n > 0) {
                    out.println("<h2 style='color:green'>inserted</h2>");
                }

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet ControllerProducts</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("</body>");
                out.println("</html>");
            }

            if (service.equalsIgnoreCase("display")) {
                String titlepage="Product page";
                String titletable="Product table";
                Vector<Products> vector=new Vector<>();
                String pname="";
                String from="",to="";
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
                    }
                }
                RequestDispatcher dispath=request.getRequestDispatcher("/JSP/displayProducts.jsp");
                request.setAttribute("ProductList", vector);
                request.setAttribute("titlepage", titlepage);
                request.setAttribute("titletable", titletable);
                request.setAttribute("pname", pname);
                request.setAttribute("from", from);
                request.setAttribute("to", to);
                dispath.forward(request, response);
            }

            if (service.equalsIgnoreCase("update")) {
                String submit = request.getParameter("submit");
                if (submit == null) {

                    String id = request.getParameter("id");
                    ResultSet rsPro = dao.getData("select *from Products where product_id=" + id);
                    ResultSet rsBrand = dao.getData("select distinct(brand_name) from products");
                    ResultSet rsCate = dao.getData("select distinct(category_name) from products");
                    
                    request.setAttribute("ProductList", rsPro);
                    request.setAttribute("BrandList", rsBrand);
                    request.setAttribute("CateList", rsCate);
                    
                    dispath(request, response, "/JSP/updateProduct.jsp");
                } else {
                    String product_id = request.getParameter("product_id");
                    String product_name = request.getParameter("pname");
                    String model_year = request.getParameter("model_year");
                    String list_price = request.getParameter("list_price");
                    String brand_name = request.getParameter("brand_name");
                    String category_name = request.getParameter("cname");

                    checkEmpty(product_id, "product id", response);
                    checkEmpty(product_name, "product name", response);
                    checkEmpty(model_year, "model year", response);
                    checkEmpty(list_price, "list price", response);
                    checkEmpty(brand_name, "brand name", response);
                    checkEmpty(category_name, "category name", response);

                    int n = dao.updateProduct(new Products(Integer.parseInt(product_id), product_name,
                            Integer.parseInt(model_year), Double.parseDouble(list_price), brand_name, category_name));
                    if (n > 0) {
                        response.sendRedirect("ControllerProducts");

                    }

                }
            }

            if (service.equalsIgnoreCase("delete")) {
                String id = request.getParameter("id");
                int n = dao.removeProduct(Integer.parseInt(id));
                if (n > 0) {
                    response.sendRedirect("ControllerProducts");
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
