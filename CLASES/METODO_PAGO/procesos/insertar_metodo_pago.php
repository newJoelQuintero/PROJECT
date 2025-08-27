<?php
require_once "../../../conexion.php";
require_once "../clase.php";

$tipometodo=$_POST["tipo_metodo"] ?? null;

$datos=array($tipometodo);
$obj=new METODO_PAGO();
header("Content-Type: application/json");

if($obj->Insertar_metodo_pago($datos) == 1) {
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "error"]);
}
?>