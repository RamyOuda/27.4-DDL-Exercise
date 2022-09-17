DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE diseases
(
  id SERIAL PRIMARY KEY,
  disease TEXT NOT NULL
);

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  disease_id INT NOT NULL REFERENCES diseases
);

CREATE TABLE doctors_patients
(
  id SERIAL PRIMARY KEY,
  doctor_id INT NOT NULL REFERENCES doctors,
  patient_id INT NOT NULL REFERENCES patients
);
