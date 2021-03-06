/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dbAccess.Access;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import treinadoresEtratadores.Treinador;
import treinadoresEtratadores.Usuario;

/**
 *
 * @author prog
 */
public class PokemonServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PokemonServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PokemonServlet at " + request.getContextPath() + "</h1>");
            out.println("<h1>Servlet PokemonServlet at " + request.getParameter("acao") + "</h1>");
            out.println("<h1>Servlet PokemonServlet at " + request.getParameter("nome") + "</h1>");
            out.println("<h1>Servlet PokemonServlet at " + request.getParameter("nivel") + "</h1>");
            out.println("<h1>Servlet PokemonServlet at " + request.getParameter("tipo") + "</h1>");
            out.println("<h1>Servlet PokemonServlet at " + request.getParameter("descricao") + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private void AlterPoke(HttpServletRequest request, HttpServletResponse response){
        System.out.print("Update Poke Data");
        Access db = new Access();
        int id = Integer.parseInt(request.getParameter("ID"));
        String nome = request.getParameter("nome");
        String nivel = request.getParameter("nivel");
        String tipo = request.getParameter("tipo");
        String descricao = request.getParameter("descricao");
        int dispTroca = Integer.parseInt(request.getParameter("dispTroca"));
        String query ="UPDATE `pokemon` SET nome=\""+nome+"\",tipo=\""+tipo+"\",nivel="+nivel+",descricao=\""+descricao+"\",dispTroca="+dispTroca+" WHERE ID="+id+";";
        System.out.println("Antes de Entrar :"+query);
        try {
            db.insertSQL(query);
        } catch (SQLException | IllegalAccessException | InstantiationException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private void CriaPoke(HttpServletRequest request, HttpServletResponse response,Usuario User){
        System.out.print("Create Poke Data");
        Access db = new Access();
        String nome = request.getParameter("nome");
        String nivel = request.getParameter("nivel");
        String tipo = request.getParameter("tipo");
        String descricao = request.getParameter("descricao");
        int dispTroca = Integer.parseInt(request.getParameter("dispTroca"));
        String query = "INSERT INTO `pokemon` (nome,tipo,nivel,descricao,Id_Treinador,dispTroca) VALUES(\""+nome+"\",\""+tipo+"\","+nivel+",\""+descricao+"\","+User.getID()+","+dispTroca+");";
        System.out.println("Antes de Entrar :"+query);
        try {
            db.insertSQL(query);
        } catch (SQLException | IllegalAccessException | InstantiationException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private void TrocaPoke(HttpServletRequest request, HttpServletResponse response,Usuario User){
        System.out.print("Create Poke Data");
        Access db = new Access();
        String Trei1 = request.getParameter("Trei1");
        String Trei2 = request.getParameter("Trei2");
        String poke01 = request.getParameter("poke01");
        String poke02 = request.getParameter("poke02");
        //UPDATE pokemon SET Id_Treinador=4 WHERE ID=1;
        String query ="UPDATE pokemon SET Id_Treinador="+Trei2+" WHERE ID="+poke01+";";
        System.out.println("Antes de Entrar :"+query);
        try {
            db.insertSQL(query);
        } catch (SQLException | IllegalAccessException | InstantiationException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        query ="UPDATE pokemon SET Id_Treinador="+Trei1+" WHERE ID="+poke02+";";
        System.out.println("Antes de Entrar :"+query);
        try {
            db.insertSQL(query);
        } catch (SQLException | IllegalAccessException | InstantiationException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        query ="INSERT INTO `troca_pokemon`(`treinador_id1`,`treinador_id2`,`pokemon_id1`,`pokemon_id2`) VALUES ("+Trei1+","+Trei2+","+poke01+","+poke02+");";
        System.out.println("Antes de Entrar :"+query);
        try {
            db.insertSQL(query);
        } catch (SQLException | IllegalAccessException | InstantiationException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sessao = request.getSession();
        Usuario User = null;
        if(sessao.getAttribute("User") != null) {
            System.out.println("Ação :"+request.getParameter("acao"));
            User = (Usuario) sessao.getAttribute("User");
            if(request.getParameter("acao").equals("AlterPoke")){
                AlterPoke(request,response);
                ((Treinador) User).atualizaBolsa();
                response.sendRedirect("PokeCenter_Treinador_Pokemons.jsp");
            }else if(request.getParameter("acao").equals("CriaPoke")){
                CriaPoke(request,response,User);
                ((Treinador) User).atualizaBolsa();
                response.sendRedirect("PokeCenter_Treinador_Pokemons.jsp");
            }else if(request.getParameter("acao").equals("TrocaPoke")){
                TrocaPoke(request,response,User);
                response.sendRedirect("home.jsp");
            }
            
            
        }else{
            response.sendRedirect("home.jsp");
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
