<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In Hermos@</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                background: darkslategrey;
            }
            button {
                width: 100%;
                height: 3rem;
                font-size: 1rem;
            }
            header {
                padding: 1rem;
                background: black;
                color: white;
            }
            nav {
                text-align: center;
                margin-right: 5rem;
            }
            main {
                border: 3px solid black;
                border-radius: 8px;
                width: fit-content;
                padding: 1rem;
                background: lightslategray;
                position: absolute;
                top: 12%;
                margin-left: 12rem;
                font-size: 1.2rem;
                box-shadow: -10px 10px 10px 0px violet;
            }
            input {
                width: 100%;
                padding: 5px;
            }
            img:last-child {
                position: absolute;
                top: 0;
                right: 0;
                height: 100vh;
                width: 45vw;
                border-left: 4px solid black;
            }
            .error-message {
                color: red;
                font-size: 0.8rem;
            }
        </style>
    </head>
    <body>
        <header>
            <nav>
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
            </nav>
        </header>
        <main>
            <%
                //esto es para saber si ha fallado tres veces la contraseña
                String error = (String) session.getAttribute("error");
                Integer intentos = (Integer) session.getAttribute("intentos");
                if (intentos == null) {
                    intentos = 0;
                }
                // Eliminar la variable de sesión después de usarla para que no se muestre en futuras visitas
                session.removeAttribute("error");
                if (error != null && error.equals("contraseñaIncorrecta")) {
                    out.print("<p class='error-message'>Contraseña incorrecta. Por favor, intenta de nuevo.</p>");
                }
            %>
            <section>
                <h1>Listo para el Examen?</h1>
                <form action="SvUsuarios" method="POST">
                    <label>Nombre: </label><input type="text" name="nombre" placeholder="..." required><br>
                    <label>Apellido: </label><input type="text" name="apellido" placeholder="..." required><br>
                    <label>Contraseña: </label><input type="password" name="contrasenya" placeholder="..." required><br>
                    <label>Color preferido: </label><input type="color" name="color" required><br><br>
                    <button type="submit">Entrar</button>
                </form>
            </section>
            <section>
                <h1>Ver lista de Compañeros</h1>
                <form action="SvUsuarios" method="GET">
                    <button type="submit">Ver lista</button>
                </form>
            </section>
        </main>
        <img src="https://preview.redd.it/wy925k0hmvk51.png?auto=webp&s=82a042d28b9ac65e3f3daac30c7cc2dc6490c7eb">
    </body>
</html>
