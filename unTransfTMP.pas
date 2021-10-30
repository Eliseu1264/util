unit unTransfTMP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, Db, Grids, DBGrids, DBTables, Gauges, Buttons,
  ExtCtrls;

type
  TfrmTransfTMP = class(TForm)
    Label3: TLabel;
    EdArquivo: TFilenameEdit;
    Table1: TTable;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BtImportar: TBitBtn;
    pb: TGauge;
    qryAux: TQuery;
    qryAuxCLI_CODIGO: TStringField;
    qryAuxCLI_NOME: TStringField;
    qryAuxCLI_FANTASIA: TStringField;
    qryAuxCLI_PESSOA: TStringField;
    qryAuxCLI_ENDERECO: TStringField;
    qryAuxCLI_BAIRRO: TStringField;
    qryAuxCLI_CIDADE: TStringField;
    qryAuxCLI_ESTADO: TStringField;
    qryAuxCLI_CEP: TStringField;
    qryAuxCLI_CPF: TStringField;
    qryAuxCLI_CGC: TStringField;
    qryAuxCLI_CGF: TStringField;
    qryAuxCLI_CONTATO1: TStringField;
    qryAuxCLI_CONTATO2: TStringField;
    qryAuxCLI_CONTATO3: TStringField;
    qryAuxCLI_CONTATO4: TStringField;
    qryAuxCLI_CONTATO5: TStringField;
    qryAuxCLI_FONECONT1: TStringField;
    qryAuxCLI_FONECONT2: TStringField;
    qryAuxCLI_FONECONT3: TStringField;
    qryAuxCLI_FONECONT4: TStringField;
    qryAuxCLI_FONECONT5: TStringField;
    qryAuxCLI_CARGO1: TStringField;
    qryAuxCLI_CARGO2: TStringField;
    qryAuxCLI_CARGO3: TStringField;
    qryAuxCLI_CARGO4: TStringField;
    qryAuxCLI_CARGO5: TStringField;
    qryAuxCLI_NASC1: TDateTimeField;
    qryAuxCLI_NASC2: TDateTimeField;
    qryAuxCLI_NASC3: TDateTimeField;
    qryAuxCLI_NASC4: TDateTimeField;
    qryAuxCLI_NASC5: TDateTimeField;
    qryAuxCLI_AGENCIA: TStringField;
    qryAuxCLI_RAMAL1: TStringField;
    qryAuxCLI_RAMAL2: TStringField;
    qryAuxCLI_RAMAL3: TStringField;
    qryAuxCLI_RAMAL4: TStringField;
    qryAuxCLI_RAMAL5: TStringField;
    qryAuxCLI_CELULAR1: TStringField;
    qryAuxCLI_CELULAR2: TStringField;
    qryAuxCLI_CELULAR3: TStringField;
    qryAuxCLI_CELULAR4: TStringField;
    qryAuxCLI_CELULAR5: TStringField;
    qryAuxCLI_FAX: TStringField;
    qryAuxCLI_FATENDERECO: TStringField;
    qryAuxCLI_FATBAIRRO: TStringField;
    qryAuxCLI_FATCEP: TStringField;
    qryAuxCLI_FATCIDADE: TStringField;
    qryAuxCLI_FATESTADO: TStringField;
    qryAuxCLI_FATCGC: TStringField;
    qryAuxCLI_FATCGF: TStringField;
    qryAuxCLI_WEB: TStringField;
    qryAuxCLI_VENDEDOR: TStringField;
    qryAuxCLI_ATIVIDADE: TStringField;
    qryAuxCLI_CREDITO: TStringField;
    qryAuxCLI_COBENDERECO: TStringField;
    qryAuxCLI_COBBAIRRO: TStringField;
    qryAuxCLI_COBCEP: TStringField;
    qryAuxCLI_COBCIDADE: TStringField;
    qryAuxCLI_COBESTADO: TStringField;
    qryAuxCLI_COBCGC: TStringField;
    qryAuxCLI_COBCGF: TStringField;
    qryAuxCLI_EMAIL: TStringField;
    qryAuxCLI_FATCPF: TStringField;
    qryAuxCLI_COBCPF: TStringField;
    qryAuxCLI_VENAGE: TStringField;
    qryAuxCLI_CARAC: TFloatField;
    BtSair: TBitBtn;
    Bevel9: TBevel;
    BtCancelar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdArquivoAfterDialog(Sender: TObject; var Name: String;
      var Action: Boolean);
    procedure BtImportarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    CancelarProcessamento : boolean;
    { Public declarations }
  end;

var
  frmTransfTMP: TfrmTransfTMP;

implementation

uses unDataModule2, unFuncoes;

{$R *.DFM}

function PegaSoParteNumerica(Palavra: string) : string;
var
  cont : integer;
  aux  : string;
begin
  for cont := 1 to Length(Palavra) do
  try
    if StrToInt(copy(Palavra, cont, 1)) in [0..9] then
      aux := aux + copy(Palavra, cont, 1);
  except;
  end;
  Result := aux;
end;

function TransformaTelefone(numeroTel : string) : string;
var
  numero : string;
  cont : integer;
begin
  numero := PegaSoParteNumerica(copy(numeroTel, 6, 9));
  if Length(numero) < 8 then
    for cont := 1 to 8 - Length(numero) do
      numero := ' ' + numero;
  Result := copy(numeroTel, 2, 3) + ' ' + numero;
end;


procedure TfrmTransfTMP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryAux.Close;
  Table1.Close;
  Action := caFree;
end;

procedure TfrmTransfTMP.EdArquivoAfterDialog(Sender: TObject;
  var Name: String; var Action: Boolean);
begin
  if Table1.Active then
    Table1.Close;
  Table1.TableName := Name;
  Table1.Open;
  qryAux.Open;
  Label2.Caption := IntToStr(Table1.RecordCount) + ' registros.';
  btImportar.SetFocus;
end;

procedure TfrmTransfTMP.BtImportarClick(Sender: TObject);
begin
  //PegaSoParteNumerica('c12$dde444');
  if not(dm2.Database1.InTransaction) then
    dm2.Database1.StartTransaction;
  pb.Progress := 0;
  pb.MaxValue := Table1.RecordCount;
  Label1.Caption := 'Transferindo dados...';
  CancelarProcessamento := False;
  Table1.First;
  while not table1.EOF do
  begin
    qryAux.Insert;

    qryAuxCLI_CODIGO.Value       := Table1.FieldByName('CODI').AsString;
    qryAuxCLI_NOME.Value         := Table1.FieldByName('NOME').AsString;
    qryAuxCLI_FANTASIA.Value     := Table1.FieldByName('FANTASIA').AsString;
    qryAuxCLI_PESSOA.Value       := Table1.FieldByName('PESSOA').AsString;
    qryAuxCLI_ENDERECO.Value     := Table1.FieldByName('ENDE').AsString;
    qryAuxCLI_BAIRRO.Value       := Table1.FieldByName('BAIR').AsString;
    qryAuxCLI_CIDADE.Value       := Table1.FieldByName('CIDA').AsString;
    qryAuxCLI_ESTADO.Value       := Table1.FieldByName('ESTA').AsString;
    qryAuxCLI_CEP.Value          := PegaSoParteNumerica(Table1.FieldByName('CEP').AsString);
    qryAuxCLI_CPF.Value          := PegaSoParteNumerica(Table1.FieldByName('CPF').AsString);
    qryAuxCLI_CGC.Value          := Table1.FieldByName('CGC').AsString;
    qryAuxCLI_CGF.Value          := PegaSoParteNumerica(Table1.FieldByName('CGF').AsString);
    qryAuxCLI_CONTATO1.Value     := Table1.FieldByName('CONTATO1').AsString;
    qryAuxCLI_CONTATO2.Value     := Table1.FieldByName('CONTATO2').AsString;
    qryAuxCLI_CONTATO3.Value     := Table1.FieldByName('CONTATO3').AsString;
    qryAuxCLI_CONTATO4.Value     := Table1.FieldByName('CONTATO4').AsString;
    qryAuxCLI_CONTATO5.Value     := Table1.FieldByName('CONTATO5').AsString;
    qryAuxCLI_FONECONT1.Value    := TransformaTelefone(Table1.FieldByName('CONT1_FONE').AsString);
    qryAuxCLI_FONECONT2.Value    := TransformaTelefone(Table1.FieldByName('CONT2_FONE').AsString);
    qryAuxCLI_FONECONT3.Value    := TransformaTelefone(Table1.FieldByName('CONT3_FONE').AsString);
    qryAuxCLI_FONECONT4.Value    := TransformaTelefone(Table1.FieldByName('CONT4_FONE').AsString);
    qryAuxCLI_FONECONT5.Value    := TransformaTelefone(Table1.FieldByName('CONT5_FONE').AsString);
    qryAuxCLI_CARGO1.Value       := Table1.FieldByName('CARGO1').AsString;
    qryAuxCLI_CARGO2.Value       := Table1.FieldByName('CARGO2').AsString;
    qryAuxCLI_CARGO3.Value       := Table1.FieldByName('CARGO3').AsString;
    qryAuxCLI_CARGO4.Value       := Table1.FieldByName('CARGO4').AsString;
    qryAuxCLI_CARGO5.Value       := Table1.FieldByName('CARGO5').AsString;
    if Table1.FieldByName('DT_NASC1').AsDateTime > StrToDate('01/01/1920') then
      qryAuxCLI_NASC1.Value        := Table1.FieldByName('DT_NASC1').AsDateTime;
    if Table1.FieldByName('DT_NASC2').AsDateTime > StrToDate('01/01/1920') then
      qryAuxCLI_NASC2.Value        := Table1.FieldByName('DT_NASC2').AsDateTime;
    if Table1.FieldByName('DT_NASC3').AsDateTime > StrToDate('01/01/1920') then
      qryAuxCLI_NASC3.Value        := Table1.FieldByName('DT_NASC3').AsDateTime;
    if Table1.FieldByName('DT_NASC4').AsDateTime > StrToDate('01/01/1920') then
      qryAuxCLI_NASC4.Value        := Table1.FieldByName('DT_NASC4').AsDateTime;
    if Table1.FieldByName('DT_NASC5').AsDateTime > StrToDate('01/01/1920') then
      qryAuxCLI_NASC5.Value        := Table1.FieldByName('DT_NASC5').AsDateTime;
    qryAuxCLI_AGENCIA.Value      := Table1.FieldByName('AGENCIA').AsString;
    qryAuxCLI_CELULAR1.Value     := TransformaTelefone(Table1.FieldByName('CELULAR1').AsString);
    qryAuxCLI_FAX.Value          := TransformaTelefone(Table1.FieldByName('FAX').AsString);
    qryAuxCLI_FATENDERECO.Value  := Table1.FieldByName('END_FATURA').AsString;
    qryAuxCLI_FATBAIRRO.Value    := Table1.FieldByName('BAI_FATURA').AsString;
    qryAuxCLI_FATCEP.Value       := PegaSoParteNumerica(Table1.FieldByName('CEP_FATURA').AsString);
    qryAuxCLI_FATCIDADE.Value    := Table1.FieldByName('CID_FATURA').AsString;
    qryAuxCLI_FATESTADO.Value    := Table1.FieldByName('EST_FATURA').AsString;
    qryAuxCLI_FATCGC.Value       := Table1.FieldByName('CGC_FARUTA').AsString;
    qryAuxCLI_FATCGF.Value       := PegaSoParteNumerica(Table1.FieldByName('CGF_FATURA').AsString);
    qryAuxCLI_FATCPF.Value       := PegaSoParteNumerica(Table1.FieldByName('CPF').AsString);
    qryAuxCLI_VENDEDOR.Value     := Table1.FieldByName('CODI_VENDE').AsString;
    qryAuxCLI_COBENDERECO.Value  := Table1.FieldByName('END_FATURA').AsString;
    qryAuxCLI_COBBAIRRO.Value    := Table1.FieldByName('BAI_FATURA').AsString;
    qryAuxCLI_COBCEP.Value       := PegaSoParteNumerica(Table1.FieldByName('CEP_FATURA').AsString);
    qryAuxCLI_COBCIDADE.Value    := Table1.FieldByName('CID_FATURA').AsString;
    qryAuxCLI_COBESTADO.Value    := Table1.FieldByName('EST_FATURA').AsString;
    qryAuxCLI_COBCGC.Value       := Table1.FieldByName('CGC_FARUTA').AsString;
    qryAuxCLI_COBCGF.Value       := PegaSoParteNumerica(Table1.FieldByName('CGF_FATURA').AsString);
    qryAuxCLI_COBCPF.Value       := PegaSoParteNumerica(Table1.FieldByName('CPF').AsString);
    qryAuxCLI_VENAGE.Value       := Table1.FieldByName('VEND_AG').AsString;
    qryAuxCLI_ATIVIDADE.Value    := '';
    qryAuxCLI_CREDITO.Value      := 'L';
    if Table1.FieldByName('CODI_VENDE').IsNull then qryAuxCLI_VENDEDOR.Value := '';
    if Table1.FieldByName('ENDE').IsNull       then qryAuxCLI_ENDERECO.Value := '';
    if Table1.FieldByName('PESSOA').IsNull     then qryAuxCLI_PESSOA.Value   := '';

//    qryAuxCLI_CARAC.Value      := Table1.FieldByName('CODI').AsFloat;
//    qryAuxCLI_RAMAL1.Value     := Table1.FieldByName('CODI').AsString;
//    qryAuxCLI_RAMAL2.Value     := Table1.FieldByName('CODI').AsString;
//    qryAuxCLI_RAMAL3.Value     := Table1.FieldByName('CODI').AsString;
//    qryAuxCLI_RAMAL4.Value     := Table1.FieldByName('CODI').AsString;
//    qryAuxCLI_RAMAL5.Value     := Table1.FieldByName('CODI').AsString;
//    qryAuxCLI_EMAIL.Value      := Table1.FieldByName('CODI').AsString;
//    qryAuxCLI_FATCPF.Value     := Table1.FieldByName('CODI').AsString;
//    qryAuxCLI_COBCPF.Value     := Table1.FieldByName('CODI').AsString;
//    qryAuxCLI_WEB.Value        := Table1.FieldByName('CODI').AsString;
//    qryAuxCLI_ATIVIDADE.Value  := Table1.FieldByName('CODI').AsString;
//    qryAuxCLI_CELULAR2.Value   := TransformaTelefone(Table1.FieldByName('CELULAR2').AsString);
//    qryAuxCLI_CELULAR3.Value   := TransformaTelefone(Table1.FieldByName('CELULAR3').AsString);
//    qryAuxCLI_CELULAR4.Value   := TransformaTelefone(Table1.FieldByName('CELULAR4').AsString);
//    qryAuxCLI_CELULAR5.Value   := TransformaTelefone(Table1.FieldByName('CELULAR5').AsString);

    pb.Progress := pb.Progress + 1;
    pb.Update;
    qryAux.Post;
    Application.ProcessMessages;
    if CancelarProcessamento then
    begin
      Label1.Caption := 'Transferência cancelada!';
      qryAux.Cancel;
      qryAux.Close;
      dm2.Database1.Rollback;
      qryAux.Open;
      pb.Progress := 0;
      Exit;
    end;
    Table1.Next;
  end;
  if dm2.Database1.InTransaction then
    dm2.Database1.Commit;
  Label1.Caption := 'Transferência completa.';
  CancelarProcessamento := True;

  qryAux.Close;
  qryAux.Open;
  btSair.SetFocus;
end;

procedure TfrmTransfTMP.BtCancelarClick(Sender: TObject);
begin
  if not CancelarProcessamento then
    if Pergunta('Cancelar processamento?') = 'S' then
      CancelarProcessamento := True;
end;

procedure TfrmTransfTMP.BtSairClick(Sender: TObject);
begin
  if CancelarProcessamento then
    Close;
end;

procedure TfrmTransfTMP.FormShow(Sender: TObject);
begin
  CancelarProcessamento := True;
end;

end.
