---CREAR PROCEDIMIENTO ALMACENADO SP(STORED PROCEDURE) OBTENER EL NOMBRE DE LAS CATEGORIAS E IMPRIMIR EL VALOR OBTENIDO
---EL ONMBRE SE DEBE OBTENER DE LA CATEGORIA =2

CREATE OR REPLACE PROCEDURE SP_OBTENER_NOMB_CAT (IDCAT IN NUMBER)
IS
    NOMBRE_CAT CATEGORIES.CATEGORY_NAME%TYPE;
BEGIN
    SELECT CATEGORIES.CATEGORY_NAME INTO NOMBRE_CAT FROM CATEGORIES WHERE CATEGORY_ID=IDCAT;
    DBMS_OUTPUT.PUT_LINE('EL NOMBRE DE LA CATEGORIA ES: '||NOMBRE_CAT);
END;

EXECUTE SP_OBTENER_NOMB_CAT(2);

BEGIN   
    SP_OBTENER_NOMB_CAT(2);
END;