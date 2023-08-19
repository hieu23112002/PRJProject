/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Customers;
import entity.Order_items;
import entity.Orders;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import java.util.Map.Entry;
import model.DAOOrder_items;
import model.DAOOrders;
import org.apache.catalina.servlets.DefaultServlet;

/**
 *
 * @author HIEUPC
 */
@WebServlet(name = "addOrder", urlPatterns = {"/addOrder"})
public class addOrder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        DAOOrder_items dao = new DAOOrder_items();
        DAOOrders daoOrder = new DAOOrders();
        Object obj = session.getAttribute("cart");
        if (obj != null) {
            Map<String, Order_items> cart = (Map<String, Order_items>) obj;
            Orders order = new Orders();
            
            order.setOrder_id(1616);
            order.setRequired_date("2023-08-18");
            order.setStaff_id(7);
            order.setStore_id(2);

            DateTimeFormatter sdf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            order.setOrder_date(LocalDate.now().format(sdf)); // set order_date
            
            order.setOrder_status(1); //set order_status
            
            Customers cus = (Customers)session.getAttribute("customer"); //lay thong tin cus tu session
            order.setCustomer_id(cus.getCustomer_id()); //setCustomer_id
            
            daoOrder.insertOrdersByPre(order);
            
             for(Entry<String,Order_items> entry: cart.entrySet()){
                 Order_items items = entry.getValue();
                 items.setOrders(order);
                 dao.insertOrder_items(items);
             }
            
            double total = Double.parseDouble(request.getParameter("totalOrder"));// lay tong totalOrder
            
            
            session.removeAttribute("cart");
            request.getRequestDispatcher("home").forward(request, response);
            
        }
        else{
            request.getRequestDispatcher("home").forward(request, response);
        }
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
