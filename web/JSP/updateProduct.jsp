<%-- 
    Document   : updateProduct
    Created on : Feb 18, 2022, 11:01:33 PM
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
            ResultSet rsPro=(ResultSet)request.getAttribute("ProductList");
            ResultSet rsBrand=(ResultSet)request.getAttribute("BrandList");
            ResultSet rsCate=(ResultSet)request.getAttribute("CateList");
        %>
        <%if(rsPro.next()){%>
        <form method="POST" action="ControllerProducts">
            <input type="hidden" name="s" value="update">
            <table>
            <tr>
                <td>Product id</td>
                <td><input type="number" name="product_id" value="<%=rsPro.getString(1) %>" readonly></td>
            </tr>
            <tr>
                <td>Product name</td>
                <td><input type="text" name="pname" value="<%=rsPro.getString(2) %>"></td>
            </tr>
            <tr>
                <td>Model year</td>
                <td><input type="number" name="model_year" value="<%=rsPro.getString(3) %>"></td>
            </tr>
            <tr>
                <td>List price</td>
                <td><input type="number" name="list_price" value="<%=rsPro.getString(4) %>"></td>
            </tr>
            <tr>
                <td>Brand name</td>
                <td><select name="brand_name">
                    <%while(rsBrand.next()){%>
                    <option value="<%=rsBrand.getString(1)%>" 
                            <%=rsBrand.getString(1).equalsIgnoreCase(rsPro.getString(5))?"selected":"" %>>
                        <%=rsBrand.getString(1)%></option>
                    <%}%>
                    
                </select></td>
            </tr>
            <tr>
                <td>Category Name</td>
                <td><select name="cname">
                    <%while(rsCate.next()){%>
                    <option value="<%=rsCate.getString(1)%>" 
                            <%=rsCate.getString(1).equalsIgnoreCase(rsPro.getString(6))?"selected":"" %>>
                        <%=rsCate.getString(1)%></option>
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
