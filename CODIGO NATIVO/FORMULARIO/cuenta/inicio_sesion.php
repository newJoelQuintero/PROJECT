<?php
require_once "../../conexion.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../../CSS/inicio_sesion.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio Sesion</title>
</head>
<body>
    <div class="body__container">
        <div class="body__txt">
            <h1 class="body__title">NeuroEsencia</h1>
            <p class="body__paragraph">Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus sed quas ab unde laborum! Fugiat eaque animi accusantium tempora accusamus laborum unde repudiandae reiciendis suscipit quidem, distinctio dolorem, nostrum sint!</p>
            <a href="../index.html" class="body__btn">Regresar</a>
        </div>
        <form class="form" action="logica.php" method="POST">
            <div class="form__container">
                <label for="usuario">Nombre de usuario</label>
                <input type="email" id="usuario" name="correo" required>
            </div>
            <div class="form__container">
                <label for="password">Contraseña</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button>Iniciar Sesion</button>
            <div class="form__option">
                <a href="#" class="btn__option">Olvide mi contraseña</a>
                <a href="../Formulario_Inicio_Sesion/registro.html" class="btn__register">Registrate</a>
            </div>
        </form>
    </div>
    <footer>
            <div class="contenedor-footer">
                <div class="content-foo">
                    <h4>Numero</h4>
                    <p>33123239944</p>
                </div>
                <div class="content-foo">
                    <h4>Email</h4>
                    <p> NeuroEsencia@gmail.com</p>
                </div>
                <div class="content-foo">
                    <h4>Location</h4>
                    <p>NeuroEsencia</p>
                </div>
            </div>
            <h2 class="titulo-final">&copy; NeuroEsencia</h2>
         </footer>
</body>
</html>