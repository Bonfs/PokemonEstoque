<%-- 
    Document   : telaInicial
    Created on : 29/10/2016, 16:23:02
    Author     : matheus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tela Inicial</title>
    </head>
    <body>
        <% 
            //= request.getParameter("login")
            String login = "seu Hacker!!";
            Cookie[] cookies = request.getCookies();
            if(cookies != null){
                for(Cookie cookie : cookies){
                    if(cookie.getName().equals("login"))
                        login = cookie.getValue();
                }
                
            }
            else{
                response.sendRedirect("index.jsp");
            }
        %>
        <h1>Hello <%=login%>!</h1>
    </body>
</html>
