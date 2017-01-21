<%-- 
    Document   : PokeCenter_Loja
    Created on : 14/01/2017, 10:44:40
    Author     : Prog
--%>

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
                List<Produto> Produtos = new ArrayList<Produto>();;
                String Resultado="";
                ResultSet rs;
                Usuario User = null;
                Access db = new Access();
                String query = "SELECT * FROM produto";
                rs = db.selectSQL(query);
                try{
                    while(rs.next()){
                        int ID = Integer.parseInt(rs.getString("ID"));
                        String nome = rs.getString("nome");
                        float preco = Float.parseFloat(rs.getString("preco"));
                        String description = rs.getString("descricao");
                        String ImgPath = rs.getString("galeria_id");
                        Produto produt = new Produto(ID,nome,description,ImgPath,preco);
                        Produtos.add(produt);
                    }
                    
                    for(Produto produto : Produtos){
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
                    HttpSession sessao = request.getSession();
                    
                    if(session.getAttribute("User") != null) {
                        User = (Usuario) session.getAttribute("User");
                    }
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

			<div style="clear:both;"></div>

			<div id="conteudo">
				<div id="Busca">
					<input type="text" id="txtBusca" placeholder="Pesquisar..."/>
					<div id="lupa"> <img src="img/lupa.png" id="btBusca" alt="Buscar"/> </div>
				</div>
				<div id="Produto">
                                        <% for(Produto produto : Produtos){ %>
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
