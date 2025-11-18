Alter Session set current_schema = 'gvt';


PROMPT Creating API Package Specification for Table 'TB_FUNCIONARIO'
--------------------------------------------------------------------------------
-- Name:        cg$TB_FUNCIONARIO
-- Description: TB_FUNCIONARIO table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE gvt.cg$TB_FUNCIONARIO IS
  cg$row TB_FUNCIONARIO%ROWTYPE;

  --TB_FUNCIONARIO row type variable
  TYPE cg$row_type IS RECORD(
    CD_FUNCIONARIO  cg$row.CD_FUNCIONARIO%TYPE,
    NU_MATRICULA    cg$row.NU_MATRICULA%TYPE,
    DT_ADMISSAO     cg$row.DT_ADMISSAO%TYPE,
    CD_DEPARTAMENTO cg$row.CD_DEPARTAMENTO%TYPE,
    CD_PESSOA       cg$row.CD_PESSOA%TYPE,
    the_rowid       ROWID);

  --  TB_FUNCIONARIO indicator type variable
  TYPE cg$ind_type IS RECORD(
    CD_FUNCIONARIO  BOOLEAN DEFAULT FALSE,
    NU_MATRICULA    BOOLEAN DEFAULT FALSE,
    DT_ADMISSAO     BOOLEAN DEFAULT FALSE,
    CD_DEPARTAMENTO BOOLEAN DEFAULT FALSE,
    CD_PESSOA       BOOLEAN DEFAULT FALSE);

  cg$ind_true cg$ind_type;

  --  TB_FUNCIONARIO primary key type variable
  TYPE cg$pk_type IS RECORD(
    CD_FUNCIONARIO cg$row.CD_FUNCIONARIO%TYPE,
    the_rowid      ROWID);

  --  PL/SQL Table Type variable for triggers
  TYPE cg$tab_row_type IS RECORD(
    CD_FUNCIONARIO   TB_FUNCIONARIO.CD_FUNCIONARIO%TYPE,
    NU_MATRICULA     TB_FUNCIONARIO.NU_MATRICULA%TYPE,
    DT_ADMISSAO      TB_FUNCIONARIO.DT_ADMISSAO%TYPE,
    CD_DEPARTAMENTO  TB_FUNCIONARIO.CD_DEPARTAMENTO%TYPE,
    CD_PESSOA        TB_FUNCIONARIO.CD_PESSOA%TYPE,
    action_performed VARCHAR2(4));

  TYPE cg$table_type IS TABLE OF cg$tab_row_type INDEX BY BINARY_INTEGER;

  cg$table cg$table_type;

  TYPE cg$tableind_type IS TABLE OF cg$ind_type INDEX BY BINARY_INTEGER;

  cg$tableind cg$tableind_type;

  idx BINARY_INTEGER := 1;

  --INSERT FOR TABLE TB_FUNCIONARIO
  PROCEDURE ins(cg$rec IN OUT cg$row_type,
                cg$ind IN OUT cg$ind_type,
                do_ins IN BOOLEAN DEFAULT TRUE);

  --UPDATE FOR TABLE TB_FUNCIONARIO
  PROCEDURE upd(cg$rec IN OUT cg$row_type,
                cg$ind IN OUT cg$ind_type,
                do_upd IN BOOLEAN DEFAULT TRUE,
                cg$pk  IN cg$row_type DEFAULT NULL);

  --DELETE FOR TABLE TB_FUNCIONARIO
  PROCEDURE del(cg$pk IN cg$pk_type, do_del IN BOOLEAN DEFAULT TRUE);

  PROCEDURE lck(cg$old_rec  IN cg$row_type,
                cg$old_ind  IN cg$ind_type,
                nowait_flag IN BOOLEAN DEFAULT TRUE);

  --SELECT FOR TABLE TB_FUNCIONARIO
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

END cg$TB_FUNCIONARIO;
/
