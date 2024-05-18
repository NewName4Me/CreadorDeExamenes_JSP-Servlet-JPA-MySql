<%@page import="GuardarInformacionEnTxt.GuardarPreguntas"%>
<%@page import="javabeans.Preguntas"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Examen</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
                background-color: #333;
            }
            header {
                padding: 1rem;
                background: <%= session.getAttribute("colorPreferido")%>;
                color: white;
            }
            header nav {
                text-align: center;
            }
            nav p{
                display: inline;
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
                border: 2px solid black;
                border-radius: 16px;
                background: whitesmoke;
                padding: 1rem;
                margin-bottom: 20px;
            }
            .pregunta h2 {
                margin-top: 0;
            }
            .pregunta ul {
                list-style-type: none;
                padding: 0;
            }
            .pregunta ul li {
                margin-bottom: 10px;
            }
            .pregunta input[type="radio"] {
                margin-right: 10px;
            }
            .boton {
                margin:10px;
                float:left;
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 1em;
            }
            .descargar{
                background-color: white;
                color:#0056b3;
                border:2px solid #0056b3;
            }
            .descargar:hover{
                color:white
            }
            .boton:hover {
                background-color: #0056b3;
            }
            form + p{
                border:3px solid black;
                position:absolute;
                top:50%;
                left:50%;
                transform: translate(-50%,-50%);
                padding:1rem 2rem;
                background:grey;
            }
        </style>
    </head>
    <body>
        <header>
            <nav>
                <p><%= session.getAttribute("momentoDeEntrada")%> - </p>
                <p><%= session.getAttribute("nombreDeIngreso")%></p>
            </nav>
        </header>
        <div class="container">
            <h1>Prepárate para el examen!</h1>

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
                        <li><input type="radio" name="<%= question.getId()%>" value="1"><%= question.getOpcion1()%></li>
                        <li><input type="radio" name="<%= question.getId()%>" value="2"><%= question.getOpcion2()%></li>
                        <li><input type="radio" name="<%= question.getId()%>" value="3"><%= question.getOpcion3()%></li>
                        <li><input type="radio" name="<%= question.getId()%>" value="4"><%= question.getOpcion4()%></li>
                    </ul>
                </div>
                <%
                        }
                    } else {
                        out.println("No hay preguntas disponibles.");
                    }
                %>

                <button class="boton" type="submit">Corregir Examen</button>

            </form>

            <form action="#" method="post">
                <button class="boton descargar" type="submit" name="descargar" value="descargar">Descargar Examen</button>
            </form>

            <%
                String descargar = request.getParameter("descargar");
                if ("descargar".equals(descargar)) {
                    if (preguntasDeExamenLista != null && !preguntasDeExamenLista.isEmpty()) {
                        for (Preguntas question : preguntasDeExamenLista) {
                            String preguntaParaTxt = String.format("%s \n A. %s \n B. %s \n C. %s \n D. %s \nANSWER: %s",
                                    question.getTitulo(), question.getOpcion1(), question.getOpcion2(), question.getOpcion3(),
                                    question.getOpcion4(), question.getCorrecta());
                            GuardarPreguntas.guardarInformacionEnArchivo(preguntaParaTxt, identificadorExamen);
                        }
                        out.println("<p>El examen ha sido descargado en tu carpeta de Usuario.</p>");
                    } else {
                        out.println("<p>No hay preguntas para descargar.</p>");
                    }
                }
            %>
        </div>
    </body>
</html>
