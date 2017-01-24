<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbAccess.Access"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <script src="js/PostMethod.js"></script>
                        <script>
                            function TreinadorSelected(){
                                var trei1 = document.getElementsByName("treinador01")[0].value;
                                var trei2 = document.getElementsByName("treinador02")[0].value;
                                post("PokeCenter_Tratador_Troca.jsp",{Trei1:trei1,Trei2:trei2});
                            }
                        </script>
                        <%
                        int Trei1=-1,Trei2=-1;
                        if(request.getParameter("Trei1") != null) {
                            Trei1 = Integer.parseInt(request.getParameter("Trei1"));
                        }
                        if(request.getParameter("Trei2") != null) {
                            Trei2 = Integer.parseInt(request.getParameter("Trei2"));
                        }
                        
                        Access db = new Access();
                        String query = "SELECT ID,NOME FROM usuario where ID in (SELECT ID_Treinador from pokemon where dispTroca=1);";
                        ResultSet rs = db.selectSQL(query);
                        List<List> Treinadores = new ArrayList<List>();
                        while(rs.next()){
                            List<String> l = new ArrayList<String>();
                            l.add(rs.getString("ID"));
                            l.add(rs.getString("NOME"));
                            Treinadores.add(l);
                        }
                        
                        List<List> Pokemons = new ArrayList<List>();
                        for(List<List> treinador : Treinadores){
                            query = "SELECT ID,NOME from pokemon where dispTroca=1 and Id_Treinador="+treinador.get(0);
                            rs = db.selectSQL(query);
                            List<List> Pokemon = new ArrayList<List>();
                            while(!rs.isClosed() && rs.next()){
                                List<String> l = new ArrayList<String>();
                                l.add(rs.getString("ID"));
                                l.add(rs.getString("NOME"));
                                Pokemon.add(l);
                            }
                            Pokemons.add(Pokemon);
                        }
                        %>
			<div style="clear:both;"></div>
                        
			<div id="conteudo">
                                <script>
                                    function Submit(){
                                        var poke01 = document.getElementsByName("pokemon01")[0].value;
                                        var poke02 = document.getElementsByName("pokemon02")[0].value;
                                        post("PokemonServlet",{acao:"TrocaPoke",Trei1:<%=Treinadores.get((Trei1==-1)?0:Trei1).get(0)%>,Trei2:<%=Treinadores.get((Trei2==-1)?0:Trei2).get(0)%>,poke01:poke01,poke02:poke02});
                                    }
                                </script>
				<div id="Busca">
					<input type="text" id="txtBusca" placeholder="Pesquisar..."/>
					<div id="lupa"> <img src="img/lupa.png" id="btBusca" alt="Buscar"/> </div>
				</div>
				<div id="produtoDescri">
					<h2>Troca</h2>
					<div>
						<div class="col-troca01">
							Selecione 1º treinador: 							
							<select name="treinador01">
                                <%  int counter=0;
                                    for(List<String> treinador : Treinadores){%>                            
                                <option onclick="TreinadorSelected()" value="<%=counter%>" <%if(counter == Trei1)out.print("selected");%>><%=treinador.get(1)%></option>
                                <%counter++;}%>
                            </select>

                            <br><br>

                            Selecione Pokemon do 1º treinador: 							
							<select name="pokemon01">
                                <%
                                    System.out.print("pt01");
                                if(Trei1!=-1){
                                    List<List> pokes = Pokemons.get(Trei1);
                                    for(List<String> poke : pokes){
                                %>
                                <option value="<%=poke.get(0)%>"><%=poke.get(1)%></option>
                                    <%}
                                }%>
                            </select>
						</div>
                                                <a href="#" onclick="Submit()"><div class="col-troca02">
							<div><img src="img/trocar.png"></div>
							<p>Fazer troca</p>
						</div></a>
						<div class="col-troca03">
							Selecione 2º treinador: 							
							<select name="treinador02">
                                <%  counter=0;
                                for(List<String> treinador : Treinadores){%>                            
                                <option onclick="TreinadorSelected()" value="<%=counter%>" <%if(counter == Trei2)out.print("selected");%>><%=treinador.get(1)%></option>
                                <%counter++;}System.out.print("pt02");%>
                            </select>

                            <br><br>

                            Selecione Pokemon do 2º treinador: 							
							<select name="pokemon02">
                                <%
                                if(Trei2!=-1){System.out.print("pt03");
                                    List<List> pokes = Pokemons.get(Trei2);
                                    for(List<String> poke : pokes){
                                %>
                                <option value="<%=poke.get(0)%>"><%=poke.get(1)%></option>
                                    <%}
                                }System.out.print("pt04");%>
                            </select>
						</div>
					</div>
				</div>
			</div>

			<div style="clear:both;"></div>
			
			<%@ include file="footer.jsp" %>
		</div>
	</body>
</html>
