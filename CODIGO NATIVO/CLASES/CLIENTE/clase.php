<?php
class CLIENTE {

    public function Consultar_cliente() {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $stmt = $conexion->prepare("CALL PROCEDIMIENTO_CONSULTAR_CLIENTE()");
        $stmt->execute();

        $resultado = $stmt->get_result();
        return $resultado->fetch_all(MYSQLI_ASSOC);
    }

    public function Insertar_cliente($datos) {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $stmt = $conexion->prepare("CALL PROCEDIMIENTO_INSERTAR_CLIENTE(?,?,?,?,?,?,?)");
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
    public function Actualizar_cliente($datos) {
        $con = new CONECTAR();
        $conexion = $con->conexion();

        $sql = "CALL ACTUALIZAR_CLIENTE(?,?,?,?,?,?,?, ?, ?)";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param('issssissi',
            $datos[0],
            $datos[1],
            $datos[2],
            $datos[3],
            $datos[4],
            $datos[5],
            $datos[6],
            $datos[7],
            $datos[8]
        );

        return $stmt->execute();
    }
}
?>
