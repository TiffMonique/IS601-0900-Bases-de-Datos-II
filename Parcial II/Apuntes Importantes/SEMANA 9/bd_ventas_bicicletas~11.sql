CREATE OR REPLACE FUNCTION FN_NOMBRE_CATEGORIAS(ID_CAT NUMBER)
RETURN VARCHAR2
IS
    NOMBRE_CATEGORIA CATEGORIES.CATEGORY_NAME%TYPE;
BEGIN
    SELECT CATEGORY_NAME INTO NOMBRE_CATEGORIA FROM CATEGORIES WHERE CATEGORY_ID=ID_CAT;  
    
    RETURN NOMBRE_CATEGORIA;
END;



DECLARE
    NOMBRE CATEGORIES.CATEGORY_NAME%TYPE;
BEGIN
    NOMBRE:=FN_NOMBRE_CATEGORIA2(4);
    DBMS_OUTPUT.PUT_LINE('EL NOMBRE DE LA CATEGORIA ES: '||NOMBRE);
END;


