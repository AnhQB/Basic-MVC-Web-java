<%-- 
    Document   : updateStaff.jsp
    Created on : Feb 18, 2022, 7:55:30 AM
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
             ResultSet rs = (ResultSet)request.getAttribute("StaffList");
             ResultSet rs1 = (ResultSet)request.getAttribute("StoreList");
             ResultSet rs2 = (ResultSet)request.getAttribute("ManagerList");
             
        %>
        
        <%
            if(rs.next()){
        %>
        
        <form action="ControllerStaffs" method="POST">
            <input type="hidden" name="s" value="updateStaffs">
            <table>
                <tr>
                    <td>Staff id</td>
                    <td><input type="text" name="staff_id" readonly value="<%=rs.getInt(1)%>" readonly></td>
                </tr>
                <tr>
                    <td>First Name</td>
                    <td><input type="text" name="fname" value="<%=rs.getString(2) %>"></td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td><input type="text" name="lname" value="<%=rs.getString(3) %>"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="email" value="<%=rs.getString(4) %>"></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input type="text" name="phone" value="<%=rs.getString(5) %>"></td>
                </tr>
                <tr>
                    <td>Active</td>
                    <td>
                        <input type="radio" name="active" value="0" <%=rs.getInt(6)==0?"checked":"" %>>Active 
                        <input type="radio" name="active" value="1" <%=rs.getInt(6)==1?"checked":"" %>>DeActive 
                    </td>
                </tr>
                <tr>
                    <td>Store name</td>
                    <td><select name="store_id">
                        <%while(rs1.next()){%>
                        <option value="<%=rs1.getInt(1) %>" <%=rs.getInt(7)==rs1.getInt(1)?"selected":"" %>
                                ><%=rs1.getString(2)%></option>
                        <%}%>
                    </select></td>
                </tr>
                <tr>
                    <td>Manager name</td>
                    <td><select name="manager_id">
                        <% 
                            int tmp;
                            String manaName;
                            while (rs2.next()) {

                                if (rs2.getString(3) == null) {
                                    tmp = 0;
                                } else {
                                    tmp = rs2.getInt(3);
                                }
                            manaName=rs2.getString(1)+" "+rs2.getString(2) ;
                        %>
                        
                        <option value="<%=tmp%>" <%=rs.getInt(8)==tmp?"selected":"" %>
                                ><%=manaName %></option>
                        
                        <%}%>
                    </select></td>
                </tr>
                <tr>
                    <td><button name="submit" >Submit</button></td>
                    <td><button type="reset">Reset</button></td>
                </tr>
            </table>
        </form>
        <%}%>
    </body>
</html>
