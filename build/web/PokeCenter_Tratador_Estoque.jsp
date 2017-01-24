<%@page import="vendas.Estoque"%>
<%@page import="dbAccess.Access"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Itens.Produto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/estilo.css">
		<title>Estoque - PokeCenter</title>
	</head>
	<body>
		<div id="container3">		
			<jsp:include page="header.jsp" >
                            <jsp:param name="Manter" value="false" />
                        </jsp:include>
                        <%
                        Estoque estoque = new Estoque();
                        %>

			<div style="clear:both;"></div>

			<div id="conteudo">
				<div id="Busca">
					<input type="text" id="txtBusca" placeholder="Pesquisar..."/>
					<div id="lupa"> <img src="img/lupa.png" id="btBusca" alt="Buscar"/> </div>
				</div>

				<div id="produtoDescri">
					<h2>Estoque de Produtos</h2>
                                        <%
                                        int counter = 0;
                                        for(Produto produto : estoque.getProdutos()){ 
                                            if(estoque.getQuantidade_Produto(counter)>=0){
                                        %>
					<div class="produto_estoque">
						<ul>
							<li> <div class="produto_estoque_img"> <img src="img/<%=produto.getImgPath()%> "> </div> </li>
							<li> <%=produto.getNome()%> </li>
							<li>R$ <%=produto.getPrecoString()%> </li>
							<li> <%=estoque.getQuantidade_Produto(counter)%> </li>
						</ul>
					</div>
                                        <%
                                            }
                                        counter++;
                                        }
                                        %>
				</div>
			</div>

			<div style="clear:both;"></div>
			
			<%@ include file="footer.jsp" %>
		</div>
	</body>
</html>