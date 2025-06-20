USE db_neuroEsencia;

INSERT INTO EMPLEADO (tipo_documento, dni_empleado, nom_empleado, dire_empleado, fnaci_empleado, rh_empleado) VALUES
('CC', '1234567890', 'Juan Pérez', 'Calle 123', '1985-05-10', 'O+'),
('TI', '2345678901', 'Ana Gómez', 'Carrera 45', '1990-07-22', 'A-'),
('PET', '3456789012', 'Luis Martínez', 'Av. Siempreviva', '1982-12-01', 'B+'),
('PPT', '4567890123', 'María López', 'Calle Luna', '1979-03-17', 'AB-'),
('Pasaporte', '5678901234', 'Carlos Torres', 'Calle Sol', '1995-09-30', 'O-');

INSERT INTO TEL_EMPLEADO (tel_empleado, id_empleado) VALUES
(3101234567, 1),
(3112345678, 2),
(3123456789, 3),
(3134567890, 4),
(3145678901, 5);

INSERT INTO EMAIL_EMPLEADO (email_empleado, id_empleado) VALUES
('juanperez@email.com', 1),
('anagomez@email.com', 2),
('luismartinez@email.com', 3),
('marialopez@email.com', 4),
('carlostorres@email.com', 5);

INSERT INTO USUARIO_EMPLEADO (nom_usuario, password_usuario, id_empleado) VALUES
('jperez', 'pass123', 1),
('agomez', 'pass234', 2),
('lmartinez', 'pass345', 3),
('mlopez', 'pass456', 4),
('ctorres', 'pass567', 5);

INSERT INTO CLIENTE (tipo_documento, dni_cliente, nom_cliente, direcc_cliente, fnaci_cliente, rh_cliente, id_empleado) VALUES
('CC', '7890123456', 'Laura Ríos', 'Calle 10', '1992-02-14', 'A+', 1),
('TI', '8901234567', 'Pedro Ramírez', 'Carrera 7', '1998-06-21', 'B-', 2),
('PET', '9012345678', 'Elena Castro', 'Av. 68', '1987-11-05', 'O+', 3),
('PPT', '0123456789', 'Daniela Méndez', 'Calle 80', '1993-04-30', 'AB+', 4),
('Pasaporte', '1098765432', 'Andrés Herrera', 'Carrera 100', '1989-01-19', 'O-', 5);

INSERT INTO TEL_CLIENTE (tel_cliente, id_cliente) VALUES
(3201234567, 1),
(3212345678, 2),
(3223456789, 3),
(3234567890, 4),
(3245678901, 5);

INSERT INTO EMAIL_CLIENTE (email_cliente, id_cliente) VALUES
('laura.rios@email.com', 1),
('pedro.ramirez@email.com', 2),
('elena.castro@email.com', 3),
('daniela.mendez@email.com', 4),
('andres.herrera@email.com', 5);

INSERT INTO CITA (id_cita, fecha_cita, hora_cita, valor_cita, id_empleado) VALUES
(101, '2025-06-01', '09:00:00', 150000, 1),
(102, '2025-06-02', '10:00:00', 150000, 2),
(103, '2025-06-03', '11:00:00', 150000, 3),
(104, '2025-06-04', '14:00:00', 150000, 4),
(105, '2025-06-05', '15:00:00', 150000, 5);

INSERT INTO DIAGNOSTICO (id_diagnostico, nom_diagnostico, resumen_diagnostico, id_empleado) VALUES
(201, 'Ansiedad', 'Síntomas de ansiedad generalizada.', 1),
(202, 'Depresión', 'Síntomas depresivos moderados.', 2),
(203, 'TDAH', 'Déficit de atención con hiperactividad.', 3),
(204, 'Estrés laboral', 'Estrés relacionado con el entorno laboral.', 4),
(205, 'Fobia social', 'Miedo intenso a situaciones sociales.', 5);

INSERT INTO METODO_PAGO (tipo_metodo) VALUES
('Efectivo'),
('Tarjeta de crédito'),
('Transferencia'),
('Tarjeta débito'),
('Nequi');

INSERT INTO FACTURA (id_factura, fecha_emision, subtotal_factura, total_factura, id_empleado, id_metodo_pago) VALUES
(301, '2025-06-01', 150000, 150000, 1, 1),
(302, '2025-06-02', 150000, 150000, 2, 2),
(303, '2025-06-03', 150000, 150000, 3, 3),
(304, '2025-06-04', 150000, 150000, 4, 4),
(305, '2025-06-05', 150000, 150000, 5, 5);

INSERT INTO TRATAMIENTO (id_tratamiento, nom_tratamiento, tipo_tratamiento, resumen_tratamiento, id_diagnostico) VALUES
(401, 'Terapia cognitivo-conductual', 'Psicoterapia individual', 'Enfocada en modificar pensamientos negativos.', 201),
(402, 'Terapia familiar sistémica', 'Psicoterapia familiar', 'Aborda conflictos dentro de la familia.', 202),
(403, 'Terapia de pareja centrada en emociones', 'Psicoterapia de pareja', 'Mejora la comunicación afectiva.', 203),
(404, 'Intervención conductual infantil', 'Psicología infantil', 'Dirigida a modificar conductas problemáticas.', 204),
(405, 'Terapia de exposición', 'Psicoterapia individual', 'Enfrentar gradualmente situaciones temidas.', 205);
