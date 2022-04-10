<%-- 
    Document   : updateCustomer
    Created on : Feb 18, 2022, 6:38:50 PM
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
            ResultSet rsCus=(ResultSet)request.getAttribute("CustomerList");
            ResultSet rsCity=(ResultSet)request.getAttribute("CityList");
            ResultSet rsState=(ResultSet)request.getAttribute("StateList");
            ResultSet rsZip=(ResultSet)request.getAttribute("Zip_codeList");
            
        %>
        <%if(rsCus.next()){%>
        <form action="ControllerCustomer" method="POST">
            <input name="s" type="hidden" value="update">
            <table>
                <tr>
                    <td>Customer id</td>
                    <td><input type="text" name="customer_id" value="<%=rsCus.getString(1) %>" readonly></td>
                </tr>
                <tr>
                    <td>First name</td>
                    <td><input type="text" name="fname" value="<%=rsCus.getString(2) %>"></td>
                </tr>
                <tr>
                    <td>Last name</td>
                    <td><input type="text" name="lname" value="<%=rsCus.getString(3) %>"></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input type="text" name="phone" value="<%=rsCus.getString(4) %>"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email" value="<%=rsCus.getString(5) %>"></td>
                </tr>
                <tr>
                    <td>Street</td>
                    <td><input type="text" name="street" value="<%=rsCus.getString(6) %>"></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td>
                        <select name="city">
                            <%while(rsCity.next()){%>
                                <option value="<%=rsCity.getString(1)%>"  
                                        <%=(rsCity.getString(1).equalsIgnoreCase(rsCus.getString(7)) ? "selected" : "") %>
                                ><%=rsCity.getString(1)%> </option>
                            <%}  %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>State</td>
                    <td><select name="state">
                            <%while(rsState.next()){%>
                                <option value="<%=rsState.getString(1)%>" 
                                        <%=(rsState.getString(1).equalsIgnoreCase(rsCus.getString(8)) ? "selected" : "") %>
                                ><%=rsState.getString(1)%> </option>
                            <%}%>
                    </select></td>
                </tr>
                <tr>
                    <td>Zip_code</td>
                    <td>
                        <select name="zip_code">
                            <%while(rsZip.next()){%>
                                <option value="<%=rsZip.getString(1)%>" 
                                        <%=(rsZip.getString(1).equalsIgnoreCase(rsCus.getString(9)) ? "selected" : "") %>
                                ><%=rsZip.getString(1)%> </option>
                            <%}%>
                        </select>
                    </td>
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
