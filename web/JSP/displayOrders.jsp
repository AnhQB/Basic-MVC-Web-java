<%-- 
    Document   : displayOrders
    Created on : Feb 13, 2022, 9:54:18 PM
    Author     : LAPTOP VINH HA
--%>

<%@page import="entity.Staffs"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="entity.Orders"%>
<%@page import="java.util.Vector"%>
<%@page import="model.DAOOrders"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%String titlepage = (String) request.getAttribute("titlepage");%>
        <link rel="stylesheet" href="css/styleheader.css">
        <title><%=titlepage%></title>
    </head>
    <body>
        <%
            String username = (String) session.getAttribute("username");
            Staffs staff = (Staffs) session.getAttribute(username);
            String fullname = staff.getFirst_name() + " " + staff.getLast_name();
            String rollnumber = String.valueOf(staff.getStaff_id());
            ResultSet rsSta1 = (ResultSet) request.getAttribute("StatusList");

        %>
        <div class="top">
            <div class="header">
                <p style="color: orange"><span><%=rollnumber%> <%=fullname%></span> --|--<span> Welcome: <%=username%></span></p>
            </div>    
            <div class="nav">
                <a href="ControllerLogout">Logout</a>
            </div>
        </div>
        <div class="mid">
            <div class="left">
                <a href="ControllerLogin?s=home">Home</a>
                <a href="ControllerCustomer">Customer Manager</a>
                <a href="ControllerProducts">Product Manager</a>
                <a href="ControllerOrders">Order Manager</a>
            </div>
            <div class="right">    
                <a href="Orders.html">Insert Order</a>

                <p>
                    Status: 
                    <select onchange="location.href = 'ControllerOrders?sta=' + this.value;">
                    <%  String status="";
                        while(rsSta1.next()){
                        switch(rsSta1.getInt(1)){
                            case 1:
                                status="New";
                                break;
                            case 2:
                                status="Process";
                                break;
                            case 3:
                                status="Done";
                                break;
                            case 4:
                                status="Cancel";
                                break;
                        }
                        
                    %>
                    <option value="<%=rsSta1.getInt(1)%>"><%=status %></option>
                    <%} rsSta1.beforeFirst(); %>
                    </select>
                </p>


                <%
                    Vector<Orders> vector = (Vector<Orders>) request.getAttribute("OrderList");
                    String titletable = (String) request.getAttribute("titletable");

                    ResultSet rsCus = (ResultSet) request.getAttribute("CustomerList");
                    ResultSet rsSto = (ResultSet) request.getAttribute("StoreList");
                    ResultSet rsSta = (ResultSet) request.getAttribute("StatusList");
                %>
                <form>
                    <p>
                        Search by ID 
                        <input type="text" name="id" value="">
                        <input type="submit" name="search" value="search by id">
                    </p>
                </form>
                <%if (!vector.isEmpty()) {%>
                <table border="1">
                    <caption><%=titletable%></caption>
                    <tr>
                        <th>Order id</th>
                        <th>customer name</th>
                        <th>order_date</th>
                        <th>total</th>
                        <th>store name</th>
                        <th>order_status</th>
                        <th>view</th>

                        <!-- 
                        <th>update</th>
                        <th>delete</th>
                        -->

                    </tr>
                    <%
                for (Orders o : vector) {%>
                    <tr>

                        <td><%=o.getOrder_id()%></td>

                        <%while (rsCus.next()) {
                                if (rsCus.getInt(1) == o.getCustomer_id()) {
                        %>
                        <td><%=rsCus.getString(2) + " " + rsCus.getString(3)%></td>
                        <%}
                            }
                            rsCus.beforeFirst();
                        %>

                        <td><%=o.getOrder_date()%></td>

                        <%while (rsSto.next()) {
                                if (rsSto.getInt(1) == o.getStore_id()) {
                        %>

                        <td><%=total(o.getOrder_id())%></td>


                        <td><%=rsSto.getString(2)%></td>
                        <%}
                            }
                            rsSto.beforeFirst();
                        %>
                        <td><select name="order_status" 
                                    onchange="location.href = 'ControllerOrders?s=updateStatus&id=<%=o.getOrder_id()%>&order_status=' + this.value;">
                                <%  String statusN = "";
                            while (rsSta.next()) { %>
                                <%
                                    switch (rsSta.getInt(1)) {
                                        case 1:
                                            statusN = "New";
                                            break;
                                        case 2:
                                            statusN = "Process";
                                            break;
                                        case 3:
                                            statusN = "Done";
                                            break;
                                        case 4:
                                            statusN = "Cancel";
                                            break;
                                    }
                                %>
                                <option value="<%=rsSta.getInt(1)%>"
                                        <%=rsSta.getInt(1) == o.getOrder_status() ? "selected" : ""%>
                                        ><%=statusN%> </option>
                                <%}
                            rsSta.beforeFirst();%>
                            </select></td>
                        <td><a href="ControllerOrders?s=detail&id= <%=o.getOrder_id()%>">detail</a></td>
                        <!-- <td><a href="ControllerOrders?s=update&id= <%=o.getOrder_id()%>">update</a></td>
                        <td><a href="ControllerOrders?s=delete&id= <%=o.getOrder_id()%>">delete</a></td>
                        -->
                    </tr>
                    <%    }
                    %>

                </table>
                <%} else {%>
                <h3 style="color: red">Not found<h3>
                        <%}%>
                        </div>
                        </div>
                        </body>
                        <%!
                            public double total(int orderId) {

                                String id = String.valueOf(orderId);
                                double total = 0;
                                DAOOrders dao = new DAOOrders();
                                ResultSet rs = dao.getData("with x as (select *from Orders where order_id=" + id
                                        + ") select o.list_price,o.discount,o.quantity"
                                        + " from x "
                                        + " left join customers c on c.customer_id=x.customer_id "
                                        + " left join order_items o on o.order_id=x.order_id "
                                        + " left join products p on p.product_id=o.product_id "
                                        + " left join stores s on s.store_id=x.store_id");
                                try {
                                    while (rs.next()) {
                                        total += (rs.getDouble(1) * rs.getDouble(3)) - (rs.getDouble(1) * rs.getDouble(3) * rs.getDouble(2));
                                        //total+=rs.getDouble(8)*rs.getDouble(6);
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                                return total;
                            }
                        %>
                        </html>
