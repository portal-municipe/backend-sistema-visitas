Alter Session set current_schema = 'gvt';


PROMPT Creating API Package Specification for Table 'TB_FUNCIONARIO'
--------------------------------------------------------------------------------
-- Name:        cg$TB_FUNCIONARIO
-- Description: TB_FUNCIONARIO table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE gvt.cg$TB_FUNCIONARIO IS
  cg$row TB_FUNCIONARIO%ROWTYPE;

  --TB_FUNCIONARIO row type variable

END cg$TB_FUNCIONARIO;
/
