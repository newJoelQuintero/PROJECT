<?php
$id=$_GET['id_metodo_pago'];

require_once "../../../conexion.php";
require_once "../clase.php";

$obj=new METODO_PAGO();
if($obj->Eliminar_metodo_pago($id)==1)
{
    echo "Registro Eliminado Correctamente";
}
else{
    echo"Error al eliminar el registro";
}
?>