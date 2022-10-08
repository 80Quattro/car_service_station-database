CREATE PROCEDURE p_add_hand_over
	@appointment_id INT,
	@mileage INT,
	@fuel_amount VARCHAR(50),
	@description TEXT = NULL
AS
BEGIN
	IF @appointment_id IS NULL OR @mileage IS NULL OR @fuel_amount IS NULL
	BEGIN
		RAISERROR ('appointment_id, mileage and fuel_amount cannot be null', 16, 1);
		RETURN
	END
	IF (SELECT appointment_id FROM appointments WHERE appointment_id = @appointment_id) IS NULL
	BEGIN
		RAISERROR('there is no appointment with such id', 16, 1);
		RETURN
	END
	IF (SELECT admission_date FROM appointments WHERE appointment_id = @appointment_id) IS NULL
	BEGIN
		RAISERROR('you should add admission first', 16, 1);
		RETURN;
	END
	UPDATE appointments
	SET mileage_admission = @mileage, fuel_amount_admission = @fuel_amount, hand_over_date = GETDATE(), description = @description
	WHERE appointment_id = @appointment_id
END
GO