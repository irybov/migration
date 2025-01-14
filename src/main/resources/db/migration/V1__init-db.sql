CREATE SCHEMA IF NOT EXISTS bankdemo;
CREATE TABLE IF NOT EXISTS bankdemo.accounts(
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP,
	is_active BOOLEAN NOT NULL,
	name VARCHAR(20) NOT NULL,
	surname VARCHAR(40) NOT NULL,
	phone VARCHAR(10) UNIQUE NOT NULL CHECK (CHAR_LENGTH(phone) = 10),
	email VARCHAR(60) UNIQUE NOT NULL,
	birthday DATE NOT NULL,
	password VARCHAR(60) NOT NULL,
	bills INTEGER ARRAY,
	roles VARCHAR ARRAY
);
CREATE TABLE IF NOT EXISTS bankdemo.bills(
	id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP,
	is_active BOOLEAN NOT NULL,
	balance NUMERIC(19,2) NOT NULL,
	currency VARCHAR(3) NOT NULL CHECK (CHAR_LENGTH(currency) = 3),
	owner INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS bankdemo.operations(
	id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	created_at TIMESTAMP NOT NULL,
	amount DOUBLE PRECISION NOT NULL,
	action VARCHAR(10) NOT NULL,
	currency VARCHAR(3) NOT NULL CHECK (CHAR_LENGTH(currency) = 3),
	sender INTEGER,
	recipient INTEGER,
	bank VARCHAR(30) NOT NULL
);