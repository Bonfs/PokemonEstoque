<%-- 
    Document   : telaInicial
    Created on : 29/10/2016, 16:23:02
    Author     : matheus
--%>


<%@page import="treinadoresEtratadores.*"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tela Inicial</title>
    </head>
    <body>
        <% 
            HttpSession sessao = request.getSession();
            String login = "nhammm";
            //Usuario User=null;
            Usuario User = null;
            if(session.getAttribute("User") != null) {
                User = (Usuario) session.getAttribute("User");
            }
            if (User == null) {
                response.sendRedirect("home.jsp");
            }
        %>
        
        
        <h1>Olá <%if(User.getTratador()) out.print(((Tratador) User).isGerente());else out.print(((Treinador) User).getNomeDaMae());%></h1>
        <a href="${pageContext.request.contextPath}/LoginServlet?acao=Deslogar">
            <button name="acao" value="Deslogar" >DESLOGAR</button>
        </a>  
    </body>
    <script src="js/cookieHandler.js"></script>
</html>
