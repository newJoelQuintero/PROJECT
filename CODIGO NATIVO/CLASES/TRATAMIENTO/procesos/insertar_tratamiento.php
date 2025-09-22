<?php
require_once "../../../conexion.php";
require_once "../clase.php";

$nom_tratamiento=$_POST["nom_tratamiento"] ?? null;
$tipo_tratamiento=$_POST["tipo_tratamiento"] ?? null;
$resumen_tratamiento=$_POST["resumen_tratamiento"] ?? null;
$id_diagnostico=$_POST["id_diagnostico"] ?? null;

$datos=array($nom_tratamiento, $tipo_tratamiento, $resumen_tratamiento, $id_diagnostico);
$obj=new TRATAMIENTO();
header("Content-Type: application/json");

if($obj->Insertar_tratamiento($datos) == 1) {
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "error"]);
}
?>
