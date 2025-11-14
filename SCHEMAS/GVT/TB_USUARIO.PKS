Alter Session set current_schema = 'gvt';


PROMPT Creating API Package Specification for Table 'TB_USUARIO'
--------------------------------------------------------------------------------
-- Name:        cg$TB_USUARIO
-- Description: TB_USUARIO table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE gvt.cg$TB_USUARIO IS
  cg$row TB_USUARIO%ROWTYPE;

  --TB_USUARIO row type variable

END cg$TB_USUARIO;
/
