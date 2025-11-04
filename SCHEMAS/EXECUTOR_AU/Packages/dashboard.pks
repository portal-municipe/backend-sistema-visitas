CREATE OR REPLACE PACKAGE executor_au.dashboard IS

    FUNCTION dashboardVisitantesHoje_get(dt_hora_entrada IN TIMESTAMP NULL,
                                        dt_hora_saida IN TIMESTAMP NULL,
                                        cd_visitante IN NUMBER NULL,
                                        cd_funcionario_responsavel IN NUMBER NULL,
                                        cd_area IN NUMBER NULL,
                                        cd_tipo_visita IN NUMBER NULL) RETURN CLOB;

    FUNCTION dashboardVisitantesRecentes_get(dt_visita IN DATE NULL,
                                            dt_hora_entrada IN TIMESTAMP NULL,
                                            dt_hora_saida IN TIMESTAMP NULL,
                                            cd_visitante IN NUMBER NULL,
                                            cd_funcionario_responsavel IN NUMBER NULL,
                                            cd_area IN NUMBER NULL,
                                            cd_tipo_visita IN NUMBER NULL) RETURN CLOB;

    FUNCTION dashboardVisitantesDepartamento_get(cd_departamento IN NUMBER,
                                                dt_visita IN DATE NULL,
                                                dt_hora_entrada IN TIMESTAMP NULL,
                                                dt_hora_saida IN TIMESTAMP NULL,
                                                cd_visitante IN NUMBER NULL,
                                                cd_funcionario_responsavel IN NUMBER NULL,
                                                cd_area IN NUMBER NULL,
                                                cd_tipo_visita IN NUMBER NULL) RETURN CLOB;

END;
/