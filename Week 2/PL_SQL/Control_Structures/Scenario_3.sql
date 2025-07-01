DECLARE
    CURSOR loan_cursor IS
        SELECT l.loan_id, c.customer_name, l.due_date
        FROM loans l
        JOIN customers c ON l.customer_id = c.customer_id
        WHERE l.due_date BETWEEN SYSDATE AND SYSDATE + 30; -- Due in next 30 days
BEGIN
    FOR loan_rec IN loan_cursor LOOP
        -- Print reminder message
        DBMS_OUTPUT.PUT_LINE('Reminder: Customer ' || loan_rec.customer_name || 
                            ', your loan (ID: ' || loan_rec.loan_id || 
                            ') is due on ' || TO_CHAR(loan_rec.due_date, 'DD-MON-YYYY') || '.');
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Loan reminders sent successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
