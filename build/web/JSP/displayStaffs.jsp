<%-- 
    Document   : displayStaffs
    Created on : Feb 13, 2022, 10:02:12 PM
    Author     : LAPTOP VINH HA
--%>

<%@page import="entity.Staffs"%>
<%@page import="java.util.Vector"%>
<%@page import="model.DAOStaffs"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% String titlepage=(String)request.getAttribute("titlepage");
        %>
        <title><%=titlepage %></title>
    </head>
    <body>
        <%
//            DAOStaffs dao = new DAOStaffs();
//            Vector<Staffs> vector = dao.listAll("select *from Staffs");
            Vector<Staffs> vector=(Vector<Staffs>)request.getAttribute("stafflist");
            String titletable=(String)request.getAttribute("titletable");
        %>
        <table border="1">
            <caption><%=titletable %></caption>
            <tr>
                <th>staff_id</th>
                <th>first_name</th>
                <th>last_name</th>
                <th>email</th>
                <th>phone</th>
                <th>active</th>
                <th>store_id</th>
                <th>manager_id</th>
                <th>update</th>
                <th>delete</th>
            </tr>
            <%
                for (Staffs obj : vector) { %>
                    <tr>
                            <td><%=obj.getStaff_id() %> </td>
                            <td> <%= obj.getFirst_name() %></td>
                            <td><%= obj.getLast_name() %> </td>
                            <td><%=  obj.getEmail() %></td>
                            <td><%= obj.getPhone() %></td>
                            <td><%= obj.getActive() %></td>
                            <td><%= obj.getStore_id() %></td>
                            <td><%= obj.getManager_id() %></td>
                            <td><a href= "ControllerStaffs?s=updateStaffs&staffID= <%=obj.getStaff_id() %> " >update</a></td>
                            <td><a href= "ControllerStaffs?s=deleteStaffs&staffID= <%=obj.getStaff_id() %> " >delete</a></td>
                            </tr>
            <%}%>
        </table>
    </body>
</html>
