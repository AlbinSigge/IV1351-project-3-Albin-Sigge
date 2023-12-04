insert into person (person_number, person_name, address) values ('557665785133', 'Jaine Skey', '3 Carioca Park');
insert into person (person_number, person_name, address) values ('812762546887', 'Devonne Hoodlass', '0700 Oxford Junction');
insert into person (person_number, person_name, address) values ('389064351433', 'Farand Turpie', '386 Summit Terrace');
insert into person (person_number, person_name, address) values ('144160797364', 'Tallie Summerfield', '6 Jana Junction');
insert into person (person_number, person_name, address) values ('539316208981', 'Darda Favill', '5 Grayhawk Street');
insert into person (person_number, person_name, address) values ('281358804471', 'Charley St Quenin', '89248 Kingsford Circle');
insert into person (person_number, person_name, address) values ('304905791943', 'Mariette Cutler', '36 Springview Court');
insert into person (person_number, person_name, address) values ('231392746351', 'Louisa Struys', '06171 Knutson Drive');
insert into person (person_number, person_name, address) values ('591142172317', 'Lexie Berth', '0 Sage Center');
insert into person (person_number, person_name, address) values ('795850890381', 'Selby Hatterslay', '82 Elgar Circle');
insert into person (person_number, person_name, address) values ('051951331509', 'Joane Baglan', '28 Sage Drive');
insert into person (person_number, person_name, address) values ('285379032657', 'Maure Vosper', '7924 Kings Center');
insert into person (person_number, person_name, address) values ('557878871926', 'Elfreda Fallows', '442 Bay Drive');
insert into person (person_number, person_name, address) values ('148901357713', 'Maurise Di Frisco', '4 Canary Drive');
insert into person (person_number, person_name, address) values ('310839569634', 'Thomasina Risson', '16 Hudson Street');


insert into student (skill_level, person_id) values ('Advanced', 1);
insert into student (skill_level, person_id) values ('Beginner', 2);
insert into student (skill_level, person_id) values ('Beginner', 3);
insert into student (skill_level, person_id) values ('Advanced', 4);
insert into student (skill_level, person_id) values ('Intermediate', 5);
insert into student (skill_level, person_id) values ('Beginner', 6);
insert into student (skill_level, person_id) values ('Advanced', 7);
insert into student (skill_level, person_id) values ('Advanced', 8);
insert into student (skill_level, person_id) values ('Intermediate', 9);
insert into student (skill_level, person_id) values ('Intermediate', 10);

INSERT INTO contact_details(person_id, phone_number, email) VALUES (1, '123456789', 'hello1@good.bye');
INSERT INTO contact_details(person_id, phone_number, email) VALUES (2, '234567891', 'hello2@good.bye');
INSERT INTO contact_details(person_id, phone_number, email) VALUES (3, '345678912', 'hello3@good.bye');
INSERT INTO contact_details(person_id, phone_number, email) VALUES (4, '456789123', 'hello4@good.bye');
INSERT INTO contact_details(person_id, phone_number, email) VALUES (5, '567891234', 'hello5@good.bye');
INSERT INTO contact_details(person_id, phone_number, email) VALUES (6, '678912345', 'hello6@good.bye');
INSERT INTO contact_details(person_id, phone_number, email) VALUES (7, '789123456', 'hello7@good.bye');
INSERT INTO contact_details(person_id, phone_number, email) VALUES (8, '891234567', 'hello8@good.bye');
INSERT INTO contact_details(person_id, phone_number, email) VALUES (9, '912345678', 'hello9@good.bye');
INSERT INTO contact_details(person_id, phone_number, email) VALUES (10, '987654321', 'hello10@good.bye');
INSERT INTO contact_details(person_id, phone_number, email) VALUES (11, '876543219', 'hello11@good.bye');
INSERT INTO contact_details(person_id, phone_number, email) VALUES (12, '765432198', 'hello12@good.bye');
INSERT INTO contact_details(person_id, phone_number, email) VALUES (13, '654321987', 'hello13@good.bye');
INSERT INTO contact_details(person_id, phone_number, email) VALUES (14, '543219876', 'hello14@good.bye');
INSERT INTO contact_details(person_id, phone_number, email) VALUES (15, '432198765', 'hello15@good.bye');

INSERT INTO sibling(student_id, sibling_id) VALUES (1, 2);
INSERT INTO sibling(student_id, sibling_id) VALUES (2, 1);

INSERT INTO contact_person(student_id, contact_name, phone_number, email) VALUES (5, 'Martha Favill', '000000000', 'hi@good.bye');


insert into instructor (person_id) values (11);
insert into instructor (person_id) values (12);
insert into instructor (person_id) values (13);
insert into instructor (person_id) values (14);
insert into instructor (person_id) values (15);


INSERT INTO taught_instrument (instrument) VALUES ('Guitar');
INSERT INTO taught_instrument (instrument) VALUES ('Piano');
INSERT INTO taught_instrument (instrument) VALUES ('Accordion');
INSERT INTO taught_instrument (instrument) VALUES ('Violin');
INSERT INTO taught_instrument (instrument) VALUES ('Flute');
INSERT INTO taught_instrument (instrument) VALUES ('Drums');
INSERT INTO taught_instrument (instrument) VALUES ('Bass');
INSERT INTO taught_instrument (instrument) VALUES ('Saxophone');
INSERT INTO taught_instrument (instrument) VALUES ('Cello');
INSERT INTO taught_instrument (instrument) VALUES ('Trombone');
INSERT INTO taught_instrument (instrument) VALUES ('Clarinet');
INSERT INTO taught_instrument (instrument) VALUES ('Trumpet');


insert into known_instrument (instrument, instructor_id) values ('Saxophone', 1);
insert into known_instrument (instrument, instructor_id) values ('Cello', 2);
insert into known_instrument (instrument, instructor_id) values ('Cello', 3);
insert into known_instrument (instrument, instructor_id) values ('Guitar', 4);
insert into known_instrument (instrument, instructor_id) values ('Piano', 5);
insert into known_instrument (instrument, instructor_id) values ('Guitar', 1);
insert into known_instrument (instrument, instructor_id) values ('Piano', 2);
insert into known_instrument (instrument, instructor_id) values ('Trombone', 3);
insert into known_instrument (instrument, instructor_id) values ('Trombone', 4);
insert into known_instrument (instrument, instructor_id) values ('Drums', 5);


INSERT INTO pricing (skill_level, lesson_type, student_fee, instructor_pay, sibling_discount, valid_from)
VALUES ('Beginner', 'Individual lesson', 100, 80, 0.1, '2022-01-01 00:00:00');
INSERT INTO pricing (skill_level, lesson_type, student_fee, instructor_pay, sibling_discount, valid_from)
VALUES ('Beginner', 'Individual lesson', 100, 80, 0.1, '2023-01-01 00:00:00');
INSERT INTO pricing (skill_level, lesson_type, student_fee, instructor_pay, sibling_discount, valid_from)
VALUES ('Intermediate', 'Individual lesson', 100, 80, 0.1, '2023-01-01 00:00:00');
INSERT INTO pricing (skill_level, lesson_type, student_fee, instructor_pay, sibling_discount, valid_from)
VALUES ('Advanced', 'Individual lesson', 120, 100, 0.1, '2023-01-01 00:00:00');

INSERT INTO pricing (skill_level, lesson_type, student_fee, instructor_pay, sibling_discount, valid_from)
VALUES ('Beginner', 'Group lesson', 95, 80, 0.1, '2023-01-01 00:00:00');
INSERT INTO pricing (skill_level, lesson_type, student_fee, instructor_pay, sibling_discount, valid_from)
VALUES ('Intermediate', 'Group lesson', 95, 80, 0.1, '2023-01-01 00:00:00');
INSERT INTO pricing (skill_level, lesson_type, student_fee, instructor_pay, sibling_discount, valid_from)
VALUES ('Advanced', 'Group lesson', 110, 90, 0.1, '2023-01-01 00:00:00');

INSERT INTO pricing (skill_level, lesson_type, student_fee, instructor_pay, sibling_discount, valid_from)
VALUES ('Beginner', 'Ensemble', 95, 80, 0.1, '2023-01-01 00:00:00');
INSERT INTO pricing (skill_level, lesson_type, student_fee, instructor_pay, sibling_discount, valid_from)
VALUES ('Intermediate', 'Ensemble', 95, 80, 0.1, '2023-01-01 00:00:00');
INSERT INTO pricing (skill_level, lesson_type, student_fee, instructor_pay, sibling_discount, valid_from)
VALUES ('Advanced', 'Ensemble', 110, 90, 0.1, '2023-01-01 00:00:00');


INSERT INTO lesson (date, duration, skill_level, pricing_id, instructor_id) VALUES ('2023-11-28 17:15:00', 40, 'Intermediate', 3, 1);
INSERT INTO lesson (date, duration, skill_level, pricing_id, instructor_id) VALUES ('2023-11-24 16:00:00', 60, 'Advanced', 7, 2);
INSERT INTO lesson (date, duration, skill_level, pricing_id, instructor_id) VALUES ('2023-11-23 17:00:00', 60, 'Beginner', 2, 3);
INSERT INTO lesson (date, duration, skill_level, pricing_id, instructor_id) VALUES ('2023-11-23 17:00:00', 60, 'Beginner', 8, 4);
INSERT INTO lesson (date, duration, skill_level, pricing_id, instructor_id) VALUES ('2023-11-23 17:00:00', 60, 'Advanced', 7, 5);



INSERT INTO individual_lesson (lesson_id, instrument) VALUES (3, 'Piano');

INSERT INTO ensemble (lesson_id, genre, min_students, max_students) VALUES (4, 'Punk rock', 3, 5);

INSERT INTO group_lesson(lesson_id, min_students, max_students, instrument) VALUES (5, 2, 10, 'Drums');

INSERT INTO student_lesson(student_id, lesson_id) VALUES (2, 4);
INSERT INTO student_lesson(student_id, lesson_id) VALUES (3, 4);
INSERT INTO student_lesson(student_id, lesson_id) VALUES (6, 4);


insert into instrument_type (type_of_instrument, brand, cost) values ('Violin', 'Yamaha', 230.62);
insert into instrument_type (type_of_instrument, brand, cost) values ('Violin', 'Eastman', 229.82);
insert into instrument_type (type_of_instrument, brand, cost) values ('Guitar', 'Fender', 232.01);
insert into instrument_type (type_of_instrument, brand, cost) values ('Guitar', 'Gibson', 235.45);
insert into instrument_type (type_of_instrument, brand, cost) values ('Guitar', 'Yamaha', 218.02);
insert into instrument_type (type_of_instrument, brand, cost) values ('Flute', 'Yamaha', 207.32);
insert into instrument_type (type_of_instrument, brand, cost) values ('Flute', 'Gemeinhardt', 238.28);


insert into instrument (instrument_type_id) values (4);
insert into instrument (instrument_type_id) values (6);
insert into instrument (instrument_type_id) values (7);
insert into instrument (instrument_type_id) values (1);
insert into instrument (instrument_type_id) values (6);
insert into instrument (instrument_type_id) values (2);
insert into instrument (instrument_type_id) values (1);
insert into instrument (instrument_type_id) values (3);
insert into instrument (instrument_type_id) values (7);
insert into instrument (instrument_type_id) values (7);
insert into instrument (instrument_type_id) values (2);
insert into instrument (instrument_type_id) values (6);
insert into instrument (instrument_type_id) values (4);
insert into instrument (instrument_type_id) values (3);
insert into instrument (instrument_type_id) values (6);
insert into instrument (instrument_type_id) values (5);
insert into instrument (instrument_type_id) values (4);
insert into instrument (instrument_type_id) values (5);
insert into instrument (instrument_type_id) values (1);
insert into instrument (instrument_type_id) values (6);
insert into instrument (instrument_type_id) values (6);
insert into instrument (instrument_type_id) values (1);
insert into instrument (instrument_type_id) values (7);
insert into instrument (instrument_type_id) values (5);
insert into instrument (instrument_type_id) values (7);
insert into instrument (instrument_type_id) values (7);
insert into instrument (instrument_type_id) values (2);


INSERT INTO rental_service(student_id, instrument_id, start_date, end_date) VALUES (10, 3, '2023-10-13 00:00:00', '2023-11-13 00:00:00');