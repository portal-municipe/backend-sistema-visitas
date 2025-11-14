Alter Session set current_schema = 'gvt';


PROMPT Creating API Package Specification for Table 'TB_VISITA'
--------------------------------------------------------------------------------
-- Name:        cg$TB_VISITA
-- Description: TB_VISITA table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE gvt.cg$TB_VISITA IS
  cg$row TB_VISITA%ROWTYPE;

  --TB_VISITA row type variable

END cg$TB_VISITA;
/
