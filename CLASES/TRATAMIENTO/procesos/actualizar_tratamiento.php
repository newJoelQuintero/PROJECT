<?php
require_once "../../../conexion.php";
require_once "../clase.php";

$id_tratamiento=$_POST["id_tratamiento"] ?? null;
$nom_tratamiento=$_POST["nom_tratamiento"] ?? null;
$tipo_tratamiento=$_POST["tipo_tratamiento"] ?? null;
$resumen_tratamiento=$_POST["resumen_tratamiento"] ?? null;
$id_diagnostico=$_POST["id_diagnostico"] ?? null;

$datos=array();
$obj=new TRATAMIENTO($idcita, $horacita, $valorcita, $idempleado, $idmetodo_pago);
if($obj->Actualizar_tratamiento($datos)==1)
{
    header("location:../");
}
else{
    echo"Error al insertar la cita";
}
?>