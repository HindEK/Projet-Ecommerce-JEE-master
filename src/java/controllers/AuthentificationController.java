/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.bo.Customer;
import models.dao.CustomerDao;

/**
 *
 * @author Mehdi
 */
@WebServlet(name = "AuthentificationController", urlPatterns = {"/auth/*"})
public class AuthentificationController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        if (request.getPathInfo().equals("/login"))
        {
            String login = request.getParameter("login");
            String password = request.getParameter("password");
            
            Customer customer = new CustomerDao().retrieveById(login);
            
            if(customer != null)
            {
                if(customer.getPassword().equals(password))
                {
                    session.setAttribute("customer", customer);
                    getServletContext().getRequestDispatcher("/billing").forward(request, response);
                }
                else
                {
                    showCustomizedErrorPage(request,response, "Le mot de passe saisi est incorrect !");
                }
            }
            else
            {
                showCustomizedErrorPage(request,response, "Le login saisi est incorrect / non existant !");
            }
        }
        else if (request.getPathInfo().equals("/createAccount"))
        {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String login = request.getParameter("login");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phoneNumber = request.getParameter("phoneNumber");
            
            
            Customer customer = new Customer(firstName,lastName,login,password,email,address,phoneNumber);
            
            
            session.setAttribute("customer",customer);
            new CustomerDao().create(customer);
            
            getServletContext().getRequestDispatcher("/billing").forward(request, response);
        }
    }
    
    private void showCustomizedErrorPage(HttpServletRequest request, HttpServletResponse response,String error) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        session.setAttribute("error", error);
        getServletContext().getRequestDispatcher("/errors/authError.jsp").forward(request, response);
    }
}
