CREATE PROCEDURE p_add_vehicle
	@customer_id INT,
	@brand VARCHAR(50),
	@model VARCHAR(100),
	@production_year INT = NULL,
	@fuel VARCHAR(50) = NULL,
	@engine VARCHAR(50) = NULL,
	@vin VARCHAR(50) = NULL,
	@registration_no VARCHAR(10)
AS
BEGIN
	IF @customer_id IS NULL
	BEGIN
		RAISERROR ('customer_id cannot be null', 16, 1);
		RETURN
	END
	IF (SELECT customer_id FROM customers WHERE customer_id = @customer_id) IS NULL
	BEGIN
		RAISERROR('there is no customer with such id', 16, 1);
		RETURN
	END
	IF @brand IS NULL OR @model IS NULL
	BEGIN
		RAISERROR('brand and model cannot be null', 16, 1);
		RETURN
	END
	IF (@production_year IS NULL OR @fuel IS NULL OR @engine IS NULL) AND @vin IS NULL
	BEGIN
		RAISERROR('you have to give all vehicle date (production year, fuel and engine) or VIN number', 16, 1);
		RETURN
	END
	IF @registration_no IS NULL
	BEGIN
		RAISERROR('registration_no cannot be null', 16, 1);
		RETURN
	END
	INSERT INTO vehicles(customer_id, brand, model, production_year, fuel, engine, vin, registration_no)
		VALUES(@customer_id, @brand, @model, @production_year, @fuel, @engine, @vin, @registration_no);
END
GO