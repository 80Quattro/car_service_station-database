CREATE PROCEDURE p_parts_services
@appointment_id INT = NULL
AS
BEGIN
	IF @appointment_id IS NULL
	BEGIN
		SELECT * FROM exchanged_parts
		UNION
		SELECT * FROM executed_services
		RETURN
	END
	IF (SELECT appointment_id FROM appointments WHERE appointment_id = @appointment_id) IS NULL
	BEGIN
		RAISERROR('there is no appointment with such id', 16, 1);
		RETURN
	END
	SELECT * FROM exchanged_parts WHERE appointment_id = @appointment_id
	UNION
	SELECT * FROM executed_services WHERE appointment_id = @appointment_id
END
GO