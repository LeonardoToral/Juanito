<%-- 
    Document   : historial
    Created on : 28/11/2021, 03:49:59 PM
    Author     : MARIA DEL REFUGIO
--%>

<%@page import="Modelo.MCliente"%>
<%@page import="Modelo.VWOrden"%>
<%@page import="Modelo.VCliente"%>
<%@page import="Modelo.VOrden"%>
<%@page import="java.util.Vector"%>
<%@page import="Modelo.MNegocio"%>
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
    Vector<VWOrden> ordenes = new Vector<VWOrden>();
    Vector<VOrden> det_orden = new Vector<VOrden>();
    VWOrden aux_ord = new VWOrden();
    VOrden aux_det = new VOrden();
    det_orden = aux_det.Detalle_Orden_Historial(neg.getId_mneg());
    String numero = (String) sesionneg.getAttribute("Busqueda");
    if(numero == null){
        ordenes = aux_ord.Ordenes_Historial(neg.getId_mneg());
    }
    else{
        boolean bandera = true;
        String regex_cos = "^[0-9]{1,4}$";
        if(!numero.matches(regex_cos)){
            bandera = false;
        }
        if(numero == "-1" || !bandera){
            ordenes = aux_ord.Ordenes_Historial(neg.getId_mneg());
        }
        else{
            ordenes = aux_ord.Ordenes_Historial_Personalizado(neg.getId_mneg(), Integer.parseInt(numero));
        }
               
    }   
    sesionneg.setAttribute("Busqueda", null);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Alatsi&family=Nunito+Sans&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="isotipo.png">
    <link rel="stylesheet" href="CSS/sidebar.css">
    <link rel="stylesheet" href="CSS/paginas.css">
    <link rel="stylesheet" href="CSS/ccliente.css">
    <link rel="stylesheet" href="CSS/agregarp.css">
    <link rel="stylesheet" href="CSS/tablahistorial.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <title>OrderEat</title>
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
        <br><br><br>
        <div class="container">
            <div class="title">Historial Clientes</div>
            <div class="content">
                <form method="post" action="Busqueda_Completa">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Seleccionar Cliente</span>
                            <select class="js-example-basic-single"  name="Cli" id="Cli" style="width: 300px;">
                                <option value="">Todos los clientes</option>
                        <%
                            Vector<MCliente> tiempos = new Vector<MCliente>();
                            MCliente tiem = new MCliente();
                            tiempos = tiem.Clientes(neg.getId_mneg());
                            if(tiempos != null){
                                int longitud = tiempos.size();
                                for(int i = 0; i < longitud; ++i){
                                    MCliente act = tiempos.get(i);
                                    %>      
                                <option value = "<%=i%>">
                                    <%=act.getNom_mcli()%>
                                </option>
                                    <%
                                }
                            }                                    
                        %>
                            </select>
                        </div>
                    </div>
                    <div class="button">
                        <input type="submit" value="Buscar">
                    </div>
                </form>
                <center>
                    <table class="content-table">
                        <thead>
                            <tr>
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
                    
                    int longitud1 = 0, longitud2 = 0;                               
                    if(ordenes != null && det_orden != null){
                        longitud1 = ordenes.size();
                        longitud2 = det_orden.size();
                        for(int i = 0; i < longitud1; ++i){
                            VWOrden act_ord = ordenes.elementAt(i);
                            %>
                <tr>                      
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
            </div>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/sortablejs@latest/Sortable.min.js"></script>

    <script>
        let btn = document.querySelector("#btn")
        let sidebar = document.querySelector(".sidebar")
        
        btn.onclick = function(){
            sidebar.classList.toggle("active")
        }
    </script>
</body>
</html>