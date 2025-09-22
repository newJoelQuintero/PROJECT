<?php
$id=$_GET['id_empleado'];

require_once "../../../conexion.php";
require_once "../clase.php";

$obj=new EMPLEADO();
if($obj->Eliminar_empleado($id)==1)
{
    echo "Registro Eliminado Correctamente";
}
else{
    echo"Error al eliminar el registro";
}
?>