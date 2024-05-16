package com.mycompany.proyectofinal.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javabeans.Preguntas;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvExamenCorregido", urlPatterns = {"/SvExamenCorregido"})
public class SvExamenCorregido extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvExamenCorregido</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvExamenCorregido at " + request.getContextPath() + "</h1>");
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

        List<Preguntas> preguntasDeExamenLista = (List<Preguntas>) request.getSession().getAttribute("preguntasDeExamen");
        int score = 0;
        int totalPreguntas = 0;

        for (Preguntas pregunta : preguntasDeExamenLista) {
            String preguntaEscogida = request.getParameter(String.valueOf(pregunta.getId()));
            totalPreguntas++;
            if (preguntaEscogida == null) {
                preguntaEscogida = "-1";
            }
            if (preguntaEscogida.equals(String.valueOf(pregunta.getCorrecta()))) {
                score++;
            }
        }

        HttpSession misesion = request.getSession();
        misesion.setAttribute("nota", score);
        misesion.setAttribute("totalPreguntas", totalPreguntas);

        response.sendRedirect("notaObtenida.jsp");

        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
