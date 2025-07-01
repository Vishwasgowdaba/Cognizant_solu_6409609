CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_department_id IN NUMBER,
    p_bonus_percentage IN NUMBER
) AS
BEGIN
    -- Update salary by adding bonus percentage for employees in the given department
    UPDATE employees
    SET salary = salary * (1 + p_bonus_percentage / 100)
    WHERE department_id = p_department_id;
    
    DBMS_OUTPUT.PUT_LINE('Bonus applied to department ' || p_department_id || ' successfully.');
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating bonus: ' || SQLERRM);
        ROLLBACK;
END UpdateEmployeeBonus;
/