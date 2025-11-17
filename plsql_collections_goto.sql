

-- =============================================
-- 1. GOTO 
-- =============================================
DECLARE
    counter NUMBER := 1;
BEGIN
    <<start_loop>>
    DBMS_OUTPUT.PUT_LINE('Counter: ' || counter);
    counter := counter + 1;

    IF counter <= 5 THEN
        GOTO start_loop;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Loop finished using GOTO.');
END;
/

-- =============================================
-- 2. Combined : Collections + GOTO
-- =============================================
DECLARE
    TYPE name_nt IS TABLE OF VARCHAR2(50);
    names_list name_nt := name_nt('Alice', 'Bob', 'Carlos');

    i NUMBER := 1;
BEGIN
    <<loop_here>>
    IF i > names_list.COUNT THEN
        GOTO end_label;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Name: ' || names_list(i));

    i := i + 1;
    GOTO loop_here;

    <<end_label>>
    DBMS_OUTPUT.PUT_LINE('Completed Collection + GOTO .');
END;
/
