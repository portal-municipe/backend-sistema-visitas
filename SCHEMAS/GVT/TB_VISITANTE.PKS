Alter Session set current_schema = 'gvt';


PROMPT Creating API Package Specification for Table 'TB_VISITANTE'
--------------------------------------------------------------------------------
-- Name:        cg$TB_VISITANTE
-- Description: TB_VISITANTE table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE gvt.cg$TB_VISITANTE IS
  cg$row TB_VISITANTE%ROWTYPE;

  --TB_VISITANTE row type variable

END cg$TB_VISITANTE;
/
