<?php
$id=$_GET['id_diagnostico'];

require_once "../../../conexion.php";
require_once "../clase.php";

$obj=new DIAGNOSTICO();
if($obj->Eliminar_diagnostico($id)==1)
{
    echo "Registro Eliminado Correctamente";
}
else{
    echo"Error al eliminar el registro";
}
?>