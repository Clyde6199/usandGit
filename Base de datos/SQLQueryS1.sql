CREATE TRIGGER check_loan_status
on Pagos
after insert
as
BEGIN
IF (select SUM (quantity) from Pages where prestamo_id = (select prestamo_id from inserted)) >=
(select cantidad from Prestamos where id = (select prestamo_id from inserted))
BEGIN
update Prestamos set status = 0 where id = (select prestamo_id from insert)
     END
END