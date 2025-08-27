<?php
$id=$_GET['id_cliente'];

require_once "../../../conexion.php";
require_once "../clase.php";

$obj=new CLIENTE();
if($obj->Eliminar_cliente($id)==1)
{
    echo "Registro Eliminado Correctamente";
}
else{
    echo"Error al eliminar el registro";
}
?>