<%-- 
    Document   : agregar_pago
    Created on : 21/11/2021, 11:07:29 PM
    Author     : MARIA DEL REFUGIO
--%>

<%@page import="Modelo.Tokens"%>
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
    <link rel="stylesheet" href="CSS/paginas.css">
    <link rel="stylesheet" href="CSS/sidebar.css">
    <link rel="stylesheet" href="CSS/agregarp.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="JS/Validar_Pago.js"></script>  
    <title>Agregar Pago - OrderEat</title>
</head>
<body>
    <div class="sidebar">
        <div class="logo_content">
            <div class="logo">
                <img src="isotipo.png" width="35" height="35">
                <div class="logo_name">OrderEat</div>
            </div>
            <i class='bx bx-menu' id="btn"></i>
        </div>
        <ul class="nav_list">
            <li>
                <a href="ordenes.jsp">
                    <i class='bx bx-dish'></i>
                    <span class="links_name">Órdenes</span>
                </a>
                
            </li>
            <li>
                <a href="platillos.jsp">
                    <i class='bx bx-restaurant'></i>
                    <span class="links_name">Platillos</span>
                </a>
                
            </li>

            <li>
                <a href="historial.jsp">
                    <i class='bx bx-pie-chart-alt'></i>
                    <span class="links_name">Historial</span>
                </a>
                
            </li>

            <li>
                <a href="reportes.jsp">
                    <i class='bx bx-receipt'></i>
                    <span class="links_name">Reporte</span>
                </a>
            </li>
        </ul>
        <div class="profile_content">
            <a href="Logout_Negocio"><i class='bx bx-log-out' id="log_out"></i></a>
        </div>
    </div>
    <div class="home_content">
        <a href="reportes.jsp"><i class='regreso bx bx-left-arrow-alt'><p class="at">Regresar</p></i></a> 
        
        <div class="container">
            <div class="title">Agregar Pago</div>
            <div class="content">
              <form method="post" action="Registro_Pago">
                <div class="user-details">
                  <div class="input-box">
                    <span class="details">Nombre</span>
                    <input type="text" placeholder="" id="Titulo" name="Titulo" required>
                  </div>
                  <div class="input-box">
                    <span class="details">Comentario</span>
                    <input type="text" placeholder="" id="Descripcion" name="Descripcion" required>
                  </div>
                  <div class="input-box">
                    <span class="details">Precio</span>
                    <input type="number" placeholder="" id="Monto" name="Monto" required>
                  </div>
                <div class="button">
                  <input type="submit" value="Agregar">
                </div>
                    </div>
              </form>          
        </div>

    </div>
    </div>
    <script>
        let btn = document.querySelector("#btn");
        let sidebar = document.querySelector(".sidebar");
        
        btn.onclick = function(){
            sidebar.classList.toggle("active");
        }
    </script>
</body>
</html>
