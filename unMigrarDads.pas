unit unMigrarDads;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, IBDatabase, DB, IBCustomDataSet,
  IBUpdateSQL, IBQuery, rxPlacemnt, rxToolEdit;

type
  TfrmMigrarDads = class(TForm)
    Banco_de_dados: TFilenameEdit;
    Label1: TLabel;
    FormStorage1: TFormStorage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    chCliente: TCheckBox;
    chContasReceber: TCheckBox;
    chContasPagar: TCheckBox;
    Label2: TLabel;
    Bevel2: TBevel;
    chFornecedores: TCheckBox;
    Database1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    Label3: TLabel;
    edSenha: TMaskEdit;
    qryOrigem: TIBQuery;
    updDestino: TIBUpdateSQL;
    qryDestino: TIBQuery;
    Label4: TLabel;
    Cancelar: TCheckBox;
    BitBtn3: TBitBtn;
    Label5: TLabel;
    qryDestinoCLI_CODIGO: TIBStringField;
    qryDestinoCLI_PESSOA: TIBStringField;
    qryDestinoCLI_ESTADO: TIBStringField;
    qryDestinoCLI_CEP: TIBStringField;
    qryDestinoCLI_CPF: TIBStringField;
    qryDestinoCLI_CGC: TIBStringField;
    qryDestinoCLI_CGF: TIBStringField;
    qryDestinoCLI_AGENCIA: TIBStringField;
    qryDestinoCLI_FAX: TIBStringField;
    qryDestinoCLI_FATCEP: TIBStringField;
    qryDestinoCLI_FATESTADO: TIBStringField;
    qryDestinoCLI_FATCGC: TIBStringField;
    qryDestinoCLI_FATCGF: TIBStringField;
    qryDestinoCLI_CREDITO: TIBStringField;
    qryDestinoCLI_COBCEP: TIBStringField;
    qryDestinoCLI_COBESTADO: TIBStringField;
    qryDestinoCLI_COBCGC: TIBStringField;
    qryDestinoCLI_COBCGF: TIBStringField;
    qryDestinoCLI_FATCPF: TIBStringField;
    qryDestinoCLI_COBCPF: TIBStringField;
    qryDestinoCLI_VENAGE: TIBStringField;
    qryDestinoCLI_CARAC: TFloatField;
    qryDestinoCLI_ANTI_PENULTIMA: TDateTimeField;
    qryDestinoCLI_PENULTIMA: TDateTimeField;
    qryDestinoCLI_ULTIMA: TDateTimeField;
    qryDestinoCLI_RESULT_ULTIMA: TIBStringField;
    qryDestinoCLI_RESULT_PENULTIMA: TIBStringField;
    qryDestinoCLI_RESULT_ANTIPENUL: TIBStringField;
    qryDestinoCLI_DT_RETORNO: TDateTimeField;
    qryDestinoCLI_VENDEDOR: TIBStringField;
    qryDestinoCLI_ATIVIDADE: TIBStringField;
    qryDestinoCLI_OBS: TMemoField;
    qryDestinoCLI_FONE: TIBStringField;
    qryDestinoCLI_NOME: TIBStringField;
    qryDestinoCLI_ENDERECO: TIBStringField;
    qryDestinoCLI_FATENDERECO: TIBStringField;
    qryDestinoCLI_CIDADE: TIBStringField;
    qryDestinoCLI_BAIRRO: TIBStringField;
    qryDestinoCLI_FATBAIRRO: TIBStringField;
    qryDestinoCLI_FATCIDADE: TIBStringField;
    qryDestinoCLI_COBENDERECO: TIBStringField;
    qryDestinoCLI_COBBAIRRO: TIBStringField;
    qryDestinoCLI_COBCIDADE: TIBStringField;
    qryDestinoCLI_WEB: TIBStringField;
    qryDestinoCLI_EMAIL: TIBStringField;
    qryDestinoCLI_FANTASIA: TIBStringField;
    qryDestinoCLI_FONE2: TIBStringField;
    qryDestinoCLI_INSC_MUNICIPAL: TIBStringField;
    qryDestinoCLI_COBINSC_MUNICIPAL: TIBStringField;
    qryDestinoCLI_FATINSC_MUNICIPAL: TIBStringField;
    qryDestinoCLI_CREDIO_MOTIVO: TIBStringField;
    qryDestinoCLI_ISS_RETIDO: TIBStringField;
    qryDestinoCLI_COD_FORTTS: TIBStringField;
    qryDestinoCLI_CONTA_FORTTS: TIBStringField;
    qryDestinoCLI_ORG_PUBL_FEDERAL: TIBStringField;
    qryDestinoCLI_ISENTO_ICMS: TIBStringField;
    qryDestinoCLI_LIMITE_CREDITO: TFloatField;
    qryDestinoCLI_ATUALIZA: TIBStringField;
    qryDestinoCLI_CODIGO_BANCO: TIBStringField;
    qryDestinoCLI_AREA_COMPENSACAO: TIBStringField;
    qryDestinoCLI_AGENCIA_BANCO: TIBStringField;
    qryDestinoCLI_CONTA: TIBStringField;
    qryDestinoCLI_DIGI_VERIFICA: TIBStringField;
    qryDestinoCLI_CONTROLE_INTERNO: TIBStringField;
    qryDestinoCLI_LIMITE: TFloatField;
    qryDestinoCLI_PRAZO: TIntegerField;
    qryDestinoCLI_SENHA: TIBStringField;
    qryDestinoCLI_NIVEL_DESCONTO: TIntegerField;
    qryDestinoCLI_BANCO: TIBStringField;
    qryDestinoCLI_AGE_BANCO: TIBStringField;
    qryDestinoCLI_CONTA_COR: TIBStringField;
    qryDestinoCLI_REF_COMERCIAL: TIBStringField;
    qryDestinoCLI_BANCO1: TIBStringField;
    qryDestinoCLI_AGE_BANCO1: TIBStringField;
    qryDestinoCLI_CONTA_COR1: TIBStringField;
    qryDestinoCLI_REF_COMERCIAL1: TIBStringField;
    qryDestinoCLI_PAG_PROGRAMADO: TIBStringField;
    qryDestinoCLI_CADASTRO: TIBStringField;
    qryDestinoCLI_LIMITE_PERMUTA: TFloatField;
    qryDestinoCLI_FORNECEDOR: TIBStringField;
    qryDestinoCLI_DT_VENDEDOR: TDateTimeField;
    qryDestinoCLI_TRANSPORTADORA: TIBStringField;
    qryDestinoCLI_DESC_M2: TFloatField;
    qryDestinoCLI_FRETE: TIBStringField;
    qryDestinoCLI_CORTESIA_ACABAMENTO: TIBStringField;
    qryDestinoCLI_DESCONTO_ACABAMENTO: TFloatField;
    qryDestinoCLI_PAG1: TFloatField;
    qryDestinoCLI_PAG2: TFloatField;
    qryDestinoCLI_PAG3: TFloatField;
    qryDestinoCLI_PAG4: TFloatField;
    qryDestinoCLI_PAG5: TFloatField;
    qryDestinoCLI_PAG6: TFloatField;
    qryDestinoCLI_PAG7: TFloatField;
    qryDestinoCLI_PAG8: TFloatField;
    qryDestinoCLI_PAG9: TFloatField;
    qryDestinoCLI_FORMA_PGTO: TIntegerField;
    qryDestinoCLI_MARGEM_LUCRO: TFloatField;
    qryDestinoCLI_ATIVO: TIBStringField;
    qryDestinoCLI_USA_PROMOCAO: TIBStringField;
    qryDestinoCLI_DT_CADASTRO: TDateTimeField;
    qryDestinoCLI_DT_RECADASTRO: TDateTimeField;
    qryDestinoCLI_QT_AVISOS_RECADASTROS: TIntegerField;
    qryDestinoCLI_NOME_MAE: TIBStringField;
    qryDestinoCLI_RG_MAE: TIBStringField;
    qryDestinoCLI_PONTO_REFERENCIA: TIBStringField;
    qryDestinoCLI_USA_TABELA: TIBStringField;
    qryDestinoCLI_INFO_OS: TIBStringField;
    qryContas_Receber: TIBQuery;
    updContas_Receber: TIBUpdateSQL;
    qryContas_ReceberCTR_SEQUENCIA: TIBStringField;
    qryContas_ReceberCTR_DUPLICATA: TIBStringField;
    qryContas_ReceberCTR_CENTRO_CUSTO: TIBStringField;
    qryContas_ReceberCTR_CSETOR: TIBStringField;
    qryContas_ReceberCTR_SETOR: TIBStringField;
    qryContas_ReceberCTR_CONT_TIT: TIBStringField;
    qryContas_ReceberCTR_SUBCONTA: TIBStringField;
    qryContas_ReceberCTR_CONT_SINT: TIBStringField;
    qryContas_ReceberCTR_CONTA: TIBStringField;
    qryContas_ReceberCTR_DETALHE: TIBStringField;
    qryContas_ReceberCTR_EMISSAO: TDateTimeField;
    qryContas_ReceberCTR_VENCIMENTO: TDateTimeField;
    qryContas_ReceberCTR_VR_DEBITO: TFloatField;
    qryContas_ReceberCTR_CLIENTE: TIBStringField;
    qryContas_ReceberCTR_APRESENTA: TIBStringField;
    qryContas_ReceberCTR_BANCO: TIBStringField;
    qryContas_ReceberCTR_DT_BANCO: TDateTimeField;
    qryContas_ReceberCTR_DT_RETORNO_BANC: TDateTimeField;
    qryContas_ReceberCTR_DOC_BANCO: TIBStringField;
    qryContas_ReceberCTR_AGENTE: TIBStringField;
    qryContas_ReceberCTR_DT_COBRANCA: TDateTimeField;
    qryContas_ReceberCTR_DT_RETORNO_COBR: TDateTimeField;
    qryContas_ReceberCTR_DOC_COBR: TIBStringField;
    qryContas_ReceberCTR_CARTORIO: TIBStringField;
    qryContas_ReceberCTR_DT_CARTORIO: TDateTimeField;
    qryContas_ReceberCTR_DT_RETORNO_CART: TDateTimeField;
    qryContas_ReceberCTR_DOC_CART: TIBStringField;
    qryContas_ReceberCTR_SITUACAO: TIBStringField;
    qryContas_ReceberCTR_ORIGEM: TIBStringField;
    qryContas_ReceberCTR_TOTAL_CREDITO: TFloatField;
    qryContas_ReceberCTR_HISTORICO: TIBStringField;
    qryContas_ReceberCTR_NUM_DOCUMENTO: TIBStringField;
    qryContas_ReceberCTR_TIPONF: TIBStringField;
    qryContas_ReceberCTR_NOTAFISCAL: TIBStringField;
    qryContas_ReceberCTR_BORDERO: TIntegerField;
    qryContas_ReceberCTR_COBDESC_TIPO: TIBStringField;
    qryContas_ReceberCTR_COBDESC_CHEQUE: TIBStringField;
    qryContas_ReceberCTR_COBDESC_BANCO: TIBStringField;
    qryContas_ReceberCTR_COBDESC_AGENCIA: TIBStringField;
    qryContas_ReceberCTR_FLG: TIBStringField;
    qryContas_ReceberCTR_OCULT_1: TIBStringField;
    qryContas_ReceberCTR_TIPO_LANC: TIBStringField;
    qryContas_ReceberCTR_VR_DESCONTO: TFloatField;
    qryContas_ReceberCTR_TIPO_CREDITO: TIBStringField;
    qryContas_ReceberCTR_DEBITO: TIBStringField;
    qryContas_ReceberCTR_DTREMESSA: TDateTimeField;
    qryContas_ReceberCTR_PDV_DOCUMENTO: TIBStringField;
    qryContas_ReceberCTR_ADMIN_CARTAO: TIntegerField;
    qryContas_ReceberCTR_LOTE_CARTAO: TIntegerField;
    qryContas_ReceberCTR_ORCAMENTO: TIBStringField;
    qryContas_ReceberCTR_PDV_ADIANT: TIBStringField;
    qryContas_ReceberCTR_MES_ANO_REF: TIBStringField;
    qryContas_ReceberCTR_RECIBO_PROVISORIO: TIBStringField;
    qryContas_ReceberCTR_PEDIDO: TIBStringField;
    qryContas_ReceberCTR_DT_BOLETO: TDateTimeField;
    qryContas_ReceberCTR_DT_RECIBO_PROV: TDateTimeField;
    qryContas_ReceberCTR_NUM_CONTRATO: TIntegerField;
    qryContas_ReceberCTR_TIPO_CONTRATO: TIntegerField;
    qryContas_ReceberCTR_ADITIVO_CONTRATO: TIntegerField;
    qryContas_ReceberCTR_SEQ_PILATIS: TIntegerField;
    qryContas_ReceberCTR_COD_CHEQUE_PILATIS: TIBStringField;
    qryContas_ReceberCTR_NUMERO_OS: TIBStringField;
    qryContas_ReceberCTR_OS_SEQ: TIBStringField;
    qryContas_ReceberCTR_CAIXA: TIBStringField;
    qryBaixa_Receber: TIBQuery;
    updBaixa_Receber: TIBUpdateSQL;
    qryBaixa_ReceberCTR_SEQUENCIA: TIBStringField;
    qryBaixa_ReceberBXR_DT_CREDITO: TDateTimeField;
    qryBaixa_ReceberBXR_DUPLICATA: TIBStringField;
    qryBaixa_ReceberBXR_CREDITO: TFloatField;
    qryBaixa_ReceberBXR_JUROS: TFloatField;
    qryBaixa_ReceberBXR_DESCONTO: TFloatField;
    qryBaixa_ReceberBXR_OBSERVA: TIBStringField;
    qryBaixa_ReceberBXR_NUM_RECIBO: TIBStringField;
    qryBaixa_ReceberBXR_CAIXA: TIBStringField;
    qryBaixa_ReceberBXR_NUM_CHEQUE: TIBStringField;
    qryBaixa_ReceberBXR_COD_BANCO: TIBStringField;
    qryBaixa_ReceberBXR_BANCO: TIBStringField;
    qryBaixa_ReceberBXR_CONTA_BANCO: TIBStringField;
    qryBaixa_ReceberBXR_ORIGEM_RECURSO: TIBStringField;
    qryBaixa_ReceberBXR_HISTORICO: TIBStringField;
    qryBaixa_ReceberBXR_SEQUENCIA: TIntegerField;
    qryBaixa_ReceberBXR_DT_MOVIMENTO: TDateTimeField;
    qryBaixa_ReceberBXR_EMITENTE: TIBStringField;
    qryBaixa_ReceberBXR_LOGIN_RECEBEU: TIBStringField;
    qryBaixa_ReceberBXR_PROTOCOLADO_EM: TDateTimeField;
    qryBaixa_ReceberBXR_PROTOCOLO_CAIXA: TIBStringField;
    qryBaixa_ReceberBXR_PESSOA_CH: TIBStringField;
    qryBaixa_ReceberBXR_CNPJ_CPF_CH: TIBStringField;
    qryBaixa_ReceberBXR_BCO_CH: TIBStringField;
    qryBaixa_ReceberBXR_AGENCIA_CH: TIBStringField;
    qryBaixa_ReceberBXR_CONTA_CH: TIBStringField;
    qryBaixa_ReceberBXR_USUARIO_INCLUSAO: TIBStringField;
    qryBaixa_ReceberBXR_DT_INCLUSAO: TDateTimeField;
    qryBaixa_ReceberBXR_USUARIO_ALTERACAO: TIBStringField;
    qryBaixa_ReceberBXR_DT_ALTERACAO: TDateTimeField;
    qryFornecedor: TIBQuery;
    updFornecedor: TIBUpdateSQL;
    qryContas_Pagar: TIBQuery;
    updContas_Pagar: TIBUpdateSQL;
    qryBaixa_Pagar: TIBQuery;
    updBaixa_Pagar: TIBUpdateSQL;
    qryFornecedorFRN_CODIGO: TIBStringField;
    qryFornecedorFRN_NOME: TIBStringField;
    qryFornecedorFRN_PESSOAL: TIBStringField;
    qryFornecedorFRN_ENDERECO: TIBStringField;
    qryFornecedorFRN_BAIRRO: TIBStringField;
    qryFornecedorFRN_CIDADE: TIBStringField;
    qryFornecedorFRN_CEP: TIBStringField;
    qryFornecedorFRN_ESTADO: TIBStringField;
    qryFornecedorFRN_CGC: TIBStringField;
    qryFornecedorFRN_CGF: TIBStringField;
    qryFornecedorFRN_CPF: TIBStringField;
    qryFornecedorFRN_FONE: TIBStringField;
    qryFornecedorFRN_FAX: TIBStringField;
    qryFornecedorFRN_EMAIL: TIBStringField;
    qryFornecedorFRN_OBSERVACAO: TIBStringField;
    qryFornecedorFRN_WEB: TIBStringField;
    qryFornecedorFRN_DT_CADASTRO: TDateTimeField;
    qryFornecedorFRN_CONTATO1: TIBStringField;
    qryFornecedorFRN_CONTATO2: TIBStringField;
    qryFornecedorFRN_CONTATO3: TIBStringField;
    qryFornecedorFRN_CARGO1: TIBStringField;
    qryFornecedorFRN_CARGO2: TIBStringField;
    qryFornecedorFRN_CARGO3: TIBStringField;
    qryFornecedorFRN_CELULAR1: TIBStringField;
    qryFornecedorFRN_CELULAR2: TIBStringField;
    qryFornecedorFRN_CELULAR3: TIBStringField;
    qryFornecedorFRN_NASC1: TDateTimeField;
    qryFornecedorFRN_NASC2: TDateTimeField;
    qryFornecedorFRN_NASC3: TDateTimeField;
    qryFornecedorFRN_FONE1: TIBStringField;
    qryFornecedorFRN_FONE2: TIBStringField;
    qryFornecedorFRN_FONE3: TIBStringField;
    qryFornecedorFRN_RAMAL1: TIBStringField;
    qryFornecedorFRN_RAMAL2: TIBStringField;
    qryFornecedorFRN_RAMAL3: TIBStringField;
    qryFornecedorFRN_ATIVIDADE: TIBStringField;
    qryFornecedorFRN_NASC1_DIA_MES: TIBStringField;
    qryFornecedorFRN_NASC2_DIA_MES: TIBStringField;
    qryFornecedorFRN_NASC3_DIA_MES: TIBStringField;
    qryFornecedorFRN_PREFIXO_BOBINA: TIBStringField;
    qryFornecedorFRN_COD_FORTTS: TIBStringField;
    qryFornecedorFRN_CONTA_FORTTS: TIBStringField;
    qryFornecedorFTR_FONEX: TIBStringField;
    qryFornecedorFRN_ISS: TFloatField;
    qryFornecedorFRN_IRRF: TFloatField;
    qryFornecedorFRN_INSS: TFloatField;
    qryFornecedorFRN_NUM_INSS: TFloatField;
    qryFornecedorFRN_IDENTIDADE: TIBStringField;
    qryFornecedorFRN_ORGAO_EMISSOR: TIBStringField;
    qryFornecedorFRN_CODIGO_BANCO: TIBStringField;
    qryFornecedorFRN_AREA_COMPENSACAO: TIBStringField;
    qryFornecedorFRN_AGENCIA: TIBStringField;
    qryFornecedorFRN_CONTA: TIBStringField;
    qryFornecedorFRN_DIGI_VERIFICA: TIBStringField;
    qryFornecedorFRN_TIPO: TIntegerField;
    qryFornecedorFRN_VALOR_COMISSAO: TFloatField;
    qryFornecedorFRN_TIPO_COMISSAO: TIBStringField;
    qryContas_PagarCTP_SEQUENCIA: TIBStringField;
    qryContas_PagarCTP_DOCUMENTO: TIBStringField;
    qryContas_PagarCTP_HISTORICO: TIBStringField;
    qryContas_PagarCTP_COD_FAVORECIDO: TIBStringField;
    qryContas_PagarCTP_NOM_FAVORECIDO: TIBStringField;
    qryContas_PagarCTP_ESPECIE: TIBStringField;
    qryContas_PagarCTP_EMISSAO: TDateTimeField;
    qryContas_PagarCTP_VENCIMENTO: TDateTimeField;
    qryContas_PagarCTP_VALOR: TFloatField;
    qryContas_PagarCTP_VRPAGO: TFloatField;
    qryContas_PagarCTP_REF_MESANO: TIBStringField;
    qryContas_PagarCTP_CONTBANCO: TIBStringField;
    qryContas_PagarCTP_CT_TIT: TIBStringField;
    qryContas_PagarCTP_SUBCONTA: TIBStringField;
    qryContas_PagarCTP_CT_SINTETICA: TIBStringField;
    qryContas_PagarCTP_CT_ANALITICA: TIBStringField;
    qryContas_PagarCTP_CT_DETALHE: TIBStringField;
    qryContas_PagarCTP_CCUSTO: TIBStringField;
    qryContas_PagarCTP_CSETOR: TIBStringField;
    qryContas_PagarCTP_SETOR: TIBStringField;
    qryContas_PagarCTP_STATUS: TIBStringField;
    qryContas_PagarCTP_NUM_TITULO_BANCO: TIBStringField;
    qryContas_PagarCTP_PREVISAO_PAGAMENTO: TDateTimeField;
    qryContas_PagarCTP_FLG: TIBStringField;
    qryContas_PagarCTP_PEDIDO: TIBStringField;
    qryContas_PagarCTP_OCULT_1: TIBStringField;
    qryContas_PagarCTP_DEBITO: TIBStringField;
    qryContas_PagarCTP_DTREMESSA: TDateTimeField;
    qryContas_PagarCTP_BANCO: TIBStringField;
    qryContas_PagarCTP_DT_RETORNO_BANC: TDateTimeField;
    qryContas_PagarCTP_COD_BARRAS: TIBStringField;
    qryContas_PagarCTP_QTD_SACOS: TFloatField;
    qryContas_PagarCTP_VALOR_DESCONTO: TFloatField;
    qryContas_PagarCTP_VALOR_UNITARIO: TFloatField;
    qryContas_PagarCTP_HISTORICO2: TIBStringField;
    qryContas_PagarCTP_NOTAFISCAL: TIBStringField;
    qryContas_PagarCTP_SEQ_PILATIS: TIntegerField;
    qryContas_PagarCTP_OS_TERCEIROS: TIntegerField;
    qryBaixa_PagarBXP_SEQUENCIA: TIBStringField;
    qryBaixa_PagarBXP_DT_PAGO: TDateTimeField;
    qryBaixa_PagarBXP_DOCUMENTO: TIBStringField;
    qryBaixa_PagarBXP_VR_PAGO: TFloatField;
    qryBaixa_PagarBXP_BANCO: TIBStringField;
    qryBaixa_PagarBXP_CHEQUE: TIBStringField;
    qryBaixa_PagarBXP_ORIGEM_RECURSO: TIBStringField;
    qryBaixa_PagarBXP_CAIXA: TIBStringField;
    qryBaixa_PagarBXP_CONTA_BANCO: TIBStringField;
    qryBaixa_PagarBXP_DATA_PREVISAO_CHEQUE: TDateTimeField;
    qryBaixa_PagarBXP_HISTORICO: TIBStringField;
    qryBaixa_PagarBXP_COMPENSADO: TIBStringField;
    qryBaixa_PagarBXP_OBSERVA: TIBStringField;
    qryBaixa_PagarBXP_DESPACHANTE: TIBStringField;
    qryBaixa_PagarBXP_CH_PRED_SN: TIBStringField;
    qryBaixa_PagarBXP_VR_JURO: TFloatField;
    qryBaixa_PagarBXP_VR_DESCONTO: TFloatField;
    qryBaixa_PagarBXP_NOMINAL: TIBStringField;
    qryBaixa_PagarBXP_HR_PAGO: TIBStringField;
    qryBaixa_PagarBXP_DT_MOVIMENTO: TDateTimeField;
    qryBaixa_PagarBXP_USUARIO_INCLUSAO: TIBStringField;
    qryBaixa_PagarBXP_DT_INCLUSAO: TDateTimeField;
    qryBaixa_PagarBXP_USUARIO_ALTERACAO: TIBStringField;
    qryBaixa_PagarBXP_DT_ALTERACAO: TDateTimeField;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function Retira_Caracteres(vString, vCarac: String): String;
    function Retorna_Fone_ok(vString: String): String;
  public
    { Public declarations }
  end;

var
  frmMigrarDads: TfrmMigrarDads;

implementation

uses unFuncoes, unDataModule2;

{$R *.dfm}

procedure TfrmMigrarDads.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMigrarDads.BitBtn1Click(Sender: TObject);
var vSeq, vQt: Integer;
    vHist: String;
begin
  cancelar.checked := false;
  vSeq := 0;
  vQt := 0;
  IBTransaction1.Active := False;
  DataBase1.Connected := False;
  if Banco_de_dados.Text <> '' then
    DataBase1.DataBaseName := Banco_de_dados.Text;
  if edSenha.Text <> '' then
    DataBase1.Params[1] := 'password='+edSenha.Text;
  try
    DataBase1.Connected := True;
    IBTransaction1.Active := True;
  except
    mensagem('Problema na conexão com o banco de dados origem!');
    exit;
  end;
  //
  // Clientes
  if chCliente.Checked then
  begin
    // Tabela origem
    with qryOrigem, qryOrigem.SQL do
    begin
      Close;
      Clear;
      Add('SELECT * FROM CLIENTE');
      Open;
    end;
    // Tabela destino
    with qryDestino, qryDestino.SQL do
    begin
      Close;
      Clear;
      Add('DELETE FROM CONTAS_RECEBER');
      ExecSQL;
      //
      Close;
      Clear;
      Add('DELETE FROM CLIENTE');
      ExecSQL;
      Close;
      Clear;
      Add('SELECT * FROM CLIENTE');
      Open;
    end;
    while not qryOrigem.eof do
    begin
      if cancelar.checked then
      begin
        Application.MessageBox(PChar('Operação cancelada!'), PChar(Application.Title), 0);
        break;
        exit;
      end;
      qryDestino.Append;
      qryDestino.FieldByName('CLI_CODIGO').AsString := ZerosEsq(qryOrigem.FieldByName('CLIENTE').AsString, 6);
      qryDestino.FieldByName('CLI_NOME').AsString := qryOrigem.FieldByName('DESCRICAO').AsString;
      qryDestino.FieldByName('CLI_FANTASIA').AsString := qryOrigem.FieldByName('APELIDO_FANTASIA').AsString;
      qryDestino.FieldByName('CLI_CGF').AsString := qryOrigem.FieldByName('CGF').AsString;
      qryDestino.FieldByName('CLI_COBCGF').AsString := qryOrigem.FieldByName('CGF').AsString;
      qryDestino.FieldByName('CLI_FATCGF').AsString := qryOrigem.FieldByName('CGF').AsString;

      qryDestino.FieldByName('CLI_INSC_MUNICIPAL').AsString := qryOrigem.FieldByName('INSCRICAOMUNICIPAL').AsString;
      qryDestino.FieldByName('CLI_COBINSC_MUNICIPAL').AsString := qryOrigem.FieldByName('INSCRICAOMUNICIPAL').AsString;
      qryDestino.FieldByName('CLI_FATINSC_MUNICIPAL').AsString := qryOrigem.FieldByName('INSCRICAOMUNICIPAL').AsString;

      if Length(Trim(qryOrigem.FieldByName('CPF').AsString)) = 12 then
      begin
        qryDestino.FieldByName('CLI_CPF').AsString := Retira_Caracteres(qryOrigem.FieldByName('CPF').AsString, '-./');
        qryDestino.FieldByName('CLI_COBCPF').AsString := Retira_Caracteres(qryOrigem.FieldByName('CPF').AsString, '-./');
        qryDestino.FieldByName('CLI_FATCPF').AsString := Retira_Caracteres(qryOrigem.FieldByName('CPF').AsString, '-./');
      end
      else
      begin
        if Length(qryOrigem.FieldByName('CGC').AsString) = 18 then
        begin
          qryDestino.FieldByName('CLI_CGC').AsString := Retira_Caracteres(qryOrigem.FieldByName('CGC').AsString, '/.-');
          qryDestino.FieldByName('CLI_COBCGC').AsString := Retira_Caracteres(qryOrigem.FieldByName('CGC').AsString, '/.-');
          qryDestino.FieldByName('CLI_FATCGC').AsString := Retira_Caracteres(qryOrigem.FieldByName('CGC').AsString, '/.-');
        end;
      end;
      qryDestino.FieldByName('CLI_PESSOA').AsString := qryOrigem.FieldByName('TIPODEPESSOA').AsString;
      if Trim(qryDestino.FieldByName('CLI_PESSOA').AsString) = '' then
        qryDestino.FieldByName('CLI_PESSOA').AsString := 'J';
      qryDestino.FieldByName('CLI_LIMITE_CREDITO').AsFloat := qryOrigem.FieldByName('LIMITEDECREDITO').AsFloat;
      qryDestino.FieldByName('CLI_CREDITO').AsString := 'L';
      if Trim(qryOrigem.FieldByName('CONTATO').AsString) <> '' then
        qryDestino.FieldByName('CLI_OBS').AsString := 'Contato: '+qryOrigem.FieldByName('CONTATO').AsString;
      if Trim(qryOrigem.FieldByName('OBSERVACAO').AsString) <> '' then
        qryDestino.FieldByName('CLI_OBS').AsString := qryDestino.FieldByName('CLI_OBS').AsString + qryOrigem.FieldByName('OBSERVACAO').AsString;
      if Trim(qryOrigem.FieldByName('ENDERECO').AsString) <> '' then
      begin
        qryDestino.FieldByName('CLI_ENDERECO').AsString := qryOrigem.FieldByName('ENDERECO').AsString;
        qryDestino.FieldByName('CLI_COBENDERECO').AsString := qryOrigem.FieldByName('ENDERECO').AsString;
        qryDestino.FieldByName('CLI_FATENDERECO').AsString := qryOrigem.FieldByName('ENDERECO').AsString;
      end
      else
      begin
        qryDestino.FieldByName('CLI_ENDERECO').AsString := '.';
        qryDestino.FieldByName('CLI_COBENDERECO').AsString := '.';
        qryDestino.FieldByName('CLI_FATENDERECO').AsString := '.';
      end;
      if Trim(qryOrigem.FieldByName('BAIRRO').AsString) <> '' then
      begin
        qryDestino.FieldByName('CLI_BAIRRO').AsString  := qryOrigem.FieldByName('BAIRRO').AsString;
        qryDestino.FieldByName('CLI_COBBAIRRO').AsString  := qryOrigem.FieldByName('BAIRRO').AsString;
        qryDestino.FieldByName('CLI_FATBAIRRO').AsString  := qryOrigem.FieldByName('BAIRRO').AsString;
      end;
      if Trim(qryOrigem.FieldByName('CIDADE').AsString) <> '' then
      begin
        qryDestino.FieldByName('CLI_CIDADE').AsString  := qryOrigem.FieldByName('CIDADE').AsString;
        qryDestino.FieldByName('CLI_COBCIDADE').AsString  := qryOrigem.FieldByName('CIDADE').AsString;
        qryDestino.FieldByName('CLI_FATCIDADE').AsString  := qryOrigem.FieldByName('CIDADE').AsString;
      end;
      if Trim(qryOrigem.FieldByName('ESTADO').AsString) <> '' then
      begin
        qryDestino.FieldByName('CLI_ESTADO').AsString  := qryOrigem.FieldByName('ESTADO').AsString;
        qryDestino.FieldByName('CLI_COBESTADO').AsString  := qryOrigem.FieldByName('ESTADO').AsString;
        qryDestino.FieldByName('CLI_FATESTADO').AsString  := qryOrigem.FieldByName('ESTADO').AsString;
      end;
      qryDestino.FieldByName('CLI_CEP').AsString  := Retira_Caracteres(qryOrigem.FieldByName('CEP').AsString, '-.');
      qryDestino.FieldByName('CLI_COBCEP').AsString  := Retira_Caracteres(qryOrigem.FieldByName('CEP').AsString, '-.');
      qryDestino.FieldByName('CLI_FATCEP').AsString  := Retira_Caracteres(qryOrigem.FieldByName('CEP').AsString, '-.');

      qryDestino.FieldByName('CLI_ISS_RETIDO').AsString  := 'N';
      qryDestino.FieldByName('CLI_ORG_PUBL_FEDERAL').AsString  := 'N';
      qryDestino.FieldByName('CLI_ISENTO_ICMS').AsString  := 'N';
      qryDestino.FieldByName('CLI_PAG_PROGRAMADO').AsString  := 'N';
      qryDestino.FieldByName('CLI_ATUALIZA').AsString  := 'S';
      qryDestino.FieldByName('CLI_CADASTRO').AsString  := '1';
      qryDestino.FieldByName('CLI_ATIVO').AsString  := 'S';
      qryDestino.FieldByName('CLI_FORMA_PGTO').AsString  := '8';
      if Trim(qryOrigem.FieldByName('COMERCIAL').AsString) <> '(     )     -' then
        qryDestino.FieldByName('CLI_FONE').AsString  := Retorna_Fone_ok(qryOrigem.FieldByName('COMERCIAL').AsString);
      if Trim(qryOrigem.FieldByName('RESIDENCIAL').AsString) <> '(     )     -' then
        qryDestino.FieldByName('CLI_FONE2').AsString  := Retorna_Fone_ok(qryOrigem.FieldByName('RESIDENCIAL').AsString);
      if Trim(qryOrigem.FieldByName('FAX').AsString) <> '(     )     -' then
        qryDestino.FieldByName('CLI_FAX').AsString  := Retorna_Fone_ok(qryOrigem.FieldByName('FAX').AsString);
      if (Trim(qryOrigem.FieldByName('CELULAR').AsString) <> '(     )     -') then
      begin
        if (Trim(qryOrigem.FieldByName('COMERCIAL').AsString) = '(     )     -') then
          qryDestino.FieldByName('CLI_FONE').AsString  := Retorna_Fone_ok(qryOrigem.FieldByName('CELULAR').AsString)
        else if (Trim(qryOrigem.FieldByName('RESIDENCIAL').AsString) = '(     )     -') then
          qryDestino.FieldByName('CLI_FONE2').AsString  := Retorna_Fone_ok(qryOrigem.FieldByName('CELULAR').AsString);
      end;
      qryDestino.FieldByName('CLI_EMAIL').AsString  := qryOrigem.FieldByName('EMAIL').AsString;
      qryDestino.FieldByName('CLI_WEB').AsString  := qryOrigem.FieldByName('URL').AsString;
      //
      qryDestino.Post;
      qryOrigem.Next;
      vQt := vQt + 1;
      Label5.Caption := 'Cliente ('+IntToStr(vQt)+')...';
      Application.ProcessMessages;
    end;
    IBTransaction1.CommitRetaining;
    qryOrigem.Close;
    qryDestino.Close;
    Application.MessageBox(PChar('Clientes concluídos!'), PChar(Application.Title), 0);
  end;
  //
  // Contas a Receber
  vQt := 0;
  if chContasReceber.Checked then
  begin
    // Tabela origem
    with qryOrigem, qryOrigem.SQL do
    begin
      Close;
      Clear;
      Add('SELECT * FROM CONTASARECEBER R, PARCELASARECEBER P');
      Add(' WHERE R.EMPRESA = P.EMPRESA');
      Add(' AND R.DOCUMENTO = P.DOCUMENTO');
      Add(' ORDER BY EMPRESA, DOCUMENTO, PARCELA');
      Open;
    end;
    // Tabela destino
    with qryContas_Receber, qryContas_Receber.SQL do
    begin
      Close;
      Clear;
      Add('DELETE FROM CONTAS_RECEBER');
      ExecSQL;
      //
      Close;
      Clear;
      Add('SELECT * FROM CONTAS_RECEBER');
      Open;
    end;
    with qryBaixa_Receber, qryBaixa_Receber.SQL do
    begin
      Close;
      Clear;
      Add('DELETE FROM BAIXA_RECEB');
      ExecSQL;
      //
      Close;
      Clear;
      Add('SELECT * FROM BAIXA_RECEB');
      Open;
    end;
    qryOrigem.First;
    while not qryOrigem.eof do
    begin
      if cancelar.checked then
      begin
        Application.MessageBox(PChar('Operação cancelada!'), PChar(Application.Title), 0);
        break;
        exit;
      end;
      qryContas_Receber.Append;
      qryContas_Receber.FieldByName('CTR_SEQUENCIA').AsString   := StrZero(StrToInt(IntToStr(qryOrigem.FieldByName('DOCUMENTO').AsInteger) + IntToStr(qryOrigem.FieldByName('PARCELA').AsInteger)), 6);
      qryContas_Receber.FieldByName('CTR_DUPLICATA').AsString   := Copy(qryOrigem.FieldByName('NUMERODODOCUMENTO').AsString, 1, 12);
      vHist := qryOrigem.FieldByName('OBSERVACAO').AsString;
      if Trim(Copy(qryOrigem.FieldByName('OBSERVACAO').AsString, 1, 60)) <> '' then
        qryContas_Receber.FieldByName('CTR_HISTORICO').AsString   := Copy(qryOrigem.FieldByName('OBSERVACAO').AsString, 1, 60)
      else
        qryContas_Receber.FieldByName('CTR_HISTORICO').AsString := vHist;
      qryContas_Receber.FieldByName('CTR_CLIENTE').AsString   := ZerosEsq(qryOrigem.FieldByName('CLIENTE').AsString, 6);
      qryContas_Receber.FieldByName('CTR_ORIGEM').AsString   := '3';
      if Trim(qryOrigem.FieldByName('CONTACORRENTE').AsString) <> '' then
        qryContas_Receber.FieldByName('CTR_SITUACAO').AsString   := '2'
      else
        qryContas_Receber.FieldByName('CTR_SITUACAO').AsString   := '1';
      qryContas_Receber.FieldByName('CTR_APRESENTA').AsString   := 'N';
      qryContas_Receber.FieldByName('CTR_EMISSAO').AsDateTime   := qryOrigem.FieldByName('DATADEEMISSAO').AsDateTime;
      qryContas_Receber.FieldByName('CTR_VENCIMENTO').AsDateTime   := qryOrigem.FieldByName('DATADOVENCIMENTO').AsDateTime;
      qryContas_Receber.FieldByName('CTR_VR_DEBITO').AsFloat   := qryOrigem.FieldByName('VALORDAPARCELA').AsFloat;
      qryContas_Receber.FieldByName('CTR_TOTAL_CREDITO').AsFloat   := qryOrigem.FieldByName('VALORRECEBIDO').AsFloat;
      qryContas_Receber.FieldByName('CTR_MES_ANO_REF').AsString   := Copy(qryOrigem.FieldByName('DATADEEMISSAO').AsString, 4, 2)+Copy(qryOrigem.FieldByName('DATADEEMISSAO').AsString, 7, 4);
      qryContas_Receber.FieldByName('CTR_FLG').AsString   := '0';
      qryContas_Receber.FieldByName('CTR_TIPO_LANC').AsString   := 'R';
      qryContas_Receber.FieldByName('CTR_NUM_DOCUMENTO').AsString   := Copy(qryOrigem.FieldByName('NUMERODODOCUMENTO').AsString, 1, 12);
      qryContas_Receber.FieldByName('CTR_CENTRO_CUSTO').AsString   := Copy(qryOrigem.FieldByName('EMPRESA').AsString, 1,2);
      qryContas_Receber.FieldByName('CTR_CSETOR').AsString   := '01';
      qryContas_Receber.FieldByName('CTR_SETOR').AsString   := '01';
      qryContas_Receber.FieldByName('CTR_DEBITO').AsString   := 'N';
      qryContas_Receber.FieldByName('CTR_TIPO_CREDITO').AsString   := '1';
      qryContas_Receber.Post;
      if qryOrigem.FieldByName('VALORRECEBIDO').AsFloat > 0 then
      begin
        //
        // Baixa Receber
        qryBaixa_Receber.Append;
        qryBaixa_Receber.FieldByName('CTR_SEQUENCIA').AsString  := StrZero(StrToInt(IntToStr(qryOrigem.FieldByName('DOCUMENTO').AsInteger) + IntToStr(qryOrigem.FieldByName('PARCELA').AsInteger)), 6);
        if not qryOrigem.FieldByName('DATADORECEBIMENTO').IsNull then
        begin
          qryBaixa_Receber.FieldByName('BXR_DT_CREDITO').AsDateTime   := qryOrigem.FieldByName('DATADORECEBIMENTO').AsDateTime;
          qryBaixa_Receber.FieldByName('BXR_DT_MOVIMENTO').AsDateTime   := qryOrigem.FieldByName('DATADORECEBIMENTO').AsDateTime;
        end
        else
        begin
          qryBaixa_Receber.FieldByName('BXR_DT_CREDITO').AsDateTime   := qryOrigem.FieldByName('DATADOVENCIMENTO').AsDateTime;
          qryBaixa_Receber.FieldByName('BXR_DT_MOVIMENTO').AsDateTime   := qryOrigem.FieldByName('DATADOVENCIMENTO').AsDateTime;
        end;
        qryBaixa_Receber.FieldByName('BXR_DUPLICATA').AsString     := Copy(qryOrigem.FieldByName('NUMERODODOCUMENTO').AsString, 1, 12);
        qryBaixa_Receber.FieldByName('BXR_CREDITO').AsFloat        := qryOrigem.FieldByName('VALORRECEBIDO').AsFloat;
        qryBaixa_Receber.FieldByName('BXR_JUROS').AsFloat        := 0;
        qryBaixa_Receber.FieldByName('BXR_DESCONTO').AsFloat        := qryOrigem.FieldByName('PERCENTUALDODESCONTO').AsFloat;
        if Trim(qryOrigem.FieldByName('CONTACORRENTE').AsString) <> '' then
        begin
          qryBaixa_Receber.FieldByName('BXR_ORIGEM_RECURSO').AsString  := '1';
          qryBaixa_Receber.FieldByName('BXR_BANCO').AsInteger  := qryOrigem.FieldByName('BANCO').AsInteger;
        end
        else
          qryBaixa_Receber.FieldByName('BXR_ORIGEM_RECURSO').AsString  := '2';
        qryBaixa_Receber.FieldByName('BXR_CAIXA').AsString  := '000';
        vHist := qryOrigem.FieldByName('OBSERVACAO').AsString;
        if length(vHist) <= 200 then
          qryBaixa_Receber.FieldByName('BXR_OBSERVA').AsString  := Trim(vHist)
        else
          qryBaixa_Receber.FieldByName('BXR_OBSERVA').AsString  := Copy(vHist, 1, 198);
        qryBaixa_Receber.Post;
      end;
      qryOrigem.Next;
      vQt := vQt + 1;
      Label5.Caption := 'Contas a Receber ('+IntToStr(vQt)+')...';
      Application.ProcessMessages;
    end;
    IBTransaction1.CommitRetaining;
    qryOrigem.Close;
    qryContas_Receber.Close;
    qryBaixa_Receber.Close;
    Application.MessageBox(PChar('Conta a Receber concluído!'), PChar(Application.Title), 0);
  end;
  if chFornecedores.Checked then
  begin
    //
    // Incluindo Fornecedores
    with qryOrigem, qryOrigem.SQL do
    begin
      Close;
      Clear;
      Add('SELECT * FROM FORNECEDOR');
      Open;
    end;
    // Tabela destino
    with qryFornecedor, qryFornecedor.SQL do
    begin
      Close;
      Clear;
      Add('DELETE FROM FORNECEDORES');
      ExecSQL;
      //
      Close;
      Clear;
      Add('SELECT * FROM FORNECEDORES');
      Open;
    end;
    qryOrigem.First;
    while not qryOrigem.eof do
    begin
      //
      if cancelar.checked then
      begin
        Application.MessageBox(PChar('Operação cancelada!'), PChar(Application.Title), 0);
        break;
        exit;
      end;
      qryFornecedor.Append;
      qryFornecedor.FieldByName('FRN_CODIGO').AsString   := ZerosEsq(qryOrigem.FieldByName('FORNECEDOR').AsString, 6);
      qryFornecedor.FieldByName('FRN_NOME').AsString     := qryOrigem.FieldByName('DESCRICAO').AsString;
      qryFornecedor.FieldByName('FRN_ESTADO').AsString   := qryOrigem.FieldByName('ESTADO').AsString;
      qryFornecedor.FieldByName('FRN_CIDADE').AsString   := qryOrigem.FieldByName('CIDADE').AsString;
      qryFornecedor.FieldByName('FRN_CEP').AsString      := Retira_Caracteres(qryOrigem.FieldByName('CEP').AsString, '/.-');
      qryFornecedor.FieldByName('FRN_BAIRRO').AsString   := qryOrigem.FieldByName('BAIRRO').AsString;
      qryFornecedor.FieldByName('FRN_ENDERECO').AsString := qryOrigem.FieldByName('ENDERECO').AsString;
      if Trim(qryOrigem.FieldByName('COMERCIAL').AsString) <> '(     )     -' then
        qryFornecedor.FieldByName('FRN_FONE').AsString  := Retorna_Fone_ok(qryOrigem.FieldByName('COMERCIAL').AsString);
      if Trim(qryOrigem.FieldByName('CELULAR').AsString) <> '(     )     -' then
        qryFornecedor.FieldByName('FRN_FONE1').AsString    := Retorna_Fone_ok(qryOrigem.FieldByName('CELULAR').AsString);
      if Trim(qryOrigem.FieldByName('FAX').AsString) <> '(     )     -' then
        qryFornecedor.FieldByName('FRN_FAX').AsString    := Retorna_Fone_ok(qryOrigem.FieldByName('FAX').AsString);
      qryFornecedor.FieldByName('FRN_CGF').AsString    := qryOrigem.FieldByName('CGF').AsString;
      if Length(Trim(qryOrigem.FieldByName('CGC').AsString)) = 18 then
        qryFornecedor.FieldByName('FRN_CGC').AsString    := Retira_Caracteres(qryOrigem.FieldByName('CGC').AsString, '/-.');
      qryFornecedor.FieldByName('FRN_PESSOAL').AsString    := 'J';
      qryFornecedor.FieldByName('FRN_EMAIL').AsString    := qryOrigem.FieldByName('EMAIL').AsString;
      qryFornecedor.FieldByName('FRN_OBSERVACAO').AsString    := Trim(qryOrigem.FieldByName('OBSERVACAO').AsString);
      qryFornecedor.FieldByName('FRN_CONTATO1').AsString    := qryOrigem.FieldByName('CONTATO').AsString;
      qryFornecedor.Post;
      qryOrigem.Next;
      vQt := vQt + 1;
      Label5.Caption := 'Fornecedores ('+IntToStr(vQt)+')...';
      Application.ProcessMessages;
    end;
    IBTransaction1.CommitRetaining;
    qryFornecedor.Close;
    qryOrigem.Close;
    Application.MessageBox(PChar('Concluído Fornecedor!'), PChar(Application.Title), 0);
  end;
  //
  // Contas a Pagar
  vQt := 0;
  if chContasPagar.Checked then
  begin
    // Tabela origem
    with qryOrigem, qryOrigem.SQL do
    begin
      Close;
      Clear;
      Add('SELECT * FROM CONTASAPAGAR R, PARCELASAPAGAR P');
      Add(' WHERE R.EMPRESA = P.EMPRESA');
      Add(' AND R.DOCUMENTO = P.DOCUMENTO');
      Add(' ORDER BY EMPRESA, DOCUMENTO, PARCELA');
      Open;
    end;
    // Tabela destino
    with qryContas_Pagar, qryContas_Pagar.SQL do
    begin
      Close;
      Clear;
      Add('DELETE FROM CONTAS_PAGAR');
      ExecSQL;
      Close;
      Clear;
      Add('SELECT * FROM CONTAS_PAGAR');
      Open;
    end;
    with qryBaixa_Pagar, qryBaixa_Pagar.SQL do
    begin
      Close;
      Clear;
      Add('DELETE FROM BAIXA_PAGAR');
      ExecSQL;
      Close;
      Clear;
      Add('SELECT * FROM BAIXA_PAGAR');
      Open;
    end;
    vSeq := 0;
    qryOrigem.First;
    while not qryOrigem.eof do
    begin
      if cancelar.checked then
      begin
        Application.MessageBox(PChar('Operação cancelada!'), PChar(Application.Title), 0);
        break;
        exit;
      end;
      vSeq := vSeq + 1;
      qryContas_Pagar.Append;
      qryContas_Pagar.FieldByName('CTP_SEQUENCIA').AsString   :=  StrZero(vSeq, 6);//StrZero(StrToInt(IntToStr(qryOrigem.FieldByName('DOCUMENTO').AsInteger) + IntToStr(qryOrigem.FieldByName('PARCELA').AsInteger)), 6);
      qryContas_Pagar.FieldByName('CTP_DOCUMENTO').AsString   := Copy(qryOrigem.FieldByName('NUMERODODOCUMENTO').AsString, 1, 12);
      qryContas_Pagar.FieldByName('CTP_HISTORICO').AsString   := Copy(qryOrigem.FieldByName('OBSERVACAO').AsString, 1, 60);
      if Trim(Copy(qryOrigem.FieldByName('OBSERVACAO').AsString, 61, 60)) <> '' then
        qryContas_Pagar.FieldByName('CTP_HISTORICO2').AsString   := Copy(qryOrigem.FieldByName('OBSERVACAO').AsString, 61, 60);
      qryContas_Pagar.FieldByName('CTP_COD_FAVORECIDO').AsString   := ZerosEsq(qryOrigem.FieldByName('FORNECEDOR').AsString, 6);
      qryContas_Pagar.FieldByName('CTP_NOM_FAVORECIDO').AsString   := '';
      qryContas_Pagar.FieldByName('CTP_ESPECIE').AsString   := '1';
      qryContas_Pagar.FieldByName('CTP_EMISSAO').AsDateTime   := qryOrigem.FieldByName('DATADEEMISSAO').AsDateTime;
      qryContas_Pagar.FieldByName('CTP_VENCIMENTO').AsDateTime   := qryOrigem.FieldByName('DATADOVENCIMENTO').AsDateTime;
      qryContas_Pagar.FieldByName('CTP_VALOR').AsFloat   := qryOrigem.FieldByName('VALORDAPARCELA').AsFloat;
      qryContas_Pagar.FieldByName('CTP_VRPAGO').AsFloat   := qryOrigem.FieldByName('VALORPAGO').AsFloat;
      qryContas_Pagar.FieldByName('CTP_REF_MESANO').AsString   := Copy(qryOrigem.FieldByName('DATADEEMISSAO').AsString, 4, 2)+Copy(qryOrigem.FieldByName('DATADEEMISSAO').AsString, 7, 4);
      qryContas_Pagar.FieldByName('CTP_STATUS').AsString   := '2';
      qryContas_Pagar.FieldByName('CTP_CCUSTO').AsString   := '01';
      qryContas_Pagar.FieldByName('CTP_CSETOR').AsString   := '01';
      qryContas_Pagar.FieldByName('CTP_SETOR').AsString   := '01';
      qryContas_Pagar.FieldByName('CTP_PREVISAO_PAGAMENTO').AsDateTime   := qryOrigem.FieldByName('DATADOVENCIMENTO').AsDateTime;
      qryContas_Pagar.FieldByName('CTP_FLG').AsString   := '0';
      qryContas_Pagar.Post;
      if qryOrigem.FieldByName('VALORPAGO').AsFloat > 0 then
      begin
        //
        // Baixa pagar
        qryBaixa_Pagar.Append;
        qryBaixa_Pagar.FieldByName('BXP_SEQUENCIA').AsString   := StrZero(vSeq, 6); // StrZero(StrToInt(IntToStr(qryOrigem.FieldByName('DOCUMENTO').AsInteger) + IntToStr(qryOrigem.FieldByName('PARCELA').AsInteger)), 6)
        if not qryOrigem.FieldByName('DATADOPAGAMENTO').IsNull then
          qryBaixa_Pagar.FieldByName('BXP_DT_PAGO').AsDateTime   := qryOrigem.FieldByName('DATADOPAGAMENTO').AsDateTime
        else
          qryBaixa_Pagar.FieldByName('BXP_DT_PAGO').AsDateTime   := qryOrigem.FieldByName('DATADOVENCIMENTO').AsDateTime;
        qryBaixa_Pagar.FieldByName('BXP_DOCUMENTO').AsString     := Copy(qryOrigem.FieldByName('NUMERODODOCUMENTO').AsString, 1, 12);
        qryBaixa_Pagar.FieldByName('BXP_VR_PAGO').AsFloat        := qryOrigem.FieldByName('VALORPAGO').AsFloat;
        if Trim(qryOrigem.FieldByName('CONTACORRENTE').AsString) <> '' then
          qryBaixa_Pagar.FieldByName('BXP_ORIGEM_RECURSO').AsString  := '1'
        else
          qryBaixa_Pagar.FieldByName('BXP_ORIGEM_RECURSO').AsString  := '2';
        qryBaixa_Pagar.FieldByName('BXP_CAIXA').AsString  := '000';
        vHist := Copy(qryOrigem.FieldByName('OBSERVACAO').AsString,1,180);
        if length(vHist) <= 180 then
//          qryBaixa_Pagar.FieldByName('BXP_OBSERVA').AsString  := vHist
        else
//          qryBaixa_Pagar.FieldByName('BXP_OBSERVA').AsString  := Copy(vHist, 1, 180);
        qryBaixa_Pagar.FieldByName('BXP_CH_PRED_SN').AsString  := 'N';
        qryBaixa_Pagar.FieldByName('BXP_VR_JURO').AsFloat  := 0;
        qryBaixa_Pagar.FieldByName('BXP_VR_DESCONTO').AsFloat  := 0;
        qryBaixa_Pagar.FieldByName('BXP_HR_PAGO').AsString  := '00:00:00';
        qryBaixa_Pagar.FieldByName('BXP_DT_INCLUSAO').AsDateTime   := qryOrigem.FieldByName('DATADOPAGAMENTO').AsDateTime;
        qryBaixa_Pagar.FieldByName('BXP_DT_ALTERACAO').AsDateTime   := qryOrigem.FieldByName('DATADOPAGAMENTO').AsDateTime;
        qryBaixa_Pagar.Post;
      end;
      qryOrigem.Next;
      vQt := vQt + 1;
      Label5.Caption := 'Contas a Pagar ('+IntToStr(vQt)+')...';
      Application.ProcessMessages;
    end;
    IBTransaction1.CommitRetaining;
    qryOrigem.Close;
    qryContas_Pagar.Close;
    qryBaixa_Pagar.Close;
    Application.MessageBox(PChar('Conta a Pagar concluído!'), PChar(Application.Title), 0);
  end;
end;

procedure TfrmMigrarDads.BitBtn3Click(Sender: TObject);
begin
  Cancelar.Checked := true;
end;

procedure TfrmMigrarDads.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	Action:= caFree;
end;


function TfrmMigrarDads.Retira_Caracteres(vString, vCarac: String): String;
  var i: Integer;
      st: string;
begin
  for i := 1 to Length(vString) do
  begin
    if Pos(Copy(vString, i, 1), vCarac) = 0 then
      st := st + Copy(vString, i, 1);
  end;
  Result := st;
end;

function TfrmMigrarDads.Retorna_Fone_ok(vString: String): String;
  var i: Integer;
      st, vCodArea, vFone: string;
begin
  Result := '';
  if Trim(vString) <> '(     )     -' then
  begin
    vCodArea := Copy(vString, Pos('(', vString)+1, Pos(')', vString)-2);
    vCodArea := Trim(vCodArea);
    vFone    := Copy(vString, Pos(')', vString)+1, Length(vString) - Pos(')', vString)+1);
    vFone    := Trim(Retira_Caracteres(vFone, '-'));
    if Trim(vFone) <> '' then
    begin
      if (Trim(vCodArea) <> '') and (Trim(vFone) <> '') then
        vFone := Right(vCodArea, 2) + Space(10 - Length(vFone)) + vFone
      else if(Trim(vCodArea) = '') and (Trim(vFone) <> '') then
        vFone := Space(12 - Length(vFone)) + vFone;
      Result := vFone;
    end;
  end;
end;

end.
