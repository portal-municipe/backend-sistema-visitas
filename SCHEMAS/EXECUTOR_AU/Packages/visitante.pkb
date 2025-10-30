CREATE OR REPLACE PACKAGE BODY executor_au.visitante IS

FUNCTION visitante_get(cd_visitante IN NUMBER NULL,
                         cd_pessoa IN NUMBER,
                         no_empresa_origem IN VARCHAR2(100),
                         tp_documento_identificacao IN VARCHAR2(30),
                         ds_observacao IN VARCHAR2(200)
                         ) IS CLOB
BEGIN
RETURN NULL;
END visitante_get;

FUNCTION visitante_post(cd_visitante IN NUMBER,
                            cd_pessoa IN NUMBER,
                            no_empresa_origem IN VARCHAR2(100),
                            tp_documento_identificacao IN VARCHAR2(30) DEFAULT 'BI',
                            ds_observacao IN VARCHAR2(200)
                         ) IS CLOB
BEGIN
RETURN NULL;
END visitante_post;

FUNCTION visitante_put(cd_visitante IN NUMBER,
                       cd_pessoa IN NUMBER,
                       no_empresa_origem IN VARCHAR2(100),
                       tp_documento_identificacao IN VARCHAR2(30),
                       ds_observacao IN VARCHAR2(200)
                       ) IS CLOB
BEGIN
RETURN NULL;
END visitante_put;

FUNCTION visitante_delete(cd_visitante IN NUMBER NULL) IS CLOB
BEGIN
RETURN NULL;
END visitante_delete;
END;