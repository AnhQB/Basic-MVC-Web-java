<%-- 
    Document   : updateStore
    Created on : Feb 20, 2022, 7:44:39 PM
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
            ResultSet rsStore=(ResultSet)request.getAttribute("StoreList");
            ResultSet rsState=(ResultSet)request.getAttribute("StateList");
            ResultSet rsCode=(ResultSet)request.getAttribute("Zip_CodeList");
        %>
        <%
            if(rsStore.next()){
        %>
        <form method="get" action="ControllerStores">
            <input type="hidden" name="s" value="update">
            <table>
                <tr>
                    <td>Store id</td>
                    <td><input type="number" name="store_id" value="<%=rsStore.getString(1)%>" readonly></td>
                </tr>
                <tr>
                    <td>Store Name</td>
                    <td><input type="text" name="store_name" value="<%=rsStore.getString(2)%>"></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input type="text" name="phone" value="<%=rsStore.getString(3)%>"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email" value="<%=rsStore.getString(4)%>"></td>
                </tr>
                <tr>
                    <td>Street</td>
                    <td><input type="text" name="street" value="<%=rsStore.getString(5)%>"></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><input type="text" name="city"value="<%=rsStore.getString(6)%>"></td>
                </tr>
                <tr>
                    <td>State</td>
                    <td><select name="state">
                        <%while(rsState.next()){%>
                        <option value="<%=rsState.getString(1)%>"
                                <%=rsState.getString(1).equalsIgnoreCase(rsStore.getString(7))?"selected":"" %>
                                ><%=rsState.getString(1) %></option>
                        <%}%>
                    </select></td>
                </tr>
                <tr>
                    <td>Zip code</td>
                    <td><select name="zip_code">
                        <%while(rsCode.next()){%>
                        <option value="<%=rsCode.getString(1)%>"
                                <%=rsCode.getString(1).equalsIgnoreCase(rsStore.getString(8))?"selected":"" %>
                                ><%=rsCode.getString(1) %></option>
                        <%}%>
                    </select></td>
                </tr>
                <tr>
                    <td><button name="submit">Submit</button></td>
                    <td><button type="reset">Reset</button></td>
                </tr>
            </table>
        </form>
        <%}%>
    </body>
</html>
