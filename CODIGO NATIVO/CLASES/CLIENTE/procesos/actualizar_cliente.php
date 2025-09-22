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
$id_empleado=$_POST["id_empleado"] ?? null;

$datos=array($tipo_documento, $dni_cliente, $nombre, $direccion, $telefono, $usuario, $contrasena, $id_empleado);
$obj=new CLIENTE();
if($obj->Actualizar_cliente($datos)==1)
{
    header("location:../");
}
else{
    echo"Error al actualizar el cliente";
}
?>