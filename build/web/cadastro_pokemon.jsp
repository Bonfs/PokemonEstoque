<%@page import="treinadoresEtratadores.Treinador"%>
<%@page import="treinadoresEtratadores.Usuario"%>
<%@page import="Itens.Pokemon"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="css/estilo.css">
        <title>Cadastro Pokemon</title>
        <script src="js/PostMethod.js"></script>
        <%
        int id_poke = -1;
        Usuario User = null;
        if(session.getAttribute("User") != null) {
            User = (Usuario) session.getAttribute("User");
        }
        if(request.getParameter("AlterPoke") != null){
            id_poke = Integer.parseInt(request.getParameter("AlterPoke"));
            session.setAttribute("AlterPoke", null);
        }
        Pokemon poke;
        if(id_poke >= 0){
            poke = ((Treinador) User).getPokemon(id_poke);
        }else{
            poke = new Pokemon(-1,"","","","Normal",0,User.getID());
        }  
        %>
        <script>
            function Submit(){
                var nome = document.getElementsByName("nome")[0].value;
                var nivel = document.getElementsByName("nivel")[0].value;
                var tipo = document.getElementsByName("tipo")[0].value;
                var descricao = document.getElementsByName("descricao")[0].value;
                post("PokemonServlet",{acao:((<%=poke.getID()%>==-1)?"CriaPoke":"AlterPoke"),nome:nome,nivel:nivel,tipo:tipo,descricao:descricao<%if(poke.getID()>-1)out.print(",ID:"+poke.getID());%>});
            };
        </script>
    </head>
    <body>
        <div id="container1">			
            <div id="conteudo">
                <div id="logo"><a href="home.jsp"><img src="img/logo_pokecenter_branca.png" alt="PokeCenter logo"></a></div>
                <div id="cadastro">
                    <h1> CADASTRO POKEMON </h1>
                    <div id="coluna_cad1">
                        <form action="" method="post">
                            <div class="legenda">NOME:</div>
                            <input type="text" name="nome"><br>

                            <div class="legenda">NIVEL:</div>
                            <input type="number" name="nivel" min="0" max="100"><br>

                            <div class="legenda">TIPO:</div>
                            <select name="tipo">
                                <option value="normal">Normal</option>
                                <option value="fogo">Fogo</option>
                                <option value="agua">Água</option>
                                <option value="grama">Grama</option>
                                <option value="eletrico">Elétrico</option>
                                <option value="gelo">Gelo</option>
                                <option value="lutador">Lutador</option>
                                <option value="venenoso">Venenoso</option>
                                <option value="terra">Terra</option>
                                <option value="voador">Voador</option>
                                <option value="psiquico">Psíquico</option>
                                <option value="inseto">Inseto</option>
                                <option value="rocha">Rocha</option>
                                <option value="fantasma">Fantasma</option>
                                <option value="noturno">Noturno</option>
                                <option value="dragao">Dragão</option>
                                <option value="aco">Aço</option>
                                <option value="fada">Fada</option>
                            </select>
                    </div>
                    <div id="coluna_cad2">
                        <div class="legenda">DESCRI��O:</div>
                        <input type="text" name="descricao"><br><br>
                        <input value="<%out.print((poke.getID()!=-1)?"ALTERAR":"CADASTRAR");%>" class="botao" onclick="Submit()">
                        </form>
                    </div>
                </div>

            </div>
            <div style="clear:both;"></div>
            
            <%@ include file="footer.jsp" %>
            <script>
                if(<%=poke.getID()%>!=-1){
                    document.getElementsByName("nome")[0].value = "<%=poke.getNome()%>";
                    document.getElementsByName("nivel")[0].value = "<%=poke.getNivel()%>";
                    document.getElementsByName("tipo")[0].value = "<%=poke.getTipo()%>";
                    document.getElementsByName("descricao")[0].value = "<%=poke.getDescricao()%>";
                }
            </script>
        </div>
    </body>
</html>