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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import treinadoresEtratadores.Tratador;
import treinadoresEtratadores.Treinador;
import treinadoresEtratadores.Usuario;

/**
 *
 * @author matheus
 */
public class LoginServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Login -> "+ request.getContextPath() +"</h1>");
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
        //processRequest(request, response);
        if(request.getParameter("acao").equals("Deslogar")){
            HttpSession sessao = request.getSession();
            sessao.invalidate();
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
    private boolean Login(String login,String pswd, HttpServletRequest request, HttpServletResponse response) throws IOException{
        boolean isLogged = false,tipo=false;
        String Resultado="";
        ResultSet rs;
        Usuario User = null;
        
        
        //Acessando o Banco de Dados
        Access db = new Access();
        try {
            String query = "SELECT * FROM usuario WHERE login =\'" + login + "\' AND senha =\'"+ pswd+"\'";//problema de acentuação
            rs = db.selectSQL(query);
            if(rs.next() && rs.getString("ID")!= null){
                int ID = Integer.parseInt(rs.getString("ID"));
                login = rs.getString("login");
                String nome = rs.getString("nome");
                String email = rs.getString("email");
                String endereco = rs.getString("endereco");
                String telefone = rs.getString("telefone");
                String tratador = rs.getString("tratador");
                
                if(tratador.equals("1")){
                    query = "SELECT tipo FROM tratador WHERE tratador_id =" + ID ;//problema de acentuação
                    rs = db.selectSQL(query);
                    if(rs.next()){
                        User = new Tratador(ID,login,nome,email,endereco,telefone,rs.getBoolean("tipo"));
                    }
                    tipo=true;
                }else{
                    query = "SELECT nome_da_mae FROM treinador WHERE treinador_id =" + ID ;//problema de acentuação
                    rs = db.selectSQL(query);
                    if(rs.next()){
                        User = new Treinador(ID,login,nome,email,endereco,telefone,rs.getString("nome_da_mae"));
                    }
                }
                db.connectionClose();
                
                isLogged = true;
            }else{
                response.sendRedirect("home.jsp");
                return false;
            }
            //Resultado = query;
        } catch (SQLException | InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            HttpSession sessao = request.getSession();
            if(User != null){
                sessao.setAttribute("User", User);
                if(User.getTratador()){
                    response.sendRedirect("telaInicial.jsp");
                }else{
                    response.sendRedirect("PokeCenter_Loja.jsp");
                }
            } 
            
            
        }
        return isLogged;
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("acao").equals("ENTRAR")) {
            String login = request.getParameter("login");
            String pswd = request.getParameter("senha");
            Login(login,pswd,request,response);
        }
        
        
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

    private void alert(String operação_enviada_ao_servidor_) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
