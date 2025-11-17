Alter Session set current_schema = 'gvt';


PROMPT Creating API Package Specification for Table 'TB_VISITA'
--------------------------------------------------------------------------------
-- Name:        cg$TB_VISITA
-- Description: TB_VISITA table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE gvt.cg$TB_VISITA IS
  cg$row TB_VISITA%ROWTYPE;

  --TB_VISITA row type variable
  TYPE cg$row_type IS RECORD(
    CD_VISITA                  cg$row.CD_VISITA%TYPE,
    DT_VISITA                  cg$row.DT_VISITA%TYPE,
    DT_HORA_ENTRADA            cg$row.DT_HORA_ENTRADA%TYPE,
    DT_HORA_SAIDA              cg$row.DT_HORA_SAIDA%TYPE,
    CD_VISITANTE               cg$row.CD_VISITANTE%TYPE,
    CD_FUNCIONARIO_RESPONSAVEL cg$row.CD_FUNCIONARIO_RESPONSAVEL%TYPE,
    CD_AREA                    cg$row.CD_AREA%TYPE,
    CD_TIPO_VISITA             cg$row.CD_TIPO_VISITA%TYPE,
    DS_OBSERVACAO              cg$row.DS_OBSERVACAO%TYPE,
    the_rowid                  ROWID);

  --  TB_VISITA indicator type variable
  TYPE cg$ind_type IS RECORD(
    CD_VISITA                  BOOLEAN DEFAULT FALSE,
    DT_VISITA                  BOOLEAN DEFAULT FALSE,
    DT_HORA_ENTRADA            BOOLEAN DEFAULT FALSE,
    DT_HORA_SAIDA              BOOLEAN DEFAULT FALSE,
    CD_VISITANTE               BOOLEAN DEFAULT FALSE,
    CD_FUNCIONARIO_RESPONSAVEL BOOLEAN DEFAULT FALSE,
    CD_AREA                    BOOLEAN DEFAULT FALSE,
    CD_TIPO_VISITA             BOOLEAN DEFAULT FALSE,
    DS_OBSERVACAO              BOOLEAN DEFAULT FALSE);

  cg$ind_true cg$ind_type;

  --  TB_VISITA primary key type variable
  TYPE cg$pk_type IS RECORD(
    CD_VISITA cg$row.CD_VISITA%TYPE,
    the_rowid ROWID);

  --  PL/SQL Table Type variable for triggers
  TYPE cg$tab_row_type IS RECORD(
    CD_VISITA                  TB_VISITA.CD_VISITA%TYPE,
    DT_VISITA                  TB_VISITA.DT_VISITA%TYPE,
    DT_HORA_ENTRADA            TB_VISITA.DT_HORA_ENTRADA%TYPE,
    DT_HORA_SAIDA              TB_VISITA.DT_HORA_SAIDA%TYPE,
    CD_VISITANTE               TB_VISITA.CD_VISITANTE%TYPE,
    CD_FUNCIONARIO_RESPONSAVEL TB_VISITA.CD_FUNCIONARIO_RESPONSAVEL%TYPE,
    CD_AREA                    TB_VISITA.CD_AREA%TYPE,
    CD_TIPO_VISITA             TB_VISITA.CD_TIPO_VISITA%TYPE,
    DS_OBSERVACAO              TB_VISITA.DS_OBSERVACAO%TYPE,
    action_performed           VARCHAR2(4));

  TYPE cg$table_type IS TABLE OF cg$tab_row_type INDEX BY BINARY_INTEGER;

  cg$table cg$table_type;

  TYPE cg$tableind_type IS TABLE OF cg$ind_type INDEX BY BINARY_INTEGER;

  cg$tableind cg$tableind_type;

  idx BINARY_INTEGER := 1;

  --INSERT FOR TABLE TB_VISITA
  PROCEDURE ins(cg$rec IN OUT cg$row_type,
                cg$ind IN OUT cg$ind_type,
                do_ins IN BOOLEAN DEFAULT TRUE);

  --UPDATE FOR TABLE TB_VISITA
  PROCEDURE upd(cg$rec IN OUT cg$row_type,
                cg$ind IN OUT cg$ind_type,
                do_upd IN BOOLEAN DEFAULT TRUE,
                cg$pk  IN cg$row_type DEFAULT NULL);

  --DELETE FOR TABLE TB_VISITA
  PROCEDURE del(cg$pk IN cg$pk_type, do_del IN BOOLEAN DEFAULT TRUE);

  PROCEDURE lck(cg$old_rec  IN cg$row_type,
                cg$old_ind  IN cg$ind_type,
                nowait_flag IN BOOLEAN DEFAULT TRUE);

  --SELECT FOR TABLE TB_VISITA
  PROCEDURE slct(cg$sel_rec IN OUT cg$row_type);

  PROCEDURE validate_arc(cg$rec IN OUT cg$row_type);

  PROCEDURE validate_domain(cg$rec IN OUT cg$row_type,
                            cg$ind IN cg$ind_type DEFAULT cg$ind_true);

  PROCEDURE validate_foreign_keys_ins(cg$rec IN cg$row_type);

  PROCEDURE validate_foreign_keys_upd(cg$rec     IN cg$row_type,
                                      cg$old_rec IN cg$row_type,
                                      cg$ind     IN cg$ind_type);

  PROCEDURE validate_foreign_keys_del(cg$rec IN cg$row_type);

  PROCEDURE validate_domain_cascade_delete(cg$old_rec IN cg$row_type);

  PROCEDURE validate_domain_cascade_update(cg$old_rec IN cg$row_type);

  PROCEDURE cascade_update(cg$new_rec IN OUT cg$row_type,
                           cg$old_rec IN cg$row_type);

  PROCEDURE domain_cascade_update(cg$new_rec IN OUT cg$row_type,
                                  cg$new_ind IN OUT cg$ind_type,
                                  cg$old_rec IN cg$row_type);

  PROCEDURE domain_cascade_upd(cg$rec     IN OUT cg$row_type,
                               cg$ind     IN OUT cg$ind_type,
                               cg$old_rec IN cg$row_type);

  PROCEDURE cascade_delete(cg$old_rec IN OUT cg$row_type);

  PROCEDURE domain_cascade_delete(cg$old_rec IN cg$row_type);

  PROCEDURE upd_denorm2(cg$rec IN cg$row_type, cg$ind IN cg$ind_type);

  PROCEDURE upd_oper_denorm2(cg$rec     IN cg$row_type,
                             cg$old_rec IN cg$row_type,
                             cg$ind     IN cg$ind_type,
                             operation  IN VARCHAR2 DEFAULT 'UPD');

END cg$TB_VISITA;
/
