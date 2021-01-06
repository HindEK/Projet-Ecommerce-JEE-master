/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.bo.Category;
import models.bo.Product;
import models.dao.CategoryDao;
import models.dao.ProductDao;

/**
 *
 * @author Mehdi
 */
@WebServlet(name = "ProductController", urlPatterns = {"/ProductController"})
public class ProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        int chosenCategoryId = Integer.parseInt(request.getParameter("categoryId"));
        List<Product> products = (List<Product>) new ProductDao().retrieveByCategory(chosenCategoryId);
        Category category = new CategoryDao().retrieveById(chosenCategoryId);
        request.setAttribute("products", products);
        request.setAttribute("category", category);
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/categoryProducts.jsp");
        requestDispatcher.forward(request, response);
    }
}
