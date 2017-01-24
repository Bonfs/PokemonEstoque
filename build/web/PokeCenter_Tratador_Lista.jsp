<%@page import="treinadoresEtratadores.Usuario"%>
<%@page import="dbAccess.Access"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/estilo.css">
		<title>Tratador - PokeCenter</title>
                <script src="js/PostMethod.js"></script>
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
                        function Excluir(id){
                            post("PokeCenter_Tratador_Lista.jsp",{Exclui_Func:id})
                        }
                        </script>
			<div style="clear:both;"></div>

			<div id="conteudo">
				<div id="Busca">
					<input type="text" id="txtBusca" placeholder="Pesquisar..."/>
					<div id="lupa"> <img src="img/lupa.png" id="btBusca" alt="Buscar"/> </div>
				</div>
				<div id="produtoDescri">
					<h2>Lista de Tratadores</h2>
                                        <%
                                        Usuario User = null;
                                        if(session.getAttribute("User") != null) {
                                            User = (Usuario) session.getAttribute("User");
                                        }
                                        Access db = new Access(); 
                                        if(request.getParameter("Exclui_Func") != null){
                                            int id = Integer.parseInt(request.getParameter("Exclui_Func"));
                                            String query = "DELETE FROM usuario WHERE ID="+id;
                                            db.insertSQL(query);

                                            query = "DELETE FROM tratador WHERE tratador_id="+id;
                                            db.insertSQL(query);
                                        }
                                        ResultSet rs = db.selectSQL("SELECT ID,nome FROM usuario where tratador=1;");
                                        int id;    
                                        while(rs.next()){
                                            id = Integer.parseInt(rs.getString("ID"));
                                            if(User.getID()!=id){
                                        %>
					<div class="tratador">
						<ul>
							<li><a href="#" onclick="Editar(<%=id%>)"><%=rs.getString("nome")%></a></li>
							<li><a href="#" onclick="Editar(<%=id%>)"> <div class="icon"><img src="img/editar.png"></div> Alterar </a></li>
							<li><a href="#" onclick="Excluir(<%=id%>)"> <div class="icon"><img src="img/lixeira.png"></div> Remover </a></li>
						</ul>
					</div>
                                        <%}
                                        }
                                        db.connectionClose();
                                        %>

				</div>
			</div>

			<div style="clear:both;"></div>
			
			<%@ include file="footer.jsp" %>
		</div>
	</body>
</html>