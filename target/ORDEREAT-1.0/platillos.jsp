<%-- 
    Document   : platillos
    Created on : 20/11/2021, 06:04:03 PM
    Author     : MARIA DEL REFUGIO
--%>

<%@page import="Modelo.VWPlatillo"%>
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
    <link rel="stylesheet" href="CSS/sidebar.css">
    <link rel="stylesheet" href="CSS/paginas.css">
    <link rel="stylesheet" href="CSS/tablas.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="JS/Validar_Editar_Eliminar_Platillo.js"></script>   
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
                        
                       <p class="text_in">Platillos</p> 

                    <td class="content_cent">
                        
                        <button class="button_plus" id="">
                            <a href="agregarplatillo.jsp"><i class='plus bx bx-plus' ></i> </a> 
                        </button>
                    </td>

                    </div>
                    
                </td>

            </tr>


        </table>
        
        <br><br><br>
        <div>
            <form  id="Platillos" method="post" action="Eliminar_Editar_Platillo">
                <center>
                <table class="content-table">
                <thead>
                  <tr>
                    <th><i class='bx bx-check-square'></i></th>
                    <th>Platillo</th>
                    <th>Tiempo</th>
                    <th>Descripción</th>
                    <th>Precio</th>
                    <th>
                        <button class="button_table" name="Editar"> 
                            <i class='bx bx-edit'></i>
                        </button>
                    </th>
                </tr>
                </thead>
                <tbody>
                <%
                    Vector<VWPlatillo> plat = new Vector<VWPlatillo>();   
                    VWPlatillo cpla = new VWPlatillo();
                    int id_mneg = neg.getId_mneg();
                    plat = cpla.Platillos2(id_mneg);
                    sesionneg.setAttribute("Vector_Platillos", plat);
                    if(plat != null){
                        int longitud = plat.size();
                        for(int i = 0; i < longitud; ++i){
                            VWPlatillo aux = plat.elementAt(i);
                            %>
                <tr>
                    <td><input type="radio" name="Platillo" id="Platillo" value="<%=i%>"></td>
                    <td>   
                        <%=aux.getNom_cpla()%>
                    </td>   
                    <td>
                        <%=aux.getNom_ctie()%>
                    </td>
                    <td>           
                        <%=aux.getDes_cpla()%>
                    </td>             
                    <td>           
                        <%=aux.getCos_cpla()%>
                    </td>                    
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

