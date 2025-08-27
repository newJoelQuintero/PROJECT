<?php
require_once "../../conexion.php";
require_once "../../CLASES/TRATAMIENTO/clase.php"
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../../CSS/formularios.css">
    <title>Tratamiento</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
</head>
<body>
    <div class="body__container">
        <form action="../../CLASES/TRATAMIENTO/procesos/insertar_tratamiento.php" method="POST" class="form">
            <h1 class="title">Tratamiento</h1>
            <div class="form__container">
                <label for="">Nombre del Tratamiento</label>
                <input type="text" name="nom_tratamiento" required>
            </div>
            <div class="form__container">
                <label for="">Nombre del Tratamiento</label>
                <select name="tipo_tratamiento">
                    <option value="Psicoterapia individual">Psicoterapia individual</option>
                    <option value="Psicoterapia familiar">Psicoterapia familiar</option>
                    <option value="Psicoterapia de pareja">Psicoterapia de pareja</option>
                    <option value="Psicología infantil">Psicología infantil</option>
                </select>
            </div>
            <div class="form__container">
                <label for="">Descripción</label>
                <textarea name="resumen_tratamiento" required></textarea>
            </div>
            <div class="form__container">
                <label for="">Id diagnostico</label>
                <input type="number" step="0.01" name="id_diagnostico" required>
            </div>
            <div class="form__container">
                <button>Registrar Tratamiento</button>
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
