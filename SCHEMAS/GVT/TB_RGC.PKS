Alter Session set current_schema = 'gvt';


PROMPT Creating API Package Specification for Table 'TB_RGC'
--------------------------------------------------------------------------------
-- Name:        cg$TB_RGC
-- Description: TB_RGC table API package declarations
--------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE gvt.cg$TB_RGC IS
  cg$row TB_RGC%ROWTYPE;

  --TB_RGC row type variable
  TYPE cg$row_type IS RECORD(
    CD_RGC                  cg$row.CD_RGC%TYPE,
    NU_RGC                  cg$row.NU_RGC%TYPE,
    DT_EMISSAO              cg$row.DT_EMISSAO%TYPE,
    NU_BI                   cg$row.NU_BI%TYPE,
    DT_EMISSAO_BI           cg$row.DT_EMISSAO_BI%TYPE,
    CD_RGC_REF              cg$row.CD_RGC_REF%TYPE,
    NU_REPFISCAL            cg$row.NU_REPFISCAL%TYPE,
    TP_PESSOA               cg$row.TP_PESSOA%TYPE,
    NO_CONTRIBUINTE         cg$row.NO_CONTRIBUINTE%TYPE,
    ST_CONTRIBUINTE         cg$row.ST_CONTRIBUINTE%TYPE,
    FL_ATIVO                cg$row.FL_ATIVO%TYPE,
    NU_CONTRIBUINTE         cg$row.NU_CONTRIBUINTE%TYPE,
    FL_ORIGEM               cg$row.FL_ORIGEM%TYPE,
    SG_CONTRIBUINTE         cg$row.SG_CONTRIBUINTE%TYPE,
    USER_NAME               cg$row.USER_NAME%TYPE,
    DNI_CODCTB              cg$row.DNI_CODCTB%TYPE,
    FL_RGC_VALIDADO         cg$row.FL_RGC_VALIDADO%TYPE,
    TP_PESSOA_ESTRANGEIRA   cg$row.TP_PESSOA_ESTRANGEIRA%TYPE,
    FL_DADOS_CC             cg$row.FL_DADOS_CC%TYPE,
    TP_TIPO_CONTRIBUINTE    cg$row.TP_TIPO_CONTRIBUINTE%TYPE,
    FL_ESTADO_SUSPENSAO     cg$row.FL_ESTADO_SUSPENSAO%TYPE,
    FL_PROCESSADO_SOA       cg$row.FL_PROCESSADO_SOA%TYPE,
    TP_REGIME               cg$row.TP_REGIME%TYPE,
    DT_INICIO_ATV_IVA       cg$row.DT_INICIO_ATV_IVA%TYPE,
    DT_FIM_ATV_IVA          cg$row.DT_FIM_ATV_IVA%TYPE,
    FL_SAEP                 cg$row.FL_SAEP%TYPE,
    FL_RESIDENTE_AUSENTE    cg$row.FL_RESIDENTE_AUSENTE%TYPE,
    TP_IRT_GRUPO            cg$row.TP_IRT_GRUPO%TYPE,
    NU_NIF_ESTRANGEIRO      cg$row.NU_NIF_ESTRANGEIRO%TYPE,
    TP_SUBTIPO_CONTRIBUINTE cg$row.TP_SUBTIPO_CONTRIBUINTE%TYPE,
    FL_ESTADO_CONTRIBUINTE  cg$row.FL_ESTADO_CONTRIBUINTE%TYPE,
    TP_DOCUMENTO_RGC        cg$row.TP_DOCUMENTO_RGC%TYPE,
    FL_RESIDENTE            cg$row.FL_RESIDENTE%TYPE,
    the_rowid               ROWID);

  --  TB_RGC indicator type variable
  TYPE cg$ind_type IS RECORD(
    CD_RGC                  BOOLEAN DEFAULT FALSE,
    NU_RGC                  BOOLEAN DEFAULT FALSE,
    DT_EMISSAO              BOOLEAN DEFAULT FALSE,
    NU_BI                   BOOLEAN DEFAULT FALSE,
    DT_EMISSAO_BI           BOOLEAN DEFAULT FALSE,
    CD_RGC_REF              BOOLEAN DEFAULT FALSE,
    NU_REPFISCAL            BOOLEAN DEFAULT FALSE,
    TP_PESSOA               BOOLEAN DEFAULT FALSE,
    NO_CONTRIBUINTE         BOOLEAN DEFAULT FALSE,
    ST_CONTRIBUINTE         BOOLEAN DEFAULT FALSE,
    FL_ATIVO                BOOLEAN DEFAULT FALSE,
    NU_CONTRIBUINTE         BOOLEAN DEFAULT FALSE,
    FL_ORIGEM               BOOLEAN DEFAULT FALSE,
    SG_CONTRIBUINTE         BOOLEAN DEFAULT FALSE,
    USER_NAME               BOOLEAN DEFAULT FALSE,
    DNI_CODCTB              BOOLEAN DEFAULT FALSE,
    FL_RGC_VALIDADO         BOOLEAN DEFAULT FALSE,
    TP_PESSOA_ESTRANGEIRA   BOOLEAN DEFAULT FALSE,
    FL_DADOS_CC             BOOLEAN DEFAULT FALSE,
    TP_TIPO_CONTRIBUINTE    BOOLEAN DEFAULT FALSE,
    FL_ESTADO_SUSPENSAO     BOOLEAN DEFAULT FALSE,
    FL_PROCESSADO_SOA       BOOLEAN DEFAULT FALSE,
    TP_REGIME               BOOLEAN DEFAULT FALSE,
    DT_INICIO_ATV_IVA       BOOLEAN DEFAULT FALSE,
    DT_FIM_ATV_IVA          BOOLEAN DEFAULT FALSE,
    FL_SAEP                 BOOLEAN DEFAULT FALSE,
    FL_RESIDENTE_AUSENTE    BOOLEAN DEFAULT FALSE,
    TP_IRT_GRUPO            BOOLEAN DEFAULT FALSE,
    NU_NIF_ESTRANGEIRO      BOOLEAN DEFAULT FALSE,
    TP_SUBTIPO_CONTRIBUINTE BOOLEAN DEFAULT FALSE,
    FL_ESTADO_CONTRIBUINTE  BOOLEAN DEFAULT FALSE,
    TP_DOCUMENTO_RGC        BOOLEAN DEFAULT FALSE,
    FL_RESIDENTE            BOOLEAN DEFAULT FALSE);

  cg$ind_true cg$ind_type;

  --  TB_RGC primary key type variable
  TYPE cg$pk_type IS RECORD(
    CD_RGC    cg$row.CD_RGC%TYPE,
    the_rowid ROWID);

  --  PL/SQL Table Type variable for triggers
  TYPE cg$tab_row_type IS RECORD(
    CD_RGC                  TB_RGC.CD_RGC%TYPE,
    NU_RGC                  TB_RGC.NU_RGC%TYPE,
    DT_EMISSAO              TB_RGC.DT_EMISSAO%TYPE,
    NU_BI                   TB_RGC.NU_BI%TYPE,
    DT_EMISSAO_BI           TB_RGC.DT_EMISSAO_BI%TYPE,
    CD_RGC_REF              TB_RGC.CD_RGC_REF%TYPE,
    NU_REPFISCAL            TB_RGC.NU_REPFISCAL%TYPE,
    TP_PESSOA               TB_RGC.TP_PESSOA%TYPE,
    NO_CONTRIBUINTE         TB_RGC.NO_CONTRIBUINTE%TYPE,
    ST_CONTRIBUINTE         TB_RGC.ST_CONTRIBUINTE%TYPE,
    FL_ATIVO                TB_RGC.FL_ATIVO%TYPE,
    NU_CONTRIBUINTE         TB_RGC.NU_CONTRIBUINTE%TYPE,
    FL_ORIGEM               TB_RGC.FL_ORIGEM%TYPE,
    SG_CONTRIBUINTE         TB_RGC.SG_CONTRIBUINTE%TYPE,
    USER_NAME               TB_RGC.USER_NAME%TYPE,
    DNI_CODCTB              TB_RGC.DNI_CODCTB%TYPE,
    FL_RGC_VALIDADO         TB_RGC.FL_RGC_VALIDADO%TYPE,
    TP_PESSOA_ESTRANGEIRA   TB_RGC.TP_PESSOA_ESTRANGEIRA%TYPE,
    FL_DADOS_CC             TB_RGC.FL_DADOS_CC%TYPE,
    TP_TIPO_CONTRIBUINTE    TB_RGC.TP_TIPO_CONTRIBUINTE%TYPE,
    FL_ESTADO_SUSPENSAO     TB_RGC.FL_ESTADO_SUSPENSAO%TYPE,
    FL_PROCESSADO_SOA       TB_RGC.FL_PROCESSADO_SOA%TYPE,
    TP_REGIME               TB_RGC.TP_REGIME%TYPE,
    DT_INICIO_ATV_IVA       TB_RGC.DT_INICIO_ATV_IVA%TYPE,
    DT_FIM_ATV_IVA          TB_RGC.DT_FIM_ATV_IVA%TYPE,
    FL_SAEP                 TB_RGC.FL_SAEP%TYPE,
    FL_RESIDENTE_AUSENTE    TB_RGC.FL_RESIDENTE_AUSENTE%TYPE,
    TP_IRT_GRUPO            TB_RGC.TP_IRT_GRUPO%TYPE,
    NU_NIF_ESTRANGEIRO      TB_RGC.NU_NIF_ESTRANGEIRO%TYPE,
    TP_SUBTIPO_CONTRIBUINTE TB_RGC.TP_SUBTIPO_CONTRIBUINTE%TYPE,
    FL_ESTADO_CONTRIBUINTE  TB_RGC.FL_ESTADO_CONTRIBUINTE%TYPE,
    TP_DOCUMENTO_RGC        TB_RGC.TP_DOCUMENTO_RGC%TYPE,
    FL_RESIDENTE            TB_RGC.FL_RESIDENTE%TYPE,
    action_performed        VARCHAR2(4));

  TYPE cg$table_type IS TABLE OF cg$tab_row_type INDEX BY BINARY_INTEGER;

  cg$table cg$table_type;

  TYPE cg$tableind_type IS TABLE OF cg$ind_type INDEX BY BINARY_INTEGER;

  cg$tableind cg$tableind_type;

  idx BINARY_INTEGER := 1;

  --INSERT FOR TABLE TB_RGC
  PROCEDURE ins(cg$rec IN OUT cg$row_type,
                cg$ind IN OUT cg$ind_type,
                do_ins IN BOOLEAN DEFAULT TRUE);

  --UPDATE FOR TABLE TB_RGC
  PROCEDURE upd(cg$rec IN OUT cg$row_type,
                cg$ind IN OUT cg$ind_type,
                do_upd IN BOOLEAN DEFAULT TRUE,
                cg$pk  IN cg$row_type DEFAULT NULL);

  --DELETE FOR TABLE TB_RGC
  PROCEDURE del(cg$pk IN cg$pk_type, do_del IN BOOLEAN DEFAULT TRUE);

  PROCEDURE lck(cg$old_rec  IN cg$row_type,
                cg$old_ind  IN cg$ind_type,
                nowait_flag IN BOOLEAN DEFAULT TRUE);

  --SELECT FOR TABLE TB_RGC
  PROCEDURE slct(cg$sel_rec IN OUT cg$row_type);

  PROCEDURE validate_arc(cg$rec IN OUT cg$row_type);

  PROCEDURE validate_domain(cg$rec IN OUT cg$row_type,
                            cg$ind IN cg$ind_type DEFAULT cg$ind_true);

  PROCEDURE validate_foreign_keys_ins(cg$rec IN cg$row_type);

  PROCEDURE validate_foreign_keys_upd(cg$rec     IN cg$row_type,
                                      cg$old_rec IN cg$row_type,
                                      cg$ind     IN cg$ind_type);

  PROCEDURE validate_foreign_keys_del(cg$rec IN cg$row_type);

  PROCEDURE validate_domain_cascade_delete(cg$old_rec IN cg$row_type);

  PROCEDURE validate_domain_cascade_update(cg$old_rec IN cg$row_type);

  PROCEDURE cascade_update(cg$new_rec IN OUT cg$row_type,
                           cg$old_rec IN cg$row_type);

  PROCEDURE domain_cascade_update(cg$new_rec IN OUT cg$row_type,
                                  cg$new_ind IN OUT cg$ind_type,
                                  cg$old_rec IN cg$row_type);

  PROCEDURE domain_cascade_upd(cg$rec     IN OUT cg$row_type,
                               cg$ind     IN OUT cg$ind_type,
                               cg$old_rec IN cg$row_type);

  PROCEDURE cascade_delete(cg$old_rec IN OUT cg$row_type);

  PROCEDURE domain_cascade_delete(cg$old_rec IN cg$row_type);

  PROCEDURE upd_denorm2(cg$rec IN cg$row_type, cg$ind IN cg$ind_type);

  PROCEDURE upd_oper_denorm2(cg$rec     IN cg$row_type,
                             cg$old_rec IN cg$row_type,
                             cg$ind     IN cg$ind_type,
                             operation  IN VARCHAR2 DEFAULT 'UPD');

END cg$TB_RGC;
/
