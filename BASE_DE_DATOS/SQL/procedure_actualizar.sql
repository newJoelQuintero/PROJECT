USE db_neuroEsencia

DELIMITER //

CREATE PROCEDURE ACTUALIZAR_EMPLEADO(
    IN idempleado INT,
    IN tipodocumento ENUM('CC','TI','PET','PPT','Pasaporte'),
    IN dniempleado VARCHAR(10),
    IN nomempleado VARCHAR(25),
    IN direcempleado VARCHAR(30),
    IN fenaciempleado DATE,
    IN usuario_empleado VARCHAR(40),
    IN password_empleado VARCHAR(10),
    IN email_empleado VARCHAR(40),
    IN tel_empleado VARCHAR(10),
    IN rhempleado VARCHAR(5)
)
BEGIN
    UPDATE EMPLEADO SET
        tipo_documento = tipodocumento,
        dni_empleado = dniempleado,
        nom_empleado = nomempleado,
        dire_empleado = direcempleado,
        fnaci_empleado = fenaciempleado,
        usuario_empleado = usuarioempleado,
        password_empleado = passwordempleado,
        email_empleado = emailempleado,
        tel_empleado = telempleado,
        rh_empleado = rhempleado
    WHERE id_empleado = idempleado;
END;
//




DELIMITER //
CREATE PROCEDURE ACTUALIZAR_USUARIO_EMPLEADO(
    IN usuarioempleado VARCHAR(40),
    IN passwordusuario VARCHAR(25)
)
BEGIN
    UPDATE USUARIO_EMPLEADO SET
        password_usuario = passwordusuario
    WHERE nom_usuario = usuarioempleado;
END;
//

DELIMITER //
CREATE PROCEDURE actualizar_cliente(
    IN idcliente INT,
    IN tipodocumento ENUM('CC','TI','PET','PPT','Pasaporte'),
    IN dnicliente VARCHAR(10),
    IN nomcliente VARCHAR(25),
    IN direcccliente VARCHAR(30),
    IN fenacicliente DATE,
    IN usuario_cliente VARCHAR(40),
    IN password_cliente VARCHAR(10),
    IN email_cliente VARCHAR(40),
    IN rhcliente VARCHAR(5),
    IN tel_cliente VARCHAR(10),
)
BEGIN
    UPDATE CLIENTE SET
        tipo_documento = tipodocumento,
        dni_cliente = dnicliente,
        nom_cliente = nomcliente,
        direcc_cliente = direcccliente,
        fnaci_cliente = fenacicliente,
        usuario_cliente = usuario_cliente,
        password_cliente = password_cliente,
        email_cliente = email_cliente,
        rh_cliente = rhcliente,
        tel_cliente = tel_cliente
    WHERE id_cliente = idcliente;
END;
//



//


DELIMITER //
CREATE PROCEDURE ACTUALIZAR_CITA(
    IN idcita BIGINT,
    IN fechacita DATE,
    IN horacita TIME,
    IN valorcita FLOAT
)
BEGIN
    UPDATE CITA SET
        fecha_cita = fechacita,
        hora_cita = horacita,
        valor_cita = valorcita
    WHERE id_cita = idcita;
END;
//


DELIMITER //
CREATE PROCEDURE ACTUALIZAR_DIAGNOSTICO(
    IN iddiagnostico BIGINT,
    IN nomdiagnostico VARCHAR(30),
    IN resumendiagnostico VARCHAR(100)
)
BEGIN
    UPDATE DIAGNOSTICO SET
        nom_diagnostico = nombrediagnostico,
        resumen_diagnostico = resumendiagnostico
    WHERE id_diagnostico = iddiagnostico;
END;
//


DELIMITER //
CREATE PROCEDURE ACTUALIZAR_METODO_PAGO(
    IN idmetodo INT,
    IN tipometodopago VARCHAR(30)
)
BEGIN
    UPDATE METODO_PAGO SET
        tipo_metodo = tipometodopago
    WHERE id_metodo_pago = idmetodo;
END;
//


DELIMITER //
CREATE PROCEDURE ACTUALIZAR_FACTURA(
    IN idfactura BIGINT,
    IN fechafactura DATE,
    IN subtotalfactura FLOAT,
    IN totalfactura FLOAT
)
BEGIN
    UPDATE FACTURA SET
        fecha_emision = fechafactura,
        subtotal_factura = subtotalfactura,
        total_factura = totalfactura
    WHERE id_factura = idfactura;
END;
//


DELIMITER //
CREATE PROCEDURE ACTUALIZAR_TRATAMIENTO(
    IN idtratamiento BIGINT,
    IN nomtratamiento VARCHAR(30),
    IN tipotratamiento ENUM('Psicoterapia individual','Psicoterapia familiar','Psicoterapia de pareja','Psicología infantil'),
    IN resumentratamiento VARCHAR(100)
)
BEGIN
    UPDATE TRATAMIENTO SET
        nom_tratamiento = nomtratamiento,
        tipo_tratamiento = tipotratamiento,
        resumen_tratamiento = resumentratamiento
    WHERE id_tratamiento = idtratamiento;
END;
//
