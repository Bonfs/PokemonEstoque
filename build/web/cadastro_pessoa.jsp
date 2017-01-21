<%@page import="treinadoresEtratadores.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbAccess.Access"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/estilo.css">
                <% 
                    //HttpSession sessao = request.getSession();
                    boolean tratador = true;
                    String login = "nhammm";
                    //Usuario User=null;
                    Usuario User = null;
                    if(session != null && session.getAttribute("User") != null) {
                        User = (Usuario) session.getAttribute("User");
                    }
                %>
                 <title>Cadastro Treinador</title>
	</head>
       
	<body>
		<div id="container2">			
			<div id="conteudo">
				<div id="logo"><a href="home.jsp"><img src="img/logo_pokecenter_branca.png" alt="PokeCenter logo"></a></div>
				<div id="cadastro">
					<h1> CADASTRO <%if(User.getTratador()) out.print("TRATADOR");else out.print("TREINADOR");%> </h1>
					<div id="coluna_cad1">
						<form action="" method="post">
							<div class="legenda">NOME:</div>
							<input type="text" name="nome"><br>
							
							<div class="legenda">CPF:</div>
							<input type="text" name="cpf"><br>

							<div class="legenda">EMAIL:</div>
							<input type="text" name="email"><br>

							<div class="legenda">CIDADE:</div>
							<input type="text" name="cidade"><br>

							<div class="legenda">ENDERECO:</div>
							<input type="text" name="endereco"><br>
						
					</div>
					<div id="coluna_cad2">
						
							<div class="legenda">TELEFONE:</div>
							<input type="text" name="telefone"><br>
							<%if(!User.getTratador()){%>
							<div class="legenda">NOME DA MÃE:</div>
							<input type="text" name="nome_mae"><br>
                                                        <%}%>
							<div class="legenda">LOGIN:</div>
							<input type="text" name="login"><br>

							<div class="legenda">SENHA:</div>
							<input type="password" name="senha"><br><br>
                                                        <% if(User.getTratador() && (((Tratador) User).isGerente())){%>
                                                        <input type="checkbox" name="gerente">  Cadastrar como Gerente <br><br><br>
                                                        <%}%>
							<input type="submit" value="CADASTRAR" class="botao">
						</form>
					</div>
				</div>

			</div>
			<div style="clear:both;"></div>
			<footer>
				<center>
					<div id="footer1"><p>Poke Center © 2016</p></div>
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