ALTER TABLE locations
    ADD department_amount NUMBER(6);
COMMENT ON COLUMN locations.department_amount IS 'Contains the amount of departments in the location';

CREATE OR REPLACE TRIGGER trg_loc
    AFTER INSERT OR DELETE
    ON departments
DECLARE
BEGIN
    MERGE INTO locations t
    USING (SELECT count(department_id) as dpt_amount, location_id as loc_id
           FROM departments b
           GROUP BY location_id) s
    ON (t.location_id = s.loc_id)
    WHEN MATCHED THEN
        UPDATE SET t.department_amount = s.dpt_amount;
END;