<%-- 
    Document   : login.jsp
    Created on : Feb 28, 2022, 8:04:08 AM
    Author     : LAPTOP VINH HA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styleLogin.css">
    </head>
    <%
        String error = request.getParameter("error");
        String success= (String)request.getAttribute("success");
        String username=request.getParameter("username");
    
%>
    <body>
        <div class="login">
            <p <%if(error!=null ){ %>
                style="color: red"
            <%}else{%>
                style="color: green"
            <%}%>
                >
                <%if(error!=null ){ %>
                    <%=error %>
            <%}else if(success!=null){%>
                <%=success %>
            <%}else{%>
                <%=""%>
            <%}%>
            </p>
            <form method="POST" action="ControllerLogin">
                <div class="top_form">
                <input type="hidden" name="s" value="processLogin">
                
                <input type="text" name="username" placeholder="User Name" value="<%=username!=null?username:"" %>" required>

                <input type="password" name="password" placeholder="Password" required>
                </div >
                <div class="button_login">
                <button>Login</button>
                <div class="line">
                </div>
                <div class="bottom_form">
                    <a href="ControllerCustomer?s=insert">
                        Create New Account
                    </a>
                </div>
                </div>
            </form>
        </div>
    </body>
</html>
