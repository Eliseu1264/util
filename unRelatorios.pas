unit unRelatorios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, Db, QuickRpt, Qrctrls, ExtCtrls, StdCtrls, unDataModule2,
  IBCustomDataSet, IBQuery;

type
  TfrmRelatorios = class(TForm)
    ImageList1: TImageList;
    ListView1: TListView;
    Query1: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorios: TfrmRelatorios;

implementation

uses unFiltroRel, unFuncoes;

{$R *.DFM}

procedure TfrmRelatorios.FormShow(Sender: TObject);
var
  cont : integer;
begin
  ListView1.Items.Clear;
  with Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select distinct GR_IDENTIFICACAO, GR_CODIGO from GERADOR_RELATORIOS');
    SQL.Add('order by GR_IDENTIFICACAO');
    Open;
  end;
  cont := 0;
  while NOT Query1.EOF do
  begin
    ListView1.Items.Add;
    ListView1.Items[cont].ImageIndex := 0;
    ListView1.Items[cont].Caption := Query1.FieldByName('GR_IDENTIFICACAO').AsString;
    cont := cont + 1;
    Query1.next;
  end;
end;

procedure TfrmRelatorios.ListView1Click(Sender: TObject);
begin
  try
    if ListView1.Selected.Caption = '' then Caption:= Caption;
  except
    Exit;
  end;
  //if TfrmFiltroRel(Application.FindComponent('frmFiltroRel')) = nil then
  frmFiltroRel := TfrmFiltroRel.Create(Application);
  frmFiltroRel.lTitulo.Caption := ListView1.Selected.Caption;
  frmFiltroRel.Caption := 'Filtragem - ' + ListView1.Selected.Caption;
  with frmFiltroRel.qryAux do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from GERADOR_RELATORIOS where GR_IDENTIFICACAO = ' + QuotedStr(ListView1.Selected.Caption));
    Open;
  end;
  frmFiltroRel.vCodigoRel := frmFiltroRel.qryAux.FieldByName('GR_CODIGO').AsString;
  frmFiltroRel.ShowModal;
end;

end.
