CREATE VIEW v_appointments_extended
AS
	SELECT appointment_reason, appointment_date, description, brand, model, production_year, fuel, engine, vin, first_name, family_name, phone, email
	FROM appointments
	INNER JOIN vehicles ON vehicles.vehicle_id = appointments.vehicle_id
	INNER JOIN customers ON customers.customer_id = vehicles.customer_id
GO