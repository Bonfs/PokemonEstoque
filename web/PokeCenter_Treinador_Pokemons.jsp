<%@page import="java.sql.ResultSet"%>
<%@page import="dbAccess.Access"%>
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
                        <script>
                        function Editar(id){
                            post("cadastro_pokemon.jsp",{AlterPoke:id})
                        }
                        function Excluir(id){
                            post("PokeCenter_Treinador_Pokemons.jsp",{Exclui_Poke:id})
                        }
                        </script>
                        <%
                            Usuario User = null;
                            if(session.getAttribute("User") != null) {
                                User = (Usuario) session.getAttribute("User");
                            }
                            Access db = new Access(); 
                            if(request.getParameter("Exclui_Poke") != null){
                                int galeria_id = -1;
                                int id = ((Treinador) User).getPokemon(Integer.parseInt(request.getParameter("Exclui_Poke"))).getID();
                                ResultSet rs = db.selectSQL("SELECT galeria_id as g FROM pokemon WHERE ID="+id);
                                if(rs.next() && rs.getString("g") != null)
                                    galeria_id = Integer.parseInt(rs.getString("g"));
                                
                                String query = "DELETE FROM pokemon WHERE ID="+id;
                                db.insertSQL(query);
                                if(galeria_id != -1){
                                    query = "DELETE FROM galeria WHERE id="+galeria_id;
                                    db.insertSQL(query);
                                }
                                ((Treinador) User).atualizaBolsa();
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
                                        <%  int i=0;
                                            for(Pokemon poke: ((Treinador) User).getPokemons()){%>
					<div class="pokemon">
						<ul>
							<li><a href="PokeCenter_Pokemon.html"><%=poke.getNome()%></a></li>
							<li><%=poke.getNivel()%></li>
							<li><%=poke.getTipo()%></li>
							<li><a href="#" onclick="Editar(<%=i%>)"> <div class="icon"><img src="img/editar.png"></div> Alterar </a></li>
							<li><a href="#" onclick="Excluir(<%=i%>)"> <div class="icon"><img src="img/lixeira.png"></div> Remover </a></li>
						</ul>
					</div>
                                        <%i++;}%>
				</div>
			</div>

			<div style="clear:both;"></div>
			
			<%@ include file="footer.jsp" %>
		</div>
	</body>
</html>
