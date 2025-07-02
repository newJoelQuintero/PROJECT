USE db_neuroEsencia

DELIMITER //

CREATE PROCEDURE ACTUALIZAR_EMPLEADO(
    IN idempleado INT,
    IN tipodocumento ENUM('CC', 'TI', 'PET', 'PPT','Pasaporte'),
    IN dniempleado VARCHAR(10),
    IN nombre VARCHAR(30),
    IN direccion VARCHAR(50),
    IN telefono BIGINT,
    IN usuario VARCHAR(40),
    IN contraseña VARCHAR(10)
)
BEGIN
    UPDATE EMPLEADO SET
        tipo_documento = tipodocumento,
        dni_empleado = dniempleado,
        nombre = nomempleado,
        direccion = direcempleado,
	    telefono = telempleado,
        usuario = usuarioempleado,
        contraseña = contraempleado
    WHERE id_empleado = idempleado;
END;
//




DELIMITER //
CREATE PROCEDURE actualizar_cliente(
    IN idcliente INT,
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
    UPDATE CLIENTE SET
        tipo_documento = tipodocumento,
        dni_cliente = dnicliente,
        nombre = nomcliente,
        direccion = direcccliente,
	    telefono = tel_cliente,
        usuario = usuario_cliente,
        contraseña = contra_cliente
        
    WHERE id_cliente = idcliente;
END;
//



//


DELIMITER //
CREATE PROCEDURE ACTUALIZAR_CITA(
    IN idcita BIGINT,
    IN horacita DATETIME,
    IN valorcita FLOAT,
    IN idmetodopago INT

)
BEGIN
    UPDATE CITA SET
        hora_cita = horacita,
        valor_cita = valorcita,
        id_metodo_pago = idmetodopago
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
