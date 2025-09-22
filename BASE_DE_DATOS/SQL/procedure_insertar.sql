USE db_neuroEsencia;

DELIMITER //

CREATE PROCEDURE PROCEDIMIENTO_INSERTAR_EMPLEADO(
    IN p_tipo_documento ENUM('CC','TI','PET','PPT','Pasaporte'),
    IN p_dni_empleado VARCHAR(10),
    IN p_nombre VARCHAR(30),
    IN p_direccion VARCHAR(50),
    IN p_telefono VARCHAR(15),
    IN p_usuario VARCHAR(40),
    IN p_contrasena VARCHAR(255),
    IN p_nombre_rol VARCHAR(50)
)
BEGIN
    DECLARE v_idrol INT;

    SELECT id_rol INTO v_idrol
    FROM ROL
    WHERE nombre_rol = p_nombre_rol
    LIMIT 1;

    INSERT INTO EMPLEADO (tipo_documento, dni_empleado, nombre, direccion, telefono, usuario, contrasena, id_rol)
    VALUES (p_tipo_documento, p_dni_empleado, p_nombre, p_direccion, p_telefono, p_usuario, p_contrasena, v_idrol);
END //

DELIMITER //
CREATE PROCEDURE PROCEDIMIENTO_INSERTAR_PACIENTE(
    IN p_tipo_documento ENUM('CC','TI','PET','PPT','Pasaporte'),
    IN p_dni_cliente VARCHAR(10),
    IN p_nombre VARCHAR(25),
    IN p_direccion VARCHAR(30),
    IN p_telefono VARCHAR(15),
    IN p_usuario VARCHAR(40),
    IN p_contrasena VARCHAR(255)
)
BEGIN
    INSERT INTO PACIENTE (tipo_documento, dni_cliente, nombre, direccion, telefono, usuario, contrasena)
    VALUES (p_tipo_documento, p_dni_cliente, p_nombre, p_direccion, p_telefono, p_usuario, p_contrasena);
END //

DELIMITER //
CREATE PROCEDURE PROCEDIMIENTO_INSERTAR_FACTURA(
    IN p_tipo_metodo_pago VARCHAR(30),
    IN p_total_factura INT,
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

    INSERT INTO FACTURA_VENTA (tipo_metodo_pago, total_factura, id_empleado, id_paciente)
    VALUES (p_tipo_metodo_pago, p_total_factura, v_idempleado, v_idpaciente);
END //


DELIMITER //
CREATE PROCEDURE PROCEDIMIENTO_INSERTAR_CITA(
    IN p_hora_cita DATETIME,
    IN p_lugar_cita VARCHAR(100),
    IN p_valor_cita FLOAT,
    IN p_dni_cliente VARCHAR(10)
)
BEGIN
    DECLARE v_idpaciente INT;
    DECLARE v_codigo VARCHAR(50);

    SELECT id_paciente INTO v_idpaciente
    FROM PACIENTE
    WHERE dni_cliente = p_dni_cliente
    LIMIT 1;

    IF v_idpaciente IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Paciente no encontrado';
    END IF;

    SET v_codigo = CONCAT('CITA-', UUID());

    INSERT INTO CITA (codigo_cita, hora_cita, lugar_cita, valor_cita, id_paciente)
    VALUES (v_codigo, p_hora_cita, p_lugar_cita, p_valor_cita, v_idpaciente);
    SELECT v_codigo AS codigo_cita;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE PROCEDIMIENTO_INSERTAR_HISTORIAL_CLINICO(
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

    INSERT INTO HISTORIAL_CLINICO (sintomas, diagnostico, tratamiento, id_empleado, id_paciente)
    VALUES (p_sintomas, p_diagnostico, p_tratamiento, v_idempleado, v_idpaciente);
END //

