CREATE OR REPLACE PACKAGE executor_au.usuario IS
    FUNCTION usuario_get(cd_usuario IN NUMBER NULL,
                          username IN VARCHAR2(50) NULL,
                          senha_hash IN VARCHAR2(200) NOT NULL,
                          perfil_acesso IN VARCHAR2(50),
                          estado_conta IN VARCHAR2(10),
                          CD_pessoa NUMBER) RETURN CLOB;

    FUNCTION usuario_post(cd_usuario IN NUMBER NULL,
                          username IN VARCHAR2(50) NOT NULL,
                          senha_hash IN VARCHAR2(200) NOT NULL,
                          perfil_acesso IN VARCHAR2(50) NULL,
                          estado_conta IN VARCHAR2(10) DEFAULT 'Ativo',
                          CD_pessoa NUMBER NULL) RETURN CLOB;

    FUNCTION usuario_put(cd_usuario IN NUMBER NULL,
                          username IN VARCHAR2(50) NOT NULL,
                          senha_hash IN VARCHAR2(200) NOT NULL,
                          perfil_acesso IN VARCHAR2(50) NULL,
                          estado_conta IN VARCHAR2(10) NULL,
                          CD_pessoa NUMBER NULL) RETURN CLOB;

    FUNCTION usuario_delete(cd_usuario IN NUMBER NULL) IS CLOB;
END;
/