<%-- 
    Document   : displayStocks
    Created on : Feb 13, 2022, 10:04:57 PM
    Author     : LAPTOP VINH HA
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="entity.Stocks"%>
<%@page import="java.util.Vector"%>
<%@page import="model.DAOStocks"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%String titlepage =(String)request.getAttribute("titlepage");%>
        <title><%=titlepage %></title>
    </head>
    <body>
        <%
            Vector<Stocks> vector = (Vector<Stocks>)request.getAttribute("StockList");
            ResultSet rs1 = (ResultSet)request.getAttribute("StoreList");
            ResultSet rs2 = (ResultSet)request.getAttribute("ProductList");
            String titletable =(String)request.getAttribute("titletable");
        %>
        <table border="1">
            <caption><%=titletable  %></caption>
            <tr>
                <th>store name</th>
                <th>product name</th>
                <th>quantity</th>
                <th>update</th>
                <th>delete</th>
            </tr>
            <%
                
                for (Stocks s : vector) {
                    
                    
                    out.print(" <tr>\n");
                    try {
                        while(rs1.next()){
                            if(rs1.getInt(1)==s.getStore_id()){%>
                                <td><%=rs1.getString(2) %></td>
                            <%}
                        }
                        rs1.beforeFirst();
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                    
                    try {
                        while(rs2.next()){
                            if(rs2.getInt(1)==s.getProduct_id()){%>
                                <td><%= rs2.getString(2) %></td>
                            <%}
                        }
                        rs2.beforeFirst();
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }%>
                            
                    <td><%= s.getQuantity() %></td>
                    <td><a href="ControllerStocks?s=update&idStore=<%=s.getStore_id() %>&idProduct= <%=s.getProduct_id() %>">update</a></td>
                    <td><a href="ControllerStocks?s=delete&id=<%=s.getStore_id() %>&idProduct=<%= s.getProduct_id()%> ">delete</a></td>
                </tr>
            <%    }
            %>
        </table>
    </body>
</html>
