CREATE OR REPLACE PROCEDURE SP_OBTENER_NOMB_CAT (IDCAT IN NUMBER, NOMBRE_CAT IN OUT CATEGORIES.CATEGORY_NAME%TYPE)

IS

BEGIN
    SELECT CATEGORIES.CATEGORY_NAME INTO NOMBRE_CAT FROM CATEGORIES WHERE CATEGORY_ID=IDCAT;
    
END;



DECLARE
    NOMBRE_CATEGORIA CATEGORIES.CATEGORY_NAME%TYPE:='VALOR ANTES DE LLAMAR AL SP';

BEGIN
    DBMS_OUTPUT.PUT_LINE('EL NOMBRE DE LA CATEGORIA ES: '||NOMBRE_CATEGORIA);
    SP_OBTENER_NOMB_CAT(2, NOMBRE_CATEGORIA);
    DBMS_OUTPUT.PUT_LINE('EL NOMBRE DE LA CATEGORIA ES: '||NOMBRE_CATEGORIA);
END;