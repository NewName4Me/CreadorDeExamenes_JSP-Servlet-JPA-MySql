<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Preguntas y Exámenes</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
                background-color: #333;
            }
            .container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                background-color: #555;
            }
            h1 {
                text-align: center;
                margin-bottom: 20px;
            }
            fieldset {
                border: 1px solid #ccc;
                padding: 20px;
                margin-bottom: 20px;
                border-radius: 5px;
                background-color: #fff;
            }
            legend {
                font-size: 1.2em;
                font-weight: bold;
            }
            label {
                display: block;
                margin-bottom: 5px;
            }
            input[type="text"], input[type="number"] {
                width: calc(100% - 20px);
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid black;
                border-radius: 5px;
                box-sizing: border-box;
            }
            button[type="submit"] {
                width: 100%;
                background-color: #007bff;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 1em;
            }
            button[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Página de Administrador</h1>
            <fieldset>
                <legend>Crear Preguntas</legend>
                <form action="SvPreguntas" method="POST">
                    <label for="titulo">Enunciado:</label>
                    <input type="text" id="titulo" name="titulo" placeholder="Introduce el enunciado" required>
                    <label for="opcion1">Opción 1:</label>
                    <input type="text" id="opcion1" name="opcion1" placeholder="Introduce la opción 1" required>
                    <label for="opcion2">Opción 2:</label>
                    <input type="text" id="opcion2" name="opcion2" placeholder="Introduce la opción 2" required>
                    <label for="opcion3">Opción 3:</label>
                    <input type="text" id="opcion3" name="opcion3" placeholder="Introduce la opción 3" required>
                    <label for="opcion4">Opción 4:</label>
                    <input type="text" id="opcion4" name="opcion4" placeholder="Introduce la opción 4" required>
                    <label for="correcta">Respuesta correcta:</label>
                    <input type="number" id="correcta" name="correcta" placeholder="Introduce el número de la opción correcta" required>
                    <button type="submit">Guardar Pregunta</button>
                </form>
                <form action="SvPreguntas" method="GET">
                    <button type="submit">Ver lista de preguntas</button>
                </form>
            </fieldset>
            <fieldset>
                <legend>Crear Examen</legend>
                <form action="SvExamen" method="POST">
                    <label for="numeroDePreguntas">Número de Preguntas:</label>
                    <input type="number" id="numeroDePreguntas" name="numeroDePreguntas" min="0" placeholder="Introduce el número de preguntas" required>
                    <button type="submit">Crear Examen</button>
                </form>
            </fieldset>
        </div>
    </body>
</html>
