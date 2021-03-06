CREATE OR REPLACE FUNCTION FN_INF_ORDER_CLIENTES
RETURN SYS_REFCURSOR

IS
    CDATOS SYS_REFCURSOR;

BEGIN
    OPEN CDATOS FOR SELECT ORDERS.ORDER_ID, ORDERS.ORDER_DATE, 
    TO_TIMESTAMP(ORDERS.SHIPPED_DATE,'YYYYMMDD'),
    ORDERS.SHIPPED_DATE,
    CUSTOMERS.CUSTOMER_ID, CUSTOMERS.FIRST_NAME , CUSTOMERS.LAST_NAME FROM ORDERS INNER JOIN CUSTOMERS
    ON ORDERS.CUSTOMER_ID = CUSTOMERS.CUSTOMER_ID;

    RETURN CDATOS;
END;



DECLARE

    DATOS_CAT SYS_REFCURSOR;

    ORDER_ID ORDERS.ORDER_ID%TYPE;
    ORDER_DATE ORDERS.ORDER_DATE%TYPE;
    SHIPPED_DATE ORDERS.SHIPPED_DATE%TYPE;
    CUSTOMER_ID CUSTOMERS.CUSTOMER_ID%TYPE;
    FIRST_NAME CUSTOMERS.FIRST_NAME%TYPE;
    LAST_NAME CUSTOMERS.LAST_NAME%TYPE;

BEGIN
    DATOS_CAT := FN_INF_ORDER_CLIENTES;

    LOOP
        FETCH DATOS_CAT INTO ORDER_ID ,ORDER_DATE, SHIPPED_DATE, CUSTOMER_ID, FIRST_NAME, LAST_NAME;
        EXIT WHEN DATOS_CAT%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('EL ID DE LA ORDEN ES: '||ORDER_ID);
        DBMS_OUTPUT.PUT_LINE('LA FECHA DE ENVIO DE LA ORDEN ES: '||SHIPPED_DATE);
        DBMS_OUTPUT.PUT_LINE('EL ID DEL CLIENTE: '||CUSTOMER_ID);
        DBMS_OUTPUT.PUT_LINE('EL NOMBRE DEL CLIENTE: '||FIRST_NAME);
        DBMS_OUTPUT.PUT_LINE('EL APELLIDO DEL CLIENTE ES: '||LAST_NAME);
        DBMS_OUTPUT.PUT_LINE(CHR(13));
    END LOOP;

END;


-----otro bloque anonimo para mostar los resultados.

DECLARE
    DATOS_CAT SYS_REFCURSOR;

    TYPE FILA IS RECORD(    
    ORDER_ID ORDERS.ORDER_ID%TYPE,
    ORDER_DATE ORDERS.ORDER_DATE%TYPE,
    SHIPPED_DATE ORDERS.SHIPPED_DATE%TYPE,
    CUSTOMER_ID CUSTOMERS.CUSTOMER_ID%TYPE,
    FIRST_NAME CUSTOMERS.FIRST_NAME%TYPE,
    LAST_NAME CUSTOMERS.LAST_NAME%TYPE
    );

    REGISTRO FILA;
BEGIN   
    DATOS_CAT := FN_INF_ORDER_CLIENTES;

    LOOP    
        FETCH DATOS_CAT INTO REGISTRO;
        EXIT WHEN DATOS_CAT%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('EL ID DE LA ORDEN ES: '||REGISTRO.ORDER_ID);
        DBMS_OUTPUT.PUT_LINE('LA FECHA DE ENVIO DE LA ORDEN ES: '||REGISTRO.SHIPPED_DATE);
        DBMS_OUTPUT.PUT_LINE('EL ID DEL CLIENTE: '||REGISTRO.CUSTOMER_ID);
        DBMS_OUTPUT.PUT_LINE('EL NOMBRE DEL CLIENTE: '||REGISTRO.FIRST_NAME);
        DBMS_OUTPUT.PUT_LINE('EL APELLIDO DEL CLIENTE ES: '||REGISTRO.LAST_NAME);
        DBMS_OUTPUT.PUT_LINE(CHR(13));
    END LOOP;

END;



----fecha modificada

DECLARE
    DATOS_CAT SYS_REFCURSOR;

    TYPE FILA IS RECORD(    
    ORDER_ID ORDERS.ORDER_ID%TYPE,
    ORDER_DATE ORDERS.ORDER_DATE%TYPE,
    SHIPPED_DATE TIMESTAMP,
    CUSTOMER_ID CUSTOMERS.CUSTOMER_ID%TYPE,
    FIRST_NAME CUSTOMERS.FIRST_NAME%TYPE,
    LAST_NAME CUSTOMERS.LAST_NAME%TYPE
    );

    REGISTRO FILA;
BEGIN   
    DATOS_CAT := FN_INF_ORDER_CLIENTES;

    LOOP    
        FETCH DATOS_CAT INTO REGISTRO;
        EXIT WHEN DATOS_CAT%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('EL ID DE LA ORDEN ES: '||REGISTRO.ORDER_ID);
        DBMS_OUTPUT.PUT_LINE('LA FECHA DE ENVIO DE LA ORDEN ES: '||REGISTRO.SHIPPED_DATE);
        DBMS_OUTPUT.PUT_LINE('EL ID DEL CLIENTE: '||REGISTRO.CUSTOMER_ID);
        DBMS_OUTPUT.PUT_LINE('EL NOMBRE DEL CLIENTE: '||REGISTRO.FIRST_NAME);
        DBMS_OUTPUT.PUT_LINE('EL APELLIDO DEL CLIENTE ES: '||REGISTRO.LAST_NAME);
        DBMS_OUTPUT.PUT_LINE(CHR(13));
    END LOOP;

END;
