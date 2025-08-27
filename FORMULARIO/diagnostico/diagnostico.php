<?php
require_once "../../conexion.php";
require_once "../../CLASES/DIAGNOSTICO/clase.php"
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../../CSS/formularios.css">
    <title>Diagnostico</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
</head>
<body>
    <div class="body__container">
        <form action="../../CLASES/DIAGNOSTICO/procesos/insertar_diagnostico.php" method="POST" class="form">
            <h1 class="title">Diagnostico</h1>
            <div class="form__container">
                <label>Nombre del diagnostico</label>
                <input type="text" name="nom_diagnostico" required>
            </div>
            <div class="form__container">
                <label>Descripción</label>
                <input type="text" name="resumen_diagnostico" required>
            </div>
            <div class="form__container">
                <label>Empleado</label>
                <input type="number" name="id_empleado" required>
            </div>
            <div class="form__container">
                <button>Registrar Diagnóstico</button>
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
