<%@page import="dbAccess.Access"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/estilo.css">
		<title>Tratador - PokeCenter</title>
	</head>
	<body>
		<div id="container3">			
			<jsp:include page="header.jsp" >
                            <jsp:param name="Manter" value="false" />
                        </jsp:include>
                        <script>
                        function Editar(id){
                            post("cadastro.jsp",{Alter:id})
                        }
                        </script>
                        <script src="js/PostMethod.js"></script>
			<div style="clear:both;"></div>

			<div id="conteudo">
				<div id="Busca">
					<input type="text" id="txtBusca" placeholder="Pesquisar..."/>
					<div id="lupa"> <img src="img/lupa.png" id="btBusca" alt="Buscar"/> </div>
				</div>
				<div id="produtoDescri">
					<h2>Lista de Tratadores</h2>
                                        <%
                                        Access db = new Access();
                                        ResultSet rs = db.selectSQL("SELECT ID,nome FROM usuario where tratador=1;");
                                        int id;    
                                        while(rs.next()){
                                            id = Integer.parseInt(rs.getString("ID"));
                                        %>
					<div class="tratador">
						<ul>
							<li><a href="#" onclick="Editar(<%=id%>)"><%=rs.getString("nome")%></a></li>
							<li><a href="#" onclick="Editar(<%=id%>)"> <div class="icon"><img src="img/editar.png"></div> Alterar </a></li>
							<li><a href="#"> <div class="icon"><img src="img/lixeira.png"></div> Remover </a></li>
						</ul>
					</div>
                                        <%}
                                        db.connectionClose();
                                        %>

				</div>
			</div>

			<div style="clear:both;"></div>
			
			<%@ include file="footer.jsp" %>
		</div>
	</body>
</html>