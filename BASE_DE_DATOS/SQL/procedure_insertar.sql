USE db_neuroEsencia;

DELIMITER //


CREATE PROCEDURE PROCEDIMIENTO_INSERTAR_EMPLEADO(
    IN p_tipo_documento ENUM('CC','TI','PET','PPT','Pasaporte'),
    IN p_dni_empleado VARCHAR(10),
    IN p_nombre VARCHAR(30),
    IN p_direccion VARCHAR(50),
    IN p_telefono VARCHAR(15),
    IN p_usuario VARCHAR(40),
    IN p_contrasena VARCHAR(255)
)
BEGIN
    INSERT INTO EMPLEADO (tipo_documento, dni_empleado, nombre, direccion, telefono, usuario, contrasena)
    VALUES (p_tipo_documento, p_dni_empleado, p_nombre, p_direccion, p_telefono, p_usuario, p_contrasena);
END //


CREATE PROCEDURE PROCEDIMIENTO_INSERTAR_CLIENTE(
    IN p_tipo_documento ENUM('CC','TI','PET','PPT','Pasaporte'),
    IN p_dni_cliente VARCHAR(10),
    IN p_nombre VARCHAR(25),
    IN p_direccion VARCHAR(30),
    IN p_telefono VARCHAR(15),
    IN p_usuario VARCHAR(40),
    IN p_contrasena VARCHAR(255)
)
BEGIN
    INSERT INTO CLIENTE (tipo_documento, dni_cliente, nombre, direccion, telefono, usuario, contrasena)
    VALUES (p_tipo_documento, p_dni_cliente, p_nombre, p_direccion, p_telefono, p_usuario, p_contrasena);
END //


CREATE PROCEDURE PROCEDIMIENTO_INSERTAR_METODO_PAGO(
    IN p_tipo_metodo VARCHAR(30)
)
BEGIN
    INSERT INTO METODO_PAGO (tipo_metodo)
    VALUES (p_tipo_metodo);
END //


CREATE PROCEDURE PROCEDIMIENTO_INSERTAR_CITA(
    IN p_hora_cita DATETIME,
    IN p_valor_cita FLOAT,
    IN p_id_empleado INT,
    IN p_id_cliente INT,
    IN p_id_metodo_pago INT
)
BEGIN
    INSERT INTO CITA (hora_cita, valor_cita, id_empleado, id_cliente, id_metodo_pago)
    VALUES (p_hora_cita, p_valor_cita, p_id_empleado, p_id_cliente, p_id_metodo_pago);
END //


CREATE PROCEDURE PROCEDIMIENTO_INSERTAR_DIAGNOSTICO(
    IN p_nom_diagnostico VARCHAR(30),
    IN p_resumen_diagnostico VARCHAR(100),
    IN p_id_empleado INT
)
BEGIN
    INSERT INTO DIAGNOSTICO (nom_diagnostico, resumen_diagnostico, id_empleado)
    VALUES (p_nom_diagnostico, p_resumen_diagnostico, p_id_empleado);
END //


CREATE PROCEDURE PROCEDIMIENTO_INSERTAR_FACTURA(
    IN p_fecha_emision DATE,
    IN p_subtotal_factura FLOAT,
    IN p_total_factura FLOAT,
    IN p_id_empleado INT,
    IN p_id_cliente INT,
    IN p_id_metodo_pago INT
)
BEGIN
    INSERT INTO FACTURA (fecha_emision, subtotal_factura, total_factura, id_empleado, id_cliente, id_metodo_pago)
    VALUES (p_fecha_emision, p_subtotal_factura, p_total_factura, p_id_empleado, p_id_cliente, p_id_metodo_pago);
END //


CREATE PROCEDURE PROCEDIMIENTO_INSERTAR_TRATAMIENTO(
    IN p_nom_tratamiento VARCHAR(30),
    IN p_tipo_tratamiento ENUM('Psicoterapia individual','Psicoterapia familiar','Psicoterapia de pareja','Psicología infantil'),
    IN p_resumen_tratamiento VARCHAR(100),
    IN p_id_diagnostico BIGINT
)
BEGIN
    INSERT INTO TRATAMIENTO (nom_tratamiento, tipo_tratamiento, resumen_tratamiento, id_diagnostico)
    VALUES (p_nom_tratamiento, p_tipo_tratamiento, p_resumen_tratamiento, p_id_diagnostico);
END //

CREATE PROCEDURE PROCEDIMIENTO_INSERTAR_HISTORIAL_CLINICO(
    IN p_idcliente INT,
    IN p_idcita BIGINT,
    IN p_iddiagnostico BIGINT,
    IN p_idtratamiento BIGINT,
    IN p_observaciones VARCHAR(255)
)
BEGIN
    INSERT INTO HISTORIAL_CLINICO (id_cliente, id_cita, id_diagnostico, id_tratamiento, observaciones)
    VALUES (p_idcliente, p_idcita, p_iddiagnostico, p_idtratamiento, p_observaciones);
END //

DELIMITER ;
