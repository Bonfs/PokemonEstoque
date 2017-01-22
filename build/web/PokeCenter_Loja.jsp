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
                Access db = new Access();
                String query = "SELECT * FROM produto";
                rs = db.selectSQL(query);
                try{
                    while(rs.next()){
                        int ID = Integer.parseInt(rs.getString("ID"));
                        String nome = rs.getString("nome");
                        float preco = Float.parseFloat(rs.getString("preco"));
                        String descricao = rs.getString("descricao");
                        String ImgPath = rs.getString("galeria_id");
                        Produto produt = new Produto(ID,nome,descricao,ImgPath,preco);
                        Produtos.add(produt);
                    }
                    
                    for(Produto produto : Produtos){
                        query = "SELECT * FROM galeria where id="+produto.getImgPath();
                        rs = db.selectSQL(query);
                        if(rs.next()){
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
                    <jsp:include page="header.jsp" >
                        <jsp:param name="Manter" value="True" />
                    </jsp:include>
			<div style="clear:both;"></div>

			<div id="conteudo">
				<div id="Busca">
					<input type="text" id="txtBusca" placeholder="Pesquisar..."/>
					<div id="lupa"> <img src="img/lupa.png" id="btBusca" alt="Buscar"/> </div>
				</div>
				<div id="Produto">
                                        <% for(Produto produto : Produtos){ %>
					<div id="Produto_<%=produto.getID()%>" class="produto">
						<div> <a href="PokeCenter_Loja_Produto.jsp?ID=<%=produto.getID()%>"><img src="img/<%=produto.getImgPath()%>"></a> </div>
						<div> <a href="PokeCenter_Loja_Produto.jsp?ID=<%=produto.getID()%>"><p> <%=produto.getNome()%> <br> <%=produto.getPreco()%> </p></a> </div>
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
			
                        <%@ include file="footer.jsp" %>
		</div>
	</body>
</html>
