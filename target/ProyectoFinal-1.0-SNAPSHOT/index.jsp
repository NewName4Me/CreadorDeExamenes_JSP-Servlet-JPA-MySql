<%-- 
    Document   : index
    Created on : 9 may 2024, 16:26:55
    Author     : torta
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In Hermos@</title>
    </head>
    <body>
        <header>
            <p>
                Hora de Entrada: 
                <%
                    LocalDateTime miLocalDateTime = LocalDateTime.now();
                    int hora = miLocalDateTime.getHour();
                    int minuto = miLocalDateTime.getMinute();
                    int segundo = miLocalDateTime.getSecond();
                    String momentoDeEntrada = hora + ":" + minuto + ":" + segundo;
                    out.print(momentoDeEntrada);

                    session.setAttribute("momentoDeEntrada", momentoDeEntrada);
                %>
            </p>
        </header>
        <h1>Bienvenido!</h1>
        <form action="SvUsuarios" method="POST">
            <label>Nombre: </label><input type="text" name="nombre" required><br>
            <label>Apellido </label><input type="text" name="apellido" required><br>
            <label>Contraseña </label><input type="password" name="contrasenya" required><br>
            <button type="submit">Entrar</button>
        </form>
        <h1>Ver lista de Compañeros</h1>
        <form action="SvUsuarios" method="GET">
            <button type="submit">Ver lista</button>
        </form>
    </body>
</html>
