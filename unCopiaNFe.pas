unit unCopiaNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, DB,
  DBClient, ExtCtrls, Mask, rxToolEdit, IBCustomDataSet, IBQuery;

type
  TfrmCopiaNFe = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    rgCampo: TRadioGroup;
    Label3: TLabel;
    edtInicio: TEdit;
    Label4: TLabel;
    edtFim: TEdit;
    cdsNotas: TClientDataSet;
    cdsNotasNotaFiscal: TStringField;
    cdsNotasMinuta: TStringField;
    cdsNotasChave: TStringField;
    cdsNotasAchou: TStringField;
    cdsNotasStatus: TStringField;
    dtsNotas: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    ProgressBar1: TProgressBar;
    lblQtd: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    edtDe: TDirectoryEdit;
    edtPara: TDirectoryEdit;
    BitBtn2: TBitBtn;
    procedure edtInicioChange(Sender: TObject);
    procedure edtFimChange(Sender: TObject);
    procedure consultar();
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtFimExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    parar: boolean;
  public
    { Public declarations }
  end;

var
  frmCopiaNFe: TfrmCopiaNFe;

implementation

uses unDataModule2;

{$R *.dfm}

procedure TfrmCopiaNFe.edtInicioChange(Sender: TObject);
begin
  if(rgCampo.ItemIndex = 1) then
  begin
    if(length(edtInicio.Text) = 8) then
    begin
      edtInicio.Text := copy(edtInicio.Text,1,2)+'/'+copy(edtInicio.Text,3,2)+'/'+copy(edtInicio.Text,5,4);
      SelectNext(ActiveControl,true,true);
    end;
  end;
end;

procedure TfrmCopiaNFe.edtFimChange(Sender: TObject);
begin
  if(rgCampo.ItemIndex = 1) then
  begin
    if(length(edtFim.Text) = 8) then
    begin
      edtFim.Text := copy(edtFim.Text,1,2)+'/'+copy(edtFim.Text,3,2)+'/'+copy(edtFim.Text,5,4);
      SelectNext(ActiveControl,true,true);
    end;
  end;
end;

procedure TfrmCopiaNFe.consultar;
var
  c,a:integer;
begin

  if trim(edtInicio.Text)='' then
    if trim(edtFim.Text)='' then
      exit;

  with TIBQuery.Create(nil) do
  begin
    Database := dm2.Database1;
    SQL.Add('select                                                           ');
    SQL.Add('    f.ftr_notafiscal,                                            ');
    SQL.Add('    f.ftr_minuta,                                                ');
    SQL.Add('    f.ftr_chave_nfe,                                             ');
    SQL.Add('    case when (f.ftr_cancelado is null) then ''A'' else ''C'' end');
    SQL.Add('        as "cancelado"                                           ');
    SQL.Add('from                                                             ');
    SQL.Add('    faturas f                                                    ');
    SQL.Add('where                                                            ');
    SQL.Add('    not f.ftr_chave_nfe is null                                  ');
    if rgCampo.ItemIndex = 0 then
    begin
      SQL.Add('and                                                            ');
      SQL.Add('    f.ftr_notafiscal between :nI and :nF                       ');
      ParamByName('nI').AsString := edtInicio.Text;
      ParamByName('nF').AsString := edtFim.Text;
    end
    else
    begin
      SQL.Add('and                                                            ');
      SQL.Add('    f.ftr_dtemissao between :dI and :dF                        ');
      ParamByName('dI').AsDate := strToDate(edtInicio.Text);
      ParamByName('dF').AsDate := strToDate(edtFim.Text);
    end;
    Open;
    cdsNotas.EmptyDataSet;
    c:=0;
    a:=0;
    while not eof do
    begin
      cdsNotas.Insert;
      cdsNotasNotaFiscal.Value := FieldByName('ftr_notafiscal').DisplayText;
      cdsNotasMinuta.Value     := FieldByName('ftr_minuta').DisplayText;
      cdsNotasChave.Value      := FieldByName('ftr_chave_nfe').DisplayText;
      cdsNotasAchou.Value      := '';
      cdsNotasStatus.Value     := FieldByName('cancelado').DisplayText;
      cdsNotas.Post;
      if (FieldByName('cancelado').DisplayText = 'A') then
        inc(a)
      else
        inc(c);
      next;
    end;
    lblQtd.Caption := '['+intToStr(a+c)+']';

    ProgressBar1.Position := 0;
    ProgressBar1.Max := a+c;
  end;
  with memo1.Lines do
  begin
    Clear;
    Add('Notas Canceladas: '+intToStr(c));
    Add('Notas Ativas: '+intToStr(a)    );
    Add('------------------------------');
  end;
end;

procedure TfrmCopiaNFe.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    SelectNext(ActiveControl,true,true);
end;

procedure TfrmCopiaNFe.edtFimExit(Sender: TObject);
begin
  consultar;
end;

procedure TfrmCopiaNFe.BitBtn1Click(Sender: TObject);
var
  faltou,
  jaTinha,
  ok      :TStringList;
  i:integer;
begin

  faltou  := TStringList.Create;
  jaTinha := TStringList.Create;
  ok      := TStringList.Create;

  i:=0;
  parar := false;

  cdsNotas.First;
  while not cdsNotas.Eof do
  begin
    if not FileExists(edtDe.Text+'\'+cdsNotasChave.DisplayText+'-nfe.xml') then
    begin
      cdsNotas.Edit;
      cdsNotasAchou.Value := 'N';
      cdsNotas.Post;
      faltou.Add(cdsNotasChave.DisplayText);

      cdsNotas.Next;

      Application.ProcessMessages;
      if parar then
        exit;

      inc(i);
      ProgressBar1.Position := i;

      Continue;
    end;
    if FileExists(edtPara.Text+'\'+cdsNotasChave.DisplayText+'-nfe.xml') then
    begin
      cdsNotas.Edit;
      cdsNotasAchou.Value := 'S';
      cdsNotas.Post;
      jaTinha.Add(cdsNotasChave.DisplayText);

      cdsNotas.Next;

      Application.ProcessMessages;
      if parar then
        exit;

      inc(i);
      ProgressBar1.Position := i;

      Continue;
    end;

    cdsNotas.Edit;
    cdsNotasAchou.Value := 'S';
    cdsNotas.Post;

    ok.Add(cdsNotasChave.DisplayText);

    CopyFile(PChar(edtDe.Text+'\'+cdsNotasChave.DisplayText+'-nfe.xml'),
             PChar(edtPara.Text+'\'+cdsNotasChave.DisplayText+'-nfe.xml'),
             false);


    cdsNotas.Next;

    Application.ProcessMessages;
    if parar then
      exit;

    inc(i);
    ProgressBar1.Position := i;
  end;

  if faltou.Count > 0 then
  begin
    Memo1.Lines.Add('Notas não encontradas:');
    Memo1.Lines.AddStrings(faltou);
    Memo1.Lines.Add('----------------------');
  end;
  if jaTinha.Count > 0 then
  begin
    Memo1.Lines.Add('Notas já existentes:');
    Memo1.Lines.AddStrings(jaTinha);
    Memo1.Lines.Add('----------------------');
  end;
  if ok.Count > 0 then
  begin
    Memo1.Lines.Add('Notas copiadas:');
    Memo1.Lines.AddStrings(ok);
  end;

  MessageDlg('Operação Concluida!',mtInformation,[mbOk],0);
  TabSheet2.Show;
end;

procedure TfrmCopiaNFe.BitBtn2Click(Sender: TObject);
begin
  parar := true;
end;

procedure TfrmCopiaNFe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  freeAndNil(frmCopiaNFe);
end;

end.
