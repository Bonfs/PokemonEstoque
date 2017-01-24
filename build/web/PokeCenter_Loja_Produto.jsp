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
                    Usuario User = null;
                    if(session.getAttribute("User") != null) {
                        User = (Usuario) session.getAttribute("User");
                    }
                    ResultSet rs;
                    Produto produt = null;
                    Access db = new Access();
                    int quantidade =0;
                    if(request.getParameter("ID") != null){
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
                                ImgPath=rs.getString("id")+"_"+rs.getString("id_img")+rs.getString("extensao");
                            } else{
                                ImgPath="default.png";
                            }
                            produt = new Produto(ID,nome,description,ImgPath,preco);
                        }
                        while(rs.next());
                        query = "SELECT quantidade as q FROM estoque_produto where produto_id="+produt.getID();
                        rs = db.selectSQL(query);
                        System.out.println(rs.getString("q"));
                        quantidade = (Integer.parseInt(rs.getString("q")));
                        if(quantidade<=0)
                            response.sendRedirect("PokeCenter_Loja.jsp");
                    }else{
                        response.sendRedirect("Pagina_Nao_Encontrada.html");
                    }
                    db.connectionClose();
                %>
                <script src="js/Venda.js"></script>
		<title><%=produt.getNome()%></title>
	</head>
	<body>
		<div id="container3">
                        <jsp:include page="header.jsp" >
                            <jsp:param name="Manter" value="false" />
                        </jsp:include>
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
							<h1> <%=produt.getNome()%> <br> R$ <%=produt.getPrecoString()%></h1>
							<p><%=produt.getDescricao()%></p>

                                                        <form action="<%if(User != null)out.print("Venda");else out.print("PokeCenter_Loja.jsp");%>" method="post" accept-charset="utf-8">
								Quantidade: 
                                                                <input type="hidden" name="acao" value="addProduto">
                                                                <input type="hidden" name="ID" value="<%=produt.getID()%>">
                                                                <input type="number" name="quantidade" min="1" max="<%if(quantidade>100)out.print("100"); else out.print(quantidade);%>" value="1"><br>
                                                                <input type="submit" value="ADICIONAR A SACOLA" class="botao_null" > 
							</form>
						</div> 
					</div>

				</div>
				
			</div>

			<div style="clear:both;"></div>
                        
			 <%@ include file="footer.jsp" %>
		</div>
	</body>
</html>