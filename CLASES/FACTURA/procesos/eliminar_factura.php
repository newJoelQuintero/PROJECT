<?php
$id=$_GET['id_factura'];

require_once "../../../conexion.php";
require_once "../clase.php";

$obj=new FACTURA();
if($obj->Eliminar_factura($id)==1)
{
    echo "Registro Eliminado Correctamente";
}
else{
    echo"Error al eliminar el registro";
}
?>