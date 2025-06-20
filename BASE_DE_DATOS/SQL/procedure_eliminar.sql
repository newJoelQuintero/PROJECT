USE db_neuroEsencia

delimiter //
create procedure ELIMINAR_EMPLEADO
(in idempleado int)
begin 
delete from EMPLEADO
where id_empleado = idempleado;
end; //
delimiter 

delimiter //
create procedure ELIMINAR_TEL_EMPLEADO
(in idtelempleado int)
begin 
delete from TEL_EMPLEADO
where id_tel_empleado = idtelempleado;
end; //
delimiter 


delimiter //
create procedure ELIMINAR_EMAIL_EMPLEADO
(in idemailempleado int)
begin 
delete from EMAIL_EMPLEADO
where id_email_empleado = idemailempleado;
end; //
delimiter 


delimiter //
create procedure ELIMINAR_USUARIO_EMPLEADO
(in usuarioempleado VARCHAR(40))
begin 
delete from USUARIO_EMPLEADO
where usuario_empleado = usuarioempleado;
end; //
delimiter 


delimiter //
create procedure ELIMINAR_CLIENTE
(in idcliente INT)
begin 
delete from CLIENTE
where id_cliente = idcliente;
end; //
delimiter 


delimiter //
create procedure ELIMINAR_TEL_CLIENTE
(in idtelcliente INT)
begin 
delete from TEL_CLIENTE
where id_tel_cliente = idtelcliente;
end; //
delimiter 


delimiter //
create procedure ELIMINAR_EMAIL_CLIENTE
(in idemailcliente INT)
begin 
delete from EMAIL_CLIENTE
where id_email_cliente = idemailcliente;
end; //
delimiter 


delimiter //
create procedure ELIMINAR_CITA
(in idcita INT)
begin 
delete from CITA
where id_cita = idcita;
end; //
delimiter 


delimiter //
create procedure ELIMINAR_DIAGNOSTICO
(in iddiagnostico INT)
begin 
delete from DIAGNOSTICO
where id_diagnostico = iddiagnostico;
end; //
delimiter


delimiter //
create procedure ELIMINAR_METODO_PAGO
(in idmetodo INT)
begin 
delete from METODO_PAGO
where idmetodo = idmetodo;
end; //
delimiter


delimiter //
create procedure ELIMINAR_FACTURA
(in idfactura INT)
begin 
delete from FACTURA
where id_factura = idfactura;
end; //
delimiter


delimiter //
create procedure ELIMINAR_TRATAMIENTO
(in idtratamiento INT)
begin 
delete from TRATAMIENTO
where id_tratamiento = idtratamiento;
end; //
delimiter
