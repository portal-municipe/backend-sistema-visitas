Alter Session set current_schema = 'gvt';


PROMPT Creating API Package Specification for Table 'TB_GENERO'
--------------------------------------------------------------------------------
-- Name:        cg$TB_GENERO
-- Description: TB_GENERO table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE gvt.cg$TB_GENERO IS
  cg$row TB_GENERO%ROWTYPE;

  --TB_GENERO row type variable

END cg$TB_GENERO;
/
