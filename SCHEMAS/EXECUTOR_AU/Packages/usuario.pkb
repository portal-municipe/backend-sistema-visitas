CREATE OR REPLACE PACKAGE BODY executor_au.usuario IS
  FUNCTION usuario_get(cd_usuario IN NUMBER NULL,
                       username IN VARCHAR2(50) NULL,
                       senha_hash IN VARCHAR2(200) NULL,
                       perfil_acesso IN VARCHAR2(50),
                       estado_conta IN VARCHAR2(10),
                       CD_pessoa NUMBER) IS CLOB
   BEGIN
   RETURN NULL;
   END usuario_get;

   FUNCTION usuario_post(cd_usuario IN NUMBER NULL,
                          username IN VARCHAR2(50) NOT NULL,
                          senha_hash IN VARCHAR2(200) NOT NULL,
                          perfil_acesso IN VARCHAR2(50) NOT NULL,
                          estado_conta IN VARCHAR2(10) DEFAULT 'Ativo',
                          CD_pessoa NUMBER NULL) IS CLOB
    BEGIN
    RETURN NULL;
    END usuario_post;

   FUNCTION usuario_put(cd_usuario IN NUMBER NULL,
                          username IN VARCHAR2(50) NOT NULL,
                          senha_hash IN VARCHAR2(200) NULL,
                          perfil_acesso IN VARCHAR2(50),
                          estado_conta IN VARCHAR2(10),
                          CD_pessoa NUMBER) IS CLOB
    BEGIN
    RETURN NULL;
    END usuario_put;

   FUNCTION usuario_delete(cd_usuario IN NUMBER NULL) IS CLOB
    BEGIN
    RETURN NULL;
    END usuario_delete;
END;