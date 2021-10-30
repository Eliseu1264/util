unit unSequenciaUnica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, StdCtrls, Mask, Grids, DBGrids, RXDBCtrl,
  Buttons, Navbtn, ExtCtrls, DB, IBCustomDataSet, IBUpdateSQL, IBQuery,
  DBCtrls, RxDBComb, Menus, rxPlacemnt;

type
  TfrmSequenciaUnica = class(TForm)
    Bevel1: TBevel;
    Bevel3: TBevel;
    Bevel8: TBevel;
    dbNavBtnCancel: TDBNavigationButton;
    dbNavBtnDelete: TDBNavigationButton;
    dbNavBtnSave: TDBNavigationButton;
    dbNavBtnNew: TDBNavigationButton;
    dbNavBtnFirst1: TDBNavigationButton;
    dbNavBtnPrior: TDBNavigationButton;
    dbNavBtnNext: TDBNavigationButton;
    dbNavBtnLast: TDBNavigationButton;
    DBNavigationButton2: TDBNavigationButton;
    FormStorage1: TFormStorage;
    Bevel2: TBevel;
    RxLabel1: TRxLabel;
    qrySeqUnica: TIBQuery;
    updSeqUnica: TIBUpdateSQL;
    dsSeqUnica: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    RxDBComboBox7: TRxDBComboBox;
    qrySeqUnicaSEQ_IDENTIFICADOR: TIBStringField;
    qrySeqUnicaSEQ_SEQUENCIA: TIntegerField;
    DBGrid1: TRxDBGrid;
    PopupMenu1: TPopupMenu;
    Atualizartodosastabelasdalistacomaltimasequncia1: TMenuItem;
    qrySeqUnica2: TIBQuery;
    IBStringField1: TIBStringField;
    IntegerField1: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dsSeqUnicaStateChange(Sender: TObject);
    procedure dbNavBtnNewBeforeAction(Sender: TObject;
      var ActionIsDone: Boolean);
    procedure dbNavBtnDeleteBeforeAction(Sender: TObject;
      var ActionIsDone: Boolean);
    procedure dbNavBtnCancelBeforeAction(Sender: TObject;
      var ActionIsDone: Boolean);
    procedure dbNavBtnSaveBeforeAction(Sender: TObject;
      var ActionIsDone: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure qrySeqUnicaAfterPost(DataSet: TDataSet);
    procedure qrySeqUnicaAfterCancel(DataSet: TDataSet);
    procedure qrySeqUnicaAfterDelete(DataSet: TDataSet);
    procedure DBNavigationButton2Click(Sender: TObject);
    procedure qrySeqUnicaBeforePost(DataSet: TDataSet);
    procedure Atualizartodosastabelasdalistacomaltimasequncia1Click(
      Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSequenciaUnica: TfrmSequenciaUnica;

implementation

uses
  unDataModule2, unFuncoes, unAcessos, unMenu;

{$R *.dfm}

procedure TfrmSequenciaUnica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  self   := nil;
end;

procedure TfrmSequenciaUnica.FormShow(Sender: TObject);
begin
  formStorage1.restoreFormPlacement();

  qrySeqUnica.sql.clear();
  qrySeqUnica.sql.add('SELECT           ');
  qrySeqUnica.sql.add('  *              ');
  qrySeqUnica.sql.add('FROM             ');
  qrySeqUnica.sql.add('  SEQUENCIA_UNICA');
  qrySeqUnica.open();

  if dbNavBtnNew.canFocus then
    dbNavBtnNew.setFocus();
end;

procedure TfrmSequenciaUnica.dsSeqUnicaStateChange(Sender: TObject);
begin
  if qrySeqUnica.state in [dsInsert, dsEdit] then
  begin
    dbNavBtnNew.visible    := false;
    dbNavBtnDelete.visible := false;
    dbNavBtnSave.visible   := true;
    dbNavBtnCancel.visible := true;
  end
  else
  begin
    dbNavBtnNew.visible    := true;
    dbNavBtnDelete.visible := true;
    dbNavBtnSave.visible   := false;
    dbNavBtnCancel.visible := false;
  end;

  if (qrySeqUnica.state = dsInsert) then
  begin
    if not fmDireitos.Acesso(unMenu.NOME_MODULO,  fmDireitos.mOperador, 'Alteraratualizarsequncianica1', 'Inclusão') then
    begin
      qrySeqUnica.cancel();
    end;
  end
  else if (qrySeqUnica.state = dsEdit) then
  begin
    if not fmDireitos.Acesso(unMenu.NOME_MODULO,  fmDireitos.mOperador, 'Alteraratualizarsequncianica1', 'Alteração') then
    begin
      qrySeqUnica.cancel();
    end;
  end;
end;

procedure TfrmSequenciaUnica.dbNavBtnNewBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
  actionIsDone := true;
  qrySeqUnica.insert();
  if RxDBComboBox7.CanFocus then
    RxDBComboBox7.SetFocus;
end;

procedure TfrmSequenciaUnica.dbNavBtnDeleteBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
  if (fmDireitos.Acesso(unMenu.NOME_MODULO,  fmDireitos.mOperador, 'Alteraratualizarsequncianica1', 'Exclusão'))
     and (pergunta('Confirma a exclusão do registro?') = 'S') then
  begin
    qrySeqUnica.delete();
    dm2.IBTransaction1.commitRetaining();
    actionIsDone := true;

    if dbNavBtnNew.canFocus then
      dbNavBtnNew.setFocus();
  end
  else
  begin
    actionIsDone := true;

    if dbNavBtnDelete.canFocus then
      dbNavBtnDelete.setFocus();
  end;
end;

procedure TfrmSequenciaUnica.dbNavBtnCancelBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
  actionIsDone := true;
  qrySeqUnica.cancel();
  dm2.IBTransaction1.commitRetaining();

  if dbNavBtnNew.canFocus() then
    dbNavBtnNew.setFocus();
end;

procedure TfrmSequenciaUnica.dbNavBtnSaveBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
  qrySeqUnica.post();
  dm2.IBTransaction1.commitRetaining();
  actionIsDone := true;

  if dbNavBtnNew.canFocus() then
    dbNavBtnNew.setFocus();
end;

procedure TfrmSequenciaUnica.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    selectNext(activeControl, true, true);
  end;
end;

procedure TfrmSequenciaUnica.qrySeqUnicaAfterPost(DataSet: TDataSet);
begin
  qrySeqUnica.applyUpdates();
end;

procedure TfrmSequenciaUnica.qrySeqUnicaAfterCancel(DataSet: TDataSet);
begin
  qrySeqUnica.applyUpdates();
end;

procedure TfrmSequenciaUnica.qrySeqUnicaAfterDelete(DataSet: TDataSet);
begin
  qrySeqUnica.applyUpdates();
end;

procedure TfrmSequenciaUnica.DBNavigationButton2Click(Sender: TObject);
begin
  self.close();
end;

procedure TfrmSequenciaUnica.qrySeqUnicaBeforePost(DataSet: TDataSet);
begin
  if (qrySeqUnicaSEQ_IDENTIFICADOR.isNull)
     or (qrySeqUnicaSEQ_SEQUENCIA.isNull) then
  begin
    mensagem('Preencha todos os campos!');
    abort;
  end;
end;

procedure TfrmSequenciaUnica.Atualizartodosastabelasdalistacomaltimasequncia1Click(
  Sender: TObject);
begin
  if pergunta('Deseja atualizar a tabela de sequêncas únicas ?') = 'S' then
  begin
    qrySeqUnica2.close();
    qrySeqUnica2.sql.clear();
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''TIPO_ADITIVO''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''TIPO_ADITIVO'', COALESCE(MAX(TAD_CODIGO), 1) FROM TIPO_ADITIVO;');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''CHAMADO_TECNICO''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''CHAMADO_TECNICO'', COALESCE(MAX(CHT_NRO_CHAMADO), 1) FROM CHAMADO_TECNICO; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''CHAMADO_TECNICO_SERIES''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''CHAMADO_TECNICO_SERIES'', COALESCE(MAX(CTS_SEQUENCIA), 1) FROM CHAMADO_TECNICO_SERIES; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''MOTIVO_CANCELAMENTO''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''MOTIVO_CANCELAMENTO'', COALESCE(MAX(MTC_CODIGO), 1) FROM MOTIVO_CANCELAMENTO; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''INDICES''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''INDICES'', COALESCE(MAX(IND_CODIGO), 1) FROM INDICES; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''INDICES_DETALHES''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''INDICES_DETALHES'', COALESCE(MAX(IDE_CODIGO), 1) FROM INDICES_DETALHES;');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''ORCAMENTO_ASSIST''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''ORCAMENTO_ASSIST'', COALESCE(MAX(PDV_PEDIDO), 1) FROM ORCAMENTO_ASSIST;');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''OS_ASSIST''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''OS_ASSIST'', COALESCE(MAX(OSA_NUMERO), 1) FROM OS_ASSIST;');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''SITUACAO_OS''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''SITUACAO_OS'', COALESCE(MAX(STO_CODIGO), 1) FROM SITUACAO_OS; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''ITENS_SERVICO_ASSIST_TEC''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''ITENS_SERVICO_ASSIST_TEC'', COALESCE(MAX(ISA_CODIGO), 1) FROM ITENS_SERVICO_ASSIST_TEC; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''CHAMADOS_STATUS''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''CHAMADOS_STATUS'', COALESCE(MAX(CSS_CODIGO), 1) FROM CHAMADOS_STATUS; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''OPERACOES''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''OPERACOES'', COALESCE(MAX(OPS_CODIGO), 1) FROM OPERACOES; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''DEFEITOS''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''DEFEITOS'', COALESCE(MAX(DEF_CODIGO), 1) FROM DEFEITOS; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''AREAS''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''AREAS'', COALESCE(MAX(ARE_CODIGO), 1) FROM AREAS; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''ROTAS''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''ROTAS'', COALESCE(MAX(ROT_CODIGO), 1) FROM ROTAS; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''ESPECIALIDADES''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''ESPECIALIDADES'', COALESCE(MAX(ESP_CODIGO), 1) FROM ESPECIALIDADES; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''TRANSFERENCIAS''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''TRANSFERENCIAS'', COALESCE(MAX(TRF_SEQ), 1) FROM TRANSFERENCIAS; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''RESERVA''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''RESERVA'', COALESCE(MAX(RESERVA), 1) FROM RESERVA; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''MODELO_CHEQUE''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''MODELO_CHEQUE'', COALESCE(MAX(MCH_CODIGO), 1) FROM MODELO_CHEQUE; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''RECIBO''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''RECIBO'', COALESCE(MAX(REC_SEQUENCIA), 1) FROM RECIBO; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''LANCAMENTO_DIA''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''LANCAMENTO_DIA'', COALESCE(MAX(SEQUENCIA), 1) FROM LANCAMENTO_DIA; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''REQUISICAO_GASTO''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''REQUISICAO_GASTO'', COALESCE(MAX(REQ_REQUISICAO), 1) FROM REQUISICAO_GASTO; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''REQUISICAO''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''REQUISICAO'', COALESCE(MAX(REQ_REQUISICAO), 1) FROM REQUISICAO; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''RECIBO_RPA''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''RECIBO_RPA'', COALESCE(MAX(RPA_SEQUENCIA), 1) FROM RECIBO_RPA; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''SOCIOS''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''SOCIOS'', COALESCE(MAX(SOC_CODIGO), 1) FROM SOCIOS; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''COMISSAO2''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''COMISSAO2'', COALESCE(MAX(COM_SEQUENCIA), 1) FROM COMISSAO2; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''COMISSAO''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''COMISSAO'', COALESCE(MAX(CO_SEQUENCIA), 1) FROM COMISSAO; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''CONFIG_FILTROS''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''CONFIG_FILTROS'', COALESCE(MAX(COF_SEQUENCIA), 1) FROM CONFIG_FILTROS; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''LIBERA_COMISSAO2''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''LIBERA_COMISSAO2'', COALESCE(MAX(LIC_SEQUENCIA), 1) FROM LIBERA_COMISSAO2; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''ITENS_FATURADOS''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''ITENS_FATURADOS'', COALESCE(MAX(ITF_SEQUENCIA), 1) FROM ITENS_FATURADOS; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''BANCO''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''BANCO'', COALESCE(MAX(BNC_CODIGO), 1) FROM BANCO; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''AUTORIZADOS''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''AUTORIZADOS'', COALESCE(MAX(AUT_SEQUENCIA), 1) FROM AUTORIZADOS; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''CLASSIFICACAO_CONTATO''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''CLASSIFICACAO_CONTATO'', COALESCE(MAX(CLA_CODIGO), 1) FROM CLASSIFICACAO_CONTATO; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''LOJAS''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''LOJAS'', COALESCE(MAX(LOJ_CODIGO), 1) FROM LOJAS; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''IDENTIF_PROD''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''IDENTIF_PROD'', COALESCE(MAX(IDP_SEQUENCIA), 1) FROM IDENTIF_PROD; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''CODIGOS_FISCAIS''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''CODIGOS_FISCAIS'', COALESCE(MAX(CDF_SEQUENCIAL), 1) FROM CODIGOS_FISCAIS; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''SAIDA''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''SAIDA'', COALESCE(MAX(SDA_SEQUENCIA), 1) FROM SAIDA; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''PEDIDOS_VENDAS''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA (SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''PEDIDOS_VENDAS'', COALESCE(CAST(MAX(PDV_PEDIDO) AS INTEGER),1) FROM PEDIDOS_VENDAS; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''ITENS_VENDAS''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA (SEQ_IDENTIFICADOR, SEQ_SEQUENCIA) SELECT ''ITENS_VENDAS'', COALESCE(CAST(MAX(ITV_SEQUENCIA) AS INTEGER), 1) FROM ITENS_VENDAS; ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''BAIXA_RECEB''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR,SEQ_SEQUENCIA)VALUES(''BAIXA_RECEB'',(SELECT COALESCE(MAX(BXR_SEQUENCIA),1) FROM BAIXA_RECEB)); ');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR = ''EXTRATO_DE_CONTA''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR,SEQ_SEQUENCIA)VALUES(''EXTRATO_DE_CONTA'',(SELECT COALESCE(MAX(EXC_SEQUENCIA),1) FROM EXTRATO_DE_CONTA));');
    qrySeqUnica2.sql.add('DELETE FROM SEQUENCIA_UNICA WHERE SEQ_IDENTIFICADOR LIKE ''CONTRATOS%''; ');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR,SEQ_SEQUENCIA)VALUES(''CONTRATOS1'', (SELECT COALESCE(MAX(CTN_NR_CONTRATO),1) FROM CONTRATOS WHERE CTN_TIPO_CONTRATO = 1));');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR,SEQ_SEQUENCIA)VALUES(''CONTRATOS2'', (SELECT COALESCE(MAX(CTN_NR_CONTRATO),1) FROM CONTRATOS WHERE CTN_TIPO_CONTRATO = 2));');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR,SEQ_SEQUENCIA)VALUES(''CONTRATOS3'', (SELECT COALESCE(MAX(CTN_NR_CONTRATO),1) FROM CONTRATOS WHERE CTN_TIPO_CONTRATO = 3));');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR,SEQ_SEQUENCIA)VALUES(''CONTRATOS4'', (SELECT COALESCE(MAX(CTN_NR_CONTRATO),1) FROM CONTRATOS WHERE CTN_TIPO_CONTRATO = 4));');
    qrySeqUnica2.sql.add('INSERT INTO SEQUENCIA_UNICA(SEQ_IDENTIFICADOR,SEQ_SEQUENCIA)VALUES(''CONTRATOS5'', (SELECT COALESCE(MAX(CTN_NR_CONTRATO),1) FROM CONTRATOS WHERE CTN_TIPO_CONTRATO = 5));');
    qrySeqUnica2.ExecSQL;
  end;
end;

end.

