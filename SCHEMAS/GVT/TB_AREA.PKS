Alter Session set current_schema = 'gvt';
 

PROMPT Creating API Package Specification for Table 'TB_AREA'
--------------------------------------------------------------------------------
-- Name:        cg$TB_AREA
-- Description: TB_AREA table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE gvt.cg$TB_AREA IS
  cg$row              TB_AREA%ROWTYPE;
  called_from_package BOOLEAN := FALSE;

  --TB_AREA row type variable 
  TYPE cg$row_type IS RECORD(
    CD_AREA         cg$row.CD_AREA%TYPE,
    NO_AREA         cg$row.NO_AREA%TYPE,
    DS_AREA         cg$row.DS_AREA%TYPE,
    CD_DEPARTAMENTO cg$row.CD_DEPARTAMENTO%TYPE,
    the_rowid       ROWID);

  --  TB_AREA indicator type variable
  TYPE cg$ind_type IS RECORD(
    CD_AREA         BOOLEAN DEFAULT FALSE,
    NO_AREA         BOOLEAN DEFAULT FALSE,
    DS_AREA         BOOLEAN DEFAULT FALSE,
    CD_DEPARTAMENTO BOOLEAN DEFAULT FALSE);

  cg$ind_true cg$ind_type;

  --  TB_AREA primary key type variable
  TYPE cg$pk_type IS RECORD(
    CD_AREA   cg$row.CD_AREA%TYPE,
    the_rowid ROWID);

  --  PL/SQL Table Type variable for triggers              
  TYPE cg$tab_row_type IS RECORD(
    CD_AREA          TB_AREA.CD_AREA%TYPE,
    NO_AREA          TB_AREA.NO_AREA%TYPE,
    DS_AREA          TB_AREA.DS_AREA%TYPE,
    CD_DEPARTAMENTO  TB_AREA.CD_DEPARTAMENTO%TYPE,
    action_performed VARCHAR2(4));

  TYPE cg$table_type IS TABLE OF cg$tab_row_type INDEX BY BINARY_INTEGER;

  cg$table cg$table_type;

  TYPE cg$tableind_type IS TABLE OF cg$ind_type INDEX BY BINARY_INTEGER;

  cg$tableind cg$tableind_type;

  idx BINARY_INTEGER := 1;

  --INSERT FOR TABLE TB_AREA
  PROCEDURE ins(cg$rec IN OUT cg$row_type,
                cg$ind IN OUT cg$ind_type,
                do_ins IN BOOLEAN DEFAULT TRUE);

  --UPDATE FOR TABLE TB_AREA
  PROCEDURE upd(cg$rec IN OUT cg$row_type,
                cg$ind IN OUT cg$ind_type,
                do_upd IN BOOLEAN DEFAULT TRUE,
                cg$pk  IN cg$row_type DEFAULT NULL);

  --DELETE FOR TABLE TB_AREA
  PROCEDURE del(cg$pk IN cg$pk_type, do_del IN BOOLEAN DEFAULT TRUE);

  PROCEDURE lck(cg$old_rec  IN cg$row_type,
                cg$old_ind  IN cg$ind_type,
                nowait_flag IN BOOLEAN DEFAULT TRUE);

  --SELECT FOR TABLE TB_AREA        
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

  --------------------------------------------------------------------------------
  -- Name:        lck
  --
  -- Description: API lock procedure
  --
  -- Parameters:  cg$old_rec  Calling apps view of record of row to be locked
  --              cg$old_ind  Record of columns to raise error if modified
  --              nowait_flag TRUE lock with NOWAIT, FALSE don't fail if busy
  --------------------------------------------------------------------------------
  PROCEDURE lck(cg$old_rec  IN cg$row_type,
                cg$old_ind  IN cg$ind_type,
                nowait_flag IN BOOLEAN DEFAULT TRUE) IS
    cg$tmp_rec   cg$row_type;
    any_modified BOOLEAN := FALSE;
  
  BEGIN
    BEGIN
      IF (nowait_flag) THEN
        IF cg$old_rec.the_rowid IS NULL THEN
          SELECT CD_AREA, NO_AREA, DS_AREA, CD_DEPARTAMENTO
            INTO cg$tmp_rec.CD_AREA,
                 cg$tmp_rec.NO_AREA,
                 cg$tmp_rec.DS_AREA,
                 cg$tmp_rec.CD_DEPARTAMENTO
            FROM TB_AREA
           WHERE CD_AREA = cg$old_rec.CD_AREA
             FOR UPDATE NOWAIT;
        ELSE
          SELECT CD_AREA, NO_AREA, DS_AREA, CD_DEPARTAMENTO
            INTO cg$tmp_rec.CD_AREA,
                 cg$tmp_rec.NO_AREA,
                 cg$tmp_rec.DS_AREA,
                 cg$tmp_rec.CD_DEPARTAMENTO
            FROM TB_AREA
           WHERE ROWID = cg$old_rec.the_rowid
             FOR UPDATE NOWAIT;
        END IF;
      ELSE
        IF cg$old_rec.the_rowid IS NULL THEN
          SELECT CD_AREA, NO_AREA, DS_AREA, CD_DEPARTAMENTO
            INTO cg$tmp_rec.CD_AREA,
                 cg$tmp_rec.NO_AREA,
                 cg$tmp_rec.DS_AREA,
                 cg$tmp_rec.CD_DEPARTAMENTO
            FROM TB_AREA
           WHERE CD_AREA = cg$old_rec.CD_AREA
             FOR UPDATE;
        ELSE
          SELECT CD_AREA, NO_AREA, DS_AREA, CD_DEPARTAMENTO
            INTO cg$tmp_rec.CD_AREA,
                 cg$tmp_rec.NO_AREA,
                 cg$tmp_rec.DS_AREA,
                 cg$tmp_rec.CD_DEPARTAMENTO
            FROM TB_AREA
           WHERE ROWID = cg$old_rec.the_rowid
             FOR UPDATE;
        END IF;
      END IF;
    
    EXCEPTION
      WHEN cg$errors.cg$error THEN
        cg$errors.raise_failure;
      WHEN cg$errors.resource_busy THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_LCK,
                                            cg$errors.ROW_LCK),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$TB_AREA.lck.resource_busy');
        cg$errors.raise_failure;
      WHEN no_data_found THEN
        cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL,
                                            cg$errors.ROW_DEL),
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$TB_AREA.lck.no_data_found');
        cg$errors.raise_failure;
      WHEN OTHERS THEN
        cg$errors.push(SQLERRM,
                       'E',
                       'ORA',
                       SQLCODE,
                       'cg$TB_AREA.lck.others');
        cg$errors.raise_failure;
    END;
  
    IF (any_modified) THEN
      cg$errors.raise_failure;
    END IF;
  END lck;

BEGIN
  cg$ind_true.CD_AREA         := TRUE;
  cg$ind_true.NO_AREA         := TRUE;
  cg$ind_true.DS_AREA         := TRUE;
  cg$ind_true.CD_DEPARTAMENTO := TRUE;
END cg$TB_AREA;
/
