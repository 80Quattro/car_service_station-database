CREATE PROCEDURE p_generate_bill
@appointment_id INT
AS
BEGIN
	IF @appointment_id IS NULL
	BEGIN
		RAISERROR('appointment_id cannot be null', 16, 1);
		RETURN
	END
	IF (SELECT appointment_id FROM appointments WHERE appointment_id = @appointment_id) IS NULL
	BEGIN
		RAISERROR('there is no appointment with such id', 16, 1);
		RETURN
	END
	IF (SELECT COUNT(appointment_id) FROM executed_services WHERE appointment_id = @appointment_id) = 0
	BEGIN
		RAISERROR('no added executed services - cannot generate the bill', 16, 1);
		RETURN
	END
	SELECT part_name, price, quantity, price * quantity AS 'sum'
	FROM v_parts_services
	WHERE appointment_id = @appointment_id
	UNION ALL
	SELECT 'Sum: ', NULL, NULL, (
		SELECT SUM(price * quantity)
		FROM v_parts_services
		WHERE appointment_id = @appointment_id
	)

END
GO