USE db_neuroEsencia;
DELIMITER //

CREATE PROCEDURE ACTUALIZAR_EMPLEADO(
    IN p_idempleado INT,
    IN p_tipodocumento VARCHAR(20),
    IN p_dniempleado VARCHAR(10),
    IN p_nombre VARCHAR(30),
    IN p_direccion VARCHAR(50),
    IN p_telefono VARCHAR(15),
    IN p_usuario VARCHAR(40),
    IN p_contrasena VARCHAR(255)
)
BEGIN
    UPDATE EMPLEADO SET
        tipo_documento = p_tipodocumento,
        dni_empleado = p_dniempleado,
        nombre = p_nombre,
        direccion = p_direccion,
        telefono = p_telefono,
        usuario = p_usuario,
        contrasena = p_contrasena
    WHERE id_empleado = p_idempleado;
END;
//

CREATE PROCEDURE ACTUALIZAR_CLIENTE(
    IN p_idcliente INT,
    IN p_tipodocumento VARCHAR(20),
    IN p_dnicliente VARCHAR(10),
    IN p_nombre VARCHAR(25),
    IN p_direccion VARCHAR(30),
    IN p_telefono VARCHAR(15),
    IN p_usuario VARCHAR(40),
    IN p_contrasena VARCHAR(255),
    IN p_idempleado INT
)
BEGIN
    UPDATE CLIENTE SET
        tipo_documento = p_tipodocumento,
        dni_cliente = p_dnicliente,
        nombre = p_nombre,
        direccion = p_direccion,
        telefono = p_telefono,
        usuario = p_usuario,
        contrasena = p_contrasena,
        id_empleado = p_idempleado
    WHERE id_cliente = p_idcliente;
END;
//

CREATE PROCEDURE ACTUALIZAR_CITA(
    IN p_idcita BIGINT,
    IN p_horacita DATETIME,
    IN p_valorcita FLOAT,
    IN p_idempleado INT,
    IN p_idmetodopago INT
)
BEGIN
    UPDATE CITA SET
        hora_cita = p_horacita,
        valor_cita = p_valorcita,
        id_empleado = p_idempleado,
        id_metodo_pago = p_idmetodopago
    WHERE id_cita = p_idcita;
END;
//

CREATE PROCEDURE ACTUALIZAR_DIAGNOSTICO(
    IN p_iddiagnostico BIGINT,
    IN p_nomdiagnostico VARCHAR(30),
    IN p_resumendiagnostico VARCHAR(100),
    IN p_idempleado INT
)
BEGIN
    UPDATE DIAGNOSTICO SET
        nom_diagnostico = p_nomdiagnostico,
        resumen_diagnostico = p_resumendiagnostico,
        id_empleado = p_idempleado
    WHERE id_diagnostico = p_iddiagnostico;
END;
//

CREATE PROCEDURE ACTUALIZAR_METODO_PAGO(
    IN p_idmetodo INT,
    IN p_tipometodopago VARCHAR(30)
)
BEGIN
    UPDATE METODO_PAGO SET
        tipo_metodo = p_tipometodopago
    WHERE id_metodo_pago = p_idmetodo;
END;
//

CREATE PROCEDURE ACTUALIZAR_FACTURA(
    IN p_idfactura BIGINT,
    IN p_fechafactura DATE,
    IN p_subtotalfactura FLOAT,
    IN p_totalfactura FLOAT,
    IN p_idempleado INT,
    IN p_idmetodopago INT
)
BEGIN
    UPDATE FACTURA SET
        fecha_emision = p_fechafactura,
        subtotal_factura = p_subtotalfactura,
        total_factura = p_totalfactura,
        id_empleado = p_idempleado,
        id_metodo_pago = p_idmetodopago
    WHERE id_factura = p_idfactura;
END;
//

CREATE PROCEDURE ACTUALIZAR_TRATAMIENTO(
    IN p_idtratamiento BIGINT,
    IN p_nomtratamiento VARCHAR(30),
    IN p_tipotratamiento VARCHAR(30),
    IN p_resumentratamiento VARCHAR(100),
    IN p_iddiagnostico BIGINT
)
BEGIN
    UPDATE TRATAMIENTO SET
        nom_tratamiento = p_nomtratamiento,
        tipo_tratamiento = p_tipotratamiento,
        resumen_tratamiento = p_resumentratamiento,
        id_diagnostico = p_iddiagnostico
    WHERE id_tratamiento = p_idtratamiento;
END;
//

DELIMITER ;

DELIMITER //
CREATE PROCEDURE ACTUALIZAR_HISTORIAL_CLINICO(
    IN p_idhistorial BIGINT,
    IN p_idcliente INT,
    IN p_idcita BIGINT,
    IN p_iddiagnostico BIGINT,
    IN p_idtratamiento BIGINT,
    IN p_observaciones VARCHAR(255)
)
BEGIN
    UPDATE HISTORIAL_CLINICO SET
        id_cliente = p_idcliente,
        id_cita = p_idcita,
        id_diagnostico = p_iddiagnostico,
        id_tratamiento = p_idtratamiento,
        observaciones = p_observaciones
    WHERE id_historial = p_idhistorial;
END;
//
