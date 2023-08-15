/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Cart;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Vector;
import model.DAOProduct;

/**
 *
 * @author HIEUPC
 */
@WebServlet(name = "homeController", urlPatterns = {"/homeController"})
public class homeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // init session
        HttpSession session = request.getSession();

        // create cart for user     
        Cart cart = null;
        Object o = session.getAttribute("cart");
        if(o != null) {
            cart = (Cart) o;
        }
        else {
            cart = new Cart();
        }   
        
        // get number of cart
        request.setAttribute("numOfCart", cart.getProducts().size());   
        session.setAttribute("cart", cart);
        
        DAOProduct dao = new DAOProduct();
        String caname = request.getParameter("cname");
        if (caname == null) {
            caname = "Bicycles";
        }
        Vector<Product> vector = dao.getAllProduct("select * from Products");
        request.setAttribute("listP", vector);
        request.setAttribute("caname", caname);
        request.getRequestDispatcher("home.jsp").forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
