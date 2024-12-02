WITH LatestGrades AS (
    SELECT
        g.student_id,
        g.course_id,
        g.grade,
        ROW_NUMBER() OVER (PARTITION BY g.student_id, g.course_id ORDER BY g.module DESC) AS rn
    FROM Grades g
),
StudentAverage AS (
    SELECT
        g.student_id,
        AVG(g.grade) AS average_grade
    FROM LatestGrades g
    WHERE g.rn = 1
    GROUP BY g.student_id
)
SELECT
    s.first_name,
    s.last_name,
    s.grade_level,
    c.course_name,
    lg.grade AS course_grade,
    sa.average_grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN LatestGrades lg 
    ON e.student_id = lg.student_id AND e.course_id = lg.course_id
JOIN StudentAverage sa 
    ON s.student_id = sa.student_id
WHERE lg.rn = 1
ORDER BY s.last_name, s.first_name, c.course_name;

