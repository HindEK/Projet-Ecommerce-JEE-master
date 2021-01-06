/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.bo.Cart;

/**
 *
 * @author Mehdi
 */
@WebServlet(name = "CartController", urlPatterns = {"/cart/*"})
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        /* ADD PRODUCT TO CART */
        if (request.getPathInfo().equals("/add")) {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

            response.setContentType("text/plain");

            int chosenProductId = Integer.parseInt(request.getParameter("productId"));

            try {
                cart.addProduct(chosenProductId);
                request.setAttribute("quantity", cart.getProductQuantity(chosenProductId));
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/cart.jsp");
                requestDispatcher.forward(request, response);
            } catch(Exception ex) {
                showCustomizedErrorPage(request,response,ex.getMessage());
                Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        /* REDUCE PRODUCT QUANTITY */
        else if (request.getPathInfo().equals("/reduceQuantity")) {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

            response.setContentType("text/plain");

            int chosenProductId = Integer.parseInt(request.getParameter("productId"));

            try {
                cart.reduceProductQuantity(chosenProductId);
                getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);
            } catch (Exception ex) {
                showCustomizedErrorPage(request,response,ex.getMessage());
                Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        /* MODIFY PRODUCT QUANTITY */
        else if (request.getPathInfo().equals("/modifyQuantity")) {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

            response.setContentType("application/json");

            int chosenProductId = Integer.parseInt(request.getParameter("productId"));
            int newQuantity = Integer.parseInt(request.getParameter("quantity"));

            try {
                cart.modifyProductQuantity(chosenProductId,newQuantity);
                //getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);
                
                try (PrintWriter out = response.getWriter()) {
                    /* TODO output your page here. You may use following sample code. */
                    out.println("{\"modified\": true}");
                }
            } catch (Exception ex) {
                
                try (PrintWriter out = response.getWriter()) {
                    /* TODO output your page here. You may use following sample code. */
                    out.println("{\"modified\": false}");
                }
                //showCustomizedErrorPage(request,response,ex.getMessage());
                Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        /* REMOVE PRODUCT FROM CART */
        else if (request.getPathInfo().equals("/remove")) {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

            response.setContentType("text/plain");

            int chosenProductId = Integer.parseInt(request.getParameter("productId"));

            try {
                cart.removeProduct(chosenProductId);
                getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);
            } catch (Exception ex) {
                showCustomizedErrorPage(request,response,ex.getMessage());
                Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    private void showCustomizedErrorPage(HttpServletRequest request, HttpServletResponse response,String error) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        session.setAttribute("error", error);
        getServletContext().getRequestDispatcher("/errors/CartError.jsp").forward(request, response);
    }
}

