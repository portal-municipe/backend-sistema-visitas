CREATE OR REPLACE PACKAGE BODY executor_au.area IS
  FUNCTION area_get(cd_area IN NUMBER NULL,
                     no_area IN VARCHAR2(50)  NULL,
                     ds_area IN VARCHAR2(200)  NULL,
                     cd_departamento NUMBER NULL) IS CLOB
   BEGIN
   RETURN NULL;
   END area_get;

   FUNCTION area_post(cd_area IN NUMBER NULL,
                     no_area IN VARCHAR2(50) NOT NULL,
                     ds_area IN VARCHAR2(200)  NULL,
                     cd_departamento NUMBER NULL) IS CLOB
    BEGIN
    RETURN NULL;
    END area_post;

   FUNCTION area_put(cd_area IN NUMBER NULL,
                     no_area IN VARCHAR2(50) NOT NULL,
                     ds_area IN VARCHAR2(200)  NULL,
                     cd_departamento NUMBER NULL) IS CLOB
    BEGIN
    RETURN NULL;
    END area_put;

   FUNCTION area_delete(cd_area IN NUMBER NULL) IS CLOB
    BEGIN
    RETURN NULL;
    END area_delete;
END;