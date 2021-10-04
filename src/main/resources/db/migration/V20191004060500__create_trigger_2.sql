CREATE TABLE employment_logs
(
    employment_log_id NUMBER(6) PRIMARY KEY,
    first_name        varchar(20) NOT NULL,
    last_name         varchar(20) NOT NULL,
    employment_action varchar(20) NOT NULL,
    CONSTRAINT employment_action_chk CHECK (employment_action = 'HIRED' OR employment_action = 'FIRED')
);

CREATE PROCEDURE insertLogProcedure(log_id NUMBER, first_name VARCHAR2(20), last_name varchar(20),
                                    employment_action varchar(20))
    IS
BEGIN
    INSERT INTO employment_logs(employment_log_id, first_name, last_name, employment_action)
    VALUES (log_id, first_name, last_name, employment_action);
END;