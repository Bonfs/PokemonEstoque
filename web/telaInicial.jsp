<%-- 
    Document   : telaInicial
    Created on : 29/10/2016, 16:23:02
    Author     : matheus
--%>

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
            String login = request.getParameter("login");
        %>
        <h1>Hello <%=login%>!</h1>
    </body>
</html>
