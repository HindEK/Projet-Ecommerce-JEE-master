<%-- 
    Document   : login
    Created on : Mar 24, 2020, 4:09:08 PM
    Author     : Mehdi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Création du compte client</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    </head>
    <body>   
        <div style="margin-left: 38%; margin-top: 12%;">
            <form name="auth" method="post" action="${pageContext.request.contextPath}/auth/createAccount">
                <table>    
                    <tr><td><h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Création compte </h1></td></tr>
                    <tr><td><input class="form-control" placeholder="Prénom" type="text" name="firstName"></td></tr>
                    <tr><td><input class="form-control" placeholder="Nom" type="text" name="lastName"></td></tr>
                    <tr><td><input class="form-control" placeholder="Login" type="text" name="login"></td></tr>
                    <tr><td><input class="form-control" placeholder="Mot de passe" type="password" name="password"></td></tr>
                    <tr><td><input class="form-control" placeholder="Email" type="email" name="email"></td></tr>
                    <tr><td><input class="form-control" placeholder="Adresse" type="text" name="address"></td></tr>  
                    <tr><td><input class="form-control" placeholder="Téléphone" type="text" name="phoneNumber"></td></tr>
                    <tr><td><button class="btn btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i> Créer Compte</button></td></tr>
                    <tr><td><a href="${pageContext.request.contextPath}/login.jsp#" id="cancel_signup"><i class="fas fa-angle-left"></i> Retour</a></td></tr>
                </table>
            </form>
        </div>
    </body>
</html>
