CREATE DATABASE db_neuroEsencia;

USE db_neuroEsencia;

CREATE TABLE EMPLEADO(
  id_empleado INT PRIMARY KEY AUTO_INCREMENT,
  tipo_documento ENUM('CC', 'TI', 'PET', 'PPT','Pasaporte') NOT NULL,
  dni_empleado VARCHAR(10) NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  direccion VARCHAR(50) NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  usuario VARCHAR(40) NOT NULL,
  contrasena VARCHAR(255) NOT NULL,
  UNIQUE(dni_empleado),
  UNIQUE(usuario)
);

CREATE TABLE CLIENTE(
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
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

CREATE TABLE METODO_PAGO(
  id_metodo_pago INT PRIMARY KEY AUTO_INCREMENT,
  tipo_metodo VARCHAR(30) NOT NULL
);

CREATE TABLE CITA(
  id_cita BIGINT PRIMARY KEY AUTO_INCREMENT,
  hora_cita DATETIME NOT NULL,
  valor_cita FLOAT NOT NULL,
  id_empleado INT NOT NULL,
  id_cliente INT NOT NULL,
  id_metodo_pago INT NOT NULL,
  FOREIGN KEY(id_empleado) REFERENCES EMPLEADO(id_empleado),
  FOREIGN KEY(id_cliente) REFERENCES CLIENTE(id_cliente),
  FOREIGN KEY(id_metodo_pago) REFERENCES METODO_PAGO(id_metodo_pago)
);

CREATE TABLE DIAGNOSTICO(
  id_diagnostico BIGINT PRIMARY KEY AUTO_INCREMENT,
  nom_diagnostico VARCHAR(30) NOT NULL,
  resumen_diagnostico VARCHAR(100) DEFAULT '',
  id_empleado INT NOT NULL,
  FOREIGN KEY(id_empleado) REFERENCES EMPLEADO(id_empleado)
);

CREATE TABLE FACTURA(
  id_factura BIGINT PRIMARY KEY AUTO_INCREMENT,
  fecha_emision DATE NOT NULL,
  subtotal_factura FLOAT NOT NULL,
  total_factura FLOAT NOT NULL,
  id_empleado INT NOT NULL,
  id_cliente INT NOT NULL,
  id_metodo_pago INT NOT NULL,
  FOREIGN KEY(id_empleado) REFERENCES EMPLEADO(id_empleado),
  FOREIGN KEY(id_cliente) REFERENCES CLIENTE(id_cliente),
  FOREIGN KEY(id_metodo_pago) REFERENCES METODO_PAGO(id_metodo_pago)
);

CREATE TABLE TRATAMIENTO(
  id_tratamiento BIGINT PRIMARY KEY AUTO_INCREMENT,
  nom_tratamiento VARCHAR(30) NOT NULL,
  tipo_tratamiento ENUM('Psicoterapia individual','Psicoterapia familiar','Psicoterapia de pareja','Psicología infantil'),
  resumen_tratamiento VARCHAR(100) DEFAULT '',
  id_diagnostico BIGINT NOT NULL,
  FOREIGN KEY (id_diagnostico) REFERENCES DIAGNOSTICO(id_diagnostico)
);

CREATE TABLE HISTORIAL_CLINICO (
    id_historial BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_cita BIGINT NOT NULL,
    id_diagnostico BIGINT NOT NULL,
    id_tratamiento BIGINT NOT NULL,
    observaciones VARCHAR(255),
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY (id_cita) REFERENCES CITA(id_cita) ON DELETE CASCADE,
    FOREIGN KEY (id_diagnostico) REFERENCES DIAGNOSTICO(id_diagnostico) ON DELETE CASCADE,
    FOREIGN KEY (id_tratamiento) REFERENCES TRATAMIENTO(id_tratamiento) ON DELETE CASCADE
);
