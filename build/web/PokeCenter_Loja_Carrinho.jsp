<%@page import="Itens.Produto"%>
<%@page import="vendas.VendaProduto"%>
<%@page import="treinadoresEtratadores.Tratador"%>
<%@page import="treinadoresEtratadores.Treinador"%>
<%@page import="treinadoresEtratadores.Usuario"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/estilo.css">
                <script src="js/PostMethod.js"></script>
                <%
                    Usuario User = null;
                    if(session.getAttribute("User") != null) {
                        User = (Usuario) session.getAttribute("User");
                    }
                %>
		<title>Sacola de Compras</title>
	</head>
	<body>
                <%
                    float Total = 0;
                    int counter = 0;
                %>
		<div id="container3">			
			
                    <jsp:include page="header.jsp" >
                        <jsp:param name="Manter" value="false" />
                    </jsp:include>
                        <script>
                            var timeToAlter;
                            function alterQuantidade(id){
                                for(var i = 0;i<document.getElementsByName("quantidade").length;i++)
                                    post("Venda",{acao:'AlterProduto',ID:i,quantdd:document.getElementsByName("quantidade")[i].value},"post");
                            }
                            function alterValue(id){
                                window.clearTimeout(timeToAlter);
                                timeToAlter = setTimeout(function(id){
                                    alterQuantidade(id);
                                }, 3000);
                            }
                            function Finaliza(){
                                post("Venda",{acao:'Finaliza'},"post");
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

					<%if(User!=null && !User.isTratador() && (((Treinador) User).getCarrinho().getQuantidade()) > 0){
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
							<div>Unidade: R$ <%=produt.getProduto().getPrecoString()%></div>
							<div>SubTotal: R$ <%=produt.getProduto().getPrecoString(produt.getProduto().getPreco()*produt.getQuantidade())%></div>
                                                        <%Total+=produt.getProduto().getPreco()*produt.getQuantidade();%>
                                                </div>
					</div>

					<div style="clear: both"></div>
                                        
                                        <%counter++;}}%>
					
					<div id="baseCarrinho">
						<div class="col1_carrinho"> <h3>Total: R$<%=new Produto().getPrecoString(Total)%></h3> </div>
                                                <div class="col2_carrinho" onclick="Finaliza()"> <div class="botao_null">FINALIZAR COMPRA</div> </div>
					</div> 

				</div>
			</div>

			<div style="clear:both;"></div>
                        
                        <%@ include file="footer.jsp" %>
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