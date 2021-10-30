unit unAtoCofis15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, RXCtrls, ComCtrls, Buttons,
  RxLogin, DB, DBClient, ExcelExport, CheckLst, rxToolEdit;

type
  TfrmAtoCofis15 = class(TForm)
    DateEdit1: TDateEdit;
    Label1: TLabel;
    DateEdit2: TDateEdit;
    cbMestreNf: TCheckBox;
    cgGerarItens: TCheckBox;
    cbGerarPessoa: TCheckBox;
    cbGerarNatureza: TCheckBox;
    cbGerarServProd: TCheckBox;
    RxLabel1: TRxLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    BitBtn2: TBitBtn;
    BotaoSair: TBitBtn;
    ProgressBar1: TProgressBar;
    DirectoryEdit1: TDirectoryEdit;
    cbGerarSeparado: TCheckBox;
    ckOpExcelNf: TCheckBox;
    cdsNota: TClientDataSet;
    cdsNotaESPECIE: TStringField;
    cdsNotaEMISSAO: TDateField;
    cdsNotaNUMERO: TStringField;
    cdsNotaSERIE: TStringField;
    cdsNotaCADASTRO: TStringField;
    cdsNotaVALOR: TFloatField;
    cdsNotaIPI: TFloatField;
    cdsNotaISS: TFloatField;
    pnOperacaoCom: TPanel;
    Label2: TLabel;
    CheckListBoxPlan: TCheckListBox;
    btnFecharPlan: TBitBtn;
    CheckBoxPlan: TCheckBox;
    cdsNotaCFOP: TStringField;
    cdsNotaNOME: TStringField;
    cdsNotaDESCRICAO: TStringField;
    cdsNotaQUANTIDADE: TFloatField;
    cdsNotaUNITARIO: TFloatField;
    cdsNotaTIPI: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BotaoSairClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cbMestreNfClick(Sender: TObject);
    procedure btnFecharPlanClick(Sender: TObject);
    procedure ckOpExcelNfClick(Sender: TObject);
    procedure CheckListBoxPlanExit(Sender: TObject);
    procedure CheckBoxPlanExit(Sender: TObject);
    procedure btnFecharPlanExit(Sender: TObject);
    procedure CheckBoxPlanClick(Sender: TObject);
  private
    { Private declarations }
    listaPlan: TStrings;
    listaCodOper: string;
  public
    { Public declarations }
  end;

var
  frmAtoCofis15: TfrmAtoCofis15;

implementation

uses unFuncoesFiscais, unFuncoes;

{$R *.dfm}

procedure TfrmAtoCofis15.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree; 
end;

procedure TfrmAtoCofis15.BotaoSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAtoCofis15.FormShow(Sender: TObject);
begin
  DirectoryEdit1.InitialDir := ExtractFileDir(Application.ExeName);
  cdsNota.CreateDataSet;
  ckOpExcelNf.enabled := false;
  ckOpExcelNf.checked := false;
  listaPlan := TStringList.Create;
  listaCodOper := '1,7';
end;

procedure TfrmAtoCofis15.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    key := #0;
    selectNext(activeControl, true, true);
  end;
end;

procedure TfrmAtoCofis15.BitBtn2Click(Sender: TObject);
var F: TextFile;
  data1, data2: TDateTime; nome: string;
  x: integer;
  lista: TStrings;
  mens: string;
begin
  if (not DataValida(DateEdit1.text)) or (not DataValida(DateEdit2.text)) then
  begin
    mensagem('Informe um período');
    Exit;
  end;
  if (DateEdit1.date > DateEdit2.date) then
  begin
    mensagem('Informe um período válido');
    Exit;
  end;

  DirectoryEdit1.DialogText := 'Pasta destino dos arquivos';
  DirectoryEdit1.DoClick;

  if pergunta('Gerar arquivos de informações fiscais ?') <> 'S' then Exit;

  data1 := DateEdit1.date;
  data2 := DateEdit2.date;
  nome := DirectoryEdit1.Text+
          'AtoCofis15_'+
          FormatDateTime('"de"DDMMYYYY"a"', data1)+
          FormatDateTime('DDMMYYYY_', data2);

  lista := TStringList.Create;
  if (cgGerarItens.checked) or (cbGerarServProd.checked) then
    GerarProdutosServicosBureau(Lista, data1, data2);

  cdsNota.EmptyDataSet;
  try
    if not cbGerarSeparado.Checked then
    begin
      {
      AssignFile(F, nome+'Geral.txt');
      Rewrite(F);
      if cbMestreNf.checked then
        RegistroCOFIS_NFServico(F, data1, data2);
      if cgGerarItens.checked then
        RegistroCOFIS_NFItemServico(F, data1, data2, Lista);
      if cbGerarPessoa.checked then
        RegistroCOFIS_Pessoa(F, data1, data2);
      if cbGerarNatureza.checked then
        RegistroCOFIS_CFOP(F, data1, data2);
      if cbGerarServProd.checked then
        RegistroCOFIS_ServicosBureau(F, data1, data2, Lista);
      CloseFile(F);
      }
    end
    else
    begin
      if cbMestreNf.checked then
      begin
        AssignFile(F, nome+'MestreNf.txt');
        Rewrite(F);
        RegistroCOFIS_NFServico(F, data1, data2, mens, cdsNota, ckOpExcelNf.checked, listaCodOper, nome, ProgressBar1);
        CloseFile(F);
      end;
      if cgGerarItens.checked then
      begin
        AssignFile(F, nome+'Itens.txt');
        Rewrite(F);
        RegistroCOFIS_NFItemServico(F, data1, data2, Lista, ProgressBar1);
        CloseFile(F);
      end;
      if cbGerarPessoa.checked then
      begin
        AssignFile(F, nome+'Pessoa.txt');
        Rewrite(F);
        RegistroCOFIS_Pessoa(F, data1, data2, ProgressBar1);
        CloseFile(F);
      end;
      if cbGerarNatureza.checked then
      begin
        AssignFile(F, nome+'Natureza.txt');
        Rewrite(F);
        RegistroCOFIS_CFOP(F, data1, data2, ProgressBar1);
        CloseFile(F);
      end;
      if cbGerarServProd.checked then
      begin
        AssignFile(F, nome+'ServProd.txt');
        Rewrite(F);
        RegistroCOFIS_ServicosBureau(F, data1, data2, Lista, ProgressBar1);
        CloseFile(F);
      end;
    end;
  except
    on E : Exception do
    begin
      Application.MessageBox(PChar(E.Message),
                             PChar('Falha no processo! Em ''frmAtoCofis15'''),
                             MB_ICONERROR);
      CloseFile(F);
      if assigned(lista) then
        freeAndNil(lista);
    end;
  end;
  if assigned(lista) then
    freeAndNil(lista);
  mensagem('Concluído' + mens);
end;

procedure TfrmAtoCofis15.cbMestreNfClick(Sender: TObject);
begin
  ckOpExcelNf.enabled := cbMestreNf.checked;
  if (not ckOpExcelNf.enabled) then
    ckOpExcelNf.checked := false;
end;

procedure TfrmAtoCofis15.ckOpExcelNfClick(Sender: TObject);
begin
  if ckOpExcelNf.Checked then
  begin
    pnOperacaoCom.visible := true;
    pnOperacaoCom.left := ((width - pnOperacaoCom.width) div 2);
    pnOperacaoCom.top := ((height - pnOperacaoCom.height) div 2);
    PreencheOperacaoVendas(
                      CheckListBoxPlan.Items,
                      listaPlan
                        );
    CheckListBoxPlan.Checked[0] := true;
    CheckListBoxPlan.Checked[6] := true;
  end;
end;

procedure TfrmAtoCofis15.CheckListBoxPlanExit(Sender: TObject);
begin
  try CheckBoxPlan.setfocus except end;
end;

procedure TfrmAtoCofis15.CheckBoxPlanExit(Sender: TObject);
begin
  try btnFecharPlan.setfocus except end;
end;

procedure TfrmAtoCofis15.btnFecharPlanExit(Sender: TObject);
begin
  try CheckListBoxPlan.setfocus except end;
end;

procedure TfrmAtoCofis15.btnFecharPlanClick(Sender: TObject);
var i: integer;
begin
  pnOperacaoCom.visible := false;
  listaCodOper := '';
  if (not CheckBoxPlan.checked) then
  begin
    for i := 0 to CheckListBoxPlan.Items.Count - 1 do
      if CheckListBoxPlan.Checked[i] then
        if listaCodOper = '' then
          listaCodOper := chr(39) + listaPlan.Strings[i] + chr(39)
        else
          listaCodOper := listaCodOper + ',' + chr(39) + listaPlan.Strings[i] + chr(39);
  end;
end;

procedure TfrmAtoCofis15.CheckBoxPlanClick(Sender: TObject);
var i: integer;
begin
  for i := 0 to CheckListBoxPlan.Items.count - 1 do
    CheckListBoxPlan.Checked[i] := CheckBoxPlan.checked;
end;

end.
