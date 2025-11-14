Alter Session set current_schema = 'gvt';


PROMPT Creating API Package Specification for Table 'TB_RGC'
--------------------------------------------------------------------------------
-- Name:        cg$TB_RGC
-- Description: TB_RGC table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE gvt.cg$TB_RGC IS
  cg$row TB_RGC%ROWTYPE;

  --TB_RGC row type variable

END cg$TB_RGC;
/
