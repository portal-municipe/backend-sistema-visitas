Alter Session set current_schema = 'gvt';


PROMPT Creating API Package Specification for Table 'TB_DEPARTAMENTO'
--------------------------------------------------------------------------------
-- Name:        cg$TB_DEPARTAMENTO
-- Description: TB_DEPARTAMENTO table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE gvt.cg$TB_DEPARTAMENTO IS
  cg$row TB_DEPARTAMENTO%ROWTYPE;

  --TB_DEPARTAMENTO row type variable

END cg$TB_DEPARTAMENTO;
/
