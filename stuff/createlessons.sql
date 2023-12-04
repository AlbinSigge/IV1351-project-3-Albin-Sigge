CREATE OR REPLACE FUNCTION insert_lesson(

    p_date TIMESTAMP,

    p_lesson_type VARCHAR(500),

    p_skill_level VARCHAR(500),

    p_instrument_or_genre VARCHAR(500)

)

RETURNS VOID AS $$

DECLARE

    v_instructor_id INT;

    v_pricing_id INT;

    v_lesson_id INT;

BEGIN

    -- Find an instructor who knows the instrument or a random instructor if no match

    SELECT COALESCE(

            (SELECT i.id

             FROM known_instrument ki

             JOIN instructor i ON ki.instructor_id = i.id

             WHERE ki.instrument = p_instrument_or_genre

             LIMIT 1),

            (SELECT id FROM instructor ORDER BY random() LIMIT 1)

        )

    INTO v_instructor_id;



    -- Find pricing scheme matching skill level and lesson type with the latest valid from date

    SELECT id

    INTO v_pricing_id

    FROM pricing

    WHERE skill_level = p_skill_level

      AND lesson_type = p_lesson_type

      AND valid_from <= p_date

    ORDER BY valid_from DESC

    LIMIT 1;



    -- Insert the lesson

    INSERT INTO lesson (date,duration, skill_level, pricing_id, instructor_id)

    VALUES (p_date, 60, p_skill_level, v_pricing_id, v_instructor_id)

    RETURNING id INTO v_lesson_id;



    -- Determine lesson type and create associated record

    CASE p_lesson_type

        WHEN 'Individual' THEN

            INSERT INTO individual_lesson (lesson_id, instrument)

            VALUES (v_lesson_id, p_instrument_or_genre);

        WHEN 'Group' THEN

            INSERT INTO group_lesson (lesson_id, min_students, max_students, instrument)

            VALUES (v_lesson_id, 5, 12, p_instrument_or_genre);

        WHEN 'Ensemble' THEN

            INSERT INTO ensemble (lesson_id, min_students, max_students, genre)

            VALUES (v_lesson_id, 5, 12, p_instrument_or_genre);

        ELSE

            -- Handle other cases or raise an exception as needed

            RAISE EXCEPTION 'Invalid lesson type: %', p_lesson_type;

    END CASE;

END;

$$ LANGUAGE plpgsql;




INSERT INTO pricing (skill_level, lesson_type, student_fee, instructor_pay, sibling_discount, valid_from)

VALUES

    ('Beginner', 'Individual', 50.00, 30.00, 0.10, CURRENT_DATE),

    ('Beginner', 'Group', 30.00, 20.00, 0.10, CURRENT_DATE),

    ('Beginner', 'Ensemble', 40.00, 25.00, 0.10, CURRENT_DATE),



    ('Intermediate', 'Individual', 60.00, 40.00, 0.15, CURRENT_DATE),

    ('Intermediate', 'Group', 40.00, 25.00, 0.15, CURRENT_DATE),

    ('Intermediate', 'Ensemble', 50.00, 30.00, 0.15, CURRENT_DATE),



    ('Advanced', 'Individual', 70.00, 50.00, 0.20, CURRENT_DATE),

    ('Advanced', 'Group', 50.00, 35.00, 0.20, CURRENT_DATE),

    ('Advanced', 'Ensemble', 60.00, 40.00, 0.20, CURRENT_DATE);



    -- Insert Individual Lessons

DO $$

DECLARE

    lesson_date TIMESTAMP;

    instrument_type VARCHAR(500);

BEGIN

    FOR month_offset IN 0..11 LOOP

        lesson_date := CURRENT_DATE + (interval '1 month' * month_offset);

        FOR lesson_count IN 1..2 LOOP

            FOR instrument_type IN SELECT unnest(ARRAY['Piano', 'Violin', 'Guitar', 'Flute', 'Trumpet', 'Drums', 'Saxophone', 'Clarinet', 'Cello', 'Trombone'])

            LOOP

                PERFORM insert_lesson(

                    lesson_date + interval '1 day' * (lesson_count - 1),

                    'Individual',

                    CASE lesson_count

                        WHEN 1 THEN 'Beginner'

                        WHEN 2 THEN 'Intermediate'

                    END,

                    instrument_type

                );

            END LOOP;

        END LOOP;

    END LOOP;

END $$;



-- Insert Group Lessons

DO $$

DECLARE

    lesson_date TIMESTAMP;

    instrument_type VARCHAR(500);

BEGIN

    FOR month_offset IN 0..11 LOOP

        lesson_date := CURRENT_DATE + (interval '1 month' * month_offset);

        FOR lesson_count IN 1..2 LOOP

            FOR instrument_type IN SELECT unnest(ARRAY['Piano', 'Violin', 'Guitar', 'Flute', 'Trumpet', 'Drums', 'Saxophone', 'Clarinet', 'Cello', 'Trombone'])

            LOOP

                PERFORM insert_lesson(

                    lesson_date + interval '1 day' * (lesson_count - 1),

                    'Group',

                    CASE lesson_count

                        WHEN 1 THEN 'Intermediate'

                        WHEN 2 THEN 'Advanced'

                    END,

                    instrument_type

                );

            END LOOP;

        END LOOP;

    END LOOP;

END $$;



-- Insert Ensemble Lessons

DO $$

DECLARE

    lesson_date TIMESTAMP;

    genre VARCHAR(500);

BEGIN

    FOR month_offset IN 0..11 LOOP

        lesson_date := CURRENT_DATE + (interval '1 month' * month_offset);

        FOR lesson_count IN 1..2 LOOP

            FOR genre IN SELECT unnest(ARRAY['Jazz', 'Classical', 'Rock', 'Pop'])

            LOOP

                PERFORM insert_lesson(

                    lesson_date + interval '1 day' * (lesson_count - 1),

                    'Ensemble',

                    CASE lesson_count

                        WHEN 1 THEN 'Beginner'

                        WHEN 2 THEN 'Advanced'

                    END,

                    genre

                );

            END LOOP;

        END LOOP;

    END LOOP;

END $$;



-- Insert Sibling Relationships

-- This assumes you have students with IDs from 1 to 30



-- Example: Student 1 has 2 siblings

INSERT INTO sibling (student_id, sibling_id) VALUES (1, 2), (1, 3);

INSERT INTO sibling (student_id, sibling_id) VALUES (2, 1), (2, 3);

INSERT INTO sibling (student_id, sibling_id) VALUES (3, 1), (3, 2);



-- Example: Student 4 has 1 sibling

INSERT INTO sibling (student_id, sibling_id) VALUES (4, 5);

INSERT INTO sibling (student_id, sibling_id) VALUES (5, 4);



-- Example: Student 6 has 3 siblings

INSERT INTO sibling (student_id, sibling_id) VALUES (6, 7), (6, 8), (6, 9);

INSERT INTO sibling (student_id, sibling_id) VALUES (7, 6), (7, 8), (7, 9);

INSERT INTO sibling (student_id, sibling_id) VALUES (8, 6), (8, 7), (8, 9);

INSERT INTO sibling (student_id, sibling_id) VALUES (9, 6), (9, 7), (9, 8);



-- Example: Student 10 has 1 sibling

INSERT INTO sibling (student_id, sibling_id) VALUES (10, 11);

INSERT INTO sibling (student_id, sibling_id) VALUES (11, 10);



-- Example: Student 12 has 2 siblings

INSERT INTO sibling (student_id, sibling_id) VALUES (12, 13), (12, 14);

INSERT INTO sibling (student_id, sibling_id) VALUES (13, 12), (13, 14);

INSERT INTO sibling (student_id, sibling_id) VALUES (14, 12), (14, 13);



-- Example: Student 15 has 1 sibling

INSERT INTO sibling (student_id, sibling_id) VALUES (15, 16);

INSERT INTO sibling (student_id, sibling_id) VALUES (16, 15);



-- Example: Students 17 to 30 have no siblings



-- Continue with similar inserts for other students as needed

-- Insert Sibling Relationships

-- This assumes you have students with IDs from 150 to 200



-- Example: Student 150 has 2 siblings

INSERT INTO sibling (student_id, sibling_id) VALUES (150, 151), (150, 152);

INSERT INTO sibling (student_id, sibling_id) VALUES (151, 150), (151, 152);

INSERT INTO sibling (student_id, sibling_id) VALUES (152, 150), (152, 151);



-- Example: Student 153 has 1 sibling

INSERT INTO sibling (student_id, sibling_id) VALUES (153, 154);

INSERT INTO sibling (student_id, sibling_id) VALUES (154, 153);



-- Example: Student 155 has 3 siblings

INSERT INTO sibling (student_id, sibling_id) VALUES (155, 156), (155, 157), (155, 158);

INSERT INTO sibling (student_id, sibling_id) VALUES (156, 155), (156, 157), (156, 158);

INSERT INTO sibling (student_id, sibling_id) VALUES (157, 155), (157, 156), (157, 158);

INSERT INTO sibling (student_id, sibling_id) VALUES (158, 155), (158, 156), (158, 157);



-- Example: Student 159 has 1 sibling

INSERT INTO sibling (student_id, sibling_id) VALUES (159, 160);

INSERT INTO sibling (student_id, sibling_id) VALUES (160, 159);



-- Example: Student 161 has 2 siblings

INSERT INTO sibling (student_id, sibling_id) VALUES (161, 162), (161, 163);

INSERT INTO sibling (student_id, sibling_id) VALUES (162, 161), (162, 163);

INSERT INTO sibling (student_id, sibling_id) VALUES (163, 161), (163, 162);



-- Example: Student 164 has 1 sibling

INSERT INTO sibling (student_id, sibling_id) VALUES (164, 165);

INSERT INTO sibling (student_id, sibling_id) VALUES (165, 164);



