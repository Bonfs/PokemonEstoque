<%-- 
    Document   : Loja
    Created on : 08/11/2016, 14:33:58
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dbAccess.Access"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Poke Store</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <% Access db = new Access();
        StringBuilder SelectVet = db.SelectSQL(new String("SELECT * FROM produto"),0); %>
    </head>
    <body>
        <div id="head" class="loja_div">
        <h1>PokeStore</h1>
        <div id="Menu">
            <a class="button" href="#">Tudo</a>
            <a class="button" href="#">Ovos</a>
            <a class="button" href="#">Pokemons</a>
            <a class="button" href="#">Pokebolas</a>
            <a class="button" href="#">Consumiveis</a>
        </div>
        </div>
        <div id="body" class="loja_div">
            <div id="0"></div>
            <div id="1"></div>
            <%=SelectVet%>
        </div>
        <script>
            var path;
            function loadImagem( id,img )
            {
                carregar = new Image();
                carregar.src = img ;
                path = document.getElementById("body").getElementsByTagName("div")[id];
                //document.getElementById("body").innerHTML = "Carregando...";
                path.innerHTML = "Carregando...";
                setTimeout( "verificaCarregamento()", 1 );
            }

            function verificaCarregamento()
            {
                if( carregar.complete )
                {
                    path.innerHTML = "<img src=\"" + carregar.src + "\"width=300 />";
                }
                else
                {
                    setTimeout( "verificaCarregamento()", 1 );
                }
            }
            loadImagem("0","./img/0_0.jpg");
        </script>    
    </body>
</html>
