<?php
require_once "../../conexion.php";
require_once "../../CLASES/FACTURA/clase.php"
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../../CSS/formularios.css">
    <title>Factura</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
</head>
<body>
    <div class="body__container">
        <form action="../../CLASES/FACTURA/procesos/insertar_factura.php" method="POST" class="form">
            <h1 class="title">Factura</h1>
            <div class="form__container">
                <label>Fecha Emisión</label>
                <input type="date" name="fecha_emision" required>
            </div>
            <div class="form__container">
                <label>Subtotal</label>
                <input type="number" name="subtotal_factura" required>
            </div>
            <div class="form__container">
                <label>Total</label>
                <input type="number" name="total_factura" required>
            </div>
            <div class="form__container">
                <label>ID Cliente</label>
                <input type="number" name="id_cliente" required>
            </div>
            <div class="form__container">
                <label>ID Empleado</label>
                <input type="number" name="id_empleado" required>
            </div>
            <div class="form__container">
                <label>ID Método Pago</label>
                <input type="number" name="id_metodo_pago" required>
            </div>
            <div class="form__container">
                <button>Registrar Factura</button>
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
