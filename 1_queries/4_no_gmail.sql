SELECT name,
  email,
  id,
  cohort_id
FROM Students
WHERE email NOT LIKE '%gmail.com'
  AND phone IS NULL;