CREATE DATABASE db_neuroEsencia;

USE db_neuroEsencia;

CREATE TABLE ROL(
id_rol INT PRIMARY KEY AUTO_INCREMENT,
nombre_rol VARCHAR(50) NOT NULL,
estado_rol VARCHAR(50));


CREATE TABLE EMPLEADO(
  id_empleado INT PRIMARY KEY AUTO_INCREMENT,
  tipo_documento ENUM('CC', 'TI', 'PET', 'PPT','Pasaporte') NOT NULL,
  dni_empleado VARCHAR(10) NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  direccion VARCHAR(50) NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  usuario VARCHAR(40) NOT NULL,
  contrasena VARCHAR(255) NOT NULL,
  id_rol int not null,
  foreign key(id_rol) references ROL(id_rol),
  UNIQUE(dni_empleado),
  UNIQUE(usuario)
);

CREATE TABLE PACIENTE(
  id_paciente INT PRIMARY KEY AUTO_INCREMENT,
  tipo_documento ENUM('CC', 'TI', 'PET', 'PPT','Pasaporte') NOT NULL,
  dni_cliente VARCHAR(10) NOT NULL,
  nombre VARCHAR(25) NOT NULL,
  direccion VARCHAR(30) NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  usuario VARCHAR(40) NOT NULL,
  contrasena VARCHAR(255) NOT NULL,
  UNIQUE(dni_cliente),
  UNIQUE(usuario)
);

CREATE TABLE FACTURA_VENTA(
  id_factura INT PRIMARY KEY AUTO_INCREMENT,
  tipo_metodo_pago VARCHAR(30) NOT NULL,
  total_factura INT NOT NULL,
  id_empleado INT NOT NULL,
  FOREIGN KEY(id_empleado) REFERENCES EMPLEADO(id_empleado),
  id_paciente INT NOT NULL,
  FOREIGN KEY(id_paciente) REFERENCES PACIENTE(id_paciente)
);

CREATE TABLE CITA(
  id_cita BIGINT PRIMARY KEY AUTO_INCREMENT,
  codigo_cita VARCHAR(50) UNIQUE NOT NULL,
  hora_cita DATETIME NOT NULL,
  lugar_cita VARCHAR(100) NOT NULL,
  valor_cita FLOAT NOT NULL,
  id_paciente INT NOT NULL,
  FOREIGN KEY(id_paciente) REFERENCES PACIENTE(id_paciente)
);


CREATE TABLE HISTORIAL_CLINICO(
  id_historial_clinico BIGINT PRIMARY KEY AUTO_INCREMENT,
  sintomas VARCHAR(50) NOT NULL,
  diagnostico VARCHAR(200) NOT NULL,
  tratamiento VARCHAR(100) NOT NULL,
  id_empleado INT NOT NULL,
  FOREIGN KEY(id_empleado) REFERENCES EMPLEADO(id_empleado),
  id_paciente INT NOT NULL,
  FOREIGN KEY(id_paciente) REFERENCES PACIENTE(id_paciente)
);



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
    IN p_dni_cliente VARCHAR(10)
)
BEGIN
    DECLARE v_idpaciente INT;

    SELECT id_paciente INTO v_idpaciente
    FROM PACIENTE
    WHERE dni_cliente = p_dni_cliente
    LIMIT 1;

    IF v_idpaciente IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Paciente no encontrado';
    END IF;

    UPDATE CITA
    SET hora_cita = p_hora_cita,
        lugar_cita = p_lugar_cita,
        valor_cita = p_valor_cita,
        id_paciente = v_idpaciente
    WHERE id_cita = p_idcita;
END //
DELIMITER ;


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



