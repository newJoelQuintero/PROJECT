USE db_neuroEsencia;

DELIMITER //
CREATE PROCEDURE INSERTAR_EMPLEADO(
IN tipodocumento ENUM('CC', 'TI', 'PET', 'PPT','Pasaporte'),
IN dniempleado VARCHAR(10),
IN nombre VARCHAR(30),
IN direccion VARCHAR(50),
IN telefono BIGINT,
IN usuario VARCHAR(40),
IN contraseña VARCHAR(10)
)
BEGIN
	INSERT INTO EMPLEADO(tipo_documento, dni_empleado, nombre, direccion, telefono, usuario, contraseña)
    VALUES(id_empleado, tipodocumento, dniempleado, nom, dir, tel, usu, contra);
END //
SELECT * FROM CLIENTE



DELIMITER //
CREATE PROCEDURE INSERTAR_CLIENTE(
IN tipodocumento ENUM('CC', 'TI', 'PET', 'PPT','Pasaporte'),
IN dnicliente VARCHAR(10),
IN nombre VARCHAR(25),
IN direccion VARCHAR(30),
IN telefono BIGINT,
IN usuario VARCHAR(40),
IN contraseña VARCHAR(10),
IN idempleado INT
)
BEGIN
	INSERT INTO CLIENTE(tipo_documento, dni_cliente, nombre, direccion, telefono, usuario, contraseña, id_empleado)
    VALUES(tipodocumento, dnicliente, nomb, direc, tele, usua, contra,  idempleado);
END //



DELIMITER //
CREATE PROCEDURE INSERTAR_CITA(
IN horacita DATETIME,
IN valorcita FLOAT,
IN idempleado INT,
IN idmetodopago INT

)
BEGIN
	INSERT INTO CITA(hora_cita, valor_cita, id_empleado, id_metodo_pago)
    VALUES(horacita, valorcita, idempleado, idmetodopago);
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
