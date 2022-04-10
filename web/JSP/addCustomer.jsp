<%-- 
    Document   : addCustomer
    Created on : Mar 9, 2022, 7:55:53 AM
    Author     : LAPTOP VINH HA
--%>

<%@page import="entity.Customers"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Customer</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/styleRegister.css">
    </head>
    <body>
        <%
            ResultSet rsCity=(ResultSet)request.getAttribute("CityList");
            ResultSet rsState=(ResultSet)request.getAttribute("StateList");
            ResultSet rsZip=(ResultSet)request.getAttribute("Zip_codeList");
            String customer_id=(String)request.getAttribute("customer_id");
            Customers cus= (Customers)request.getAttribute("InforCus");
            String city="",state="",zip_code="",fname="",lname="",phone="",
                    email="",street="",username="",password="";
            if(cus!=null){
                city=cus.getCity();
                state=cus.getState();
                zip_code=cus.getZip_code();
                fname=cus.getFirst_name();
                lname=cus.getLast_name();
                phone=cus.getPhone();
                email=cus.getEmail();
                street=cus.getStreet();
                username=cus.getUsername();
                password=cus.getPassword();
            }
            
            String error=request.getParameter("error");
            
        %>
        <!-- <a href="ControllerCustomer">List All</a> -->
        <form action="ControllerCustomer" method="POST">
            <input name="s" type="hidden" value="insert">
            <table>
                <caption>Register</caption>
                <tr>
                    <td>Customer id</td>
                    <td><input type="number" name="customer_id" value="<%=customer_id %>" readonly required></td>
                </tr>
                <tr>
                    <td>First name</td>
                    <td><input type="text" name="fname" value="<%=fname!=null?fname:"" %>" required></td>
                </tr>
                <tr>
                    <td>Last name</td>
                    <td><input type="text" name="lname" value="<%=lname!=null?lname:"" %>" required></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input type="number" name="phone" value="<%=phone!=null?phone:"" %>" required></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email" value="<%=email!=null?email:"" %>" required></td>
                </tr>
                <tr>
                    <td>Street</td>
                    <td><input type="text" name="street" value="<%=street!=null?street:"" %>" required></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td>
                        <select name="city">
                            <%while(rsCity.next()){%>
                                <option value="<%=rsCity.getString(1)%>"  
                                        <%=(rsCity.getString(1).equalsIgnoreCase(city) ? "selected" : "") %>
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
                                        <%=(rsState.getString(1).equalsIgnoreCase(state) ? "selected" : "") %>
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
                                        <%=(rsZip.getString(1).equalsIgnoreCase(zip_code) ? "selected" : "") %>
                                ><%=rsZip.getString(1)%> </option>
                            <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Username </td>
                    <td><input type="text" name="username" value="<%=username!=null?username:"" %>" required>
                        <span style="color: red"><%=error!=null?error:""%></span>
                    </td>
                    
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" value="<%=password!=null?password:"" %>" required>
                    <span></span>
                    </td>
                </tr>
                
                    
                
            </table>  
                    <div class="sm">
            <button type="submit" name="submit">Submit</button>
            </div>
        </form>
    </body>
</html>
