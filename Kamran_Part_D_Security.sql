USE Kamran_Ashraf_DB;


CREATE ROLE IF NOT EXISTS
    'hospital_admin',
    'hospital_doctor',
    'hospital_patient',
    'hospital_receptionist';


GRANT ALL PRIVILEGES
ON Kamran_Ashraf_DB.*
TO 'hospital_admin';


SHOW GRANTS FOR 'hospital_admin';    


GRANT SELECT ON Kamran_Ashraf_DB.Patient
TO 'hospital_doctor';

GRANT SELECT ON Kamran_Ashraf_DB.Appointment
TO 'hospital_doctor';


GRANT SELECT, INSERT ON Kamran_Ashraf_DB.Diagnosis
TO 'hospital_doctor';


SHOW GRANTS FOR 'hospital_doctor';


GRANT SELECT ON Kamran_Ashraf_DB.Patient
TO 'hospital_patient';

GRANT SELECT ON Kamran_Ashraf_DB.Appointment
TO 'hospital_patient';


GRANT SELECT, INSERT, UPDATE
ON Kamran_Ashraf_DB.Patient
TO 'hospital_receptionist';

GRANT SELECT, INSERT, UPDATE
ON Kamran_Ashraf_DB.Appointment
TO 'hospital_receptionist';

SHOW GRANTS FOR 'hospital_receptionist';

SHOW GRANTS FOR 'hospital_patient';





SHOW GRANTS FOR 'hospital_admin';


SELECT * FROM Kamran_Ashraf_DB.Appointment;


CREATE USER IF NOT EXISTS 'patient_test'@'localhost'
IDENTIFIED BY 'TestPatient2026!';

GRANT 'hospital_patient' TO 'patient_test'@'localhost';

SET DEFAULT ROLE 'hospital_patient'
TO 'patient_test'@'localhost';

SELECT SHA2('ExamplePassword123!', 256) AS Hashed_Password;


SET @patient_id = 'OP001';

PREPARE patient_query FROM
'SELECT Patient_ID, First_Name, Last_Name
 FROM Patient
 WHERE Patient_ID = ?';

EXECUTE patient_query USING @patient_id;

DEALLOCATE PREPARE patient_query;


START TRANSACTION;

UPDATE Patient
SET Postcode = 'M1 1AA'
WHERE Patient_ID = 'OP001';

ROLLBACK;

SELECT Patient_ID, Postcode
FROM Patient
WHERE Patient_ID = 'OP001';

START TRANSACTION;

UPDATE Patient
SET Postcode = 'M1 1AA'
WHERE Patient_ID = 'OP001';

COMMIT;

SELECT Patient_ID, Postcode
FROM Patient
WHERE Patient_ID = 'OP001';

UPDATE Patient
SET Postcode = 'NE2 9ZZ'
WHERE Patient_ID = 'OP001';