<?php
class METODO_PAGO {

    public function Consultar_metodo_pago() {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $stmt = $conexion->prepare("CALL PROCEDIMIENTO_CONSULTAR_METODO_PAGO()");
        $stmt->execute();

        $resultado = $stmt->get_result();
        return $resultado->fetch_all(MYSQLI_ASSOC);
    }

    public function Insertar_metodo_pago($datos) {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $stmt = $conexion->prepare("CALL PROCEDIMIENTO_INSERTAR_METODO_PAGO(?)");
        $stmt->bind_param('s',
            $datos[0]
        );
        return $stmt->execute();
    }

    public function Actualizar_metodo_pago($datos) {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $sql = "CALL ACTUALIZAR_METODO_PAGO(?,?)";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param('is',
            $datos[0],
            $datos[1]
        );

        return $stmt->execute();
    }
}

?>
