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
                    

			<div style="clear:both;"></div>

			<div id="conteudo">
				<div id="Busca">
					<input type="text" id="txtBusca" placeholder="Pesquisar..."/>
					<div id="lupa"> <img src="img/lupa.png" id="btBusca" alt="Buscar"/> </div>
				</div>
				<div id="produtoDescri">
					<h2>Meus Pokemons</h2>
					<div class="pokemon">
						<ul>
							<li><a href="PokeCenter_Pokemon.html">Nome Pokemon</a></li>
							<li>Nivel 00</li>
							<li>Tipo Pokemon</li>
							<li><a href="#"> <div class="icon"><img src="img/editar.png"></div> Alterar </a></li>
							<li><a href="#"> <div class="icon"><img src="img/lixeira.png"></div> Remover </a></li>
						</ul>
					</div>
					<div class="pokemon">
						<ul>
							<li><a href="PokeCenter_Pokemon.html">Nome Pokemon</a></li>
							<li>Nivel 00</li>
							<li>Tipo Pokemon</li>
							<li><a href="#"> <div class="icon"><img src="img/editar.png"></div> Alterar </a></li>
							<li><a href="#"> <div class="icon"><img src="img/lixeira.png"></div> Remover </a></li>
						</ul>
					</div>
					<div class="pokemon">
						<ul>
							<li><a href="PokeCenter_Pokemon.html">Nome Pokemon</a></li>
							<li>Nivel 00</li>
							<li>Tipo Pokemon</li>
							<li><a href="#"> <div class="icon"><img src="img/editar.png"></div> Alterar </a></li>
							<li><a href="#"> <div class="icon"><img src="img/lixeira.png"></div> Remover </a></li>
						</ul>
					</div>
					<div class="pokemon">
						<ul>
							<li><a href="PokeCenter_Pokemon.html">Nome Pokemon</a></li>
							<li>Nivel 00</li>
							<li>Tipo Pokemon</li>
							<li><a href="#"> <div class="icon"><img src="img/editar.png"></div> Alterar </a></li>
							<li><a href="#"> <div class="icon"><img src="img/lixeira.png"></div> Remover </a></li>
						</ul>
					</div>
				</div>
			</div>

			<div style="clear:both;"></div>
			
			<%@ include file="footer.jsp" %>
		</div>
	</body>
</html>
