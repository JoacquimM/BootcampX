CREATE TABLE assignments (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  content TEXT,
  day INTEGER,
  chapter INTEGER,
  duration INTEGER
);
CREATE TABLE assignment_submissions (
  id SERIAL PRIMARY KEY NOT NULL,
  assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
  duration INTEGER,
  submission_date DATE
);
-- SELECT count(*)
-- FROM assignment_submissions;
-- --------------------------------
-- inner join
-- SELECT students.name as student_name,
--   email,
--   cohorts.name as cohort_name
-- FROM students
--   INNER JOIN cohorts ON cohorts.id = cohort_id;
-- --------------------------------
-- outer join
-- SELECT students.name as student_name,
--   email,
--   cohorts.name as cohort_name
-- FROM students
--   FULL OUTER JOIN cohorts ON cohorts.id = cohort_id;
SELECT students.name,
  cohorts.name,
  cohorts.start_date as cohort_start_date,
  students.start_date as student_start_date
FROM students
  JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.start_date != students.start_date
ORDER BY cohort_start_date;