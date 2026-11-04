USE Kamran_Ashraf_DB;

-- Query 1: GROUP BY and HAVING
SELECT Patient_ID, COUNT(*) AS Total_Appointments
FROM Appointment
GROUP BY Patient_ID
HAVING COUNT(*) > 1;

-- Query 2: INNER JOIN (3 tables)
SELECT
    p.Patient_ID,
    CONCAT(p.First_Name, ' ', p.Last_Name) AS Patient_Name,
    a.Appointment_Date,
    CONCAT(c.First_Name, ' ', c.Last_Name) AS Clinician_Name
FROM Appointment a
INNER JOIN Patient p ON a.Patient_ID = p.Patient_ID
INNER JOIN Clinician c ON a.Clinician_ID = c.Clinician_ID
ORDER BY a.Appointment_Date;

-- Query 3: LEFT JOIN
-- Show all patients, including those without appointments.

SELECT
    p.Patient_ID,
    CONCAT(p.First_Name, ' ', p.Last_Name) AS Patient_Name,
    a.Appointment_Date
FROM Patient p
LEFT JOIN Appointment a
    ON p.Patient_ID = a.Patient_ID
ORDER BY p.Patient_ID;

-- Query 4: Subquery
-- Show names of patients who have more than one appointment.

SELECT
    Patient_ID,
    CONCAT(First_Name, ' ', Last_Name) AS Patient_Name
FROM Patient
WHERE Patient_ID IN (
    SELECT Patient_ID
    FROM Appointment
    GROUP BY Patient_ID
    HAVING COUNT(*) > 1
);

-- Part C, Query 5: Stored Procedure
-- Find all appointments for a selected patient.

DELIMITER //

CREATE PROCEDURE GetPatientAppointments(IN patientID VARCHAR(10))
BEGIN
    SELECT
        Appointment_ID,
        Patient_ID,
        Appointment_Date,
        Appointment_Time
    FROM Appointment
    WHERE Patient_ID = patientID;
END //

DELIMITER ;

CALL GetPatientAppointments('OP001');

-- Part C, Query 6: Trigger
-- Prevent appointments being booked in the past.

DELIMITER //

CREATE TRIGGER CheckAppointmentDate
BEFORE INSERT ON Appointment
FOR EACH ROW
BEGIN
    IF NEW.Appointment_Date < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot book an appointment in the past';
    END IF;
END //

DELIMITER ;

-- Query 6: Test the trigger
-- Try to book an appointment in the past.

INSERT INTO Appointment
(Patient_ID, Clinician_ID, Clinic_ID, Appointment_Date, Appointment_Time)
VALUES
('OP001', 1, 1, '2020-01-01', '10:00:00');