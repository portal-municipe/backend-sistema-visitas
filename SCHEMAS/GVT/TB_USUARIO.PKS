Alter Session set current_schema = 'gvt';


PROMPT Creating API Package Specification for Table 'TB_USUARIO'
--------------------------------------------------------------------------------
-- Name:        cg$TB_USUARIO
-- Description: TB_USUARIO table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE gvt.cg$TB_USUARIO IS
  cg$row TB_USUARIO%ROWTYPE;

  --TB_USUARIO row type variable
  TYPE cg$row_type IS RECORD(
    CD_USUARIO       cg$row.CD_USUARIO%TYPE,
    NO_USERNAME      cg$row.NO_USERNAME%TYPE,
    DS_SENHA_HASH    cg$row.DS_SENHA_HASH%TYPE,
    TP_PERFIL_ACESSO cg$row.TP_PERFIL_ACESSO%TYPE,
    FL_ESTADO_CONTA  cg$row.FL_ESTADO_CONTA%TYPE,
    CD_PESSOA        cg$row.CD_PESSOA%TYPE,
    the_rowid        ROWID);

  --  TB_USUARIO indicator type variable
  TYPE cg$ind_type IS RECORD(
    CD_USUARIO       BOOLEAN DEFAULT FALSE,
    NO_USERNAME      BOOLEAN DEFAULT FALSE,
    DS_SENHA_HASH    BOOLEAN DEFAULT FALSE,
    TP_PERFIL_ACESSO BOOLEAN DEFAULT FALSE,
    FL_ESTADO_CONTA  BOOLEAN DEFAULT FALSE,
    CD_PESSOA        BOOLEAN DEFAULT FALSE);

  cg$ind_true cg$ind_type;

  --  TB_USUARIO primary key type variable
  TYPE cg$pk_type IS RECORD(
    CD_USUARIO cg$row.CD_USUARIO%TYPE,
    the_rowid  ROWID);

  --  PL/SQL Table Type variable for triggers
  TYPE cg$tab_row_type IS RECORD(
    CD_USUARIO       TB_USUARIO.CD_USUARIO%TYPE,
    NO_USERNAME      TB_USUARIO.NO_USERNAME%TYPE,
    DS_SENHA_HASH    TB_USUARIO.DS_SENHA_HASH%TYPE,
    TP_PERFIL_ACESSO TB_USUARIO.TP_PERFIL_ACESSO%TYPE,
    FL_ESTADO_CONTA  TB_USUARIO.FL_ESTADO_CONTA%TYPE,
    CD_PESSOA        TB_USUARIO.CD_PESSOA%TYPE,
    action_performed VARCHAR2(4));

  TYPE cg$table_type IS TABLE OF cg$tab_row_type INDEX BY BINARY_INTEGER;

  cg$table cg$table_type;

  TYPE cg$tableind_type IS TABLE OF cg$ind_type INDEX BY BINARY_INTEGER;

  cg$tableind cg$tableind_type;

  idx BINARY_INTEGER := 1;

  --INSERT FOR TABLE TB_USUARIO
  PROCEDURE ins(cg$rec IN OUT cg$row_type,
                cg$ind IN OUT cg$ind_type,
                do_ins IN BOOLEAN DEFAULT TRUE);

  --UPDATE FOR TABLE TB_USUARIO
  PROCEDURE upd(cg$rec IN OUT cg$row_type,
                cg$ind IN OUT cg$ind_type,
                do_upd IN BOOLEAN DEFAULT TRUE,
                cg$pk  IN cg$row_type DEFAULT NULL);

  --DELETE FOR TABLE TB_USUARIO
  PROCEDURE del(cg$pk IN cg$pk_type, do_del IN BOOLEAN DEFAULT TRUE);

  PROCEDURE lck(cg$old_rec  IN cg$row_type,
                cg$old_ind  IN cg$ind_type,
                nowait_flag IN BOOLEAN DEFAULT TRUE);

  --SELECT FOR TABLE TB_USUARIO
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

END cg$TB_USUARIO;
/
