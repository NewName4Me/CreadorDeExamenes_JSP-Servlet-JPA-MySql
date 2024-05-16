package com.mycompany.proyectofinal.servlets;

import Controladores.ControladoraPreguntas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SveliminarPregunta", urlPatterns = {"/SveliminarPregunta"})
public class SveliminarPregunta extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SveliminarPregunta</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SveliminarPregunta at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //tomamos el id de la pregunta
        String idParam = request.getParameter("preguntaId");
        if (idParam != null) {
            int preguntaId = Integer.parseInt(idParam);
            ControladoraPreguntas controladora = new ControladoraPreguntas();

            // eliminar la pregunta
            try {
                controladora.eliminarPregunta(preguntaId);

                //vuelvo a traerme la sesion para mostrar en tiempo real la lista de Preguntas
                HttpSession misesion = request.getSession();
                misesion.setAttribute("listaPreguntas", controladora.traerPreguntas());
            } catch (Exception e) {
                // para prevenir un error posible donde no haya conexion o no encuentra bien la pregutnta
                e.printStackTrace();
            }
        }

        // redirijo a otra pagina
        response.sendRedirect("creacionesMostrarPreguntas.jsp");
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
