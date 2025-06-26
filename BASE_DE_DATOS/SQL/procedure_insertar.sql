USE db_neuroEsencia;

DELIMITER //
CREATE PROCEDURE INSERTAR_EMPLEADO(
IN tipodocumento ENUM('CC', 'TI', 'PET', 'PPT','Pasaporte'),
IN dniempleado VARCHAR(10),
IN nomempleado VARCHAR(25),
IN direempleado VARCHAR(30),
IN fnaciempleado DATE,
IN usuario_empleado VARCHAR(40),
IN password_empleado VARCHAR(10),
IN email_empleado VARCHAR(40),
IN tel_empleado VARCHAR(10),
IN rhempleado VARCHAR(5)
)
BEGIN
	INSERT INTO EMPLEADO(tipo_documento, dni_empleado, nom_empleado, direc_empleado, fnaci_empleado, usuario_empleado, password_empleado, email_empleado, tel_empleado, rh_empleado)
    VALUES(tipodocumento, dniempleado, nomempleado, direempleado, fnaciempleado, usuarioempleado, passwordempleado, emailempleado, telempleado, rhempleado);
END //




DELIMITER //
CREATE PROCEDURE INSERTAR_USUARIO_EMPLEADO(
IN nomusuario VARCHAR(40),
IN passwordusuario VARCHAR(25),
IN idempleado INT
)
BEGIN
	INSERT INTO USUARIO_EMPLEADO(nom_usuario,password_usuario, id_empleado)
    VALUES(nomusuario, passwordusuario, idempleado);
END //

DELIMITER //
CREATE PROCEDURE INSERTAR_CLIENTE(
IN tipodocumento ENUM('CC', 'TI', 'PET', 'PPT','Pasaporte'),
IN dnicliente VARCHAR(10),
IN nomcliente VARCHAR(25),
IN direcccliente VARCHAR(30),
IN fnacicliente DATE,
IN rhcliente VARCHAR(5),
IN idempleado INT
)
BEGIN
	INSERT INTO CLIENTE(tipo_documento, dni_cliente, nom_cliente, direcc_cliente, fnaci_cliente, rh_cliente, id_empleado)
    VALUES(tipodocumento, dnicliente, nomcliente, direcccliente, fnacicliente, rhcliente, idempleado);
END //

DELIMITER //
CREATE PROCEDURE INSERTAR_TEL_CLIENTE(
IN telcliente BIGINT,
IN idcliente INT
)
BEGIN
	INSERT INTO TEL_CLIENTE(tel_cliente, id_cliente)
    VALUES(telcliente, idcliente);
END //

DELIMITER //
CREATE PROCEDURE INSERTAR_EMAIL_CLIENTE(
IN emailcliente VARCHAR(40),
IN idcliente INT
)
BEGIN
	INSERT INTO EMAIL_CLIENTE(email_cliente, id_cliente)
    VALUES(emailcliente, idcliente);
END //

DELIMITER //
CREATE PROCEDURE INSERTAR_CITA(
IN fechacita DATE,
IN horacita TIME,
IN valorcita FLOAT,
IN idempleado INT
)
BEGIN
	INSERT INTO CITA(fecha_cita, hora_cita, valor_cita, id_empleado)
    VALUES(fechacita, horacita, valorcita, idempleado);
END //

DELIMITER //
CREATE PROCEDURE INSERTAR_DIAGNOSTICO(
IN iddiagnostico BIGINT,
IN nomdiagnostico VARCHAR(30),
IN resumendiagnostico VARCHAR(100),
IN idempleado INT
)
BEGIN
	INSERT INTO DIAGNOSTICO(id_diagnostico, nom_diagnostico, resumen_diagnostico, id_empleado)
    VALUES(iddiagnostico, nomdiagnostico, resumendiagnostico, idempleado);
END //

DELIMITER //
CREATE PROCEDURE INSERTAR_METODO_PAGO(
IN tipometodo VARCHAR(30),
IN idempleado INT
)
BEGIN
	INSERT INTO METODO_PAGO(tipo_metodo, id_empleado)
    VALUES(tipometodo, idempleado);
END //

DELIMITER //
CREATE PROCEDURE INSERTAR_FACTURA(
IN fechaemision DATE,
IN subtotalfactura FLOAT,
IN totalfactura FLOAT,
IN idempleado INT,
IN idmetodopago INT
)
BEGIN
	INSERT INTO FACTURA(fechaemision, subtotalfactura, totalfactura, idempleado, idmetodopago)
    VALUES(fechaemision, subtotalfactura, totalfactura, idempleado, idmetodopago);
END //

DELIMITER //
CREATE PROCEDURE INSERTAR_TRATAMIENTO(
IN idtratamiento BIGINT,
IN nomtratamiento VARCHAR(30),
IN tipotratamiento ENUM('Psicoterapia individual','Psicoterapia familiar','Psicoterapia de pareja','Psicología infantil'),
IN resumentratamiento VARCHAR(100),
IN iddiagnostico BIGINT
)
BEGIN
	INSERT INTO TRATAMIENTO(id_tratamiento, nom_tratamiento, tipo_tratamiento, resumen_tratamiento, id_diagnostico)
    VALUES(idtratamiento, nomtratamiento, tipotratamiento, resumentratamiento, iddiagnostico);
END //
