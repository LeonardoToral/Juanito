    <%@page import="Modelo.VWOrden"%>
<%-- 
    Document   : ordenes
    Created on : 20/11/2021, 06:03:41 PM
    Author     : MARIA DEL REFUGIO
--%>

<%@page import="Modelo.VCliente"%>
<%@page import="Modelo.VOrden"%>
<%@page import="Modelo.MNegocio"%>
<%@page import="Modelo.Orden_Platillos"%>
<%@page import="Modelo.DOrden"%>
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
    sesionneg.setAttribute("Vector_Orden", voplat);
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
    <link rel="stylesheet" href="CSS/tablas.css">
    <title>Órdenes - OrderEat</title>
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
        <br><br><br>
        <table class="table_content" cellspacing="0" >
            <tr>    
                <td>
                
                    <div class="text_open">
                        
                       <p class="text_in">Órdenes</p> 

                    <td class="content_cent">
                        
                        <button class="button_plus" id="">
                            <a href="cliente.jsp"><i class='plus bx bx-plus' ></i> </a> 
                        </button>
                    </td>

                    </div>
                    
                </td>

            </tr>


        </table>
        <br><br><br>
        <div>
            <form method="post" action="Entrega_Orden">
                <center>
                    <table class="content-table">
                    <thead>
                      <tr>
                        <th>
                            <button class="button_table" name="Editar"> 
                                <i class='bx bx-check-square'></i>
                            </button>
                        </th>
                        <th>Cliente</th>
                        <th>Dirección</th>
                        <th>Telefono</th>
                        <th>Cantidad</th>
                        <th>Platillo</th>
                        <th>Comentarios</th>
                        <th>Total</th>
                      </tr>
                    </thead>
                    <tbody>
                        <%
                            Vector<VWOrden> ordenes = new Vector<VWOrden>();
                            Vector<VOrden> det_orden = new Vector<VOrden>();
                            VWOrden aux_ord = new VWOrden();
                            VOrden aux_det = new VOrden();
                            ordenes = aux_ord.Ordenes_Actuales(neg.getId_mneg());
                            det_orden = aux_det.Detalle_Orden_Actuales(neg.getId_mneg());
                            int longitud1 = 0, longitud2 = 0;                               
                            if(ordenes != null && det_orden != null){
                                longitud1 = ordenes.size();
                                longitud2 = det_orden.size();
                                for(int i = 0; i < longitud1; ++i){
                                    VWOrden act_ord = ordenes.elementAt(i);
                                    %>
                        <tr>

                            <td><input type="radio" name="Orden" id="Orden" value="<%=i%>" required></td>
                            <td><%=act_ord.getNom_mcli()%></td>
                            <%
                            String auxiliar = "";
                            auxiliar += act_ord.getCalle_dcli();
                            auxiliar += (" " + Integer.toString(act_ord.getNumext_dcli()));
                            if(act_ord.getNumint_dcli() != -1){
                                auxiliar += (" Int. " + Integer.toString(act_ord.getNumint_dcli()));
                            }
                            auxiliar += (" Col. " + act_ord.getNombre());
                            auxiliar += (" Alc. " + act_ord.getNom_municipio());
                            auxiliar += (" Est. CDMX");
                            auxiliar += (" CP. " + Integer.toString(act_ord.getCodigo_postal()));
                        %>
                            <td><%=auxiliar%></td>
                            <td><%=act_ord.getTel_dcli()%></td>
                            <td colspan="2">
                                <table>
                                    <%
                                for(int j = 0; j < longitud2; ++j){
                                    VOrden act_det = det_orden.elementAt(j);
                                    if(act_det.getId_mord() == act_ord.getId_mord()){
                                        %>
                                    <tr>
                                        <td><%=act_det.getCant_dord()%></td>
                                        <td><%=act_det.getNom_cpla()%></td>
                                    </tr>
                                    <%
                                    }
                                    
                                }
                                    %>
                                </table>
                            </td>                                        
                            <td><%=act_ord.getCom_mord()%></td>
                            <td><%="$" + act_ord.getCos_mord() %></td>
                        </tr>
                        <%
                                }
                            }
                        %>

                    </tbody>
                  </table>
                </center>
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