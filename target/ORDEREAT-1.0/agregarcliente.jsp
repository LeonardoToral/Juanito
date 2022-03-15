<%-- 
    Document   : agregarcliente
    Created on : 29/11/2021, 02:09:10 AM
    Author     : MARIA DEL REFUGIO
--%>

<%@page import="Modelo.Colonias"%>
<%@page import="Modelo.Municipios"%>
<%@page import="Modelo.MNegocio"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    MNegocio neg = new MNegocio();
    HttpSession sesionneg = request.getSession();
    neg = (MNegocio) sesionneg.getAttribute("Negocio");
    if(neg==null){
    
    %>
    
    <jsp:forward page="error.html">
        <jsp:param name="error" value="Es obligatorio Identificarse" />
        
    </jsp:forward>
    
    <%    
    }
    Municipios mun = new Municipios();
    mun = (Municipios) sesionneg.getAttribute("Delegacion");
    if(mun == null){
        %>
    
    <jsp:forward page="error_neg.jsp">
        <jsp:param name="error" value="Es obligatorio Identificarse" />
        
    </jsp:forward>
    
    <%   
    }
    Vector<Colonias> tiempos = new Vector<Colonias>();
    Colonias tiem = new Colonias();
    tiempos = tiem.Col(mun.getId());
    if(tiempos == null){
        %>
    
    <jsp:forward page="error_neg.jsp">
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <script src="JS/Validar_Orden.js"></script>
    <title>Cliente - OrderEat</title>
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
        <a href="cliente.jsp"><i class='regreso bx bx-left-arrow-alt'><p class="at">Regresar</p></i></a> 
        
        <div class="container">
            <div class="title">Agregar Cliente</div>
            <div class="content">
                <form method="post" action="Agregar_Cliente">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Nombre</span>
                            <input type="text" placeholder="" id="Cliente" name="Cli" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Número de Celular</span>
                            <input type="tel" placeholder="" id="Telefono" name="Tel" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Calle</span>
                            <input type="text" placeholder="" id="Calle" name="Cal" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Número Exterior</span>
                            <input type="number" placeholder="" id="N_Ext" name="N_Ext" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Número Interior</span>
                            <input type="number" placeholder="" name="N_Int" id="N_Int">
                        </div>
                        <div class="input-box">
                            <span class="details">Colonia</span>
                            <select class="js-example-basic-single"  id="Col" name="Col" style="width: 300px;">
                                <option value="">Selecciona una opcion</option>
                            <%                            
                                int longitud = tiempos.size();
                                for(int i = 0; i < longitud; ++i){
                                    Colonias act = tiempos.elementAt(i);
                                    %>      
                                <option value = "<%=i%>">
                                    <%=act.getNombre()%>
                                </option>
                                    <%
                                }
                        %>
                            </select>
                        </div>
                        <div class="input-box">
                            <span class="details">Alcaldía</span>
                            <input type="text" placeholder="<%=mun.getNombre()%>" readonly>
                        </div>
                        <div class="input-box">
                            <span class="details">Estado</span>
                            <input type="text" placeholder="CDMX" readonly>
                        </div>                                                                                       
                        <div class="button">
                            <input type="submit" value="Agregar">
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</body>
</html>
