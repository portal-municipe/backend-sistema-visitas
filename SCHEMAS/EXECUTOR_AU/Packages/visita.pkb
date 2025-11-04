CREATE OR REPLACE PACKAGE BODY executor_au.visita IS

FUNCTION visita_get(cd_visita IN NUMBER NULL,
                        dt_visita IN VARCHAR2(50) NULL,
                        dt_hora_entrada IN VARCHAR2(50)  NULL,
                        dt_hora_saida IN VARCHAR2(50)  NULL,
                        ds_observacao IN VARCHAR2(200)  NULL,
                        cd_visitante NUMBER NULL,
                        cd_funcionario_responsavel NUMBER NULL,
                        cd_area NUMBER NULL,
                        cd_tipo_visita NUMBER NULL,
                        cd_area NUMBER NULL
                         ) IS CLOB
BEGIN
RETURN NULL;
END visita_get;

FUNCTION visita_post(cd_visita IN NUMBER,
                        dt_visita IN VARCHAR2(50) NULL,
                        dt_hora_entrada IN VARCHAR2(50)  NULL,
                        dt_hora_saida IN VARCHAR2(50)  NULL,
                        ds_observacao IN VARCHAR2(200)  NULL,
                        cd_visitante NUMBER NULL,
                        cd_funcionario_responsavel NUMBER NULL,
                        cd_area NUMBER NULL,
                        cd_tipo_visita NUMBER NULL,
                        cd_area NUMBER NULL
                         ) IS CLOB
BEGIN
RETURN NULL;
END visita_post;

FUNCTION visita_put(cd_visita IN NUMBER,
                        dt_visita IN VARCHAR2(50) NULL,
                        dt_hora_entrada IN VARCHAR2(50)  NULL,
                        dt_hora_saida IN VARCHAR2(50)  NULL,
                        ds_observacao IN VARCHAR2(200)  NULL,
                        cd_visitante NUMBER NULL,
                        cd_funcionario_responsavel NUMBER NULL,
                        cd_area NUMBER NULL,
                        cd_tipo_visita NUMBER NULL,
                        cd_area NUMBER NULL
                       ) IS CLOB
BEGIN
RETURN NULL;
END visita_put;

FUNCTION visita_delete(cd_visita IN NUMBER NULL) IS CLOB
BEGIN
RETURN NULL;
END visita_delete;
END;