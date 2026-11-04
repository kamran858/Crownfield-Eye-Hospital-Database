USE Kamran_Ashraf_DB;

-- Test 1: CHECK constraint
-- Invalid status should be rejected
UPDATE Follow_Up_Plan
SET Status = 'Invalid'
WHERE FollowUp_ID = 1;

-- Test 2: UNIQUE constraint
-- Duplicate follow-up should be rejected
INSERT INTO Follow_Up_Plan
    (Appointment_ID, Due_Date, Priority, Status)
VALUES
    (1, '2026-12-01', 'Routine', 'Pending');

-- Test 3: FOREIGN KEY constraint
-- Patient OP999 does not exist
INSERT INTO Appointment
    (Patient_ID, Clinician_ID, Clinic_ID,
     Appointment_Date, Appointment_Time)
VALUES
    ('OP999', 1, 1, '2026-12-01', '10:00:00');