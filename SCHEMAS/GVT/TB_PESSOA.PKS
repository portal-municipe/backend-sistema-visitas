Alter Session set current_schema = 'gvt';


PROMPT Creating API Package Specification for Table 'TB_PESSOA'
--------------------------------------------------------------------------------
-- Name:        cg$TB_PESSOA
-- Description: TB_PESSOA table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE gvt.cg$TB_PESSOA IS
  cg$row TB_PESSOA%ROWTYPE;

    --TB_PESSOA row type variable
    TYPE cg$row_type IS RECORD(
      CD_PESSOA         cg$row.CD_PESSOA%TYPE,
      NO_COMPLETO       cg$row.NO_COMPLETO%TYPE,
      DT_NASCIMENTO     cg$row.DT_NASCIMENTO%TYPE,
      CD_GENERO 	    cg$row.CD_GENERO%TYPE,
  	  CD_RGC 	   		cg$row.CD_PESSOA%TYPE,
	  NU_TELEFONE		cg$row.NU_TELEFONE%TYPE,
	  DS_EMAIL		    cg$row.DS_EMAIL%TYPE,
	  DS_ENDERECO		cg$row.DS_ENDERECO%TYPE,
      the_rowid       	ROWID);

    --  TB_PESSOA indicator type variable
    TYPE cg$ind_type IS RECORD(
      CD_PESSOA         BOOLEAN DEFAULT FALSE,
      NO_COMPLETO       BOOLEAN DEFAULT FALSE,
      DT_NASCIMENTO     BOOLEAN DEFAULT FALSE,
      CD_GENERO         BOOLEAN DEFAULT FALSE,
  	  CD_RGC            BOOLEAN DEFAULT FALSE,
	  NU_TELEFONE       BOOLEAN DEFAULT FALSE,
	  DS_EMAIL          BOOLEAN DEFAULT FALSE,
	  DS_ENDERECO       BOOLEAN DEFAULT FALSE);

    cg$ind_true cg$ind_type;

    --  TB_PESSOA primary key type variable
    TYPE cg$pk_type IS RECORD(
      CD_PESSOA   cg$row.CD_PESSOA%TYPE,
      the_rowid   ROWID);

    --  PL/SQL Table Type variable for triggers
    TYPE cg$tab_row_type IS RECORD(
      CD_PESSOA          TB_PESSOA.CD_PESSOA%TYPE,
      NO_COMPLETO        TB_PESSOA.NO_COMPLETO%TYPE,
      DT_NASCIMENTO      TB_PESSOA.DT_NASCIMENTO%TYPE,
      CD_GENERO          TB_PESSOA.CD_GENERO%TYPE,
  	  CD_RGC             TB_PESSOA.CD_RGC%TYPE,
	  NU_TELEFONE        TB_PESSOA.NU_TELEFONE%TYPE,
	  DS_EMAIL           TB_PESSOA.DS_EMAIL%TYPE,
	  DS_ENDERECO        TB_PESSOA.DS_ENDERECO%TYPE
      action_performed   VARCHAR2(4));

    TYPE cg$table_type IS TABLE OF cg$tab_row_type INDEX BY BINARY_INTEGER;

    cg$table cg$table_type;

    TYPE cg$tableind_type IS TABLE OF cg$ind_type INDEX BY BINARY_INTEGER;

    cg$tableind cg$tableind_type;

    idx BINARY_INTEGER := 1;

    --INSERT FOR TABLE TB_PESSOA
    PROCEDURE ins(cg$rec IN OUT cg$row_type,
                  cg$ind IN OUT cg$ind_type,
                  do_ins IN BOOLEAN DEFAULT TRUE);

    --UPDATE FOR TABLE TB_PESSOA
    PROCEDURE upd(cg$rec IN OUT cg$row_type,
                  cg$ind IN OUT cg$ind_type,
                  do_upd IN BOOLEAN DEFAULT TRUE,
                  cg$pk  IN cg$row_type DEFAULT NULL);

    --DELETE FOR TABLE TB_PESSOA
    PROCEDURE del(cg$pk IN cg$pk_type, do_del IN BOOLEAN DEFAULT TRUE);

    PROCEDURE lck(cg$old_rec  IN cg$row_type,
                  cg$old_ind  IN cg$ind_type,
                  nowait_flag IN BOOLEAN DEFAULT TRUE);

    --SELECT FOR TABLE TB_PESSOA
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

END cg$TB_PESSOA;
/
