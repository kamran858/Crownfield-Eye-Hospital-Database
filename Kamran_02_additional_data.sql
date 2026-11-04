USE Kamran_Ashraf_DB;

-- Additional diagnosis records
INSERT INTO Diagnosis (Appointment_ID, Diagnosis_Name)
VALUES
(6, 'Cataract'),
(7, 'Dry eye syndrome'),
(8, 'Glaucoma suspect'),
(9, 'Post-operative inflammation'),
(10, 'Diabetic retinopathy'),
(11, 'Ocular hypertension'),
(12, 'Dry eye syndrome'),
(13, 'Cataract'),
(14, 'Strabismus'),
(15, 'Retinal degeneration');

-- Additional prescription records
INSERT INTO Prescription (Appointment_ID)
VALUES
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15);

-- Additional prescription item records
INSERT INTO Prescription_Item
(Prescription_ID, Medicine_ID, Dose, Route, Frequency, Duration)
VALUES
(5, 5, '1 drop', 'Topical', 'Once daily', '4 weeks'),
(6, 6, '1 drop', 'Topical', 'Twice daily', '2 weeks'),
(7, 7, '1 drop', 'Topical', 'Once daily', '3 weeks'),
(8, 8, '1 drop', 'Topical', 'Twice daily', '2 weeks'),
(9, 9, '1 drop', 'Topical', 'Once daily', '1 week'),
(10, 10, '1 drop', 'Topical', 'Four times daily', '1 week'),
(11, 11, '1 drop', 'Topical', 'Twice daily', '4 weeks'),
(12, 12, '1 drop', 'Topical', 'Twice daily', '4 weeks'),
(13, 13, '1 dose', 'Intravitreal', 'Monthly', '3 months'),
(14, 14, '1 drop', 'Topical', 'Twice daily', '2 weeks');

-- Additional follow-up records
INSERT INTO Follow_Up_Plan
(Appointment_ID, Due_Date, Priority, Status)
VALUES
(6, '2026-11-19', 'Routine', 'Pending'),
(7, '2026-11-20', 'Routine', 'Pending'),
(8, '2026-11-21', 'High', 'Pending'),
(9, '2026-11-22', 'Routine', 'Pending'),
(10, '2026-11-23', 'Urgent', 'Pending'),
(11, '2026-11-24', 'High', 'Pending'),
(12, '2026-11-25', 'Routine', 'Pending'),
(13, '2026-11-26', 'Routine', 'Pending'),
(14, '2026-11-27', 'High', 'Pending'),
(15, '2026-11-28', 'Routine', 'Pending');

-- Prevent multiple follow-up plans for one appointment
ALTER TABLE Follow_Up_Plan
ADD CONSTRAINT uq_followup_appointment
UNIQUE (Appointment_ID);

-- Allow only valid follow-up statuses
ALTER TABLE Follow_Up_Plan
ADD CONSTRAINT chk_followup_status
CHECK (Status IN ('Pending', 'Planned', 'Completed', 'Cancelled'));

-- TEST 1: Invalid status (expected to fail)
-- UPDATE Follow_Up_Plan
-- SET Status = 'Invalid'
-- WHERE FollowUp_ID = 1;

-- TEST 2: Duplicate follow-up (expected to fail)
-- INSERT INTO Follow_Up_Plan
-- (Appointment_ID, Due_Date, Priority, Status)
-- VALUES (1, '2026-12-01', 'Routine', 'Pending');

-- TEST 3: Invalid patient foreign key (expected to fail)
-- INSERT INTO Appointment
-- (Patient_ID, Clinician_ID, Clinic_ID, Appointment_Date, Appointment_Time)
-- VALUES ('OP999', 1, 1, '2026-12-01', '10:00:00');