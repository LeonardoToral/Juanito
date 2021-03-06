<%-- 
    Document   : registrar
    Created on : 20/11/2021, 06:04:50 PM
    Author     : MARIA DEL REFUGIO
--%>
<%@page import="Modelo.MNegocio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%
    MNegocio neg = new MNegocio();
    HttpSession sesionneg = request.getSession();
    neg = (MNegocio) sesionneg.getAttribute("Negocio");
    if(neg != null){
    
    %>
    
    <jsp:forward page="ordenes.jsp">
        <jsp:param name="" value="" />
        
    </jsp:forward>
    
    <%    
    }
    %>--%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
  <link href="https://fonts.googleapis.com/css2?family=Alatsi&family=Nunito+Sans&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
  <link rel="shortcut icon" href="isotipo.png">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="CSS/login2.css">
  <link rel="stylesheet" href="CSS/paginas.css">
  <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <script src="JS/Validar_Registro.js"></script>
  <title>Crear Cuenta - OrderEat</title>
</head>
<body>
  <div class="l-form">
    <div class="shape1"></div>
    <div class="shape2"></div>

    <div class="form">
        <img src="IMG/Mobile login-pana.png" alt="" class="form__img"> 
        <form method="post" action="Registro_Negocio" class="form__content">
            <a href="index.html"><i class='regreso bx bx-left-arrow-alt'></i></a>
            <h1 class="form__title">Crear Cuenta</h1>

            <div class="form__div">
                <div class="form__icon">
                    <i class='bx bx-dish' ></i>
                </div>
  
                <div class="form__div-input">
                    <label for="" class="form__label">Nombre del Negocio</label>
                    <input type="text" class="form__input" id="Nombre_Negocio" name="Nombre_Negocio" required>
                </div>
              </div>

            <div class="form__div">
                <div class="form__icon">
                    <i class='bx bx-user-circle'></i>
                </div>

                <div class="form__div-input">
                    <label for="" class="form__label">Nombre de Usuario</label>
                    <input type="text" class="form__input" id="Nombre_Usuario" name="Nombre_Usuario" required>
                </div>
            </div>

            <div class="form__div">
                <div class="form__icon">
                    <i class='bx bx-mail-send' ></i>
                </div>

                <div class="form__div-input">
                    <label for="" class="form__label">Correo Gmail</label>
                    <input type="email" class="form__input" id="Correo_Negocio" name="Correo_Negocio" required>
                </div>
            </div>

            <div class="form__div">
              <div class="form__icon">
                  <i class='bx bx-lock' ></i>
              </div>

              <div class="form__div-input">
                  <label for="" class="form__label">Contrase??a</label>
                  <input type="password" class="form__input" id="Password" name="Password" required>
              </div>
            </div>

            <div class="form__div form__div-last">
                <div class="form__icon">
                    <i class='bx bx-lock' ></i>
                </div>
  
                <div class="form__div-input">
                    <label for="" class="form__label">Confirmar contrase??a</label>
                    <input type="password" class="form__input" id="Confirmar_Password" name="Confirmar_Password" required>
                </div>
              </div>

            <br>
            <input type="checkbox" class="check" id="Confirmar_Aviso" name="Confirmar_Aviso" required>
            <a href="priv.html" target="_blank" class="form__forgot">Aviso de Privacidad</a>

            <button class="form__button">Registarse</button> 
            <a href="login.jsp" class="form__reg">Ya tengo cuenta</a>
        </form>
    </div>

</div>

<!--===== MAIN JS =====-->
<script>
    /*===== FOCUS =====*/
    const inputs = document.querySelectorAll(".form__input")

    /*=== Add focus ===*/
    function addfocus(){
        let parent = this.parentNode.parentNode
        parent.classList.add("focus")
    }

    /*=== Remove focus ===*/
    function remfocus(){
        let parent = this.parentNode.parentNode
        if(this.value == ""){
            parent.classList.remove("focus")
        }
    }

    /*=== To call function===*/
    inputs.forEach(input=>{
        input.addEventListener("focus",addfocus)
        input.addEventListener("blur",remfocus)
    })
</script>

</body>
</html>