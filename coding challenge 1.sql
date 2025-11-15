-- hospital database ---
CREATE DATABASE hospital_database;
USE hospital_database;

CREATE TABLE patients (
	patient_id INT,
    patient_name varchar(50),
    age INT,
    gender enum( 'M', 'F'),
    admission_date DATE
    );
	
ALTER TABLE patients 
ADD COLUMN docter_assigned varchar(50);

ALTER TABLE patients
MODIFY patient_name varchar(100);

ALTER TABLE patients
RENAME TO patients_info;

TRUNCATE TABLE patients_info;

DROP database hospital_database;
