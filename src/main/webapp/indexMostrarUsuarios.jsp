<%-- 
    Document   : mostrarUsuarios
    Created on : 9 may 2024, 16:29:21
    Author     : torta
--%>

<%@page import="java.util.List"%>
<%@page import="javabeans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                margin:0;
                padding: 0;
                box-sizing: border-box;
            }
            header{
                padding: 1rem;
                background:black;
                color: white;
            }
            header *{
                display: inline-block;
            }
            nav{
                text-align: center;
                margin-right: 5rem;
            }
        </style>
    </head>
    <body>
        <header>
            <nav>
                <p><%=session.getAttribute("momentoDeEntrada")%> - </p>
                <p><%=session.getAttribute("nombreDeIngreso")%></p>
            </nav>
        </header>

        <h1>Lista de Alumnos!</h1>

        <%
            List<Usuario> listaUsuarios = (List) request.getSession().getAttribute("listaUsuarios");
            int cont = 1;
            for (Usuario usuario : listaUsuarios) {
        %>
        <p>Alumnos nº <%=cont%> <%=usuario.getNombre()%> <%=usuario.getApellido()%></p>
        <p>-------------------------</p>
        <%cont++;%>
        <%
            }
        %>
    </body>
</html>
