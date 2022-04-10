<%-- 
    Document   : displayProducts
    Created on : Feb 13, 2022, 9:58:27 PM
    Author     : LAPTOP VINH HA
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="entity.Products"%>
<%@page import="java.util.Vector"%>
<%@page import="model.DAOProducts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%String titlepage=(String)request.getAttribute("titlepage"); %>
        <title><%=titlepage %></title>
    </head>
    <body>
        <%
            Vector<Products> vector =(Vector<Products>)request.getAttribute("ProductList");
            String titletable=(String)request.getAttribute("titletable");
            String pname=(String)request.getAttribute("pname");
            String from=(String)request.getAttribute("from");
            String to=(String)request.getAttribute("to");
            String notiCart=(String)request.getAttribute("notiCart");
            String username=(String)request.getAttribute("username");
        %>
        <%if(username!=null){%>
        <p style="color: orange">Welcome <%=username%> <a style="margin-left: 40px" href="ControllerLogout">Logout</a> </p>
        
        <%}%>
        <a href="ControllerCustomer?s=insert">Register</a>
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
            <a href="ControllerCart?s=showcart">Show Cart</a>
            
            
            <span style="color: green" > <%=notiCart!=null?notiCart:"" %></span>
        <table border="1">
            <caption><%=titletable%></caption>
            <tr>
                <th>product_id</th>
                <th>product_name</th>
                <th>model_year</th>
                <th>list_price</th>
                <th>brand_name</th>
                <th>category_name</th>
                <th>Add 2 Cart</th>
                
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
                        <td><a href="ControllerCart?s=add2cart&id=<%=p.getProduct_id()%>">Add to Cart</a></td>
                    </tr>
            <%            } 
            %>
        </table>
    </body>
</html>
