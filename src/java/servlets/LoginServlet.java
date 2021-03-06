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
import vendas.Carrinho;

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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sessao = request.getSession();
        Usuario User =(Usuario) sessao.getAttribute("User");
        
        if(request.getParameter("acao").equals("ENTRAR")) {
            String login = request.getParameter("login");
            String pswd = request.getParameter("senha");
            if(Login(login,pswd,request,response)){
                response.sendRedirect("PokeCenter_Perfil.jsp");
            }else{
                response.sendRedirect("home.jsp");
            }
        }else if(request.getParameter("acao").equals("UpdateUser")){
            UpdateUser(request,response,User);
        }else if(request.getParameter("acao").equals("CriaUser")){
            CriaUser(request,response);
        }else if(request.getParameter("acao").equals("Deslogar")){
            sessao.invalidate();
            response.sendRedirect("home.jsp");
        }
    }
    
    private boolean Login(String login,String pswd, HttpServletRequest request, HttpServletResponse response) throws IOException{
        boolean isLogged = false,tipo=false;
        ResultSet rs;
        Access db = new Access();
        
        Usuario User = null;
        Carrinho carrinho = null;
        try {
            String query = "SELECT * FROM usuario WHERE login =\'" + login + "\' AND senha =\'"+ pswd+"\'";//problema de acentuação
            System.out.println(query);
            rs = db.selectSQL(query);
            if(rs.next() && rs.getString("ID")!= null){
                int ID = Integer.parseInt(rs.getString("ID"));
                String senha = rs.getString("senha");
                long CPF = Long.parseLong(rs.getString("CPF"));
                login = rs.getString("login");
                String nome = rs.getString("nome");
                String email = rs.getString("email");
                String cidade = rs.getString("cidade");
                String endereco = rs.getString("endereco");
                String telefone = rs.getString("telefone");
                String tratador = rs.getString("tratador");
                
                if(tratador.equals("1")){
                    query = "SELECT tipo FROM tratador WHERE tratador_id =" + ID ;
                    rs = db.selectSQL(query);
                    if(rs.next()){
                        User = new Tratador(ID,CPF,login,senha,nome,email,cidade,endereco,telefone,rs.getBoolean("tipo"));
                    }
                    tipo=true;
                }else{
                    query = "SELECT nome_da_mae FROM treinador WHERE treinador_id =" + ID ;
                    rs = db.selectSQL(query);
                    if(rs.next()){
                        User = new Treinador(ID,CPF,login,senha,nome,email,cidade,endereco,telefone,rs.getString("nome_da_mae"));
                    }
                }
                db.connectionClose();
                HttpSession sessao = request.getSession();
                sessao.setAttribute("User", User);
            }else{
                return false;
            }
            //Resultado = query;
        } catch (SQLException | InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }
    private void CriaUser(HttpServletRequest request, HttpServletResponse response) {
            ResultSet rs = null;
            Access db = new Access();
            String CPF=request.getParameter("CPF");
            String login=request.getParameter("login");
            String senha=request.getParameter("senha");
            String nome=request.getParameter("nome");
            String email=request.getParameter("email");
            String cidade=request.getParameter("cidade");
            String endereco=request.getParameter("endereco");
            String telefone=request.getParameter("telefone");
            int tratador;
            if(request.getParameter("gerente") != null){
                tratador=1;
            }else{
                tratador=0;
            }
            String query = "INSERT INTO `usuario`(`login`,`senha`,`nome`,`email`,`endereco`,`cidade`,`telefone`,`cpf`,`tratador`) VALUES (\'"+login+"\',\'"+senha+"\',\'"+nome+"\',\'"+email+"\',\'"+endereco+"\',\'"+cidade+"\',\'"+telefone+"\',\'"+CPF+"\',"+tratador+");";
            try {
                rs = db.insertSQL(query);
            } catch (SQLException | IllegalAccessException | InstantiationException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                if(rs != null){
                    int ID = Integer.parseInt(rs.getString("ID"));
                    if(request.getParameter("nome_mae") != null){
                        System.out.print(ID+" é Treinador");
                        String nome_mae=request.getParameter("nome_mae");
                        query="INSERT INTO treinador (`nome_da_mae`,`treinador_id`) Values('"+nome_mae+"',"+ID+")";
                    }else{
                        System.out.print(ID+" é Tratador");
                        int gerente=(request.getParameter("gerente").charAt(0) == 'f')?0:1;
                        System.out.print(ID+" é gerente?"+gerente);
                        query="INSERT INTO tratador (`tipo`,`tratador_id`) Values("+gerente+","+ID+")";
                    }
                    db.insertSQL(query);
                }
            } catch (SQLException | IllegalAccessException | InstantiationException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            db.connectionClose();
        try {
            response.sendRedirect("home.jsp");
        } catch (IOException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    private void UpdateUser(HttpServletRequest request, HttpServletResponse response,Usuario User){
            System.out.print("Update User Data");
            ResultSet rs;
            Access db = new Access();
            int ID=Integer.parseInt(request.getParameter("ID"));
            String CPF=request.getParameter("CPF");
            String login=request.getParameter("login");
            String senha=request.getParameter("senha");
            String nome=request.getParameter("nome");
            String email=request.getParameter("email");
            String cidade=request.getParameter("cidade");
            String endereco=request.getParameter("endereco");
            String telefone=request.getParameter("telefone");
            String query ="UPDATE `usuario` SET `CPF`=\'"+CPF+"\',`nome`=\'"+nome+"\',`email`=\'"+email+"\',`cidade`=\'"+cidade+"\',`endereco`=\'"+endereco+"\',`telefone`=\'"+telefone+"\' WHERE `ID`="+ID+";";
            System.out.println("Antes de Entrar"+query);
            try {
                db.insertSQL(query);
            } catch (SQLException | IllegalAccessException | InstantiationException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(request.getParameter("nome_mae") != null){
                String nome_mae=request.getParameter("nome_mae");
                query ="UPDATE `treinador` SET `nome_da_mae`=\'"+nome_mae+"\' WHERE `treinador_id`="+ID+";";
            }else{
                int gerente=(request.getParameter("gerente").equals("true"))?1:0;
                System.out.print(ID+":"+request.getParameter("gerente")+gerente);
                query ="UPDATE `tratador` SET `tipo`="+gerente+" WHERE `tratador_id`="+ID+";";
                System.out.print(ID+":"+request.getParameter("gerente")+gerente);
            }
            try {
                db.insertSQL(query);
            } catch (SQLException | IllegalAccessException | InstantiationException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            /*HttpSession sessao = request.getSession();
            sessao.invalidate();*/
            db.connectionClose();
            if(User != null){
                login = User.getLogin();
                senha = User.getPswd();
            }
            try{
                if(Login(login,senha,request,response)){
                    response.sendRedirect("PokeCenter_Perfil.jsp");
                }else{
                    response.sendRedirect("home.jsp");
                }
            } catch (IOException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
    }
    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void alert(String operação_enviada_ao_servidor_) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
