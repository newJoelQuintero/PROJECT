<?php
require_once "../../../conexion.php";
require_once "../clase.php";

$id_diagnostico     = $_POST["id_diagnostico"] ?? null;
$nom_diagnostico    = $_POST["nom_diagnostico"] ?? null;
$resumen_diagnostico= $_POST["resumen_diagnostico"] ?? null;
$id_empleado        = $_POST["id_empleado"] ?? null;

$datos=array($id_diagnostico, $nom_diagnostico, $resumen_diagnostico, $id_empleado);
$obj=new DIAGNOSTICO();
if($obj->Actualizar_diagnostico($datos)==1)
{
    header("location:../");
}
else{
    echo"Error al actualizar el cliente";
}
?>