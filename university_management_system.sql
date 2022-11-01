
CREATE TABLE COURSE (
  course_number int(11) NOT NULL,
  course_name varchar(20) NOT NULL,
  dept_number int(11) NOT NULL,
  instructor_id int(11) NOT NULL,
  hrs_per_week int(11) NOT NULL
)
CREATE TABLE DEPARTMENT (
  dept_number int(11) NOT NULL,
  department_name varchar(20) NOT NULL
)
INSERT INTO DEPARTMENT (dept_number, department_name) VALUES
(1, 'computer_engineering');

CREATE TABLE HEAD (
  dept_number int(11) NOT NULL,
  head int(11) NOT NULL
)
INSERT INTO HEAD (dept_number, head) VALUES
(1, 2);

CREATE TABLE INSTRUCTOR (
  instructor_id int(11) NOT NULL,
  payscale int(11) NOT NULL,
  passhash varchar(15) NOT NULL,
  dept_number int(11) NOT NULL,
  person_id int(11) NOT NULL
)
INSERT INTO INSTRUCTOR (instructor_id, payscale, passhash, dept_number, person_id) VALUES
(1, 100000, 'abc@123', 1, 2);

CREATE TABLE PERSON (
  person_id int(11) NOT NULL,
  first_name varchar(20) NOT NULL,
  middle_name varchar(20) NOT NULL,
  last_name varchar(20) NOT NULL,
  date_of_birth date NOT NULL,
  gender varchar(10) NOT NULL
)
INSERT INTO PERSON (person_id, first_name, middle_name, last_name, date_of_birth, gender) VALUES
(1, 'dhrumil', 'bharatbhai', 'patel', '2004-07-30', 'male'),
(2, 'harsh', '', 'gajera', '2003-04-20', 'male'),
(3, 'abc', 'pqr', 'xyz', '1999-12-12', 'male');

CREATE TABLE PHONE_DETAILS (
  person_id int(11) NOT NULL,
  phone_number varchar(20) NOT NULL
)
INSERT INTO PHONE_DETAILS (person_id, phone_number) VALUES
(1, '9999955554');

CREATE TABLE STUDENT (
  student_id int(11) NOT NULL,
  passhash varchar(15) NOT NULL,
  person_id int(11) NOT NULL
)
INSERT INTO STUDENT (student_id, passhash, person_id) VALUES
(1, 'hell@1', 1);

CREATE TABLE STUDENT_OF_COURSE (
  course_number int(11) NOT NULL,
  student_id int(11) NOT NULL,
  marks int(11) NOT NULL,
  attendance int(11) NOT NULL
)

ALTER TABLE COURSE
  ADD PRIMARY KEY (course_number),
  ADD UNIQUE KEY dept_number (dept_number,instructor_id),
  ADD KEY instructor_id (instructor_id);

ALTER TABLE DEPARTMENT
  ADD PRIMARY KEY (dept_number);

ALTER TABLE HEAD
  ADD PRIMARY KEY (dept_number);

ALTER TABLE INSTRUCTOR
  ADD PRIMARY KEY (instructor_id),
  ADD KEY dept_number (dept_number),
  ADD KEY person_id (person_id);

ALTER TABLE PERSON
  ADD PRIMARY KEY (person_id);

ALTER TABLE PHONE_DETAILS
  ADD KEY person_id (person_id);

ALTER TABLE STUDENT
  ADD PRIMARY KEY (student_id),
  ADD KEY person_id (person_id);

ALTER TABLE STUDENT_OF_COURSE
  ADD KEY course_number (course_number),
  ADD KEY student_id (student_id);


ALTER TABLE COURSE
  ADD CONSTRAINT COURSE_ibfk_1 FOREIGN KEY (dept_number) REFERENCES DEPARTMENT (dept_number),
  ADD CONSTRAINT COURSE_ibfk_2 FOREIGN KEY (instructor_id) REFERENCES INSTRUCTOR (instructor_id);

ALTER TABLE HEAD
  ADD CONSTRAINT HEAD_ibfk_1 FOREIGN KEY (dept_number) REFERENCES DEPARTMENT (dept_number) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE INSTRUCTOR
  ADD CONSTRAINT INSTRUCTOR_ibfk_1 FOREIGN KEY (dept_number) REFERENCES DEPARTMENT (dept_number),
  ADD CONSTRAINT INSTRUCTOR_ibfk_2 FOREIGN KEY (person_id) REFERENCES PERSON (person_id);

ALTER TABLE PHONE_DETAILS
  ADD CONSTRAINT PHONE_DETAILS_ibfk_1 FOREIGN KEY (person_id) REFERENCES PERSON (person_id);

ALTER TABLE STUDENT
  ADD CONSTRAINT STUDENT_ibfk_1 FOREIGN KEY (person_id) REFERENCES PERSON (person_id);

ALTER TABLE STUDENT_OF_COURSE
  ADD CONSTRAINT STUDENT_OF_COURSE_ibfk_1 FOREIGN KEY (course_number) REFERENCES COURSE (course_number),
  ADD CONSTRAINT STUDENT_OF_COURSE_ibfk_2 FOREIGN KEY (student_id) REFERENCES STUDENT (student_id);
COMMIT;
