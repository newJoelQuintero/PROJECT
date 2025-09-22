<?php
class DIAGNOSTICO {

    public function Consultar_diagnostico() {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $stmt = $conexion->prepare("CALL PROCEDIMIENTO_CONSULTAR_DIAGNOSTICO()");
        $stmt->execute();

        $resultado = $stmt->get_result();
        return $resultado->fetch_all(MYSQLI_ASSOC);
    }

    public function Insertar_diagnostico($datos) {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $stmt = $conexion->prepare("CALL PROCEDIMIENTO_INSERTAR_DIAGNOSTICO(?,?,?)");
        $stmt->bind_param('ssi',
            $datos[0],
            $datos[1],
            $datos[2]
        );

        return $stmt->execute();
    }
    public function Actualizar_diagnostico($datos) {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $sql = "CALL ACTUALIZAR_DIAGNOSTICO(?,?,?)";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param('ssi',
            $datos[0],
            $datos[1],
            $datos[2]
        );

        return $stmt->execute();
    }
}

?>
