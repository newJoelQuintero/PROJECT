<?php
require_once "../../../conexion.php";
require_once "../clase.php";

$id_factura=$_POST["id_factura"] ?? null;
$fecha_emision=$_POST["fecha_emision"] ?? null; // 'YYYY-MM-DD'
$subtotal=$_POST["subtotal_factura"] ?? null;
$total=$_POST["total_factura"] ?? null;
$id_empleado=$_POST["id_empleado"] ?? null;
$id_metodo_pago=$_POST["id_metodo_pago"] ?? null;

$datos=array($id_factura, $fecha_emision, $subtotal, $total, $id_empleado, $id_metodo_pago);
$obj=new FACTURA();
if($obj->Actualizar_factura($datos)==1)
{
    header("location:../");
}
else{
    echo"Error al actualizar el cliente";
}
?>