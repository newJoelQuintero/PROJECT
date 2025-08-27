<?php
require_once "../../../conexion.php";
require_once "../clase.php";

$tipo_documento=$_POST["tipo_documento"] ?? null;
$dni_empleado=$_POST["dni_empleado"] ?? null;
$nombre=$_POST["nombre"] ?? null;
$direccion=$_POST["direccion"] ?? null;
$telefono=$_POST["telefono"] ?? null; // BIGINT -> úsalo como string
$usuario=$_POST["usuario"] ?? null;
$contrasena=$_POST["contrasena"] ?? null;

$datos=array($tipo_documento, $dni_empleado, $nombre, $direccion, $telefono, $usuario, $contrasena);
$obj=new EMPLEADO();
if($obj->Actualizar_empleado($datos)==1)
{
    header("location:../");
}
else{
    echo"Error al actualizar el cliente";
}
?>