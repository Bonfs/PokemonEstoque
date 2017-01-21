<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/estilo.css">
		<title>Sacola de Compras</title>
	</head>
	<body>
		<div id="container3">			
			<header>
				<div id="menu_topo">
					<div id="logo_lj"><a href="PokeCenter_Loja.html"><img src="img/logo_pokecenter_branca.png" alt="PokeCenter logo"></a></div>
					<nav id="menuSite">
						<ul>
							<li><a href="#">Sobre N�s</a></li>
							<li><a href="#">Central de Ajuda</a></li>
							<li><a href="#">Fale Conosco</a></li>
						</ul>
					</nav>
					<nav id="menuUser">
						<ul>
							<li><a href="PokeCenter_Loja_Carrinho.html">000 <img src="img/sacola_pokecenter_branca.png"></a></li>
							<li><a href="home.jsp">Login</a></li>
						</ul>
					</nav>
				</div>	
			</header>

			<div style="clear:both;"></div>

			<div id="conteudo">
				<div id="Busca">
					<input type="text" id="txtBusca" placeholder="Pesquisar..."/>
					<div id="lupa"> <img src="img/lupa.png" id="btBusca" alt="Buscar"/> </div>
				</div>
				<div id="produtoDescri">

					<h2>Sacola de Compras</h2>

					<div class="elemento_carrinho">
						<div class="col1_elemento_carrinho">
							<div class="bg-produto"> <div class="img-produto"> <img src="img/default.png"> </div> </div>
						</div>
						<div class="col2_elemento_carrinho">
							<h2>Produto Generico</h2>
							<p>Evidentemente, a percep��o das � uma das consequ�ncias do processo de comunica��o como um todo.</p>
<<<<<<< HEAD
=======
							<br>
>>>>>>> 12f8a637d836d2cbeea5ea9a49255f7cba2c15a2
							<ul>
								<li><a href="#"><div class="icon_lixeira"><img src="img/lixeira.png"></div>Remover produto</a></li>
								<li>QUANTIDADE: <input type="number" name="quantidade" min="1" max="100" value="1"></li>
							</ul>
						</div>

						<div class="col3_elemento_carrinho">
							<div>Unidade: R$ 00,00</div>
							<div>SubTotal: R$ 00,00</div>
						</div>
					</div>

<<<<<<< HEAD
					<div style="clear: both"></div>

=======
>>>>>>> 12f8a637d836d2cbeea5ea9a49255f7cba2c15a2
					<div class="elemento_carrinho">
						<div class="col1_elemento_carrinho">
							<div class="bg-produto"> <div class="img-produto"> <img src="img/default.png"> </div> </div>
						</div>
						<div class="col2_elemento_carrinho">
							<h2>Produto Generico</h2>
							<p>Evidentemente, a percep��o das � uma das consequ�ncias do processo de comunica��o como um todo.</p>
<<<<<<< HEAD
=======
							<br>
>>>>>>> 12f8a637d836d2cbeea5ea9a49255f7cba2c15a2
							<ul>
								<li><a href="#"><div class="icon_lixeira"><img src="img/lixeira.png"></div>Remover produto</a></li>
								<li>QUANTIDADE: <input type="number" name="quantidade" min="1" max="100" value="1"></li>
							</ul>
						</div>

						<div class="col3_elemento_carrinho">
							<div>Unidade: R$ 00,00</div>
							<div>SubTotal: R$ 00,00</div>
						</div>
					</div>
<<<<<<< HEAD

					<div style="clear: both"></div>
=======
>>>>>>> 12f8a637d836d2cbeea5ea9a49255f7cba2c15a2
					
					<div class="elemento_carrinho">
						<div class="col1_elemento_carrinho">
							<div class="bg-produto"> <div class="img-produto"> <img src="img/default.png"> </div> </div>
						</div>
						<div class="col2_elemento_carrinho">
							<h2>Produto Generico</h2>
							<p>Evidentemente, a percep��o das � uma das consequ�ncias do processo de comunica��o como um todo.</p>
<<<<<<< HEAD
=======
							<br>
>>>>>>> 12f8a637d836d2cbeea5ea9a49255f7cba2c15a2
							<ul>
								<li><a href="#"><div class="icon_lixeira"><img src="img/lixeira.png"></div>Remover produto</a></li>
								<li>QUANTIDADE: <input type="number" name="quantidade" min="1" max="100" value="1"></li>
							</ul>
						</div>

						<div class="col3_elemento_carrinho">
							<div>Unidade: R$ 00,00</div>
							<div>SubTotal: R$ 00,00</div>
						</div>
					</div>
<<<<<<< HEAD

					<div style="clear: both"></div>
=======
>>>>>>> 12f8a637d836d2cbeea5ea9a49255f7cba2c15a2
					
					<div id="baseCarrinho">
						<div class="col1_carrinho"> <h3>Total: R$00,00</h3> </div>
						<div class="col2_carrinho"> <div class="botao_null">FINALIZAR COMPRA</div> </div>
					</div> 

				</div>
			</div>

			<div style="clear:both;"></div>
			
			<footer>
				<center>
					<div id="footer1"><p>Poke Center � 2016</p></div>
					<div id="footer_2">
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
	<script type="text/javascript">

		var numero = document.getElementsByClassName("elemento_carrinho").length;
		
		if(numero > 0){ //Conta quantidade de elementos na sacola e exibe no titulo
		
			var x = document.getElementById("produtoDescri");
			var txt = x.getElementsByTagName("h2")[0].innerText;
			x.getElementsByTagName("h2")[0].innerHTML = txt + " ("+numero+")";
		
		}else{ //Deixa a caixa vazia com a mensagem: Sacola est� vazia 
			
			var x = document.getElementById("produtoDescri");
			x.getElementsByTagName("h2")[0].style.textAlign = "center";
			x.getElementsByTagName("h2")[0].innerHTML = "Sacola est� vazia";
			document.getElementById("baseCarrinho").style.display = "none";
		}
		
	</script>
</html>