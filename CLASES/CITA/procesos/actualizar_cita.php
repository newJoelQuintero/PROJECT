<?php
require_once "../../../conexion.php";
require_once "../clase.php";

$idcita=$_POST["id_cita"] ?? null;
$horacita=$_POST["hora_cita"] ?? null;
$valorcita=$_POST["valor_cita"] ?? null;
$idempleado=$_POST["id_empleado"] ?? null;
$idmetodo_pago=$_POST["id_metodo_pago"] ?? null;

$datos=array();
$obj=new CITA($idcita, $horacita, $valorcita, $idempleado, $idmetodo_pago);
if($obj->Actualizar_cita($datos)==1)
{
    header("location:../");
}
else{
    echo"Error al actualizar la cita";
}
?>