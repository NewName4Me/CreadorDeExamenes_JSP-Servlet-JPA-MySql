<%@page import="java.util.List"%>
<%@page import="javabeans.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Alumnos</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
                background-color: #333;
            }
            header {
                background: black;
                color: white;
                padding: 10px 20px;
                text-align: right;
            }
            header p {
                margin: 0;
                display: inline;
            }
            h1 {
                text-align: center;
                color:white;
                margin-top: 20px;
            }
            .alumnos-container {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                gap: 20px;
                margin: 20px;
            }
            .alumno {
                border: 2px solid #ccc;
                border-radius: 10px;
                padding: 20px;
                background-color: #fff;
            }
            .alumno p {
                margin: 0;
            }
        </style>
    </head>
    <body>
        <header>
            <nav>
                <p><%=session.getAttribute("momentoDeEntrada")%> - </p>
                <p><%=session.getAttribute("nombreDeIngreso")%></p>
            </nav>
        </header>

        <h1>Lista de Alumnos</h1>

        <div class="alumnos-container">
            <%
                List<Usuario> listaUsuarios = (List<Usuario>) request.getSession().getAttribute("listaUsuarios");
                int cont = 1;
                for (Usuario usuario : listaUsuarios) {
            %>
            <div class="alumno">
                <p>Alumno <%=cont%>:</p>
                <p>Nombre: <%=usuario.getNombre()%></p>
                <p>Apellido: <%=usuario.getApellido()%></p>
            </div>
            <%
                    cont++;
                }
            %>
        </div>
    </body>
</html>
