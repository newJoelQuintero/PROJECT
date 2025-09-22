<?php
$id=$_GET['id_tratamiento'];

require_once "../../../conexion.php";
require_once "../clase.php";

$obj=new TRATAMIENTO();
if($obj->Eliminar_tratamiento($id)==1)
{
    echo "Registro Eliminado Correctamente";
}
else{
    echo"Error al eliminar el registro";
}
?>