<%-- 
    Document   : notaObtenida
    Created on : 12 may 2024, 21:39:21
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
        <h1>Results of the Exam</h1>
        <%
            Integer examScore = (Integer) session.getAttribute("nota");
        %>
        <p>Your score: <%= examScore%></p>
    </body>
</html>
