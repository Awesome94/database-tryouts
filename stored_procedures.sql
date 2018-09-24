-- Stored procedures are procedural languages that extend SQL Standard.
CREATE FUNCTION inc(val integer)
-- CREATE FUNCTION <Function-name>(param type, ...)
RETURNS integer as
-- add a RETURN Type
BEGIN
RETURN val + 1;
-- logic
END; $$
LANGUAGE PLPGSQL
-- procedural language used.

FUNCTION PARAMETERS.
INOUT
IN
OUT

IN PARAMETER
-- by default, the parameter type of any parameter in postgresQL is the IN parameter.
CREATE OR REPLACE FUNCTION get_sum(
    a NUMERIC,
    b NUMERIC)
RETURNS NUMERIC AS $$
BEGIN
    RETURN a + b
END; $$
LANGUAGE PLPGSQL;

OUT PARAMETER.
CREATE OR REPLACE FUNCTION hi_lo(
    a NUMERIC,
    b NUMERIC,
    c NUMERIC,
    OUT hi NUMERIC,
    OUT lo NUMERIC)
AS $$
BEGIN
hi := GREATEST(a, b, c);
lo := LEAST(a, b, c);
-- We can use the OUT parameter as a substitute for the Return statement.
END; $$
LANGUAGE PLPGSQL;
-- Three IN parameters a, b,c
-- Two OUT parameters hi and lo

INOUT PARAMETERS.
CREATE OR REPLACE FUNCTION square(
 INOUT a NUMERIC)
AS $$
BEGIN
 a := a * a;
END; $$
LANGUAGE plpgsql;
-- 
