CREATE TABLE room(
	room_name text PRIMARY KEY,
	net_volume integer NOT NULL,
	room_temperature int4range NOT NULL,
	room_humidity int4range NOT NULL	
);
CREATE TABLE client(
	client_name text PRIMARY KEY,
	bank_details text NOT NULL
);
CREATE TABLE rack(
	rack_num integer PRIMARY KEY,
	seating_capacity integer NOT NULL,
	max_load integer NOT NULL,
	slot_length integer NOT NULL,
	slot_width integer NOT NULL,
	slot_height integer NOT NULL
);
CREATE TABLE rack_client(
	rack_num integer UNIQUE NOT NULL REFERENCES rack,
	client_name text NOT NULL REFERENCES client,
	PRIMARY KEY (rack_num, client_name)
);
CREATE TABLE product(
	prod_client_name text NOT NULL,
	prod_rack_num integer NOT NULL,
	FOREIGN KEY(prod_client_name, prod_rack_num) REFERENCES rack_client(client_name,rack_num),
	prod_length integer NOT NULL,
	prod_width integer NOT NULL,
	prod_height integer NOT NULL,
	prod_weight integer NOT NULL,
	receipt_date date NOT NULL,
	contract_num integer NOT NULL,
	expiration_date date NOT NULL,
	prod_humidity int4range NOT NULL,
	prod_temperature int4range NOT NULL,
	position integer NOT NULL,
	PRIMARY KEY (prod_client_name,prod_rack_num)
);