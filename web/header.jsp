<%@page import="treinadoresEtratadores.*"%>
<header>
    <%
        Usuario User = null;
        if(session.getAttribute("User") != null) {
            User = (Usuario) session.getAttribute("User");
        }else if(!request.getParameter("Manter").equals("True")){
            request.getRequestDispatcher("home.jsp").forward(request,response);
        }
    %>
    <div id="menu_topo">
            <div id="logo_lj"><a href="PokeCenter_Loja.jsp"><img src="img/logo_pokecenter_branca.png" alt="PokeCenter logo"></a></div>
            <nav id="menuSite">
                    <ul>    
                            <%if(User == null || !User.isTratador()){%>
                            <li><a href="#">Sobre Nós</a></li>
                            <li><a href="#">Central de Ajuda</a></li>
                            <li><a href="#">Fale Conosco</a></li>
                            <%}else if(User != null && User.isTratador()){
                                if(((Tratador) User).isGerente()){%>
                                    <li><a href="cadastro.jsp"> Cadastrar Tratador </a></li>
                                    <li><a href="PokeCenter_Tratador_Lista.jsp"> Tratadores </a></li>
                                    <li><a href="PokeCenter_Tratador_Estoque.jsp">Estoque</a></li>
                                    <li><a href="PokeCenter_Tratador_Vendas.jsp">Vendas</a></li>
                                <%}%>
                                <li><a href="#">Troca</a></li>
                            <%}%>
                            
                            
                    </ul>
            </nav>
            <nav id="menuUser">
                    <ul>
                            <li><a href="PokeCenter_Loja_Carrinho.jsp"><%if(User != null && !User.isTratador()){out.print(((Treinador) User).getCarrinho().getQuantidade());}%><img src="img/sacola_pokecenter_branca.png"></a></li>
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
