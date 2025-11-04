CREATE OR REPLACE PACKAGE executor_au.area IS
    FUNCTION area_get(cd_area IN NUMBER NULL,
                      no_area IN VARCHAR2(50) NULL,
                      ds_area IN VARCHAR2(200)  NULL,
                      cd_departamento NUMBER NULL) RETURN CLOB;

    FUNCTION area_post(cd_area IN NUMBER NULL,
                      no_area IN VARCHAR2(50) NOT NULL,
                      ds_area IN VARCHAR2(200)  NULL,
                      cd_departamento NUMBER NULL) RETURN CLOB;

    FUNCTION area_put(cd_area IN NUMBER NULL,
                      no_area IN VARCHAR2(50) NOT NULL,
                      ds_area IN VARCHAR2(200)  NULL,
                      cd_departamento NUMBER NULL) RETURN CLOB;

    FUNCTION area_delete(cd_area IN NUMBER NULL) IS CLOB;
END;
/