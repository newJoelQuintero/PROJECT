USE db_neuroEsencia;

DELIMITER //
create procedure CONSULTAR_EMPLEADO()
begin

select* from EMPLEADO ;

end //

CALL CONSULTAR_EMPLEADO()




DELIMITER //
create procedure CONSULTAR_CLIENTE()
begin

select* from CLIENTE ;

end //

CALL CONSULTAR_CLIENTE()


DELIMITER //
create procedure CONSULTAR_CITA()
begin

select* from CITA ;

end //

CALL CONSULTAR_CITA()


DELIMITER //
create procedure CONSULTAR_DIAGNOSTICO()
begin

select* from DIAGNOSTICO ;

end //

CALL CONSULTAR_DIAGNOSTICO()


DELIMITER //
create procedure CONSULTAR_METODO_PAGO()
begin

select* from METODO_PAGO ;

end //

CALL CONSULTAR_METODO_PAGO()

DELIMITER //
create procedure CONSULTAR_FACTURA()
begin

select* from FACTURA ;

end //

CALL CONSULTAR_FACTURA()

DELIMITER //
create procedure CONSULTAR_TRATAMIENTO()
begin

select* from TRATAMIENTO ;

end //

CALL CONSULTAR_TRATAMIENTO()
