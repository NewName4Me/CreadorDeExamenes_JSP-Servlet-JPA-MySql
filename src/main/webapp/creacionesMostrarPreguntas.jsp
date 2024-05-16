<%-- 
    Document   : creacionesListaPreguntas
    Created on : 10 may 2024, 9:40:58
    Author     : torta
--%>

<%@page import="javabeans.Preguntas"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Preguntas</title>
    </head>
    <body>
        <h1>Lista de Preguntas!</h1>

        <%
            List<Preguntas> listaPreguntas = (List) request.getSession().getAttribute("listaPreguntas");
            for (Preguntas pregunta : listaPreguntas) {
        %>
        <form action="SveliminarPregunta" method="POST">
            <input type="hidden" name="preguntaId" value="<%=pregunta.getId()%>">
            <%=pregunta.getTitulo()%><br>
            <%=pregunta.getOpcion1()%><br>
            <%=pregunta.getOpcion2()%><br>
            <%=pregunta.getOpcion3()%><br>
            <%=pregunta.getOpcion4()%><br>
            <%=pregunta.getCorrecta()%><br>
            <button type="submit">Borrar Pregunta</button>
        </form>
        <p>--------------------</p>
        <%
            }
        %>
    </body>
</html>
