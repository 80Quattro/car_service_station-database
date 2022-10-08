CREATE VIEW v_v_appointments_extended_current
AS
	SELECT appointment_reason, appointment_date, description, brand, model, production_year, fuel, engine, vin, first_name, family_name, phone, email
	FROM appointments
	INNER JOIN vehicles ON vehicles.vehicle_id = appointments.vehicle_id
	INNER JOIN customers ON customers.customer_id = vehicles.customer_id
	WHERE (appointment_date > GETDATE() AND appointment_date < GETDATE() + 5) OR (admission_date IS NOT NULL AND hand_over_date IS NULL)
GO