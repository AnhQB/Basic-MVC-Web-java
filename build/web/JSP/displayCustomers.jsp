<%-- 
    Document   : displayCustomers
    Created on : Feb 13, 2022, 9:34:22 PM
    Author     : LAPTOP VINH HA
--%>

<%@page import="entity.Staffs"%>
<%@page import="entity.Customers"%>
<%@page import="java.util.Vector"%>
<%@page import="model.DAOCustomers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%String titlepage = (String) request.getAttribute("titlepage");%>
        <title><%=titlepage%></title>
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
                <p style="color: orange"><span><%=rollnumber%> <%=fullname%></span>--|-- <span> Welcome: <%=username%></span></p>
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


            <%
                Vector<Customers> vector = (Vector<Customers>) request.getAttribute("customerlist");
                String titletable = (String) request.getAttribute("titletable");

            %>
            <div class="right">
                <a href="ControllerCustomer?s=insert">Insert Customer</a>
                <form action="ControllerCustomer">
                    <p>
                        Search by name
                        <input type="text" name="cname" value="">
                        <input type="submit" name="search" value="search by name">
                    </p>
                </form>
                <%if (!vector.isEmpty()) {%>
                <table border="1">
                    <caption><%=titletable%> </caption>
                    <tr>
                        <th>customer_id</th>
                        <th>first_name</th>
                        <th>last_name</th>
                        <th>phone</th>
                        <th>email</th>
                        <th>street</th>
                        <th>city</th>
                        <th>state</th>
                        <th>zip_code</th>
                        <th>update</th>
                        <th>delete</th>
                    </tr>
                    <%
                for (Customers cus : vector) {%>
                    <tr>
                        <td><%=cus.getCustomer_id()%></td>
                        <td><%= cus.getFirst_name()%></td>
                        <td><%= cus.getLast_name()%></td>
                        <td><%= cus.getPhone()%></td>
                        <td><%= cus.getEmail()%></td>
                        <td><%= cus.getStreet()%></td>
                        <td><%= cus.getCity()%></td>
                        <td><%= cus.getState()%></td>
                        <td><%= cus.getZip_code()%></td>
                        <td><a href="ControllerCustomer?s=update&id=<%= cus.getCustomer_id()%>">update</a></td>
                        <td><a href="ControllerCustomer?s=delete&id=<%= cus.getCustomer_id()%>">delete</a></td>
                    </tr>

                    <%    }
                    %>

                </table>
                <%} else {%>
                <h3 style="color: red">Not Found</h3>
                <%}%>
            </div>
        </div>
    </body>
</html>
