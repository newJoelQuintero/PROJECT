<?php
class TRATAMIENTO {

    public function Consultar_tratamiento() {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $stmt = $conexion->prepare("CALL PROCEDIMIENTO_CONSULTAR_TRATAMIENTO()");
        $stmt->execute();

        $resultado = $stmt->get_result();
        return $resultado->fetch_all(MYSQLI_ASSOC);
    }

    public function Insertar_tratamiento($datos) {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $stmt = $conexion->prepare("CALL PROCEDIMIENTO_INSERTAR_TRATAMIENTO(?,?,?,?)");
        $stmt->bind_param('sssi',
            $datos[0],
            $datos[1],
            $datos[2],
            $datos[3]
        );

        return $stmt->execute();
    }

    public function Actualizar_tratamiento($datos) {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $sql = "CALL ACTUALIZAR_TRATAMIENTO(?,?,?,?)";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param('isss',
            $datos[0],
            $datos[1],
            $datos[2],
            $datos[3]
        );

        return $stmt->execute();
    }
}

?>
