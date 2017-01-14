<%-- 
    Document   : PokeCenter_Loja
    Created on : 14/01/2017, 10:44:40
    Author     : Prog
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbAccess.Access"%>
<%@page import="java.util.List"%>
<%@page import="treinadoresEtratadores.Pokemon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/estilo.css">
		<title>Loja PokeCenter</title>
                <%
                List<Pokemon> Produtos = new ArrayList<Pokemon>();;
                String Resultado="";
                ResultSet rs;
                Access db = new Access();
                String query = "SELECT * FROM produto";
                rs = db.selectSQL(query);
                try{
                    while(rs.next()){
                        Pokemon poke = new Pokemon();
                        poke.setID(Integer.parseInt(rs.getString("ID")));
                        poke.setNome(rs.getString("nome"));
                        poke.setTipo("");
                        poke.setPreco(Float.parseFloat(rs.getString("preco")));
                        poke.setDescription(rs.getString("descricao"));
                        poke.setImgPath(rs.getString("galeria_id"));
                        Produtos.add(poke);
                    }
                    
                    for(Pokemon produto : Produtos){
                        query = "SELECT * FROM galeria where id="+produto.getImgPath();
                        rs = db.selectSQL(query);
                        if(rs.next()){
                            response.addCookie(new Cookie("Bug1", query));
                            produto.setImgPath(rs.getString("id")+"_"+rs.getString("id_img")+rs.getString("extensao"));
                        } else{
                            produto.setImgPath("default.png");
                        }
                    }
                }finally{
                    db.connectionClose();
                }
                %>
	</head>
	<body>
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
							<li><a href="#">000 <img src="img/sacola_pokecenter_branca.png"></a></li>
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
				<div id="Produto">
                                        <% for(Pokemon produto : Produtos){ %>
					<div id="Produto_<%=produto.getID()%>" class="produto">
						<div> <a href="PokeCenter_Loja_Produto.html"><img src="img/<%=produto.getImgPath()%>"></a> </div>
						<div> <a href="PokeCenter_Loja_Produto.html"><p> <%=produto.getNome()%> <br> <%=produto.getPreco()%> </p></a> </div>
					</div>
                                        <%}%>
					<div class="produto">
						<div> <a href="PokeCenter_Loja_Produto.html"><img src="img/default.png"></a> </div>
						<div> <a href="PokeCenter_Loja_Produto.html"><p> Produto Generico <br> R$ 20,00 </p></a> </div>
					</div>
					<div class="produto">
						<div> <a href="PokeCenter_Loja_Produto.html"><img src="img/default.png"></a> </div>
						<div> <a href="PokeCenter_Loja_Produto.html"><p> Produto Generico <br> R$ 20,00 </p></a> </div>
					</div>
					<div class="produto">
						<div> <a href="PokeCenter_Loja_Produto.html"><img src="img/default.png"></a> </div>
						<div> <a href="PokeCenter_Loja_Produto.html"><p> Produto Generico <br> R$ 20,00 </p></a> </div>
					</div>
					<div class="produto">
						<div> <a href="PokeCenter_Loja_Produto.html"><img src="img/default.png"> </a> </div>
						<div> <a href="PokeCenter_Loja_Produto.html"><p> Produto Generico <br> R$ 20,00 </p></a> </div>
					</div>
					<div class="produto">
						<div> <a href="PokeCenter_Loja_Produto.html"><img src="img/default.png"></a> </div>
						<div> <a href="PokeCenter_Loja_Produto.html"><p> Produto Generico <br> R$ 20,00 </p></a> </div>
					</div>
					<div class="produto">
						<div> <a href="PokeCenter_Loja_Produto.html"><img src="img/default.png"></a> </div>
						<div> <a href="PokeCenter_Loja_Produto.html"><p> Produto Generico <br> R$ 20,00 </p></a> </div>
					</div>
					<div class="produto">
						<div> <a href="PokeCenter_Loja_Produto.html"><img src="img/default.png"></a> </div>
						<div> <a href="PokeCenter_Loja_Produto.html"><p> Produto Generico <br> R$ 20,00 </p></a> </div>
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
</html>
