package com.mycompany.proyectofinal.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.ControladoraPreguntas;
import logica.Preguntas;

@WebServlet(name = "SvPreguntas", urlPatterns = {"/SvPreguntas"})
public class SvPreguntas extends HttpServlet {

    ControladoraPreguntas control = new ControladoraPreguntas();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvPreguntas</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvPreguntas at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * este metodo se encarga de procesar las preguntas preguntas creadas por el
     * administrador y enviarlas a la base de datos
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //tomar las variables del servidor
        String titulo = request.getParameter("titulo");
        String opcion1 = request.getParameter("opcion1");
        String opcion2 = request.getParameter("opcion2");
        String opcion3 = request.getParameter("opcion3");
        String opcion4 = request.getParameter("opcion4");
        String correcta = request.getParameter("correcta");
        
        Preguntas pregunta = new Preguntas();
        pregunta.setTitulo(titulo);
        pregunta.setOpcion1(opcion1);
        pregunta.setOpcion2(opcion2);
        pregunta.setOpcion3(opcion3);
        pregunta.setOpcion4(opcion4);
        pregunta.setCorrecta(Integer.parseInt(correcta));
        
        control.crearPregunta(pregunta);
        
        processRequest(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
}
