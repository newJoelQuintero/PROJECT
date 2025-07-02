USE db_neuroEsencia;


INSERT INTO EMPLEADO (tipo_documento, dni_empleado, nombre, direccion, telefono, usuario, contraseña) VALUES 
('CC', '1234567890', 'Laura Martínez', 'Calle 10', 3104567890, 'laura.m', 'clave1234'),
('TI', '2345678901', 'Juan Pérez', 'Carrera 15', 3115678901, 'juan.p', 'pass4567'),
('PPT', '3456789012', 'Sofía Ramírez', 'Av. 68', 3126789012, 'sofia.r', 'micontra1'),
('PET', '4567890123', 'Carlos Herrera', 'Calle 100', 3137890123, 'carlos.h', 'clave8765'),
('Pasaporte', '5678901234', 'Daniela Torres', 'Diagonal 45', 3148901234, 'daniela.t', 'pass3210');

INSERT INTO METODO_PAGO (tipo_metodo) VALUES 
('Efectivo'),
('Transferencia'),
('Tarjeta de crédito'),
('Tarjeta débito'),
('Pago móvil');

INSERT INTO CLIENTE (tipo_documento, dni_cliente, nombre, direccion, telefono, usuario, contraseña, id_empleado) VALUES 
('CC', '7890123456', 'Camila Gómez', 'Calle 50', 3123456789, 'camila.g', 'segura123', 1),
('PPT', '8901234567', 'David López', 'Av. 68', 3134567890, 'david.l', 'clave2024', 2),
('TI', '9012345678', 'Esteban Ruiz', 'Transv. 23', 3145678901, 'esteban.r', 'claveruiz', 3),
('PET', '0123456789', 'Isabela Méndez', 'Calle 60', 3156789012, 'isabela.m', 'contraisa', 4),
('CC', '1098765432', 'Tomás Silva', 'Av. 30', 3167890123, 'tomas.s', 'tomclave1', 5);

INSERT INTO DIAGNOSTICO (id_diagnostico, nom_diagnostico, resumen_diagnostico, id_empleado) VALUES 
(201, 'Ansiedad generalizada', 'Paciente con ansiedad persistente y nerviosismo', 1),
(202, 'Depresión leve', 'Estado anímico bajo, sin ideación suicida', 2),
(203, 'Trastorno de pánico', 'Episodios de miedo intenso y repentino', 3),
(204, 'Estrés laboral', 'Síntomas de agotamiento por trabajo excesivo', 4),
(205, 'Dificultades del sueño', 'Problemas de insomnio recurrente', 5);

INSERT INTO TRATAMIENTO (id_tratamiento, nom_tratamiento, tipo_tratamiento, resumen_tratamiento, id_diagnostico) VALUES 
(301, 'Terapia cognitiva', 'Psicoterapia individual', 'Enfocada en identificar pensamientos negativos', 201),
(302, 'Terapia de activación', 'Psicoterapia individual', 'Incrementar actividades gratificantes', 202),
(303, 'Terapia de exposición', 'Psicoterapia individual', 'Exposición controlada a estímulos de pánico', 203),
(304, 'Apoyo familiar', 'Psicoterapia familiar', 'Trabajo con familia para mejorar dinámicas', 204),
(305, 'Higiene del sueño', 'Psicología infantil', 'Rutinas y hábitos para mejorar el sueño', 205);

INSERT INTO CITA (id_cita, hora_cita, valor_cita, id_empleado, id_metodo_pago) VALUES 
(401, '2025-07-02 10:00:00', 100000, 1, 1),
(402, '2025-07-03 15:30:00', 120000, 2, 2),
(403, '2025-07-04 09:00:00', 95000, 3, 3),
(404, '2025-07-05 13:45:00', 110000, 4, 4),
(405, '2025-07-06 08:30:00', 130000, 5,5);
