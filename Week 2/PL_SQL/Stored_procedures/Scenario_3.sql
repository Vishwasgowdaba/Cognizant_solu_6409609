CREATE OR REPLACE PROCEDURE TransferFunds(
    p_from_account IN NUMBER,
    p_to_account IN NUMBER,
    p_amount IN NUMBER
) AS
    v_source_balance NUMBER;
BEGIN
    -- Check if source account has sufficient balance
    SELECT balance INTO v_source_balance
    FROM accounts
    WHERE account_id = p_from_account
    FOR UPDATE; -- Lock the row to prevent concurrent updates
    
    IF v_source_balance >= p_amount THEN
        -- Deduct from source account
        UPDATE accounts
        SET balance = balance - p_amount
        WHERE account_id = p_from_account;
        
        -- Add to destination account
        UPDATE accounts
        SET balance = balance + p_amount
        WHERE account_id = p_to_account;
        
        DBMS_OUTPUT.PUT_LINE('Transfer of ' || p_amount || ' completed successfully.');
        COMMIT;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Insufficient balance in source account.');
        ROLLBACK;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Account not found.');
        ROLLBACK;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error during transfer: ' || SQLERRM);
        ROLLBACK;
END TransferFunds;
/