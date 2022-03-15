<%-- 
    Document   : agregar_platillo_orden
    Created on : 20/11/2021, 05:59:01 PM
    Author     : MARIA DEL REFUGIO
--%>

<%@page import="Modelo.Orden_Platillos"%>
<%@page import="Modelo.MNegocio"%>
<%@page import="java.util.Vector"%>
<%@page import="Modelo.CPlatillo"%>
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
    Vector<Orden_Platillos> voplat = new Vector<Orden_Platillos>();
    voplat = (Vector<Orden_Platillos>) sesionneg.getAttribute("Vector_Orden");
    if(voplat == null){
        %>
    <jsp:forward page="error_neg.jsp">
        <jsp:param name="error" value="" />
        
    </jsp:forward>
<%
    }
    Vector<CPlatillo> plat = new Vector<CPlatillo>();
    CPlatillo pla = new CPlatillo();
    plat = pla.Platillos(neg.getId_mneg());
    if(plat == null){
        %>
    <jsp:forward page="error_neg.jsp">
        <jsp:param name="error" value="" />
        
    </jsp:forward>   
        <%
    }
    if(plat.size() == 0){
        %>
    <jsp:forward page="error_neg.jsp">
        <jsp:param name="error" value="" />
        
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
    <link rel="stylesheet" href="CSS/paginas.css">
    <link rel="stylesheet" href="CSS/sidebar.css">
    <link rel="stylesheet" href="CSS/agregarp.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <script src="JS/Validar_Platillo_Orden.js"></script>
    <title>Agregar Platillo a Orden- OrderEat</title>
</head>
<body>
    <script>
        $(document).ready(function() {
            $('.js-example-basic-single').select2();
        });
    </script>
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
                <a href="clientes.jsp">
                    <i class='bx bx-user-check'></i>
                    <span class="links_name">Clientes</span>
                </a>
                
            </li>
            <li>
                <a href="platillos.jsp">
                    <i class='bx bx-restaurant'></i>
                    <span class="links_name">Platillos</span>
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
            <i class='bx bx-log-out' id="log_out"></i>
        </div>
    </div>
    <div class="home_content">
        <a href="agregarorden.jsp"><i class='regreso bx bx-left-arrow-alt'><p class="at">Regresar</p></i></a> 
        
        <div class="container">
            
            <div class="content">
              <form method="post" action="Agregar_Platillo_Orden">
                <div class="user-details">
                    <div class="input-box">
                        <span class="details">Platillo</span>
                        <select class="js-example-basic-single"  name="Platillo" id="Platillo" style="width: 300px;">
                            <option value="">Selecciona una opcion</option>
                            <%                                
                                    int longitud = plat.size();
                                    for(int i = 0; i < longitud; ++i){
                                        CPlatillo act = plat.get(i);
                                        %>
                                        <option value = "<%=i%>">
                                            <%=act.getNom_cpla()%>
                                        </option>
                                        <%
                                    }
                            %>
                            
                        </select>
                    </div>
                  <div class="input-box">
                    <span class="details">Cantidad</span>
                    <input type="number" placeholder="" id="Cantidad" name="Cantidad" required>
                  </div>
                <div class="button">
                  <input type="submit" value="Agregar">
                </div>
                            </div>
              </form>
            
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