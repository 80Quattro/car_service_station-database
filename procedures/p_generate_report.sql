CREATE PROCEDURE p_generate_report
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
		RAISERROR('no added executed services - cannot generate the report', 16, 1);
		RETURN
	END
	IF (SELECT hand_over_date FROM appointments WHERE appointment_id = @appointment_id) IS NULL
	BEGIN
		RAISERROR('cannot generate the report - appointment is not ended yet (the hand over has to be added)', 16, 1);
		RETURN;
	END
	SELECT brand, model, appointment_reason, admission_date, mileage_admission, fuel_amount_admission, hand_over_date, mileage_hand_over, fuel_amount_hand_over
	FROM appointments
	INNER JOIN vehicles ON appointments.vehicle_id = vehicles.vehicle_id
	WHERE appointment_id = @appointment_id

	exec p_generate_bill @appointment_id

END
GO