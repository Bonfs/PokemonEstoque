<%@page import="vendas.VendaProduto"%>
<%@page import="treinadoresEtratadores.Tratador"%>
<%@page import="treinadoresEtratadores.Treinador"%>
<%@page import="treinadoresEtratadores.Usuario"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/estilo.css">
		<title>Sacola de Compras</title>
	</head>
	<body>
                <%
                    Usuario User = null;
                    if(session.getAttribute("User") != null) {
                        User = (Usuario) session.getAttribute("User");
                    }
                    float Total = 0;
                    int counter = 0;
                %>
		<div id="container3">			
			<header>
				<div id="menu_topo">
					<div id="logo_lj"><a href="PokeCenter_Loja.html"><img src="img/logo_pokecenter_branca.png" alt="PokeCenter logo"></a></div>
					<nav id="menuSite">
						<ul>
							<li><a href="#">Sobre Nós</a></li>
							<li><a href="#">Central de Ajuda</a></li>
							<li><a href="#">Fale Conosco</a></li>
						</ul>
					</nav>
					<nav id="menuUser">
						<ul>
							<li><a href="PokeCenter_Loja_Carrinho.jsp"><%if(!User.getTratador()){out.print(((Treinador) User).getCarrinho().getQuantidade());}%><img src="img/sacola_pokecenter_branca.png"></a></li>
                                                        <%if(User == null) {%>
							<li><a href="home.jsp">Login</a></li>
                                                        <%}else{%>
                                                        <li><a href="PokeCenter_Tratador_Perfil.html"><%=User.getNome()%></a><br/><a href="${pageContext.request.contextPath}/LoginServlet?acao=Deslogar">Sair</a></li>
							<!--li></li-->
                                                        <%}%>
						</ul>
					</nav>
				</div>	
			</header>
                        <script>
                            var myTimer;
                            function post(path, params, method) {
                                console.log("Entrou no POST");
                                method = method || "post"; // Set method to post by default if not specified.

                                // The rest of this code assumes you are not using a library.
                                // It can be made less wordy if you use one.
                                var form = document.createElement("form");
                                form.setAttribute("method", method);
                                form.setAttribute("action", path);

                                for(var key in params) {
                                    if(params.hasOwnProperty(key)) {
                                        var hiddenField = document.createElement("input");
                                        hiddenField.setAttribute("type", "hidden");
                                        hiddenField.setAttribute("name", key);
                                        hiddenField.setAttribute("value", params[key]);
                                        console.log(key+" "+params[key]);
                                        form.appendChild(hiddenField);
                                     }
                                }

                                document.body.appendChild(form);
                                form.submit();
                            }
                            function alterQuantidade(id){
                                for(var i = 0;i<document.getElementsByName("quantidade").length;i++)
                                    post("Venda",{acao:'AlterProduto',ID:i,quantdd:document.getElementsByName("quantidade")[i].value},"post");
                            }
                            function alterValue(id){
                                window.clearTimeout(myTimer);
                                myTimer = setTimeout(function(id){
                                    alterQuantidade(id);
                                }, 3000);
                            }
                            
                            
                        </script>
                        
			<div style="clear:both;"></div>

			<div id="conteudo">
				<div id="Busca">
					<input type="text" id="txtBusca" placeholder="Pesquisar..."/>
					<div id="lupa"> <img src="img/lupa.png" id="btBusca" alt="Buscar"/> </div>
				</div>
				<div id="produtoDescri">

					<h2>Sacola de Compras</h2>

					<%if(User!=null && !User.getTratador() && (((Treinador) User).getCarrinho().getQuantidade()) > 0){
                                            for(VendaProduto produt : ((Treinador) User).getCarrinho().getLista()){%>
					<div class="elemento_carrinho">
						<div class="col1_elemento_carrinho">
							<div class="bg-produto"> <div class="img-produto"> <img src="img/<%=produt.getProduto().getImgPath()%>"> </div> </div>
						</div>
						<div class="col2_elemento_carrinho">
							<h2><%=produt.getProduto().getNome()%></h2>
							<p><%=produt.getProduto().getDescricao()%></p>
							<br>
							<ul>
                                                            <li><a href="Venda?acao=REMOVER&ID=<%=counter%>"><div class="icon_lixeira"><img src="img/lixeira.png"></div>Remover produto</a></li>
                                                                <li>QUANTIDADE: <input type="number" name="quantidade" min="1" max="100" onclick="alterValue(<%=counter%>)" value="<%=produt.getQuantidade()%>"></li>
							</ul>
						</div>

						<div class="col3_elemento_carrinho">
							<div>Unidade: R$ <%=produt.getProduto().getPreco()%></div>
							<div>SubTotal: R$ <%=produt.getProduto().getPreco()*produt.getQuantidade()%></div>
                                                        <%Total+=produt.getProduto().getPreco()*produt.getQuantidade();%>
                                                </div>
					</div>

					<div style="clear: both"></div>
                                        
                                        <%counter++;}}%>
					
					<div id="baseCarrinho">
						<div class="col1_carrinho"> <h3>Total: R$<%=Total%></h3> </div>
						<div class="col2_carrinho"> <div class="botao_null">FINALIZAR COMPRA</div> </div>
					</div> 

				</div>
			</div>

			<div style="clear:both;"></div>
			
			<footer>
				<center>
					<div id="footer1"><p>Poke Center © 2016</p></div>
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
		
		}else{ //Deixa a caixa vazia com a mensagem: Sacola está vazia 
			
			var x = document.getElementById("produtoDescri");
			x.getElementsByTagName("h2")[0].style.textAlign = "center";
			x.getElementsByTagName("h2")[0].innerHTML = "Sacola está vazia";
			document.getElementById("baseCarrinho").style.display = "none";
		}
		
	</script>
</html>