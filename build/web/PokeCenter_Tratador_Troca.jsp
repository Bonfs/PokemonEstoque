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

			<div style="clear:both;"></div>

			<div id="conteudo">
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
                                <option value="nome_t">Nome Treinador 01</option>
                                <option value="nome_t">Nome Treinador 01</option>
                                <option value="nome_t">Nome Treinador 01</option>
                            </select>

                            <br><br>

                            Selecione Pokemon do 1º treinador: 							
							<select name="pokemon01">
                                <option value="nome_p">Pokemon</option>
                            </select>
						</div>
						<a href="#"><div class="col-troca02">
							<div><img src="img/trocar.png"></div>
							<p>Fazer troca</p>
						</div></a>
						<div class="col-troca03">
							Selecione 2º treinador: 							
							<select name="treinador02">
                                <option value="nome_t">Nome Treinador 02</option>
                                <option value="nome_t">Nome Treinador 02</option>
                                <option value="nome_t">Nome Treinador 02</option>
                            </select>

                            <br><br>

                            Selecione Pokemon do 2º treinador: 							
							<select name="pokemon02">
                                <option value="nome_p">Pokemon</option>
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
