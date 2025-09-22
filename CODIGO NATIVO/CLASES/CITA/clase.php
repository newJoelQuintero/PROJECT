<?php
class CITA {
    
    public function Consultar_cita() {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $stmt = $conexion->prepare("CALL PROCEDIMIENTO_CONSULTAR_CITA()");
        $stmt->execute();

        $resultado = $stmt->get_result();
        return $resultado->fetch_all(MYSQLI_ASSOC);
    }

    public function Insertar_cita($datos) {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $stmt = $conexion->prepare("CALL PROCEDIMIENTO_INSERTAR_CITA(?,?,?,?,?)");
        $stmt->bind_param('siiii',
            $datos[0],
            $datos[1],
            $datos[2],
            $datos[3],
            $datos[4]
        );

        return $stmt->execute();
    }
    public function Actualizar_cita($datos) {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $sql = "CALL ACTUALIZAR_CITA(?,?,?,?)";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param('isdi',
            $datos[0],
            $datos[1],
            $datos[2],
            $datos[3]
        );

        return $stmt->execute();
    }

}
?>
