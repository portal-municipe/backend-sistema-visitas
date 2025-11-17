Alter Session set current_schema = 'gvt';


PROMPT Creating API Package Specification for Table 'TB_VISITANTE'
--------------------------------------------------------------------------------
-- Name:        cg$TB_VISITANTE
-- Description: TB_VISITANTE table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE gvt.cg$TB_VISITANTE IS
  cg$row TB_VISITANTE%ROWTYPE;

  --TB_VISITANTE row type variable
  TYPE cg$row_type IS RECORD(
    CD_VISITANTE               cg$row.CD_VISITANTE%TYPE,
    CD_PESSOA                  cg$row.CD_PESSOA%TYPE,
    NO_EMPRESA_ORIGEM          cg$row.NO_EMPRESA_ORIGEM%TYPE,
    TP_DOCUMENTO_IDENTIFICACAO cg$row.TP_DOCUMENTO_IDENTIFICACAO%TYPE,
    DS_OBSERVACAO              cg$row.DS_OBSERVACAO%TYPE,
    the_rowid                  ROWID);

  --  TB_VISITANTE indicator type variable
  TYPE cg$ind_type IS RECORD(
    CD_VISITANTE               BOOLEAN DEFAULT FALSE,
    CD_PESSOA                  BOOLEAN DEFAULT FALSE,
    NO_EMPRESA_ORIGEM          BOOLEAN DEFAULT FALSE,
    TP_DOCUMENTO_IDENTIFICACAO BOOLEAN DEFAULT FALSE,
    DS_OBSERVACAO              BOOLEAN DEFAULT FALSE);

  cg$ind_true cg$ind_type;

  --  TB_VISITANTE primary key type variable
  TYPE cg$pk_type IS RECORD(
    CD_VISITANTE cg$row.CD_VISITANTE%TYPE,
    the_rowid    ROWID);

  --  PL/SQL Table Type variable for triggers
  TYPE cg$tab_row_type IS RECORD(
    CD_VISITANTE               TB_VISITANTE.CD_VISITANTE%TYPE,
    CD_PESSOA                  TB_VISITANTE.CD_PESSOA%TYPE,
    NO_EMPRESA_ORIGEM          TB_VISITANTE.NO_EMPRESA_ORIGEM%TYPE,
    TP_DOCUMENTO_IDENTIFICACAO TB_VISITANTE.TP_DOCUMENTO_IDENTIFICACAO%TYPE,
    DS_OBSERVACAO              TB_VISITANTE.DS_OBSERVACAO%TYPE,
    action_performed           VARCHAR2(4));

  TYPE cg$table_type IS TABLE OF cg$tab_row_type INDEX BY BINARY_INTEGER;

  cg$table cg$table_type;

  TYPE cg$tableind_type IS TABLE OF cg$ind_type INDEX BY BINARY_INTEGER;

  cg$tableind cg$tableind_type;

  idx BINARY_INTEGER := 1;

  --INSERT FOR TABLE TB_VISITANTE
  PROCEDURE ins(cg$rec IN OUT cg$row_type,
                cg$ind IN OUT cg$ind_type,
                do_ins IN BOOLEAN DEFAULT TRUE);

  --UPDATE FOR TABLE TB_VISITANTE
  PROCEDURE upd(cg$rec IN OUT cg$row_type,
                cg$ind IN OUT cg$ind_type,
                do_upd IN BOOLEAN DEFAULT TRUE,
                cg$pk  IN cg$row_type DEFAULT NULL);

  --DELETE FOR TABLE TB_VISITANTE
  PROCEDURE del(cg$pk IN cg$pk_type, do_del IN BOOLEAN DEFAULT TRUE);

  PROCEDURE lck(cg$old_rec  IN cg$row_type,
                cg$old_ind  IN cg$ind_type,
                nowait_flag IN BOOLEAN DEFAULT TRUE);

  --SELECT FOR TABLE TB_VISITANTE
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

END cg$TB_VISITANTE;
/
