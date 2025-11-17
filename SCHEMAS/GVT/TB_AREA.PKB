Alter Session set current_schema = gvt;

PROMPT Creating API Package Body for Table 'TB_AREA'
--------------------------------------------------------------------------------
-- Name:        cg$TB_AREA
-- Description: TB_AREA table API package definitions
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY cg$TB_AREA IS

  --------------------------------------------------------------------------------
  -- Name:        up_autogen_columns
  --
  -- Description: Specific autogeneration of column values and conversion to 
  --              uppercase
  --
  -- Parameters:  cg$rec    Record of row to be manipulated
  --              cg$ind    Indicators for row
  --              operation Procedure where this procedure was called
  --------------------------------------------------------------------------------
  PROCEDURE up_autogen_columns(cg$rec    IN OUT cg$row_type,
                               cg$ind    IN OUT cg$ind_type,
                               operation IN VARCHAR2 DEFAULT 'INS',
                               do_denorm IN BOOLEAN DEFAULT TRUE) IS
  BEGIN
    IF (operation = 'INS') THEN
      BEGIN
        IF (cg$ind.CD_AREA = FALSE OR cg$rec.CD_AREA IS NULL) THEN
          SELECT SQ_AREA.nextval INTO cg$rec.CD_AREA FROM DUAL;
          cg$ind.CD_AREA := TRUE;
        END IF;
      
      EXCEPTION
        WHEN OTHERS THEN
          cg$errors.push(SQLERRM,
                         'E',
                         'ORA',
                         SQLCODE,
                         'cg$TB_AREA.up_autogen.CD_AREA.OTHERS');
          cg$errors.raise_failure;
      END;
      NULL;
    ELSE
      NULL;
    END IF;
  EXCEPTION
    WHEN no_data_found THEN
      NULL;
    WHEN OTHERS THEN
      cg$errors.push(SQLERRM,
                     'E',
                     'ORA',
                     SQLCODE,
                     'cg$TB_AREA.up_autogen_columns');
      cg$errors.raise_failure;
  END up_autogen_columns;

  --------------------------------------------------------------------------------
  -- Name:        doLobs
  --
  -- Description: This function is updating lob columns
  --
  -- Parameters:  cg$rec  Record of row to be inserted
  --              cg$ind  Record of columns specifically set
  --------------------------------------------------------------------------------
  PROCEDURE doLobs(cg$rec IN OUT cg$row_type, cg$ind IN OUT cg$ind_type) IS
  BEGIN
    NULL;
  END doLobs;

  --------------------------------------------------------------------------------
  -- Name:        slct
  --
  -- Description: Selects into the given parameter all the attributes for the row
  --              given by the primary key
  --
  -- Parameters:  cg$sel_rec  Record of row to be selected into using its PK
  --------------------------------------------------------------------------------
  PROCEDURE slct(cg$sel_rec IN OUT cg$row_type) IS
  BEGIN
  
    IF cg$sel_rec.the_rowid IS NULL THEN
      SELECT CD_AREA, NO_AREA, DS_AREA, CD_DEPARTAMENTO, ROWID
        INTO cg$sel_rec.CD_AREA,
             cg$sel_rec.NO_AREA,
             cg$sel_rec.DS_AREA,
             cg$sel_rec.CD_DEPARTAMENTO,
             cg$sel_rec.the_rowid
        FROM TB_AREA
       WHERE CD_AREA = cg$sel_rec.CD_AREA;
    ELSE
      SELECT CD_AREA, NO_AREA, DS_AREA, CD_DEPARTAMENTO, ROWID
        INTO cg$sel_rec.CD_AREA,
             cg$sel_rec.NO_AREA,
             cg$sel_rec.DS_AREA,
             cg$sel_rec.CD_DEPARTAMENTO,
             cg$sel_rec.the_rowid
        FROM TB_AREA
       WHERE ROWID = cg$sel_rec.the_rowid;
    END IF;
  
  EXCEPTION
    WHEN OTHERS THEN
      cg$errors.push(SQLERRM,
                     'E',
                     'ORA',
                     SQLCODE,
                     'cg$TB_AREA.slct.others');
      cg$errors.raise_failure;
  END slct;

  --------------------------------------------------------------------------------
  -- Name:        ins
  --
  -- Description: API insert procedure
  --
  -- Parameters:  cg$rec  Record of row to be inserted
  --              cg$ind  Record of columns specifically set
  --              do_ins  Whether we want the actual INSERT to occur
  --------------------------------------------------------------------------------
  PROCEDURE ins(cg$rec IN OUT cg$row_type,
                cg$ind IN OUT cg$ind_type,
                do_ins IN BOOLEAN DEFAULT TRUE) IS
    cg$tmp_rec cg$row_type;
  
  BEGIN
  
    --  Auto-generated and uppercased columns
    up_autogen_columns(cg$rec, cg$ind, 'INS', do_ins);
    called_from_package := TRUE;
  
    IF (do_ins) THEN
      validate_foreign_keys_ins(cg$rec);
      validate_arc(cg$rec);
      validate_domain(cg$rec);
    
      INSERT INTO TB_AREA
        (CD_AREA, NO_AREA, DS_AREA, CD_DEPARTAMENTO)
      VALUES
        (cg$rec.CD_AREA,
         cg$rec.NO_AREA,
         cg$rec.DS_AREA,
         cg$rec.CD_DEPARTAMENTO);
    
      doLobs(cg$rec, cg$ind);
      slct(cg$rec);
    
      upd_oper_denorm2(cg$rec, cg$tmp_rec, cg$ind, 'INS');
    END IF;
  
    called_from_package := FALSE;
  EXCEPTION
    WHEN cg$errors.cg$error THEN
      called_from_package := FALSE;
      cg$errors.raise_failure;
    WHEN cg$errors.mandatory_missing THEN
      validate_mandatory(cg$rec, 'cg$TB_AREA.ins.mandatory_missing');
      called_from_package := FALSE;
      cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
      err_msg(SQLERRM,
              cg$errors.ERR_CHECK_CON,
              'cg$TB_AREA.ins.check_violation');
      called_from_package := FALSE;
      cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
      err_msg(SQLERRM,
              cg$errors.ERR_FOREIGN_KEY,
              'cg$TB_AREA.ins.fk_violation');
      called_from_package := FALSE;
      cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
      err_msg(SQLERRM,
              cg$errors.ERR_UNIQUE_KEY,
              'cg$TB_AREA.ins.uk_violation');
      called_from_package := FALSE;
      cg$errors.raise_failure;
    WHEN OTHERS THEN
      cg$errors.push(SQLERRM, 'E', 'ORA', SQLCODE, 'cg$TB_AREA.ins.others');
      called_from_package := FALSE;
      cg$errors.raise_failure;
  END ins;

  --------------------------------------------------------------------------------
  -- Name:        upd
  --
  -- Description: API update procedure
  --
  -- Parameters:  cg$rec  Record of row to be updated
  --              cg$ind  Record of columns specifically set
  --              do_upd  Whether we want the actual UPDATE to occur
  --------------------------------------------------------------------------------
  PROCEDURE upd(cg$rec IN OUT cg$row_type,
                cg$ind IN OUT cg$ind_type,
                do_upd IN BOOLEAN DEFAULT TRUE,
                cg$pk  IN cg$row_type DEFAULT NULL) IS
    cg$upd_rec    cg$row_type;
    cg$old_rec    cg$row_type;
    RECORD_LOGGED BOOLEAN := FALSE;
  BEGIN
    IF (cg$pk.CD_AREA IS NULL) THEN
      cg$upd_rec.CD_AREA := cg$rec.CD_AREA;
    ELSE
      cg$upd_rec.CD_AREA := cg$pk.CD_AREA;
    END IF;
    cg$old_rec.CD_AREA := cg$upd_rec.CD_AREA;
  
    IF (cg$pk.the_rowid IS NULL) THEN
      cg$upd_rec.the_rowid := cg$rec.the_rowid;
    ELSE
      cg$upd_rec.the_rowid := cg$pk.the_rowid;
    END IF;
    cg$old_rec.the_rowid := cg$upd_rec.the_rowid;
  
    IF (do_upd) THEN
      slct(cg$upd_rec);
    
      IF NOT (cg$ind.CD_AREA) THEN
        cg$rec.CD_AREA := cg$upd_rec.CD_AREA;
      END IF;
    
      IF NOT (cg$ind.NO_AREA) THEN
        cg$rec.NO_AREA := cg$upd_rec.NO_AREA;
      END IF;
    
      IF NOT (cg$ind.DS_AREA) THEN
        cg$rec.DS_AREA := cg$upd_rec.DS_AREA;
      END IF;
    
      IF NOT (cg$ind.CD_DEPARTAMENTO) THEN
        cg$rec.CD_DEPARTAMENTO := cg$upd_rec.CD_DEPARTAMENTO;
      END IF;
    END IF;
  
    up_autogen_columns(cg$rec, cg$ind, 'UPD', do_upd);
  
    IF (do_upd) THEN
      DECLARE
        called_from BOOLEAN := called_from_package;
      BEGIN
        called_from_package := TRUE;
      
        slct(cg$old_rec);
        validate_foreign_keys_upd(cg$rec, cg$old_rec, cg$ind);
        validate_arc(cg$rec);
        validate_domain(cg$rec, cg$ind);
        validate_domain_cascade_update(cg$old_rec);
      
        IF cg$rec.the_rowid IS NULL THEN
          UPDATE TB_AREA
             SET NO_AREA         = cg$rec.NO_AREA,
                 DS_AREA         = cg$rec.DS_AREA,
                 CD_DEPARTAMENTO = cg$rec.CD_DEPARTAMENTO
           WHERE CD_AREA = cg$rec.CD_AREA;
          NULL;
        ELSE
          UPDATE TB_AREA
             SET NO_AREA         = cg$rec.NO_AREA,
                 DS_AREA         = cg$rec.DS_AREA,
                 CD_DEPARTAMENTO = cg$rec.CD_DEPARTAMENTO
           WHERE ROWID = cg$rec.the_rowid;
          NULL;
        END IF;
      
        slct(cg$rec);
      
        upd_denorm2(cg$rec, cg$ind);
        upd_oper_denorm2(cg$rec, cg$old_rec, cg$ind, 'UPD');
        cascade_update(cg$rec, cg$old_rec);
        domain_cascade_update(cg$rec, cg$ind, cg$old_rec);
        called_from_package := called_from;
      END;
    END IF;
  
    IF NOT (do_upd) THEN
      cg$table(idx).CD_AREA := cg$rec.CD_AREA;
      cg$tableind(idx).CD_AREA := cg$ind.CD_AREA;
      cg$table(idx).NO_AREA := cg$rec.NO_AREA;
      cg$tableind(idx).NO_AREA := cg$ind.NO_AREA;
      cg$table(idx).DS_AREA := cg$rec.DS_AREA;
      cg$tableind(idx).DS_AREA := cg$ind.DS_AREA;
      cg$table(idx).CD_DEPARTAMENTO := cg$rec.CD_DEPARTAMENTO;
      cg$tableind(idx).CD_DEPARTAMENTO := cg$ind.CD_DEPARTAMENTO;
    
      cg$table(idx).action_performed := 'UPD';
      idx := idx + 1;
    END IF;
  
    --  Application_logic Post-Update <<Start>>
    --  Application_logic Post-Update << End >>
  
  EXCEPTION
    WHEN cg$errors.cg$error THEN
      called_from_package := FALSE;
      cg$errors.raise_failure;
    WHEN cg$errors.upd_mandatory_null THEN
      validate_mandatory(cg$rec, 'cg$TB_AREA.upd.upd_mandatory_null');
      called_from_package := FALSE;
      cg$errors.raise_failure;
    WHEN cg$errors.check_violation THEN
      err_msg(SQLERRM,
              cg$errors.ERR_CHECK_CON,
              'cg$TB_AREA.upd.check_violation');
      called_from_package := FALSE;
      cg$errors.raise_failure;
    WHEN cg$errors.fk_violation THEN
      err_msg(SQLERRM,
              cg$errors.ERR_FOREIGN_KEY,
              'cg$TB_AREA.upd.fk_violation');
      called_from_package := FALSE;
      cg$errors.raise_failure;
    WHEN cg$errors.uk_violation THEN
      err_msg(SQLERRM,
              cg$errors.ERR_UNIQUE_KEY,
              'cg$TB_AREA.upd.uk_violation');
      called_from_package := FALSE;
      cg$errors.raise_failure;
    WHEN OTHERS THEN
      cg$errors.push(SQLERRM, 'E', 'ORA', SQLCODE, 'cg$TB_AREA.upd.others');
      called_from_package := FALSE;
      cg$errors.raise_failure;
  END upd;

  --------------------------------------------------------------------------------
  -- Name:        del
  --
  -- Description: API delete procedure
  --
  -- Parameters:  cg$pk  Primary key record of row to be deleted
  --------------------------------------------------------------------------------
  PROCEDURE del(cg$pk IN cg$pk_type, do_del IN BOOLEAN DEFAULT TRUE) IS
  BEGIN
    --  Application_logic Pre-Delete <<Start>>
    --  Application_logic Pre-Delete << End >>
  
    --  Delete the record
  
    called_from_package := TRUE;
  
    IF (do_del) THEN
      DECLARE
        cg$rec     cg$row_type;
        cg$old_rec cg$row_type;
        cg$ind     cg$ind_type;
      BEGIN
        cg$rec.CD_AREA := cg$pk.CD_AREA;
        slct(cg$rec);
      
        validate_foreign_keys_del(cg$rec);
        validate_domain_cascade_delete(cg$rec);
      
        IF cg$pk.the_rowid IS NULL THEN
          DELETE TB_AREA WHERE CD_AREA = cg$pk.CD_AREA;
        ELSE
          DELETE TB_AREA WHERE ROWID = cg$pk.the_rowid;
        END IF;
      
        upd_oper_denorm2(cg$rec, cg$old_rec, cg$ind, 'DEL');
        cascade_delete(cg$rec);
        domain_cascade_delete(cg$rec);
      END;
    END IF;
  
    called_from_package := FALSE;
  
  EXCEPTION
    WHEN cg$errors.cg$error THEN
      called_from_package := FALSE;
      cg$errors.raise_failure;
    WHEN cg$errors.delete_restrict THEN
      err_msg(SQLERRM,
              cg$errors.ERR_DELETE_RESTRICT,
              'cg$TB_AREA.del.delete_restrict');
      called_from_package := FALSE;
      cg$errors.raise_failure;
    WHEN no_data_found THEN
      cg$errors.push(cg$errors.MsgGetText(cg$errors.API_ROW_DEL,
                                          cg$errors.ROW_DEL),
                     'E',
                     'ORA',
                     SQLCODE,
                     'cg$TB_AREA.del.no_data_found');
      called_from_package := FALSE;
      cg$errors.raise_failure;
    WHEN OTHERS THEN
      cg$errors.push(SQLERRM, 'E', 'ORA', SQLCODE, 'cg$TB_AREA.del.others');
      called_from_package := FALSE;
      cg$errors.raise_failure;
  END del;

  --------------------------------------------------------------------------------
  -- Name:        validate_arc
  --
  -- Description: Checks for adherence to arc relationship 
  --
  -- Parameters:  cg$rec     Record of TB_AREA current values
  --------------------------------------------------------------------------------
  PROCEDURE validate_arc(cg$rec IN OUT cg$row_type) IS
    i NUMBER;
  BEGIN
    NULL;
  END validate_arc;

  --------------------------------------------------------------------------------
  -- Name:        validate_domain
  --
  -- Description: Checks against reference table for values lying in a domain 
  --
  -- Parameters:  cg$rec     Record of TB_AREA current values
  --------------------------------------------------------------------------------
  PROCEDURE validate_domain(cg$rec IN OUT cg$row_type,
                            cg$ind IN cg$ind_type DEFAULT cg$ind_true) IS
    dummy      NUMBER;
    FOUND      BOOLEAN;
    no_tabview EXCEPTION;
    PRAGMA EXCEPTION_INIT(no_tabview, -942);
  BEGIN
    NULL;
    NULL;
  END validate_domain;

  PROCEDURE validate_foreign_keys_ins(cg$rec IN cg$row_type) IS
    fk_check INTEGER;
  BEGIN
    NULL;
  END;

  PROCEDURE validate_foreign_keys_upd(cg$rec     IN cg$row_type,
                                      cg$old_rec IN cg$row_type,
                                      cg$ind     IN cg$ind_type) IS
    fk_check INTEGER;
  BEGIN
    NULL;
  END;

  PROCEDURE validate_foreign_keys_del(cg$rec IN cg$row_type) IS
    fk_check INTEGER;
  BEGIN
    NULL;
  END;

  --------------------------------------------------------------------------------
  -- Name:        validate_domain_cascade_update
  --
  -- Description: Implement the Domain Key Constraint Cascade Updates Resticts rule
  --              of each child table that references this table TB_AREA 
  --
  -- Parameters:  cg$old_rec     Record of TB_AREA current values
  --------------------------------------------------------------------------------
  PROCEDURE validate_domain_cascade_update(cg$old_rec IN cg$row_type) IS
    dk_check INTEGER;
  BEGIN
    NULL;
  END validate_domain_cascade_update;

  -----------------------------------------------------------------------------------------
  -- Name:        domain_cascade_update
  --
  -- Description: Implement the Domain Key Constraint Cascade Updates rules of each
  --              child table that references this table TB_AREA 
  --
  -- Parameters:  cg$new_rec  New values for TB_AREA's domain key constraint columns 
  --              cg$new_ind  Indicates changed TB_AREA's domain key constraint columns
  --              cg$old_rec  Current values for TB_AREA's domain key constraint columns
  -----------------------------------------------------------------------------------------
  PROCEDURE domain_cascade_update(cg$new_rec IN OUT cg$row_type,
                                  cg$new_ind IN OUT cg$ind_type,
                                  cg$old_rec IN cg$row_type) IS
  BEGIN
    NULL;
  END domain_cascade_update;

  --------------------------------------------------------------------------------
  -- Name:        cascade_update
  --
  -- Description: Updates all child tables affected by a change to TB_AREA 
  --
  -- Parameters:  cg$rec     Record of TB_AREA current values
  --              cg$old_rec Record of TB_AREA previous values
  --------------------------------------------------------------------------------
  PROCEDURE cascade_update(cg$new_rec IN OUT cg$row_type,
                           cg$old_rec IN cg$row_type) IS
  BEGIN
    NULL;
  END cascade_update;

  ----------------------------------------------------------------------------------------
  -- Name:        domain_cascade_upd
  --
  -- Description: Update the Domain Constraint Key columns of TB_AREA when the
  --              Cascade Update rule is Cascades and the domain table has been
  --              updated. Called from <Domain Table pkg>.domain_cascade_update().
  --
  -- Parameters:  cg$rec      New values for TB_AREA's domain key constraint columns 
  --              cg$ind      Indicates changed TB_AREA's domain key constraint columns
  --              cg$old_rec  Current values for TB_AREA's domain key constraint columns
  ----------------------------------------------------------------------------------------
  PROCEDURE domain_cascade_upd(cg$rec     IN OUT cg$row_type,
                               cg$ind     IN OUT cg$ind_type,
                               cg$old_rec IN cg$row_type) IS
    called_from BOOLEAN := called_from_package;
  BEGIN
  
    NULL;
  END domain_cascade_upd;

  --------------------------------------------------------------------------------
  -- Name:        cascade_delete
  --
  -- Description: Delete all child tables affected by a delete to TB_AREA 
  --
  -- Parameters:  cg$rec     Record of TB_AREA current values
  --------------------------------------------------------------------------------
  PROCEDURE cascade_delete(cg$old_rec IN OUT cg$row_type) IS
  BEGIN
    NULL;
  END cascade_delete;

  --------------------------------------------------------------------------------
  -- Name:        domain_cascade_delete
  --
  -- Description: Implement the Domain Key Constraint Cascade Delete rules of each
  --              child table that references this table TB_AREA 
  --
  -- Parameters:  cg$old_rec     Record of TB_AREA current values
  --------------------------------------------------------------------------------
  PROCEDURE domain_cascade_delete(cg$old_rec IN cg$row_type) IS
  BEGIN
    NULL;
  END domain_cascade_delete;

  --------------------------------------------------------------------------------
  -- Name:        upd_denorm
  --
  -- Description: API procedure for simple denormalization
  --
  -- Parameters:  cg$rec  Record of row to be updated
  --              cg$ind  Record of columns specifically set
  --              do_upd  Whether we want the actual UPDATE to occur
  --------------------------------------------------------------------------------
  PROCEDURE upd_denorm2(cg$rec IN cg$row_type, cg$ind IN cg$ind_type) IS
  BEGIN
    NULL;
  END upd_denorm2;

  --------------------------------------------------------------------------------
  -- Name:        upd_oper_denorm
  --
  -- Description: API procedure for operation denormalization
  --
  -- Parameters:  cg$rec  Record of row to be updated
  --              cg$ind  Record of columns specifically set
  --              do_upd  Whether we want the actual UPDATE to occur
  --------------------------------------------------------------------------------
  PROCEDURE upd_oper_denorm2(cg$rec     IN cg$row_type,
                             cg$old_rec IN cg$row_type,
                             cg$ind     IN cg$ind_type,
                             operation  IN VARCHAR2 DEFAULT 'UPD') IS
  BEGIN
    NULL;
  END upd_oper_denorm2;

END cg$TB_AREA;
/
