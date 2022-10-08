CREATE PROCEDURE p_add_service
	@appointment_id INT,
	@service_name VARCHAR(100),
	@price DECIMAL(10, 2),
	@quantity INT,
	@description TEXT = NULL
AS
BEGIN
	IF @appointment_id IS NULL OR @service_name IS NULL OR @price IS NULL OR @quantity IS NULL
	BEGIN
		RAISERROR ('parameters cannot be null', 16, 1);
		RETURN
	END
	IF (SELECT appointment_id FROM appointments WHERE appointment_id = @appointment_id) IS NULL
	BEGIN
		RAISERROR('there is no appointment with such id', 16, 1);
		RETURN
	END
	INSERT INTO executed_services(appointment_id, service_name, price, quantity, description)
		VALUES (@appointment_id, @service_name, @price, @quantity, @description);
END
GO