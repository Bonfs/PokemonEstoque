/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import treinadoresEtratadores.*;

/**
 *
 * @author prog
 */
@WebServlet(name = "Venda", urlPatterns = {"/Venda"})
public class Venda extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        Usuario User = null;
        HttpSession sessao = request.getSession();
        if(sessao.getAttribute("User") != null) {
            User = (Usuario) sessao.getAttribute("User");
        }
        try (PrintWriter out = response.getWriter()) {
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Venda</title>");
            out.println("<meta charset=\"UTF-8\">");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Venda at " + request.getContextPath() + "</h1>");
            if(User != null){
            out.println("<h1>Servlet Venda at " + ((Treinador) User).getCarrinho().getQuantidade() + "</h1>");}
            out.println("<h1>Servlet Venda at " + request.getParameter("acao") + "</h1>");
            out.println("<h1>Servlet Venda at " + request.getParameter("ID")  + "</h1>");
            out.println("<h1>Servlet Venda at " + request.getParameter("quantdd")  + "</h1>");
            
            out.println("</body>");
            out.println("</html>");
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
        if(request.getParameter("acao").equals("REMOVER")){
            Usuario User = null;
            HttpSession sessao = request.getSession();
            int id = Integer.parseInt(request.getParameter("ID"));
            if(sessao.getAttribute("User") != null) {
                User = (Usuario) sessao.getAttribute("User");
            }
            ((Treinador) User).getCarrinho().removeProduto(id);
            response.sendRedirect("PokeCenter_Loja_Carrinho.jsp");
        }else{
            response.sendRedirect("home.jsp");
        }
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
        int quantidade,id ;
        Usuario User = null;
        HttpSession sessao = request.getSession();
        
        if(request.getParameter("acao").equals("addProduto")){
            quantidade = Integer.parseInt(request.getParameter("quantidade"));
            id = Integer.parseInt(request.getParameter("ID"));
            if(sessao.getAttribute("User") != null) {
                User = (Usuario) sessao.getAttribute("User");
            }
            ((Treinador) User).getCarrinho().setProduto(id,quantidade);
            response.sendRedirect("PokeCenter_Loja.jsp");
        }else if(request.getParameter("acao").equals("AlterProduto")){
            quantidade = Integer.parseInt(request.getParameter("quantdd"));
            id = Integer.parseInt(request.getParameter("ID"));
            if(sessao.getAttribute("User") != null) {
                User = (Usuario) sessao.getAttribute("User");
            }
            ((Treinador) User).getCarrinho().alterProduto(id,quantidade);
            response.sendRedirect("PokeCenter_Loja_Carrinho.jsp");
        }else if(request.getParameter("acao").equals("Finaliza")){
            if(sessao.getAttribute("User") != null) {
                User = (Usuario) sessao.getAttribute("User");
            }
            ((Treinador) User).getCarrinho().encerrarCompra();
            response.sendRedirect("PokeCenter_Loja_Carrinho.jsp");
        }
        //processRequest(request, response);
        
        
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
