<?php
require_once "../../../conexion.php";
require_once "../clase.php";

$fecha_emision=$_POST["fecha_emision"] ?? null; // 'YYYY-MM-DD'
$subtotal=$_POST["subtotal_factura"] ?? null;
$total=$_POST["total_factura"] ?? null;
$id_cliente=$_POST["id_cliente"] ?? null;
$id_empleado=$_POST["id_empleado"] ?? null;
$id_metodo_pago=$_POST["id_metodo_pago"] ?? null;

$datos=array($fecha_emision, $subtotal, $total, $id_cliente, $id_empleado, $id_metodo_pago);
$obj=new FACTURA();
header("Content-Type: application/json");

if($obj->Insertar_factura($datos) == 1) {
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "error"]);
}
?>