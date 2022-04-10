<%-- 
    Document   : displayStores
    Created on : Feb 13, 2022, 10:10:32 PM
    Author     : LAPTOP VINH HA
--%>

<%@page import="entity.Stores"%>
<%@page import="java.util.Vector"%>
<%@page import="model.DAOStores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%            String titlepage=(String)request.getAttribute("titlepage");
%>
        <title><%=titlepage %></title>
    </head>
    <body>
        <%
            Vector<Stores> vector = (Vector<Stores>)request.getAttribute("StoreList");
            String titletable=(String)request.getAttribute("titletable");
        %>
        <table border="1">
            <caption><%=titletable %></caption>
            <tr>
                <th>store_id</th>
                <th>store_name</th>
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
                for (Stores s : vector) {%>
                    <tr>
                        <td><%= s.getStore_id() %></td>
                        <td><%= s.getStore_name() %></td>
                        <td><%= s.getPhone() %></td>
                        <td><%= s.getEmail() %></td>
                        <td><%= s.getStreet() %></td>
                        <td><%= s.getCity() %></td>
                        <td><%= s.getState() %></td>
                        <td><%= s.getZip_code() %></td>
                        <td><a href="ControllerStores?s=update&id=<%=s.getStore_id() %>">update</a></td>
                        <td><a href="ControllerStores?s=delete&id=<%= s.getStore_id() %>">delete</a></td>
                    </tr>
            <%    }
            %>
        </table>
    </body>
</html>
