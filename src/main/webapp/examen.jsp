<%-- 
    Document   : examen
    Created on : 9 may 2024, 18:40:24
    Author     : torta
--%>

<%@page import="GuardarInformacionEnTxt.GuardarPreguntas"%>
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
        <h1>Prepárate para el examen!</h1>
        <p><%=session.getAttribute("momentoDeEntrada")%></p>
        <p><%=session.getAttribute("nombreDeIngreso")%></p>
        <form action="SvExamenCorregido" method="POST">
            <%
                int identificadorExamen = (int) Math.round(Math.random() * 100000);

                List<Preguntas> preguntasDeExamenLista = (List<Preguntas>) session.getAttribute("preguntasDeExamen");
                if (preguntasDeExamenLista != null && !preguntasDeExamenLista.isEmpty()) {
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
                    // No guardes las preguntas en el archivo aquí, solo muestra la interfaz de usuario
                }
            %>

            <button type="submit">Corregir Examen</button>

            <%
                }
            %>
        </form>

        <form action="#" method="post">
            <button type="submit" name="descargar" value="descargar">Descargar Examen</button>
        </form>

        <%
            String descargar = request.getParameter("descargar");
            if ("descargar".equals(descargar)) {
                // Si se presiona el botón de descargar, guarda las preguntas en el archivo
                if (preguntasDeExamenLista != null && !preguntasDeExamenLista.isEmpty()) {
                    for (Preguntas question : preguntasDeExamenLista) {
                        String preguntaParaTxt = String.format("%s \n A. %s \n B. %s \n C. %s \n D. %s \nANSWER: %s",
                                question.getTitulo(), question.getOpcion1(), question.getOpcion2(), question.getOpcion3(),
                                question.getOpcion4(), question.getCorrecta());
                        GuardarPreguntas.guardarInformacionEnArchivo(preguntaParaTxt, identificadorExamen);
                    }
                    out.println("El examen ha sido descargado.");
                } else {
                    out.println("No hay preguntas para descargar.");
                }
            }
        %>
    </body>
</html>
