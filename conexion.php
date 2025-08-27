<?php
class CONECTAR {
    public function conexion() {
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "db_neuroEsencia";

        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("❌ Error de conexión: " . $conn->connect_error);
        }

        return $conn;
    }
}

$con = new CONECTAR();
$conn = $con->conexion();
