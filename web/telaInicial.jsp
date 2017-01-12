<%-- 
    Document   : telaInicial
    Created on : 29/10/2016, 16:23:02
    Author     : matheus
--%>


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
            String login = "nhammm";
            Cookie[] cookies = request.getCookies();
            Hashtable<String, String> tabelaCookie = new Hashtable<String, String>();
            if(cookies != null){
               for(Cookie cookie : cookies){
                   tabelaCookie.put(cookie.getName(), cookie.getValue());                   
                }
               
               if(Boolean.valueOf(tabelaCookie.get("isLogged"))){
                   login = tabelaCookie.get("login");
               }
               else{
                   response.sendRedirect("loja.jsp");
               }
            }
            else{
                response.sendRedirect("home.jsp");
            }
        %>
        <h1>Olá <%=login%>!</h1>
    </body>
</html>
