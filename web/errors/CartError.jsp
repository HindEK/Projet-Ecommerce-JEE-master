<%-- 
    Document   : CartError
    Created on : Mar 23, 2020, 11:47:35 PM
    Author     : Mehdi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String error = (String) session.getAttribute("error");
            out.println(error);
        %>
        
        <button onclick="window.location.href = '${pageContext.request.contextPath}/cart.jsp';">Revenir au panier</button>
    </body>
</html>
