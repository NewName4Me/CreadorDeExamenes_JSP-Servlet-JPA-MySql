package com.mycompany.proyectofinal.servlets;

import Controladores.ControladoraPreguntas;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;
import javabeans.Preguntas;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvExamen", urlPatterns = {"/SvExamen"})
public class SvExamen extends HttpServlet {

    ControladoraPreguntas control = new ControladoraPreguntas();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvExamen</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvExamen at " + request.getContextPath() + "</h1>");
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

        int numeroDePreguntas = Integer.parseInt(request.getParameter("numeroDePreguntas"));

        List<Preguntas> todasLasPreguntas = control.traerPreguntas();

        //prevenimos que nos introduzcan un numero mayor de preguntas que las que tenemso
        if (numeroDePreguntas > todasLasPreguntas.size()) {
            response.sendRedirect("creaciones.jsp");
            HttpSession misesion = request.getSession();
            misesion.setAttribute("preguntasInsuficientes", todasLasPreguntas.size());
            return;
        }
        Collections.shuffle(todasLasPreguntas);

        List<Preguntas> preguntasDeExamen = todasLasPreguntas.subList(0, numeroDePreguntas);

        // Store preguntasDeExamen in the session
        HttpSession session = request.getSession();
        session.setAttribute("preguntasDeExamen", preguntasDeExamen);

        response.sendRedirect("examen.jsp");

        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
