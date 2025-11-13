Alter Session set current_schema = 'gvt';
 

PROMPT Creating API Package Specification for Table 'TB_AREA'
--------------------------------------------------------------------------------
-- Name:        cg$TB_AREA
-- Description: TB_AREA table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE gvt.cg$TB_AREA IS
  cg$row TB_AREA%ROWTYPE;

  --  TB_AREA row type variable 
  TYPE cg$row_type IS RECORD(
    CD_AREA         cg$row.CD_AREA%TYPE,
    NO_AREA         cg$row.NO_AREA%TYPE,
    DS_AREA         cg$row.DS_AREA%TYPE,
    CD_DEPARTAMENTO cg$row.CD_DEPARTAMENTO%TYPE,
    the_rowid       ROWID);

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
  idx         BINARY_INTEGER := 1;
END cg$TB_AREA;
/
