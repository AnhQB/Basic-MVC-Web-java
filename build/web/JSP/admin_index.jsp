<%-- 
    Document   : admin_index
    Created on : Mar 2, 2022, 8:23:46 AM
    Author     : LAPTOP VINH HA
--%>

<%@page import="entity.Staffs"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styleheader.css">

    </head>
    <body>
        <%
            String username = (String) session.getAttribute("username");
            Staffs staff = (Staffs) session.getAttribute(username);
            String fullname = staff.getFirst_name() + " " + staff.getLast_name();
            String rollnumber = String.valueOf(staff.getStaff_id());

        %>
        <div class="top">
            <div class="header">
                <p style="color: orange"><span><%=rollnumber%> <%=fullname%></span> --|--<span> Welcome: <%=username%></span></p>
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
            <div>
                <%

                %>
            </div>
        </div>
    </body>
</html>
