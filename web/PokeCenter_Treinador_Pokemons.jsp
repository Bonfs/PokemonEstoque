<%@page import="treinadoresEtratadores.Treinador"%>
<%@page import="Itens.Pokemon"%>
<%@page import="treinadoresEtratadores.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/estilo.css">
		<title>Treinador - PokeCenter</title>
	</head>
	<body>
		<div id="container3">			
                    <jsp:include page="header.jsp" >
                        <jsp:param name="Manter" value="false" />
                        <jsp:param name="Loja" value="false" />
                    </jsp:include>
                        <%
                            Usuario User = null;
                            if(session.getAttribute("User") != null) {
                                User = (Usuario) session.getAttribute("User");
                            }
                        %>

			<div style="clear:both;"></div>

			<div id="conteudo">
				<div id="Busca">
					<input type="text" id="txtBusca" placeholder="Pesquisar..."/>
					<div id="lupa"> <img src="img/lupa.png" id="btBusca" alt="Buscar"/> </div>
				</div>
				<div id="produtoDescri">
					<h2>Meus Pokemons</h2>
                                        <%for(Pokemon poke: ((Treinador) User).getPokemons()){%>
					<div class="pokemon">
						<ul>
							<li><a href="PokeCenter_Pokemon.html"><%=poke.getNome()%></a></li>
							<li><%=poke.getNivel()%></li>
							<li><%=poke.getTipo()%></li>
							<li><a href="#"> <div class="icon"><img src="img/editar.png"></div> Alterar </a></li>
							<li><a href="#"> <div class="icon"><img src="img/lixeira.png"></div> Remover </a></li>
						</ul>
					</div>
                                        <%}%>
				</div>
			</div>

			<div style="clear:both;"></div>
			
			<%@ include file="footer.jsp" %>
		</div>
	</body>
</html>
