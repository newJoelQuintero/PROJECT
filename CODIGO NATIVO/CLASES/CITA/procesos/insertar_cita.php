<?php
require_once "../../../conexion.php";
require_once "../clase.php";

$horacita = $_POST["hora_cita"] ?? null;
$valorcita = $_POST["valor_cita"] ?? null;
$idempleado = $_POST["id_empleado"] ?? null;
$idcliente = $_POST["id_cliente"] ?? null;
$idmetodo_pago = $_POST["id_metodo_pago"] ?? null;

if ($horacita) {
    $horacita = str_replace("T", " ", $horacita) . ":00";
}

$datos = array($horacita,$valorcita,$idempleado,$idcliente,$idmetodo_pago);

$obj = new CITA();
header("Content-Type: application/json");

if($obj->Insertar_cita($datos) == 1) {
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "error"]);
}
?>
