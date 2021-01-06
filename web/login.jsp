

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    </head>
    <body>
        <div style="margin-left: 35%; margin-top: 17%;">
            <form class="form-signup" name="auth" method="post" action="${pageContext.request.contextPath}/auth/login">
                <table>
                    <tr><td><h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Connexion </h1></td></tr>
                    <tr><td><input class="form-control" placeholder="Login" type="text" name="login"></td></tr>
                    <tr><td><input class="form-control" placeholder="Mot de passe" type="password" name="password"></td></tr>
                    <tr><td><input class="btn btn-success btn-block" type="submit" value="Se connecter"></td></tr>
                    <tr><td><hr></td></tr>
                    <tr>
                        <td>
                            <button onclick="window.location.href = '${pageContext.request.contextPath}/signup.jsp';" class="btn btn-primary btn-block" type="button" id="btn-signup"><i class="fas fa-user-plus"></i> Vous n'avez pas un compte? Créez-le</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
