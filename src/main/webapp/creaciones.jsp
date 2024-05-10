<%-- 
    Document   : creaciones
    Created on : 9 may 2024, 18:39:35
    Author     : torta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Pagina de administrador!</h1>
        <fieldset>
            <legend><h3>Crear Preguntas</h3></legend>
            <form action="SvPreguntas" method="POST">
                <label>Enunciado: </label><input type="text" name="titulo" placeholder="..."><br>
                <label>Opcion1: </label><input type="text" name="opcion1" placeholder="..."><br>
                <label>Opcion2: </label><input type="text" name="opcion2" placeholder="..."><br>
                <label>Opcion3: </label><input type="text" name="opcion3" placeholder="..."><br>
                <label>Opcion4: </label><input type="text" name="opcion4" placeholder="..."><br>
                <label>Cual es la correcta: </label><input type="number" name="correcta" placeholder="..."><br>
                <button type="submit">Guardar Pregunta</button>
            </form>
            <form action="SvPreguntas" method="GET">
                <button type="submit">Ver lista de preguntas</button>
            </form>
        </fieldset>
    </body>
</html>
