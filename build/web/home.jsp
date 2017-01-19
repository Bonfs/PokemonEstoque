<%@page import="java.util.Hashtable"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/estilo.css">
		<title>Início</title>
	</head>
	<body>
            <%--
                Cookie[] cookies = request.getCookies();
                if(cookies != null){
                   Hashtable<String, String> tabelaCookie = new Hashtable<String, String>();
                   for(Cookie cookie : cookies){
                       tabelaCookie.put(cookie.getName(), cookie.getValue());                   
                    }
                   
                   if(Boolean.valueOf(tabelaCookie.get("isLogged"))){
                       response.sendRedirect("telaInicial.jsp");
                   }
                }
            --%>
		<div id="container1">			
			<div id="conteudo">
				<div id="logo"><a href="home.jsp"><img src="img/logo_pokecenter_branca.png" alt="PokeCenter logo"></a></div>
				<div id="linkloja_login">						
					<div id ="linkLoja">
						<div>
							<a href="#"> <img src="img/sacola_pokecenter_branca.png" alt="Sacola do PokeCenter"> </a>
						</div>
						<p><a href="#"> ACESSE NOSSA LOJA </a></p>
					</div>
					<div id="login">
						<form action="LoginServlet" method="post">
							<div class="legenda">LOGIN:</div>
							<input type="text" name="login"><br>

							<div class="legenda">SENHA:</div>
							<input type="password" name="senha"><br>
                                                        
							
							<input type="submit" name="acao" value="ENTRAR" class="botao">
						</form>
						<p><a href="#"> ESQUECEU SUA SENHA? </a></p>
						<p><a href="cadastro_treinador.html"> CADASTRE-SE </a></p>
					</div>
				</div>
			</div>
			<div style="clear:both;"></div>
			<footer>
				<center>
					<div id="footer1"><p>Poke Center Â© 2016</p></div>
					<div id="footer2">
						<ul>
							<li><a href="#">Ajuda</a></li>
							<li><a href="#">Privacidade</a></li>
							<li><a href="#">Termos</a></li>
						</ul>
					</div>
				</center>
			</footer>
		</div>
	</body>
</html>