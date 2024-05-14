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

        //tomar los parametros enviados por el formualrio
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String contrasenya = request.getParameter("contrasenya");

        //utilizar lo mismo que en el get para traer los usuarios y comprobar si existen y sin son administradores
        List<Usuario> usuariosExistentes = control.traerUsuario();
        boolean usuarioExistente = false;
        
        for (Usuario user : usuariosExistentes) {
            //booleanas de comprobacion
            boolean isNombreCorrecto = user.getNombre().equals(nombre);
            boolean isApellidoCorrecto = user.getApellido().equals(apellido);
            boolean isContrasenyaCorrecto = user.getContrasenya().equals(contrasenya);

            //compruebo que el usuario existe y la contraseña es correcta
            if (isNombreCorrecto && isApellidoCorrecto && isContrasenyaCorrecto) {
                usuarioExistente = true;
                //si mi usuario es administrador lo redirijo a una pagina especial
                if (user.isIsAdmin()) {
                    response.sendRedirect("creaciones.jsp");
                    return;
                }
                break; //si el usuario existe pero no es administrador no hace falta que comprobemos nada mas
            }
        }

        //solo si mi usuario no existe lo creo, para no tener valores duplicados
        if (!usuarioExistente) {
            //crear un usuario
            Usuario usuario = new Usuario();
            //darle parametros a ese usuario
            usuario.setNombre(nombre);
            usuario.setApellido(apellido);
            usuario.setContrasenya(contrasenya);
            usuario.setIsAdmin(false); //la unica forma de ser administrador es darte el rol desde la base de datos

            //llamo a la controladora que llama a la otra controladora para crear el usuario con el JPA
            control.crearUsuario(usuario);
        }
        
        HttpSession misesion = request.getSession();
        misesion.setAttribute("nombreDeIngreso", nombre);
        
        response.sendRedirect("examen.jsp");
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
}
