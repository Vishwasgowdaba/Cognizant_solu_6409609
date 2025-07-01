DECLARE
    CURSOR customer_cursor IS
        SELECT customer_id, balance
        FROM customers
        WHERE balance > 10000;
    
    v_vip_status VARCHAR2(3) := 'YES'; -- Set VIP flag to 'YES'
BEGIN
    FOR customer_rec IN customer_cursor LOOP
        -- Update VIP status for customers with balance > $10,000
        UPDATE customers
        SET is_vip = v_vip_status
        WHERE customer_id = customer_rec.customer_id;
        
        DBMS_OUTPUT.PUT_LINE('Promoted customer ' || customer_rec.customer_id || ' to VIP.');
    END LOOP;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('VIP promotions updated successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END;
