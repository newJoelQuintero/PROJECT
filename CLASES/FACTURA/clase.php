<?php
class FACTURA {

    public function Consultar_factura() {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $stmt = $conexion->prepare("CALL PROCEDIMIENTO_CONSULTAR_CITA()");
        $stmt->execute();

        $resultado = $stmt->get_result();
        return $resultado->fetch_all(MYSQLI_ASSOC);
    }

    public function Insertar_factura($datos) {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $stmt = $conexion->prepare("CALL PROCEDIMIENTO_INSERTAR_FACTURA(?,?,?,?,?,?)");
        $stmt->bind_param('sddiii',
            $datos[0],
            $datos[1],
            $datos[2],
            $datos[3],
            $datos[4],
            $datos[5]
        );

        return $stmt->execute();
    }

    public function Actualizar_factura($datos) {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $sql = "CALL ACTUALIZAR_FACTURA(?,?,?,?)";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param('isdd',
            $datos[0],
            $datos[1],
            $datos[2],
            $datos[3]
        );

        return $stmt->execute();
    }
}

?>
