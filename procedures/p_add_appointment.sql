CREATE PROCEDURE p_add_appointment
	@vehicle_id INT,
	@appointment_date DATE,
	@appointment_reason TEXT
AS
BEGIN
	IF @vehicle_id IS NULL OR @appointment_date IS NULL OR @appointment_reason IS NULL
	BEGIN
		RAISERROR ('parameters cannnot be null', 16, 1);
		RETURN
	END
	IF (SELECT vehicle_id FROM vehicles WHERE vehicle_id = @vehicle_id) IS NULL
	BEGIN
		RAISERROR('there is no vehicle with such id', 16, 1);
		RETURN
	END
	INSERT INTO appointments (vehicle_id, appointment_reason, appointment_date)
		VALUES (@vehicle_id, @appointment_reason, @appointment_date);
END
GO