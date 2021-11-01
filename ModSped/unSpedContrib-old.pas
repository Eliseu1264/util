unit unSpedContrib;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ACBrBase, ACBrSpedPisCofins, unPadrao, ExtCtrls,
  Mask, rxToolEdit, ComCtrls, Math, StrUtils, unFuncoes, RXCtrls, rxPlacemnt,
  ACBrEPCBlocos,
  ACBrEPCBloco_0, ACBrEPCBloco_0_Class,
  ACBrEPCBloco_A, ACBrEPCBloco_A_Class,
  ACBrEPCBloco_C, ACBrEPCBloco_C_Class,
  ACBrEPCBloco_D, ACBrEPCBloco_D_Class,
  ACBrEPCBloco_M, JvExStdCtrls, JvEdit, JvValidateEdit, rxCurrEdit;


type

  TParticipante0150 = record
    COD_PART : string;  // C�digo de identifica��o do participante no arquivo
    NOME     : string;  // Nome pessoal ou empresarial do participante
    COD_PAIS : string;  // C�digo do pa�s do participante, conforme a tabela indicada no item 3.2.1
    IE       : string;  // Inscri��o Estadual do participante
    COD_MUN  : integer; // C�digo do munic�pio, conforme a tabela IBGE
    SUFRAMA  : string;  // N�mero de inscri��o do participante na Suframa
    ENDE     : string;  // Logradouro e endere�o do im�vel
    NUM      : string;  // N�mero do im�vel
    COMPL    : string;  // Dados complementares do endere�o
    BAIRRO   : string;  // Bairro em que o im�vel est� situado
    NOTA     : string;
    MINUTA   : string;
    FORNE    : string;
    DATA     : TDateTime;
  end;

  TAliquota = class
    cofins: double;
    pis: double;
    icms: double;
    procedure GetValores(Modelo_Minuta: string; dataDocto: TDateTime);
  end;

  TfrmSpedContribuicao = class(TFrmPadrao)
    ACBrSPEDPisCofins1: TACBrSPEDPisCofins;
    BitBtn1: TBitBtn;
    DATA_INICIAL: TDateEdit;
    Label9: TLabel;
    Label10: TLabel;
    DATA_FINAL: TDateEdit;
    NUM_REC_ANTERIOR: TLabeledEdit;
    Label13: TLabel;
    ApuracaoIPI: TComboBox;
    COD_CTA_PRODUTO: TLabeledEdit;
    IND_SIT_ESP: TComboBox;
    Label1: TLabel;
    TIPO_ESCRIT: TComboBox;
    Label6: TLabel;
    Label2: TLabel;
    IND_NAT_PJ: TComboBox;
    Label3: TLabel;
    IND_ATIV: TComboBox;
    CONTA_PIS_COFINS: TLabeledEdit;
    COD_INC_TRIB: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    IND_APRO_CRED: TComboBox;
    Label8: TLabel;
    IND_REG_CUM: TComboBox;
    COD_TIPO_CONT: TComboBox;
    Label7: TLabel;
    DESTACA_IPI_ENTRADA: TCheckBox;
    CheckBoxBlocoP: TCheckBox;
    COD_INC_TRIB_P: TComboBox;
    Label12: TLabel;
    IND_ESCRI: TComboBox;
    RxLabel2: TRxLabel;
    bvSup: TBevel;
    SaveDialog1: TSaveDialog;
    Label11: TLabel;
    FormStorage1: TFormStorage;
    ALIQUOTA_PIS: TCurrencyEdit;
    ALIQUOTA_COFINS: TCurrencyEdit;
    Label14: TLabel;
    Label15: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure TIPO_ESCRITClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    lst0500, lst0190, lst0150, lst0200, lst0400: TStrings;

    procedure GerarBloco_0;
    procedure Registro_O000(reg: TRegistro0000);
    procedure Registro_O001(reg: TRegistro0001);
    procedure Registro_O100(reg: TRegistro0100);
    procedure Registro_O110(reg: TRegistro0110);
    procedure Registro_O140(reg: TRegistro0140);

    procedure GerarBloco_A;
    procedure Registro_A100(a001: TRegistroA001);
    procedure Registro_0150(reg: TParticipante0150);
    procedure Registro_0190(codigo: string);
    procedure Registro_0500(codigo: string);
    procedure Set_Faturamento_0150(var reg: TParticipante0150);
    procedure Set_Entrada_0150(var reg: TParticipante0150);
    procedure LimpaRegistro_O150(var reg: TParticipante0150);
    procedure Registro_A170(reg: TRegistroA100; nota, minuta: string);
    procedure Registro_A990;

    procedure GerarBloco_C;
    procedure Registro_C100(C001: TRegistroC001);
    procedure Registro_C170(reg: TRegistroC100; minuta: string);
    procedure RegistroC170e(reg: TRegistroC100; forne: string);
    procedure Registro_C180;
    procedure Registro_C181(reg: TRegistroC180);
    procedure Registro_C185(reg: TRegistroC180);
    procedure Registro_C860;
    procedure Registro_C870;
    procedure Registro_C990;
    procedure Registro_D990;

    procedure Registro_O200(codigo, descricao, unid, ncm: string); overload;
    procedure Registro_O200(reg: TRegistroC170); overload;
    procedure Registro_O200(reg: TRegistroA170); overload;
    procedure Registro_O400(codigo: string);

    procedure GerarBloco_D;
    procedure GerarBloco_M;
    procedure Registro_D100(D001: TRegistroD001);
    procedure Registro_D101(reg: TRegistroD100);
    procedure Registro_D105(reg: TRegistroD100);
    procedure Registro_M105(reg: TRegistroM100);
    procedure Registro_M505(reg: TRegistroM500);

    { Private declarations }
  public
    { Public declarations }
  end;

const

  NOTA_SAIDA = '130038';
  NOTA_ENTRADA = '10773';

  FECHAMENTO_SQL =
//    '    SELECT '+
//    '        CASE WHEN (FTR_DTSAIDA IS NULL) OR (FTR_DTSAIDA < FTR_DTEMISSAO) '+
//    '            THEN CAST(FTR_DTEMISSAO AS DATE) ELSE CAST(FTR_DTSAIDA AS DATE) END "DATA" '+
//    '        ,''50'' "CST_PIS" '+
//    '        ,''50'' "CST_COFINS" '+
//    '        ,1.65 "ALIQ_PIS" '+
//    '        ,7.60 "ALIQ_COFINS" '+
//    '        ,FTR_VRNOTA "VL_DOC" '+
//    '    FROM FATURAS '+
//    '    INNER JOIN CLIENTE ON CLI_CODIGO = FTR_CLIENTE AND FTR_MINUTA <> ''M'' '+
//    '    INNER JOIN MODELO_EMPRESA ON EMP_MODELO = FTR_MINUTA '+
//    '        AND EMP_NFSERVICO = ''S'' AND FTR_NFSE_RPS_NUMERO IS NOT NULL '+
//    '        AND CLI_PESSOA = ''J'' '+
//    '    WHERE FTR_CANCELADO IS NULL '+
//    '    UNION ALL '+
//    '    SELECT '+
//    '       CASE WHEN (FTR_DTSAIDA IS NULL) OR (FTR_DTSAIDA < FTR_DTEMISSAO) '+
//    '            THEN CAST(FTR_DTEMISSAO AS DATE) ELSE CAST(FTR_DTSAIDA AS DATE) END "DATA" '+
//    '       ,ITF_CST_PIS "CST_PIS" '+
//    '       ,ITF_CST_COFINS "CST_COFINS" '+
//    '       ,ITF_ALIQ_PIS "ALIQ_PIS" '+
//    '       ,ITF_ALIQ_COFINS "ALIQ_COFINS" '+
//    '       ,ITF_VR_ITEM - COALESCE(ITF_VR_DESCONTO, 0) "VL_DOC" '+
//    '    FROM FATURAS F '+
//    '    INNER JOIN ITENS_FATURADOS I ON F.FTR_NOTAFISCAL = I.ITF_NOTAFISCAL AND F.FTR_MINUTA = I.ITF_MINUTA AND FTR_MINUTA <> ''M'' '+
//    '    INNER JOIN MODELO_EMPRESA ON EMP_MODELO = FTR_MINUTA AND EMP_NFSERVICO = ''N'' '+
//    '    INNER JOIN CODIGOS_FISCAIS ON CDF_CODIGO = ITF_COD_FISC '+
//    '    LEFT JOIN MATERIAIS M ON M.MTR_CODIGO = I.ITF_COD_PRODUTO '+
//    '    LEFT JOIN SERVICOS_CODIFICAR ON ITF_COD_SERVICO = SVC_CODIGO '+
//    '    WHERE FTR_CANCELADO IS NULL '+
//    '   UNION ALL '+
    '    SELECT '+
    '         ENT_NOTAFISCAL "NOTA" '+
    '        ,CAST(ENT_DT_ENTRADA AS DATE) "DATA" '+
    '        ,ITE_CST_PIS "CST_PIS" '+
    '        ,ITE_CST_COFINS "CST_COFINS" '+
    '        ,ITE_ALIQ_PIS "ALIQ_PIS" '+
    '        ,ITE_ALIQ_COFINS "ALIQ_COFINS" '+
    '        ,ITE_VR_ITEM "VL_DOC" '+
    '    FROM ITENS_ENTRADA IE '+
    '    LEFT JOIN MATERIAIS M ON (M.MTR_CODIGO = IE.ITE_PRODUTO) '+
    '    INNER JOIN ENTRADAS E ON E.ENT_NOTAFISCAL = IE.ITE_NFISCAL '+
    '         AND E.ENT_EMISSAO = IE.ITE_EMISSAO '+
    '         AND E.ENT_FORNECEDOR = IE.ITE_FORNECEDOR '+
    '    LEFT JOIN DECRETOS D ON D.DEC_CODIGO = M.MTR_DECRETO AND M.MTR_DATA_DECRETO = D.DEC_DATA '+
    '    INNER JOIN FORNECEDORES ON FRN_CODIGO = E.ENT_FORNECEDOR AND ITE_COD_FISC IN (''1128'',''2128'') '+
      '    ';

  CONHECIMENTO_SQL =
    'SELECT '+
    '   ''01'' "ESTABEL", '+
    '    CAST(CHF_DATA_ENTRADA AS DATE) "ENTRADA", '+
    '    CHF_CFOP "CFOP", '+
    '    ''0''||CHF_CST "CST_ICMS", '+
    '    CHF_ICMS / CASE WHEN COALESCE(CHF_BASE, 0) = 0 THEN 1 ELSE COALESCE(CHF_BASE, 0) END "ALIQ_ICMS", '+
    '    0 "IND_OPER", '+
    '    1 "IND_EMIT", '+
    '    CHF_CNPJ "COD_PART", '+
    '    CHF_MOD "COD_MOD", '+
    '    CASE WHEN (CAST(CHF_DATA_ENTRADA AS DATE) < :DATA1) OR (CAST(CHF_DATA_ENTRADA AS DATE) > :DATA2) THEN ''01'' ELSE ''00'' END "COD_SIT", '+
    '    0 "SER", '+
    '    0 "SUB", '+
    '    CHF_NUMERO "NUM_DOC", '+
    '    CHF_KEY "CHV_CTE", '+
    '    CAST(CHF_DATA_ENTRADA AS DATE) "DT_DOC", '+
    '    CAST(CHF_DATA_ENTRADA AS DATE) "DT_A_P", '+
    '    0 "TP_CTe", '+
    '    CAST(CHF_BASE AS NUMERIC(13, 2)) "VL_DOC", '+
    '    CASE WHEN COALESCE(CTP_VALOR, 0) > 0 THEN 1 ELSE 0 END "IND_FRT", '+
    '    CAST(CHF_BASE AS NUMERIC(13, 2)) "VL_SERV", '+
    '    CAST(CHF_BASE * CASE WHEN COALESCE(CHF_ICMS, 0) = 0 THEN 0 ELSE 1 END AS NUMERIC(13, 2)) "VL_BC_ICMS", '+
    '    CAST(CHF_ICMS * CASE WHEN COALESCE(CHF_ICMS, 0) = 0 THEN 0 ELSE 1 END AS NUMERIC(13, 2)) "VL_ICMS", '+
    '    CHF_CMUN_ORIG, '+
    '    CHF_CMUN_DEST '+
    'FROM CONHECIMENTO_FRETE '+
    'LEFT JOIN CONTAS_PAGAR ON CTP_CHAVE_ELET_CONH = CHF_KEY ';
//    'WHERE CHF_NUMERO = ''2896629'' ';

  PARTICIPANTE_FATURAMENTO =
    'SELECT '+
    '    FTR_NOTAFISCAL "NOTA", '+
    '    FTR_MINUTA "MINUTA", '+
    '    CASE WHEN COALESCE(FTR_CGC_FATU, '''') <> '''' THEN FTR_CGC_FATU '+
    '         WHEN COALESCE(FTR_CPF_FATU, '''') <> '''' THEN FTR_CPF_FATU '+
    '         WHEN COALESCE(FTR_CGC, '''') <> '''' THEN FTR_CGC '+
    '         WHEN COALESCE(FTR_CPF, '''') <> '''' THEN FTR_CPF END "COD_PART", '+
    '    COALESCE(CLI_NOME, FTR_NOME_CLIENTE) "NOME", '+
    '    ''1058'' "COD_PAIS", '+
    '    CASE WHEN COALESCE(FTR_CGF_FATU, '''') <> '''' THEN FTR_CGF_FATU '+
    '         WHEN COALESCE(FTR_CGF, '''') <> '''' THEN FTR_CGF '+
    '         WHEN COALESCE(CLI_CGF, '''') <> '''' THEN CLI_CGF END "IE", '+
    '    FTR_NFE_CMUN "COD_MUN", '+
    '    CLI_SUFRAMA "SUFRAMA", '+
    '    CASE WHEN COALESCE(FTR_END_FATU, '''') <> '''' THEN FTR_END_FATU ELSE CLI_ENDERECO END "ENDE", '+
    '    CASE WHEN COALESCE(FTR_BAI_FATU, '''') <> '''' THEN CLI_BAIRRO ELSE CLI_ENDERECO END "BAIRRO" '+
    'FROM FATURAS '+
    'INNER JOIN CLIENTE ON CLI_CODIGO = FTR_CLIENTE AND FTR_MINUTA <> ''M'' AND FTR_CANCELADO IS NULL ';
//    'WHERE FTR_NOTAFISCAL =  ''024486'' ';

  NOTA_SERVICO =
    'SELECT '+
    '    FTR_NOTAFISCAL "NOTA", '+
    '    FTR_MINUTA "MINUTA", '+
    '    CASE WHEN (COALESCE(FTR_AVISTA, 0) = 100) THEN 0 ELSE 1 END "IND_PGTO", '+
    '    FTR_VRNOTA "VL_DOC", '+
    '    CASE WHEN (FTR_DTSAIDA IS NULL) OR (FTR_DTSAIDA < FTR_DTEMISSAO) THEN CAST(FTR_DTEMISSAO AS DATE) '+
    '        ELSE CAST(FTR_DTSAIDA AS DATE) END "DT_DOC", '+
    '    FTR_NFSE_COD_VER "CHV_NFSE", '+
    '    COALESCE(FTR_NFSE_RPS_NUMERO, FTR_NFSE_NUMERO) "NUM_DOC", '+
    '    CASE WHEN FTR_CANCELADO IS NULL THEN ''00'' ELSE ''02'' END "COD_SIT", '+
    '    FTR_VALOR_PIS "VL_PIS", '+
    '    FTR_VALOR_COFINS "VL_COFINS", '+
    '    FTR_VALOR_ISS "VL_ISS", '+
    '    CASE WHEN COALESCE(FTR_CGC_FATU, '''') <> '''' THEN FTR_CGC_FATU '+
    '         WHEN COALESCE(FTR_CPF_FATU, '''') <> '''' THEN FTR_CPF_FATU '+
    '         WHEN COALESCE(FTR_CGC, '''') <> '''' THEN FTR_CGC '+
    '         WHEN COALESCE(FTR_CPF, '''') <> '''' THEN FTR_CPF END "COD_PART", '+
    '    COALESCE(CLI_NOME, FTR_NOME_CLIENTE) "NOME", '+
    '    ''1058'' "COD_PAIS", '+
    '    CASE WHEN COALESCE(FTR_CGF_FATU, '''') <> '''' THEN FTR_CGF_FATU '+
    '         WHEN COALESCE(FTR_CGF, '''') <> '''' THEN FTR_CGF '+
    '         WHEN COALESCE(CLI_CGF, '''') <> '''' THEN CLI_CGF END "IE", '+
    '    FTR_NFE_CMUN "COD_MUN", '+
    '    CLI_SUFRAMA "SUFRAMA", '+
    '    CASE WHEN COALESCE(FTR_END_FATU, '''') <> '''' THEN FTR_END_FATU ELSE CLI_ENDERECO END "ENDERECO", '+
    '    CASE WHEN COALESCE(FTR_BAI_FATU, '''') <> '''' THEN CLI_BAIRRO ELSE CLI_ENDERECO END "BAIRRO" '+
    'FROM FATURAS '+
    'INNER JOIN CLIENTE ON CLI_CODIGO = FTR_CLIENTE AND FTR_MINUTA <> ''M'' '+
    'INNER JOIN MODELO_EMPRESA ON EMP_MODELO = FTR_MINUTA '+
    '    AND EMP_NFSERVICO = ''S'' AND FTR_NFSE_RPS_NUMERO IS NOT NULL '+
    '    AND FTR_CANCELADO IS NULL ';

  SAIDA_REGC170 =
    'SELECT '+
    '   FTR_NR_SAT "NR_SAT", '+
    '   FTR_NFSE_RPS_NUMERO, '+
    '   F.FTR_NOTAFISCAL, '+
    '   F.FTR_MINUTA, '+
    '   I.ITF_SEQUENCIA2 "NUM_ITEM", '+
    '   CAST(CASE WHEN FTR_QRCODE IS NOT NULL THEN ''59'' '+
    '             WHEN FTR_CHAVE_NFE IS NOT NULL THEN ''55'' '+
    '             ELSE ''01'' END AS VARCHAR(2)) "COD_MOD", '+
    '    CASE WHEN (FTR_DTSAIDA IS NULL) OR (FTR_DTSAIDA < FTR_DTEMISSAO) THEN CAST(FTR_DTEMISSAO AS DATE) '+
    '        ELSE CAST(FTR_DTSAIDA AS DATE) END "DT_DOC", '+
    '   COALESCE(MTR_CODIGO, SVC_CODIGO, ''SERVICO'') "COD_ITEM", '+
    '   CASE WHEN MTR_CODIGO IS NOT NULL THEN MTR_DESCRICAO '+
    '        WHEN SVC_NCM IS NOT NULL THEN SVC_DESCRICAO '+
    '        ELSE ''SERVICOS GRAFICOS EM GERAL'' END "DESCR_COMPL", '+
    '   COALESCE(I.ITF_QUANTIDADE, 0) "QTD", '+
    '   CASE WHEN COALESCE(MTR_UNIDADE, '''') <> '''' THEN MTR_UNIDADE ELSE ''UND'' END "UNID", '+
    '   ITF_VR_ITEM - COALESCE(ITF_VR_DESCONTO, 0) "VL_ITEM", '+
    '   CASE WHEN (I.ITF_COD_FISC IS NULL) THEN F.FTR_COD_FISC ELSE I.ITF_COD_FISC END "CFOP", '+
    '   (COALESCE(I.ITF_VR_ITEM, 0)-COALESCE(I.ITF_VR_DESCONTO, 0))*(COALESCE(I.ITF_ALIQ_ICMS, 0)/100) "VL_ICMS", '+
    '   ITF_IPICST "CST_IPI", '+
    '   ITF_VR_ICMS_SUBST "VL_ICMS_ST", '+
    '   ITF_ALIQ_ICMS_SUBST "ALIQ_ST", '+
    '   ITF_BASE_ICMS_SUBST "VL_BC_ST", '+
    '   CASE WHEN (COALESCE(FTR_UF_ENTREGA, '''') <> '''') AND (FTR_UF_FATU <> FTR_UF_ENTREGA) THEN '+
    '     F.FTR_UF_ENTREGA '+
    '   ELSE CASE WHEN (SUBSTRING(FTR_COD_FISC FROM 1 FOR 1) = ''6'') AND (F.FTR_UF_FATU = ''CE'') AND (FTR_UF_COBRA <> ''CE'') THEN '+
    '     F.FTR_UF_COBRA '+
    '   ELSE '+
    '     F.FTR_UF_FATU '+
    '   END END "UF", '+
    '   (I.ITF_VR_ITEM - I.ITF_VR_DESCONTO) * (CASE WHEN (COALESCE(I.ITF_ALIQ_ICMS, 0)=0) THEN 0 ELSE 1 END) "VL_BC_ICMS", '+
    '   CASE WHEN (I.ITF_VR_IPI > 0) THEN I.ITF_VR_ITEM ELSE 0 END "BASE_IPI", '+
    '   M.MTR_SIT_TRIB, '+
    '   SUBSTRING(COALESCE(M.MTR_SIT_TRIB_A, ''0'') FROM 1 FOR 1)||COALESCE(M.MTR_SIT_TRIB_B, ''00'') "CST_ICMS", '+
    '   COALESCE(M.MTR_COD_IPI, ''00'') "MTR_COD_IPI", '+
    '   I.ITF_OUTRA_OPC_FISCAL, '+
    '   COALESCE(M.MTR_PCO_CUSTO, 0) "MTR_PCO_CUSTO", '+
    '   COALESCE(I.ITF_VR_ITEM, 0) "VALOR_ITEM_IPI", '+
    '   COALESCE(I.ITF_VR_ITEM, 0)/CASE WHEN(COALESCE(I.ITF_QUANTIDADE, 0) = 0) THEN 1 ELSE ITF_QUANTIDADE END "UNITARIO", '+
    '   COALESCE(MTR_CODIGO_NCM, SVC_NCM) "NCM", '+
    '   COALESCE(I.ITF_ALIQ_IPI, 0) "ALIQ_IPI", '+
    '   COALESCE(I.ITF_VR_IPI, 0) "VALOR_IPI", '+
    '   ((COALESCE(I.ITF_VR_ITEM, 0)-COALESCE(I.ITF_VR_DESCONTO, 0))/CASE WHEN(COALESCE(I.ITF_QUANTIDADE, 0) = 0) THEN 1 ELSE ITF_QUANTIDADE END)*(COALESCE(I.ITF_ALIQ_ICMS, 0)/100) vUnTrib, '+
    '   COALESCE(F.FTR_VRFRETE, 0) "VALOR_FRETE", '+
    '   COALESCE(I.ITF_VR_DESCONTO, 0) "VL_DESC", '+
    '   COALESCE(I.ITF_ALIQ_ICMS, 0) "ALIQ_ICMS", '+
    '   CASE WHEN (ITF_OUTRA_OPC_FISCAL=''2'') or (MTR_SIT_TRIB=''S'') THEN ''S'' ELSE ''N'' END "SUBTRIB", '+
    '   F.FTR_CLIENTE "CLIENTE", '+
    '   F.FTR_DTEMISSAO "DATA", '+
    '   CASE WHEN (F.FTR_CANCELADO IS NULL) THEN ''N'' ELSE ''S'' END "SITUACAO" '+
    '   ,CAST(COALESCE(ITF_VR_DESCONTO,0) AS NUMERIC(12,2)) "VLDESCONTO" '+
    '   ,ITF_CST_PIS "CST_PIS" '+
    '   ,ITF_VALOR_PIS "VL_PIS" '+
    '   ,ITF_CST_COFINS "CST_COFINS" '+
    '   ,ITF_VALOR_COFINS "VL_COFINS" '+
    '   ,ITF_ALIQ_PIS "ALIQ_PIS" '+
    '   ,ITF_ALIQ_COFINS "ALIQ_COFINS" '+
    'FROM FATURAS F '+
    'INNER JOIN ITENS_FATURADOS I ON F.FTR_NOTAFISCAL = I.ITF_NOTAFISCAL AND F.FTR_MINUTA = I.ITF_MINUTA AND FTR_MINUTA <> ''M'' '+
    'INNER JOIN MODELO_EMPRESA ON EMP_MODELO = FTR_MINUTA AND EMP_NFSERVICO = ''N'' '+
    'INNER JOIN CODIGOS_FISCAIS ON CDF_CODIGO = ITF_COD_FISC '+
    'LEFT JOIN MATERIAIS M ON M.MTR_CODIGO = I.ITF_COD_PRODUTO '+
    'LEFT JOIN SERVICOS_CODIFICAR ON ITF_COD_SERVICO = SVC_CODIGO '+
    'WHERE ITF_CST_COFINS <> ''01'' '+
    '     AND ((ITF_ALIQ_PIS > 0) AND (ITF_ALIQ_COFINS > 0)) AND FTR_CANCELADO IS NULL ';
//    'WHERE FTR_NOTAFISCAL =  ''024486'' ';

  ENTRADA_REGC170 =
    'SELECT '+
    '    MTR_DESCRICAO "DESCR_COMPL", '+
    '    E.ENT_NOTAFISCAL "NOTA", '+
    '    E.ENT_DT_ENTRADA, '+
    '    E.ENT_FORNECEDOR, '+
    '    COALESCE(ENT_ESTABEL, ''01'') "ESTABEL", '+
    '    M.MTR_CODIGO "COD_ITEM", '+
    '    CASE WHEN COALESCE(MTR_UNIDADE, '''') <> '''' THEN MTR_UNIDADE ELSE ''UND'' END "UNID", '+
    '    0 "IND_MOV", '+
    '    COALESCE(M.MTR_SIT_TRIB_A, ''0'')||COALESCE(M.MTR_SIT_TRIB_B, 0) "CST_ICMS", '+
    '    CASE WHEN (IE.ITE_COD_FISC IS NULL) THEN E.ENT_COD_FISC ELSE IE.ITE_COD_FISC END "CFOP", '+
    '    ITE_VR_ITEM * CASE WHEN COALESCE(ITE_ICMS, 0) > 0 THEN 1 ELSE 0 END "VL_BC_ICMS", '+
    '    ITE_VR_ITEM * COALESCE(ITE_ICMS, 0)/100 "VL_ICMS", '+
    '    COALESCE(ITE_ICMS, 0) "ALIQ_ICMS", '+
    '    CAST((ITE_PC_CUSTO * ite_quantidade * ITE_DESCONTO/100)+ITE_VR_DESCONTO AS NUMERIC(13, 2)) "VL_DESC", '+
    '    COALESCE(ITE_ICMSAGREGADO,0) "VL_ICMS_ST", '+
    '    COALESCE(ITE_BASEAGREGADO, 0) "VL_BC_ICMS_ST", '+
    '    COALESCE(IE.ITE_QUANTIDADE, 0) "QTD", '+
    '    CASE WHEN COALESCE(IE.ITE_C_AGREGADO, 0)=0 THEN ITE_ALIQUOTAGREGADO ELSE COALESCE(IE.ITE_C_AGREGADO, 0) END "ALIQ_ST", '+
    '    ITE_VR_ITEM - COALESCE(ITE_VR_DESCONTO, 0) "VL_ITEM", '+
    '    COALESCE(M.MTR_COD_IPI, ''00'') "COD_ENQ", '+
    '    CASE WHEN (COALESCE(IE.ITE_IPI, 0) > 0) THEN IE.ITE_VR_ITEM ELSE 0 END "VL_BC_IPI", '+
    '    COALESCE(IE.ITE_IPI, 0) "ALIQ_IPI", '+
    '    CAST(IE.ITE_VR_IPI AS NUMERIC(13, 2)) "VL_IPI", '+
    '    ''00'' "CST_IPI", '+
    '    0 "IND_APUR", '+
    '    (CAST( ( (1 - COALESCE(IE.ITE_REDUCAO,0)/100 ) * (IE.ITE_VR_ITEM) - (IE.ITE_VR_ITEM) '+
    '        * COALESCE(IE.ITE_DESCONTO, 0)/100 - COALESCE(IE.ITE_VR_DESCONTO,0) ) '+
    '        * CASE WHEN (IE.ITE_OUTRA_OPC_FISCAL=''2'') OR (M.MTR_SIT_TRIB = ''S'') THEN 0 ELSE 1 END '+
    '        * ((CASE WHEN (FRN_ESTADO = ''CE'') THEN CASE WHEN (FRN_CGC IS NOT NULL) THEN COALESCE(D.DEC_PERC_DENTRO_J, 0) ELSE COALESCE(DEC_PERC_DENTRO_F, 0) END ELSE CASE WHEN (FRN_CGC IS NOT NULL) THEN COALESCE(D.DEC_PERC_FORA_J, 0) '+
    '                 ELSE COALESCE(DEC_PERC_FORA_F, 0) END END)/100) '+
    '        * (COALESCE(IE.ITE_ICMS, 0)/100) AS NUMERIC(15, 2) ) ) "VL_RED_BC", '+
    '    (CASE WHEN COALESCE(ENT_TIPO_FRETE, ''V'') = ''V'' THEN COALESCE(ITE_VR_FRETE, 0) ELSE COALESCE(ITE_VR_ITEM,0) * COALESCE(ITE_FRETE,0)/100 END ) "VL_FRETE", '+
    '    ITE_VALOROUTROS "VL_OUTROS", '+
    '    ITE_ALIQ_PIS "ALIQ_PIS_PERC", '+
    '    ITE_ALIQ_COFINS "ALIQ_COFINS_PERC", '+
    '    ITE_CST_PIS "CST_PIS", '+
    '    ITE_CST_COFINS "CST_COFINS", '+

    '    ITE_VR_ITEM * CASE WHEN COALESCE(ITE_ALIQ_PIS, 0) > 0 THEN 1 ELSE 0 END "VL_BC_PIS", '+
    '    ITE_VR_ITEM * CASE WHEN COALESCE(ITE_ALIQ_COFINS, 0) > 0 THEN 1 ELSE 0 END "VL_BC_COFINS" '+

    'FROM ITENS_ENTRADA IE '+
    'LEFT JOIN MATERIAIS M ON (M.MTR_CODIGO = IE.ITE_PRODUTO) '+
    'INNER JOIN ENTRADAS E ON E.ENT_NOTAFISCAL = IE.ITE_NFISCAL '+
    '     AND E.ENT_EMISSAO = IE.ITE_EMISSAO '+
    '     AND E.ENT_FORNECEDOR = IE.ITE_FORNECEDOR '+
    'LEFT JOIN DECRETOS D ON D.DEC_CODIGO = M.MTR_DECRETO AND M.MTR_DATA_DECRETO = D.DEC_DATA '+
    'INNER JOIN FORNECEDORES ON FRN_CODIGO = E.ENT_FORNECEDOR '+
    'WHERE ((ITE_ALIQ_COFINS > 0) OR (ITE_ALIQ_PIS > 0)) AND ITE_COD_FISC IN (''1128'',''2128'') ';
//    'WHERE ENT_NOTAFISCAL = ''95303'' ';

  LISTA_ENTRADA_REG100 =
    'SELECT DISTINCT '+
    '   0 "IND_OPER", '+
    '   1 "IND_EMIT", '+
    '   COALESCE(ENT_ESTABEL, ''01'') "ESTABEL", '+
    '   CASE WHEN (FRN_CGC IS NOT NULL) THEN FRN_CGC ELSE FRN_CPF END "COD_PART", '+
    '   E.ENT_FORNECEDOR, '+
    '   CASE WHEN (E.ENT_CHAVE_NFE IS NOT NULL) THEN ''55'' ELSE ''01'' END "COD_MOD", '+
    '   ''00'' "COD_SIT", '+
    '   E.ENT_NOTAFISCAL "NUM_DOC", '+
    '   CAST(ENT_CHAVE_NFE AS VARCHAR(44)) "CHV_NFE", '+
    '   CAST(E.ENT_EMISSAO AS DATE) "DT_E_S", '+
    '   CASE WHEN (E.ENT_DT_ENTRADA IS NULL) OR (CAST(E.ENT_DT_ENTRADA AS DATE) < CAST(E.ENT_EMISSAO AS DATE)) THEN CAST(E.ENT_EMISSAO AS DATE) '+
    '         ELSE CAST(E.ENT_DT_ENTRADA AS DATE) END "DT_DOC", '+
    '   SUM(ITE_VR_ITEM + COALESCE(ITE_VR_FRETE, 0) - COALESCE(ITE_VR_DESCONTO, 0))+COALESCE(ENT_OUTRAS_DESPESAS, 0)+COALESCE(ENT_SUBST_ICMS, 0) "VL_DOC", '+
    '   CASE WHEN CAST(E.ENT_VENCDUPL1 AS DATE) = CAST(E.ENT_EMISSAO AS DATE) THEN ''0'' ELSE ''1'' END "IND_PGTO", '+
    '   CAST(SUM((IE.ITE_PC_CUSTO * IE.ite_quantidade * IE.ITE_DESCONTO/100)+IE.ITE_VR_DESCONTO) AS NUMERIC(13, 2)) "VL_DESC", '+
    '   SUM(CAST(IE.ITE_PC_CUSTO * (1+IE.ITE_IPI/100) * IE.ITE_QUANTIDADE AS NUMERIC(13, 2))) "VL_MERC", '+
    '   CASE WHEN COALESCE(E.ENT_TIPO_FRETE, ''1'') = ''1'' THEN 0 ELSE 1 END "IND_FRT", '+
    '   CAST(E.ENT_VR_FRETE AS NUMERIC(13, 2)) "VL_FRT", '+
    '   CAST(SUM(IE.ITE_V_OUTRAS_DESP) AS NUMERIC(13, 2)) "VL_OUT_DA", '+
    '   SUM(ITE_VR_ITEM * CASE WHEN COALESCE(ITE_ICMS, 0) > 0 THEN 1 ELSE 0 END) "VL_BC_ICMS", '+
    '   SUM(CASE WHEN ITE_VR_ITEM <= 0 THEN 0 ELSE ITE_VR_ITEM*ITE_ICMS/100 END) "VL_ICMS", '+
    '   SUM(COALESCE(ITE_BASEAGREGADO, 0)) "VL_BC_ICMS_ST", '+
    '   SUM(COALESCE(ITE_ICMSAGREGADO,0)) "VL_ICMS_ST", '+
    '   SUM(CASE WHEN (IE.ITE_OUTRA_OPC_FISCAL=''2'') or (M.MTR_SIT_TRIB = ''S'') THEN CAST((IE.ITE_PC_CUSTO * (1+IE.ITE_IPI/100) * IE.ITE_QUANTIDADE)+COALESCE(IE.ITE_ICMSAGREGADO,0) AS NUMERIC(13, 2)) ELSE 0 END) "ISENTO", '+
    '   CAST(SUM(IE.ITE_VR_IPI) AS NUMERIC(13, 2)) "VL_IPI", '+
    '   SUM(CAST(IE.ITE_PC_CUSTO * (1+IE.ITE_IPI/100) * IE.ITE_QUANTIDADE AS NUMERIC(13, 2))) "VALORBRUTO" '+
    '   ,SUM(COALESCE(ITE_V_PIS, 0)) "VL_PIS" '+
    '   ,SUM(COALESCE(ITE_V_COFINS, 0)) "VL_COFINS" '+
    'FROM ENTRADAS E '+
    'INNER JOIN ITENS_ENTRADA IE ON IE.ITE_NFISCAL = E.ENT_NOTAFISCAL AND IE.ITE_EMISSAO = E.ENT_EMISSAO AND IE.ITE_FORNECEDOR = E.ENT_FORNECEDOR '+
    'INNER JOIN MATERIAIS M ON M.MTR_CODIGO = IE.ITE_PRODUTO '+
    'LEFT JOIN DECRETOS D ON D.DEC_CODIGO = M.MTR_DECRETO AND M.MTR_DATA_DECRETO = D.DEC_DATA '+
    'INNER JOIN FORNECEDORES F ON FRN_CODIGO = E.ENT_FORNECEDOR '+
    'WHERE E.ENT_OPERACAO IN (''1'', ''2'', ''3'',''B'',''5'',''A'') '+
    '   AND NOT EXISTS (SELECT 1 FROM FATURAS WHERE FTR_CHAVE_NFE = ENT_CHAVE_NFE) '+
    '   AND ITE_COD_FISC IN (''1128'',''2128'') '+
    'GROUP BY '+
    '    E.ENT_CHAVE_NFE '+
    '   ,E.ENT_NOTAFISCAL '+
    '   ,E.ENT_EMISSAO '+
    '   ,E.ENT_DT_ENTRADA '+
    '   ,ENT_VRNOTFISCAL '+
    '   ,E.ENT_VENCDUPL1 '+
    '   ,E.ENT_TIPO_FRETE '+
    '   ,ENT_FORNECEDOR '+
    '   ,FRN_CGC '+
    '   ,FRN_CPF '+
    '   ,E.ENT_VR_FRETE '+
    '   ,ENT_OUTRAS_DESPESAS '+
    '   ,ENT_ESTABEL '+
    '   ,ENT_SUBST_ICMS ';

  LISTA_SAIDA_REG100 =
    'SELECT '+
    '   FTR_NOTAFISCAL "NOTA", '+
    '   FTR_MINUTA "MINUTA", '+
    '   CAST(SUBSTRING(F.FTR_INF_COMP FROM 1 FOR 250) AS VARCHAR(250)) "COMPL", '+
    '   ''0'' "IND_EMIT", '+
    '   CASE WHEN (FTR_NFE_COR_CORRECAO IS NOT NULL) THEN ''06'' '+
    '        ELSE CASE WHEN FTR_NFE_CSTAT IN (''301'',''302'') THEN ''04'' '+
    '        ELSE CASE WHEN (FTR_CANCELADO IS NOT NULL) THEN ''02'' '+
    '        WHEN (FTR_NFE_CSTAT = ''100'') '+
    '            AND (FTR_CANCELADO IS NULL) THEN ''00'' '+
    '   END END END "COD_SIT", '+
    '    CASE WHEN COALESCE(FTR_CGC_FATU, '''') <> '''' THEN FTR_CGC_FATU '+
    '         WHEN COALESCE(FTR_CPF_FATU, '''') <> '''' THEN FTR_CPF_FATU '+
    '         WHEN COALESCE(FTR_CGC, '''') <> '''' THEN FTR_CGC '+
    '         WHEN COALESCE(FTR_CPF, '''') <> '''' THEN FTR_CPF END "COD_PART", '+
    '   CASE WHEN (FTR_CUPOM IS NOT NULL) THEN CAST(FTR_CUPOM AS VARCHAR(12)) ELSE '+
    '       CASE WHEN (FTR_NF_CONSUMIDOR IS NOT NULL) THEN CAST(FTR_NF_CONSUMIDOR AS VARCHAR(12)) ELSE '+
    '       CAST(FTR_NOTAFISCAL AS VARCHAR(12)) END END "NUM_DOC", '+
    '   CASE WHEN (COALESCE(FTR_OPERACAO,''1'') = ''E'') THEN ''0'' ELSE ''1'' END "IND_OPER", '+
    '   CAST(CASE WHEN FTR_QRCODE IS NOT NULL THEN ''59'' '+
    '             WHEN FTR_CHAVE_NFE IS NOT NULL THEN ''55'' '+
    '             ELSE ''01'' END AS VARCHAR(2)) "COD_MOD", '+
    '   CASE WHEN FTR_VENCIMENTO1 IS NULL THEN ''9''  '+
    '        WHEN CAST(FTR_VENCIMENTO1 AS DATE) = CAST(FTR_DTEMISSAO AS DATE) THEN ''0'' '+
    '        ELSE ''1'' END "IND_PGTO", '+
    '   CAST(FTR_CHAVE_NFE AS VARCHAR(44)) "CHV_NFE", '+
    '   CASE WHEN (FTR_DTSAIDA IS NULL) OR (FTR_DTSAIDA < FTR_DTEMISSAO) THEN CAST(FTR_DTEMISSAO AS DATE) '+
    '        ELSE CAST(FTR_DTSAIDA AS DATE) END "DT_DOC", '+
    '   CASE WHEN COALESCE(FTR_FRETE_CONTA, ''1'')=''1'' THEN 0 ELSE 1 END "IND_FRT", '+
    '   CASE WHEN ((SELECT PCG_CAMPO FROM PARAMETROS_CONFIGURACAO WHERE PCG_CODIGO = ''481'') = ''SIM'') THEN '+
    '      CAST(CASE WHEN (FTR_SER_SELO IS NOT NULL) THEN FTR_SER_SELO ELSE CASE WHEN (FTR_NF_CONSUMIDOR IS NULL) THEN ''000'' ELSE ''D'' END END AS VARCHAR(3)) '+
    '   ELSE '+
    '      CAST(CASE WHEN (FTR_CHAVE_NFE IS NOT NULL) THEN FTR_SER_SELO ELSE CASE WHEN (FTR_NF_CONSUMIDOR IS NULL) THEN ''000'' ELSE CASE WHEN (FTR_SER_SELO IS NOT NULL) THEN FTR_SER_SELO ELSE ''D'' END END END AS VARCHAR(3)) '+
    '   END "SER", '+
    '   CAST(COALESCE(FTR_VR_SERVICO, 0)*CASE WHEN (COALESCE(FTR_VR_SERVICO,0)>0) THEN 0 ELSE 1 END AS NUMERIC(13, 2)) "FTR_VR_SERVICO", '+
    '   CAST(0 AS NUMERIC(15,4)) "VL_ABAT_NT", '+
    '   CAST(0 AS NUMERIC(15,4)) "VL_SEG", '+
    '   CAST(COALESCE(FTR_BSEICMS_SUB, 0)*CASE WHEN (COALESCE(FTR_VR_SERVICO,0)>0) THEN 0 ELSE 1 END AS NUMERIC(13, 2)) "VL_BC_ICMS_ST", '+
    '   CAST(COALESCE(FTR_VR_ICMS_SUB, 0)*CASE WHEN (COALESCE(FTR_VR_SERVICO,0)>0) THEN 0 ELSE 1 END AS NUMERIC(13, 2)) "VL_ICMS_ST", '+
    '   CAST(COALESCE(FTR_VR_IPI, 0)*CASE WHEN (COALESCE(FTR_VR_SERVICO,0)>0) THEN 0 ELSE 1 END AS NUMERIC(13, 2)) "VL_IPI", '+
    '   CAST(COALESCE(FTR_VRFRETE, 0)*CASE WHEN (COALESCE(FTR_VR_SERVICO,0)>0) THEN 0 ELSE 1 END AS NUMERIC(13, 2)) "VL_FRT", '+
    '   CAST(COALESCE(FTR_DESC_NOTA, 0)*CASE WHEN (COALESCE(FTR_VR_SERVICO,0)>0) THEN 0 ELSE 1 END AS NUMERIC(13, 2)) "VL_DESC", '+
    '   COALESCE(SUM(ITF_VR_OUTROS_AJUSTE), 0)+COALESCE(SUM(ITF_VR_OUTROS_AJUSTE), 0) "VL_OUT_DA", '+
    '   CAST(SUM(COALESCE(I.ITF_VR_ITEM_L, 0) '+
    '       * CASE WHEN (COALESCE(FTR_VR_SERVICO,0)>0) THEN 0 ELSE 1 END*(1+(COALESCE(I.ITF_ALIQ_IPI,0)/100)))+SUM((I.ITF_VR_ITEM_L/(FTR_VRNOTA2-COALESCE(FTR_OUTDESPESA,0)+COALESCE(FTR_DESC_NOTA,0)))* '+
    '         (COALESCE(FTR_OUTDESPESA,0)-COALESCE(FTR_DESC_NOTA,0))) AS NUMERIC(13, 2)) "VL_DOC", '+
    '   CAST(SUM((COALESCE(I.ITF_VR_ITEM_L, 0)+COALESCE(I.ITF_VR_CONTAB_AJUSTE, 0))*CASE WHEN (COALESCE(FTR_VR_SERVICO,0)>0) THEN 0 ELSE 1 END '+
    '        *(1+(COALESCE(I.ITF_ALIQ_IPI,0)/100)))+SUM((I.ITF_VR_ITEM_L/(F.FTR_VRNOTA2-COALESCE(F.FTR_OUTDESPESA,0)+COALESCE(F.FTR_DESC_NOTA,0)))* '+
    '         (COALESCE(F.FTR_OUTDESPESA,0)-COALESCE(F.FTR_DESC_NOTA,0))) AS NUMERIC(13, 2)) "VL_MERC", '+
    '   CAST( CASE WHEN ( SELECT SUM(ITF_ALIQ_ICMS) FROM ITENS_FATURADOS WHERE ITF_NOTAFISCAL = F.FTR_NOTAFISCAL AND ITF_MINUTA = F.FTR_MINUTA ) = 0 THEN '+
    '      SUM( COALESCE(CASE WHEN ( SELECT SUM(ITF_ALIQ_ICMS * CASE WHEN RIGHT(COALESCE(ITF_COD_FISC, ''''), 3) IN (''210'',''201'',''556'',''412'') THEN 0 ELSE 1 END) FROM ITENS_FATURADOS '+
    '        WHERE ITF_NOTAFISCAL = F.FTR_NOTAFISCAL AND ITF_MINUTA = F.FTR_MINUTA ) = 0 THEN '+
    '        FTR_OUTDESPESA END * ITF_VR_ITEM_L / CASE WHEN (FTR_VRNOTA2 > 0) THEN (FTR_VRNOTA2 - FTR_OUTDESPESA) ELSE 1 END, 0) ) '+
    '   ELSE '+
    '      SUM( COALESCE(I.ITF_VR_BASCALC_AJUSTE,0) + ( CASE WHEN M.MTR_DECRETO IS NULL THEN COALESCE(I.ITF_VR_ITEM_L,0) ELSE COALESCE(I.ITF_VR_ITEM,0) END *CASE WHEN (COALESCE(FTR_VR_SERVICO,0)>0) THEN 0 ELSE 1 END '+
    '          * (CASE WHEN (M.MTR_DECRETO IS NULL) THEN (1-COALESCE(FTR_DESC_NOTA,0)/(COALESCE(FTR_VRNOTA2,1)+COALESCE(FTR_DESC_NOTA,0))) ELSE 1 END) '+
    '          * (1-(CASE WHEN (FTR_UF_FATU = ''CE'') THEN CASE WHEN (FTR_CGC_FATU IS NOT NULL) THEN COALESCE(D.DEC_PERC_DENTRO_J, 0) ELSE COALESCE(DEC_PERC_DENTRO_F, 0) END '+
    '             ELSE CASE WHEN (FTR_CGC_FATU IS NOT NULL) THEN COALESCE(D.DEC_PERC_FORA_J, 0) ELSE COALESCE(DEC_PERC_FORA_F, 0) END END)/100) '+
    '          * (CASE WHEN (COALESCE(I.ITF_ALIQ_ICMS, 0)=0) THEN 0 ELSE 1 END) '+
    '          + CASE WHEN (COALESCE(I.ITF_ALIQ_ICMS, 0)=0  ) THEN 0 ELSE '+
    '              COALESCE(FTR_OUTDESPESA,0) * (COALESCE(I.ITF_VR_ITEM_L,0) / '+
    '              ( SELECT SUM(I2.ITF_VR_ITEM_L) FROM ITENS_FATURADOS I2 WHERE I2.ITF_NOTAFISCAL = I.ITF_NOTAFISCAL '+
    '              AND I2.ITF_MINUTA = I.ITF_MINUTA AND COALESCE(I2.ITF_ALIQ_ICMS,0) > 0 ) ) '+
    '            END ) ) '+
    '          + COALESCE(SUM( CASE WHEN (COALESCE(FTR_OUTDESPESA,0) = COALESCE(FTR_BASEICMS, 0)) THEN COALESCE(FTR_VR_ICMS, 0) * COALESCE(I.ITF_VR_ITEM_L,0) / (SELECT SUM(I2.ITF_VR_ITEM_L) '+
    '                     FROM ITENS_FATURADOS I2 WHERE I2.ITF_NOTAFISCAL = I.ITF_NOTAFISCAL AND I2.ITF_MINUTA = I.ITF_MINUTA) END ), 0) '+
    '   END AS NUMERIC(13, 2)) "VL_BC_ICMS", '+
    '   SUM((ITF_VR_ITEM + ITF_VR_IPI + ITF_VALOR_DESPESAS + ITF_VR_ICMS_NORMAL + ITF_VALOR_PIS + ITF_VALOR_COFINS + ITF_DI_IMPOSTO) '+
    '      *COALESCE(ITF_ALIQ_ICMS,0)/100 '+
    '      * CASE WHEN T.DEC_NUMERO IS NULL THEN 0 ELSE 1 END) "VL_BC_ICMS_II", '+
    '   CAST( '+
    '      SUM( ( CASE WHEN M.MTR_DECRETO IS NULL THEN COALESCE(I.ITF_VR_ITEM_L,0) ELSE COALESCE(I.ITF_VR_ITEM,0) END '+
    '       * (CASE WHEN (M.MTR_DECRETO IS NULL) THEN (1-COALESCE(FTR_DESC_NOTA,0)/(COALESCE(FTR_VRNOTA2,1)+COALESCE(FTR_DESC_NOTA,0))) ELSE 1 END) '+
    '       * (1-(CASE WHEN (FTR_UF_FATU = ''CE'') THEN CASE WHEN (FTR_CGC_FATU IS NOT NULL) THEN COALESCE(D.DEC_PERC_DENTRO_J, 0) ELSE COALESCE(DEC_PERC_DENTRO_F, 0) END '+
    '          ELSE CASE WHEN (FTR_CGC_FATU IS NOT NULL) THEN COALESCE(D.DEC_PERC_FORA_J, 0) ELSE COALESCE(DEC_PERC_FORA_F, 0) END END)/100) '+
    '       * (CASE WHEN (COALESCE(I.ITF_ALIQ_ICMS, 0)=0) THEN 0 ELSE 1 END) '+
    '       + CASE WHEN (COALESCE(I.ITF_ALIQ_ICMS, 0)=0  ) THEN 0 ELSE '+
    '           COALESCE(FTR_OUTDESPESA,0) * (COALESCE(I.ITF_VR_ITEM_L,0) / '+
    '           ( SELECT SUM(I2.ITF_VR_ITEM_L) FROM ITENS_FATURADOS I2 WHERE I2.ITF_NOTAFISCAL = I.ITF_NOTAFISCAL '+
    '           AND I2.ITF_MINUTA = I.ITF_MINUTA AND COALESCE(I2.ITF_ALIQ_ICMS,0) > 0 ) ) '+
    '         END ) '+
    '         * COALESCE(I.ITF_ALIQ_ICMS, 0)/100) '+
    '  + COALESCE(SUM( CASE WHEN (COALESCE(FTR_OUTDESPESA,0) = COALESCE(FTR_BASEICMS, 0)) THEN COALESCE(F.FTR_VR_ICMS, 0) * COALESCE(I.ITF_VR_ITEM_L,0) / (SELECT SUM(I2.ITF_VR_ITEM_L) '+
    '                FROM ITENS_FATURADOS I2 WHERE I2.ITF_NOTAFISCAL = I.ITF_NOTAFISCAL AND I2.ITF_MINUTA = I.ITF_MINUTA) END ), 0) '+
    '                *CASE WHEN (COALESCE(FTR_VR_SERVICO,0)>0) THEN 0 ELSE 1 END '+
    '                + COALESCE(I.ITF_VR_ICMS_AJUSTE,0) AS NUMERIC(13, 2)) "VL_ICMS", '+
    '   SUM(CASE WHEN T.DEC_NUMERO IS NULL THEN 0 ELSE COALESCE(ITF_DI_IMPOSTO, 0) END + '+
    '       CASE WHEN T.DEC_NUMERO IS NULL THEN 0 ELSE COALESCE(ITF_VALOR_PIS, 0) END + '+
    '       CASE WHEN T.DEC_NUMERO IS NULL THEN 0 ELSE COALESCE(ITF_VALOR_COFINS, 0) END) "VL_II", '+
    '   CASE WHEN T.DEC_NUMERO IS NULL THEN 0 ELSE F.FTR_BASEICMS END "VL_BC_ICMS2", '+
    '   CASE WHEN T.DEC_NUMERO IS NULL THEN 0 ELSE F.FTR_VRNOTA END "FTR_VRNOTA", '+
    '   SUM(ITF_VALOR_PIS) "VL_PIS", '+
    '   SUM(ITF_VALOR_COFINS) "VL_COFINS" '+
    'FROM FATURAS F '+
    'INNER JOIN ITENS_FATURADOS I ON I.ITF_NOTAFISCAL = FTR_NOTAFISCAL AND I.ITF_MINUTA = FTR_MINUTA AND FTR_MINUTA <> ''M'' '+
    'INNER JOIN EMPRESAS ON EMP_MODELO = F.FTR_MINUTA '+
    'INNER JOIN CLIENTE C ON C.CLI_CODIGO = FTR_CLIENTE '+
    'LEFT JOIN MATERIAIS M ON M.MTR_CODIGO = I.ITF_COD_PRODUTO '+
    'LEFT JOIN DECRETOS D ON D.DEC_CODIGO = M.MTR_DECRETO '+
    'AND M.MTR_DATA_DECRETO = D.DEC_DATA '+
    'LEFT JOIN FORMACAO_PRECO ON ((CASE WHEN (MTR_SIT_TRIB = ''S'') THEN 2 ELSE 1 END) = FPC_SEQ) '+
    'LEFT JOIN DECLARA_IMPORTACAO T ON T.DEC_CODIGO = ITF_DI '+
    'WHERE COALESCE(I.ITF_VR_ITEM, 0) > 0 '+
    '   AND F.FTR_CHAVE_NFE IS NOT NULL '+
    '   AND EMP_NFSERVICO <> ''C'' '+
    '   AND ((ITF_ALIQ_PIS > 0) OR (ITF_ALIQ_COFINS > 0)) '+
    '   AND FTR_CANCELADO IS NULL '+
//    '   AND FTR_NOTAFISCAL =  ''024486'' '+
    'GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17, '+
    '   CLI_FORTES_PAR, FTR_BASEISS, FTR_BSEICMS_SUB, FTR_CANCELADO, FTR_CHAVE_NFE, '+
    '   FTR_NFE_CONS_CHNFE, FTR_DESC_NOTA, FTR_DTEMISSAO, FTR_DTSAIDA, FTR_FORM_FINAL, '+
    '   FTR_FORM_INICIAL, F.FTR_FRETE_CONTA, F.FTR_MINUTA, F.FTR_NF_CONSUMIDOR, '+
    '   F.FTR_NOTAFISCAL, F.FTR_OPER_COMERC, F.FTR_OPERACAO, F.FTR_OUTDESPESA, '+
    '   F.FTR_VR_ICMS, F.FTR_VR_ICMS_SUB, F.FTR_VR_IPI, F.FTR_VR_RECEBIDO, '+
    '   F.FTR_VR_SERVICO, F.FTR_VRFRETE, F.FTR_VRSEGURO, F.FTR_COD_FISC, '+
    '   F.FTR_CUPOM, F.FTR_BASEICMS, F.FTR_SER_SELO, ITF_VR_ICMS_AJUSTE '+
    '   ,F.FTR_VALORPRODUTO, T.DEC_NUMERO, F.FTR_BASEICMS, F.FTR_VRNOTA ';

var
  frmSpedContribuicao: TfrmSpedContribuicao;

implementation

uses unPesquisa, DB, Contnrs, ACBrTXTClass;

{$R *.dfm}

procedure TfrmSpedContribuicao.Registro_0150(reg: TParticipante0150);
var
  p150: TRegistro0150;
begin
  reg.COD_PART := SoNumeros(reg.COD_PART);

  reg.IE := SoNumeros(reg.IE);
  reg.SUFRAMA := SoNumeros(reg.SUFRAMA);
  if lst0150.IndexOf(reg.COD_PART) >= 0 then Exit;
  lst0150.Add(reg.COD_PART);

  if (reg.NOTA <> '') then
    if (reg.MINUTA <> '') then Set_Faturamento_0150(reg)
    else if reg.FORNE <> '' then Set_Entrada_0150(reg);

  p150 := ACBrSPEDPisCofins1.Bloco_0.Registro0150New;
  p150.COD_PART := reg.COD_PART;
  p150.NOME := reg.NOME;
  p150.COD_PAIS := reg.COD_PAIS;
  if length(p150.COD_PART) <= 11
    then p150.CPF := reg.COD_PART
    else begin
      p150.CNPJ := reg.COD_PART;
      p150.IE := reg.IE;
      p150.SUFRAMA := reg.SUFRAMA;
    end;
  p150.COD_MUN := reg.COD_MUN;
  p150.ENDERECO := reg.ENDE;
  p150.BAIRRO := reg.BAIRRO;

end;

procedure TAliquota.GetValores(Modelo_Minuta: string;
  dataDocto: TDateTime);
var
  eSimples: boolean;
begin
  ConsultaSQL :=
    'SELECT COALESCE(EMP_SIMPLES_NAC, '''') EMP_SIMPLES_NAC '+
    'FROM MODELO_EMPRESA WHERE EMP_MODELO = '+QuotedStr(Modelo_Minuta);
  with TIBConsulta.Abrir(ConsultaSQL) do
  begin
    if not IsEmpty  and (FieldByName('EMP_SIMPLES_NAC').AsString = 'S') then
      eSimples := true
    else if (Modelo_Minuta = 'N') and (verificaParametros('560') = 'N�O') then
    begin
      if verificaParametros('325') = 'SIM' then
        eSimples := true
    end
    else
    begin
      Close; // Pra ficar compativel com configura��o j� existente cfe. o parametro
      sql.clear;
      sql.add('SELECT COALESCE(EMP_SIMPLES_NAC, '''') EMP_SIMPLES_NAC ');
      sql.add('FROM MODELO_EMPRESA                                    ');
      sql.add('WHERE COALESCE(EMP_MODELO, '''') <> ''''               ' );
      Open;
      if IsEmpty then
      begin
        if verificaParametros('325') = 'SIM' then
          eSimples := true
      end;
    end;

    if (Modelo_Minuta = 'N') and (verificaParametros('325') = 'SIM')  then eSimples := true;

    if eSimples then
    begin
      SQL.Clear;
      sql.add('SELECT FIRST 1 * FROM TABELA_SIMPLES');
      sql.add('WHERE TSN_DATA <= :DATA1            ');
      sql.add('   AND TSN_TIPO = :TSN_TIPO         ');
      sql.add('ORDER BY TSN_DATA                   ');
      ParamByName('DATA1').AsDateTime  := dataDocto;
      ParamByName('TSN_TIPO').AsString := Modelo_Minuta;
      Open;
      if not IsEmpty then
      begin
        icms   := FieldByName('TSN_ICMS').AsFloat;
        cofins := FieldByName('TSN_COFINS').AsFloat;
        pis    := FieldByName('TSN_PIS').AsFloat;
      end
      else
      begin
        icms := 0;
        cofins := 0;
        pis := 0;
      end;
    end
    else
    begin
      if EReal(verificaParametros('080'))
        then icms := StrToFloat(verificaParametros('080')) else icms := 0;
      if EReal(verificaParametros('080'))
        then pis := StrToFloat(verificaParametros('080')) else pis := 0;
      if EReal(verificaParametros('080'))
        then cofins := StrToFloat(verificaParametros('080')) else cofins := 0;
    end;
    Free;
  end;
end;

procedure TfrmSpedContribuicao.Registro_O001(reg: TRegistro0001);
begin
  reg.IND_MOV := imComDados;
end;

procedure TfrmSpedContribuicao.TIPO_ESCRITClick(Sender: TObject);
begin
  NUM_REC_ANTERIOR.Enabled := TComboBox(Sender).ItemIndex = 1;
  if not NUM_REC_ANTERIOR.Enabled then NUM_REC_ANTERIOR.Clear; 
end;

procedure TfrmSpedContribuicao.FormShow(Sender: TObject);
begin
  TIPO_ESCRIT.OnClick(TIPO_ESCRIT);
end;

procedure TfrmSpedContribuicao.Registro_O000(reg: TRegistro0000);
begin
  reg.COD_VER := vlVersao201;
  reg.TIPO_ESCRIT := TACBrTipoEscrit(TIPO_ESCRIT.ItemIndex);
  reg.IND_SIT_ESP := TACBrIndSitEsp(IND_SIT_ESP.ItemIndex);
  reg.NUM_REC_ANTERIOR := NUM_REC_ANTERIOR.Text;
  reg.DT_INI := DATA_INICIAL.Date;
  reg.DT_FIN := DATA_FINAL.Date;

  ConsultaSQL := 'SELECT * FROM EMPRESA99';
  with TIBConsulta.Abrir(ConsultaSQL) do
  begin
    reg.NOME := FieldByName('EMP_NOME').AsString;
    reg.CNPJ := FieldByName('EMP_CGC').AsString;
    reg.UF := FieldByName('EMP_UF').AsString;
    reg.COD_MUN := FieldByName('EMP_NFE_CMUN').AsInteger;
    //reg.SUFRAMA
    Free;
  end;
  reg.IND_NAT_PJ := TACBrIndNatPJ(IND_NAT_PJ.ItemIndex);
  reg.IND_ATIV := TACBrIndAtiv(IND_ATIV.ItemIndex);
end;

procedure TfrmSpedContribuicao.Registro_O100(reg: TRegistro0100);
begin
  ConsultaSQL := 'SELECT * FROM DIEF_TRANSMISSOR WHERE SIT_TIPO_EC = ''C'' ';
  with TIBConsulta.Abrir(ConsultaSQL) do
  begin
    reg.NOME := FieldByName('SIT_NOME').AsString;
    reg.CPF := SoNumeros(FieldByName('SIT_IDENTIFICA').AsString);
    reg.CRC := FieldByName('SIT_CRC').AsString;
    //reg.CNPJ    : string; //N�mero de inscri��o do escrit�rio de contabilidade no CNPJ, se houver
    reg.CEP := FieldByName('SIT_CEP').AsString;
    reg.ENDERECO := FieldByName('SIT_ENDERECO').AsString;
    reg.NUM := FieldByName('SIT_NUMERO').AsString;
    reg.COMPL := FieldByName('SIT_COMPL').AsString;
    reg.BAIRRO := FieldByName('SIT_BAIRRO').AsString;
    reg.FONE := FieldByName('SIT_FONE').AsString;
    reg.FAX := FieldByName('SIT_FAX').AsString;
    reg.EMAIL := FieldByName('SIT_EMAIL').AsString;
    reg.COD_MUN := FieldByName('SIT_CODMUN').AsInteger;
    Free;
  end;
end;

procedure TfrmSpedContribuicao.Registro_O110(reg: TRegistro0110);
begin
  reg.COD_INC_TRIB := TACBrCodIncTrib(COD_INC_TRIB.ItemIndex);
  reg.IND_APRO_CRED := TACBrIndAproCred(IND_APRO_CRED.ItemIndex);
  reg.COD_TIPO_CONT := TACBrCodTipoCont(COD_TIPO_CONT.ItemIndex);
  reg.IND_REG_CUM := TACBrIndRegCum(IND_REG_CUM.ItemIndex);
  if reg.IND_APRO_CRED = indMetodoDeRateioProporcional then
  begin

  end;
end;

procedure TfrmSpedContribuicao.Registro_O140(reg: TRegistro0140);
begin
  ConsultaSQL := 'SELECT * FROM EMPRESA99';
  with TIBConsulta.Abrir(ConsultaSQL) do
  begin
    reg.COD_EST := '001';
    reg.NOME := FieldByName('EMP_NOME').AsString;
    reg.CNPJ := FieldByName('EMP_CGC').AsString;
    reg.UF := FieldByName('EMP_UF').AsString;
    reg.IE := FieldByName('EMP_CGF').AsString;
    reg.COD_MUN := FieldByName('EMP_NFE_CMUN').AsInteger;
    reg.IM := FieldByName('EMP_INSC_MUNIC').AsString;
    //reg.SUFRAMA := FieldByName('').AsString;
  end;

  //PODE SER REGISTRADO NO FINAL DO PROCESSO
  //if CheckBoxBlocoP.Checked then
  //begin
  //  reg.Registro0145.COD_INC_TRIB := IntToStr(COD_INC_TRIB_P.ItemIndex);
  //  reg.Registro0145.VL_REC_TOT
  //  reg.Registro0145.VL_REC_ATIV
  //  reg.Registro0145.VL_REC_DEMAIS_ATIV
  //  reg.Registro0145.INFO_COMPL
  //end;

end;

procedure TfrmSpedContribuicao.GerarBloco_0;
begin
  MostraMSG(Self, 'Preparando Bloco O');
  ACBrSPEDPisCofins1.Bloco_0.LimpaRegistros;
  ACBrSPEDPisCofins1.DT_INI := DATA_INICIAL.Date;
  ACBrSPEDPisCofins1.DT_FIN := DATA_FINAL.Date;
  Registro_O000(ACBrSPEDPisCofins1.Bloco_0.Registro0000New);
  Registro_O001(ACBrSPEDPisCofins1.Bloco_0.Registro0001New);
  Registro_O100(ACBrSPEDPisCofins1.Bloco_0.Registro0100New);
  Registro_O110(ACBrSPEDPisCofins1.Bloco_0.Registro0110New);
  Registro_O140(ACBrSPEDPisCofins1.Bloco_0.Registro0140New);
end;

procedure TfrmSpedContribuicao.FormCreate(Sender: TObject);
begin
  inherited;
  Ctl3D := false;
  Color := clBtnFace;
  lst0150 := TStringList.Create;
  lst0200 := TStringList.Create;
  lst0400 := TStringList.Create;
  lst0190 := TStringList.Create;
  lst0500 := TStringList.Create;
end;

procedure TfrmSpedContribuicao.Registro_O400(codigo: string);
var
  O400: TRegistro0400;
begin
  if lst0400.IndexOf(codigo) >= 0 then Exit;
  lst0400.Add(codigo);
  O400 := ACBrSPEDPisCofins1.Bloco_0.Registro0400New;
  O400.COD_NAT := codigo;
  O400.DESCR_NAT := getValor('CODIGOS_FISCAIS', 'CDF_DESCRICAO', 'CDF_CODIGO='+QuotedStr(codigo));
end;

procedure TfrmSpedContribuicao.Registro_C860;
var
  C860: TRegistroC860;
  texto: string;
begin

  texto :=
    'SELECT '+
    '    COD_MOD, '+
    '    NR_SAT, '+
    '    DT_DOC, '+
    '    MIN(FTR_NFSE_RPS_NUMERO) "DOC_INI", '+
    '    MAX(FTR_NFSE_RPS_NUMERO) "DOC_FIM" '+
    'FROM ('+SAIDA_REGC170+') '+
    'WHERE COD_MOD = ''59'' '+
    '    AND NR_SAT IS NOT NULL '+ 
    '    AND CAST(DT_DOC AS DATE) BETWEEN '+
    formataDataSQL(DATA_INICIAL.Date)+' AND '+formataDataSQL(DATA_FINAL.Date)+
    ' GROUP BY 1,2,3 ';

  with TIBConsulta.Abrir(texto) do
  begin
    desejaEncerrarProcesso;
    while not Eof do
    begin
      C860 := ACBrSPEDPisCofins1.Bloco_C.RegistroC860New;
      C860.COD_MOD := FieldByName('COD_MOD').AsString;
      C860.NR_SAT := FieldByName('NR_SAT').AsInteger;
      C860.DT_DOC := FieldByName('DT_DOC').AsDateTime;
      C860.DOC_INI := FieldByName('DOC_INI').AsInteger;
      C860.DOC_FIM := FieldByName('DOC_FIN').AsInteger;
      Next;
    end;
    Free;
  end;

end;

procedure TfrmSpedContribuicao.Registro_C990;
begin
  with ACBrSPEDPisCofins1.Bloco_C do
    RegistroC990.QTD_LIN_C :=
      RegistroC010Count + RegistroC100Count + RegistroC110Count +
      RegistroC111Count + RegistroC120Count + RegistroC170Count +
      RegistroC175Count + RegistroC180Count + RegistroC181Count +
      RegistroC185Count + RegistroC188Count + RegistroC190Count +
      RegistroC191Count + RegistroC195Count + RegistroC198Count +
      RegistroC199Count + RegistroC380Count + RegistroC381Count +
      RegistroC385Count + RegistroC395Count + RegistroC396Count +
      RegistroC400Count + RegistroC405Count + RegistroC481Count +
      RegistroC485Count + RegistroC489Count + RegistroC490Count +
      RegistroC491Count + RegistroC495Count + RegistroC499Count +
      RegistroC500Count + RegistroC501Count + RegistroC505Count +
      RegistroC509Count + RegistroC600Count + RegistroC601Count +
      RegistroC605Count + RegistroC609Count + RegistroC800Count +
      RegistroC810Count + RegistroC820Count + RegistroC830Count +
      RegistroC860Count + RegistroC870Count + RegistroC880Count +
      RegistroC890Count + 1;
end;

procedure TfrmSpedContribuicao.Set_Faturamento_0150(
  var reg: TParticipante0150);
var
  texto: string;
begin
  texto :=
    'SELECT * FROM ('+PARTICIPANTE_FATURAMENTO+') '+
    'WHERE NOTA = '+QuotedStr(reg.NOTA)+
    '   AND MINUTA = '+QuotedStr(reg.MINUTA);
  with TIBConsulta.Abrir(texto) do
  begin
    desejaEncerrarProcesso;
    while not Eof do
    begin
      reg.COD_PART := FieldByName('COD_PART').AsString;
      reg.NOME := FieldByName('NOME').AsString;
      reg.COD_PAIS := FieldByName('COD_PAIS').AsString;
      reg.IE := SoNumeros(FieldByName('IE').AsString);
      reg.COD_MUN := FieldByName('COD_MUN').AsInteger;
      reg.SUFRAMA := FieldByName('SUFRAMA').AsString;
      reg.ENDE := FieldByName('ENDE').AsString;
      reg.BAIRRO := FieldByName('BAIRRO').AsString;
      Next;
    end;
    Free;
  end;
end;

procedure TfrmSpedContribuicao.LimpaRegistro_O150(
  var reg: TParticipante0150);
begin
  reg.COD_PART := '';
  reg.NOME := '';
  reg.COD_PAIS := '';
  reg.IE := '';
  reg.COD_MUN := 0;
  reg.SUFRAMA := '';
  reg.ENDE := '';
  reg.NUM := '';
  reg.COMPL := '';
  reg.BAIRRO := '';
  reg.NOTA := '';
  reg.MINUTA := '';
  reg.FORNE := '';
  reg.DATA := 0;
end;

procedure TfrmSpedContribuicao.Registro_A990;
begin
  with ACBrSPEDPisCofins1.Bloco_A do
    RegistroA990.QTD_LIN_A :=
      RegistroA010Count + RegistroA100Count +
      RegistroA110Count + RegistroA120Count + RegistroA170Count + 1;
end;

procedure TfrmSpedContribuicao.GerarBloco_C;
var
  C001: TRegistroC001;
begin
  MostraMSG(Self, 'Preparando Bloco C');
  ACBrSPEDPisCofins1.Bloco_C.LimpaRegistros;
  C001 := ACBrSPEDPisCofins1.Bloco_C.RegistroC001New;
  Registro_C100(C001);
  Registro_C180;

  Registro_C860;
  Registro_C870;

  Registro_C990;

end;

procedure TfrmSpedContribuicao.GerarBloco_D;
var
  D001: TRegistroD001;
begin
  MostraMSG(Self, 'Preparando Bloco D');
  ACBrSPEDPisCofins1.Bloco_D.LimpaRegistros;
  D001 := ACBrSPEDPisCofins1.Bloco_D.RegistroD001New;
  Registro_D100(D001);
  Registro_D990;
end;

procedure TfrmSpedContribuicao.Registro_D990;
begin
  with ACBrSPEDPisCofins1.Bloco_D do
    RegistroD990.QTD_LIN_D :=
      RegistroD010Count + RegistroD100Count + RegistroD101Count +
      RegistroD105Count + RegistroD111Count + RegistroD200Count +
      RegistroD201Count + RegistroD205Count + RegistroD209Count +
      RegistroD300Count + RegistroD309Count + RegistroD350Count +
      RegistroD359Count + RegistroD500Count + RegistroD501Count +
      RegistroD505Count + RegistroD509Count + RegistroD600Count +
      RegistroD601Count + RegistroD605Count + RegistroD609Count;
end;

procedure TfrmSpedContribuicao.GerarBloco_A;
var
  A001: TRegistroA001;
begin
  MostraMSG(Self, 'Preparando Bloco A');
  ACBrSPEDPisCofins1.Bloco_A.LimpaRegistros;
  A001 := ACBrSPEDPisCofins1.Bloco_A.RegistroA001New;
  Registro_A100(A001);
  Registro_A990;
end;

procedure TfrmSpedContribuicao.Set_Entrada_0150(
  var reg: TParticipante0150);
var
  texto: string;
begin
  texto :=
    'SELECT '+
    '    CASE WHEN COALESCE(FRN_CGC, '''') <> '''' THEN FRN_CGC '+
    '         WHEN COALESCE(FRN_CPF, '''') <> '''' THEN FRN_CPF END "COD_PART", '+
    '    FRN_NOME "NOME", '+
    '    ''1058'' "COD_PAIS", '+
    '    FRN_CGF "IE", '+
    '    FRN_NFE_CMUN "COD_MUN", '+
    '    NULL "SUFRAMA", '+
    '    FRN_ENDERECO "ENDE", '+
    '    FRN_BAIRRO "BAIRRO" '+
    'FROM ENTRADAS '+
    'INNER JOIN FORNECEDORES ON FRN_CODIGO = ENT_FORNECEDOR '+
    'WHERE ENT_NOTAFISCAL = '+QuotedStr(reg.NOTA)+
    '   AND ENT_FORNECEDOR = '+QuotedStr(reg.FORNE)+
    '   AND CAST(ENT_EMISSAO AS DATE) = '+formataDataSQL(reg.DATA);

  with TIBConsulta.Abrir(texto) do
  begin
    desejaEncerrarProcesso;
    while not Eof do
    begin
      reg.COD_PART := FieldByName('COD_PART').AsString;
      reg.NOME := FieldByName('NOME').AsString;
      reg.COD_PAIS := FieldByName('COD_PAIS').AsString;
      reg.IE := SoNumeros(FieldByName('IE').AsString);
      if EInteiro(FieldByName('COD_MUN').AsString)
        then reg.COD_MUN := FieldByName('COD_MUN').AsInteger;
      reg.SUFRAMA := FieldByName('SUFRAMA').AsString;
      reg.ENDE := FieldByName('ENDE').AsString;
      reg.BAIRRO := FieldByName('BAIRRO').AsString;
      Next;
    end;
    Free;
  end;
end;

procedure TfrmSpedContribuicao.Registro_C870;
var
  C870: TRegistroC870;
  texto: string;
begin

  texto :=
    'SELECT '+
    '    COD_ITEM, '+
    '    CFOP, '+
    '    CST_PIS, '+
    '    CST_COFINS, '+
    '    SUM(VL_COFINS) "VL_COFINS", '+
    '    SUM(VL_PIS) "VL_PIS", '+
    '    SUM(VL_BC_ICMS) "VL_BC_PIS", '+
    '    SUM(VL_BC_ICMS) "VL_BC_CPFINS", '+
    '    SUM(VL_DESC) "VL_DESC", '+
    '    SUM(VL_ITEM) "VL_ITEM" '+
    'FROM ('+SAIDA_REGC170+') '+
    'WHERE COD_MOD = ''59'' '+
    '    AND CAST(DT_DOC AS DATE) BETWEEN '+
    formataDataSQL(DATA_INICIAL.Date)+' AND '+formataDataSQL(DATA_FINAL.Date)+
    ' GROUP BY 1,2,3,4 ';

  with TIBConsulta.Abrir(texto) do
  begin
    desejaEncerrarProcesso;
    while not Eof do
    begin
      C870 := ACBrSPEDPisCofins1.Bloco_C.RegistroC870New;
      C870.COD_ITEM := FieldByName('COD_ITEM').AsString;
      C870.CFOP := FieldByName('CFOP').AsString;
      C870.VL_ITEM := FieldByName('VL_ITEM').AsFloat;
      C870.VL_DESC := FieldByName('VL_DESC').AsFloat;
      C870.CST_PIS := StrToCstPis(FieldByName('CST_PIS').AsString);
      C870.VL_BC_PIS := FieldByName('VL_BC_PIS').AsFloat;
      C870.VL_PIS := FieldByName('VL_PIS').AsFloat;
      if C870.VL_BC_PIS > 0 then C870.ALIQ_PIS := (C870.VL_PIS/C870.VL_BC_PIS)*100;
      C870.CST_COFINS := StrToCstCofins(FieldByName('CST_COFINS').AsString);
      C870.VL_BC_COFINS := FieldByName('VL_BC_COFINS').AsFloat;
      C870.VL_COFINS := FieldByName('VL_COFINS').AsFloat;
      if C870.VL_BC_COFINS > 0 then C870.ALIQ_COFINS := (C870.VL_COFINS/C870.VL_BC_COFINS)*100;
      C870.COD_CTA := CONTA_PIS_COFINS.Text;
      Registro_0500(C870.COD_CTA);
      Next;
    end;
    Free;
  end;

end;

procedure TfrmSpedContribuicao.BitBtn1Click(Sender: TObject);
begin
  try
    TBitBtn(Sender).Enabled := false;
    try
      msgException('Informe um per�odo v�lido', DATA_INICIAL, (DATA_INICIAL.Date = 0) or (DATA_FINAL.Date = 0));
      analisaPeriodoValido(DATA_INICIAL, DATA_FINAL);

      SaveDialog1.FileName :=
        'SPED_CONTRIBUICAO_'+FormatDateTime('DDMMYY', DATA_INICIAL.Date)+
        '_A_'+FormatDateTime('DDMMYY', DATA_FINAL.Date);

      if not SaveDialog1.Execute then Exit;

      MostraMSG(Self, 'Aguarde ...');
      lst0500.Clear;
      lst0190.Clear;
      lst0150.Clear;
      lst0200.Clear;
      lst0400.Clear;

      GerarBloco_0;
      GerarBloco_A;
      GerarBloco_C;
      GerarBloco_D;

      GerarBloco_M;

      ACBrSPEDPisCofins1.Path := ExtractFilePath(SaveDialog1.FileName);
      ACBrSPEDPisCofins1.Arquivo := ExtractFileName(SaveDialog1.FileName);
      ACBrSPEDPisCofins1.SaveFileTXT;

      msgInfo('Conclu�do com sucesso');

    except on E: Exception do
      msgError(PChar(E.Message), PChar(TITULO));
    end;
  finally
    MostraMSG();
    TBitBtn(Sender).Enabled := true;
  end;
end;

procedure TfrmSpedContribuicao.Registro_0190(codigo: string);
var
  O190: TRegistro0190;
begin
  if codigo = '' then Exit;
  if lst0190.IndexOf(codigo) >= 0 then Exit;
  lst0190.Add(codigo);

  O190 := ACBrSPEDPisCofins1.Bloco_0.Registro0190New;
  O190.UNID := codigo;
  O190.DESCR := codigo;

end;

procedure TfrmSpedContribuicao.Registro_O200(codigo, descricao, unid, ncm: string);
var
  O200: TRegistro0200;
  texto: string;
begin
  if lst0200.IndexOf(codigo) >= 0 then Exit;
  lst0200.Add(codigo);
  O200 := ACBrSPEDPisCofins1.Bloco_0.Registro0200New;
  O200.COD_ITEM := codigo;
  O200.DESCR_ITEM := StringReplace(descricao, #13#10, '',[rfReplaceAll]);
  O200.TIPO_ITEM := tiMercadoriaRevenda; //tiProdutoAcabado
  O200.COD_NCM := ncm;
  O200.UNID_INV := unid;
  Registro_0190(unid);
end;

procedure TfrmSpedContribuicao.Registro_O200(reg: TRegistroC170);
var
  O200: TRegistro0200;
  texto: string;
begin
  if lst0200.IndexOf(reg.COD_ITEM) >= 0 then Exit;
  lst0200.Add(reg.COD_ITEM);
  O200 := ACBrSPEDPisCofins1.Bloco_0.Registro0200New;
  texto :=
    'SELECT '+
    '    MTR_DESCRICAO, '+
    '    MTR_COD_BARRA, '+
    '    MTR_UNIDADE, '+
    '    MTR_CODIGO_NCM, '+
    '    MTR_COD_IPI, '+
    '    MTR_GENERO, '+
    '    MTR_PERC_ICMS, '+
    '    COALESCE(MTR_UNIDADE, ''UND'') "MTR_UNIDADE" '+
    'FROM MATERIAIS '+
    'WHERE MTR_CODIGO = '+QuotedStr(reg.COD_ITEM);
  with TIBConsulta.Abrir(texto) do
  begin
    O200.COD_ITEM := reg.COD_ITEM;
    O200.DESCR_ITEM := reg.DESCR_COMPL;
    O200.COD_BARRA := FieldByName('MTR_COD_BARRA').AsString;
    //O200.COD_ANT_ITEM
    O200.UNID_INV := reg.UNID; //FieldByName('MTR_UNIDADE').AsString;
    O200.TIPO_ITEM := StrToTipoItem('00');
    O200.COD_NCM := FieldByName('MTR_CODIGO_NCM').AsString;
    O200.EX_IPI := FieldByName('MTR_COD_IPI').AsString;
    O200.COD_GEN := FieldByName('MTR_GENERO').AsString;
    //O200.COD_LST
    O200.ALIQ_ICMS := reg.ALIQ_ICMS; //FieldByName('MTR_PERC_ICMS').AsFloat;

    if O200.UNID_INV = '' then O200.UNID_INV := 'UND';
    if O200.COD_NCM = '' then O200.COD_NCM := getParam(563);

    Registro_0190(FieldByName('MTR_UNIDADE').AsString);

    Free;
  end;
end;

procedure TfrmSpedContribuicao.Registro_C185(reg: TRegistroC180);
var
  C185: TRegistroC185;
  texto: string;
begin

  texto :=
    'SELECT '+
    '    CFOP, '+
    '    CST_COFINS, '+
    '    ALIQ_COFINS, '+
    '    SUM(VL_ITEM) "VL_BC_COFINS", '+
    '    SUM(VL_DESC) "VL_DESC", '+
    '    SUM(VL_COFINS) "VL_COFINS" '+
    'FROM ('+SAIDA_REGC170+') '+
    'WHERE COD_MOD = ''55'' '+
    '    AND CAST(DT_DOC AS DATE) BETWEEN '+formataDataSQL(reg.DT_DOC_INI)+' AND '+formataDataSQL(reg.DT_DOC_FIN)+
    '    AND COD_ITEM = '+QuotedStr(reg.COD_ITEM)+
    ' GROUP BY 1,2,3 ';

  with TIBConsulta.Abrir(texto) do
  begin
    desejaEncerrarProcesso;
    while not Eof do
    begin
      C185 := reg.RegistroC185.New;
      C185.CFOP := FieldByName('CFOP').AsString;
      C185.CST_COFINS := StrToCstCofins(FieldByName('CST_COFINS').AsString);
      C185.ALIQ_COFINS := FieldByName('ALIQ_COFINS').AsFloat;
      C185.VL_ITEM := FieldByName('VL_BC_COFINS').AsFloat;
      C185.VL_DESC := FieldByName('VL_DESC').AsFloat;
      C185.VL_BC_COFINS := FieldByName('VL_BC_COFINS').AsFloat;
      C185.VL_COFINS := C185.VL_BC_COFINS * C185.ALIQ_COFINS / 100;
      C185.COD_CTA := CONTA_PIS_COFINS.Text;
      Registro_0500(C185.COD_CTA);
      Next;
    end;
    Free;
  end;

end;

procedure TfrmSpedContribuicao.Registro_C181(reg: TRegistroC180);
var
  C181: TRegistroC181;
  texto: string;
begin
  texto :=
    'SELECT '+
    '    CFOP, '+
    '    CST_PIS, '+
    '    ALIQ_PIS, '+
    '    SUM(VL_ITEM) "VL_BC_PIS", '+
    '    SUM(VL_DESC) "VL_DESC", '+
    '    SUM(VL_PIS) "VL_PIS" '+
    'FROM ('+SAIDA_REGC170+') '+
    'WHERE COD_MOD = ''55'' '+
    '    AND CAST(DT_DOC AS DATE) BETWEEN '+formataDataSQL(reg.DT_DOC_INI)+' AND '+formataDataSQL(reg.DT_DOC_FIN)+
    '    AND COD_ITEM = '+QuotedStr(reg.COD_ITEM)+
    ' GROUP BY 1,2,3 ';

  with TIBConsulta.Abrir(texto) do
  begin
    desejaEncerrarProcesso;
    while not Eof do
    begin
      C181 := ACBrSPEDPisCofins1.Bloco_C.RegistroC181New;
      C181.CFOP := FieldByName('CFOP').AsString;
      C181.CST_PIS := StrToCstPis(FieldByName('CST_PIS').AsString);
      C181.ALIQ_PIS := FieldByName('ALIQ_PIS').AsFloat;
      C181.VL_ITEM := FieldByName('VL_BC_PIS').AsFloat;
      C181.VL_DESC := FieldByName('VL_DESC').AsFloat;
      C181.VL_BC_PIS := FieldByName('VL_BC_PIS').AsFloat;
      C181.VL_PIS := C181.VL_BC_PIS * C181.ALIQ_PIS / 100;
      C181.COD_CTA := CONTA_PIS_COFINS.Text;
      Registro_0500(C181.COD_CTA);
      Next;
    end;
    Free;
  end;

end;

procedure TfrmSpedContribuicao.Registro_C180;
var
  C180: TRegistroC180;
  texto: string;
begin

  texto :=
    'SELECT '+
    '    COD_MOD, '+
    '    COD_ITEM, '+
    '    NCM, '+
    '    MTR_COD_IPI, '+
    '    MIN(DT_DOC) "DT_DOC_INI", '+
    '    MAX(DT_DOC) "DT_DOC_FIN", '+
    '    SUM(VL_ITEM) "VL_ITEM" '+
    'FROM ('+SAIDA_REGC170+') '+
    'WHERE COD_MOD = ''55'' '+
    '    AND CAST(DT_DOC AS DATE) BETWEEN '+formataDataSQL(DATA_INICIAL.Date)+' AND '+formataDataSQL(DATA_FINAL.Date)+
    ' GROUP BY 1,2,3,4 ';

  with TIBConsulta.Abrir(texto) do
  begin
    desejaEncerrarProcesso;
    while not Eof do
    begin
      MostraMSG(Self, 'Bloco C (produto) ' + C180.COD_ITEM);
      C180 := ACBrSPEDPisCofins1.Bloco_C.RegistroC180New;
      C180.COD_MOD := FieldByName('COD_MOD').AsString;
      C180.COD_ITEM := FieldByName('COD_ITEM').AsString;
      C180.COD_NCM := FieldByName('NCM').AsString;
      C180.EX_IPI := FieldByName('MTR_COD_IPI').AsString;
      C180.VL_TOT_ITEM := FieldByName('VL_ITEM').AsFloat;
      C180.DT_DOC_INI := FieldByName('DT_DOC_INI').AsDateTime;
      C180.DT_DOC_FIN := FieldByName('DT_DOC_FIN').AsDateTime;
      Registro_C181(C180);
      Registro_C185(C180);
      Next;
    end;
    Free;
  end;

end;

procedure TfrmSpedContribuicao.Registro_C170(reg: TRegistroC100; minuta: string);
var
  C170: TRegistroC170;
begin

  consultaSQL :=
    'SELECT * FROM ('+SAIDA_REGC170+') '+
    'WHERE FTR_NOTAFISCAL = '+QuotedStr(reg.NUM_DOC)+' AND FTR_MINUTA = '+QuotedStr(minuta);

  with TIBConsulta.Abrir(ConsultaSQL) do
  begin
    desejaEncerrarProcesso;
    while not Eof do
    begin
      C170 := reg.RegistroC170.New;
      C170.NUM_ITEM := FieldByName('NUM_ITEM').AsString; // N�mero seq�encial do item no documento fiscal
      C170.COD_ITEM := FieldByName('COD_ITEM').AsString; // C�digo do item (campo 02 do Registro 0200)
      C170.DESCR_COMPL := StringReplace(FieldByName('DESCR_COMPL').AsString, #13#10, '',[rfReplaceAll]); // Descri��o complementar do item como adotado no documento fiscal
      C170.QTD := FieldByName('QTD').AsFloat; // Quantidade do item
      C170.UNID := FieldByName('UNID').AsString; // Unidade do item(Campo 02 do registro 0190)
      C170.VL_ITEM := FieldByName('VL_ITEM').AsFloat; // Valor total do item
      C170.VL_DESC := FieldByName('VL_DESC').AsFloat; // Valor do desconto comercial
      C170.IND_MOV := TACBrMovimentacaoFisica(0);    /// Movimenta��o f�sica do ITEM/PRODUTO: 0 - SIM; 1- N�O
      C170.CST_ICMS := StrToCstIcms(FieldByName('CST_ICMS').AsString); // C�digo da Situa��o Tribut�ria referente ao ICMS, conforme a Tabela indicada no item 4.3.1
      C170.CFOP := FieldByName('CFOP').AsString; // C�digo Fiscal de Opera��o e Presta��o
      C170.COD_NAT := FieldByName('CFOP').AsString; // C�digo da natureza da opera��o (campo 02 do Registro 0400)
      C170.VL_BC_ICMS := FieldByName('VL_BC_ICMS').AsFloat; // Valor da base de c�lculo do ICMS
      C170.ALIQ_ICMS := FieldByName('ALIQ_ICMS').AsFloat; // Al�quota do ICMS
      C170.VL_ICMS := FieldByName('VL_ICMS').AsFloat; // Valor do ICMS creditado/debitado
      C170.VL_BC_ICMS_ST := FieldByName('VL_BC_ST').AsFloat; // Valor da base de c�lculo referente � substitui��o tribut�ria
      C170.ALIQ_ST := FieldByName('ALIQ_ST').AsFloat; // Al�quota do ICMS da substitui��o tribut�ria na unidade da federa��o de destino
      C170.VL_ICMS_ST := FieldByName('VL_ICMS_ST').AsFloat; // Valor do ICMS referente � substitui��o tribut�ria
      C170.IND_APUR := TACBrApuracaoIPI(ApuracaoIPI.ItemIndex); // Indicador de per�odo de apura��o do IPI: 0 - Mensal; 1 - Decendial
      C170.CST_IPI := StrToCstIpi(FieldByName('CST_IPI').AsString); // C�digo da Situa��o Tribut�ria referente ao IPI, conforme a Tabela indicada no item 4.3.2.
      //C170.COD_ENQ := FieldByName('MTR_COD_IPI').AsString; // C�digo de enquadramento legal do IPI, conforme tabela indicada no item 4.5.3.
      C170.VL_BC_IPI := FieldByName('BASE_IPI').AsFloat; // Valor da base de c�lculo do IPI
      C170.ALIQ_IPI := FieldByName('ALIQ_IPI').AsFloat; // Al�quota do IPI
      C170.VL_IPI := FieldByName('VALOR_IPI').AsFloat; // Valor do IPI creditado/debitado

      C170.CST_PIS := StrToCstPis(FieldByName('CST_PIS').AsString); // C�digo da Situa��o Tribut�ria referente ao PIS.
      C170.ALIQ_PIS_PERC := FieldByName('ALIQ_PIS').AsFloat; // Al�quota do PIS (em percentual)

      C170.VL_BC_PIS := FieldByName('VL_BC_ICMS').AsFloat; // Valor da base de c�lculo do PIS

      C170.VL_PIS := C170.VL_BC_PIS * C170.ALIQ_PIS_PERC / 100; //Valor do PIS

      C170.CST_COFINS := StrToCstCofins(FieldByName('CST_COFINS').AsString); // C�digo da Situa��o Tribut�ria referente ao COFINS.
      C170.ALIQ_COFINS_PERC := FieldByName('ALIQ_COFINS').AsFloat; // Al�quota do COFINS (em percentual)

      C170.VL_BC_COFINS := FieldByName('VL_BC_ICMS').AsFloat; // Valor da base de c�lculo da COFINS

      C170.VL_COFINS := C170.VL_BC_COFINS * C170.ALIQ_COFINS_PERC / 100; //Valor da COFINS

      C170.COD_CTA := COD_CTA_PRODUTO.Text; //C�digo da conta anal�tica cont�bil debitada/creditada

      Registro_0500(C170.COD_CTA);

      if LeftStr(C170.COD_ITEM, 3) ='S/C'
        then Registro_O200(C170.COD_ITEM, C170.DESCR_COMPL, C170.UNID, FieldByName('NCM').AsString)
        else Registro_O200(C170);

      Registro_O400(C170.COD_NAT);

      Next;
    end;
    Free;
  end;

end;

procedure TfrmSpedContribuicao.RegistroC170e(reg: TRegistroC100;
  forne: string);
var
  item: integer;
  C170: TRegistroC170;
  texto: string;
begin
  {
  texto :=
    'SELECT * FROM ('+ENTRADA_REGC170+') '+
    'WHERE ENT_NOTAFISCAL = '+QuotedStr(reg.NUM_DOC)+
    '   AND ENT_FORNECEDOR = '+QuotedStr(forne)+
    '   AND ENT_DT_ENTRADA = '+formataDataSQL(reg.DT_DOC)+
    IfThen(NOTA_ENTRADA='', '', '   AND NOTA = '+QuotedStr(NOTA_ENTRADA);

  item := 0;
  with TIBConsulta.Abrir(texto) do
  begin
    desejaEncerrarProcesso;
    while not Eof do
    begin
      inc(item);
      C170 := reg.RegistroC170.New;
      C170.NUM_ITEM := IntToStr(item); // N�mero seq�encial do item no documento fiscal
      C170.COD_ITEM := FieldByName('COD_ITEM').AsString; // C�digo do item (campo 02 do Registro 0200)
      C170.DESCR_COMPL := StringReplace(FieldByName('DESCR_COMPL').AsString, #13#10, '',[rfReplaceAll]); //Descri��o complementar do item como adotado no documento fiscal
      C170.QTD := FieldByName('QTD').AsFloat; // Quantidade do item
      C170.UNID := FieldByName('UNID').AsString; // Unidade do item(Campo 02 do registro 0190)
      C170.VL_ITEM := FieldByName('VL_ITEM').AsFloat; //+ FieldByName('VL_IPI').AsFloat (CLYSON)
                     //+ FieldByName('VL_FRETE').AsFloat + FieldByName('VL_ICMS_ST').AsFloat+
                     //+ FieldByName('VL_OUTROS').AsFloat;
      C170.VL_DESC := FieldByName('VL_DESC').AsFloat; // Valor do desconto comercial
      C170.IND_MOV := TACBrMovimentacaoFisica(0);    /// Movimenta��o f�sica do ITEM/PRODUTO: 0 - SIM; 1- N�O
      C170.CST_ICMS := StrToCstIcms(FieldByName('CST_ICMS').AsString); // C�digo da Situa��o Tribut�ria referente ao ICMS, conforme a Tabela indicada no item 4.3.1
      C170.CFOP := FieldByName('CFOP').AsString; // C�digo Fiscal de Opera��o e Presta��o
      C170.COD_NAT := FieldByName('CFOP').AsString; // C�digo da natureza da opera��o (campo 02 do Registro 0400)
      if (Pos(RightStr(FieldByName('CST_ICMS').AsString, 2), '3040415060') = 0)
        and (FieldByName('ALIQ_ICMS').AsFloat > 0) then
      begin
        C170.VL_BC_ICMS := FieldByName('VL_BC_ICMS').AsFloat; // Valor da base de c�lculo do ICMS
        C170.ALIQ_ICMS := FieldByName('ALIQ_ICMS').AsFloat; // Al�quota do ICMS
        C170.VL_ICMS := RoundTo(FieldByName('VL_BC_ICMS').AsFloat * FieldByName('ALIQ_ICMS').AsFloat / 100, -2); // Valor do ICMS creditado/debitado
      end;

      if FieldByName('VL_BC_ICMS_ST').AsFloat > 0 then
      begin
        C170.VL_BC_ICMS_ST := FieldByName('VL_BC_ICMS_ST').AsFloat; // Valor da base de c�lculo referente � substitui��o tribut�ria
        C170.ALIQ_ST := FieldByName('ALIQ_ST').AsFloat; // Al�quota do ICMS da substitui��o tribut�ria na unidade da federa��o de destino
        C170.VL_ICMS_ST := FieldByName('VL_ICMS_ST').AsFloat; // Valor do ICMS referente � substitui��o tribut�ria
      end;
      C170.IND_APUR := TACBrApuracaoIPI(ApuracaoIPI.ItemIndex); // Indicador de per�odo de apura��o do IPI: 0 - Mensal; 1 - Decendial

      if DESTACA_IPI_ENTRADA.Checked then
      begin
        C170.COD_ENQ := FieldByName('COD_ENQ').AsString; // C�digo de enquadramento legal do IPI, conforme tabela indicada no item 4.5.3.
        C170.CST_IPI := StrToCstIpi(FieldByName('CST_IPI').AsString); // C�digo da Situa��o Tribut�ria referente ao IPI, conforme a Tabela indicada no item 4.3.2.
        C170.VL_BC_IPI := IfThen(ParamValido(853, 'SIM'), FieldByName('VL_BC_IPI').AsFloat, 0); // Valor da base de c�lculo do IPI
        C170.ALIQ_IPI := IfThen(ParamValido(853, 'SIM'), FieldByName('ALIQ_IPI').AsFloat, 0); // Al�quota do IPI
        C170.VL_IPI := IfThen(ParamValido(853, 'SIM'), FieldByName('VL_IPI').AsFloat, 0); // Valor do IPI creditado/debitado
      end;

      C170.CST_PIS := StrToCstPis(FieldByName('CST_PIS').AsString); // C�digo da Situa��o Tribut�ria referente ao PIS.
      C170.VL_BC_PIS := FieldByName('VL_BC_PIS').AsFloat; // Valor da base de c�lculo do PIS
      C170.ALIQ_PIS_PERC := FieldByName('ALIQ_PIS_PERC').AsFloat;
      C170.VL_PIS := C170.VL_BC_PIS * C170.ALIQ_PIS_PERC / 100;

      C170.CST_COFINS := StrToCstCofins(FieldByName('CST_COFINS').AsString); // C�digo da Situa��o Tribut�ria referente ao COFINS.
      C170.VL_BC_COFINS := FieldByName('VL_BC_COFINS').AsFloat; // Valor da base de c�lculo da COFINS
      C170.ALIQ_COFINS_PERC := FieldByName('ALIQ_COFINS_PERC').AsFloat;
      C170.VL_COFINS := C170.VL_BC_COFINS * C170.ALIQ_COFINS_PERC / 100;

      C170.COD_CTA := COD_CTA_PRODUTO.Text; //C�digo da conta anal�tica cont�bil debitada/creditada

      Registro_0500(C170.COD_CTA);

      Registro_O200(C170);
      Registro_O400(C170.COD_NAT);

      Next;
    end;
    Free;
  end;
  }
end;

procedure TfrmSpedContribuicao.Registro_O200(reg: TRegistroA170);
var
  O200: TRegistro0200;
  codigo, texto: string;
begin
  codigo := 'SERV' + reg.COD_ITEM;
  if lst0200.IndexOf(codigo) >= 0 then Exit;
  lst0200.Add(codigo);
  O200 := ACBrSPEDPisCofins1.Bloco_0.Registro0200New;

  texto :=
    'SELECT * FROM SERVICOS_CODIFICAR '+
    'WHERE SVC_CODIGO = '+QuotedStr(reg.COD_ITEM);

  with TIBConsulta.Abrir(texto) do
  begin
    O200.COD_ITEM := reg.COD_ITEM;
    O200.DESCR_ITEM := StringReplace(FieldByName('SVC_DESCRICAO').AsString, #13#10, '',[rfReplaceAll]);
    O200.COD_NCM := FieldByName('SVC_NCM').AsString;
    O200.TIPO_ITEM := StrToTipoItem('00');
    O200.UNID_INV := 'UND';
//    O200.EX_IPI := FieldByName('MTR_COD_IPI').AsString;
//    O200.COD_GEN := FieldByName('MTR_GENERO').AsString;
    O200.COD_LST := FieldByName('SVC_SERV_COD_1').AsString;
//    O200.ALIQ_ICMS := FieldByName('MTR_PERC_ICMS').AsFloat;
    Registro_0190(O200.UNID_INV);
    Free;
  end;

end;

procedure TfrmSpedContribuicao.Registro_A170(reg: TRegistroA100;
  nota, minuta: string);
var
  texto: string;
  A170: TRegistroA170;
begin
  texto :=
    'SELECT FIRST 1 '+
    '    COALESCE(MTR_CODIGO, SVC_CODIGO, ''SERVICO'') "COD_ITEM", '+
    '    CASE WHEN MTR_CODIGO IS NOT NULL THEN MTR_DESCRICAO '+
    '        WHEN SVC_NCM IS NOT NULL THEN SVC_DESCRICAO '+
    '        ELSE ''SERVICOS GRAFICOS EM GERAL'' END "DESCR_COMPL", '+
    '    COALESCE(MTR_CODIGO_NCM, SVC_NCM) "NCM", '+
    '    FTR_VRNOTA "VL_ITEM", '+
    '    ITF_CST_PIS "CST_PIS", '+
    '    ITF_CST_COFINS "CST_COFINS" '+
    'FROM FATURAS '+
    'INNER JOIN ITENS_FATURADOS ON ITF_NOTAFISCAL = FTR_NOTAFISCAL '+
    '    AND ITF_MINUTA = FTR_MINUTA '+
    'LEFT JOIN MATERIAIS ON MTR_CODIGO = ITF_COD_PRODUTO '+
    'LEFT JOIN SERVICOS_CODIFICAR ON SVC_CODIGO = ITF_COD_SERVICO '+
    'WHERE FTR_NOTAFISCAL = '+QuotedStr(nota)+
    '    AND FTR_MINUTA = '+QuotedStr(minuta);

  with TIBConsulta.Abrir(texto) do
  begin
    desejaEncerrarProcesso;
    while not Eof do
    begin
      A170 := reg.RegistroA170.New;
      A170.NUM_ITEM := 1;
      A170.COD_ITEM := FieldByName('COD_ITEM').AsString;
      A170.VL_ITEM := FieldByName('VL_ITEM').AsFloat;
      A170.COD_CTA := CONTA_PIS_COFINS.Text;
      A170.NAT_BC_CRED := StrToNatBcCred('13');

      A170.CST_PIS := StrToCstPis('01'); //FieldByName('CST_PIS').AsString);
      A170.ALIQ_PIS := ALIQUOTA_PIS.Value;
      A170.VL_BC_PIS := A170.VL_ITEM;
      A170.VL_PIS := A170.VL_BC_PIS * A170.ALIQ_PIS / 100;

      A170.CST_COFINS := StrToCstCofins('01'); //FieldByName('CST_COFINS').AsString);
      A170.ALIQ_COFINS := ALIQUOTA_COFINS.Value;
      A170.VL_BC_COFINS := A170.VL_ITEM;
      A170.VL_COFINS := A170.VL_BC_COFINS * A170.ALIQ_COFINS / 100;

      //A170.DESCR_COMPL := '';
      //VL_DESC
      //IND_ORIG_CRED
      //COD_CCUS

      Registro_0500(A170.COD_CTA);
      Registro_O200(A170.COD_ITEM, FieldByName('DESCR_COMPL').AsString, 'UND', FieldByName('NCM').AsString);

      Next;
    end;
    Free;
  end;

  //Registro_O200(A170);

end;

procedure TfrmSpedContribuicao.Registro_0500(codigo: string);
var
  O500: TRegistro0500;
begin
  if codigo = '' then Exit;
  if lst0500.IndexOf(codigo) >= 0 then Exit;
  lst0500.Add(codigo);

  O500 := ACBrSPEDPisCofins1.Bloco_0.Registro0500New;
  O500.DT_ALT := DATA_INICIAL.Date;
  O500.COD_NAT_CC := StrToNaturezaConta('09'); //ncgOutras;
  O500.IND_CTA := StrToIndCTA('A');
  O500.NIVEL := '3';
  O500.COD_CTA := codigo;
  O500.NOME_CTA := codigo;

end;

procedure TfrmSpedContribuicao.Registro_C100(C001: TRegistroC001);
var
  C010: TRegistroC010;
  C100: TRegistroC100;
  O150: TParticipante0150;
begin
//  //**************************************************//
//  //**********    NOTAS FISCAIS DE SAIDA     *********//
//  //**************************************************//
//  MostraMSG(Self, 'Bloco C : saidas ...');
//  ConsultaSQL :=
//    'SELECT * FROM ('+LISTA_SAIDA_REG100+') '+
//    'WHERE COD_MOD IN (''01'', ''55'') '+
//    '   AND DT_DOC BETWEEN '+formataDataSQL(DATA_INICIAL.Date)+
//    '   AND '+formataDataSQL(DATA_FINAL.Date);
//    //IfThen(NOTA_SAIDA = '', '', '   AND NOTA = '+QuotedStr(NOTA_SAIDA));
//  with TIBConsulta.Abrir(ConsultaSQL) do
//  begin
//
//    if IsEmpty
//      then C001.IND_MOV := imSemDados
//      else begin
//        C001.IND_MOV := imComDados;
//        C010 := C001.RegistroC010.New;
//        C010.CNPJ := ACBrSPEDPisCofins1.Bloco_0.Registro0000.CNPJ;
//        C010.IND_ESCRI := TACBrIndEscrituracao(IND_ESCRI.ItemIndex);
//      end;
//
//    while not Eof do
//    begin
//      desejaEncerrarProcesso;
//      C100 := C010.RegistroC100.New;
//      C100.IND_OPER := TACBrIndTipoOper(FieldByName('IND_OPER').AsInteger);
//      C100.IND_EMIT := TACBrEmitente(FieldByName('IND_EMIT').AsInteger);
//      C100.COD_PART := Trim(FieldByName('COD_PART').AsString);
//      if Trim(FieldByName('CHV_NFE').AsString) <> '' then C100.COD_MOD := Copy(FieldByName('CHV_NFE').AsString, 21, 2);
//      if C100.COD_MOD = '' then C100.COD_MOD := FieldByName('COD_MOD').AsString;
//      C100.COD_SIT := TACBrCodSit(strToIntDef(FieldByName('COD_SIT').DisplayText, 0));
//      if Trim(FieldByName('CHV_NFE').AsString) <> '' then C100.SER := Copy(FieldByName('CHV_NFE').AsString, 23, 3);
//      if C100.SER = '' then C100.SER := iif(Trim(FieldByName('SER').AsString)='', '001', FieldByName('SER').AsString);
//      C100.NUM_DOC := FieldByName('NUM_DOC').AsString;
//      C100.CHV_NFE := FieldByName('CHV_NFE').AsString;
//      C100.DT_DOC := FieldByName('DT_DOC').AsDateTime;
//      C100.DT_E_S := FieldByName('DT_DOC').AsDateTime;
//
//      C100.VL_MERC := FieldByName('VL_DOC').AsFloat;
//      if FieldByName('FTR_VRNOTA').AsFloat > 0
//        then C100.VL_DOC := FieldByName('FTR_VRNOTA').AsFloat
//        else C100.VL_DOC := FieldByName('VL_DOC').AsFloat + FieldByName('VL_IPI').AsFloat + FieldByName('VL_FRT').AsFloat;
//
//      C100.IND_PGTO := StrToIndPgto(FieldByName('IND_PGTO').AsString);
//      C100.VL_DESC := FieldByName('VL_DESC').AsFloat;
//      C100.IND_FRT := StrToIndFrt(FieldByName('IND_FRT').AsString);
//      C100.VL_FRT := FieldByName('VL_FRT').AsFloat;
//      C100.VL_OUT_DA := FieldByName('VL_OUT_DA').AsFloat;
//      if FieldByName('VL_BC_ICMS2').AsFloat > 0
//        then C100.VL_BC_ICMS := FieldByName('VL_BC_ICMS2').AsFloat
//        else C100.VL_BC_ICMS := FieldByName('VL_BC_ICMS').AsFloat;
//      C100.VL_ICMS := IfThen(FieldByName('VL_BC_ICMS_II').AsFloat > 0, FieldByName('VL_BC_ICMS_II').AsFloat, FieldByName('VL_ICMS').AsFloat);
//      C100.VL_BC_ICMS_ST := FieldByName('VL_BC_ICMS_ST').AsFloat;
//      C100.VL_ICMS_ST := FieldByName('VL_ICMS_ST').AsFloat;
//      C100.VL_IPI := FieldByName('VL_IPI').AsFloat;
//      C100.VL_SEG := FieldByName('VL_SEG').AsFloat;
//      C100.VL_PIS := FieldByName('VL_PIS').AsFloat;
//      C100.VL_COFINS := FieldByName('VL_COFINS').AsFloat;
//
//      if C100.COD_SIT = sdRegular
//        then Registro_C170(C100, FieldByName('MINUTA').AsString);
//
//      MostraMSG(Self, 'Bloco C (documento) ' + C100.NUM_DOC);
//
//      LimpaRegistro_O150(O150);
//      O150.COD_PART := FieldByName('COD_PART').AsString;
//      O150.NOTA := FieldByName('NOTA').AsString;
//      O150.MINUTA := FieldByName('MINUTA').AsString;
//      Registro_0150(O150);
//      Next;
//    end;
//    Free;
//  end;

  //**********    NOTAS FISCAIS DE ENTRADA   *********//
  //**************************************************//
{
  MostraMSG(Self, 'Bloco C : entradas ...');
  ConsultaSQL :=
    'SELECT * FROM ('+LISTA_ENTRADA_REG100+') '+
    'WHERE DT_DOC BETWEEN '+
    formataDataSQL(DATA_INICIAL.Date)+' AND '+formataDataSQL(DATA_FINAL.Date)+
    IfThen(NOTA_ENTRADA='', '', '   AND NUM_DOC = '+QuotedStr(NOTA_ENTRADA);

  with TIBConsulta.Abrir(ConsultaSQL) do
  begin

    if (not IsEmpty) and (not Assigned(C010)) then
    begin
      C001.IND_MOV := imComDados;
      C010 := C001.RegistroC010.New;
      C010.CNPJ := ACBrSPEDPisCofins1.Bloco_0.Registro0000.CNPJ;
      C010.IND_ESCRI := TACBrIndEscrituracao(IND_ESCRI.ItemIndex);
    end;

    while not Eof do
    begin
      desejaEncerrarProcesso;
      C100 := C010.RegistroC100.New;
      C100.IND_OPER := tpEntradaAquisicao;
      C100.IND_EMIT := TACBrEmitente(FieldByName('IND_EMIT').AsInteger);
      C100.COD_PART := Trim(FieldByName('COD_PART').AsString);
      C100.COD_MOD := FieldByName('COD_MOD').AsString;
      C100.COD_SIT := TACBrCodSit(FieldByName('COD_SIT').AsInteger);
      C100.NUM_DOC := FieldByName('NUM_DOC').AsString;
      C100.CHV_NFE := FieldByName('CHV_NFE').AsString;
      C100.DT_DOC := FieldByName('DT_DOC').AsDateTime;
      C100.DT_E_S := FieldByName('DT_DOC').AsDateTime;
      C100.IND_PGTO := StrToIndPgto(FieldByName('IND_PGTO').AsString);
      C100.VL_DESC := FieldByName('VL_DESC').AsFloat;
      C100.IND_FRT := StrToIndFrt(FieldByName('IND_FRT').AsString);
      C100.VL_FRT := FieldByName('VL_FRT').AsFloat;
      C100.VL_OUT_DA := FieldByName('VL_OUT_DA').AsFloat;
      C100.VL_BC_ICMS := FieldByName('VL_BC_ICMS').AsFloat;
      C100.VL_ICMS := FieldByName('VL_ICMS').AsFloat;
      C100.VL_BC_ICMS_ST := FieldByName('VL_BC_ICMS_ST').AsFloat;
      C100.VL_ICMS_ST := FieldByName('VL_ICMS_ST').AsFloat;
      C100.VL_IPI := IfThen(DESTACA_IPI_ENTRADA.Checked, FieldByName('VL_IPI').AsFloat, 0);

      C100.VL_MERC := FieldByName('VL_MERC').AsFloat;
      C100.VL_DOC := FieldByName('VL_DOC').AsFloat +
                     FieldByName('VL_FRT').AsFloat +
                     IfThen(DESTACA_IPI_ENTRADA.Checked, FieldByName('VL_IPI').AsFloat, 0);

      C100.SER := IfThen(Trim(FieldByName('CHV_NFE').AsString) <> '', Copy(FieldByName('CHV_NFE').AsString, 23, 3), '001');
      //C100.VL_ABAT_NT: currency;              /// Abatimento n�o tributado e n�o comercial Ex. desconto ICMS nas remessas para ZFM: // Prates
      //C100.VL_SEG := FieldByName('VL_SEG').AsFloat;

      C100.VL_PIS := FieldByName('VL_PIS').AsFloat;
      C100.VL_COFINS := FieldByName('VL_COFINS').AsFloat;
      //C100.VL_PIS_ST: currency;               /// Valor total do PIS retido por substitui��o tribut�ria
      //C100.VL_COFINS_ST: currency;            /// Valor total da COFINS retido por substitui��o tribut�ria

      MostraMSG(Self, 'Bloco C (documento) ' + C100.NUM_DOC);

      if C100.COD_SIT = sdRegular
        then RegistroC170e(C100, FieldByName('ENT_FORNECEDOR').AsString);

      LimpaRegistro_O150(O150);
      O150.COD_PART := FieldByName('COD_PART').AsString;
      O150.NOTA := FieldByName('NUM_DOC').AsString;
      O150.FORNE := FieldByName('ENT_FORNECEDOR').AsString;
      O150.DATA := FieldByName('DT_E_S').AsDateTime;
      Registro_0150(O150);

      Next;
    end;
    Free;
  end;
}
end;

procedure TfrmSpedContribuicao.Registro_A100(a001: TRegistroA001);
var
  A010: TRegistroA010;
  A100: TRegistroA100;
  O150: TParticipante0150;
begin

  ConsultaSQL :=
    'SELECT * FROM ('+NOTA_SERVICO+') '+
    'WHERE DT_DOC BETWEEN '+formataDataSQL(DATA_INICIAL.Date)+
    '   AND '+formataDataSQL(DATA_FINAL.Date)+
    '   AND CHAR_LENGTH(COD_PART) >= 11 ';

  with TIBConsulta.Abrir(ConsultaSQL) do
  begin

    if IsEmpty
      then a001.IND_MOV := imSemDados
      else begin
        a001.IND_MOV := imComDados;
        A010 := a001.RegistroA010.New;
        A010.CNPJ := ACBrSPEDPisCofins1.Bloco_0.Registro0000.CNPJ;
      end;

    while not Eof do
    begin
      desejaEncerrarProcesso;
      A100 := A010.RegistroA100.New;
      A100.IND_OPER := StrToIndOper('1'); // 02	Indicador do tipo de opera��o: 0 - Servi�o Contratado pelo Estabelecimento; 1 - Servi�o Prestado pelo Estabelecimento.	C	001*
      A100.IND_EMIT := StrToIndEmit('0'); // 03	Indicador do emitente do documento fiscal: 0 - Emiss�o pr�pria; 1 - Emiss�o de Terceiros	C	001*
      A100.COD_PART := FieldByName('COD_PART').AsString; // 04	C�digo do participante (campo 02 do Registro 0150):- do emitente do documento, no caso de emiss�o de terceiros;- do adquirente, no caso de servi�os prestados.	C	060
      A100.COD_SIT := StrToCodSit(FieldByName('COD_SIT').AsString); // 05	C�digo da situa��o do documento fiscal:00 � Documento regular 02 � Documento cancelado	N	002*
//      A100.SER           : string;                     //06	S�rie do documento fiscal	C	020
//      A100.SUB           : string;                     //07	Subs�rie do documento fiscal	C	020
      A100.NUM_DOC := FieldByName('NUM_DOC').AsString; // 08	N�mero do documento fiscal ou documento internacional equivalente	C	060

      if A100.COD_SIT <> sdCancelado then
      begin
        A100.CHV_NFSE := FieldByName('CHV_NFSE').AsString; // 09	Chave/C�digo de Verifica��o da nota fiscal de servi�o eletr�nica	C	060
        A100.DT_DOC := FieldByName('DT_DOC').AsDateTime; // 10	Data da emiss�o do documento fiscal	N	008*
        A100.DT_EXE_SERV := FieldByName('DT_DOC').AsDateTime; // 11	Data de Execu��o / Conclus�o do Servi�o	N	008*
        A100.VL_DOC := FieldByName('VL_DOC').AsFloat; // 12	Valor total do documento	N	-	02
        A100.IND_PGTO := StrToIndPgto(FieldByName('IND_PGTO').AsString); // 13	Indicador do tipo de pagamento:0- � vista;1- A prazo;9- Sem pagamento.	C	001*	-
//        A100.VL_DESC := FieldByName('VL_DESC').AsFloat; // 14	Valor total do desconto	N	-	02

        A100.VL_BC_PIS := FieldByName('VL_DOC').AsFloat; // 15	Valor da base de c�lculo do PIS/PASEP	N	-	02
        A100.VL_PIS := A100.VL_BC_PIS * ALIQUOTA_PIS.Value / 100;  //16	Valor total do PIS	N	-	02
        A100.VL_BC_COFINS := FieldByName('VL_DOC').AsFloat; // 17	Valor da base de c�lculo da COFINS	N	-	02
        A100.VL_COFINS := A100.VL_BC_COFINS * ALIQUOTA_COFINS.Value / 100; //18	Valor total da COFINS	N	-	02

//        A100.VL_PIS_RET    : Variant;                    //19	Valor total do PIS retido na fonte	N	-	02
//        A100.VL_COFINS_RET : Variant;                    //20	Valor total da COFINS retido na fonte.	N	-	02
        A100.VL_ISS := FieldByName('VL_DOC').AsFloat; // 21	Valor do ISS	N	-	02

        Registro_A170(A100,
                      FieldByName('NOTA').AsString,
                      FieldByName('MINUTA').AsString);

      end;

      MostraMSG(Self, 'Bloco A (documento): ' + A100.NUM_DOC);

      ////*****   COD_PART do registro 0150   *****////
      LimpaRegistro_O150(O150);
      O150.COD_PART := FieldByName('COD_PART').AsString;
      O150.NOME := FieldByName('NOME').AsString;
      O150.COD_PAIS := FieldByName('COD_PAIS').AsString;
      //if FieldByName('IE').AsString <> ''
      if Einteiro(FieldByName('IE').AsString)
        then O150.IE := SoNumeros(FieldByName('IE').AsString);
      if not FieldByName('COD_MUN').IsNull
        then O150.COD_MUN := FieldByName('COD_MUN').AsInteger;
      O150.SUFRAMA := FieldByName('SUFRAMA').AsString;
      O150.ENDE := FieldByName('ENDERECO').AsString;
      O150.BAIRRO := FieldByName('BAIRRO').AsString;
      Registro_0150(O150);

      Next;
    end;
    Free;
  end;

end;

procedure TfrmSpedContribuicao.Registro_M505(reg: TRegistroM500);
var
  texto: string;
  M505: TRegistroM505;
begin
  {
  texto :=
    'SELECT '+
    '    CST_COFINS, '+
    '    SUM(VL_DOC) "VL_BASE" '+
    'FROM ( '+FECHAMENTO_SQL+' ) '+
    'WHERE CST_COFINS IN (''50'') AND ALIQ_COFINS > 0 AND DATA BETWEEN '+
    formataDataSQL(DATA_INICIAL.Date)+' AND '+formataDataSQL(DATA_FINAL.Date)+
    IfThen(NOTA_ENTRADA='', '', '   AND NOTA = '+QuotedStr(NOTA_ENTRADA)+
    ' GROUP BY 1 ';
  with TIBConsulta.Abrir(texto) do
  begin
    desejaEncerrarProcesso;
    while not Eof do
    begin
      M505 := reg.RegistroM505.New;
      M505.NAT_BC_CRED := bccAqBensRevenda;
      M505.CST_COFINS := StrToCstCofins(FieldByName('CST_COFINS').AsString);
      M505.VL_BC_COFINS_TOT := FieldByName('VL_BASE').AsFloat;
      M505.VL_BC_COFINS_NC := FieldByName('VL_BASE').AsFloat;
      M505.VL_BC_COFINS := FieldByName('VL_BASE').AsFloat;
      Next;
    end;
    Free;
  end;
  }
end;

procedure TfrmSpedContribuicao.GerarBloco_M;
var
  M001: TRegistroM001;
  M100: TRegistroM100;
  M110: TRegistroM110;
  M200: TRegistroM200;
  M205: TRegistroM205;
  M210: TRegistroM210;
  M500: TRegistroM500;
  M600: TRegistroM600;
  M605: TRegistroM605;
  M610: TRegistroM610;
  debito: double;
  texto: string;
begin
  {
  M001 := ACBrSPEDPisCofins1.Bloco_M.RegistroM001New;
  M001.IND_MOV := imComDados;

  M200 := M001.RegistroM200.Create;
  M600 := M001.RegistroM600.Create;

  texto :=
    'SELECT '+
    '   ITE_ALIQ_PIS, '+
    '   SUM(ITE_VR_ITEM) "VL_BASE", '+
    '   SUM(ITE_VR_ITEM * ITE_ALIQ_PIS/100) "VL_CRED" '+
    'FROM ENTRADAS '+
    'INNER JOIN ITENS_ENTRADA ON ENT_NOTAFISCAL = ITE_NFISCAL '+
    '    AND ENT_EMISSAO = ITE_EMISSAO AND ENT_FORNECEDOR = ITE_FORNECEDOR '+
    'WHERE ITE_ALIQ_PIS > 0 '+
    '    AND CAST(ENT_DT_ENTRADA AS DATE) BETWEEN '+
    formataDataSQL(DATA_INICIAL.Date)+' AND '+formataDataSQL(DATA_FINAL.Date)+
    IfThen(NOTA_ENTRADA='', '', '   AND ENT_NOTAFISCAL = '+QuotedStr(NOTA_ENTRADA)+
    ' GROUP BY 1 ';

  with TIBConsulta.Abrir(texto) do
  begin
    desejaEncerrarProcesso;
    while not Eof do
    begin
      M100 := M001.RegistroM100.New;
      M100.COD_CRED := '101';
      M100.IND_CRED_ORI := StrToIndCredOri('0');
      M100.VL_CRED := FieldByName('VL_CRED').AsFloat;
      M100.VL_CRED_DISP := M100.VL_CRED;
      M100.IND_DESC_CRED := StrToIndDescCred('0');
      M100.VL_CRED_DESC := M100.VL_CRED_DISP;

      M200.VL_TOT_CONT_NC_PER := M200.VL_TOT_CRED_DESC + M100.VL_CRED_DESC;
      M200.VL_TOT_CRED_DESC := M200.VL_TOT_CRED_DESC + M100.VL_CRED_DESC;

      M205 := M200.RegistroM205.New;
      M205.NUM_CAMPO := '08';
      M205.COD_REC := '000000';
      M205.VL_DEBITO := M200.VL_TOT_CRED_DESC;

      M210 := M200.RegistroM210.New;
      M210.COD_CONT := StrToCodCont('01');
      M210.VL_REC_BRT := M100.VL_CRED_DISP;
      M210.VL_BC_CONT := M100.VL_BC_PIS;
      M210.ALIQ_PIS := M100.ALIQ_PIS;
      M210.VL_CONT_DIFER := 0;
      M210.VL_CONT_DIFER_ANT := 0;
      M210.VL_CONT_APUR := M100.VL_CRED_DESC;
      M210.VL_AJUS_ACRES := 0;
      M210.VL_CONT_PER := (M210.VL_CONT_APUR + M210.VL_AJUS_ACRES) - (M210.VL_CONT_DIFER + M210.VL_CONT_DIFER_ANT);
      M210.ALIQ_PIS := FieldByName('ITE_ALIQ_PIS').AsFloat;

      Registro_M105(M100);

      Next;
    end;
    Free;
  end;

  //Registro M500: Cr�dito de Cofins Relativo Ao Per�odo
  texto :=
    'SELECT '+
    '   ITE_ALIQ_COFINS, '+
    '   SUM(ITE_VR_ITEM) "VL_BASE", '+
    '   SUM(ITE_VR_ITEM * ITE_ALIQ_PIS/100) "VL_CRED" '+
    'FROM ENTRADAS '+
    'INNER JOIN ITENS_ENTRADA ON ENT_NOTAFISCAL = ITE_NFISCAL '+
    '    AND ENT_EMISSAO = ITE_EMISSAO AND ENT_FORNECEDOR = ITE_FORNECEDOR '+
    'WHERE ITE_ALIQ_PIS > 0 '+
    '    AND CAST(ENT_DT_ENTRADA AS DATE) BETWEEN '+
    formataDataSQL(DATA_INICIAL.Date)+' AND '+formataDataSQL(DATA_FINAL.Date)+
    IfThen(NOTA_ENTRADA='', '', '   AND ENT_NOTAFISCAL = '+QuotedStr(NOTA_ENTRADA)+
    ' GROUP BY 1 ';

  with TIBConsulta.Abrir(texto) do
  begin
    desejaEncerrarProcesso;
    while not Eof do
    begin
      M500 := M001.RegistroM500.New;
      M500.COD_CRED := '101';
      M500.IND_CRED_ORI := StrToIndCredOri('0');
      M500.VL_CRED := FieldByName('VL_CRED').AsFloat;
      M500.VL_CRED_DISP := M500.VL_CRED;
      M500.IND_DESC_CRED := StrToIndDescCred('0');
      M500.VL_CRED_DESC := M500.VL_CRED_DISP;

      M600.VL_TOT_CONT_NC_PER := M600.VL_TOT_CRED_DESC + M500.VL_CRED_DESC;
      M600.VL_TOT_CRED_DESC :=   M600.VL_TOT_CRED_DESC + M500.VL_CRED_DESC;

      M605 := M600.RegistroM605.New;
      M605.NUM_CAMPO := '08';
      M605.COD_REC := '000000';
      M605.VL_DEBITO := M600.VL_TOT_CRED_DESC;

      M610 := M600.RegistroM610.New;
      M610.COD_CONT := StrToCodCont('01');
      M610.VL_REC_BRT := 0;
      M610.VL_BC_CONT := M500.VL_BC_COFINS;
      M610.VL_CONT_APUR := M500.VL_CRED_DISP;
      M610.VL_AJUS_ACRES := 0;
      M610.VL_AJUS_REDUC := 0;
      M610.VL_CONT_PER := M610.VL_CONT_APUR;
      M610.ALIQ_COFINS := FieldByName('ITE_ALIQ_COFINS').AsFloat;

      Registro_M505(M500);

      Next;
    end;
    Free;
  end;
  }
end;

procedure TfrmSpedContribuicao.Registro_D100(D001: TRegistroD001);
var
  D010: TRegistroD010;
  D100: TRegistroD100;
  D101: TRegistroD101;
  O150: TParticipante0150;
  participante, texto: string;
begin

  texto :=
    'SELECT * FROM ('+CONHECIMENTO_SQL+') '+
    'WHERE ENTRADA BETWEEN '+formataDataSQL(DATA_INICIAL.Date)+
    '   AND '+formataDataSQL(DATA_FINAL.Date);

  with TIBConsulta.Abrir(texto) do
  begin

    if IsEmpty
      then D001.IND_MOV := imSemDados
      else begin
        D001.IND_MOV := imComDados;
        D010 := D001.RegistroD010.New;
        D010.CNPJ := ACBrSPEDPisCofins1.Bloco_0.Registro0000.CNPJ;
      end;

    while not Eof do
    begin
      desejaEncerrarProcesso;
      D100 := D010.RegistroD100.New;
      D100.IND_OPER := '0'; //Indicador do tipo de opera��o: 0- Aquisi��o; 1- Presta��o
      D100.IND_EMIT := StrToIndEmit('1'); //Indicador do emitente do documento fiscal: 0- Emiss�o pr�pria; 1- Terceiros
      D100.COD_PART := FieldByName('COD_PART').AsString; //C�digo do participante (campo 02 do Registro 0150):
      D100.COD_MOD := FormatCurr('00', StrToIntDef(FieldByName('COD_MOD').AsString, 8)); //C�digo do modelo do documento fiscal, conforme a Tabela 4.1.1
      D100.COD_SIT := StrToCodSit(FieldByName('COD_SIT').AsString); //C�digo da situa��o do documento fiscal, conforme a Tabela 4.1.2
      D100.SER := FieldByName('SER').AsString; //S�rie do documento fiscal
      D100.SUB := FieldByName('SUB').AsString; //Subs�rie do documento fiscal
      D100.NUM_DOC := FieldByName('NUM_DOC').AsString; //N�mero do documento fiscal
      D100.CHV_CTE := FieldByName('CHV_CTE').AsString; //Chave da Conhecimento Eletr�nico
      D100.DT_DOC := FieldByName('DT_DOC').AsDateTime; //Data da emiss�o do documento fiscal
      D100.DT_A_P := FieldByName('DT_A_P').AsDateTime; //Data da aquisi��o ou da presta��odo servi�o
      D100.TP_CT_e := FieldByName('TP_CTE').AsString; //Tipo de conhecimento conforme definido no manual de integra��o do CT-e
//      D100.CHV_CTE_REF: String;           //Chave do CT-e de referencia cujos valores foram complementados: 1 ou 2
      D100.VL_DOC := FieldByName('VL_DOC').AsFloat; //Valor total do documento fiscal
//      D100.VL_DESC := FieldByName('VL_DESC').AsFloat; //Valor total do desconto
      D100.IND_FRT := StrToIndFrt(FieldByName('IND_FRT').AsString);          //Indicador do tipo do frete:
      D100.VL_SERV := FieldByName('VL_SERV').AsFloat; //Valor do frete indicado no documento fiscal
      D100.VL_BC_ICMS := FieldByName('VL_BC_ICMS').AsFloat; //Valor da base de c�lculo do ICMS
      D100.VL_ICMS := FieldByName('VL_ICMS').AsFloat; //Valor do ICMS
      //D100.VL_NT: currency;               //Valor n�o tributado
      //D100.COD_INF: String;               //Valor do ICMS retido por substitui��o tribut�ria
      D100.COD_CTA := COD_CTA_PRODUTO.Text; //C�digo da conta analitica contabil debitada/creditada
      //D100.COD_MUN_ORIG: String;          //C�digo municipio origem conf. tab IBGE
      //D100.COD_MUN_DEST: String;          //C�digo municipio destino conf. tab IBGE

      //******* Registro D101: Complemento do Documento de Transporte
      //(C�digos 07, 08, 8B, 09, 10, 11, 26, 27 e 57) � PIS/Pasep
      Registro_D101(D100);
      Registro_D105(D100);

      Registro_0500(D100.COD_CTA);
      LimpaRegistro_O150(O150);

      participante :=
        'SELECT '+
        '    FRN_NOME "NOME", '+
        '    COALESCE(FRN_COD_PAIS, ''1058'') "COD_PAIS", '+
        '    FRN_NFE_CMUN "COD_MUN", '+
        '    FRN_ENDERECO "ENDERECO", '+
        '    FRN_BAIRRO "BAIRRO" '+
        'FROM CONHECIMENTO_FRETE '+
        'INNER JOIN CONTAS_PAGAR ON CTP_CHAVE_ELET_CONH = CHF_KEY '+
        'INNER JOIN FORNECEDORES F ON FRN_CODIGO = CTP_COD_FAVORECIDO '+
        'WHERE CHF_CNPJ = '+QuotedStr(D100.COD_PART);
      with TIBConsulta.Abrir(participante) do
      begin
        O150.COD_PART := D100.COD_PART;
        O150.NOME := FieldByName('NOME').AsString;
        O150.COD_PAIS := FieldByName('COD_PAIS').AsString;
        //O150.IE := SoNumeros(FieldByName('IE').AsString);
        O150.COD_MUN := FieldByName('COD_MUN').AsInteger;
        //O150.SUFRAMA := FieldByName('SUFRAMA').AsString;
        O150.ENDE := FieldByName('ENDERECO').AsString;
        O150.BAIRRO := FieldByName('BAIRRO').AsString;
        Registro_0150(O150);
        Free;
      end;

      MostraMSG(Self, 'Bloco D (documento): ' + D100.NUM_DOC);

      Next;
    end;
    Free;

  end;
end;

procedure TfrmSpedContribuicao.Registro_D105(reg: TRegistroD100);
var
  D105: TRegistroD105;
begin
  D105 := reg.RegistroD105.New;
  D105.IND_NAT_FRT := StrToNaturezaFrtContratado(IfThen(reg.IND_FRT = tfPorContaDestinatario, '1', '0'));
  D105.VL_ITEM := reg.VL_DOC;
  D105.CST_COFINS := StrToCstCofins('50');
  D105.NAT_BC_CRED := StrToNatBcCred('01');
  D105.VL_BC_COFINS := reg.VL_BC_ICMS;
  D105.ALIQ_COFINS := ALIQUOTA_COFINS.Value;
  D105.COD_CTA := CONTA_PIS_COFINS.Text;
end;

procedure TfrmSpedContribuicao.Registro_M105(reg: TRegistroM100);
var
  texto: string;
  M105: TRegistroM105;
  valorBasePIS: double;
begin
  {
  texto :=
    'SELECT '+
    '    CST_PIS, '+
    '    SUM(VL_DOC) "VL_BASE" '+
    'FROM ( '+FECHAMENTO_SQL+' ) '+
    'WHERE CST_PIS IN (''50'') AND ALIQ_PIS > 0 AND DATA BETWEEN '+
    formataDataSQL(DATA_INICIAL.Date)+' AND '+formataDataSQL(DATA_FINAL.Date)+
    IfThen(NOTA_ENTRADA='', '', '   AND NOTA = '+QuotedStr(NOTA_ENTRADA)+
    ' GROUP BY 1 ';

  with TIBConsulta.Abrir(texto) do
  begin
    while not Eof do
    begin
      desejaEncerrarProcesso;
      M105 := reg.RegistroM105.New;
      M105.NAT_BC_CRED := bccAqBensRevenda;
      M105.CST_PIS := StrToCstPis(FieldByName('CST_PIS').AsString);
      M105.VL_BC_PIS_TOT := valorBasePIS;
      M105.VL_BC_PIS_NC := FieldByName('VL_BASE').AsFloat;
      M105.VL_BC_PIS := FieldByName('VL_BASE').AsFloat;
      Next;
    end;
    Free;
  end;
  }
end;

procedure TfrmSpedContribuicao.Registro_D101(reg: TRegistroD100);
var
  D101: TRegistroD101;
begin
  {
  D101 := reg.RegistroD101.New;
  D101.IND_NAT_FRT := StrToNaturezaFrtContratado(IfThen(reg.IND_FRT = tfPorContaDestinatario, '1', '0'));
  D101.VL_ITEM := reg.VL_DOC;
  D101.CST_PIS := StrToCstPis('50');
  D101.NAT_BC_CRED := StrToNatBcCred('01');
  D101.VL_BC_PIS := reg.VL_BC_ICMS;
  D101.ALIQ_PIS := ALIQUOTA_PIS.Value;
  D101.COD_CTA := CONTA_PIS_COFINS.Text;
  }
end;

end.
