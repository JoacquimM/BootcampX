const { Pool } = require("pg");

const pool = new Pool({
  user: "vagrant",
  password: "123",
  host: "localhost",
  database: "bootcampx",
});

// pool
//   .query(
//     `
// SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
// FROM teachers
// JOIN assistance_requests ON teacher_id = teachers.id
// JOIN students ON student_id = students.id
// JOIN cohorts ON cohort_id = cohorts.id
// WHERE cohorts.name = '${process.argv[2] || "JUL02"}'
// ORDER BY teacher;
// `
//   )
//   .then((res) => {
//     res.rows.forEach((row) => {
//       console.log(`${row.cohort}: ${row.teacher}`);
//     });
//   });

//--------------------------------------------------------------

//// use parameterized queries
const queryString = `
  SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
  FROM teachers
  JOIN assistance_requests ON teacher_id = teachers.id
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohort_id = cohorts.id
  WHERE cohorts.name = $1 || "JUL02"
  ORDER BY teacher;
  `;
corhortName = proccess.argV[2];
const values = [corhortName];

pool.query(queryString, values).then((res) => {
  res.rows.forEach((row) => {
    console.log(`${row.cohort}: ${row.teacher}`);
  });
});
