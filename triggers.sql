
-- syntax for creating a trigger function.
CREATE FUNCTION trigger_function() RETURN trigger AS

-- syntax for creating a trigger.
CREATE TRIGGER trigger_name {BEFORE | AFTER | INSTEAD OF} {event [OR ...]}
ON table_name
[FOR [EACH] {ROW | STATEMENT}]
EXECUTE PROCEDURE trigger_function



-- Triggers and trigger functions example.
CREATE TABLE employees(
  id int4 serial primary key,
  first_name varchar(40) NOT NULL,
  last_name varchar(40) NOT NULL
);


CREATE TABLE employee_audits (
  id int4 serial primary key,
  employee_id int4 NOT NULL,
  last_name varchar(40) NOT NULL,
  changed_on timestamp(6) NOT NULL
)

-- A trigger function to log last name chaes abd
CREATE OR REPLACE FUNCTION log_last_name_changes()
 RETURNS trigger AS
$BODY$
BEGIN
IF NEW.last_name <> OLD.last_name THEN
INSERT INTO employee_audits(employee_id,last_name,changed_on)
VALUES(OLD.id,OLD.last_name,now());
END IF;

RETURN NEW;
END;
$BODY$

-- INSTEAD trigger to run before UPDATE
CREATE TRIGGER last_name_changes
 BEFORE UPDATE
 ON employees
 FOR EACH ROW
 EXECUTE PROCEDURE log_last_name_changes();

 INSERT INTO employees (first_name, last_name)
 VALUES ('John', 'Doe');

 INSERT INTO employees (first_name, last_name)
 VALUES ('Lily', 'Bush');

 UPDATE employees
 SET last_name = 'Brown'
 WHERE ID = 2;

SELECT * FROM employee_audits;
