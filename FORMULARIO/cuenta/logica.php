<?php
require_once "../../conexion.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $correo = $_POST["correo"] ?? null;
    $clave  = $_POST["password"] ?? null;

    if ($correo && $clave) {
        $conn = (new CONECTAR())->conexion();

        $sqlEmpleado = "SELECT * FROM EMPLEADO WHERE usuario = ? AND contrasena = ? LIMIT 1";
        $stmt = $conn->prepare($sqlEmpleado);
        $stmt->bind_param("ss", $correo, $clave);
        $stmt->execute();
        $resultEmpleado = $stmt->get_result();

        if ($resultEmpleado->num_rows > 0) {
            header("Location: ../../DASHBOARD/dashboard.html");
            exit();
        }

        $sqlCliente = "SELECT * FROM CLIENTE WHERE usuario = ? AND contrasena = ? LIMIT 1";
        $stmt = $conn->prepare($sqlCliente);
        $stmt->bind_param("ss", $correo, $clave);
        $stmt->execute();
        $resultCliente = $stmt->get_result();

        if ($resultCliente->num_rows > 0) {
            header("Location: ../../index.html");
            exit();
        }

        echo "Correo o contraseña incorrectos.";
    } else {
        echo "Debe ingresar correo y contraseña.";
    }
}
?>
