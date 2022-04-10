<%-- 
    Document   : displayOrder_items
    Created on : Feb 13, 2022, 9:50:23 PM
    Author     : LAPTOP VINH HA
--%>

<%@page import="entity.Order_items"%>
<%@page import="model.DAOOrder_items"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%String titlepage=(String)request.getAttribute("titlepage"); %>
        <title><%=titlepage%></title>
    </head>
    <body>
        <%
            //DAOOrder_items dao = new DAOOrder_items();
            Vector<Order_items> vector = (Vector<Order_items>)request.getAttribute("Order_itemsList");
            String titletable = (String)request.getAttribute("titletable");

        %>
        <table border="1">
            <caption><%=titletable%></caption>
            <tr>
                <th>Order id</th>
                <th>Item id</th>
                <th>Product id</th>
                <th>Quantity</th>
                <th>List price</th>
                <th>Discount</th>
                <th>update</th>
                <th>delete</th>
            </tr>
            <%
                for (Order_items o : vector) {%>
                    <tr>
                        <td><%=o.getOrder_id() %></td>
                        <td><%= o.getItem_id() %></td>
                        <td><%= o.getProduct_id() %></td>
                        <td><%= o.getQuantity() %></td>
                        <td><%= o.getList_price() %></td>
                        <td><%= o.getDiscount() %></td>
                        <td><a href="ControllerOrder_items?s=update&idOrder= <%= o.getOrder_id()%> &idItem= <%=o.getItem_id()%> ">update</a></td>
                        <td><a href="ControllerOrder_items?s=delete&idOrder= <%=o.getOrder_id()%> &idItem= <%=o.getItem_id() %>">delete</a></td>
                    </tr>
            <%    }
            %>
        </table>
    </body>
</html>
