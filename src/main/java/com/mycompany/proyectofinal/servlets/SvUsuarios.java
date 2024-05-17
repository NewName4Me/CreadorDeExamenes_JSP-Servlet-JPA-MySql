/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.proyectofinal.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Controladores.ControladoraUsuarios;
import javabeans.Usuario;

@WebServlet(name = "SvUsuarios", urlPatterns = {"/SvUsuarios"})
public class SvUsuarios extends HttpServlet {

    ControladoraUsuarios control = new ControladoraUsuarios();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvUsuarios</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvUsuarios at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Usuario> listaUsuarios = new ArrayList<>();

        /*
        //prueba funcional de "base de datos" lógica para comprobar que funciona correctamente
        listaUsuarios.add(new Usuario(1, "erik", "tortajada", "segura"));
        listaUsuarios.add(new Usuario(2, "carmen", "ortega", "segurisima"));
        listaUsuarios.add(new Usuario(3, "fermin", "chiquito", "super segura"));
         */
        listaUsuarios = control.traerUsuario();

        //NOTA:la sesion se crea automatica cuando alguien entra a la web
        HttpSession misesion = request.getSession();
        misesion.setAttribute("listaUsuarios", listaUsuarios);

        response.sendRedirect("indexMostrarUsuarios.jsp");

        processRequest(request, response);
    }

    /**
     * este metodo procesa el log in de lo usuarios comprobando si son o no
     * administradores y si el usuario existe ya o no para que no tengamos
     * ninguna usuario repetido
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Tomar los parámetros enviados por el formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String contrasenya = request.getParameter("contrasenya");
        String colorPreferido = request.getParameter("color");

        // Utilizar lo mismo que en el get para traer los usuarios y comprobar si existen y si son administradores
        List<Usuario> usuariosExistentes = control.traerUsuario();
        boolean usuarioExistente = false;
        boolean contrasenyaCorrecta = false;

        HttpSession misesion = request.getSession();
        misesion.setAttribute("nombreDeIngreso", nombre);
        misesion.setAttribute("colorPreferido", colorPreferido);

        // Obtener el contador de intentos fallidos de la sesión
        Integer intentosFallidos = (Integer) misesion.getAttribute("intentosFallidos");
        if (intentosFallidos == null) {
            intentosFallidos = 0; // Inicializar el contador si no existe
        }

        for (Usuario user : usuariosExistentes) {
            boolean isNombreCorrecto = user.getNombre().equals(nombre);
            boolean isApellidoCorrecto = user.getApellido().equals(apellido);
            boolean isContrasenyaCorrecta = user.getContrasenya().equals(contrasenya);

            if (isNombreCorrecto && isApellidoCorrecto) {
                usuarioExistente = true;
                if (isContrasenyaCorrecta) {
                    contrasenyaCorrecta = true;
                    // Reset the incorrect attempts counter on successful login
                    misesion.setAttribute("intentosFallidos", 0);
                    if (user.isIsAdmin()) {
                        misesion.setAttribute("esAdmin", true);
                        response.sendRedirect("creaciones.jsp");
                        return;
                    } else {
                        misesion.setAttribute("esAdmin", null);
                        response.sendRedirect("examen.jsp");
                        return;
                    }
                } else {
                    // Incrementar el contador de intentos fallidos
                    intentosFallidos++;
                    misesion.setAttribute("intentosFallidos", intentosFallidos);
                    if (intentosFallidos >= 3) {
                        response.sendRedirect("https://www.google.com/search?client=firefox-b-d&sca_esv=0946cc8a818a9103&sca_upv=1&q=gente+mirando+con+cara+de+asco&uds=ADvngMiZcBNsMUvkBJ71fvRLrjNS_msiC5YSzyx60PzZ-dSmtegoXZ0hPrhpC8R3gw0u_Rvg58sKc0IL3kNwimobuyzT7cw0Cn74UJ0rzZHheqglVIt-Ifqday6pIxJcm7q3YVm1sbjQ5KLeFMMeKg5y7IZLTLcj94qxXlTIEtMD69CYMrhmqI1EAuKY7skDmais5j6xze3sFlMJHHrGBp0lCK15lgMGa44bjZfnooljgLpGu0K5sBz1rXNBQnLJH05ZsP155J3iQYB6vxuPrsWlFVStoPonuRRe912qKhVaBwR7X9XWHqgtJ1fuKIxpqw8i7w2vGyDc&udm=2&prmd=ivnbmz&sa=X&ved=2ahUKEwi7z_uWmJSGAxVVUaQEHQiADAEQtKgLegQIDxAB&biw=1344&bih=671&dpr=1.43");
                        return;
                    } else {
                        // Contraseña incorrecta, envía el error y termina la ejecución
                        misesion.setAttribute("error", "contraseñaIncorrecta");
                        response.sendRedirect("index.jsp");
                        return;
                    }
                }
            }
        }

        // Si el usuario no existe, lo crea
        if (!usuarioExistente) {
            // Crear un nuevo usuario
            Usuario nuevoUsuario = new Usuario();
            nuevoUsuario.setNombre(nombre);
            nuevoUsuario.setApellido(apellido);
            nuevoUsuario.setContrasenya(contrasenya);
            nuevoUsuario.setIsAdmin(false); // Aquí puedes ajustar si el nuevo usuario será administrador o no

            // Guardar el nuevo usuario en la base de datos
            control.crearUsuario(nuevoUsuario);

            // Reset the incorrect attempts counter on successful creation
            misesion.setAttribute("intentosFallidos", 0);

            // Redirige a examen.jsp después de crear el usuario, ya que no es un administrador
            response.sendRedirect("examen.jsp");
            return;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
