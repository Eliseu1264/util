unit unEmpresa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Grids, DBGrids, Buttons, DB, RXCtrls,
  RXDBCtrl, Navbtn, ExtDlgs, rxPlacemnt;

type
  TfrmEmpresa = class(TForm)
    FormStorage1: TFormStorage;
    DataSource1: TDataSource;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    RxLabel1: TRxLabel;
    Bevel1: TBevel;
    Bevel4: TBevel;
    Bevel2: TBevel;
    DBEditFocus2: TDBEdit;
    DBEditFocus6: TDBEdit;
    DBEditFocus7: TDBEdit;
    DBEditFocus8: TDBEdit;
    DBEditFocus9: TDBEdit;
    DBEditFocus11: TDBEdit;
    dbNavBtnSave: TDBNavigationButton;
    dbNavBtnCancel: TDBNavigationButton;
    DBNavigationButton2: TDBNavigationButton;
    DBLookupComboBox1: TDBLookupComboBox;
    PodeFoco: TLabel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Label14: TLabel;
    DBEdit7: TDBEdit;
    Label15: TLabel;
    DBEdit8: TDBEdit;
    DBImage1: TDBImage;
    Button1: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    Label16: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label17: TLabel;
    DBEdit45: TDBEdit;
    Label99: TLabel;
    Label18: TLabel;
    DBEdit11: TDBEdit;
    Label19: TLabel;
    DBEdit12: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DataSource1StateChange(Sender: TObject);
    procedure DBEditFocus1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBNavigationButton2Click(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure dbNavBtnNewClick(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBEdit45KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpresa: TfrmEmpresa;

implementation

uses unFuncoes,unDataModule2, unAcessos, unMenu, unConsultaTabela;

{$R *.DFM}

procedure TfrmEmpresa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dm2.tblEmpresa.State in [dsedit,dsInsert] then
  begin
    if Pergunta( 'Registro sendo editado. Deseja sair sem gravar ?' ) = 'S' then
      dm2.tblEmpresa.Cancel
    else
    begin
      Action := caNone;
      exit;
    end;
  end;  
  dm2.tblEmpresa.Close;
  dm2.tblEstados.Close;
  Action := caFree;
end;

procedure TfrmEmpresa.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    if not (ActiveControl is TDBGrid) then
    begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    end
    else if(ActiveControl is TDBGrid) then
      with TDBGrid(ActiveControl) do
      if SelectedIndex < (FieldCount - 1) then
        SelectedIndex := SelectedIndex + 1
      else
        SelectedIndex := 0;
  end;
end;

procedure TfrmEmpresa.DataSource1StateChange(Sender: TObject);
begin
  // Testa o acesso do usuario às opcões/operacões do sistemas
  if TDataSource(Sender).DataSet.State = dsInsert then
  begin
    if not FmDireitos.Acesso(fmDireitos.mOperador,frmMenu.Empresa1,'Inclusão') then
      TDataSource(Sender).DataSet.Cancel;
  end
  else if TDataSource(Sender).DataSet.State = dsEdit then
  begin
    if not FmDireitos.Acesso(fmDireitos.mOperador,frmMenu.Empresa1,'Alteração') then
      TDataSource(Sender).DataSet.Cancel;
  end;

  if TDataSource(Sender).DataSet.State = dsInsert then dm2.OC_Operacao := 'Inclusão';
  if TDataSource(Sender).DataSet.State = dsEdit then dm2.OC_Operacao := 'Alteração';

  if dm2.tblEmpresa.State in [dsEdit,dsInsert] then
    dbNavBtnSave.BringToFront;
end;

procedure TfrmEmpresa.DBEditFocus1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then
    Perform(WM_NEXTDLGCTL,1,0);
end;

procedure TfrmEmpresa.DBNavigationButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmEmpresa.DBEdit4Exit(Sender: TObject);
begin
  if dm2.tblEmpresa.State in [dsEdit,dsInsert] then
    dbNavBtnSave.SetFocus;
end;

procedure TfrmEmpresa.dbNavBtnNewClick(Sender: TObject);
begin
  DBEditFocus2.SetFocus;
end;

procedure TfrmEmpresa.DBEdit1Exit(Sender: TObject);
begin
//Dm2.CheckCGC.Input := dm2.tblEmpresaEMP_CGC.Value;
//if not Dm2.CheckCGC.Result then
  if not vCGC(dm2.tblEmpresaEMP_CGC.Value) then
  begin
    mensagem('CGC inválido');
    TWinControl(Sender).SetFocus;
    exit;
  end;
end;

procedure TfrmEmpresa.Button1Click(Sender: TObject);
var
  stImagem: TFileStream;
begin
  if OpenPictureDialog1.execute then
  begin
    if (dm2.tblEmpresa.state = dsBrowse) and not (dm2.tblEmpresa.isEmpty) then
    begin
      dm2.tblEmpresa.edit();
    end;

    stImagem := TFileStream.Create(OpenPictureDialog1.fileName, fmOpenRead or fmShareDenyWrite);
    try
      dm2.tblEmpresaEMP_LOGO.LoadFromStream( stImagem );
      stImagem.free();
    except
      stImagem.free();
      raise;
    end;
  end;
end;

procedure TfrmEmpresa.DBEdit45KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var Retorno: String;
    MtCampos : array [1..3] of string;  MtCamTit : array [1..3] of string;
begin
  if Key = VK_F2 then
  begin
    MtCampos [1] := 'MUN_XMUN';
    MtCampos [2] := 'MUN_CMUN';
    MtCampos [3] := 'MUN_UF';
    MtCamTit [1] := 'Município';
    MtCamTit [2] := 'C.Munic.';
    MtCamTit [3] := 'UF';
    Retorno := EditaArquivo4('MUNICIPIO','Municípios',MTCAMPOS,MTCAMTIT,['MUN_XMUN','MUN_CMUN','MUN_UF'],'');
    if EditArquivo.ModalResult = MROk then
    begin
      if not (dm2.tblEmpresa.State in [dsInsert,dsEdit]) then
        dm2.tblEmpresa.Edit;
      dm2.tblEmpresaEMP_CIDADE.AsString  := GetItemRetorno(Retorno,0);
      dm2.tblEmpresaEMP_NFE_CMUN.AsString   := GetItemRetorno(Retorno,1);
      dm2.tblEmpresaEMP_UF.AsString  := GetItemRetorno(Retorno,2);
    end;
  end;
end;

procedure TfrmEmpresa.FormShow(Sender: TObject);
begin
  if not dm2.tblEmpresa.Active then
    dm2.tblEmpresa.Open;
  if not dm2.tblEstados.Active then
    dm2.tblEstados.Open;
  if dm2.tblEmpresa.IsEmpty then
    dm2.tblEmpresa.Insert;
  DBEditFocus2.SetFocus;
end;

end.
