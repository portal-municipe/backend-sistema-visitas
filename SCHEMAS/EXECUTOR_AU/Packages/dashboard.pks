CREATE OR REPLACE PACKAGE executor_au.dashboard IS

    FUNCTION dashboard_getVisitantesHoje(dt_hora_entrada IN TIMESTAMP NULL,
                                        dt_hora_saida IN TIMESTAMP NULL,
                                        cd_visitante IN NUMBER NULL,
                                        cd_funcionario_responsavel IN NUMBER NULL,
                                        cd_area IN NUMBER NULL,
                                        cd_tipo_visita IN NUMBER NULL) RETURN CLOB;

    FUNCTION dashboard_getVisitantesRecentes(dt_visita IN DATE NULL,
                                            dt_hora_entrada IN TIMESTAMP NULL,
                                            dt_hora_saida IN TIMESTAMP NULL,
                                            cd_visitante IN NUMBER NULL,
                                            cd_funcionario_responsavel IN NUMBER NULL,
                                            cd_area IN NUMBER NULL,
                                            cd_tipo_visita IN NUMBER NULL) RETURN CLOB;

    FUNCTION dashboard_getVisitantesDepartamento(cd_departamento IN NUMBER,
                                                dt_visita IN DATE NULL,
                                                dt_hora_entrada IN TIMESTAMP NULL,
                                                dt_hora_saida IN TIMESTAMP NULL,
                                                cd_visitante IN NUMBER NULL,
                                                cd_funcionario_responsavel IN NUMBER NULL,
                                                cd_area IN NUMBER NULL,
                                                cd_tipo_visita IN NUMBER NULL) RETURN CLOB;

END;
/