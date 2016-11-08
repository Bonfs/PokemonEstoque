<%-- 
    Document   : index
    Created on : 29/10/2016, 23:09:44
    Author     : matheus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loja Pokemon!</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>
    </style>
        <div>
        	<form method="post"
<<<<<<< HEAD
        		  action="${pageContext.request.contextPath}/LoginServlet">
        		<label for="login">Login:sss </label><input type="text" name="login">
        		<label for="password">Senha: </label><input type="password" name="password">    
                <div>
                    <a href="">Não possui conta? Cadastre-se.</a>
                </div>                   
=======
        		  action="LoginServlet">
        		<label for="login">Login: </label><input type="text" name="login">
        		<label for="password">Senha: </label><input type="password" name="password">
>>>>>>> 28e524838b6da228dfb74bffba8ab67b6f63f67d
        		<div>
        			<input type="submit" name="logar" value="Logar">
        		</div>
        	</form>
        </div>
    </body>
</html>
