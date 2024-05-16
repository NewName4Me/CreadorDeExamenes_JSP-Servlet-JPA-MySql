<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Results of the Exam</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
                background-color: #333;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            header {
                padding: 1rem;
                background: <%= session.getAttribute("colorPreferido")%>;
                color: white;
                text-align: center;
                width: 100%;
                position: absolute;
                top: 0;
            }
            header p {
                display: inline;
            }
            .score-container {
                width: 250px;
                height: 250px;
                border-radius: 50%;
                background-color: purple;
                display: flex;
                justify-content: center;
                align-items: center;
                color: white;
                font-size: 2em;
                font-weight: bold;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                animation: bounce 0.5s infinite alternate;
            }
            @keyframes bounce {
                0% {
                    transform: scale(1);
                }
                100% {
                    transform: scale(1.1);
                }
            }
            .score-text {
                position: absolute;
                top: 35%;
                left: 50%;
                transform: translate(-50%, -50%);
                text-align: center;
                color: white;
                font-size: 1.5em;
            }
        </style>
    </head>
    <body>
        <header>
            <p><%= session.getAttribute("momentoDeEntrada")%> - <%= session.getAttribute("nombreDeIngreso")%></p>
        </header>
        <div class="score-container">
            <p class="score-text">Nota:<br>
                <%
                    Integer examScore = (Integer) session.getAttribute("nota");
                    Integer totalPreguntas = (Integer) session.getAttribute("totalPreguntas");
                %>
                <%= examScore%>/<%=totalPreguntas%>
            </p>
        </div>
    </body>
</html>
