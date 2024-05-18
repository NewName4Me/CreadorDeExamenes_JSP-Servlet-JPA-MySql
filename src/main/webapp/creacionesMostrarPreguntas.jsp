<%@page import="javabeans.Preguntas"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Preguntas</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #333;
                margin: 0;
                padding: 0;
            }
            .container {
                max-width: 800px;
                margin: 20px auto;
                padding: 20px;
                background-color: #555;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
                margin-bottom: 20px;
            }
            .pregunta {
                border: 1px solid #ccc;
                padding: 10px;
                background:whitesmoke;
                margin-bottom: 10px;
                border-radius: 5px;
            }
            .pregunta p {
                margin: 5px 0;
            }
            .eliminar-btn {
                background-color: #dc3545;
                color: #fff;
                border: none;
                padding: 5px 10px;
                border-radius: 3px;
                cursor: pointer;
            }
            .eliminar-btn:hover {
                background-color: #c82333;
            }
        </style>
    </head>
    <body>
        <%
            HttpSession misesion = request.getSession();
            if (misesion.getAttribute("esAdmin") == null) {
                response.sendRedirect("index.jsp");
                return;
            }
        %>
        <div class="container">
            <h1>Lista de Preguntas</h1>
            <%
                List<Preguntas> listaPreguntas = (List) request.getSession().getAttribute("listaPreguntas");
                for (Preguntas pregunta : listaPreguntas) {
            %>
            <div class="pregunta">
                <p><b>Enunciado: <%= pregunta.getTitulo()%></b></p>
                <p>Opción 1: <%= pregunta.getOpcion1()%></p>
                <p>Opción 2: <%= pregunta.getOpcion2()%></p>
                <p>Opción 3: <%= pregunta.getOpcion3()%></p>
                <p>Opción 4: <%= pregunta.getOpcion4()%></p>
                <p>Correcta: <%= pregunta.getCorrecta()%></p>
                <form action="SveliminarPregunta" method="POST">
                    <input type="hidden" name="preguntaId" value="<%= pregunta.getId()%>">
                    <button class="eliminar-btn" type="submit">Borrar Pregunta</button>
                </form>
            </div>
            <% }%>
        </div>
    </body>
</html>
