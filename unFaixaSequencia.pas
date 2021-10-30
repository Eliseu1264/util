unit unFaixaSequencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, StdCtrls, Mask, Grids, DBGrids, RXDBCtrl,
  Buttons, Navbtn, ExtCtrls, DB, IBCustomDataSet, IBUpdateSQL, IBQuery,
  DBCtrls, RxDBComb, rxPlacemnt;

type
  TfrmFaixaSequencia = class(TForm)
    Bevel1: TBevel;
    Bevel3: TBevel;
    Bevel8: TBevel;
    dbNavBtnCancel: TDBNavigationButton;
    dbNavBtnDelete: TDBNavigationButton;
    dbNavBtnSave: TDBNavigationButton;
    dbNavBtnNew: TDBNavigationButton;
    DBGrid1: TRxDBGrid;
    dbNavBtnFirst1: TDBNavigationButton;
    dbNavBtnPrior: TDBNavigationButton;
    dbNavBtnNext: TDBNavigationButton;
    dbNavBtnLast: TDBNavigationButton;
    DBNavigationButton2: TDBNavigationButton;
    FormStorage1: TFormStorage;
    Bevel2: TBevel;
    RxLabel1: TRxLabel;
    qyFaixa: TIBQuery;
    updFaixa: TIBUpdateSQL;
    dsFaixa: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    qyFaixaFAS_TABELA: TIBStringField;
    qyFaixaFAS_INICIO: TIntegerField;
    qyFaixaFAS_FIM: TIntegerField;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBComboBox1: TDBComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dsFaixaStateChange(Sender: TObject);
    procedure dbNavBtnNewBeforeAction(Sender: TObject;
      var ActionIsDone: Boolean);
    procedure dbNavBtnDeleteBeforeAction(Sender: TObject;
      var ActionIsDone: Boolean);
    procedure dbNavBtnCancelBeforeAction(Sender: TObject;
      var ActionIsDone: Boolean);
    procedure dbNavBtnSaveBeforeAction(Sender: TObject;
      var ActionIsDone: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure qyFaixaAfterPost(DataSet: TDataSet);
    procedure qyFaixaAfterCancel(DataSet: TDataSet);
    procedure qyFaixaAfterDelete(DataSet: TDataSet);
    procedure DBNavigationButton2Click(Sender: TObject);
    procedure qyFaixaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFaixaSequencia: TfrmFaixaSequencia;

implementation

uses
  unDataModule2, unFuncoes, unAcessos, unMenu;

{$R *.dfm}

procedure TfrmFaixaSequencia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  self   := nil;
end;

procedure TfrmFaixaSequencia.FormShow(Sender: TObject);
begin
  formStorage1.restoreFormPlacement();

  qyFaixa.sql.clear();
  qyFaixa.sql.add('SELECT           ');
  qyFaixa.sql.add('  *              ');
  qyFaixa.sql.add('FROM             ');
  qyFaixa.sql.add('  FAIXA_SEQUENCIA');
  qyFaixa.open();

  if dbNavBtnNew.canFocus then
    dbNavBtnNew.setFocus();
end;

procedure TfrmFaixaSequencia.dsFaixaStateChange(Sender: TObject);
begin
  if qyFaixa.state in [dsInsert, dsEdit] then
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

  if (qyFaixa.state = dsInsert) then
  begin
    if not fmDireitos.Acesso(unMenu.NOME_MODULO,  fmDireitos.mOperador, 'Definirfaixasdesequncias1', 'Inclusão') then
    begin
      qyFaixa.cancel();
    end;
  end
  else if (qyFaixa.state = dsEdit) then
  begin
    if not fmDireitos.Acesso(unMenu.NOME_MODULO,  fmDireitos.mOperador, 'Definirfaixasdesequncias1', 'Alteração') then
    begin
      qyFaixa.cancel();
    end;
  end;
end;

procedure TfrmFaixaSequencia.dbNavBtnNewBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
  actionIsDone := true;
  qyFaixa.insert();

  if (DBComboBox1.canFocus) then
    DBComboBox1.setFocus();
end;

procedure TfrmFaixaSequencia.dbNavBtnDeleteBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
  if (fmDireitos.Acesso(unMenu.NOME_MODULO,  fmDireitos.mOperador, 'Definirfaixasdesequncias1', 'Exclusão'))
     and (pergunta('Confirma a exclusão do registro?') = 'S') then
  begin
    qyFaixa.delete();
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

procedure TfrmFaixaSequencia.dbNavBtnCancelBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
  actionIsDone := true;
  qyFaixa.cancel();
  dm2.IBTransaction1.commitRetaining();

  if dbNavBtnNew.canFocus() then
    dbNavBtnNew.setFocus();
end;

procedure TfrmFaixaSequencia.dbNavBtnSaveBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
  qyFaixa.post();
  dm2.IBTransaction1.commitRetaining();
  actionIsDone := true;
  
  if dbNavBtnNew.canFocus() then
    dbNavBtnNew.setFocus();
end;

procedure TfrmFaixaSequencia.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    selectNext(activeControl, true, true);
  end;
end;

procedure TfrmFaixaSequencia.qyFaixaAfterPost(DataSet: TDataSet);
begin
  qyFaixa.applyUpdates();
end;

procedure TfrmFaixaSequencia.qyFaixaAfterCancel(DataSet: TDataSet);
begin
  qyFaixa.applyUpdates();
end;

procedure TfrmFaixaSequencia.qyFaixaAfterDelete(DataSet: TDataSet);
begin
  qyFaixa.applyUpdates();
end;

procedure TfrmFaixaSequencia.DBNavigationButton2Click(Sender: TObject);
begin
  self.close();
end;

procedure TfrmFaixaSequencia.qyFaixaBeforePost(DataSet: TDataSet);
begin
  if (qyFaixaFAS_TABELA.isNull)
     or (qyFaixaFAS_INICIO.isNull)
     or (qyFaixaFAS_FIM.isNull) then
  begin
    mensagem('Preencha todos os campos!');
    abort;
  end;
end;

end.
