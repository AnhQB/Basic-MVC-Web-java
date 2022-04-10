<%-- 
    Document   : index
    Created on : Mar 5, 2022, 7:10:17 PM
    Author     : LAPTOP VINH HA
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="entity.Products"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styleheader.css">
        <%String titlepage = (String) request.getAttribute("titlepage");%>
        <title><%=titlepage%></title>
    </head>
    <body>
        <%
            Vector<Products> vector = (Vector<Products>) request.getAttribute("ProductList");
            ResultSet brandList = (ResultSet) request.getAttribute("brandList");
            String titletable = (String) request.getAttribute("titletable");
            String pname = (String) request.getAttribute("pname");
            String from = (String) request.getAttribute("from");
            String to = (String) request.getAttribute("to");
            String notiCart = (String) request.getAttribute("notiCart");
            String username = (String) request.getAttribute("username");
            String fullname = (String) request.getAttribute("fullname");
            String rollNumber = (String) request.getAttribute("rollNumber");
        %>

        <div class="top">
            <div class="header">
                <%if (username != null) {%>
                <p><%=rollNumber != null ? rollNumber : ""%>  
                    <%=fullname != null ? fullname : ""%>
                    --- WelCome: <%=username%></p> 
                    <%} else {%>
                <p>Vui lòng đăng nhập để có trải nghiệm tốt nhất =))</p>
                <%}%>
            </div>

            <div class="nav">
                <%if (username != null) {%>
                <a href="ControllerLogout">Logout</a>
                <%} else {%>
                <a href="ControllerLogin">Login</a>
                <a href="ControllerCustomer?s=insert">Register</a>
                <%}%>
                <a  href="ControllerCart?s=showcart">Show Cart</a>
                <form method="POST" action="">
                    <input type="text" name="pname" value="<%=pname%>" placeholder="Search">
                    <input type="hidden" name="search" value="search by name">
                </form>



            </div>
        </div>
        <div class="mid">
            <div class="left">
                <a href="ControllerCart">All</a>
                <%while (brandList.next()) {%>
                <a href="ControllerCart?search=brand&brand=<%=brandList.getString(1)%>"><%=brandList.getString(1)%></a>
                <%}%>
            </div>


            <div class="right">
                <span style="color: green" > <%=notiCart != null ? notiCart : ""%></span>
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
                        <td><%= p.getProduct_id()%></td>
                        <td><%= p.getProduct_name()%></td>
                        <td><%= p.getModel_year()%></td>
                        <td><%= p.getList_price()%></td>
                        <td><%= p.getBrand_name()%></td>
                        <td><%= p.getCategory_name()%></td>
                        <td><a href="ControllerCart?s=add2cart&id=<%=p.getProduct_id()%>">Add to Cart</a></td>
                    </tr>
                    <%            }
                    %>
                </table>

            </div>
        </div>
    </body>
</html>
