CREATE VIEW v_customers_vehicles
AS
	SELECT first_name, family_name, phone, email, brand, model, production_year, fuel, engine, vin
	FROM vehicles
	INNER JOIN customers ON customers.customer_id = vehicles.vehicle_id
GO