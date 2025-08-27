<?php
class EMPLEADO {

    public function Consultar_empleado() {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $stmt = $conexion->prepare("CALL PROCEDIMIENTO_CONSULTAR_EMPLEADO()");
        $stmt->execute();

        $resultado = $stmt->get_result();
        return $resultado->fetch_all(MYSQLI_ASSOC);
    }

    public function Insertar_empleado($datos) {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $stmt = $conexion->prepare("CALL PROCEDIMIENTO_INSERTAR_EMPLEADO(?,?,?,?,?,?,?)");
        $stmt->bind_param('ssssiss',
            $datos[0],
            $datos[1],
            $datos[2],
            $datos[3],
            $datos[4],
            $datos[5],
            $datos[6] 
        );

        return $stmt->execute();
    }
    public function Actualizar_empleado($datos) {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $sql = "CALL ACTUALIZAR_EMPLEADO(?,?,?,?,?,?,?,?)";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param('issssiss',
            $datos[0],
            $datos[1],
            $datos[2],
            $datos[3],
            $datos[4],
            $datos[5],
            $datos[6],
            $datos[7]
        );

        return $stmt->execute();
    }
}
?>
