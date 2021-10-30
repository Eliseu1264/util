unit unParametrosConfig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, Placemnt;

type
  TfrmParametrosConfig = class(TForm)
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btAlterar: TBitBtn;
    btSalvar: TBitBtn;
    btSair: TBitBtn;
    ed002: TEdit;
    ed003: TEdit;
    ed004: TEdit;
    ed005: TEdit;
    ed006: TEdit;
    FormStorage1: TFormStorage;
    btCancelar: TBitBtn;
    Label6: TLabel;
    Edit1: TEdit;
    procedure btSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParametrosConfig: TfrmParametrosConfig;

implementation
uses unDataModule3, unFuncoes;

{$R *.DFM}

procedure TfrmParametrosConfig.btSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmParametrosConfig.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmParametrosConfig.FormShow(Sender: TObject);
var
  i: Integer;
begin
  dm3.qryParametros_configuracao.Open;
  dm3.qryParametros_configuracao.First;
  while not dm3.qryParametros_configuracao.EOF do
  begin
    for i := ComponentCount - 1 downto 0 do
      if (Components[i] is TEdit) then
        if Pos(dm3.qryParametros_configuracaoPCG_CODIGO.Value, TEdit(Components[i]).Name) <> 0 then
          TEdit(Components[i]).Text := dm3.qryParametros_configuracaoPCG_CAMPO.Value;
    dm3.qryParametros_configuracao.Next;
  end;
  dm3.qryParametros_configuracao.Close;
end;

procedure TfrmParametrosConfig.btSalvarClick(Sender: TObject);
var
  i: Integer;
begin
  for i := ComponentCount - 1 downto 0 do
  begin
    if (Components[i] is TEdit) then
    begin
      if TEdit(Components[i]).Text = '' then
      begin
        Mensagem('Não podem haver campos em branco!');
        TEdit(Components[i]).SetFocus;
        Exit;
      end
      else
      begin
        if dm3.qryParametros_configuracao.Locate('PCG_CODIGO', copy(TEdit(Components[i]).Name,3,3), []) then
        begin
          dm3.qryParametros_configuracao.Edit;
          dm3.qryParametros_configuracaoPCG_CAMPO.Value := TEdit(Components[i]).Text;
          dm3.qryParametros_configuracao.Post;
        end;
      end;
    end;
  end;
  dm3.qryParametros_configuracao.Close;
  for i := ComponentCount - 1 downto 0 do
    if (Components[i] is TEdit) then
      TEdit(Components[i]).ReadOnly := False;
  btSair.Enabled := True;
  btSalvar.Enabled := False;
  btSalvar.SendToBack;
  btCancelar.Enabled := False;
end;

procedure TfrmParametrosConfig.btAlterarClick(Sender: TObject);
var
  i: Integer;
begin
  for i := ComponentCount - 1 downto 0 do
    if (Components[i] is TEdit) then
      TEdit(Components[i]).ReadOnly := True;

  dm3.qryParametros_configuracao.Open;
  btSalvar.Enabled := True;
  btSalvar.BringToFront;
  btCancelar.Enabled := True;
  btSair.Enabled := False;
end;

procedure TfrmParametrosConfig.btCancelarClick(Sender: TObject);
begin
  btSair.Enabled := True;
  btSalvar.Enabled := False;
  btSalvar.SendToBack;
end;

end.
