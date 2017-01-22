
<%@page import="treinadoresEtratadores.*"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
                <%
                    Usuario User = null;
                    if(session.getAttribute("User") != null) {
                        User = (Usuario) session.getAttribute("User");
                    }
                %>
		<link rel="stylesheet" type="text/css" href="css/estilo.css">
                <title><%if(User.isTratador()){
                    out.print("Tratador - PokeCenter");
                }else{
                    out.print("Treinador - PokeCenter");
                }%></title>
               
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
					<div id="Informacoes">
						<h2>Perfil</h2>
						<ul>
							<li>Nome:<span> <%=User.getNome()%></span></li>
                                                        <%if(User.isTratador())
							out.print("<li>CPF:<span> "+((Tratador) User).getCPF()+"</span></li>");%>
							<li>Email:<span> <%=User.getEmail()%></span></li>
                                                        <li>CPF:<span> <%=User.getCPF()%></span></li>
							<li>Telefone:<span> <%=User.getTelefone()%></span></li>
                                                        <li>Cidade:<span> <%=User.getCidade()%></span></li>
							<li>Endereço:<span> <%=User.getEndereco()%></span></li>
						</ul>
					</div>

					<div class="icon_editar">
						<ul>
							<a href="cadastro.jsp">
							<li><img src="img/editar.png"></li>
							<li>Alterar</li>
							</a>
						</ul>
					</div>
				</div>
				
			</div>

			<div style="clear:both;"></div>
			
			<%@ include file="footer.jsp" %>
		</div>
	</body>
</html>
