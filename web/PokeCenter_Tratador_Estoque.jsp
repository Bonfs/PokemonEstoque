<%@page import="dbAccess.Access"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Itens.Produto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/estilo.css">
		<title>Estoque - PokeCenter</title>
	</head>
	<body>
		<div id="container3">		
			<jsp:include page="header.jsp" >
                            <jsp:param name="Manter" value="false" />
                        </jsp:include>
                        <%List<Produto> Produtos = new ArrayList<Produto>();;
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
                        }%>

			<div style="clear:both;"></div>

			<div id="conteudo">
				<div id="Busca">
					<input type="text" id="txtBusca" placeholder="Pesquisar..."/>
					<div id="lupa"> <img src="img/lupa.png" id="btBusca" alt="Buscar"/> </div>
				</div>

				<div id="produtoDescri">
					<h2>Estoque de Produtos</h2>
                                        <%for(Produto produto : Produtos){ %>
					<div class="produto_estoque">
						<ul>
							<li> <div class="produto_estoque_img"> <img src="img/<%=produto.getImgPath()%> "> </div> </li>
							<li> <%=produto.getNome()%> </li>
							<li> <%=produto.getPreco()%> </li>
							<li> <%=produto.getDescricao()%> </li>
						</ul>
					</div>
                                        <%}%>
				</div>
			</div>

			<div style="clear:both;"></div>
			
			<%@ include file="footer.jsp" %>
		</div>
	</body>
</html>