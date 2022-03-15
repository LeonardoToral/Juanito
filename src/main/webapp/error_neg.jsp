<%-- 
    Document   : error_neg
    Created on : 20/11/2021, 06:03:02 PM
    Author     : MARIA DEL REFUGIO
--%>

<%@page import="Modelo.MNegocio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    MNegocio neg = new MNegocio();
    String nombre="";
    HttpSession sesionneg = request.getSession();
    neg = (MNegocio) sesionneg.getAttribute("Negocio");
    if(neg==null){
    
    %>
    
    <jsp:forward page="error.html">
        <jsp:param name="error" value="Es obligatorio Identificarse" />
        
    </jsp:forward>
    
    <%    
    }
    nombre = neg.getNomneg_mneg();
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Alatsi&family=Nunito+Sans&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="isotipo.png"> 
    <link rel="stylesheet" href="CSS/agregarp.css">
    <link rel="stylesheet" href="CSS/paginas.css">
    <link rel="stylesheet" href="CSS/sidebar.css">
    <title>Error - OrderEat</title>
</head>
<body>
    <div class="home_content">
        <a href="ordenes.jsp"><i class='regreso bx bx-left-arrow-alt'><p class="at">Regresar</p></i></a> 
        <div class="container">
            <div class="title">Error</div>
            <br>
            <br>
            <div class="content">
                <form action="#">
                    <div class="user-details">
                        <div class="input-box">
                            <br>
                            <br>
                            <br>
                            <br>
                            <center><span class="details">Ocurrió un error inesperado, por favor vuelve a intentarlo de nuevo</span></center>
                        </div>
                        <div class="input-box">
                            <img src="IMG/error.png" alt="Error" width="230px" height="200px">                                    
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
        
</body>
</html>
