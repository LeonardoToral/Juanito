<%-- 
    Document   : reportes
    Created on : 21/11/2021, 12:50:28 AM
    Author     : MARIA DEL REFUGIO
--%>

<%@page import="Modelo.VWOrden"%>
<%@page import="Modelo.MPagos"%>
<%@page import="Modelo.VCliente"%>
<%@page import="Modelo.VOrden"%>
<%@page import="java.util.Vector"%>
<%@page import="Modelo.Tokens"%>
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
    int costos = 0;
    Vector<MPagos> pagos = new Vector<MPagos>();
    MPagos pag = new MPagos();
    pagos = pag.Pagos(neg.getId_mneg());
    Vector<VWOrden> ordenes = new Vector<VWOrden>();
    Vector<VOrden> det_orden = new Vector<VOrden>();
    VWOrden aux_ord = new VWOrden();
    VOrden aux_det = new VOrden();
    ordenes = aux_ord.Ordenes_Pagos(neg.getId_mneg());
    det_orden = aux_det.Detalle_Orden_Pagos(neg.getId_mneg());
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Alatsi&family=Nunito+Sans&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="isotipo.png"> 
    <link rel="stylesheet" href="CSS/sidebar.css">
    <link rel="stylesheet" href="CSS/paginas.css">
    <link rel="stylesheet" href="CSS/reportes.css">
    <link rel="stylesheet" href="CSS/tablas.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="JS/Validar_Reportes.js"></script>
    
    <title>OrderEat</title>
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
                        
                       <p class="text_in">Reportes</p> 

                    

                    </div>
                    
                </td>

            </tr>


        </table>
        <div><br>
            <center><h2 class="titulito">Pagos</h2></center>
            <br>
            <center><a href="agregar_pago.jsp" class="linka">Agregar Pago</a></center>
            <div>
                <center>
                    <form method="post" action="Eliminar_Pago" id="form2">
                    <table class="content-table">
                    <thead>
                    <tr>
                        <%
                        if(pagos != null){
                            if(pagos.size() > 0){
                                %>
                        <th><button type="submit" class="button_table" id="form2"><i class='bx bx-check-square'></i></button></th>
                        <%
                            }
                        }
                        %>                        
                        <th>Pago</th>
                        <th>Comentario</th>
                        <th>Precio</th>                     
                    </tr>
                    </thead>
                    <tbody>
                    <%
                
                if(pagos != null){
                    int longitud = pagos.size();
                    for(int i = 0; i < longitud; ++i){
                        MPagos aux = pagos.elementAt(i);
                        costos -= Integer.parseInt(aux.getCos_mpag());
                        %>
                    <tr>
                        <td><input type="radio" name="Opcion2" value="<%=i%>" required></td>
                        <td><%=aux.getTit_mpag()%></td>
                        <td><%=aux.getDes_mpag()%></td>
                        <td><%=aux.getCos_mpag()%></td>
                    </tr>
                    <%
                    }
                }
            %>
                    </tbody>
                </table>
                    </form>
                </center>
            </div>
        </div>

        <div><br>
            <center><h2 class="titulito">Ordenes Entregadas</h2></center>
            <br>
            <div>
                <center>
                    <form method="post" action="Historial_Orden" id="form1">
                    <table class="content-table">
                    <thead>
                    <tr>
                        <%
                            if(ordenes != null){
                                if(ordenes.size() > 0){
                                    %>
                        <th><button type="submit" class="button_table" id="form2"><i class='bx bx-check-square'></i></button></th>
                        <%
                                }
                            }
                        %>                        
                        <th>Cliente</th>
                        <th>Dirección</th>
                        <th>Cantidad</th>
                        <th>Platillo</th>
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
                                costos += Integer.parseInt(act_ord.getCos_mord());
                                %>
                    <tr>
                      
                        <td><input type="radio" name="Orden2" id="Orden2" value="<%=i%>" required></td>
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
                        <td><%="$" + act_ord.getCos_mord() %></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
                    </form>
                </center>
            </div>
        </div>
        <div class="drop">
            <br>
            <div class="drop__container" id="drop-items">
                <div class="drop__card">
                    <div class="drop__data">
                        <i class='bx bx-dollar'></i>
                        <div>
                            <h1 class="drop__name">Balance</h1>
                            <span class="drop__profession">Del día de Hoy</span>
                        </div>
                    </div>

                    <div>
                        <span class="drop__total"><%="$" + costos%></span>
                    </div>
                </div>
                
            </div>
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
