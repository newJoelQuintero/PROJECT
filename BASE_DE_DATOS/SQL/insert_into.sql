USE db_neuroEsencia;

INSERT INTO EMPLEADO (tipo_documento, dni_empleado, nom_empleado, dire_empleado, fnaci_empleado, usuario_empleado, password_empleado, email_empleado, tel_empleado, rh_empleado) VALUES
('CC', '1234567890', 'Juan Pérez', 'Calle 123', '1985-05-10','usu1','juan3456','juanperez@email.com',3101234567,'O+'),
('TI', '2345678901', 'Ana Gómez', 'Carrera 45', '1990-07-22', 'usu2','Goan2900', 'anagomez@email.com', 3112345678, 'A-'),
('PET', '3456789012', 'Luis Martínez', 'Av. Siempreviva', '1982-12-01', 'usu3','Marti1092', 'luismartinez@email.com', 3123456789, 'B+'),
('PPT', '4567890123', 'María López', 'Calle Luna', '1979-03-17', 'usu4','Goan2900', 'marialopez@email.com', 3134567890,'AB-'),
('Pasaporte', '5678901234', 'Carlos Torres', 'Calle Sol', '1995-09-30', 'usu5','Goan2900', 'carlostorres@email.com', 3145678901,'O-');



INSERT INTO USUARIO (nom_usuario, password_usuario) VALUES
('jperez', 'pass123'),
('agomez', 'pass234'),
('lmartinez', 'pass345'),
('mlopez', 'pass456'),
('ctorres', 'pass567');

INSERT INTO CLIENTE (tipo_documento, dni_cliente, nom_cliente, direcc_cliente, fnaci_cliente, usuario_cliente, password_cliente, email_cliente, rh_cliente, tel_cliente, id_empleado) VALUES
('CC', '7890123456', 'Laura Ríos', 'Calle 10', '1992-02-14', 'laurios55','rios7860', 'laura.rios@email.com', 'A+', 3201234567, 1),
('TI', '8901234567', 'Pedro Ramírez', 'Carrera 7', '1998-06-21',, 'laurios55','rios7860', 'laura.rios@email.com', 'B-', 3212345678, 2),
('PET', '9012345678', 'Elena Castro', 'Av. 68', '1987-11-05', 'laurios55','rios7860', 'laura.rios@email.com', 'O+', 3223456789, 3),
('PPT', '0123456789', 'Daniela Méndez', 'Calle 80', '1993-04-30', 'laurios55','rios7860', 'laura.rios@email.com', 'AB+', 3234567890, 4),
('Pasaporte', '1098765432', 'Andrés Herrera', 'Carrera 100', '1989-01-19', 'laurios55','rios7860', 'laura.rios@email.com', 'O-', 3245678901, 5);


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
