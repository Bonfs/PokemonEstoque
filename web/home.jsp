<%@page import="treinadoresEtratadores.*"%>
<%@page import="java.util.Hashtable"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/estilo.css">
		<title>Início</title>
	</head>
	<body>
            <% 
                HttpSession sessao = request.getSession();
                Usuario User = null;
                
                
                    if(session.getAttribute("User") != null) {
                        User = (Usuario) session.getAttribute("User");
                        if(User.isTratador()){
                            response.sendRedirect("PokeCenter_Perfil.jsp");
                        }else{
                            response.sendRedirect("PokeCenter_Loja.jsp");
                        }
                    }
            %>
		<div id="container1">			
			<div id="conteudo">
				<div id="logo"><a href="PokeCenter_Loja.jsp"><img src="img/logo_pokecenter_branca.png" alt="PokeCenter logo"></a></div>
				<div id="linkloja_login">						
					<div id ="linkLoja">
						<div>
							<a href="PokeCenter_Loja.jsp"> <img src="img/sacola_pokecenter_branca.png" alt="Sacola do PokeCenter"> </a>
						</div>
						<p><a href="PokeCenter_Loja.jsp"> ACESSE NOSSA LOJA </a></p>
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
						<p><a href="cadastro.jsp"> CADASTRE-SE </a></p>
					</div>
				</div>
			</div>
			<div style="clear:both;"></div>
			
                        <%@ include file="footer.jsp" %>
		</div>
	</body>
</html>