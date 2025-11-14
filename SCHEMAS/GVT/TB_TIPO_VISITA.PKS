Alter Session set current_schema = 'gvt';


PROMPT Creating API Package Specification for Table 'TB_TIPO_VISITA'
--------------------------------------------------------------------------------
-- Name:        cg$TB_TIPO_VISITA
-- Description: TB_TIPO_VISITA table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE gvt.cg$TB_TIPO_VISITA IS
  cg$row TB_TIPO_VISITA%ROWTYPE;

  --TB_TIPO_VISITA row type variable

END cg$TB_TIPO_VISITA;
/
