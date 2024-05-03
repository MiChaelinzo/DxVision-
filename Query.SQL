SELECT patient_id, name, age, gender, medical_history
FROM patients
WHERE patient_id = 123;  -- Replace with the desired patient ID

SELECT image_id, acquisition_date, modality, image_path
FROM medical_images
WHERE patient_id = 123;

SELECT p.patient_id, p.name, d.diagnosis_code, d.diagnosis_description
FROM patients p
INNER JOIN diagnoses d ON p.patient_id = d.patient_id
WHERE p.age > 50;  -- Example condition

SELECT i.image_id, i.image_path, d.diagnosis_code
FROM medical_images i
INNER JOIN diagnoses d ON i.patient_id = d.patient_id
WHERE i.modality = 'CT'; -- Example condition

SELECT d.diagnosis_code, COUNT(*) AS num_patients
FROM diagnoses d
GROUP BY d.diagnosis_code
ORDER BY num_patients DESC;

SELECT i.image_path, d.diagnosis_code
FROM medical_images i
INNER JOIN diagnoses d ON i.patient_id = d.patient_id
WHERE i.modality = 'X-ray' AND d.diagnosis_code IN ('DX1', 'DX2', 'DX3');
