DECLARE
    CURSOR customer_cursor IS
        SELECT c.customer_id, c.age, l.loan_id, l.interest_rate
        FROM customers c
        JOIN loans l ON c.customer_id = l.customer_id;
    
    v_discount_rate NUMBER := 0.01; -- 1% discount
BEGIN
    FOR customer_rec IN customer_cursor LOOP
        IF customer_rec.age > 60 THEN
            -- Apply 1% discount to the interest rate
            UPDATE loans
            SET interest_rate = interest_rate - v_discount_rate
            WHERE loan_id = customer_rec.loan_id;
            
            DBMS_OUTPUT.PUT_LINE('Applied 1% discount to customer ' || customer_rec.customer_id);
        END IF;
    END LOOP;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Discount applied successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END;
/