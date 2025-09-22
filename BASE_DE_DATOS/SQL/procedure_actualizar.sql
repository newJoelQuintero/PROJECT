USE db_neuroEsencia;

DELIMITER //

CREATE PROCEDURE ACTUALIZAR_EMPLEADO(
    IN p_idempleado INT,
    IN p_tipo_documento ENUM('CC','TI','PET','PPT','Pasaporte'),
    IN p_dni_empleado VARCHAR(10),
    IN p_nombre VARCHAR(30),
    IN p_direccion VARCHAR(50),
    IN p_telefono VARCHAR(15),
    IN p_usuario VARCHAR(40),
    IN p_contrasena VARCHAR(255),
    IN p_idrol INT
)
BEGIN
    UPDATE EMPLEADO SET
        tipo_documento = p_tipo_documento,
        dni_empleado   = p_dni_empleado,
        nombre         = p_nombre,
        direccion      = p_direccion,
        telefono       = p_telefono,
        usuario        = p_usuario,
        contrasena     = p_contrasena,
        id_rol         = p_idrol
    WHERE id_empleado = p_idempleado;
END;
//

DELIMITER //
CREATE PROCEDURE ACTUALIZAR_PACIENTE(
    IN p_idpaciente INT,
    IN p_tipo_documento ENUM('CC','TI','PET','PPT','Pasaporte'),
    IN p_dni_cliente VARCHAR(10),
    IN p_nombre VARCHAR(25),
    IN p_direccion VARCHAR(30),
    IN p_telefono VARCHAR(15),
    IN p_usuario VARCHAR(40),
    IN p_contrasena VARCHAR(255)
)
BEGIN
    UPDATE PACIENTE SET
        tipo_documento = p_tipo_documento,
        dni_cliente    = p_dni_cliente,
        nombre         = p_nombre,
        direccion      = p_direccion,
        telefono       = p_telefono,
        usuario        = p_usuario,
        contrasena     = p_contrasena
    WHERE id_paciente = p_idpaciente;
END;
//

DELIMITER //
CREATE PROCEDURE ACTUALIZAR_FACTURA(
    IN p_idfactura INT,
    IN p_tipo_metodo_pago VARCHAR(30),
    IN p_total_factura INT,
    IN p_idempleado INT,
    IN p_idpaciente INT
)
BEGIN
    UPDATE FACTURA_VENTA SET
        tipo_metodo_pago = p_tipo_metodo_pago,
        total_factura    = p_total_factura,
        id_empleado      = p_idempleado,
        id_paciente      = p_idpaciente
    WHERE id_factura = p_idfactura;
END;
//

DELIMITER //
CREATE PROCEDURE ACTUALIZAR_CITA(
    IN p_idcita BIGINT,
    IN p_hora_cita DATETIME,
    IN p_lugar_cita VARCHAR(100),
    IN p_valor_cita FLOAT,
    IN p_idpaciente INT
)
BEGIN
    UPDATE CITA SET
        hora_cita  = p_hora_cita,
        lugar_cita = p_lugar_cita,
        valor_cita = p_valor_cita,
        id_paciente= p_idpaciente
    WHERE id_cita = p_idcita;
END;
//

DELIMITER //
CREATE PROCEDURE ACTUALIZAR_HISTORIAL_CLINICO(
    IN p_idhistorial BIGINT,
    IN p_sintomas VARCHAR(50),
    IN p_diagnostico VARCHAR(200),
    IN p_tratamiento VARCHAR(100),
    IN p_dni_empleado VARCHAR(10),
    IN p_dni_cliente VARCHAR(10)
)
BEGIN
    DECLARE v_idempleado INT;
    DECLARE v_idpaciente INT;

    SELECT id_empleado INTO v_idempleado
    FROM EMPLEADO
    WHERE dni_empleado = p_dni_empleado
    LIMIT 1;

    SELECT id_paciente INTO v_idpaciente
    FROM PACIENTE
    WHERE dni_cliente = p_dni_cliente
    LIMIT 1;

    -- validar que ambos existen antes de actualizar
    IF v_idempleado IS NOT NULL AND v_idpaciente IS NOT NULL THEN
        UPDATE HISTORIAL_CLINICO 
        SET sintomas = p_sintomas,
            diagnostico = p_diagnostico,
            tratamiento = p_tratamiento,
            id_empleado = v_idempleado,
            id_paciente = v_idpaciente
        WHERE id_historial_clinico = p_idhistorial;
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Empleado o paciente no encontrados';
    END IF;
END //
DELIMITER ;


DELIMITER ;
