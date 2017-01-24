<%@page import="treinadoresEtratadores.*"%>
<header>
    <%
        boolean Loja = false;
        Usuario User = null;
        if(session.getAttribute("User") != null) {
            User = (Usuario) session.getAttribute("User");
        }else if(request.getParameter("Manter") != null && !request.getParameter("Manter").equals("True")){
            request.getRequestDispatcher("home.jsp").forward(request,response);
        }
        if(request.getParameter("Loja") != null && request.getParameter("Loja").equals("True")){
            Loja = true;
        }
        
    %>
    <script src="js/PostMethod.js"></script>
    <script>
        function Cadastrar_Tratador(){
            post("cadastro.jsp",{Alter:-1});
        }
        
    </script>
    <div id="menu_topo">
            <div id="logo_lj"><a href="PokeCenter_Loja.jsp"><img src="img/logo_pokecenter_branca.png" alt="PokeCenter logo"></a></div>
            <nav id="menuSite">
                    <ul>    
                            <%if(User == null || !User.isTratador()){
                                if(Loja){%>
                            <li><a href="#">Sobre Nós</a></li>
                            <li><a href="#">Central de Ajuda</a></li>
                            <li><a href="#">Fale Conosco</a></li>
                            <%  }else{%>
                            <li><a href="cadastro_pokemon.jsp"> Cadastrar Pokemon </a></li>
                            <li><a href="PokeCenter_Treinador_Pokemons.jsp"> Seus Pokemons </a></li>
                            <li><a href="#">Doação</a></li>
                            <%  }
                            }else if(User != null && User.isTratador()){
                                if(((Tratador) User).isGerente()){%>
                                    <li><a href="#" onclick="Cadastrar_Tratador()"> Cadastrar Tratador </a></li>
                                    <li><a href="PokeCenter_Tratador_Lista.jsp"> Tratadores </a></li>
                                <%}%>
                                    <li><a href="PokeCenter_Tratador_Estoque.jsp">Estoque</a></li>
                                <%if(((Tratador) User).isGerente()){%>
                                    <li><a href="PokeCenter_Tratador_Vendas.jsp">Vendas</a></li>
                                <%}%>
                                <li><a href="#">Troca</a></li>
                            <%}%>
                            
                            
                    </ul>
            </nav>
            <nav id="menuUser">
                    <ul>
                            <%if(User != null && !User.isTratador() && Loja){out.print("<li><a href=\"PokeCenter_Loja_Carrinho.jsp\">"+((Treinador) User).getCarrinho().getQuantidade()+"<img src=\"img/sacola_pokecenter_branca.png\"></a></li>");}%>
                            <%if(User == null) {%>
                            <li><a href="home.jsp">Login</a></li>
                            <%}else{%>
                            <li><a href="PokeCenter_Perfil.jsp"><%=User.getNome()%></a><br/><a href="${pageContext.request.contextPath}/LoginServlet?acao=Deslogar">Sair</a></li>
                            <!--li></li-->
                            <%}%>
                    </ul>
            </nav>
    </div>	
</header>
