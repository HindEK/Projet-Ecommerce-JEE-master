<%@page import="models.bo.Cart"%>
<%@page import="models.dao.ProductDao"%>
<%@page import="models.bo.Product"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
   Document   : index
   Created on : Mar 7, 2020, 11:03:43 AM
   Author     : Mehdi
--%>
<%@page  contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.util.List"%>
<%@page import="models.bo.Category"%>
<%@page import="java.util.Iterator"%>
<%@page import="models.dao.CategoryDao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ILISI ecommerce</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <!-- Font Awesome JS -->
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
        <!-- Popper.JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/sidebar.css" />
        
        <script src="${pageContext.request.contextPath}/cart.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <!-- Getting categories from db -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3>Bienvenue à ILISICom</h3>
                </div>
                <ul class="list-unstyled components">
                    <p>Catégories</p>
                    <li>
                        <%
                            List<Category> categories = (List<Category>) new CategoryDao().retrieve();
                            Iterator categoriesIterator = categories.iterator();
                            int i = 0;
                            while (categoriesIterator.hasNext()) {
                                String temp = "";
                                if (i == 0) {
                                    temp = " class=\"active\" ";
                                }
                                Category category = (Category) categoriesIterator.next();
                                out.print("<a" + temp + "href=" + request.getContextPath() + "/ProductController?categoryId=" + category.getCategoryId() + ">" + category.getCategoryName() + "</a>");
                            }
                        %>
                    </li>
                </ul>
            </nav>
            <!-- Page Content  -->
            <div id="content">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">
                        <button type="button" id="sidebarCollapse" class="btn btn-info">
                            <i class="fas fa-align-left"></i>
                        </button>
                        <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fas fa-align-justify"></i>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="nav navbar-nav ml-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/cart.jsp">Votre panier</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <br /> <br />
                <div class="container" style="margin-left: 15%;">
                    <div class="row">
                        <div class="col-sm-12 col-md-10 col-md-offset-1">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Produit</th>
                                        <th>Quantité</th>
                                        <th class="text-center">Prix</th>
                                        <th class="text-center">Total</th>
                                        <th> </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                            Cart cart = (Cart) session.getAttribute("cart");
                                            double total = 0;
                                            if (cart != null) {
                                                if (cart.getProductsQuantity().size() > 0) {
                                                    for (Integer productId : cart.getProductsQuantity().keySet()) {
                                                        Product product = new ProductDao().retrieveById(productId);
                                                        total += product.getPrice() * cart.getProductQuantity(productId);

                                                        out.println("<tr><td class=\"col-sm-8 col-md-6\">"
                                                                + "<div class=\"media\">"
                                                                + "<a class=\"thumbnail pull-left\" href=\"#\"> <img class=\"media-object\" src=\"http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png\" style=\"width: 72px; height: 72px;\"> </a>"
                                                                + "<div class=\"media-body\">"
                                                                + "<h4 class=\"media-heading\"><a href=\"#\"> "+ product.getProductName() +"</a></h4>"
                                                                + "<span>Status: </span><span class=\"text-success\"><strong>In Stock</strong></span"
                                                                + "</div>"
                                                                + "</div>"
                                                                + "</td>"
                                                                + "<td class=\"col-sm-1 col-md-1\" style=\"text-align: center\">"
                                                                + "<input type=\"text\" class=\"form-control\" onchange=\"onQuantityChange(this.value, this.id)\" id=\"productQuantity"+ product.getProductId() +"\" value=\"" + cart.getProductQuantity(productId) + "\">"
                                                                + "</td>"
                                                                + "<td class=\"col-sm-1 col-md-1 text-center\"><strong>" + product.getPrice() + "</strong></td>"
                                                                + "<td class=\"col-sm-1 col-md-1 text-center\"><strong>" + product.getPrice() * cart.getProductQuantity(productId) + "</strong></td>"
                                                                + "<td class=\"col-sm-1 col-md-1\">"
                                                                + "<button type=\"button\" class=\"btn btn-danger\" onclick=\"window.location.href = '" + request.getContextPath() + "/cart/remove?productId=" + productId + "';\">"
                                                                + "<span class=\"glyphicon glyphicon-remove\"></span> Remove"
                                                                + "</button>"
                                                                + "</td>"
                                                                + "</tr>"
                                                            );
                                                        }
                                                    } else {
                                                        //out.println("Votre panier est vide");
                                                    }
                                                }
                                                else
                                                {
                                                    //out.println("Votre panier est vide");
                                                }
                                    %>
        
                                    <tr>
                                        <td>   </td>
                                        <td>   </td>
                                        <td>   </td>
                                        <td>
                                            <h3>Total</h3>
                                        </td>
                                        <td class="text-right">
                                            <h3><strong><% out.println(total); %> MAD</strong></h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>   </td>
                                        <td>   </td>
                                        <td>   </td>
                                        <td>
                                            <button type="button" class="btn btn-default" onclick="window.location.href = '${pageContext.request.contextPath}/';">
                                                <span class="glyphicon glyphicon-shopping-cart"></span> Acheter plus
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-success" onclick="window.location.href = '${pageContext.request.contextPath}/billing';">
                                                Finaliser votre commande <span class="glyphicon glyphicon-play"></span>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>