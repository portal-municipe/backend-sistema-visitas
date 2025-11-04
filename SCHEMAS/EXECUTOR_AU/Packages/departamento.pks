CREATE OR REPLACE PACKAGE executor_au.departamento IS
    FUNCTION departamento_get(cd_departamento IN NUMBER NULL,
                              no_departamento IN VARCHAR2(100) NULL,
                              ds_departamento IN VARCHAR2(200) NULL) RETURN CLOB;

    FUNCTION departamento_post(cd_departamento IN NUMBER NULL,
                              no_departamento IN VARCHAR2(100) NOT NULL,
                              ds_departamento IN VARCHAR2(200) NULL) RETURN CLOB;

    FUNCTION departamento_put(cd_departamento IN NUMBER NOT NULL,
                              no_departamento IN VARCHAR2(100) NOT NULL,
                              ds_departamento IN VARCHAR2(200) NULL) RETURN CLOB;

    FUNCTION departamento_delete(cd_departamento IN NUMBER NULL) IS CLOB;

END;
/