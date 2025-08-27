<?php
require_once "../../../conexion.php";
require_once "../clase.php";

$tipo_documento=$_POST["tipo_documento"] ?? null;
$dni_cliente=$_POST["dni_cliente"] ?? null;
$nombre=$_POST["nombre"] ?? null;
$direccion=$_POST["direccion"] ?? null;
$telefono=$_POST["telefono"] ?? null;
$usuario=$_POST["usuario"] ?? null;
$contrasena=$_POST["contrasena"] ?? null;

$datos=array($tipo_documento, $dni_cliente, $nombre, $direccion, $telefono, $usuario, $contrasena);
$obj=new CLIENTE();
header("Content-Type: application/json");

if($obj->Insertar_cliente($datos) == 1) {
    echo json_encode(["status" => "success"]);
} else {
    echo json_encode(["status" => "error"]);
}
?>