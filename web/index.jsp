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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

        <!-- Font Awesome JS -->
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
        <!-- Popper.JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/sidebar.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/sidebar.js"></script>
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

                <div class="container d-flex justify-content-center mt-50 mb-50">
                    <div class="row">
                        <%                            
                            List<Product> products = (List<Product>) new ProductDao().retrieve();
                            Iterator productsIterator = products.iterator();
                            i = 0;
                            while (productsIterator.hasNext()) {

                                Product product = (Product) productsIterator.next();
                                out.println("<div class=\"col-md-4 mt-2\">");
                                out.println("<div class=\"card\">");
                                out.println("<div class=\"card-body\">");
                                out.println("<div class=\"card-img-actions\"> <img src=\"https://res.cloudinary.com/dxfq3iotg/image/upload/v1562074043/234.png\" class=\"card-img img-fluid\" width=\"96\" height=\"350\"> </div>"
                                        + "</div><div class=\"card-body bg-light text-center\">"
                                        + "<div class=\"mb-2\">");
                                out.println("<h6 class=\"font-weight-semibold mb-2\"> <a href=\"#\" class=\"text-default mb-2\" data-abc=\"true\"> " + product.getProductName() + "</a> </h6>");
                                out.println("</div><h3 class=\"mb-0 font-weight-semibold\">" + product.getPrice() + "</h3> "
                                        + "<div> <i class=\"fa fa-star star\"></i> <i class=\"fa fa-star star\"></i> <i class=\"fa fa-star star\"></i> <i class=\"fa fa-star \"></i> </div>");
                                out.println("<button type=\"button\" class=\"btn bg-cart\"><i class=\"fa fa-cart-plus mr-2\" onclick=\"window.location.href = '" + request.getContextPath() + "/cart/add?productId=" + product.getProductId() + "';\"></i> Ajouter au panier</button></div></div></div>");

                            }

                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

