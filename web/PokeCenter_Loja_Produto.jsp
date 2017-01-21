<%@page import="dbAccess.Access"%>
<%@page import="treinadoresEtratadores.Treinador"%>
<%@page import="treinadoresEtratadores.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Itens.Produto"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/estilo.css">
                <%
                    ResultSet rs;
                    Usuario User = null;
                    Produto produt = null;
                    Access db = new Access();
                    int ID = Integer.parseInt(request.getParameter("ID"));
                    String query = "SELECT * FROM produto where ID="+ID;
                    rs = db.selectSQL(query);
                    if(rs.next()){
                        ID = Integer.parseInt(rs.getString("ID"));
                        String nome = rs.getString("nome");
                        float preco = Float.parseFloat(rs.getString("preco"));
                        String description = rs.getString("descricao");
                        String ImgPath = rs.getString("galeria_id");
                        query = "SELECT * FROM galeria where id="+ImgPath;
                        rs = db.selectSQL(query);
                        if(rs.next()){
                            response.addCookie(new Cookie("Bug1", query));
                            ImgPath=rs.getString("id")+"_"+rs.getString("id_img")+rs.getString("extensao");
                        } else{
                            ImgPath="default.png";
                        }
                        produt = new Produto(ID,nome,description,ImgPath,preco);
                    }
                    if(session.getAttribute("User") != null) {
                        User = (Usuario) session.getAttribute("User");
                    }
                    
                %>
                <script src="js/Venda.js"></script>
		<title><%=produt.getNome()%></title>
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
							<li><a href="PokeCenter_Loja_Carrinho.jsp"><%if(!User.getTratador()){out.print(((Treinador) User).getCarrinho().getQuantidade());}%><img src="img/sacola_pokecenter_branca.png"></a></li>
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
				<div id="produtoDescri"> 

					<div id="coluna1"> 
						<div class="bg-produto"> <div class="img-produto"> <img src="img/<%=produt.getImgPath()%>"> </div> </div> 
					</div>
					<div id="coluna2"> 
						<div class=""> 
							<h1> <%=produt.getNome()%> <br> R$ <%=produt.getPreco()%></h1>
							<p><%=produt.getDescricao()%></p>

							<form action="Venda" method="post" accept-charset="utf-8">
								Quantidade: 
                                                                <input type="hidden" name="acao" value="addProduto">
                                                                <input type="hidden" name="ID" value="<%=produt.getID()%>">
								<input type="number" name="quantidade" min="1" max="100" value="1"><br>
                                                                <input type="submit" value="ADICIONAR A SACOLA" class="botao_null" > 
							</form>
						</div> 
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