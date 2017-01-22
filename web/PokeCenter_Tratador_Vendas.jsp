<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dbAccess.Access"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/estilo.css">
		<title>Vendas - PokeCenter</title>
	</head>
	<body>
		<div id="container3">			
			<%@ include file="header.jsp" %>
                        <%
                        //SELECT v.ID,v.data_de_venda,u.nome from venda as v,usuario as u where v.treinador_id=u.ID;
                        //SELECT p.nome,v.quantidade,p.preco from venda_item as v,produto as p where v.venda_id=1 AND v.produto_id=p.ID;

                        ResultSet rs;
                        Access db = new Access();
                        String query = "SELECT v.ID,v.data_de_venda,u.nome from venda as v,usuario as u where v.treinador_id=u.ID;";
                        rs = db.selectSQL(query);
                        ArrayList <ArrayList> vendas = new ArrayList();
                        
                        while(rs.next()){
                            ArrayList venda = new ArrayList();
                            venda.add(Integer.parseInt(rs.getString("ID")));
                            venda.add(rs.getString("data_de_venda"));
                            venda.add(rs.getString("nome"));
                            vendas.add(venda);
                        }
                        query = "SELECT p.nome,v.quantidade,p.preco from venda_item as v,produto as p where v.venda_id=1 AND v.produto_id=p.ID;";
                        rs = db.selectSQL(query);
                        %>
			<div style="clear:both;"></div>

			<div id="conteudo">
				<div id="Busca">
					<input type="text" id="txtBusca" placeholder="Pesquisar..."/>
					<div id="lupa"> <img src="img/lupa.png" id="btBusca" alt="Buscar"/> </div>
				</div>

				<div id="produtoDescri">
					<h2>Vendas Realizadas</h2>
                                        <%
                                        int counter = 0;
                                        float total;
                                        for(ArrayList venda : vendas){
                                            total=0;
                                            if(counter == 0){
                                                out.println("<div class=\"linha\">");
                                            }
                                        %>
						<div class="venda_feita">
							<ul>
								<li> Codigo Venda: <%=venda.get(0)%> </li>
								<li> Data: <%=venda.get(1)%> </li>
								<li> Cliente: <%=venda.get(2)%> </li>
								<li> 	 
                                                                        <%
                                                                        query = "SELECT p.nome,v.quantidade,p.preco from venda_item as v,produto as p where v.venda_id="+venda.get(0)+" AND v.produto_id=p.ID;";
                                                                        rs = db.selectSQL(query);
                                                                        while(rs.next()){
                                                                           float total_produto = Integer.parseInt(rs.getString("quantidade"))*Float.parseFloat(rs.getString("preco"));
                                                                           total+=total_produto;
                                                                        %>
									<li>											
										<ul> 
											<li><%=rs.getString("nome")%></li>
											<li><%=rs.getString("quantidade")%></li>
											<li>R$ <%=total_produto%></li>
										</ul> 
									</li>
                                                                        <%}%> 
								</li>
								<li> Preço total: R$ <%=total%> </li>
							</ul>
						</div>
					<%
                                           if(counter >= 3){
                                               counter = 0;
                                                out.println("</div>");
                                                out.println("<div style=\"clear: both;\"></div>");
                                            }else{
                                                counter++;
                                            }
                                        }%>
					
					

				</div>
			</div>

			<div style="clear:both;"></div>
			
			<%@ include file="footer.jsp" %>
		</div>
	</body>
</html>