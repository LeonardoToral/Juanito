<%-- 
    Document   : agregarorden
    Created on : 20/11/2021, 05:59:28 PM
    Author     : MARIA DEL REFUGIO
--%>

<%@page import="Modelo.VWCliente"%>
<%@page import="Modelo.Colonias"%>
<%@page import="Modelo.Municipios"%>
<%@page import="Modelo.MCliente"%>
<%@page import="Modelo.CPlatillo"%>
<%@page import="Modelo.MNegocio"%>
<%@page import="Modelo.Orden_Platillos"%>
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
    VWCliente clie = (VWCliente) sesionneg.getAttribute("Cliente_Orden");
    if(clie == null){
        %>
    <jsp:forward page="error_neg.jsp">
        <jsp:param name="error" value="" />
        
    </jsp:forward>   
        <%
    }
    String num_int = "";
    if(clie.getNumint_dcli() != -1){
        num_int = Integer.toString(clie.getNumint_dcli());
    }
    String colonia = Integer.toString(clie.getCp());
    if(colonia.length() != 5){
        colonia = "0" + colonia;
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
    <link rel="stylesheet" href="CSS/tablas.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="JS/Validar_Orden2.js"></script> 
    <title>Agregar Órden - OrderEat</title>
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
        <a href="cliente.jsp"><i class='regreso bx bx-left-arrow-alt'><p class="at">Regresar</p></i></a> 
    

        <div class="container">
            <div class="title">Orden</div>
            <div class="content">
              <form method="post" action="Agregar_Orden">
                <div class="user-details">
                  <div>
                    <a href="agregar_platillo_orden.jsp" class="mas"><i class='bx bx-plus'></i>Platillo </a>
                    <center>
                      <table class="content-table">
                        <thead>
                          <tr>
                            <th>Cantidad</th>
                            <th>Platillo</th>
                            <th>Precio</th>
                          </tr>
                        </thead>
                        <tbody>
                             <%                      
                      int suma = 0;
                      if(voplat != null){
                          int longitud = voplat.size();
                          for(int i = 0; i < longitud; ++i){
                              Orden_Platillos aux = voplat.elementAt(i);
                              suma += aux.getCost();
                              %>
                              <tr>
                                  <td><%=aux.getNom_pla()%></td>
                                  <td><%=aux.getCant()%></td>
                                  <td><%=aux.getCost()%></td>
                              </tr>
                        <%
                          }
                      }                      
                  %>
                  <tr>
                      <td colspan="2">Total</td>
                      <td><%=suma%></td>
                  </tr>
                        </tbody>
                      </table>
                    </center>
                    
                  </div>
                  <div class="input-box">
                    <span class="details">Comentarios</span>
                    <input type="text" placeholder="" id="Comentario" name="Comentario">
                  </div>
                  <div class="input-box">
                      
                  </div>
                  <div class="input-box">
                        <span class="details">Nombre</span>
                        <input type="text" placeholder="<%=clie.getNom_mcli()%>" readonly>
                    </div>
                    <div class="input-box">
                        <span class="details">Número de Celular</span>
                        <input type="text" placeholder="<%=clie.getTel_dcli()%>" readonly>
                    </div>
                    <div class="input-box">
                        <span class="details">Calle</span>
                        <input type="text" placeholder="<%=clie.getCalle_dcli()%>" readonly>
                    </div>
                    <div class="input-box">
                        <span class="details">Número Exterior</span>
                        <input type="text" placeholder="<%=clie.getNumext_dcli()%>" readonly>
                    </div>
                    <div class="input-box">
                        <span class="details">Número Interior</span>
                        <input type="text" placeholder="<%=num_int%>" readonly>
                    </div>
                    <div class="input-box">
                        <span class="details">Colonia</span>
                        <input type="text" placeholder="<%=clie.getColonia()%>" readonly>
                    </div>
                    <div class="input-box">
                        <span class="details">Alcaldía</span>
                        <input type="text" placeholder="<%=clie.getMunicipio()%>" readonly>
                    </div>
                    <div class="input-box">
                        <span class="details">Codigo Postal</span>
                        <input type="text" placeholder="<%=colonia%>" readonly>
                    </div>
                    <div class="input-box">
                        <span class="details">Estado</span>
                        <input type="text" placeholder="CDMX" readonly>
                    </div>
                </div>
                <div class="button">
                  <input type="submit" value="Agregar Orden">
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
