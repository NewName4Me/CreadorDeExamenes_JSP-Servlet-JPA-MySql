<%-- 
    Document   : examen
    Created on : 9 may 2024, 18:40:24
    Author     : torta
--%>

<%@page import="javabeans.Preguntas"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .pregunta{
                border: 2px solid black;
                border-radius: 16px;
                padding: 1rem;
            }
        </style>
    </head>
    <body>
        <h1>Preparate para el examen!</h1>
        <%
            List<Preguntas> preguntasDeExamenLista = (List<Preguntas>) session.getAttribute("preguntasDeExamen");
            for (int i = 0; i < preguntasDeExamenLista.size(); i++) {
                Preguntas question = preguntasDeExamenLista.get(i);
        %>
        <div class="pregunta">
            <h2><%= "Pregunta " + (i + 1) + ": " + question.getTitulo()%></h2>
            <ul>
                <li><input type="radio" name="<%=question.getId()%>" value="1"><%= question.getOpcion1()%></li>
                <li><input type="radio" name="<%=question.getId()%>" value="2"><%= question.getOpcion2()%></li>
                <li><input type="radio" name="<%=question.getId()%>" value="3"><%= question.getOpcion3()%></li>
                <li><input type="radio" name="<%=question.getId()%>" value="4"><%= question.getOpcion4()%></li>
            </ul>
        </div>
        <%
            }
        %>
    </body>
</html>
