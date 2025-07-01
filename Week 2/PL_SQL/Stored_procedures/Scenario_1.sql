CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest AS
    v_interest_rate NUMBER := 0.01; -- 1% monthly interest
BEGIN
    -- Update all savings accounts with 1% interest
    UPDATE savings_accounts
    SET balance = balance * (1 + v_interest_rate);
    
    DBMS_OUTPUT.PUT_LINE('Monthly interest processed successfully.');
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error processing interest: ' || SQLERRM);
        ROLLBACK;
END ProcessMonthlyInterest;
/