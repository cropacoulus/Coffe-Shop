/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

/**
 *
 * @author RIFKI
 */
@WebServlet(name = "CheckOutServlet", urlPatterns = {"/check-out"})
public class CheckOutServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String alamat = request.getParameter("alamat");
            String provinsi = request.getParameter("provinsi");
            String kota = request.getParameter("kota");
            String payment = request.getParameter("payment");
            
            ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
            
            User auth = (User) request.getSession().getAttribute("authUser");
            
            if(cart_list != null && auth != null){
                CoffeDao cdao = new CoffeDao();
                Order order = new Order();
                order.setIdcust(auth.getIdcust());
                order.setAlamat(alamat);
                order.setProvinsi(provinsi);
                order.setKota(kota);
                order.setTotalprice(cdao.getTotalCartPrice(cart_list));
                order.setPayment(payment);
                OrderDao odao = new OrderDao();
                odao.insertOrder(order);
                
                for(Cart c:cart_list){
                    DetailOrder deo = new DetailOrder();
                    deo.setIdcoffee(c.getIdcoffe());
                    deo.setQuantity(c.getQuantity());
                    boolean result =  odao.insertDetailOrder(deo);
                    if(!result) break;
                }
                
                cart_list.clear();
                out.println("order");
            }else{
                if(auth == null) response.sendRedirect("login.jsp");
                response.sendRedirect("cart.jsp");
            }
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
