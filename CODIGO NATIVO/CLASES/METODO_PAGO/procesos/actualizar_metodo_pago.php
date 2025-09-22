<?php

require_once "../../../conexion.php";
require_once "../clase.php";

$tipo_metodo = $_POST["tipo_metodo"] ?? null;

$datos=array($tipo_metodo);
$obj=new METODO_PAGO();
if($obj->Actualizar_metodo_pago($datos)==1)
{
    header("location:../");
}
else{
    echo"Error al actualizar el cliente";
}
?>