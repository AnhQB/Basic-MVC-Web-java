<%-- 
    Document   : displayOrderDetail
    Created on : Feb 17, 2022, 3:52:49 PM
    Author     : LAPTOP VINH HA
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%String titlepage = (String) request.getAttribute("titlepage");%>
        <title><%=titlepage %></title>
    </head>
    <body>
        <%
            ResultSet rs = (ResultSet)request.getAttribute("OrderList");
            String titletable = (String) request.getAttribute("titletable");
            ResultSet rsSta=(ResultSet)request.getAttribute("StatusList");
            double total=0;
            
        %>
        <h2><%=titletable%></h2>
        <%if(rs.next()){%>
        <p>Customer Name: <span style="margin-right:60px "><%=rs.getString(5) %></span>Store Name: <span><%=rs.getString(11)  %></span> </p>
        <p>OrderID: <span style="margin-right: 40px"><%=rs.getString(1) %></span>
            Order date: <span style="margin-right: 40px"><%=rs.getString(4)  %></span>
            Order Status:<span><%=rs.getString(3) %></span></p>
        <p>Detail: <span style="margin-left: 60px">Status: </span>
            <select name="order_status" 
                    onchange="location.href='ControllerOrders?s=updateStatus&id=<%=rs.getString(1)%>&order_status='+this.value;">
                        <%  String statusN="";
                            while(rsSta.next()){ %>
                        <%
                            switch(rsSta.getInt(1)){
                                case 1: 
                                    statusN="New";  
                                    break;
                                case 2: 
                                    statusN="Process";
                                    break;
                                case 3: 
                                    statusN="Done";
                                    break;
                                case 4:
                                    statusN="Cancel";
                                    break;
                            }
                        %>
                        <option value="<%=rsSta.getInt(1)%>"
                                <%=rsSta.getInt(1)==rs.getInt(3)?"selected":"" %>
                                ><%=statusN %> </option>
                        <%} rsSta.beforeFirst(); %>
                                </select>
        </p>
        <%}rs.beforeFirst(); %>
        <table border=1>
                <thead>
                    <tr>
                       <th>ProductID</th>
                       <th>ProductName</th>
                       <th>Quantity</th>
                       <th>ListPrice</th>
                       <th>Discount</th>
                       <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                
                <% while(rs.next()){%>
                    <tr>
                        <td><%=rs.getString(9) %></td>
                        <td><%=rs.getString(10)%></td>
                        <td><%=rs.getString(8)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td><%=rs.getString(7)%></td>

                        <td><%=(rs.getDouble(8)*rs.getDouble(6))-(rs.getDouble(8)*rs.getDouble(6)*rs.getDouble(7)) %></td>
                        <%total+=(rs.getDouble(8)*rs.getDouble(6))-(rs.getDouble(8)*rs.getDouble(6)*rs.getDouble(7));%>
                    </tr>
                <%} %>
                </tbody>
                <tfoot>
                <tr>
                    <th>Grand Total</th>
                    <th><%=total %>$</th>
                </tr>
                </tfoot> 
        </table>
                
    </body>
</html>
