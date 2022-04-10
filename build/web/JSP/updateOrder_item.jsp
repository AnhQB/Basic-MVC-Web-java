<%-- 
    Document   : updateOrder_item
    Created on : Feb 20, 2022, 8:09:56 PM
    Author     : LAPTOP VINH HA
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ResultSet rsOItem=(ResultSet)request.getAttribute("Order_itemList");
            ResultSet rsItem=(ResultSet)request.getAttribute("ItemList");
            ResultSet rsProduct=(ResultSet)request.getAttribute("ProductList");
        %>
        <%if(rsOItem.next()){%>
        <form method="POST" action="ControllerOrder_items">
            <input name="s" type="hidden" value="update">
            <table>
                <tr>
                    <td>Order id</td>
                    <td><input type="number" name="order_id" value="<%=rsOItem.getString(1) %>" readonly></td>
                </tr>
                <tr>
                    <td>Item id</td>
                    <td><select name="item_id">
                        <%while(rsItem.next()){%>
                        <option value="<%=rsItem.getInt(1)%>" 
                                <%=rsItem.getInt(1)==rsOItem.getInt(2)?"selected":"" %>
                                ><%=rsItem.getInt(1) %></option>
                        <%}%>
                    </select></td>
                </tr>
                <tr>
                    <td>Product id</td>
                    <td><select name="product_id">
                        <%while(rsProduct.next()){%>
                        <option value="<%=rsProduct.getInt(1)%>" 
                                <%=rsProduct.getInt(1)==rsOItem.getInt(3)?"selected":"" %>
                                ><%=rsProduct.getString(2) %></option>
                        <%}%>
                    </select></td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td><input type="number" name="quantity" value="<%=rsOItem.getString(4) %>"></td>
                </tr>
                <tr>
                    <td>List price</td>
                    <td><input type="number" name="list_price" step="any" value="<%=rsOItem.getDouble(5) %>"></td>
                </tr>
                <tr>
                    <td>Discount</td>
                    <td><input type="number" step="any" name="discount" value="<%=rsOItem.getDouble(6) %>"></td>
                </tr>
                <tr>
                    <td><button type="submit" name="submit">Submit</button></td>
                    <td><button type="reset">Reset</button></td>
                </tr>
            </table>
        </form>
        <%}%>
    </body>
</html>
