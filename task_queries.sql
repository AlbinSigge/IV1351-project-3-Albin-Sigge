-- Finds the amount of lessons per month and type
CREATE VIEW lessons_per_month AS
    SELECT to_char(date_trunc('month', date), 'month') AS Date, count(id) AS "Total",
           count(il.lesson_id) AS "Individual",
           count(gl.lesson_id) AS "Group",
           count(e.lesson_id) AS "Ensemble"
    FROM lesson
    LEFT JOIN individual_lesson il ON lesson.id = il.lesson_id
    LEFT JOIN group_lesson gl ON lesson.id = gl.lesson_id
    LEFT JOIN ensemble e ON lesson.id = e.lesson_id
    GROUP BY date_trunc('month', date)
    ORDER BY date_trunc('month', date);



-- Shows the amount of students who have different amounts of siblings
CREATE VIEW count_siblings AS
    SELECT siblings, count(siblings) AS "amount" FROM
        (SELECT count(sibling.student_id) AS siblings
        FROM student LEFT JOIN sibling ON sibling.student_id = student.id
        GROUP BY student.id) AS s
    GROUP BY siblings
    ORDER BY siblings;


-- Shows how many lessons each instructor is giving the next month over a certain amount, in this case more than 4
CREATE VIEW lessons_per_instructor AS
    SELECT instructor.id, person.person_name AS name, count(l.instructor_id)
    FROM person
    JOIN instructor ON instructor.person_id = person.id
    LEFT JOIN
        (SELECT instructor_id, date
        FROM lesson
        WHERE date_trunc('month', date) = date_trunc('month', current_date)
        ) AS l
    ON instructor.id = l.instructor_id
    GROUP BY instructor.id, person.person_name HAVING count(l.instructor_id) > 4
    ORDER BY instructor.id;


-- The following two both show how many spots are empty in the lessons the following week
-- With nested SELECT
CREATE VIEW nested_ensembles_this_week AS
    SELECT to_char(en.date, 'Day') AS "Day", en.genre,
    CASE
        WHEN max_students - count(sl.lesson_id) > 2 THEN 'Many spots empty'
        WHEN max_students - count(sl.lesson_id) > 0 THEN '1 or 2 spots empty'
        ELSE 'No empty spots'
    END AS "Spots left"
    FROM
    (SELECT * FROM lesson l
    JOIN ensemble e ON l.id = e.lesson_id
    WHERE date_trunc('week', l.date) <= date_trunc('week', current_date + INTERVAL '1 week')
      AND l.date >= current_date
    ) AS en
    LEFT JOIN student_lesson sl ON sl.lesson_id = en.lesson_id
    GROUP BY en.lesson_id, en.date, en.genre, en.max_students
    ORDER BY en.date, genre;

-- Without nested SELECT
CREATE VIEW ensembles_this_week AS
    SELECT to_char(l.date, 'Day') AS "Day", e.genre,
    CASE
        WHEN max_students - count(sl.lesson_id) > 2 THEN 'Many spots empty'
        WHEN max_students - count(sl.lesson_id) > 0 THEN '1 or 2 spots empty'
        ELSE 'No empty spots'
    END AS "Spots left"
    FROM lesson l
    JOIN ensemble e ON l.id = e.lesson_id
    LEFT JOIN student_lesson sl ON sl.lesson_id = e.lesson_id
    WHERE l.date <= current_date + INTERVAL '1 week'
      AND l.date >= current_date
    GROUP BY e.lesson_id, l.date, e.genre
    ORDER BY l.date, genre;




-- The following three queries place the appropriate information from the main database into the historical one
INSERT INTO historical_lesson
SELECT l.id,
    CASE
        WHEN il.lesson_id IS NOT NULL THEN 'Individual'
        WHEN gl.lesson_id IS NOT NULL THEN 'Group'
        WHEN e.lesson_id IS NOT NULL THEN 'Ensemble'
    END AS lesson_type,
    e.genre,
    CASE
        WHEN il.instrument IS NOT NULL THEN il.instrument
        WHEN gl.instrument IS NOT NULL THEN gl.instrument
    END AS instrument,
    p.student_fee AS "price"
FROM lesson l
    LEFT JOIN ensemble e ON l.id = e.lesson_id
    LEFT JOIN group_lesson gl ON l.id = gl.lesson_id
    LEFT JOIN individual_lesson il ON l.id = il.lesson_id
    JOIN pricing p ON l.pricing_id = p.id
ORDER BY l.id ON CONFLICT DO NOTHING;

INSERT INTO historical_student
SELECT DISTINCT s.id, p.person_name, cd.email FROM student s
    JOIN person p ON s.person_id = p.id
    JOIN contact_details cd ON s.person_id = cd.person_id
    JOIN student_lesson sl ON s.id = sl.student_id
ON CONFLICT (id) DO UPDATE SET email = excluded.email;

INSERT INTO historical_student_lesson
SELECT * FROM student_lesson ON CONFLICT DO NOTHING;
