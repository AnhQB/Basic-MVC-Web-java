<%-- 
    Document   : Customer
    Created on : Mar 2, 2022, 9:18:44 AM
    Author     : LAPTOP VINH HA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="ControllerCustomer">List All</a>
        <form action="ControllerCustomer" method="POST">
            <input name="s" type="hidden" value="insert">
            <table>
                <tr>
                    <td>Customer id</td>
                    <td><input type="number" name="customer_id"></td>
                </tr>
                <tr>
                    <td>First name</td>
                    <td><input type="text" name="fname"></td>
                </tr>
                <tr>
                    <td>Last name</td>
                    <td><input type="text" name="lname"></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input type="number" name="phone"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email"></td>
                </tr>
                <tr>
                    <td>Street</td>
                    <td><input type="text" name="street"></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><input type="text" name="city"></td>
                </tr>
                <tr>
                    <td>State</td>
                    <td>
                        <select name="state">
                            <option value="NY">NY</option>
                            <option value="CA">CA</option>
                            <option value="TX">TX</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Zip_code</td>
                    <td><input type="number" name="zip_code"></td>
                </tr>
                <tr>
                    <td><button type="submit">Submit</button></td>
                    <td><button type="reset">Reset</button></td>
                </tr>
            </table>    
            
        </form>
    </body>
</html>
