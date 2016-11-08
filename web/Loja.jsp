<%-- 
    Document   : Loja
    Created on : 08/11/2016, 14:33:58
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dbAcess.Access"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Poke Store</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <% Access db = new Access();
        List Lista_SQL = db.SelectSQL(new String("SELECT * FROM produto"));
        StringBuilder SelectVet = db.sqlStringToVector(Lista_SQL); %>
    </head>
    <body>
        <div id="head" class="loja_div">
        <h1>PokeStore</h1>
        <div id="Menu">
            <a class="button" href="Loja.jsp">Tudo</a>
            <a class="button" href="Loja.jsp">Ovos</a>
            <a class="button" href="Loja.jsp">Pokemons</a>
            <a class="button" href="Loja.jsp">Pokebolas</a>
            <a class="button" href="Loja.jsp">Consumiveis</a>
        </div>
        </div>
        <div id="body" class="loja_div">
            <%=SelectVet%>
        </div>
    </body>
</html>
