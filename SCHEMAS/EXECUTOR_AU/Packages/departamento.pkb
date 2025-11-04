CREATE OR REPLACE PACKAGE BODY executor_au.departamento IS

  FUNCTION departamento_get(cd_departamento IN NUMBER NULL,
                            no_departamento IN VARCHAR2(100) NULL,
                            ds_departamento IN VARCHAR2(200) NULL) IS CLOB
   BEGIN

   RETURN NULL;

   END departamento_get;

   FUNCTION departamento_post(cd_departamento IN NUMBER NULL,
                              no_departamento IN VARCHAR2(100) NOT NULL,
                              ds_departamento IN VARCHAR2(200) NULL) IS CLOB
    BEGIN

    RETURN NULL;
    END departamento_post;

   FUNCTION departamento_put(cd_departamento IN NUMBER NULL,
                             no_departamento IN VARCHAR2(100) NOT NULL,
                             ds_departamento IN VARCHAR2(200) NULL) IS CLOB
    BEGIN

    RETURN NULL;
    END departamento_put;

   FUNCTION departamento_delete(cd_departamento IN NUMBER NULL) IS CLOB
    BEGIN
    RETURN NULL;
    END departamento_delete;

END;