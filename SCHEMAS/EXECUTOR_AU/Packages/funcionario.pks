CREATE OR REPLACE PACKAGE executor_au.funcionario IS
    FUNCTION funcionario_get(cd_funcionario IN NUMBER NULL,
                             cd_pessoa IN NUMBER NULL,
                             no_completo IN VARCHAR2(100) NULL,
                             dt_nascimento IN VARCHAR2(200) NULL,
                             cd_genero IN NUMBER NULL,
                             cd_rgc IN NUMBER NULL,
                             nu_telefone IN VARCHAR2(20) NULL,
                             ds_email IN VARCHAR2(100) NULL,
                             ds_endereco IN VARCHAR2(200) NULL) RETURN CLOB;

    FUNCTION funcionario_post(cd_funcionario IN NUMBER NULL,
                              cd_pessoa IN NUMBER NULL,
                              no_completo IN VARCHAR2(100) NOT NULL,
                              dt_nascimento IN VARCHAR2(200) NOT NULL,
                              cd_genero IN NUMBER NOT NULL,
                              cd_rgc IN NUMBER NULL,
                              nu_telefone IN VARCHAR2(20) NULL,
                              ds_email IN VARCHAR2(100) NULL,
                              ds_endereco IN VARCHAR2(200) NULL) RETURN CLOB;

    FUNCTION funcionario_put(cd_funcionario IN NUMBER NOT NULL,
                             cd_pessoa IN NUMBER NULL,
                             no_completo IN VARCHAR2(100) NULL,
                             dt_nascimento IN VARCHAR2(200) NULL,
                             cd_genero IN NUMBER NULL,
                             cd_rgc IN NUMBER NULL,
                             nu_telefone IN VARCHAR2(20) NULL,
                             ds_email IN VARCHAR2(100) NULL,
                             ds_endereco IN VARCHAR2(200) NULL) RETURN CLOB;

    FUNCTION funcionario_delete(cd_funcionario IN NUMBER NULL) IS CLOB;

END;
/