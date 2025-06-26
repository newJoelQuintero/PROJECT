CREATE DATABASE db_neuroEsencia;

USE db_neuroEsencia;

CREATE TABLE EMPLEADO(
id_empleado INT PRIMARY KEY AUTO_INCREMENT,
tipo_documento ENUM('CC', 'TI', 'PET', 'PPT','Pasaporte') NOT NULL,
dni_empleado VARCHAR(10) NOT NULL,
nom_empleado VARCHAR(25)NOT NULL,
dire_empleado VARCHAR(30)NOT NULL,
fnaci_empleado DATE NOT NULL,
usuario_empleado VARCHAR(40) NOT NULL,
password_empleado VARCHAR(10) NOT NULL,
email_empleado VARCHAR(40) NULL,
tel_empleado VARCHAR(10) NOT NULL,
rh_empleado VARCHAR(5)NOT NULL,
UNIQUE(dni_empleado),
CHECK(password_empleado >= 8));

CREATE TABLE USUARIO(
nom_usuario VARCHAR(40) PRIMARY KEY NOT NULL,
password_usuario VARCHAR(25) NOT NULL);

CREATE TABLE CLIENTE(
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
tipo_documento ENUM('CC', 'TI', 'PET', 'PPT','Pasaporte') NOT NULL,
dni_cliente VARCHAR(10) NOT NULL,
nom_cliente VARCHAR(25)NOT NULL,
direcc_cliente VARCHAR(30)NOT NULL,
fnaci_cliente DATE NOT NULL,
usuario_cliente VARCHAR(40) NOT NULL,
password_cliente VARCHAR(10) NOT NULL,
email_cliente VARCHAR(40) NULL,
rh_cliente VARCHAR(5) NOT NULL,
tel_cliente VARCHAR(10) NOT NULL,
id_empleado INT NOT NULL,
FOREIGN KEY(id_empleado)REFERENCES EMPLEADO(id_empleado),
UNIQUE(dni_cliente, usuario_cliente),
CHECK(password_cliente >= 8));

CREATE TABLE CITA(
id_cita BIGINT PRIMARY KEY NOT NULL,
fecha_cita DATE NOT NULL,
hora_cita TIME NOT NULL,
valor_cita FLOAT NOT NULL,
id_empleado INT NOT NULL,
FOREIGN KEY(id_empleado)references EMPLEADO(id_empleado));

CREATE TABLE DIAGNOSTICO(
id_diagnostico BIGINT PRIMARY KEY NOT NULL,
nom_diagnostico VARCHAR(30) NOT NULL,
resumen_diagnostico VARCHAR(100)NOT NULL,
id_empleado INT NOT NULL,
FOREIGN KEY(id_empleado)references EMPLEADO(id_empleado));

CREATE TABLE METODO_PAGO(
id_metodo_pago INT PRIMARY KEY AUTO_INCREMENT,
tipo_metodo VARCHAR(30) NOT NULL);

CREATE TABLE FACTURA(
id_factura BIGINT PRIMARY KEY NOT NULL,
fecha_emision DATE NOT NULL,
subtotal_factura FLOAT NOT NULL,
total_factura FLOAT NOT NULL,
id_empleado INT NOT NULL,
FOREIGN KEY(id_empleado) REFERENCES EMPLEADO(id_empleado),
id_metodo_pago INT NOT NULL,
FOREIGN KEY(id_metodo_pago)REFERENCES METODO_PAGO(id_metodo_pago));

CREATE TABLE TRATAMIENTO(
id_tratamiento BIGINT PRIMARY KEY NOT NULL,
nom_tratamiento VARCHAR(30) NOT NULL,
tipo_tratamiento ENUM('Psicoterapia individual','Psicoterapia familiar','Psicoterapia de pareja','Psicología infantil'),
resumen_tratamiento VARCHAR(100)NOT NULL,
id_diagnostico BIGINT NOT NULL,
FOREIGN KEY (id_diagnostico)REFERENCES DIAGNOSTICO(id_diagnostico));
