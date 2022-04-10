<%-- 
    Document   : displayProducts
    Created on : Feb 13, 2022, 9:58:27 PM
    Author     : LAPTOP VINH HA
--%>

<%@page import="entity.Staffs"%>
<%@page import="entity.Products"%>
<%@page import="java.util.Vector"%>
<%@page import="model.DAOProducts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%String titlepage=(String)request.getAttribute("titlepage"); %>
        <link rel="stylesheet" href="css/styleheader.css">
        <title><%=titlepage %></title>
    </head>
    <body>
        <%
            String username=(String)session.getAttribute("username");
            Staffs staff=(Staffs)session.getAttribute(username);
            String fullname=staff.getFirst_name()+" "+staff.getLast_name();
            String rollnumber=String.valueOf(staff.getStaff_id());
            
        %>
        <div class="top">
        <div class="header">
            <p style="color: orange"><span><%=rollnumber %> <%=fullname %></span>--|-- <span> Welcome: <%=username %></span></p>
        </div>
        <div class="nav">
            <a href="ControllerLogout">Logout</a>
            
        </div>
        </div>
        <div class="mid">
        <div class="left">
            <a href="ControllerLogin?s=home">Home</a>
                <a href="ControllerCustomer">Customer Manager</a>
                <a href="ControllerProducts">Product Manager</a>
                <a href="ControllerOrders">Order Manager</a>
            
        </div>
            <div class="right">
            <a href="Products.html">Insert Product</a>
        
        <%
            Vector<Products> vector =(Vector<Products>)request.getAttribute("ProductList");
            String titletable=(String)request.getAttribute("titletable");
            String pname=(String)request.getAttribute("pname");
            String from=(String)request.getAttribute("from");
            String to=(String)request.getAttribute("to");
        %>
        <form action="ControllerProducts">
            <p>Search By Name: <input type="text" name="pname" value="<%=pname%>" />
                <input type="submit" name="search" value="search by name" />
            </p>
        </form>
            <form action="ControllerProducts">
            <p>Search by Price: 
                from <input type="text" name="from" value="<%=from%>" />
                to <input type="text" name="to" value="<%=to%>" />
            <input type="submit" name="search" value="search by price" />
            </p>
            </form>
        <%if(!vector.isEmpty()){%>
        <table border="1">
            <caption><%=titletable%></caption>
            <tr>
                <th>product_id</th>
                <th>product_name</th>
                <th>model_year</th>
                <th>list_price</th>
                <th>brand_name</th>
                <th>category_name</th>
                <th>update</th>
                <th>delete</th>
            </tr>
            <%
                for (Products p : vector) {%>
                    <tr>
                        <td><%= p.getProduct_id() %></td>
                        <td><%= p.getProduct_name() %></td>
                        <td><%= p.getModel_year() %></td>
                        <td><%= p.getList_price() %></td>
                        <td><%= p.getBrand_name() %></td>
                        <td><%= p.getCategory_name() %></td>
                        <td><a href="ControllerProducts?s=update&id= <%=p.getProduct_id() %>">update</a></td>
                        <td><a href="ControllerProducts?s=delete&id= <%=p.getProduct_id() %>">delete</a></td>
                    </tr>
            <%            }
            %>
        </table>
        <%}else{%>
            <h3 style="color: red">Not found</h3>
        <%}%>
        </div>
        </div>
    </body>
</html>
