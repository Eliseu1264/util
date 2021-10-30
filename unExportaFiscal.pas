unit unExportaFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, ExcelExport, Buttons, ExtCtrls, RXCtrls,
  CheckLst, DB, IBCustomDataSet, IBQuery, rxToolEdit, rxPlacemnt, DBClient,
  QRCtrls, QuickRpt, JvBaseDlg, JvBrowseFolder;

type
  TfrmExportaFiscal = class(TForm)
    RxLabel1: TRxLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    BitBtn2: TBitBtn;
    BotaoSair: TBitBtn;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    cbExpCliente: TCheckBox;
    CheckBoxExpNf: TCheckBox;
    pnOperacaoCom: TPanel;
    Label2: TLabel;
    CheckListBoxPlan: TCheckListBox;
    btnFecharPlan: TBitBtn;
    CheckBoxPlan: TCheckBox;
    CheckBoxTipoSel: TCheckBox;
    CheckBoxCFOPSel: TCheckBox;
    Label3: TLabel;
    pnCFOP: TPanel;
    Label4: TLabel;
    CheckListBoxCfop: TCheckListBox;
    BitBtn1: TBitBtn;
    CheckBoxCFOP: TCheckBox;
    DirectoryEdit1OLD: TDirectoryEdit;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    CheckBoxExpNSaida: TCheckBox;
    CheckBoxExpEnt: TCheckBox;
    CheckBoxExpInv: TCheckBox;
    Label5: TLabel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    CheckBoxCFOPSelEnt: TCheckBox;
    Label8: TLabel;
    Bevel3: TBevel;
    Bevel9: TBevel;
    Bevel10: TBevel;
    pnCFOPEnt: TPanel;
    Label9: TLabel;
    CheckListBoxCfopEnt: TCheckListBox;
    BitBtn3: TBitBtn;
    CheckBoxCFOPEnt: TCheckBox;
    Label10: TLabel;
    Panel1: TPanel;
    Label11: TLabel;
    BitBtn4: TBitBtn;
    mDadosGer: TMemo;
    Label16: TLabel;
    cbModelo: TComboBox;
    cbOper: TComboBox;
    Bevel11: TBevel;
    Label12: TLabel;
    cdsCli: TClientDataSet;
    cdsCliPRD: TStringField;
    cdsRel: TClientDataSet;
    cdsRelPRD2: TStringField;
    QuickRep2: TQuickRep;
    QRBand3: TQRBand;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    cdsRelINDX: TIntegerField;
    CheckBoxCTe: TCheckBox;
    DirectoryEdit1: TJvBrowseForFolderDialog;
    procedure FormShow(Sender: TObject);
    procedure btnFecharPlanClick(Sender: TObject);
    procedure CheckBoxPlanClick(Sender: TObject);
    procedure BotaoSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBoxTipoSelClick(Sender: TObject);
    procedure CheckBoxCFOPSelClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBoxCFOPClick(Sender: TObject);
    procedure CheckListBoxCfopClickCheck(Sender: TObject);
    procedure CheckListBoxPlanClickCheck(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure CheckBoxCFOPSelEntClick(Sender: TObject);
    procedure CheckBoxCFOPEntClick(Sender: TObject);
    procedure CheckListBoxCfopEntClickCheck(Sender: TObject);
    procedure CheckBoxExpInvClick(Sender: TObject);
    procedure cbExpClienteClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure insReg(lin: String);

  private
    { Private declarations }
    ns: Integer;
    listaPlan: TStrings;
    listaCfop, listaCodOper, listaCfopEnt: string;
    procedure PovoaCFOP;
    procedure ExportaCliente(var arq: TextFile; var ProgressBar: TProgressBar; filtro: string);
    procedure ExportaFaturas(var arq: TextFile; var ProgressBar: TProgressBar; filtro: string);
    procedure ExportaItensFaturas_ent(var arq: TextFile; filtro: string);
    procedure ExportaNotaSaida(var arq, Item: TextFile; var ProgressBar: TProgressBar; filtro: string);
    procedure ExportaFornecedor(var arq: TextFile; var ProgressBar: TProgressBar; filtro: string);
    procedure ExportaProdEnt(var arq: TextFile; var ProgressBar: TProgressBar; filtro, filtro2: string);
    procedure ExportaEntradas(var arq: TextFile; var ProgressBar: TProgressBar; filtro: string);
    procedure ExportaInventario(var arq: TextFile; var ProgressBar: TProgressBar; filtro: string);
    procedure ExportaConhecimentoFrete(arquivo: string;
      var ProgressBar: TProgressBar);
  public
    { Public declarations }
  end;

var
  frmExportaFiscal: TfrmExportaFiscal;
  TITULO: string = 'Exportar informações';

implementation

uses unFuncoes, unDataModule2, unFuncoesFiscais, unFiltroInventario, unRelListagemMateriaisEstoque;

{$R *.dfm}

{SOLICITACAO BUREAU 21-JAN-2010}

procedure TfrmExportaFiscal.FormShow(Sender: TObject);
begin
  DirectoryEdit1.Title := 'Pasta destino dos arquivos';
  DirectoryEdit1.Directory := gsAppPath;
  QuickRep2.Top := -2000;
  cbModelo.items.clear();
  cbModelo.items.append('Todos');
  cbModelo.items.append(getDescModeloNota('N'));
  cbModelo.items.append(getDescModeloNota('2'));
  cbModelo.items.append(getDescModeloNota('3'));
  cbModelo.items.append(getDescModeloNota('4'));
  cbModelo.items.append(getDescModeloNota('5'));
  cbModelo.items.append(getDescModeloNota('6'));
  cbModelo.items.append(getDescModeloNota('7'));
  cbModelo.items.append(getDescModeloNota('8'));
  cbModelo.items.append(getDescModeloNota('9'));

  cbModelo.itemIndex := 0;
  if (verificaParametros('101') = 'SIM') then
  begin
    cbModelo.enabled := true;
    cbOper.enabled := true;
  end
  else
  begin
    cbModelo.enabled := false;
    cbOper.enabled := false;
  end;

  listaPlan := TStringList.Create;
  PovoaCFOP;
  PreencheOperacaoVendas(
                    CheckListBoxPlan.Items,
                    listaPlan
                      );
end;

procedure TfrmExportaFiscal.btnFecharPlanClick(Sender: TObject);
var i: integer;
begin
  pnOperacaoCom.visible := false;
  listaCodOper := '';
  for i := 0 to CheckListBoxPlan.Items.Count - 1 do
    if CheckListBoxPlan.Checked[i] then
      if listaCodOper = '' then
        listaCodOper := chr(39) + listaPlan.Strings[i] + chr(39)
      else
        listaCodOper := listaCodOper + ',' + chr(39) + listaPlan.Strings[i] + chr(39);
  if (listaCodOper = '') then
    CheckBoxTipoSel.Checked := false;
end;

procedure TfrmExportaFiscal.CheckBoxPlanClick(Sender: TObject);
var i: integer;
begin
  CheckListBoxPlan.OnClickCheck := nil;
  for i := 0 to CheckListBoxPlan.Items.count - 1 do
    CheckListBoxPlan.Checked[i] := CheckBoxPlan.checked;
  CheckListBoxPlan.OnClickCheck := CheckListBoxPlanClickCheck;
end;

procedure TfrmExportaFiscal.BotaoSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmExportaFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmExportaFiscal.CheckBoxTipoSelClick(Sender: TObject);
begin
  if TCheckBox(sender).Checked then
  begin
    pnOperacaoCom.visible := true;
    pnOperacaoCom.BringToFront;
    pnOperacaoCom.Align := alClient;
    CheckBoxPlan.setfocus;
  end;
end;

procedure TfrmExportaFiscal.PovoaCFOP;
var q: TIBQuery;
begin
  q := TIBQuery.Create(Application);
  with q, q.SQL do
  begin
    Database := dm2.DataBase1;
    Add('SELECT CDF_CODIGO, CDF_DESCRICAO');
    Add('FROM CODIGOS_FISCAIS            ');
    Add('WHERE CDF_CODIGO IS NOT NULL    ');
    Add('ORDER BY CDF_CODIGO             ');
    open;
    while not Eof do
    begin
      CheckListBoxCfop.Items.Add(Fields[0].AsString+'  -  '+Fields[1].AsString);
      if Pos(Copy(Fields[0].AsString,1,1), '123') > 0 then
        CheckListBoxCfopEnt.Items.Add(Fields[0].AsString+'  -  '+Fields[1].AsString);
      Next;
    end;
  end;
end;

procedure TfrmExportaFiscal.CheckBoxCFOPSelClick(Sender: TObject);
begin
  if TCheckBox(sender).Checked then
  begin
    pnCFOP.visible := true;
    pnCFOP.BringToFront;
    pnCFOP.Align := alClient;
    CheckBoxCFOP.setfocus;
  end;
end;

procedure TfrmExportaFiscal.BitBtn1Click(Sender: TObject);
var i: integer;
begin
  pnCFOP.visible := false;
  listaCfop := '';
  for i := 0 to CheckListBoxCfop.Items.Count - 1 do
    if CheckListBoxCfop.Checked[i] then
      if listaCfop = '' then
        listaCfop := chr(39) + Copy(CheckListBoxCfop.Items.Strings[i], 1, 4) + chr(39)
      else
        listaCfop := listaCfop + ',' + chr(39) + Copy(CheckListBoxCfop.Items.Strings[i], 1, 4) + chr(39);
  if (listacfop = '') then
    CheckBoxCFOPSel.Checked := false;
end;

procedure TfrmExportaFiscal.CheckBoxCFOPClick(Sender: TObject);
var i: integer;
begin
  CheckListBoxCfop.OnClickCheck := nil;
  for i := 0 to CheckListBoxCfop.Items.count - 1 do
    CheckListBoxCfop.Checked[i] := TCheckBox(sender).checked;
  CheckListBoxCfop.OnClickCheck := CheckListBoxCfopClickCheck;
end;

procedure TfrmExportaFiscal.CheckListBoxCfopClickCheck(Sender: TObject);
var i: integer; m: boolean;
begin
  m := true;
  for i := 0 to CheckListBoxCfop.Items.count - 1 do
    if not CheckListBoxCfop.Checked[i] then
      m := false;
  CheckBoxCFOP.OnClick := nil;
  CheckBoxCFOP.Checked := m;
  CheckBoxCFOP.OnClick := CheckBoxCFOPClick;
end;

procedure TfrmExportaFiscal.CheckListBoxPlanClickCheck(Sender: TObject);
var i: integer; m: boolean;
begin
  m := true;
  for i := 0 to CheckListBoxPlan.Items.count - 1 do
    if not CheckListBoxPlan.Checked[i] then
      m := false;
  CheckBoxPlan.OnClick := nil;
  CheckBoxPlan.Checked := m;
  CheckBoxPlan.OnClick := CheckBoxPlanClick;
end;

procedure TfrmExportaFiscal.BitBtn2Click(Sender: TObject);
var filtro, filtro2, vOper: string; F, F1: TextFile;
   n: Integer;
begin
  try
    ns := 0;
    cdsCli.EmptyDataSet;

    if cbOper.ItemIndex = 0
      then vOper := ' IN '
      else vOper := ' NOT IN ';

    if (not DataValida(DateEdit1.text)) or (not DataValida(DateEdit2.text))
      and (not CheckBoxExpInv.Checked) then
        Raise Exception.Create('Informe um período');

    if (DateEdit1.date > DateEdit2.date) then
      Raise Exception.Create('Informe um período válido');

    if not CheckBoxExpInv.Checked then
    begin
      if not DirectoryEdit1.Execute then Exit;
      //DirectoryEdit1.DoClick;
      //if (gsAppPath = '') then exit;
    end;

    if not (cbExpCliente.Checked or CheckBoxExpNf.Checked or
            CheckBoxExpNSaida.Checked or CheckBoxExpEnt.Checked or
            CheckBoxExpInv.Checked or CheckBoxCTe.Checked) then
      Raise Exception.Create('Marque uma opção para exportar!');


    //Solicitação 11105 em 07/04/2015 Sousa
    if CheckBoxCTe.Checked
      then ExportaConhecimentoFrete(DirectoryEdit1.Directory+'\CONHINT.TXT', ProgressBar1);

    //CLIEINT.TXT
    if cbExpCliente.Checked then
    begin
      filtro := '';
  {
      filtro := '  AND EXISTS (                               '+#13#10
               +'    SELECT 1                                 '+#13#10
               +'    FROM FATURAS                             '+#13#10
               +'    WHERE                                    '+#13#10
               +'      FTR_CLIENTE = CLI_CODIGO               '+#13#10
               +'      AND FTR_DTEMISSAO BETWEEN '+QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit1.Date))
               +'      AND '+QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit2.Date))+#13#10
               +'      AND FTR_MINUTA <> ''M''              '+#13#10
               +'      AND FTR_CANCELADO IS NULL            '+#13#10;
  }
      filtro := '      AND CAST(FTR_DTEMISSAO AS DATE) BETWEEN '+QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit1.Date))
               +'      AND '+QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit2.Date))+#13#10
               +'      AND FTR_MINUTA <> ''M''              '+#13#10
               +'      AND FTR_CANCELADO IS NULL            '+#13#10;

      if (cbModelo.itemIndex = 0) then
        filtro := filtro + 'AND FTR_MINUTA '+vOper+ ' (''N'',''2'',''3'',''4'',''5'',''6'',''7'',''8'',''9'')'+#13#10
      else if (cbModelo.itemIndex = 1) then
        filtro := filtro + 'AND FTR_MINUTA '+vOper+' (''N'')  '+#13#10
      else
        filtro := filtro + 'AND FTR_MINUTA '+vOper+' ('+quotedStr(intToStr(cbModelo.itemIndex))+')'+#13#10;

      if (listaCodOper <> '') then
        filtro := filtro + '      AND FTR_OPER_COMERC IN ('+listaCodOper+')'+#13#10;
      if (listaCfop <> '') then
        filtro := filtro + '      AND FTR_COD_FISC IN ('+listaCfop+')'+#13#10;
  //  filtro := filtro +'  )  ';
      //
      try
        AssignFile(F, DirectoryEdit1.Directory+'\CLIEINT.TXT');
        Rewrite(F);
        ExportaCliente(F, ProgressBar1, filtro);
      finally
        CloseFile(F);
      end;
    end;
    //
    //SERVINT.TXT - Notas saida COM imposto ISS ou ICMS
    if CheckBoxExpNf.Checked then
    begin
      filtro := '';
      filtro := '  AND CAST(FTR_DTEMISSAO AS DATE) BETWEEN '+QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit1.Date))
               +'  AND '+QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit2.Date))+#13#10
  //           +'  AND ((COALESCE(FTR_ALIQ_ISS, 0)>0) OR (COALESCE(FTR_VR_ICMS,0)>0))'+#13#10
               +'  AND  COALESCE(FTR_VR_SERVICO, 0)>0   '+#13#10
               +'  AND FTR_MINUTA <> ''M''              '+#13#10;
      if (listaCodOper <> '') then
        filtro := filtro + '  AND FTR_OPER_COMERC IN ('+listaCodOper+')'+#13#10;
      if (listaCfop <> '') then
        filtro := filtro + '  AND FTR_COD_FISC IN ('+listaCfop+')'+#13#10;

      if (cbModelo.itemIndex = 0) then
        filtro := filtro + ' AND FTR_MINUTA '+vOper+ ' (''N'',''2'',''3'',''4'',''5'',''6'',''7'',''8'',''9'')'+#13#10
      else if (cbModelo.itemIndex = 1) then
        filtro := filtro + ' AND FTR_MINUTA '+vOper+' (''N'')  '+#13#10
      else
        filtro := filtro + 'AND FTR_MINUTA '+vOper+' ('+quotedStr(intToStr(cbModelo.itemIndex))+')'+#13#10;
      //
      try
        AssignFile(F, DirectoryEdit1.Directory+'\SERVINT.TXT');
        Rewrite(F);
  //    AssignFile(F1, DirectoryEdit1.Directory+'\ITEMINT.TXT');
  //    Rewrite(F1);
        ExportaFaturas(F, ProgressBar1, filtro);
      finally
        CloseFile(F);
    //  CloseFile(F1);
      end;
    end;
    //
    //FISCALS.TXT - Notas saida SEM imposto ISS ou ICMS
    if CheckBoxExpNSaida.Checked then
    begin
      filtro := '';
      filtro := '  AND CAST(FTR_DTEMISSAO AS DATE) BETWEEN '+QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit1.Date))
               +'  AND '+QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit2.Date))+#13#10
  //           +'  AND NOT ((COALESCE(FTR_ALIQ_ISS, 0)>0) OR (COALESCE(FTR_VR_ICMS,0)>0))'+#13#10;
               +'  AND  COALESCE(FTR_VALORPRODUTO, 0)>0 '+#13#10
               +'  AND FTR_MINUTA <> ''M''              '+#13#10;
      if (listaCodOper <> '') then
        filtro := filtro + '  AND FTR_OPER_COMERC IN ('+listaCodOper+')'+#13#10;
      if (listaCfop <> '') then
        filtro := filtro + '  AND FTR_COD_FISC IN ('+listaCfop+')'+#13#10;
      if (cbModelo.itemIndex = 0) then
        filtro := filtro + ' AND FTR_MINUTA '+vOper+ ' (''N'',''2'',''3'',''4'',''5'',''6'',''7'',''8'',''9'')'+#13#10
      else if (cbModelo.itemIndex = 1) then
        filtro := filtro + ' AND FTR_MINUTA '+vOper+' (''N'')  '+#13#10
      else
        filtro := filtro + 'AND FTR_MINUTA '+vOper+' ('+quotedStr(intToStr(cbModelo.itemIndex))+')'+#13#10;
      //
      try
        AssignFile(F, DirectoryEdit1.Directory+'\FISCALS.TXT');
        Rewrite(F);
        AssignFile(F1, DirectoryEdit1.Directory+'\ITEMINT.TXT');
        Rewrite(F1);
        ExportaNotaSaida(F, F1, ProgressBar1, filtro);
      finally
        CloseFile(F);
        CloseFile(F1);
      end;
    end;
    //
    //FORALM.TXT (Fornecedores que houveram entradas no periodo)
    if CheckBoxExpEnt.Checked then
    begin
      filtro := '';
      filtro := '  AND EXISTS (                               '+#13#10
               +'    SELECT 1                                 '+#13#10
               +'    FROM ENTRADAS                            '+#13#10
               +'  WHERE                                      '+#13#10
               +'        ENT_FORNECEDOR = FRN_CODIGO          '+#13#10
               +'    AND CAST(ENT_DT_ENTRADA AS DATE) BETWEEN '+QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit1.Date))
               +'    AND '+QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit2.Date))+#13#10;
      if (listaCfopEnt <> '') then
        filtro := filtro + '      AND ENT_COD_FISC IN ('+listaCfopEnt+')'+#13#10;
      filtro := filtro +'  )  ';
      //
      try
        AssignFile(F, DirectoryEdit1.Directory+'\FORALM.TXT');
        Rewrite(F);
        ExportaFornecedor(F, ProgressBar1, filtro);
      finally
        CloseFile(F);
      end;
    end;
    //
    //PRODINT.TXT (Produtos que houveram entradas no periodo)
    if CheckBoxExpEnt.Checked then
    begin
      filtro := '';
      filtro := '  AND EXISTS (                               '+#13#10
               +'    SELECT 1                                 '+#13#10
               +'    FROM ENTRADAS,                           '+#13#10
               +'         ITENS_ENTRADA                       '+#13#10
               +'  WHERE                                      '+#13#10
               +'        ENT_NOTAFISCAL = ITE_NFISCAL         '+#13#10
               +'    AND ENT_EMISSAO    = ITE_EMISSAO         '+#13#10
               +'    AND ENT_FORNECEDOR = ITE_FORNECEDOR      '+#13#10
               +'    AND MTR_CODIGO = ITE_PRODUTO             '+#13#10
               +'    AND CAST(ENT_DT_ENTRADA AS DATE) BETWEEN '+QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit1.Date))
               +'    AND '+QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit2.Date))+#13#10;
      if (listaCfopEnt <> '') then
        filtro := filtro + '      AND ENT_COD_FISC IN ('+listaCfopEnt+')'+#13#10;
      filtro := filtro +'  )  ';
      //
      filtro2 := ' AND CAST(FTR_DTEMISSAO AS DATE) BETWEEN '+QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit1.Date));
      filtro2 := filtro2 +' AND '+QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit2.Date));
      //
      try
        AssignFile(F, DirectoryEdit1.Directory+'\PRODINT.TXT');
        Rewrite(F);
        ExportaProdEnt(F, ProgressBar1, filtro, filtro2);
      finally
        CloseFile(F);
      end;
    end;
    //
    //FISCAL.TXT (Entradas do Periodo)
    if CheckBoxExpEnt.Checked then
    begin
      try
        AssignFile(F, DirectoryEdit1.Directory+'\FISCAL.TXT');
        Rewrite(F);
        ExportaEntradas(F, ProgressBar1, filtro);
      finally
        CloseFile(F);
      end;
    end;

    //
    //INVEINT.TXT (Inventario periodo)
    if CheckBoxExpInv.Checked then
    begin
      if TfrmFiltroInventario(Application.FindComponent('frmFiltroInventario')) = nil then
        frmFiltroInventario := TfrmFiltroInventario.create(application)
      else
        frmFiltroInventario.show();
    end
    else
      mensagem('Concluído!');
    //
    if Pergunta('Deseja visualizar uma listagem dos dados gerados para conferência ?') = 'S' then
      QuickRep2.Preview;
    Close;
  except
    on E: Exception do
      Application.MessageBox(PChar(E.Message),PChar(TITULO), MB_ICONWARNING);
  end;
end;

procedure TfrmExportaFiscal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    key := #0;
    selectNext(activeControl, true, true);
  end;
end;

procedure TfrmExportaFiscal.ExportaCliente(var arq: TextFile; var ProgressBar: TProgressBar; filtro: string);
var q: TIBQuery;
    reg, qtreg: integer;
begin
  // CLIENT.TXT
  // Adicionado 2 campos - código do municipio e cod.pais em 25/02/2014
//cdsFatProd.CreateDataSet;
  cdsCli.EmptyDataSet;
  q := TIBQuery.Create(Application);
  with q, q.SQL do
  begin
    Database := dm2.DataBase1;
    {
    Add('SELECT                                        ');
    Add('  CAST(NULL AS VARCHAR(6)) "CO2",             ');
    Add('  CLI_FANTASIA "EMITENTE",                    ');
    Add('  CLI_NOME "C_RAZAO2",                        ');
    Add('  CLI_ENDERECO "C_END",                       ');
    Add('  CLI_FATBAIRRO "C_BAIRRO",                   ');
    Add('  CLI_FATCIDADE "C_CIDADE",                   ');
    Add('  CLI_FATESTADO "UF",                         ');
    Add('  CLI_CEP "C_CEP",                            ');
    Add('  CAST(NULL AS VARCHAR(3)) "C_PAIS",          ');
    Add('  CLI_FONE "C_FONE1",                         ');
    Add('  CLI_FAX "C_FAX",                            ');
    Add('  CASE WHEN (CLI_PESSOA = ''J'') THEN CLI_FATCGC END "INSCCGC",');
    Add('  CASE WHEN (CLI_PESSOA = ''F'') THEN CLI_FATCPF END "C_CPF",  ');
    Add('  CLI_FATCGF "C_INCESTA",                     ');
    Add('  CAST(NULL AS VARCHAR(1)) "C_OPTSIMP",       ');
    Add('  CLI_NFE_CMUN "COD_MUN",                     ');
    Add('  COALESCE(CLI_NACAO, ''01058'') "COD_PAIS"   ');
    Add('FROM CLIENTE WHERE 1 = 1                      ');
    if (filtro <> '') then Add( filtro );
    Add('ORDER BY CLI_NOME ');
    }
    Add('SELECT DISTINCT                                                                 ');
    Add('  CAST(NULL AS VARCHAR(6)) "CO2",                                               ');
    Add('  FTR_NOME_CLIENTE "EMITENTE",                                                  ');
    Add('  CASE WHEN COALESCE(FTR_NOME_CLIENTE, '''') = '''' THEN                        ');
    Add('    (SELECT CLI_NOME FROM CLIENTE WHERE CLI_CODIGO = FTR_CLIENTE)               ');
    Add('  ELSE                                                                          ');
    Add('    FTR_NOME_CLIENTE                                                            ');
    Add('  END "EMITENTE",                                                               ');
    Add('  CASE WHEN COALESCE(FTR_NOME_CLIENTE, '''') = '''' THEN                        ');
    Add('    (SELECT CLI_NOME FROM CLIENTE WHERE CLI_CODIGO = FTR_CLIENTE)               ');
    Add('  ELSE                                                                          ');
    Add('    FTR_NOME_CLIENTE                                                            ');
    Add('  END "C_RAZAO2",                                                               ');
    Add('  FTR_END_FATU "C_END",                                                         ');
    Add('  FTR_BAI_FATU "C_BAIRRO",                                                      ');
    Add('  FTR_MUNIC_FATU "C_CIDADE",                                                    ');
    Add('  FTR_UF_FATU "UF",                                                             ');
    Add('  FTR_CEP_FATU "C_CEP",                                                         ');
    Add('  CAST(NULL AS VARCHAR(3)) "C_PAIS",                                            ');
    Add('  FTR_FONE_FATU "C_FONE1",                                                      ');
    Add('  '''' "C_FAX",                                                                 ');
    Add('  CASE WHEN COALESCE(FTR_CGC_FATU, '''')<>'''' THEN FTR_CGC_FATU END "INSCCGC", ');
    Add('  CASE WHEN COALESCE(FTR_CGC_FATU, '''')= '''' THEN FTR_CPF_FATU END "C_CPF",   ');
    Add('  FTR_CGF_FATU "C_INCESTA",                                                     ');
    Add('  CAST(NULL AS VARCHAR(1)) "C_OPTSIMP",                                         ');
    Add('  FTR_NFE_CMUN "COD_MUN",                                                       ');
    Add('  ''01058'' "COD_PAIS"                                                          ');
    Add('FROM FATURAS WHERE 1 = 1                                                        ');
    if (filtro <> '') then Add( filtro );
    Add('ORDER BY FTR_NOME_CLIENTE ');
    open;
    ProgressBar.visible := true;
    reg := 0; contaRegistros(q, qtReg);

    insReg('>> CLIENTES (CLIEINT.TXT)');
    insReg('   --------');
    insReg('   Nome                                     CGC/CPF');
    while not Eof do
    begin
      if not (cdsCli.Locate('PRD', FieldByName('INSCCGC').asstring+FieldByName('C_CPF').asstring, [])) then
      begin
        cdsCli.Insert;
        cdsCliPRD.AsString := FieldByName('INSCCGC').asstring;
        cdsCli.Post;
      end
      else
      begin
        next;
        continue;
      end;

      insReg('   '+Format('%-40.40s', [iif(FieldByName('EMITENTE').asstring<>'', FieldByName('EMITENTE').asstring,FieldByName('C_RAZAO2').asstring)])+' '+iif(FieldByName('INSCCGC').AsString<>'', FieldByName('INSCCGC').AsString, FieldByName('C_CPF').asstring));
      Writeln(arq, Format('%-6.6s',   [FieldByName('CO2').asstring])
                  +Format('%-40.40s', [iif(FieldByName('EMITENTE').asstring<>'', FieldByName('EMITENTE').asstring, FieldByName('C_RAZAO2').asstring)])
                  +Format('%-40.40s', [iif(FieldByName('C_RAZAO2').asstring<>'', FieldByName('C_RAZAO2').asstring, FieldByName('EMITENTE').asstring)])
                  +Format('%-35.35s', [FieldByName('C_END').asstring])
                  +Format('%-15.15s', [FieldByName('C_BAIRRO').asstring])
                  +Format('%-20.20s', [FieldByName('C_CIDADE').asstring])
                  +Format('%-2.2s',   [FieldByName('UF').asstring])
                  +Format('%-8.8s',   [SoNumeros(FieldByName('C_CEP').asstring)])
                  +Format('%-3.3s',   [FieldByName('C_PAIS').asstring])
                  +Format('%-10.10s', [SoNumeros(FieldByName('C_FONE1').asstring)])
                  +Format('%-10.10s', [SoNumeros(FieldByName('C_FAX').asstring)])
                  +Format('%-14.14s', [SoNumeros(FieldByName('INSCCGC').asstring)])
                  +Format('%-11.11s', [SoNumeros(FieldByName('C_CPF').asstring)])
                  +Format('%-20.20s', [SoNumeros(FieldByName('C_INCESTA').asstring)])
                  +Format('%-1.1s',   [FieldByName('C_OPTSIMP').asstring])
                  +Format('%-7.7s',   [FieldByName('COD_MUN').asstring])
                  +Format('%-5.5s',   [FieldByName('COD_PAIS').asstring])
      );
      inc(reg); ProgressBar.Position := Round((reg/qtReg)*100);
      Application.ProcessMessages;
      Next;
    end;
    insReg('   Total: '+IntTostr(reg)+' cliente(s)');
    insReg('  ');
    ProgressBar.visible := false;
  end;
  FreeAndNil(q);
end;

procedure TfrmExportaFiscal.ExportaFornecedor(var arq: TextFile; var ProgressBar: TProgressBar; filtro: string);
var q: TIBQuery;
    reg, qtreg: integer;
begin
  // FORALM.TXT (Fornecedores que houveram entradas no periodo)
  q := TIBQuery.Create(Application);
  with q, q.SQL do
  begin
    Database := dm2.DataBase1;
    Add('SELECT                                        ');
    Add('  CAST(NULL AS VARCHAR(6)) "CO2",             ');
    Add('  FRN_NOME "EMITENTE",                        ');
    Add('  FRN_FANTASIA "F_RAZAO2",                    ');
    Add('  FRN_ENDERECO "F_END",                       ');
    Add('  FRN_BAIRRO "F_BAIRRO",                      ');
    Add('  FRN_CIDADE "F_CIDADE",                      ');
    Add('  FRN_ESTADO "UF",                            ');
    Add('  FRN_CEP "F_CEP",                            ');
    Add('  FRN_FONE "F_FONE1",                         ');
    Add('  FRN_FAX "F_FONE2",                          ');
    Add('  CAST(NULL AS VARCHAR(12)) "F_TELEX",        ');
    Add('  CASE WHEN (FRN_PESSOAL = ''J'') THEN FRN_CGC END "INSCCGC",');
    Add('  FRN_CGF "INSCESTA",                         ');
    Add('  FRN_CONTATO1 "F_CONTATO",                   ');
    Add('  FRN_FONE1 "F_FAX",                          ');
    Add('  FRN_CONTA_FORTTS "F_CCONT",                 ');
    Add('  CASE WHEN (FRN_PESSOAL = ''J'') THEN FRN_CGC END "F_CGCPAG",');
    Add('  FRN_CGF "F_INSPAG",                         ');
    Add('  FRN_ENDERECO "F_ENDPAG",                    ');
    Add('  FRN_BAIRRO "F_BAIPAG",                      ');
    Add('  FRN_CIDADE "F_CIDPAG",                      ');
    Add('  FRN_ESTADO "F_UFPAG",                       ');
    Add('  FRN_CEP "F_CEPPAG",                         ');
    Add('  FRN_FONE "F_FONEPAG",                       ');
    Add('  FRN_DT_CADASTRO "F_DTINC",                  ');
    Add('  FRN_CPF "F_CPF",                            ');
    Add('  FRN_ESTADO "F_REGIAO",                      ');
    Add('  CAST(NULL AS VARCHAR(5)) "F_NUMERO",        ');
    Add('  CAST(NULL AS VARCHAR(22)) "F_COMPLEM",      ');
    Add('  CASE WHEN FRN_COD_PAIS = ''01600'' THEN     ');
    Add('    ''CHN''                                   ');
    Add('  ELSE                                        ');
    Add('    ''   ''                                   ');
    Add('  END "F_PAIS",                               ');
    Add('  FRN_NFE_CMUN "F_CODIBGE",                   ');
    Add('  CASE WHEN COALESCE(FRN_COD_PAIS,'''') = '''' THEN              ');
    Add('    ''     ''                                                    ');
    Add('  ELSE CASE WHEN COALESCE(FRN_COD_PAIS,'''') = ''01058'' THEN    ');
    Add('    ''     ''                                                    ');
    Add('  ELSE                                                           ');
    Add('    FRN_COD_PAIS                                                 ');
    Add('  END END "F_CODPAIS"                                            ');
    Add('FROM FORNECEDORES WHERE 1 = 1                                    ');
    if (filtro <> '') then Add( filtro );
    Add('ORDER BY FRN_NOME ');
    open;
    ProgressBar.visible := true;
    reg := 0; contaRegistros(q, qtReg);
    insReg('>> FORNECEDORES (FORALM.TXT)');
    insReg('   ------------');
    while not Eof do
    begin
      insReg('   '+FieldByName('EMITENTE').asstring);
      Writeln(arq, Format('%-6.6s',   [FieldByName('CO2').asstring])
                  +Format('%-40.40s', [FieldByName('EMITENTE').asstring])
                  +Format('%-40.40s', [FieldByName('F_RAZAO2').asstring])
                  +Format('%-35.35s', [FieldByName('F_END').asstring])
                  +Format('%-15.15s', [FieldByName('F_BAIRRO').asstring])
                  +Format('%-15.15s', [FieldByName('F_CIDADE').asstring])
                  +Format('%-2.2s',   [FieldByName('UF').asstring])
                  +Format('%-8.8s',   [SoNumeros(FieldByName('F_CEP').asstring)])
                  +Format('%-10.10s', [SoNumeros(FieldByName('F_FONE1').asstring)])
                  +Format('%-10.10s', [SoNumeros(FieldByName('F_FONE2').asstring)])
                  +Format('%-10.10s', [SoNumeros(FieldByName('F_TELEX').asstring)])
                  +Format('%-14.14s', [SoNumeros(FieldByName('INSCCGC').asstring)])
                  +Format('%-20.20s', [SoNumeros(FieldByName('INSCESTA').asstring)])
                  +Format('%-28.28s', [FieldByName('F_CONTATO').asstring])
                  +Format('%-10.10s', [SoNumeros(FieldByName('F_FAX').asstring)])
                  +Format('%-6.6s',   [FieldByName('F_CCONT').asstring])
                  +Format('%-14.14s', [SoNumeros(FieldByName('F_CGCPAG').asstring)])
                  +Format('%-20.20s', [SoNumeros(FieldByName('F_INSPAG').asstring)])
                  +Format('%-35.35s', [FieldByName('F_ENDPAG').asstring])
                  +Format('%-15.15s', [FieldByName('F_BAIPAG').asstring])
                  +Format('%-15.15s', [FieldByName('F_CIDPAG').asstring])
                  +Format('%-2.2s',   [FieldByName('F_UFPAG').asstring])
                  +Format('%-8.8s',   [SoNumeros(FieldByName('F_CEPPAG').asstring)])
                  +Format('%-10.10s', [SoNumeros(FieldByName('F_FONEPAG').asstring)])
                  +iif(FieldByName('F_DTINC').IsNull, Format('%-8.8s', ['']),  Format('%-8.8s',   [FormatDateTime('DDMMYYYY', FieldByName('F_DTINC').asdatetime)]))
                  +Format('%-11.11s', [SoNumeros(FieldByName('F_CPF').asstring)])
                  +Format('%-1.1s',   [RetornaRegiao(FieldByName('F_REGIAO').asstring, '1')])
                  +Format('%-5.5s',   [FieldByName('F_NUMERO').asstring])
                  +Format('%-22.22s', [FieldByName('F_COMPLEM').asstring])
                  +Format('%-3.3s',   [FieldByName('F_PAIS').asstring])
                  +Format('%-7.7s',   [FieldByName('F_CODIBGE').asstring])
                  +Format('%-5.5s',   [FieldByName('F_CODPAIS').asstring])
      );
      inc(reg); ProgressBar.Position := Round((reg/qtReg)*100);
      Application.ProcessMessages;
      Next;
    end;
    insReg('   Total: '+IntTostr(reg)+' fornecedor(es)');
    insReg(' ');

    ProgressBar.visible := false;
  end;
  FreeAndNil(q);
end;

procedure TfrmExportaFiscal.ExportaFaturas(var arq: TextFile; var ProgressBar: TProgressBar; filtro: string);
var q: TIBQuery;
    reg, qtreg: integer;
    vSimples: String;
    vr, vrc, imp: Double;
begin
  if Par325_Simples_Nac('') then
    vSimples := 'S'
  else
    vSimples := 'N';
  // SERVINT.TXT
  vr:=0; vrc:=0; imp:=0;
  q := TIBQuery.Create(Application);
  with q, q.SQL do
  begin
    Database := dm2.DataBase1;
    Add('SELECT                                                           ');
    Add('  ''NFS'' "ESPECIE",                                             ');
    Add('  FTR_NOTAFISCAL,                                                ');
    Add('  FTR_MINUTA,                                                    ');
    Add('CASE WHEN ((COALESCE(SUBSTRING(FTR_SERIE_NFE FROM 2 FOR 4),''''))='''') OR (TRIM(FTR_SERIE_NFE)=''0000'') THEN ');
    Add('     CAST('''' AS VARCHAR(3))                                                                                 ');
    Add('  ELSE                                                                                                        ');
    Add('     CAST(SUBSTRING(FTR_SERIE_NFE FROM 2 FOR 4) AS VARCHAR(3))                                                ');
    Add('  END "SERIE",                                                                                                ');
    Add('  FTR_NOTAFISCAL "NUMERO",                                       ');
    Add('  FTR_DTEMISSAO "DIA",                                           ');
    Add('  FTR_VRNOTA "CONTABIL",                                         ');
    Add('  FTR_VALOR_ISS "ISS",                                           ');
    Add('  FTR_ALIQ_ISS "ALIQUOTA",                                       ');
    Add('  NULL "OBS",                                                    ');
    Add('  0 "IRF",                                                       ');
    Add('  0 "RECISNTRI",                                                 ');
    Add('  0 "DEDUCOES",                                                  ');
    Add('  NULL "CODCLI",                                                 ');
    Add('  NULL "ASSINATURA",                                             ');
    Add('  CASE WHEN (COALESCE(FTR_NF_CONSUMIDOR,'''') <> '''') THEN CASE WHEN (COALESCE(FTR_FORM_FINAL,'''') <> '''') THEN FTR_FORM_FINAL ELSE FTR_NOTAFISCAL END ELSE ''000000'' END "NUMEROB",');
    Add('  CASE WHEN (COALESCE(FTR_PAG1, 0) = 0) THEN ''*'' ELSE '' '' END "AVISTA", ');
    Add('  CASE WHEN (COALESCE(FTR_PAG1, 0) > 0) THEN ''*'' ELSE '' '' END "APRAZO", ');
    Add('  0 "ISSFONTE",                                                  ');
    Add('  FTR_CLIENTE,                                                   ');
    Add('  CASE WHEN ((SELECT PCG_CAMPO FROM PARAMETROS_CONFIGURACAO WHERE PCG_CODIGO = ''002'')<>FTR_CLIENTE) THEN FTR_CPF_FATU END "CPF",');
    Add('  CASE WHEN ((SELECT PCG_CAMPO FROM PARAMETROS_CONFIGURACAO WHERE PCG_CODIGO = ''002'')<>FTR_CLIENTE) THEN FTR_CGC_FATU END "CGC",');
    Add('  CASE WHEN (FTR_CANCELADO IS NULL) THEN ''N'' ELSE ''S'' END "CANCEL",');
    Add('  NULL "CCUSTO",                                                 ');
    Add('  CASE WHEN (SUBSTRING(FTR_COD_FISC FROM 1 FOR 1) IN (''1'',''2'')) THEN ''N'' END "TIPO",');
    Add('  0 "VLSECUCOC",                                                 ');
    Add('  FTR_MUNIC_FATU "CIDADE",                                       ');
    Add('  FTR_UF_FATU "UF",                                              ');
    Add('  CAST(0 AS DOUBLE PRECISION) "COFINS",                          ');
    Add('  CAST(0 AS DOUBLE PRECISION) "PIS",                             ');
    Add('  CAST(0 AS DOUBLE PRECISION) "CSLL",                            ');
    Add('  NULL "DEDCOFINS",                                              ');
    Add('  NULL "DEDPIS",                                                 ');
    Add('  NULL "DEDCSLL",                                                ');
    Add('  NULL "C_ANEXO",                                                ');
    Add('  NULL "C_COFINS",                                               ');
    Add('  NULL "C_PISPASEP",                                             ');
    Add('  NULL "C_ICMS",                                                 ');
    Add('  NULL "C_IPI",                                                  ');
    Add('  NULL "C_ISS",                                                  ');
    Add('  ''S'' "GERALANC"                                               ');
    Add('FROM FATURAS WHERE 1 = 1                                         ');
    if (filtro <> '') then Add( filtro );
    Add('ORDER BY FTR_NOTAFISCAL');
    open;
    ProgressBar.visible := true;
    reg := 0; contaRegistros(q, qtReg);
    vr := 0;
    vrc := 0;
    insReg('>> NOTAS DE SERVIÇO (SERVINT.TXT)');
    insReg('   ----------------');
    insReg('   Nr.Nota   Emissão      Cod.Cli.   Vr.contabil       Aliq.  Vr.imposto');
    while not Eof do
    begin
      insReg('   '+FieldByName('NUMERO').asstring+'    '+FormatDateTime('DD/MM/YYYY', FieldByName('DIA').AsDateTime)+'   '+FieldByName('FTR_CLIENTE').asstring+'      '+Preenche(FormatFloat(',0.00', FieldByName('CONTABIL').AsFloat),10,' ',tpE)+' '+Preenche(FormatFloat(',0.00', FieldByName('ALIQUOTA').AsFloat),10,' ',tpE)+'   '+Preenche(FormatFloat(',0.00', FieldByName('ISS').AsFloat),10,' ',tpE)+' '+iif(FieldByName('CANCEL').asstring='S','Canc.',''));
      Writeln(arq, Format('%-3.3s',   [FieldByName('ESPECIE').asstring])
                  +Format('%-3.3s',   [iif(FieldByName('SERIE').asstring='','', FieldByName('SERIE').asstring)])
                  +Format('%-10.10s', [ZerosEsq(SoNumeros(FieldByName('NUMERO').asstring), 10)])
                  +Format('%-8.8s',   [FormatDateTime('DDMMYYYY', FieldByName('DIA').AsDateTime)])
                  +FormataValorComPontoDecimal(FieldByName('CONTABIL').AsFloat, 12,2)
                  +FormataValorComPontoDecimal(FieldByName('ISS').AsFloat,12,2)
                  +Format('%-2.2s',   [FormatCurr(Repl('0', 2), FieldByName('ALIQUOTA').AsFloat*100)])
                  +Format('%-70.70s', [FieldByName('OBS').asstring])
                  +FormataValorComPontoDecimal(FieldByName('IRF').AsFloat,12,2)
                  +FormataValorComPontoDecimal(FieldByName('RECISNTRI').AsFloat,12,2)
                  +FormataValorComPontoDecimal(FieldByName('DEDUCOES').AsFloat,12,2)
                  +Format('%-6.6s',   [FieldByName('CODCLI').asstring])
                  +Format('%-15.15s', ['']) //ASSINATURA
                  +Format('%-6.6s',   [FormatCurr(Repl('0', 6), FieldByName('NUMEROB').AsFloat)])
                  +Format('%-1.1s',   [FieldByName('AVISTA').asstring])
                  +iif(FieldByName('AVISTA').asstring='*', ' ', Format('%-1.1s',   [FieldByName('APRAZO').asstring]))
                  +FormataValorComPontoDecimal(FieldByName('ISSFONTE').AsFloat,12,2)
                  +Format('%-1.1s',   [FieldByName('GERALANC').asstring])
                  +Format('%-11.11s', [FieldByName('CPF').asstring])
                  +Format('%-14.14s', [FieldByName('CGC').asstring])
                  +Format('%-1.1s',   [FieldByName('CANCEL').asstring])
                  +Format('%-9.9s',   [FieldByName('CCUSTO').asstring])
                  +Format('%-1.1s',   [FieldByName('TIPO').asstring])
                  +FormataValorComPontoDecimal(FieldByName('VLSECUCOC').AsFloat,12,2)
                  +Format('%-20.20s', [FieldByName('CIDADE').asstring])
                  +Format('%-2.2s',   [FieldByName('UF').asstring])
                  +FormataValorComPontoDecimal(FieldByName('COFINS').AsFloat,12,2)
                  +FormataValorComPontoDecimal(FieldByName('PIS').AsFloat,12,2)
                  +FormataValorComPontoDecimal(FieldByName('CSLL').AsFloat,12,2)
                  +Format('%-1.1s',   [FieldByName('DEDCOFINS').asstring])
                  +Format('%-1.1s',   [FieldByName('DEDPIS').asstring])
                  +Format('%-1.1s',   [FieldByName('DEDCSLL').asstring])
                  +iif(vSimples='N','', Format('%-3.3s', [FieldByName('C_ANEXO').asstring]))
                  +iif(vSimples='N','', Format('%-1.1s', [FieldByName('C_COFINS').asstring]))
                  +iif(vSimples='N','', Format('%-1.1s', [FieldByName('C_PISPASEP').asstring]))
                  +iif(vSimples='N','', Format('%-1.1s', [FieldByName('C_ICMS').asstring]))
                  +iif(vSimples='N','', Format('%-1.1s', [FieldByName('C_IPI').asstring]))
                  +iif(vSimples='N','', Format('%-1.1s', [FieldByName('C_ISS').asstring]))
          );
      inc(reg); ProgressBar.Position := Round((reg/qtReg)*100);
      if FieldByName('CANCEL').AsString = 'S' then
        vrc := vrc + FieldByName('CONTABIL').AsFloat
      else
      begin
        vr := vr + FieldByName('CONTABIL').AsFloat;
        imp := imp + FieldByName('ISS').AsFloat;
      end;
      Application.ProcessMessages;
      Next;
    end;
    insReg(' > Total: '+IntTostr(reg)+' nota(s) de serviço');
    insReg('          Valor NF ativas: '+FormatFloat(',0.00', vr));
    insReg('          Valor imposto..: '+FormatFloat(',0.00', imp));
    insReg('          Valor NF Canc..: '+FormatFloat(',0.00', vrc));
    insReg(' ');
    insReg(' ');
    ProgressBar.visible := false;
  end;
  FreeAndNil(q);
end;

procedure TfrmExportaFiscal.ExportaNotaSaida(var arq, Item: TextFile; var ProgressBar: TProgressBar; filtro: string);
var q: TIBQuery; seq: integer;
   vCpf: String;
   vr, vre, vrc, impV, impE: Double;
begin
  // FISCALS.TXT
  // Adicionado campo 67 - emissao da nf em 25/02/2014
  vr:=0; vre:=0; vrc:=0;
  impV := 0; impE := 0;

  q := TIBQuery.Create(Application);
  with q, q.SQL do
  begin
    Database := dm2.DataBase1;
    Add('SELECT                                                                   ');
    Add('  FTR_NOTAFISCAL,                                                        ');
    Add('  FTR_MINUTA,                                                            ');
    Add('  CASE WHEN COALESCE(FTR_CHAVE_NFE, '''') <> '''' THEN                   ');
    Add('     CAST(''NFE'' AS VARCHAR(3))                                         ');
    Add('  ELSE                                                                   ');
    Add('     CAST(''NF'' AS VARCHAR(3))                                          ');
    Add('  END "ESPECIE",                                                         ');
    Add('CASE WHEN ((COALESCE(SUBSTRING(FTR_SERIE_NFE FROM 2 FOR 4),''''))='''') OR (TRIM(FTR_SERIE_NFE)=''0000'') THEN ');
    Add('     CAST(''1'' AS VARCHAR(3))                                                                                ');
    Add('  ELSE                                                                                                        ');
    Add('     CAST(''1'' AS VARCHAR(3))                                                                                ');
//  Add('     CAST(SUBSTRING(FTR_SERIE_NFE FROM 2 FOR 4) AS VARCHAR(3))                                                ');
    Add('  END "SERIE",                                                                                                ');
    Add('  CASE WHEN (FTR_CUPOM IS NOT NULL) THEN FTR_CUPOM ELSE CASE WHEN (FTR_NF_CONSUMIDOR IS NOT NULL) THEN FTR_NF_CONSUMIDOR ELSE F.FTR_NOTAFISCAL END END "NUMERO",');
    Add('  FTR_DTEMISSAO "EMISSAO",                                               ');
    Add('  CASE WHEN (FTR_DTSAIDA IS NOT NULL) THEN FTR_DTSAIDA ELSE FTR_DTEMISSAO END "SAIDA", ');
    Add('  FTR_VRNOTA "CONTABIL",                                                 ');
    Add('  FTR_COD_FISC "CFOP",                                                   ');
//  Add('  FTR_VRNOTA "BASE",                                                     ');
    Add('  FTR_BASEICMS "BASE",                                                   ');
//  Add('  CASE WHEN COALESCE(FTR_VRNOTA,0)>0 THEN FTR_VR_ICMS/FTR_VRNOTA*100 ELSE 0 END "ALIQUOTA",');
    Add('  CASE WHEN COALESCE(FTR_BASEICMS,0)>0 THEN FTR_VR_ICMS/FTR_BASEICMS*100 ELSE 0 END "ALIQUOTA",');
    Add('  FTR_VR_ICMS "ICMS",                                                    ');
    Add('  CAST(0 AS DOUBLE PRECISION) "SUBSTITUTO",                              ');
    Add('  CAST(0 AS DOUBLE PRECISION) "ISENTAS",                                 ');
    Add('  F.FTR_UF_FATU "UF",                                                    ');
    Add('  CAST(0 AS DOUBLE PRECISION) "OUTRAS",                                  ');
    Add('  SUBSTRING(F.FTR_MUNIC_FATU FROM 1 FOR 20) "CIDADE",                    ');
    Add('  CAST(NULL AS VARCHAR(135)) "OBS",                                                            ');
    Add('  CAST(0 AS DOUBLE PRECISION)  "BASEIPI",                                ');
    Add('  CAST(0 AS DOUBLE PRECISION) "ALIQIPI",                                 ');
    Add('  CAST(0 AS DOUBLE PRECISION) "IPI",                                     ');
    Add('  CAST(0 AS DOUBLE PRECISION) "IPISENTO",                                ');
    Add('  CAST(0 AS DOUBLE PRECISION) "IPIOUTRAS",                               ');
    Add('  CAST(0 AS DOUBLE PRECISION) "BASESUBST",                               ');
    Add('  CAST(NULL AS VARCHAR(6)) "CODCLI",                                                         ');
    Add('  CASE WHEN (COALESCE(FTR_PAG1, 0) = 0) THEN ''*'' ELSE '' '' END "AVISTA", ');
    Add('  CASE WHEN (COALESCE(FTR_PAG1, 0) > 0) THEN ''*'' ELSE '' '' END "APRAZO", ');
    Add('  CASE WHEN (COALESCE(FTR_NF_CONSUMIDOR,'''') <> '''') THEN CASE WHEN (COALESCE(FTR_FORM_FINAL,'''') <> '''') THEN FTR_FORM_FINAL ELSE FTR_NOTAFISCAL END ELSE ''000000'' END "NUMEROB",');
    Add('  ''S'' "GERALANC",                                                      ');
    Add('  CASE WHEN (SELECT PCG_CAMPO FROM PARAMETROS_CONFIGURACAO WHERE PCG_CODIGO = ''002'')<>FTR_CLIENTE THEN FTR_CPF_FATU ELSE '''' END "CPF",');
    Add('  CASE WHEN (SELECT PCG_CAMPO FROM PARAMETROS_CONFIGURACAO WHERE PCG_CODIGO = ''002'')<>FTR_CLIENTE THEN FTR_CGC_FATU ELSE '''' END "CGC",');
    Add('  CAST(NULL AS VARCHAR(15)) "ASSINATURA",                                                     ');
    Add('  CAST(NULL AS VARCHAR(9)) "CCUSTO",                                                          ');
    Add('  CASE WHEN (F.FTR_CANCELADO IS NULL) THEN ''N'' ELSE ''S'' END "CANCEL",');
    Add('  CASE WHEN COALESCE(FTR_CHAVE_NFE, '''') <> '''' THEN                   ');
    Add('     ''55''                                                              ');
    Add('  ELSE                                                                   ');
    Add('     ''01''                                                              ');
    Add('  END "MODELO",                                                          ');
    Add('  CAST(NULL AS VARCHAR(3)) "PAIS",                                                           ');
    Add('  CAST(0 AS DOUBLE PRECISION) "ECNRSM",                                  ');
    Add('  CAST(NULL AS VARCHAR(1)) "CIFFOB",                                                         ');
    Add('  CAST(NULL AS VARCHAR(3)) "NMR",                                                            ');
    Add('  CAST(NULL AS VARCHAR(6)) "REM_DEST",                                                       ');
    Add('  CAST(NULL AS VARCHAR(6)) "C_CONTA",                                                        ');
    Add('  CAST(NULL AS VARCHAR(3)) "C_HISTOR",                                                       ');
    Add('  CAST(NULL AS VARCHAR(1)) "ICMFONDB",                                                       ');
    Add('  CAST(NULL AS VARCHAR(1)) "C_CLASCONS",                                                     ');
    Add('  CAST(NULL AS VARCHAR(6)) "C_CTACLI",                                                       ');
    Add('  CAST(NULL AS VARCHAR(3)) "C_HISCLI",                                                       ');
    Add('  CAST(NULL AS VARCHAR(14)) "CGC_DEST",                                                       ');
    Add('  CAST(NULL AS VARCHAR(11)) "CPF_DEST",                                                       ');
    Add('  ''   '' "C_ANEXO",                                                     ');
    Add('  CAST(NULL AS VARCHAR(1)) "C_COFINS",                                                      ');
    Add('  CAST(NULL AS VARCHAR(1)) "C_PISPASEP",                                                    ');
    Add('  CAST(NULL AS VARCHAR(1)) "C_ICMS",                                                        ');
    Add('  CAST(NULL AS VARCHAR(1)) "C_IPI",                                                         ');
    Add('  CAST(NULL AS VARCHAR(1)) "C_ISS",                                                         ');
    Add('  FTR_PLACA_VEIC "PLACVEI",                                              ');
    Add('  FTR_UF_PLACA "UFVEI",                                                  ');
    Add('  COALESCE(FTR_QTDE_VOLUME,0) "QTDVOLUME",                               ');
    Add('  COALESCE(FTR_PESOBRUTO,0) "PESOBRU",                                   ');
    Add('  COALESCE(FTR_PESOLIQUIDO,0) "PESOLIQ",                                 ');
    Add('  CAST(NULL AS VARCHAR(30)) "NOMEMOT",                                                        ');
    Add('  CAST(NULL AS VARCHAR(11)) "CPFMOT",                                                         ');
    Add('  CAST(FTR_NFE_CSTAT AS VARCHAR(10)) "CODAUT",                           ');
    Add('  CAST(NULL AS VARCHAR(8)) "NRPASSE",                                                        ');
    Add('  CAST(FTR_HORASAIDA AS VARCHAR(6))  "HORASAI",                          ');
    Add('  CAST(0 AS DOUBLE PRECISION)  "TEMPERA",                                ');
    Add('  CAST(NULL AS VARCHAR(1)) "INDICADOR",                                                      ');
    Add('  CAST(NULL AS VARCHAR(1)) "VEICTRANS",                                                      ');
    Add('  CAST(NULL AS VARCHAR(15)) "NRDESPACHO",                                                     ');
    Add('  FTR_CHAVE_NFE "CHAVENFE"                                               ');
    Add('FROM FATURAS F                                                           ');
    Add('WHERE 1 = 1                                                              ');
    Add('AND F.FTR_MINUTA <> ''M''                                                ');
    if (filtro <> '') then Add( filtro );
    Add('ORDER BY FTR_NOTAFISCAL                                   ');
    open;
    seq := 1;
    insReg('>> NOTAS DE PRODUTOS (FISCALS.TXT)');
    insReg('   -----------------');
//  insReg('   Nr.Nota   Emissão        Vr.contabil     Aliq.   Vr.Imposto');
    insReg('   Nr.Nota   Emissão        Vr.contabil     Base Calc.    Aliq.    Vr.Imposto   CFOP');
    while not Eof do
    begin
      if Pos(Copy(FieldByName('CFOP').AsString,1,1), '1-2-3') > 0 then
      begin
        insReg('   '+FieldByName('NUMERO').asstring+
               '    '+FormatDateTime('DD/MM/YYYY', FieldByName('EMISSAO').AsDateTime)+
               '      '+Preenche(FormatFloat(',0.00', FieldByName('CONTABIL').AsFloat),10,' ',tpE)+
               '    '+Preenche(FormatFloat(',0.00', FieldByName('BASE').AsFloat),10,' ',tpE)+
               Preenche(FormatFloat(',0.00', FieldByName('ALIQUOTA').AsFloat),10,' ',tpE)+
               '   '+Preenche(FormatFloat(',0.00', FieldByName('ICMS').AsFloat),10,' ',tpE)+
               '   '+Copy(FieldByName('CFOP').AsString,1,1)+'.'+Copy(FieldByName('CFOP').AsString,2,3)+
               ' '+iif(FieldByName('CANCEL').asstring='S','Canc.','Dev.'))
      end
      else
      begin
        insReg('   '+FieldByName('NUMERO').asstring+
               '    '+FormatDateTime('DD/MM/YYYY', FieldByName('EMISSAO').AsDateTime)+
               '      '+Preenche(FormatFloat(',0.00', FieldByName('CONTABIL').AsFloat),10,' ',tpE)+
               '    '+Preenche(FormatFloat(',0.00', FieldByName('BASE').AsFloat),10,' ',tpE)+
               Preenche(FormatFloat(',0.00', FieldByName('ALIQUOTA').AsFloat),10,' ',tpE)+
               '   '+Preenche(FormatFloat(',0.00', FieldByName('ICMS').AsFloat),10,' ',tpE)+
               '   '+Copy(FieldByName('CFOP').AsString,1,1)+'.'+Copy(FieldByName('CFOP').AsString,2,3)+
               ' '+iif(FieldByName('CANCEL').asstring='S','Canc.',''));
      end;
      Writeln(arq, Format('%-3.3s',   [FieldByName('ESPECIE').asstring])
                  +Format('%-3.3s',   [iif(FieldByName('SERIE').asstring='000','1', FieldByName('SERIE').asstring)])
                  +Format('%-6.6s',   [FieldByName('NUMERO').asstring])
                  +Format('%-8.8s',   [FormatDateTime('DDMMYYYY', FieldByName('SAIDA').asdatetime)])
                  +FormataValorComPontoDecimal(FieldByName('CONTABIL').AsFloat,13,2)
                  +Copy(FieldByName('CFOP').AsString,1,1)+'.'+Copy(FieldByName('CFOP').AsString,2,3)
                  +FormataValorComPontoDecimal(FieldByName('BASE').AsFloat,13,2)
                  +FormataValorComPontoDecimal(FieldByName('ALIQUOTA').AsFloat,5,2)
                  +FormataValorComPontoDecimal(FieldByName('ICMS').AsFloat,12,2)
                  +FormataValorComPontoDecimal(FieldByName('SUBSTITUTO').AsFloat,12,2)
                  +FormataValorComPontoDecimal(FieldByName('ISENTAS').AsFloat,13,2)
                  +Format('%-2.2s',   [FieldByName('UF').asstring])
                  +FormataValorComPontoDecimal(FieldByName('OUTRAS').AsFloat,12,2)
                  +Format('%-20.20s',   [FieldByName('CIDADE').asstring])
                  +Format('%-135.135s', [FieldByName('OBS').asstring])
                  +FormataValorComPontoDecimal(FieldByName('BASEIPI').AsFloat,14,2)
                  +Format('%-2.2s',   [FormatCurr(Repl('0', 2), FieldByName('ALIQIPI').AsFloat*100)])
                  +FormataValorComPontoDecimal(FieldByName('IPI').AsFloat,13,2)
                  +FormataValorComPontoDecimal(FieldByName('IPISENTO').AsFloat,14,2)
                  +FormataValorComPontoDecimal(FieldByName('IPIOUTRAS').AsFloat,14,2)
                  +Format('%-13.13s', [FormataValorComPontoDecimal(FieldByName('BASESUBST').AsFloat,13,2)])
                  +Format('%-6.6s',   [FieldByName('CODCLI').asstring])
                  +Format('%-1.1s',   [FieldByName('AVISTA').asstring])
                  +iif(FieldByName('AVISTA').asstring='*', ' ',  Format('%-1.1s',   [FieldByName('APRAZO').asstring]))
                  +Format('%-6.6s',   [FormatCurr(Repl('0', 6), FieldByName('NUMEROB').AsFloat)])
                  +Format('%-1.1s',   [FieldByName('GERALANC').asstring])
                  +Format('%-11.11s', [FieldByName('CPF').asstring])
                  +Format('%-14.14s', [FieldByName('CGC').asstring])
                  +Format('%-15.15s', [FieldByName('ASSINATURA').asstring])
                  +Format('%-9.9s',   [FieldByName('CCUSTO').asstring])
                  +Format('%-1.1s',   [FieldByName('CANCEL').asstring])
                  +Format('%-2.2s',   [FieldByName('MODELO').asstring])
                  +Format('%-3.3s',   [FieldByName('PAIS').asstring])
                  +Format('%-6.6s',   [FormatCurr(Repl('0', 6), FieldByName('ECNRSM').AsFloat)])
                  +Format('%-1.1s',   [FieldByName('CIFFOB').asstring])
                  +Format('%-3.3s',   [FieldByName('NMR').asstring])
                  +Format('%-6.6s',   [FieldByName('REM_DEST').asstring])
                  +Format('%-6.6s',   [FieldByName('C_CONTA').asstring])
                  +Format('%-3.3s',   [FieldByName('C_HISTOR').asstring])
                  +Format('%-1.1s',   [FieldByName('ICMFONDB').asstring])
                  +Format('%-1.1s',   [FieldByName('C_CLASCONS').asstring])
                  +Format('%-6.6s',   [FieldByName('C_CTACLI').asstring])
                  +Format('%-3.3s',   [FieldByName('C_HISCLI').asstring])
                  +Format('%-14.14s', [FieldByName('CGC_DEST').asstring])
                  +Format('%-11.11s', [FieldByName('CPF_DEST').asstring])
                  +Format('%-3.3s',   [FieldByName('C_ANEXO').asstring])
                  +Format('%-1.1s',   [FieldByName('C_COFINS').asstring])
                  +Format('%-1.1s',   [FieldByName('C_PISPASEP').asstring])
                  +Format('%-1.1s',   [FieldByName('C_ICMS').asstring])
                  +Format('%-1.1s',   [FieldByName('C_IPI').asstring])
                  +Format('%-1.1s',   [FieldByName('C_ISS').asstring])
                  +Format('%-7.7s',   [FieldByName('PLACVEI').asstring])
                  +Format('%-2.2s',   [FieldByName('UFVEI').asstring])
                  +Format('%-10.10s', [FormatCurr(Repl('0', 10), FieldByName('QTDVOLUME').AsFloat)])
                  +FormataValorComPontoDecimal(FieldByName('PESOBRU').AsFloat,11,2)
                  +FormataValorComPontoDecimal(FieldByName('PESOLIQ').AsFloat,11,2)
                  +Format('%-30.30s', [FieldByName('NOMEMOT').asstring])
                  +Format('%-11.11s', [FieldByName('CPFMOT').asstring])
                  +Format('%-10.10s', [FieldByName('CODAUT').asstring])
                  +Format('%-8.8s',   [FieldByName('NRPASSE').asstring])
                  +Format('%-6.6s',   [iif(FieldByName('HORASAI').asstring<>'', retiraCaractere(FieldByName('HORASAI').asstring,':')+'00','')])
                  +FormataValorComPontoDecimal(FieldByName('TEMPERA').AsFloat,5,1)
                  +Format('%-1.1s',   [FieldByName('INDICADOR').asstring])
                  +Format('%-1.1s',   [FieldByName('VEICTRANS').asstring])
                  +Format('%-15.15s', [FieldByName('NRDESPACHO').asstring])
                  +Format('%-44.44s', [FieldByName('CHAVENFE').asstring])
                  +Format('%-8.8s',   [FormatDateTime('DDMMYYYY', FieldByName('EMISSAO').asdatetime)])
          );
          ExportaItensFaturas_ent(item,
                              '  AND COALESCE(ITF_QUANTIDADE, 0) > 0'+#13#10+
                              '  AND ITF_NOTAFISCAL = '+QuotedStr(FieldByName('FTR_NOTAFISCAL').AsString)+#13#10+
                              '  AND ITF_MINUTA = '+QuotedStr(FieldByName('FTR_MINUTA').AsString));
      inc(seq);
      if FieldByName('CANCEL').AsString = 'S' then
        vrc := vrc + FieldByName('CONTABIL').AsFloat
      else
      begin
        if Pos(Copy(FieldByName('CFOP').AsString,1,1), '1-2-3') > 0 then
        begin
          vre := vre + FieldByName('CONTABIL').AsFloat;
          impE := impE + FieldByName('ICMS').AsFloat;
        end
        else
        begin
          vr := vr + FieldByName('CONTABIL').AsFloat;
          impV := impV + FieldByName('ICMS').AsFloat;
        end;
      end;
      Application.ProcessMessages;
      Next;
    end;
    if CheckBoxExpEnt.Checked then
      ExportaItensFaturas_ent(item, '');

    insReg(' > Total: '+IntToStr(seq)+' nota(s) de produtos');
    insReg('           Valor Oper.venda: '+FormatFloat(',0.00', vr));
    insReg('           Valor imp.venda.: '+FormatFloat(',0.00', impV));
    insReg(' ');
    insReg('           Valor Oper.entr.: '+FormatFloat(',0.00', vre));
    insReg('           Valor imp.entr..: '+FormatFloat(',0.00', impE));
    insReg(' ');
    insReg('           Valor NF Cancel.: '+FormatFloat(',0.00', vrc));
    insReg(' ');
    insReg(' ');
  end;
  FreeAndNil(q);
end;

procedure TfrmExportaFiscal.ExportaItensFaturas_ent(var arq: TextFile; filtro: string);
var q: TIBQuery; seq: integer;
   vCgcCpf: String;
begin
  // ITEMINT.TXT
  //
  // Itens de Notas de Saídas
  q := TIBQuery.Create(Application);
  with q, q.SQL do
  begin
    Database := dm2.DataBase1;
    Add('SELECT                                                         ');
    Add('  CASE WHEN (COALESCE(FTR_CGC_FATU,'''')='''') THEN FTR_CPF_FATU ELSE FTR_CGC_FATU END "ECGC_CPF",');
    Add('  CASE WHEN COALESCE(FTR_CHAVE_NFE, '''') <> '''' THEN                   ');
    Add('     ''55''                                                              ');
    Add('  ELSE                                                                   ');
    Add('     ''01''                                                              ');
    Add('  END "ECMODELO",                                                        ');

    Add('CASE WHEN ((COALESCE(SUBSTRING(FTR_SERIE_NFE FROM 2 FOR 4),''''))='''') OR (TRIM(FTR_SERIE_NFE)=''0000'') THEN ');
    Add('     CAST(''1'' AS VARCHAR(3))                                                                                ');
    Add('  ELSE                                                                                                        ');
    Add('     CAST(''1'' AS VARCHAR(3))                                                                                ');
    Add('  END "ECSERIE",                                                                                                ');
    {
    Add('CASE WHEN ((COALESCE(SUBSTRING(FTR_SERIE_NFE FROM 1 FOR 1),''''))='''') OR (TRIM(FTR_SERIE_NFE)=''0000'') THEN ');
    Add('     CAST('''' AS VARCHAR(3))                                                                                 ');
    Add('  ELSE                                                                                                        ');
    Add('     CAST(SUBSTRING(FTR_SERIE_NFE FROM 2 FOR 2) AS VARCHAR(3))                                                ');
    Add('  END "ECSERIE",                                                                                                ');
    }
    Add('CASE WHEN ((COALESCE(SUBSTRING(FTR_SERIE_NFE FROM 2 FOR 2),''''))='''') OR (TRIM(FTR_SERIE_NFE)=''0000'') THEN ');
    Add('     CAST('''' AS VARCHAR(3))                                                                                 ');
    Add('  ELSE                                                                                                        ');
    Add('     CAST('''' AS VARCHAR(3))                                                                                 ');
//  Add('     CAST(SUBSTRING(FTR_SERIE_NFE FROM 3 FOR 4) AS VARCHAR(3))                                                ');
    Add('  END "ECSUBSER",                                                                                                ');
    Add('  FTR_NOTAFISCAL "ECNF",                                       ');
    Add('  CASE WHEN (I.ITF_COD_FISC IS NOT NULL) THEN I.ITF_COD_FISC ELSE FTR_COD_FISC END "ECCFOP",');
    Add('  ''49111090'' "ECITEM", ');
    Add('  CAST(ITF_QUANTIDADE AS NUMERIC(12,2)) "ECQTDE",              ');
    Add('  CAST(ITF_VR_ITEM AS NUMERIC(12,2)) "ECVLBRU",                ');
    Add('  0 "ECVLACE",                                                 ');
    Add('  CASE WHEN (ITF_OUTRA_OPC_FISCAL IS NULL) THEN ITF_VR_ITEM END "ECBICMS",');
    Add('  CASE WHEN (ITF_OUTRA_OPC_FISCAL = ''2'') THEN ITF_VR_ITEM END "ECSUBS", ');
    Add('  ITF_VR_IPI "ECVLIPI",                                        ');
    Add('  ITF_ALIQ_ICMS "ECALICM",                                     ');
    Add('  ITF_SIT_TRIB_A||ITF_SIT_TRIB_B "ECCST",                      ');
    Add('  '''' "ECTPOPER",                                             ');
    Add('  '''' "ECINDINSE",                                            ');
    Add('  '''' "ECCNPJOPE",                                            ');
    Add('  '''' "ECTIPOREC",                                            ');
    Add('  '''' "ECDESCAUX",                                            ');
    Add('  '''' "ECCODAPUR",                                            ');
    Add('  0 "ECPIS",                                                   ');
    Add('  0 "ECCOFINS",                                                ');
    Add('  NULL "ECCODCLAS",                                            ');
    Add('  '''' "ECCSTIPI",                                             ');
    Add('  '''' "ECCSTPIS",                                             ');
    Add('  '''' "ECCSTCOFI",                                            ');
    Add('  '''' "ECNFCPL",                                              ');
    Add('  0 "ECALPIS",                                                 ');
    Add('  0 "ECVLQTPIS",                                               ');
    Add('  0 "ECALCOFI",                                                ');
    Add('  0 "ECVLQTCOF"                                                ');
    Add('FROM FATURAS F INNER JOIN ITENS_FATURADOS I                    ');
    Add('ON ITF_NOTAFISCAL = FTR_NOTAFISCAL                             ');
    Add('AND ITF_MINUTA = FTR_MINUTA                                    ');
    Add('WHERE 1 = 1                                                    ');
    if (filtro <> '') then Add( filtro );
    Add('ORDER BY ITF_NOTAFISCAL, ITF_SEQUENCIA');
    if filtro = '' then
    begin
      //
      // Itens de Entradas
      q.Close;
      q.SQL.Clear;
      Add('SELECT                                                           ');
      Add('  FRN_CGC  "ECGC_CPF",                                           ');
      Add('  CASE WHEN COALESCE(ENT_CHAVE_NFE, '''') <> '''' THEN           ');
      Add('    ''55''                                                       ');
      Add('  ELSE                                                           ');
      Add('    ''01''                                                       ');
      Add('  END "ECMODELO",                                                ');
      Add('  CASE WHEN (COALESCE(ENT_SERIE, '''') = ''NF'') OR (COALESCE(ENT_SERIE, '''') = ''NFE'') THEN ');
      Add('     ''1''                                                       ');
      Add('  ELSE                                                           ');
      Add('     ENT_SERIE                                                   ');
      Add('  END "ECSERIE",                                                 ');
      Add('  CAST('''' AS VARCHAR(3)) "ECSUBSER",                           ');
      Add('  ENT_NOTAFISCAL "ECNF",                                         ');
      Add('  ITE_COD_FISC "ECCFOP",                                         ');
      Add('  ITE_PRODUTO "ECITEM",                                          ');
      Add('  CAST(ITE_QUANTIDADE AS NUMERIC(12,2)) "ECQTDE",                ');
      Add('  CAST(COALESCE(ITE_VR_FRETE,0)+(ITE_PC_CUSTO * (1+ITE_IPI/100) * ITE_QUANTIDADE) AS NUMERIC(12, 2)) "ECVLBRU",  ');
      Add('  0 "ECVLACE",                                                   ');
      Add('  0.0 "ECBICMS",                                                 ');
      Add('  0.0 "ECSUBS",                                                  ');
      Add('  CASE WHEN COALESCE(ITE_VR_IPI,0) > 0 THEN                      ');
      Add('    COALESCE(ITE_VR_IPI,0)                                       ');
      Add('  ELSE                                                           ');
      Add('    COALESCE(ITE_IPI,0) * ITE_VR_ITEM / 100                      ');
      Add('  END "ECVLIPI",                                                 ');
      Add('  0.0 "ECALICM",                                                 ');
      Add('  ''   '' "ECCST",                                               ');
      Add('  '''' "ECTPOPER",                                               ');
      Add('  '''' "ECINDINSE",                                              ');
      Add('  '''' "ECCNPJOPE",                                              ');
      Add('  '''' "ECTIPOREC",                                              ');
      Add('  '''' "ECDESCAUX",                                              ');
      Add('  '''' "ECCODAPUR",                                              ');
      Add('  0 "ECPIS",                                                     ');
      Add('  0 "ECCOFINS",                                                  ');
      Add('  NULL "ECCODCLAS",                                              ');
      Add('  '''' "ECCSTIPI",                                               ');
      Add('  '''' "ECCSTPIS",                                               ');
      Add('  '''' "ECCSTCOFI",                                              ');
      Add('  '''' "ECNFCPL",                                                ');
      Add('  0 "ECALPIS",                                                   ');
      Add('  0 "ECVLQTPIS",                                                 ');
      Add('  0 "ECALCOFI",                                                  ');
      Add('  0 "ECVLQTCOF"                                                  ');
      Add('  FROM ENTRADAS,                                                 ');
      Add('       ITENS_ENTRADA,                                            ');
      Add('       MATERIAIS,                                                ');
      Add('       FORNECEDORES                                              ');
      Add('  WHERE                                                          ');
      Add('        ENT_NOTAFISCAL = ITE_NFISCAL                             ');
      Add('    AND ENT_EMISSAO    = ITE_EMISSAO                             ');
      Add('    AND ENT_FORNECEDOR = ITE_FORNECEDOR                          ');
      Add('    AND ITE_PRODUTO = MTR_CODIGO                                 ');
      Add('    AND ENT_FORNECEDOR = FRN_CODIGO                              ');
      Add('    AND CAST(ENT_DT_ENTRADA AS DATE) BETWEEN '+QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit1.Date)));
      Add('    AND '+QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit2.Date)));
      if (listaCfopEnt <> '') then
        Add('      AND ENT_COD_FISC IN ('+listaCfopEnt+')');
      Add('ORDER BY ENT_NOTAFISCAL                                          ');
    end;
    open;
    seq := 1;
    while not Eof do
    begin
      vCgcCpf := SoNumeros(FieldByName('ECGC_CPF').asstring);
      if (vCgcCpf = '') then vCgcCpf := '0';
      vCgcCpf := ZerosEsq(vCgcCpf, 14);
      if filtro <> '' then
        insReg('         '+
               '              '+
               '      '+Preenche(FormatFloat(',0.00', FieldByName('ECVLBRU').AsFloat),10,' ',tpE)+
               '    '+Preenche(FormatFloat(',0.00', FieldByName('ECBICMS').AsFloat),10,' ',tpE)+
               Preenche(FormatFloat(',0.00', FieldByName('ECALICM').AsFloat),10,' ',tpE)+
               '   '+Preenche(' ',10,' ',tpE)+
               '   '+Copy(FieldByName('ECCFOP').AsString,1,1)+'.'+Copy(FieldByName('ECCFOP').AsString,2,3));
      //
      Writeln(arq, Format('%-14.14s', [vCgcCpf])
                  +Format('%-2.2s',   [FieldByName('ECMODELO').asstring])
                  +Format('%-3.3s',   [FieldByName('ECSERIE').asstring])
                  +Format('%-2.2s',   [FieldByName('ECSUBSER').asstring])
                  +Format('%-6.6s',   [FieldByName('ECNF').asstring])
                  +Copy(FieldByName('ECCFOP').AsString,1,1)+''+Copy(FieldByName('ECCFOP').AsString,2,3)
                  +Format('%-3.3s',   [FormatCurr('000', seq)])
                  +Format('%-14.14s', [FieldByName('ECITEM').asstring])
                  +FormataValorComPontoDecimal(FieldByName('ECQTDE').AsFloat,13,2)
                  +FormataValorComPontoDecimal(FieldByName('ECVLBRU').AsFloat,12,2)
                  +FormataValorComPontoDecimal(FieldByName('ECVLACE').AsFloat,12,2)
                  +FormataValorComPontoDecimal(FieldByName('ECBICMS').AsFloat,12,2)
                  +FormataValorComPontoDecimal(FieldByName('ECSUBS').AsFloat,12,2)
                  +FormataValorComPontoDecimal(FieldByName('ECVLIPI').AsFloat,12,2)
                  +FormataValorComPontoDecimal(FieldByName('ECALICM').AsFloat,5,2)
                  +Format('%-3.3s',   [FieldByName('ECCST').asstring])
                  +Format('%-1.1s',   [FieldByName('ECTPOPER').asstring])
                  +Format('%-2.2s',   [FieldByName('ECINDINSE').asstring])
                  +Format('%-14.14s', [FieldByName('ECCNPJOPE').asstring])
                  +Format('%-2.2s',   [FieldByName('ECTIPOREC').asstring])
                  +Format('%-53.53s', [FieldByName('ECDESCAUX').asstring])
                  +Format('%-2.2s',   [FieldByName('ECCODAPUR').asstring])
                  +FormataValorComPontoDecimal(FieldByName('ECPIS').AsFloat,14,2)
                  +FormataValorComPontoDecimal(FieldByName('ECCOFINS').AsFloat,14,2)
                  +Format('%-4.4s',   [FieldByName('ECCODCLAS').asstring])
                  +Format('%-2.2s',   [FieldByName('ECCSTIPI').asstring])
                  +Format('%-2.2s',   [FieldByName('ECCSTPIS').asstring])
                  +Format('%-2.2s',   [FieldByName('ECCSTCOFI').asstring])
                  +Format('%-10.10s', [FieldByName('ECNFCPL').asstring])
                  +FormataValorComPontoDecimal(FieldByName('ECALPIS').AsFloat,8,4)
                  +FormataValorComPontoDecimal(FieldByName('ECVLQTPIS').AsFloat,10,4)
                  +FormataValorComPontoDecimal(FieldByName('ECALCOFI').AsFloat,8,4)
                  +FormataValorComPontoDecimal(FieldByName('ECVLQTCOF').AsFloat,10,4)
          );
      inc(seq);
      Application.ProcessMessages;
      Next;
    end;
  end;
  FreeAndNil(q);
end;

procedure TfrmExportaFiscal.BitBtn3Click(Sender: TObject);
var i: integer;
begin
  pnCFOPEnt.visible := false;
  listaCfopEnt := '';
  for i := 0 to CheckListBoxCfopEnt.Items.Count - 1 do
    if CheckListBoxCfopEnt.Checked[i] then
      if listaCfopEnt = '' then
        listaCfopEnt := chr(39) + Copy(CheckListBoxCfopEnt.Items.Strings[i], 1, 4) + chr(39)
      else
        listaCfopEnt := listaCfopEnt + ',' + chr(39) + Copy(CheckListBoxCfopEnt.Items.Strings[i], 1, 4) + chr(39);
  if (listacfopEnt = '') then
    CheckBoxCFOPSelEnt.Checked := false;
end;

procedure TfrmExportaFiscal.CheckBoxCFOPSelEntClick(Sender: TObject);
begin
  if TCheckBox(sender).Checked then
  begin
    pnCFOPEnt.visible := true;
    pnCFOPEnt.BringToFront;
    pnCFOPEnt.Align := alClient;
    CheckBoxCFOPSelEnt.setfocus;
  end;
end;

procedure TfrmExportaFiscal.CheckBoxCFOPEntClick(Sender: TObject);
var i: Integer;
begin
  CheckListBoxCfopEnt.OnClickCheck := nil;
  for i := 0 to CheckListBoxCfopEnt.Items.count - 1 do
    CheckListBoxCfopEnt.Checked[i] := TCheckBox(sender).checked;
  CheckListBoxCfopEnt.OnClickCheck := CheckListBoxCfopEntClickCheck;
end;

procedure TfrmExportaFiscal.CheckListBoxCfopEntClickCheck(Sender: TObject);
var i: integer; m: boolean;
begin
  m := true;
  for i := 0 to CheckListBoxCfopEnt.Items.count - 1 do
    if not CheckListBoxCfopEnt.Checked[i] then
      m := false;
  CheckBoxCFOPEnt.OnClick := nil;
  CheckBoxCFOPEnt.Checked := m;
  CheckBoxCFOPEnt.OnClick := CheckBoxCFOPEntClick;
end;

procedure TfrmExportaFiscal.ExportaProdEnt(var arq: TextFile; var ProgressBar: TProgressBar; filtro, filtro2: string);
var q, q2: TIBQuery;
    reg, qtreg: integer;
begin
  // PRODINT.TXT (Produtos que houveram entradas no periodo)
  q := TIBQuery.Create(Application);
  q2 := TIBQuery.Create(Application);
  q2.Database := dm2.DataBase1;
  with q, q.SQL do
  begin
    Database := dm2.DataBase1;
    Add('SELECT                                                     ');
    Add('  CAST(MTR_CODIGO AS VARCHAR(14)) "ECCODIT",               ');
    Add('  (SELECT CLF_CODIGO FROM                                  ');
    Add('     CLASSIFICACAO_FISCAL WHERE                            ');
    Add('     MTR_CLASSIFICACAO_FISCAL = CLF_SEQUENCIA) "ECNCM",    ');
    Add('  MTR_DESCRICAO "ECDESC",                                  ');
    Add('  MTR_UNIDADE "ECUNID",                                    ');
    Add('  '''' "ECSITTRI",                                         ');
    Add('  CASE WHEN COALESCE(MTR_PERC_IPI, 0) = 0 THEN             ');
    Add('    ''''                                                   ');
    Add('  ELSE                                                     ');
    Add('    CAST(MTR_PERC_IPI AS NUMERIC(5,2))                     ');
    Add('  END "ECALIPI",                                           ');
    Add('  '''' "ECALICM",                                          ');
    Add('  '''' "ECREDUC",                                          ');
    Add('  0 "ECSUBS",                                              ');
    Add('  '''' "ECCHASSI",                                         ');
    Add('  '''' "ECNBM",                                            ');
    Add('  ''01'' "ECAPLICA",                                       ');
    Add('  '''' "ECCODANP",                                         ');
    Add('  0 "ECALPIS",                                             ');
    Add('  0 "ECALCOFI",                                            ');
    Add('  ''N'' "ECCOMBUS",                                        ');
    Add('  '''' "ECCSTIPI",                                         ');
    Add('  '''' "ECCSTPIS",                                         ');
    Add('  '''' "ECCSTCOFI",                                        ');
    Add('  0 "ECVLQTPIS",                                           ');
    Add('  0 "ECVLQTCOF"                                            ');
    Add('FROM MATERIAIS WHERE 1 = 1                                 ');
    if (filtro <> '') then Add( filtro );
    Add('UNION                                                      ');
    Add('SELECT                                                     ');
    Add('  DISTINCT                                                 ');
    Add('  CAST(''49111090'' AS VARCHAR(14)) "ECCODIT",             ');
    Add('  ''49111090'' "ECNCM",                                    ');
    Add('  CAST(''IMPRESSÃO'' AS VARCHAR(53)) "ECDESC",             ');
    Add('  CAST(''UN'' AS VARCHAR(3)) "ECUNID",                     ');
    Add('  '''' "ECSITTRI",                                         ');
    Add('  0 "ECALIPI",                                             ');
    Add('  '''' "ECALICM",                                          ');
    Add('  '''' "ECREDUC",                                          ');
    Add('  0 "ECSUBS",                                              ');
    Add('  '''' "ECCHASSI",                                         ');
    Add('  '''' "ECNBM",                                            ');
    Add('  ''01'' "ECAPLICA",                                       ');
    Add('  '''' "ECCODANP",                                         ');
    Add('  0 "ECALPIS",                                             ');
    Add('  0 "ECALCOFI",                                            ');
    Add('  ''N'' "ECCOMBUS",                                        ');
    Add('  '''' "ECCSTIPI",                                         ');
    Add('  '''' "ECCSTPIS",                                         ');
    Add('  '''' "ECCSTCOFI",                                        ');
    Add('  0 "ECVLQTPIS",                                           ');
    Add('  0 "ECVLQTCOF"                                            ');
    Add('FROM FATURAS, ITENS_FATURADOS WHERE 1 = 1                  ');
    Add('    AND FTR_NOTAFISCAL = ITF_NOTAFISCAL                    ');
    Add('    AND FTR_MINUTA = ITF_MINUTA                            ');
    if (filtro2 <> '') then Add( filtro2 );
    Add('ORDER BY 1                                                 ');
    open;
    ProgressBar.visible := true;
    reg := 0; contaRegistros(q, qtReg);
    insReg('>> PRODUTOS DE ENTRADAS (PRODINT.TXT)');
    insReg('   --------------------');
    insReg('   Codigo  Ddescrção                                     Unid');
    while not Eof do
    begin
      insReg('   '+FieldByName('ECCODIT').asstring+'   '+Preenche(FieldByName('ECDESC').asstring,40,' ',tpD)+'      '+FieldByName('ECUNID').asstring);
      with q2, q2.SQL do
      begin
        Close;
        Clear;
        Add('    SELECT MAX(ENT_DT_ENTRADA) "ECDATA"      ');
        Add('    FROM ENTRADAS,                           ');
        Add('         ITENS_ENTRADA                       ');
        Add('  WHERE                                      ');
        Add('        ENT_NOTAFISCAL = ITE_NFISCAL         ');
        Add('    AND ENT_EMISSAO    = ITE_EMISSAO         ');
        Add('    AND ENT_FORNECEDOR = ITE_FORNECEDOR      ');
        Add('    AND ITE_PRODUTO = '+QuotedStr(q.FieldByName('ECCODIT').AsString));
        Add('    AND CAST(ENT_DT_ENTRADA AS DATE) BETWEEN '+QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit1.Date)));
        Add('    AND '+QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit2.Date)));
        if (listaCfopEnt <> '') then
         Add('      AND ENT_COD_FISC IN ('+listaCfopEnt+')');
        Open;
      end;
      //
      Writeln(arq, iif(q2.FieldByName('ECDATA').IsNull, Format('%-8.8s', ['']),  Format('%-8.8s',   [FormatDateTime('DDMMYYYY', q2.FieldByName('ECDATA').asdatetime)]))
                  +Format('%-14.14s',  [FieldByName('ECCODIT').asstring])
                  +Format('%-8.8s',   [FieldByName('ECNCM').asstring])
                  +Format('%-53.53s', [FieldByName('ECDESC').asstring])
                  +Format('%-6.6s',   [FieldByName('ECUNID').asstring])
                  +Format('%-3.3s',   [FieldByName('ECSITTRI').asstring])
                  +Format('%-4.4s',   [ZerosEsq(SoNumeros(FieldByName('ECALIPI').asstring),4)])
                  +Format('%-4.4s',   [FieldByName('ECALICM').asstring])
                  +Format('%-4.4s',   [FieldByName('ECREDUC').asstring])
                  +FormataValorComPontoDecimal(FieldByName('ECSUBS').AsFloat,12,2)
                  +Format('%-17.17s',   [FieldByName('ECCHASSI').asstring])
                  +Format('%-8.8s',   [FieldByName('ECNBM').asstring])
                  +Format('%-2.2s',   [FieldByName('ECAPLICA').asstring])
                  +Format('%-8.8s',   [FieldByName('ECCODANP').asstring])
                  +FormataValorComPontoDecimal(FieldByName('ECALPIS').AsFloat,8,4)
                  +FormataValorComPontoDecimal(FieldByName('ECALCOFI').AsFloat,8,4)
                  +Format('%-1.1s',   [FieldByName('ECCOMBUS').asstring])
                  +Format('%-2.2s',   [FieldByName('ECCSTIPI').asstring])
                  +Format('%-2.2s',   [FieldByName('ECCSTPIS').asstring])
                  +Format('%-2.2s',   [FieldByName('ECCSTCOFI').asstring])
                  +FormataValorComPontoDecimal(FieldByName('ECVLQTPIS').AsFloat,10,4)
                  +FormataValorComPontoDecimal(FieldByName('ECVLQTCOF').AsFloat,10,4)
      );
      inc(reg); ProgressBar.Position := Round((reg/qtReg)*100);
      Application.ProcessMessages;
      Next;
    end;
    insReg(' > Total: '+IntTostr(reg)+' produto(s)');
    insReg(' ');
    insReg(' ');
    ProgressBar.visible := false;
  end;
  FreeAndNil(q);
  FreeAndNil(q2);
end;

procedure TfrmExportaFiscal.ExportaEntradas(var arq: TextFile; var ProgressBar: TProgressBar; filtro: string);
var q: TIBQuery;
    reg, qtreg: integer;
    vr, imp: Double;
begin
  // FISCAL.TXT (Entradas do periodo)
  vr:=0;
  imp := 0;
  q := TIBQuery.Create(Application);
  with q, q.SQL do
  begin
    Database := dm2.DataBase1;
    Add('  SELECT                                                                                                                                                              ');
    Add('    ENT_DT_ENTRADA "DIA",                                                                                                                                             ');
    Add('    CASE WHEN COALESCE(ENT_CHAVE_NFE, '''') <> '''' THEN                                                                                                              ');
    Add('      ''NF ''                                                                                                                                                         ');
    Add('    ELSE                                                                                                                                                              ');
    Add('      ''NF ''                                                                                                                                                         ');
    Add('    END "ESPECIE",                                                                                                                                                    ');
    Add('    CASE WHEN (COALESCE(ENT_SERIE, '''') = ''NF'') OR (COALESCE(ENT_SERIE, '''') = ''NFE'') THEN                                                                      ');
    Add('       ''1''                                                                                                                                                          ');
    Add('    ELSE                                                                                                                                                              ');
    Add('       ENT_SERIE                                                                                                                                                      ');
    Add('    END "SERIE",                                                                                                                                                      ');
    Add('     ENT_NOTAFISCAL "NUMERO",                                                                                                                                         ');
    Add('     ENT_EMISSAO "EMISSAO",                                                                                                                                           ');
    Add('     '''' "CODFOR",                                                                                                                                                   ');
    Add('     FRN_NOME "EMITENTE",                                                                                                                                             ');
    Add('     FRN_CGF "INCESTA",                                                                                                                                               ');
    Add('     FRN_CGC "INSCCGC",                                                                                                                                               ');
    Add('     FRN_ESTADO "UF",                                                                                                                                                 ');
    Add('     CAST(SUM(COALESCE(ITE_VR_FRETE,0)+(ITE_PC_CUSTO * (1+ITE_IPI/100) * ITE_QUANTIDADE)) AS NUMERIC(13, 2)) "CONTABIL",                                              ');
    Add('     SUBSTRING(ITE_COD_FISC FROM 1 FOR 1)||''.''||SUBSTRING(ITE_COD_FISC FROM 2 FOR 4) "CODIGO",                                                                      ');
    {
    Add('     CAST(SUM((CASE WHEN (ITE_OUTRA_OPC_FISCAL=''2'') OR (MTR_SIT_TRIB = ''S'') THEN 0 ELSE 1 END) * (CASE WHEN (COALESCE(ITE_ICMS,0) > 0) THEN 1 ELSE 0 END)         ');
    Add('        * ITE_PC_CUSTO * ITE_QUANTIDADE                                                                                                                               ');
    Add('        * (1- COALESCE(ITE_REDUCAO, 0)/100)                                                                                                                           ');
    Add('        - (COALESCE(ITE_VR_DESCONTO,0) + ITE_VR_ITEM*COALESCE(ITE_DESCONTO, 0)/100)                                                                                   ');
    Add('         ) AS NUMERIC(12,2)) "BASE",                                                                                                                                  ');
    Add('     ITE_ICMS "ALIQUOTA",                                                                                                                                             ');
    Add('  CAST(SUM(((CASE WHEN (ITE_OUTRA_OPC_FISCAL=''2'') OR (MTR_SIT_TRIB = ''S'') THEN 0 ELSE 1 END) * (CASE WHEN (COALESCE(ITE_ICMS,0) > 0) THEN 1 ELSE 0 END)           ');
    Add('      * ITE_PC_CUSTO * ITE_QUANTIDADE                                                                                                                                 ');
    Add('      * (1- COALESCE(ITE_REDUCAO, 0)/100)                                                                                                                             ');
    Add('      - (COALESCE(ITE_VR_DESCONTO,0) + ITE_VR_ITEM*COALESCE(ITE_DESCONTO, 0)/100) )                                                                                   ');
    Add('      * CASE WHEN (COALESCE(ITE_ICMS,0) > 0) THEN ITE_ICMS/100 ELSE 0 END                                                                                             ');
    Add('      ) AS NUMERIC(12,2)) "ICMS",                                                                                                                                     ');
    }
    Add('     CAST(0 AS NUMERIC(12,2)) "BASE",                                                                                                                                  ');
    Add('     0 "ALIQUOTA",                                                                                                                                             ');
    Add('     CAST(0 AS NUMERIC(12,2)) "ICMS",                                                                                                                                     ');
    Add('     0 "FONTE",                                                                                                                                                       ');
    {
    Add('  CAST(SUM(CASE WHEN (ITE_OUTRA_OPC_FISCAL=''2'') or (MTR_SIT_TRIB = ''S'') THEN ITE_PC_CUSTO * (1+ITE_IPI/100) * ITE_QUANTIDADE ELSE 0 END )                         ');
    Add('         + CASE WHEN (ENT_OPERACAO=''D'') AND (COALESCE(ITE_ICMS,0)=0) THEN SUM(ITE_PC_CUSTO * ITE_QUANTIDADE) ELSE 0 END                                             ');
    Add('                       AS NUMERIC(12,2)) "ISENTAS",                                                                                                                   ');
    }
    Add('     CAST(0 AS NUMERIC(12,2)) "ISENTAS",                                                                                                                   ');
    Add('     0 "ENTRADAS",                                                                                                                                                    ');
//  Add('  CAST(SUM(CASE WHEN (ITE_OUTRA_OPC_FISCAL=''2'') or (MTR_SIT_TRIB = ''S'') or (COALESCE(ITE_ICMS,0)>0) THEN 0 ELSE ITE_PC_CUSTO * (1+ITE_IPI/100) * ITE_QUANTIDADE END) AS NUMERIC(12,2)) "OUTRAS",');
    Add('     CAST(0 AS NUMERIC(12,2)) "OUTRAS",                                                                                                                               ');
    Add('     '''' "DAE",                                                                                                                                                      ');
    Add('  SUM(CASE WHEN (COALESCE(ITE_IPI,0) > 0) AND (COALESCE(ITE_VR_IPI,0) > 0) THEN                                                                                       ');
    Add('         COALESCE(ITE_VR_IPI,0) * 100 / COALESCE(ITE_IPI,0)                                                                                                           ');
    Add('      ELSE CASE WHEN COALESCE(ITE_IPI,0)>0 THEN                                                                                                                       ');
    Add('         ITE_VR_ITEM                                                                                                                                                  ');
    Add('      ELSE                                                                                                                                                            ');
    Add('         0                                                                                                                                                            ');
    Add('  END END) "BASEIPI",                                                                                                                                                 ');
    Add('  CAST(ITE_IPI AS INTEGER) "ALIQIPI",                                                                                                                                 ');
    Add('  SUM(CASE WHEN COALESCE(ITE_VR_IPI,0) > 0 THEN                                                                                                                            ');
    Add('         COALESCE(ITE_VR_IPI,0)                                                                                                                                       ');
    Add('      ELSE                                                                                                                                                            ');
    Add('         COALESCE(ITE_IPI,0) * ITE_VR_ITEM / 100                                                                                                                      ');
    Add('      END) "IPI",                                                                                                                                                     ');
    Add('  0 "IPISENTO",                                                                                                                                                       ');
    Add('  0 "IPIOUTRAS",                                                                                                                                                      ');
    Add('  '' '' "AVISTA",                                                                                                                                                     ');
    Add('  ''*'' "APRAZO",                                                                                                                                                     ');
    Add('  '' '' "RESERVADO",                                                                                                                                                  ');
    Add('  ''N'' "BENS",                                                                                                                                                       ');
    Add('  ''N'' "SERV",                                                                                                                                                       ');
    Add('  ''S'' "GERALANC",                                                                                                                                                   ');
    Add('  '' '' "CPF",                                                                                                                                                        ');
    Add('  '' '' "RESERVADO2",                                                                                                                                                 ');
    Add('  '' '' "CCUSTO",                                                                                                                                                     ');
    Add('  ''N'' "CANCEL",                                                                                                                                                     ');
    Add('  CASE WHEN ENT_ESPECIE = ''NFE'' THEN                                                                                                                                ');
    Add('     ''55''                                                                                                                                                           ');
    Add('  ELSE CASE WHEN (ENT_ESPECIE = ''CTA'') OR (ENT_ESPECIE = ''CTA'') OR (ENT_ESPECIE = ''CTRC'') OR (ENT_ESPECIE = ''CTFC'') THEN                                      ');
    Add('     ''08''                                                                                                                                                           ');
    Add('  ELSE                                                                                                                                                                ');
    Add('     ''01''                                                                                                                                                           ');
    Add('  END END "MODELO",                                                                                                                                                   ');
    Add('  '''' "GERLF",                                                                                                                                                       ');
    Add('  CASE WHEN COALESCE(ITE_FRETE, 0) = 0 THEN                                                                                                                           ');
    Add('    ''1''                                                                                                                                                             ');
    Add('  ELSE                                                                                                                                                                ');
    Add('    ''2''                                                                                                                                                             ');
    Add('  END "CIFFOB",                                                                                                                                                       ');
    Add('  '''' "C_CONTA",                                                                                                                                                     ');
    Add('  '''' "C_HISTOR",                                                                                                                                                    ');
    Add(' SUM(COALESCE(ITE_BASEAGREGADO, 0)) "BICMSUBS",                                                                                                                        ');
    Add('  '''' "C_ANEXO",                                                                                                                                                     ');
    Add('  ''N'' "C_DISIMPL",                                                                                                                                                  ');
    Add('  ENT_CHAVE_NFE "CHAVENFE"                                                                                                                                            ');
    Add('  FROM ENTRADAS,                                                                                                                                                      ');
    Add('       ITENS_ENTRADA,                                                                                                                                                 ');
    Add('       MATERIAIS,                                                                                                                                                     ');
    Add('       FORNECEDORES                                                                                                                                                   ');
    Add('  WHERE                                                                                                                                                               ');
    Add('        ENT_NOTAFISCAL = ITE_NFISCAL                                                                                                                                  ');
    Add('    AND ENT_EMISSAO    = ITE_EMISSAO                                                                                                                                  ');
    Add('    AND ENT_FORNECEDOR = ITE_FORNECEDOR                                                                                                                               ');
    Add('    AND ITE_PRODUTO = MTR_CODIGO                                                                                                                                      ');
    Add('    AND ENT_FORNECEDOR = FRN_CODIGO                                                                                                                                   ');
    Add('    AND CAST(ENT_DT_ENTRADA AS DATE) BETWEEN '+QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit1.Date)));
    Add('    AND '+QuotedStr(FormatDateTime('MM/DD/YYYY', DateEdit2.Date)));
    if (listaCfopEnt <> '') then
      Add('      AND ENT_COD_FISC IN ('+listaCfopEnt+')');
    Add(' GROUP BY                                                                                                                                                             ');
    Add('    ENT_DT_ENTRADA,                                                                                                                                                   ');
    Add('    ENT_SERIE,                                                                                                                                                        ');
    Add('    ENT_NOTAFISCAL,                                                                                                                                                   ');
    Add('    ENT_EMISSAO,                                                                                                                                                      ');
    Add('    FRN_NOME,                                                                                                                                                         ');
    Add('    FRN_CGF,                                                                                                                                                          ');
    Add('    FRN_CGC,                                                                                                                                                          ');
    Add('    FRN_ESTADO,                                                                                                                                                       ');
    Add('    ITE_COD_FISC,                                                                                                                                                     ');
//  Add('    ITE_ICMS,                                                                                                                                                         ');
    Add('    ENT_OPERACAO,                                                                                                                                                     ');
    Add('    ITE_IPI,                                                                                                                                                          ');
    Add('    ITE_FRETE,                                                                                                                                                        ');
    Add('    ENT_ESPECIE,                                                                                                                                                      ');
    Add('    ENT_CHAVE_NFE                                                                                                                                                     ');
    open;
    ProgressBar.visible := true;
    reg := 0; contaRegistros(q, qtReg);
    insReg('>> NOTAS DE ENTRADAS (FISCAL.TXT)');
    insReg('   -----------------');
    insReg('   Nr.Nota       Emissão      CGC.Forn.      Vr.contabil  Base Calc.     Aliq.  Vr.Imposto   CFOP');
    while not Eof do
    begin
      insReg('   '+Format('%-10.10s', [FieldByName('NUMERO').asstring])+
             '    '+FormatDateTime('DD/MM/YYYY', FieldByName('DIA').AsDateTime)+
             '   '+FieldByName('INSCCGC').asstring+
             '  '+Preenche(FormatFloat(',0.00', FieldByName('CONTABIL').AsFloat),10,' ',tpE)+
             '  '+Preenche(FormatFloat(',0.00', FieldByName('BASE').AsFloat),10,' ',tpE)+
             '   '+Preenche(FormatFloat(',0.00', FieldByName('ALIQUOTA').AsFloat),6,' ',tpE)+
             '     '+Preenche(FormatFloat(',0.00', FieldByName('ICMS').AsFloat),8,' ',tpE)+
             '  '+Format('%-5.5s', [FieldByName('CODIGO').asstring]));
      //
      Writeln(arq, Format('%-8.8s',   [FormatDateTime('DDMMYYYY', FieldByName('DIA').asdatetime)])
                  +Format('%-3.3s',   [FieldByName('ESPECIE').asstring])
                  +Format('%-3.3s',   [FieldByName('SERIE').asstring])
                  +Format('%-10.10s', [FieldByName('NUMERO').asstring])
                  +Format('%-8.8s',   [FormatDateTime('DDMMYYYY', FieldByName('EMISSAO').asdatetime)])
                  +Format('%-6.6s',   [FieldByName('CODFOR').asstring])
                  +Format('%-40.40s', [FieldByName('EMITENTE').asstring])
                  +Format('%-20.20s', [FieldByName('INCESTA').asstring])
                  +Format('%-14.14s', [FieldByName('INSCCGC').asstring])
                  +Format('%-2.2s', [FieldByName('UF').asstring])
                  +FormataValorComPontoDecimal(FieldByName('CONTABIL').AsFloat,14,2)
                  +Format('%-5.5s', [FieldByName('CODIGO').asstring])
                  +FormataValorComPontoDecimal(FieldByName('BASE').AsFloat,14,2)
                  +FormataValorComPontoDecimal(FieldByName('ALIQUOTA').AsFloat,5,2)
                  +FormataValorComPontoDecimal(FieldByName('ICMS').AsFloat,13,2)
                  +FormataValorComPontoDecimal(FieldByName('FONTE').AsFloat,13,2)
                  +FormataValorComPontoDecimal(FieldByName('ISENTAS').AsFloat,14,2)
                  +FormataValorComPontoDecimal(FieldByName('ENTRADAS').AsFloat,14,2)
                  +FormataValorComPontoDecimal(FieldByName('OUTRAS').AsFloat,14,2)
                  +Format('%-135.135s', [FieldByName('DAE').asstring])
                  +FormataValorComPontoDecimal(FieldByName('BASEIPI').AsFloat,14,2)
                  +Format('%-2.2s', [ZerosEsq(FieldByName('ALIQIPI').AsString,2)])
                  +FormataValorComPontoDecimal(FieldByName('IPI').AsFloat,13,2)
                  +FormataValorComPontoDecimal(FieldByName('IPISENTO').AsFloat,14,2)
                  +FormataValorComPontoDecimal(FieldByName('IPIOUTRAS').AsFloat,14,2)
                  +Format('%-1.1s', [FieldByName('AVISTA').asstring])
                  +Format('%-1.1s', [FieldByName('APRAZO').asstring])
                  +Format('%-6.6s', [FieldByName('RESERVADO').asstring])
                  +Format('%-1.1s', [FieldByName('BENS').asstring])
                  +Format('%-1.1s', [FieldByName('SERV').asstring])
                  +Format('%-1.1s', [FieldByName('GERALANC').asstring])
                  +Format('%-11.11s', [FieldByName('CPF').asstring])
                  +Format('%-15.15s', [FieldByName('RESERVADO2').asstring])
                  +Format('%-9.9s', [FieldByName('CCUSTO').asstring])
                  +Format('%-1.1s', [FieldByName('CANCEL').asstring])
                  +Format('%-2.2s', [FieldByName('MODELO').asstring])
                  +Format('%-1.1s', [FieldByName('GERLF').asstring])
                  +Format('%-1.1s', [FieldByName('CIFFOB').asstring])
                  +Format('%-6.6s', [FieldByName('C_CONTA').asstring])
                  +Format('%-3.3s', [FieldByName('C_HISTOR').asstring])
                  +FormataValorComPontoDecimal(FieldByName('BICMSUBS').AsFloat,14,2)
                  +Format('%-3.3s', [FieldByName('C_ANEXO').asstring])
                  +Format('%-1.1s', [FieldByName('C_DISIMPL').asstring])
                  +Format('%-44.44s', [FieldByName('CHAVENFE').asstring])
      );
      inc(reg); ProgressBar.Position := Round((reg/qtReg)*100);
      vr := vr + FieldByName('CONTABIL').AsFloat;
      imp := imp + FieldByName('ICMS').AsFloat;
      Application.ProcessMessages;
      Next;
    end;
    insReg(' > Total: '+IntTostr(reg)+' nota(s) de entrada');
    insReg('          Valor contabil: '+FormatFloat(',0.00', vr));
    insReg('          Valor imposto.: '+FormatFloat(',0.00', imp));
  end;
  FreeAndNil(q);
end;

procedure TfrmExportaFiscal.ExportaInventario(var arq: TextFile; var ProgressBar: TProgressBar; filtro: string);
var q: TIBQuery;
    reg, qtreg: integer;
begin
  // INVEINT.TXT (Inventario do periodo)
  q := TIBQuery.Create(Application);
  with q, q.SQL do
  begin
    Database := dm2.DataBase1;
    Add('  SELECT MTR_CODIGO "C_CLASSIF"                                                                                                                                       ');
    Add('  FROM MATERIAIS                                                                                                                                                      ');
    open;
    ProgressBar.visible := true;
    reg := 0; contaRegistros(q, qtReg);
    insReg('>> PRODUTOS DE INVENTÁRIO (INVEINT.TXT)');
    insReg('   ----------------------');
    while not Eof do
    begin
      insReg('   '+FieldByName('NUMERO').asstring);
      //
      Writeln(arq, Format('%-8.8s',   [FormatDateTime('DDMMYYYY', FieldByName('DIA').asdatetime)])
                  +Format('%-3.3s',   [FieldByName('ESPECIE').asstring])
                  +Format('%-3.3s',   [FieldByName('SERIE').asstring])
                  +Format('%-10.10s', [FieldByName('NUMERO').asstring])
                  +Format('%-8.8s',   [FormatDateTime('DDMMYYYY', FieldByName('EMISSAO').asdatetime)])
      );
      inc(reg); ProgressBar.Position := Round((reg/qtReg)*100);
      Application.ProcessMessages;
      Next;
    end;
    insReg(' > Total: '+IntTostr(reg)+' produto(s) de inventário');
    ProgressBar.visible := false;
  end;
  FreeAndNil(q);
end;


procedure TfrmExportaFiscal.CheckBoxExpInvClick(Sender: TObject);
begin
  if CheckBoxExpInv.Checked then
  begin
    cbExpCliente.Checked      := false;
    CheckBoxExpNf.Checked     := false;
    CheckBoxExpNSaida.Checked := false;
    CheckBoxExpEnt.Checked    := false;
    DateEdit1.Clear;
    DateEdit2.Clear;
  end
  else
  begin

  end;
end;

procedure TfrmExportaFiscal.cbExpClienteClick(Sender: TObject);
begin
  if cbExpCliente.Checked or CheckBoxExpNf.Checked or CheckBoxExpNSaida.Checked or CheckBoxExpEnt.Checked then
    CheckBoxExpInv.Checked := false;
end;

procedure TfrmExportaFiscal.BitBtn4Click(Sender: TObject);
begin
  Panel1.Visible := false;
end;

procedure TfrmExportaFiscal.insReg(lin: String);
begin
  ns := ns + 1;
  cdsRel.Insert;
  cdsRelINDX.AsInteger := ns;
  cdsRelPRD2.AsString  := lin;
  cdsRel.Post;
end;

procedure TfrmExportaFiscal.ExportaConhecimentoFrete(arquivo: string;
  var ProgressBar: TProgressBar);
var
  F: TextFile;
  reg, qtreg: integer;
  valor: double;
begin
  try

    ProgressBar.visible := true;
    AssignFile(F, arquivo);
    Rewrite(F);

    with TIBQuery.Create(nil) do
    begin
      database := dm2.database1;
      SQL.Text :=
        'SELECT * FROM ( '+
        'SELECT '+
        '    CTP_DOCUMENTO "CHF_NUM", '+
        '    CAST(1 AS INTEGER) "CHF_SERIE", '+
        '    ENT_FRETE_CFOP "CHF_CFOP", '+
        '    CAST(CTP_DT_MOVIMENTO AS DATE) "CHF_EMISSAO", '+
        '    ENT_NOTAFISCAL "NFE_NUM", '+
        '    CAST(''55'' AS VARCHAR(2)) "NFE_MOD", '+
        '    CAST(CASE WHEN COALESCE(ENT_SERIE, '''') IN (''NF'', ''NFE'') THEN ''1'' ELSE ENT_SERIE END AS INTEGER) "NFE_SERIE", '+
        '    CAST(ENT_FRETE_QTDE AS INTEGER) "CHF_VOLUME", '+
        '    CAST(NULL AS NUMERIC(15,2)) "CHF_PESO", '+
        '    CAST(NULL AS NUMERIC(15,2)) "CHF_LIQUIDO", '+
        '    CTP_VALOR "CHF_BASE", '+
        '    CAST(0 AS INTEGER) CHF_TIPO '+
        'FROM CONTAS_PAGAR '+
        'INNER JOIN ENTRADAS ON ENT_FRETE_SEQ_CTP = CTP_SEQUENCIA '+
        'WHERE CTP_CHAVE_ELET_CONH NOT IN (SELECT CHF_KEY FROM CONHECIMENTO_FRETE) '+

        'UNION ALL '+
        'SELECT '+
        '    CHF_NUMERO "CHF_NUM", '+
        '    CAST(CHF_SERIE AS INTEGER) "CHF_SERIE", '+
        '    CHF_CFOP "CHF_CFOP", '+
        '    CAST(COALESCE(CHF_DATA_ENTRADA, CHF_EMISSAO) AS DATE) "CHF_EMISSAO", '+
        '    ENT_NOTAFISCAL "NFE_NUM", '+
        '    CAST(''55'' AS VARCHAR(2)) "NFE_MOD", '+
        '    CAST(CASE WHEN COALESCE(ENT_SERIE, '''') IN (''NF'', ''NFE'') THEN ''1'' ELSE ENT_SERIE END AS INTEGER) "NFE_SERIE", '+
        '    CHF_VOLUME, '+
        '    CHF_PESO, '+
        '    CAST(NULL AS NUMERIC(15,2)) "CHF_LIQUIDO", '+
        '    CHF_BASE,'+
        '    CHF_TIPO '+
        'FROM CONHECIMENTO_FRETE '+
        'LEFT JOIN ENTRADAS ON ENT_CHAVE_NFE = CHF_KEYNF '+
        'WHERE CHF_TIPO = 0 '+

        'UNION ALL '+
        'SELECT '+
        '    CHF_NUMERO "CHF_NUM", '+
        '    CAST(CHF_SERIE AS INTEGER) "CHF_SERIE", '+
        '    CHF_CFOP "CHF_CFOP", '+
        '    CAST(COALESCE(CHF_DATA_ENTRADA, CHF_EMISSAO) AS DATE) "CHF_EMISSAO", '+
        '    FTR_NOTAFISCAL "NFE_NUM", '+
        '    CAST(''55'' AS VARCHAR(2)) "NFE_MOD", '+
        '    CAST(FTR_SERIE_NFE AS INTEGER) "NFE_SERIE", '+
        '    CHF_VOLUME, '+
        '    CHF_PESO, '+
        '    CAST(NULL AS NUMERIC(15,2)) "CHF_LIQUIDO", '+
        '    CHF_BASE,'+
        '    CHF_TIPO '+
        'FROM CONHECIMENTO_FRETE '+
        'LEFT JOIN FATURAS ON FTR_CHAVE_NFE = CHF_KEYNF '+
        'WHERE CHF_TIPO = 1 '+
        '   ) '+
        'WHERE CHF_EMISSAO BETWEEN :DATA1 AND :DATA2 '+
        'ORDER BY CHF_EMISSAO, CHF_NUM ';

      ParamByName('DATA1').AsDateTime := DateEdit1.date;
      ParamByName('DATA2').AsDateTime := DateEdit2.date;
      Active := true;
      First;
      reg := 0;   qtReg := RecordCount;
      valor := 0;

      insReg('');
      insReg('>> CONHECIMENTO DE FRETE (CONHINT.TXT)');
      insReg(StringOfChar('-', 50));
      insReg(Format('%-10s %10s %10s %15s', ['NUMERO','EMISSAO','NFE', 'VALOR']));
      while not Eof do
      begin
        valor := valor + FieldByName('CHF_BASE').AsFloat;
        Writeln(F, Format('%10s', [FieldByName('CHF_NUM').AsString])+
                   Format('%3s', [FieldByName('CHF_SERIE').AsString])+
                   Format('%4s', [FieldByName('CHF_CFOP').AsString])+
                   Format('%6s', [''])+
                   Format('%8s', [FormatDateTime('DDMMYYYY', FieldByName('CHF_EMISSAO').AsDateTime)])+
                   Format('%10s', [FieldByName('NFE_NUM').AsString])+
                   Format('%2s', [FieldByName('NFE_MOD').AsString])+
                   Format('%3s', [FieldByName('NFE_SERIE').AsString])+
                   FormataValorComPontoDecimal(FieldByName('CHF_BASE').AsFloat,14,2)+
                   FormatCurr('0000000000', FieldByName('CHF_VOLUME').AsInteger)+
                   FormataValorComPontoDecimal(FieldByName('CHF_PESO').AsFloat,11,2)+
                   FormataValorComPontoDecimal(FieldByName('CHF_LIQUIDO').AsFloat,11,2));
        inc(reg); ProgressBar.Position := Round((reg/qtReg)*100);

        insReg(Format('%-10s %10s %10s %15.2f',
                     [FieldByName('CHF_NUM').AsString,
                      FieldByName('CHF_EMISSAO').AsString,
                      FieldByName('NFE_NUM').AsString,
                      FieldByName('CHF_BASE').AsFloat]));

        Application.ProcessMessages;
        Next;
      end;
      Free();
    end;
  finally
    insReg(StringOfChar('-', 50));
    insReg(' Total: '+IntTostr(reg)+' conhecimento(s) de frete');
    insReg(' Valor: '+FormatCurr('R$ ,0.00', valor));
    ProgressBar.visible := false;
    CloseFile(F);
  end;
end;

end.

