<?php
require_once "../../conexion.php";
require_once "../../CLASES/EMPLEADO/clase.php"
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../../CSS/formularios.css">
    <title>Empleado</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
</head>
<body>
    <div class="body__container">
        <form action="../../CLASES/EMPLEADO/procesos/insertar_empleado.php" method="POST" class="form">
            <h1 class="title">Empleado</h1>
            <div class="form__container">
                <label for="">Tipo de documento</label>
                <select name="tipo_documento" id="tipo_documento">
                    <option value="CC">CC</option>
                    <option value="CE">CE</option>
                    <option value="PASAPORTE">PASAPORTE</option>
                    <option value="TI">TI</option>
                    <option value="PPT">PPT</option>
                </select>
            </div>
            <div class="form__container">
                <label for="">Número de documento</label>
                <input type="number" name="dni_empleado" required>
            </div>
            <div class="form__container">
                <label for="">Nombre</label>
                <input type="text" name="nombre" required>
            </div>
            <div class="form__container">
                <label for="">Dirección</label>
                <input type="text" name="direccion" required>
            </div>
            <div class="form__container">
                <label for="">Teléfono</label>
                <input type="number" name="telefono" required>
            </div>
            <div class="form__container">
                <label for="">Usuario</label>
                <input type="text" name="usuario" required>
            </div>
            <div class="form__container">
                <label for="">Contraseña</label>
                <input type="password" name="contrasena" required>
            </div>
            <div class="form__container">
                <button>Registrar Empleado</button>
            </div>
        </form>
    </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="../../SCRIPT/alertas.js"></script>
        <script>
            initFormHandler(".form");
        </script>
</body>
</html>
