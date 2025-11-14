Alter Session set current_schema = 'gvt';


PROMPT Creating API Package Specification for Table 'TB_PESSOA'
--------------------------------------------------------------------------------
-- Name:        cg$TB_PESSOA
-- Description: TB_PESSOA table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE gvt.cg$TB_PESSOA IS
  cg$row TB_PESSOA%ROWTYPE;

  --TB_PESSOA row type variable

END cg$TB_PESSOA;
/
