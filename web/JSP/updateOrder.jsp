<%-- 
    Document   : updateOrder.jsp
    Created on : Feb 18, 2022, 10:10:05 PM
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
            ResultSet rsOrder=(ResultSet)request.getAttribute("OrderList");
            ResultSet rsCus=(ResultSet)request.getAttribute("CustomerList");
            ResultSet rsOSta=(ResultSet)request.getAttribute("OStatusList");
            ResultSet rsSto=(ResultSet)request.getAttribute("StoreList");
            ResultSet rsSta=(ResultSet)request.getAttribute("StaffList");
        %>
        <%if(rsOrder.next()){%>
        <form action="ControllerOrders" method="POST">
            <input type="hidden" name="s" value="update">
            <table>
                <tr>
                    <td>Order id</td>
                    <td><input type="number" name="order_id" value="<%=rsOrder.getString(1) %>" readonly></td>
                </tr>
                <tr>
                    <td>Customer id</td>
                    <td><select name="customer_id">
                        <%while(rsCus.next()){%>
                        <option value="<%=rsCus.getInt(1)%>" <%=rsCus.getInt(1)==rsOrder.getInt(2)?"selected":"" %>>
                            <%=rsCus.getString(2)+" "+rsCus.getString(3) %></option>
                        <%}%>
                    </select></td>
                </tr>
                <tr>
                    <td>Order status</td>
                    <td><select name="order_status">
                    <%while(rsOSta.next()){%>
                        <option value="<%=rsOSta.getInt(1)%>" 
                                <%=rsOSta.getInt(1)==rsOrder.getInt(3)?"selected":"" %>>
                            <%=rsOSta.getInt(1) %></option>
                        <%}%>
                    </select></td>
                </tr>
                <tr>
                    <td>Order date</td>
                    <td><input type="date" name="order_date" value="<%=rsOrder.getString(4) %>"></td>
                </tr>
                <tr>
                    <td>Required date</td>
                    <td><input type="date" name="required_date" value="<%=rsOrder.getString(5) %>"></td>
                </tr>
                <tr>
                    <td>Shipped date</td>
                    <td><input type="date" name="shipped_date" value="<%=rsOrder.getString(6) %>"></td>
                </tr>
                <tr>
                    <td>Store name</td>
                    <td><select name="store_id">
                    <%while(rsSto.next()){%>
                        <option value="<%=rsSto.getInt(1)%>" 
                                <%=rsSto.getInt(1)==rsOrder.getInt(7)?"selected":"" %>>
                            <%=rsSto.getString(2) %></option>
                        <%}%>
                    </select></td>
                </tr>
                <tr>
                    <td>Staff name</td>
                    <td><select name="staff_id">
                    <%while(rsSta.next()){%>
                        <option value="<%=rsSta.getInt(1)%>" 
                                <%=rsSta.getInt(1)==rsOrder.getInt(8)?"selected":"" %>>
                            <%=rsSta.getString(2)+" "+rsSta.getString(3) %></option>
                        <%}%>
                    </select></td>
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
