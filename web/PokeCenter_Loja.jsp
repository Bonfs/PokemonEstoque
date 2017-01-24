<%-- 
    Document   : PokeCenter_Loja
    Created on : 14/01/2017, 10:44:40
    Author     : Prog
--%>

<%@page import="vendas.Estoque"%>
<%@page import="Itens.Produto"%>
<%@page import="treinadoresEtratadores.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbAccess.Access"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/estilo.css">
		<title>Loja PokeCenter</title>
                <%
                    Estoque estoque = new Estoque();
                %>
                <script src="js/Convert.js"></script>
	</head>
	<body>
		<div id="container3">
                    <jsp:include page="header.jsp" >
                        <jsp:param name="Manter" value="True" />
                        <jsp:param name="Loja" value="True" />
                    </jsp:include>
			<div style="clear:both;"></div>

			<div id="conteudo">
				<div id="Busca">
					<input type="text" id="txtBusca" placeholder="Pesquisar..."/>
					<div id="lupa"> <img src="img/lupa.png" id="btBusca" alt="Buscar"/> </div>
				</div>
				<div id="Produto">
                                        <% 
                                            int counter =0;
                                            for(Produto produto : estoque.getProdutos()){ 
                                            if(estoque.getQuantidade_Produto(counter) > 0){
                                        %>
					<div id="Produto_<%=produto.getID()%>" class="produto">
						<div> <a href="PokeCenter_Loja_Produto.jsp?ID=<%=produto.getID()%>"><img src="img/<%=produto.getImgPath()%>"></a> </div>
						<div> <a href="PokeCenter_Loja_Produto.jsp?ID=<%=produto.getID()%>"><p> <%=produto.getNome()%> <br>R$ <%=produto.getPrecoString()%> </p></a> </div>
					</div>
                                        <%}
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
