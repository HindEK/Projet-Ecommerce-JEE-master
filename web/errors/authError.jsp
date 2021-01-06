<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Erreur d'authentification</title>
    </head>
    <body>
        <%
            String error = (String) session.getAttribute("error");
            out.println(error);
        %>
        
        <button onclick="window.location.href = '${pageContext.request.contextPath}/login.jsp';">Revenir à la page de l'authentification</button>
    </body>
</html>