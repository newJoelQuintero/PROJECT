USE db_neuroEsencia;

SELECT C.id_cita, C.hora_cita, C.valor_cita, E.nombre AS empleado, M.tipo_metodo
FROM CITA C
JOIN EMPLEADO E ON C.id_empleado = E.id_empleado
JOIN METODO_PAGO M ON C.id_metodo_pago = M.id_metodo_pago;



SELECT C.id_cita, C.hora_cita AS horario, M.tipo_metodo
FROM CITA C
JOIN METODO_PAGO M ON C.id_metodo_pago = M.id_metodo_pago
WHERE DATE(C.hora_cita) = '2025-07-03'
ORDER BY C.hora_cita;


SELECT T.nom_tratamiento, T.resumen_tratamiento, D.nom_diagnostico
FROM TRATAMIENTO T
JOIN DIAGNOSTICO D ON T.id_diagnostico = D.id_diagnostico
ORDER BY D.nom_diagnostico;

SELECT nombre, dni_cliente, telefono, direccion
FROM CLIENTE
ORDER BY nombre;

SELECT nombre, dni_cliente, telefono
FROM CLIENTE
WHERE nombre LIKE '%camila%';



