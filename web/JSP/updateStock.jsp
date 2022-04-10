<%-- 
    Document   : updateStock
    Created on : Feb 20, 2022, 7:24:33 PM
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
            ResultSet rsStock=(ResultSet)request.getAttribute("StockList");
            ResultSet rsStore=(ResultSet)request.getAttribute("StoreList");
            ResultSet rsPro=(ResultSet)request.getAttribute("ProductList");
        %>
        <%if(rsStock.next()){%>
        <form method="POST" action="ControllerStocks">
            <input type="hidden" name="s" value="update">
            <table>
                <tr>
                    <td>Store Name</td>
                    <td><select name="store_id" >
                        <%while(rsStore.next()){%>
                        <option value="<%=rsStore.getInt(1)%>" 
                                <%=rsStore.getInt(1)==rsStock.getInt(1)?"selected":"" %> 
                                ><%=rsStore.getString(2) %></option>
                        <%}%>
                    </select></td>
                </tr>
                <tr>
                    <td>Product name</td>
                    <td><select name="product_id" >
                        <%while(rsPro.next()){%>
                        <option value="<%=rsPro.getInt(1)%>" 
                                <%=rsPro.getInt(1)==rsStock.getInt(2)?"selected":"" %> 
                                ><%=rsPro.getString(2) %> </option>
                        <%}%>
                    </select></td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td><input type="number" name="quantity" value="<%=rsStock.getInt(3) %>"></td>
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
