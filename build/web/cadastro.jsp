<%@page import="treinadoresEtratadores.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbAccess.Access"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/estilo.css">
                <% 
                    boolean Existia = false;
                    int Alter = -1;
                    Usuario Perfil = new Usuario(0,0,"","","","","","","",false);
                    if(session != null && session.getAttribute("User") != null ) {
                        if(session.getAttribute("Alter") != null ){
                            Alter = Integer.parseInt(session.getAttribute("Alter").toString());
                            if(Alter != 0){
                                Existia = true;
                                Access db = new Access();
                                session.setAttribute("Alter",null);
                                boolean isLogged = false,tipo=false;
                                ResultSet rs;
                                String query = "SELECT * FROM usuario WHERE ID =\'"+Alter;
                                rs = db.selectSQL(query);
                                if(rs.next()){
                                    int ID = Integer.parseInt(rs.getString("ID"));
                                    int CPF = Integer.parseInt(rs.getString("CPF"));
                                    String login = rs.getString("login");
                                    String nome = rs.getString("nome");
                                    String senha = rs.getString("senha");
                                    String email = rs.getString("email");
                                    String cidade = rs.getString("cidade");
                                    String endereco = rs.getString("endereco");
                                    String telefone = rs.getString("telefone");
                                    String trat = rs.getString("tratador");

                                    if(trat.equals("1")){
                                        query = "SELECT tipo FROM tratador WHERE tratador_id =" + ID ;//problema de acentuação
                                        rs = db.selectSQL(query);
                                        if(rs.next()){
                                            Perfil = new Tratador(ID,CPF,login,senha,nome,email,cidade,endereco,telefone,rs.getBoolean("tipo"));
                                        }
                                        tipo=true;
                                    }else{
                                        query = "SELECT nome_da_mae FROM treinador WHERE treinador_id =" + ID ;//problema de acentuação
                                        rs = db.selectSQL(query);
                                        if(rs.next()){
                                            Perfil = new Treinador(ID,CPF,login,senha,nome,email,cidade,endereco,telefone,rs.getString("nome_da_mae"));
                                        }
                                    }
                                    db.connectionClose();
                                } 
                            }
                        }else{
                            Existia = true;
                            Perfil = (Usuario) session.getAttribute("User");        
                        }
                        
                    }
                %>
                 <title>Cadastro <%if(Perfil.isTratador()){
                    out.print("Tratador");
                }else{
                    out.print("Treinador");
                }%></title>
                <script src="js/PostMethod.js"></script>
                <script src="js/ValidaCPF.js"></script>
                <script>
                    /*
                     * 
                        ID=ID;
                        CPF=CPF;
                        login=login;
                        nome=nome;
                        email=email;
                        cidade=cidade;
                        endereco=endereco;
                        telefone=telefone;
                        tratador=tratador;
                     
                     */
                    function Submit(){
                        var CPF=document.getElementsByName("cpf")[0].value;
                        if(!VerificaCPF(CPF)){
                            console.log("CPF Invalido");
                            return false;
                        }
                        var login=document.getElementsByName("login")[0].value;
                        var senha=document.getElementsByName("senha")[0].value;
                        var nome=document.getElementsByName("nome")[0].value;
                        var email=document.getElementsByName("email")[0].value;
                        var cidade=document.getElementsByName("cidade")[0].value;
                        var endereco=document.getElementsByName("endereco")[0].value;
                        var telefone=document.getElementsByName("telefone")[0].value;
                        
                        if(<%=Existia%>){
                            var ID=<%=Perfil.getID()%>;
                            if(<%=Perfil.isTratador()%>)
                            post("LoginServlet",{acao:'UpdateUser',ID:ID,CPF:CPF,login:login,nome:nome,email:email,cidade:cidade,endereco:endereco,telefone:telefone,gerente:document.getElementsByName("gerente")[0].value},"post");
                            else
                            post("LoginServlet",{acao:'UpdateUser',ID:ID,CPF:CPF,login:login,nome:nome,email:email,cidade:cidade,endereco:endereco,telefone:telefone,gerente:document.getElementsByName("nome_mae")[0].value},"post");
                        }else{
                            if(Alter==0)
                                post("LoginServlet",{acao:'CriaUser',ID:ID,CPF:CPF,login:login,nome:nome,email:email,cidade:cidade,endereco:endereco,telefone:telefone,gerente:document.getElementsByName("gerente")[0].value},"post");
                            else
                               post("LoginServlet",{acao:'CriaUser',ID:ID,CPF:CPF,login:login,nome:nome,email:email,cidade:cidade,endereco:endereco,telefone:telefone,gerente:document.getElementsByName("nome_mae")[0].value},"post");
                        }
                    }
                    
                </script>
	</head>
       
	<body>
		<div id="container2">			
			<div id="conteudo">
				<div id="logo"><a href="home.jsp"><img src="img/logo_pokecenter_branca.png" alt="PokeCenter logo"></a></div>
				<div id="cadastro">
					<h1> CADASTRO <%if(Perfil.isTratador()) out.print("TRATADOR");else out.print("TREINADOR");%> </h1>
					<div id="coluna_cad1">
						<form action="" method="post">
							<div class="legenda" >NOME:</div>
                                                        <input type="text" name="nome" value="<%=Perfil.getNome()%>"><br>
							
							<div class="legenda">CPF:</div>
							<input type="text" name="cpf" value="<%if(Perfil.getCPF()!=0)out.print(Perfil.getCPF());%>"><br>
                                                        
							<div class="legenda">EMAIL:</div>
							<input type="text" name="email" value="<%=Perfil.getNome()%>"><br>

							<div class="legenda">CIDADE:</div>
							<input type="text" name="cidade" value="<%=Perfil.getCidade()%>"><br>

							<div class="legenda">ENDERECO:</div>
							<input type="text" name="endereco" value="<%=Perfil.getEndereco()%>"><br>
						
					</div>
					<div id="coluna_cad2">
						
							<div class="legenda">TELEFONE:</div>
							<input type="text" name="telefone" value="<%=Perfil.getTelefone()%>"><br>
							<%if(!Perfil.isTratador()){%>
							<div class="legenda">NOME DA MÃE:</div>
							<input type="text" name="nome_mae" value="<%=Perfil.getNome()%>"><br>
                                                        <%}%>
							<div class="legenda">LOGIN:</div>
							<input type="text" name="login" value="<%=Perfil.getLogin()%>"><br>
							<div class="legenda">SENHA:</div>
							<input type="password" name="senha" value=""><br><br>
                                                        <% if(Perfil.isTratador() && (((Tratador) Perfil).isGerente())){%>
                                                        <input type="checkbox" name="gerente" value="<%=Perfil.getNome()%>">  Cadastrar como Gerente <br><br><br>
                                                        <%}%>
							<input  value="CADASTRAR" class="botao" onclick="Submit()">
						</form>
					</div>
				</div>

			</div>
			<div style="clear:both;"></div>
			<footer>
				<center>
					<div id="footer1"><p>Poke Center © 2016</p></div>
					<div id="footer2">
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