CREATE PROCEDURE p_add_admission
	@appointment_id INT,
	@employee_id INT,
	@mileage INT,
	@fuel_amount VARCHAR(50)
AS
BEGIN
	IF @appointment_id IS NULL OR @employee_id IS NULL OR @mileage IS NULL OR @fuel_amount IS NULL
	BEGIN
		RAISERROR ('argument cannot be null', 16, 1);
		RETURN
	END
	IF (SELECT appointment_id FROM appointments WHERE appointment_id = @appointment_id) IS NULL
	BEGIN
		RAISERROR('there is no appointment with such id', 16, 1);
		RETURN
	END
	IF (SELECT employee_id FROM employees WHERE employee_id = @employee_id) IS NULL
	BEGIN
		RAISERROR('there is no employee with such id', 16, 1);
		RETURN
	END
	UPDATE appointments
	SET employee_id = @employee_id, mileage_admission = @mileage, fuel_amount_admission = @fuel_amount, admission_date = GETDATE()
	WHERE appointment_id = @appointment_id
END
GO