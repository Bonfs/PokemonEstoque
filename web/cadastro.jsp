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
                    int Alter = 0;
                    Usuario Perfil = null;
                    Usuario User = null;
                    
                    //System.out.println(request.getParameter("Alter"));
                    if(session != null && session.getAttribute("User") != null ) {
                        User = (Usuario) session.getAttribute("User");
                        if(User.isTratador() && request.getParameter("Alter") != null ){
                            Alter = Integer.parseInt(request.getParameter("Alter"));
                            if(Alter > 0){
                                Existia = true;
                                Access db = new Access();
                                session.setAttribute("Alter",null);
                                boolean isLogged = false,tipo=false;
                                ResultSet rs;
                                String query = "SELECT * FROM usuario WHERE ID ="+Alter;
                                System.out.println(query);
                                rs = db.selectSQL(query);
                                if(rs.next()){
                                    int ID = Integer.parseInt(rs.getString("ID"));
                                    long CPF = Long.parseLong(rs.getString("CPF"));
                                    String login = rs.getString("login");
                                    String nome = rs.getString("nome");
                                    String senha = rs.getString("senha");
                                    String email = rs.getString("email");
                                    String cidade = rs.getString("cidade");
                                    String endereco = rs.getString("endereco");
                                    String telefone = rs.getString("telefone");
                                    String trat = rs.getString("tratador");

                                    if(trat.equals("1")){
                                        query = "SELECT tipo FROM tratador WHERE tratador_id =" + ID ;
                                        rs = db.selectSQL(query);
                                        if(rs.next()){
                                            Perfil = new Tratador(ID,CPF,login,senha,nome,email,cidade,endereco,telefone,rs.getBoolean("tipo"));
                                        }
                                        tipo=true;
                                    }else{
                                        query = "SELECT nome_da_mae FROM treinador WHERE treinador_id =" + ID ;
                                        rs = db.selectSQL(query);
                                        if(rs.next()){
                                            Perfil = new Treinador(ID,CPF,login,senha,nome,email,cidade,endereco,telefone,rs.getString("nome_da_mae"));
                                        }
                                    }
                                    db.connectionClose();
                                } 
                            }else if(Alter == 0){
                                Perfil=User;
                            }else{
                                Perfil = new Tratador(0,0,"","","","","","","",false);
                            }
                        }else{
                            Existia = true;
                            Perfil = User;        
                        }
                    }
                    if(Perfil == null)
                          Perfil = new Treinador(0,0,"","","","","","","","");
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
                        CPF=VerificaCPF(CPF);
                        if(CPF==false){
                            console.log("CPF invalido");
                            var cpf=document.getElementsByName("cpf")[0];
                            cpf.style.boxShadow = "0px 0px 20px red";
                            //cpf.style.border = "1px solid red";
                            cpf.value = "Informe um CPF válido";
                            return false;
                        }
                        var nome=document.getElementsByName("nome")[0].value;
                        var email=document.getElementsByName("email")[0].value;
                        var cidade=document.getElementsByName("cidade")[0].value;
                        var endereco=document.getElementsByName("endereco")[0].value;
                        var telefone=document.getElementsByName("telefone")[0].value;
                        <%if(Existia){
                            out.println("var ID="+Perfil.getID()+";");
                            if(Perfil.isTratador()){
                                if(User != null && User.isTratador() && ((Tratador) User).isGerente())
                                    out.println("post(\"LoginServlet\",{acao:\'UpdateUser\',ID:ID,CPF:CPF,login:\'"+Perfil.getLogin()+"\',senha:\'"+Perfil.getPswd()+"\',nome:nome,email:email,cidade:cidade,endereco:endereco,telefone:telefone,gerente:document.getElementsByName(\"gerente\")[0].checked},\"post\");");
                                else
                                   out.println("post(\"LoginServlet\",{acao:\'UpdateUser\',ID:ID,CPF:CPF,login:\'"+Perfil.getLogin()+"\',senha:\'"+Perfil.getPswd()+"\',nome:nome,email:email,cidade:cidade,endereco:endereco,telefone:telefone,gerente:\'"+false+"\'},\"post\");");
                            }else
                                out.println("post(\"LoginServlet\",{acao:\'UpdateUser\',ID:ID,CPF:CPF,login:\'"+Perfil.getLogin()+"\',senha:\'"+Perfil.getPswd()+"\',nome:nome,email:email,cidade:cidade,endereco:endereco,telefone:telefone,nome_mae:document.getElementsByName(\"nome_mae\")[0].value},\"post\");");
                        }else{
                            out.println("var login=document.getElementsByName(\"login\")[0].value;var senha=document.getElementsByName(\"senha\")[0].value;");
                            if(Alter==-1)
                               out.println("post(\"LoginServlet\",{acao:\'CriaUser\',CPF:CPF,login:login,senha:senha,nome:nome,email:email,cidade:cidade,endereco:endereco,telefone:telefone,gerente:document.getElementsByName(\"gerente\")[0].checked},\"post\");");
                            else
                               out.println("post(\"LoginServlet\",{acao:\'CriaUser\',CPF:CPF,login:login,senha:senha,nome:nome,email:email,cidade:cidade,endereco:endereco,telefone:telefone,nome_mae:document.getElementsByName(\"nome_mae\")[0].value},\"post\");");
                        }%>
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
							<input type="text" name="email" value="<%=Perfil.getEmail()%>"><br>

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
							<input type="text" name="nome_mae" value="<%=((Treinador) Perfil).getNomeDaMae()%>"><br>
                                                        <%}
                                                        if(!Existia){%>
							<div class="legenda">LOGIN:</div>
							<input type="text" name="login" value="<%=Perfil.getLogin()%>"><br>
							<div class="legenda">SENHA:</div>
							<input type="password" name="senha" value=""><br><br>
                                                        <%}
                                                        if(Perfil.isTratador() && (((Tratador) User).isGerente())){
                                                            out.print("<input type=\"checkbox\" name=\"gerente\""+((((Tratador) Perfil).isGerente())?"checked":"")+"\">  Cadastrar como Gerente <br><br><br>");
                                                        }
                                                        %>
                                                        <input value="<%out.print((Existia)?"ALTERAR":"CADASTRO");%>" class="botao" onclick="Submit()" >
						</form>
					</div>
				</div>

			</div>
			<div style="clear:both;"></div>
                        
			<%@ include file="footer.jsp" %>
		</div>
	</body>
</html>