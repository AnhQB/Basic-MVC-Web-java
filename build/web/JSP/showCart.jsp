<%-- 
    Document   : showCart
    Created on : Feb 24, 2022, 8:22:36 AM
    Author     : LAPTOP VINH HA
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="entity.Customers"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="entity.Products"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styleheader.css">
        <title>Show Cart</title>
        <style>
            .foot p{
                display: flex;
                justify-content: flex-end;
                font-weight: bold;
                margin-top: 15px; margin-left: 40px;
            }

            .foot p button{
                margin-right: auto;
                background-color: #eeefe9;
                padding: 8px 25px;
                border: none;
                border-radius: 5px;
            }

            .foot p button:hover,button:focus{
                background-color: bisque;
            }

            .foot p span{
                margin-left: 2%;
            }

            .foot p span:last-child{
                margin-right: 32%;

            }

        </style>
    </head>
    <body>
        <%
            Enumeration em = (Enumeration) request.getAttribute("Cart");
            //boolean checkCart = (boolean) request.getAttribute("checkCart");
            //int count = (int) request.getAttribute("checkCart");
            HashMap<Integer, Integer> listQuantity = new HashMap<Integer, Integer>();
        %>
        <div class="top">
            <div class="header">
                <h1>Shopping Cart Details</h1>
                <%
                    String username1 = (String) session.getAttribute("username");
                    if (username1 != null) {
                        Customers cus1 = (Customers) session.getAttribute(username1);
                %>
                <p>Welcome: <%=cus1.getFirst_name() + " " + cus1.getLast_name()%><p>
                    <%}%>
            </div>
        </div>
        <div class="mid">
            <div class="left">
                <a href="ControllerCart">Items List</a>
                <%if (username1 != null) {%>
                <a href="ControllerLogout">Check-out</a>
                <%}%>
            </div>
            <div class="right">
                <p style="color: red"></p>
                <form action="ControllerCart" method="get" onkeydown="return event.key != 'Enter';">
                    <input type="hidden" name="s" value="updateQuantity">
                    <%                List<String> list = new ArrayList();
                        double totalCart = 0;
                        String username = (String) session.getAttribute("username");
                        int lock = 0;
                        //Customers cus = (Customers)session.getAttribute(username);
                        int stt = 0;
                        while (em.hasMoreElements()) {
                            double total = 0;
                            String key = em.nextElement().toString(); //get key
                            if (!key.equalsIgnoreCase("username") && !key.equalsIgnoreCase(username)) {
                                if (lock == 0) {
                                    lock = 1;
                    %>
                    <table width=70% border="1"  >
                        <tr>
                            
                            <th>STT</th>
                            <th>Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total</th>
                            <th>Remove</th>

                        </tr>
                        <%
                            }
                            Object value = session.getAttribute(key); //get value
                            list = (ArrayList<String>) value;
                            total = Integer.parseInt(list.get(0)) * Double.parseDouble(list.get(2));
                            totalCart += total;
                            stt++;
                        %>
                        <tr>
                            <td> <%= stt%></td>
                            <td> <%= list.get(1)%></td>
                            <td> 
                                <input  
                                    type="number" name="<%=key%>" value="<%= list.get(0)%>" min="1" step="1" max="10"
                                    >
                            </td>
                            <td> <%= list.get(2)%></td>
                            <td> <%=total%></td>
                            <td><a href="ControllerCart?s=remove&id=<%=key%>">remove</a></td>
                        </tr>
                        <%
                                }
                            }
                        %>

                        <%if (lock == 0) {%>
                        <h3><p style="color: orange">Cart is Empty<p></h3>
                        <%} else {%>

                    </table>

                    <div class="foot">
                        <p>
                            <button>Update</button>

                            Total:
                            <span><%=totalCart%></span>
                            <span><a href="ControllerCart?s=remove_all">Remove all</a></span>

                        </p>
                    </div>
                </form> 

                <%}%>

            </div>
        </div>


        <%
//            int count=0;
//            Enumeration em1= (Enumeration) request.getAttribute("Cart");
//                    
//            while (em1.hasMoreElements())
//            {
//                em1.nextElement();
//                count++;
//            }
//            
            //if(em.hasMoreElements()){
        %>
        <%!
//            public void updateQuantity(int orderID, int quantity){
//                //list.put(orderID, quantityI);
//                for(Integer m: list.keySet()){
//                    log(m+" quantityla: " + list.get(m));
//                }
//            }
//            
//            public boolean existOrderID(int orderID){
//                for(Integer m: list.keySet()){
//                    if(m==orderID){
//                        
//                        return true;
//
//                    }
//                }
//                return false;
//            }
%>


    </body>
</html>
