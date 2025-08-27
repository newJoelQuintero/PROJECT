<?php
require_once "../../../conexion.php";
require_once "../clase.php";

$nom_diagnostico=$_POST["nom_diagnostico"] ?? null;
$resumen_diagnostico=$_POST["resumen_diagnostico"] ?? null;
$id_empleado=$_POST["id_empleado"] ?? null;

$datos=array($nom_diagnostico, $resumen_diagnostico, $id_empleado);
$obj=new DIAGNOSTICO();
header("Content-Type: application/json");

if($obj->Insertar_diagnostico($datos) == 1) {
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "error"]);
}
?>