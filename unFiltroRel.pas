unit unFiltroRel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXCtrls, StdCtrls, ExtCtrls, Buttons, Mask, Db, QuickRpt,
  Qrctrls, QRExport, unDataModule2, IBCustomDataSet, IBQuery;

type
  TfrmFiltroRel = class(TForm)
    Bevel2: TBevel;
    Bevel1: TBevel;
    BotaoSair: TBitBtn;
    Panel1: TPanel;
    Label4: TLabel;
    SaidaImp: TRadioButton;
    SaidaTela: TRadioButton;
    BitBtn2: TBitBtn;
    lTitulo: TRxLabel;
    Bevel3: TBevel;
    QuickRep1: TQuickRep;
    qrTitulo: TQRBand;
    CompQRTitulo: TQRLabel;
    qrDetalhe: TQRBand;
    CompQRCampo: TQRDBText;
    qrGrupo: TQRGroup;
    CompQRGrupo: TQRLabel;
    qrResGrupo: TQRBand;
    CompQRResGrupo: TQRLabel;
    qrResumo: TQRBand;
    CompQRResumo: TQRLabel;
    listaSQL: TListBox;
    SaidaHTML: TRadioButton;
    SaveDialog1: TSaveDialog;
    qryAux: TIBQuery;
    qryAux1: TIBQuery;
    qryAuxFig: TIBQuery;
    qryDados: TIBQuery;
    qryAuxFigGER_FIG: TBlobField;
    qryAuxFigGER_COD: TIBStringField;
    qryAuxGR_CODIGO: TIntegerField;
    qryAuxGR_IDENTIFICACAO: TIBStringField;
    qryAuxGR_DATA_CRIACAO: TDateTimeField;
    qryAuxGR_TIT_NOME: TIBStringField;
    qryAuxGR_TIT_BANDA: TIBStringField;
    qryAuxGR_TIT_FONT_NOME: TIBStringField;
    qryAuxGR_TIT_FONT_TAM: TIntegerField;
    qryAuxGR_TIT_FONT_COR: TIBStringField;
    qryAuxGR_TIT_FONT_ESTILO: TIBStringField;
    qryAuxGR_TIT_ALIGN: TIBStringField;
    qryAuxGR_TIT_TOP: TIntegerField;
    qryAuxGR_TIT_LEFT: TIntegerField;
    qryAuxGR_TIT_CAPTION: TIBStringField;
    qryAuxGR_CAMPO_NOME: TIBStringField;
    qryAuxGR_CAMPO_BANDA: TIBStringField;
    qryAuxGR_CAMPO_FONT_NOME: TIBStringField;
    qryAuxGR_CAMPO_FONT_TAM: TIntegerField;
    qryAuxGR_CAMPO_FONT_COR: TIBStringField;
    qryAuxGR_CAMPO_FONT_ESTILO: TIBStringField;
    qryAuxGR_CAMPO_ALIGN: TIBStringField;
    qryAuxGR_CAMPO_TOP: TIntegerField;
    qryAuxGR_CAMPO_LEFT: TIntegerField;
    qryAuxGR_CAMPO_TAMANHO: TIntegerField;
    qryAuxGR_CAMPO_MASK: TIBStringField;
    qryAuxGR_CAMPO_TABELA: TIBStringField;
    qryAuxGR_CAMPO_CAMPO: TIBStringField;
    qryAuxGR_CAMPO_LKP_TBL: TIBStringField;
    qryAuxGR_CAMPO_LKP_KEY: TIBStringField;
    qryAuxGR_CAMPO_LKP_RESULT: TIBStringField;
    qryAuxGR_LINHA_NOME: TIBStringField;
    qryAuxGR_LINHA_BANDA: TIBStringField;
    qryAuxGR_LINHA_TOP: TIntegerField;
    qryAuxGR_LINHA_LEFT: TIntegerField;
    qryAuxGR_LINHA_TAMANHO: TIntegerField;
    qryAuxGR_LINHA_TIPO: TIBStringField;
    qryAuxGR_FIG_NOME: TIBStringField;
    qryAuxGR_FIG_BANDA: TIBStringField;
    qryAuxGR_FIG_TOP: TIntegerField;
    qryAuxGR_FIG_LEFT: TIntegerField;
    qryAuxGR_FIG_HEIGHT: TIntegerField;
    qryAuxGR_FIG_WIDTH: TIntegerField;
    qryAuxGR_FIG_STRETCH: TIBStringField;
    qryAuxGR_FIG_AUTOSIZE: TIBStringField;
    qryAuxGR_BNDHEADER_TAM: TIntegerField;
    qryAuxGR_BNDDETAIL_TAM: TIntegerField;
    qryAuxGR_BNDSUMARY_TAM: TIntegerField;
    qryAuxGR_BNDGROUPHEADER_EXISTE: TIBStringField;
    qryAuxGR_BNDGROUPHEADER_CAMPO: TIBStringField;
    qryAuxGR_BNDGROUPHEADER_TAM: TIntegerField;
    qryAuxGR_BNDGROUPFOOTER_EXISTE: TIBStringField;
    qryAuxGR_BNDGROUPFOOTER_TAM: TIntegerField;
    qryAuxGR_EXPR_NOME: TIBStringField;
    qryAuxGR_EXPR_BANDA: TIBStringField;
    qryAuxGR_EXPR_FONT_NOME: TIBStringField;
    qryAuxGR_EXPR_FONT_TAM: TIntegerField;
    qryAuxGR_EXPR_FONT_COR: TIBStringField;
    qryAuxGR_EXPR_FONT_ESTILO: TIBStringField;
    qryAuxGR_EXPR_TOP: TIntegerField;
    qryAuxGR_EXPR_LEFT: TIntegerField;
    qryAuxGR_EXPR_MASK: TIBStringField;
    qryAuxGR_EXPR_EXPRESSAO: TIBStringField;
    qryAuxGR_EXPR_TAMANHO: TIntegerField;
    qryAuxGR_MACRO_NOME: TIBStringField;
    qryAuxGR_EXPR_RESETA: TIBStringField;
    qryAuxGR_MACRO_BANDA: TIBStringField;
    qryAuxGR_MACRO_FONT_NOME: TIBStringField;
    qryAuxGR_MACRO_FONT_TAM: TIntegerField;
    qryAuxGR_MACRO_FONT_COR: TIBStringField;
    qryAuxGR_MACRO_FONT_ESTILO: TIBStringField;
    qryAuxGR_MACRO_TOP: TIntegerField;
    qryAuxGR_MACRO_LEFT: TIntegerField;
    qryAuxGR_MACRO_MACRO: TIBStringField;
    qryAuxGR_TEXTOSQL: TIBStringField;
    qryAuxGR_USUARIO: TIBStringField;
    qryAuxGR_CRIADOR: TIBStringField;
    qryAuxGR_EXPR_ALIGN: TIBStringField;
    qryAuxGR_FRAME_CABECALHO: TIBStringField;
    qryAuxGR_FRAME_DETALHE: TIBStringField;
    qryAuxGR_FRAME_GRUPO: TIBStringField;
    qryAuxGR_FRAME_RESGRUPO: TIBStringField;
    qryAuxGR_FRAME_RESUMO: TIBStringField;
    qryAuxGR_FIG_FIGURA: TBlobField;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BotaoSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRep1Preview(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
  	vCodigoRel : string;
    { Public declarations }
  end;

var
  frmFiltroRel: TfrmFiltroRel;


implementation
uses unPreview, qrprntr, unFuncoes;

{$R *.DFM}

function StringToEstiloFonte(vEstilo : string) : TFontStyles;
begin
  if vEstilo = '[]' then Result := [];
  if vEstilo = '[fsBold]' then Result := [fsBold];
  if vEstilo = '[fsItalic]' then Result := [fsItalic];
  if vEstilo = '[fsUnderline]' then Result := [fsUnderline];
  if vEstilo = '[fsBold,fsItalic]' then Result := [fsBold,fsItalic];
  if vEstilo = '[fsBold,fsUnderline]' then Result := [fsBold,fsUnderline];
  if vEstilo = '[fsItalic,fsUnderline]' then Result := [fsItalic,fsUnderline];
  if vEstilo = '[fsBold,fsItalic,fsUnderline]' then Result := [fsBold,fsItalic,fsUnderline];
end;

procedure TfrmFiltroRel.FormShow(Sender: TObject);
var
	vTitulo : TLabel;
  vEdit : TMaskEdit;
  vTop, cont, vAuxCont : integer;
begin
	with qryAux1 do
  begin
  	Close;
    SQL.Clear;
    SQL.Add('select * from GERADOR_RELATORIO_FILTROS where GRF_CODIGO = ' + vCodigoRel);
    Open;
  end;
  vTop := 50;

  listaSQL.Items.Clear;
  vAuxCont := 10;
  while NOT qryAux1.EOF do
  begin
    vEdit := TMaskEdit.Create(self);
    vEdit.Left := 180;
    vEdit.Top := vTop;
    vEdit.Width := qryAux1.FieldByName('GRF_TAMANHO').AsInteger * 7;
    if vEdit.Width > 200 then vEdit.Width := 200;
    vEdit.Text := '';
    if qryAux1.FieldByName('GRF_TIPO').AsString = 'D' then
    	vEdit.EditMask := '99/99/9999;1; ';
    vEdit.Hint := IntToStr(vAuxCont);
    vEdit.Parent := BotaoSair.Parent;
    vTitulo := TLabel.Create(Application);
    vTitulo.Left := 30;
    vTitulo.Top := vTop + 4;
    if qryAux1.FieldByName('GRF_TITULO').AsString <> '=' then
    	vTitulo.Caption := qryAux1.FieldByName('GRF_TITULO').AsString + '  ' + qryAux1.FieldByName('GRF_OPERADOR').AsString + ' '
    else
    	vTitulo.Caption := qryAux1.FieldByName('GRF_TITULO').AsString;
    vTitulo.Width := 140;
    vTitulo.AutoSize := False;
    vTitulo.Alignment := taRightJustify;
    vTitulo.Parent := BotaoSair.Parent;
    vTop := vTop + 30;
    listaSQL.Items.Add(IntToStr(vAuxCont) + qryAux1.FieldByName('GRF_CONDICAO').AsString +
                       ' ' + qryAux1.FieldByName('GRF_CAMPO').AsString +
                       ' ' + qryAux1.FieldByName('GRF_OPERADOR').AsString);
    vAuxCont := vAuxCont + 1;
    qryAux1.Next;
  end;
  for cont := ComponentCount - 1 downto 0 do
    if (Components[cont] is TMaskEdit) then
      if TMaskEdit(Components[cont]).Hint = '10' then
      begin
        TMaskEdit(Components[cont]).SetFocus;
        Break;
      end;
end;

procedure TfrmFiltroRel.BitBtn2Click(Sender: TObject);
var
  cont, cont2 : integer;
  vAuxSQL : string;
  vqrLabel : TQRLabel;
  vqrCampo : TQRDBText;
  vqrExp   : TQRExpr;
  vqrLinha : TQRShape;
  vqrImagem: TQRDBImage;
  vqrMacro : TQRSysData;
  vStream  : TMemoryStream;

begin
  qryAux.First;
  qrTitulo.Height := qryAuxGR_BNDHEADER_TAM.Value;
  qrGrupo.Height := qryAuxGR_BNDGROUPHEADER_TAM.Value;
  qrGrupo.Expression := 'qryDados.' + qryAuxGR_BNDGROUPHEADER_CAMPO.Value;
  qrDetalhe.Height := qryAuxGR_BNDDETAIL_TAM.Value;
  qrResGrupo.Height := qryAuxGR_BNDGROUPFOOTER_TAM.Value;
  qrResumo.Height := qryAuxGR_BNDSUMARY_TAM.Value;

  //Frames:
  qrTitulo.Frame.DrawTop := False;  qrTitulo.Frame.DrawBottom := False;
  qrTitulo.Frame.DrawLeft := False; qrTitulo.Frame.DrawRight := False;
  qrGrupo.Frame.DrawTop := False;   qrGrupo.Frame.DrawBottom := False;
  qrGrupo.Frame.DrawLeft := False;  qrGrupo.Frame.DrawRight := False;
  qrDetalhe.Frame.DrawTop := False;  qrDetalhe.Frame.DrawBottom := False;
  qrDetalhe.Frame.DrawLeft := False; qrDetalhe.Frame.DrawRight := False;
  qrResGrupo.Frame.DrawTop := False;  qrResGrupo.Frame.DrawBottom := False;
  qrResGrupo.Frame.DrawLeft := False; qrResGrupo.Frame.DrawRight := False;
  qrResumo.Frame.DrawTop := False;  qrResumo.Frame.DrawBottom := False;
  qrResumo.Frame.DrawLeft := False; qrResumo.Frame.DrawRight := False;

  if Pos('T', qryAuxGR_FRAME_CABECALHO.Value) <> 0 then qrTitulo.Frame.DrawTop := True;
  if Pos('B', qryAuxGR_FRAME_CABECALHO.Value) <> 0 then qrTitulo.Frame.DrawBottom := True;
  if Pos('L', qryAuxGR_FRAME_CABECALHO.Value) <> 0 then qrTitulo.Frame.DrawLeft := True;
  if Pos('R', qryAuxGR_FRAME_CABECALHO.Value) <> 0 then qrTitulo.Frame.DrawRight := True;

  if Pos('T', qryAuxGR_FRAME_GRUPO.Value) <> 0 then qrGrupo.Frame.DrawTop := True;
  if Pos('B', qryAuxGR_FRAME_GRUPO.Value) <> 0 then qrGrupo.Frame.DrawBottom := True;
  if Pos('L', qryAuxGR_FRAME_GRUPO.Value) <> 0 then qrGrupo.Frame.DrawLeft := True;
  if Pos('R', qryAuxGR_FRAME_GRUPO.Value) <> 0 then qrGrupo.Frame.DrawRight := True;

  if Pos('T', qryAuxGR_FRAME_DETALHE.Value) <> 0 then qrDetalhe.Frame.DrawTop := True;
  if Pos('B', qryAuxGR_FRAME_DETALHE.Value) <> 0 then qrDetalhe.Frame.DrawBottom := True;
  if Pos('L', qryAuxGR_FRAME_DETALHE.Value) <> 0 then qrDetalhe.Frame.DrawLeft := True;
  if Pos('R', qryAuxGR_FRAME_DETALHE.Value) <> 0 then qrDetalhe.Frame.DrawRight := True;

  if Pos('T', qryAuxGR_FRAME_RESGRUPO.Value) <> 0 then qrResGrupo.Frame.DrawTop := True;
  if Pos('B', qryAuxGR_FRAME_RESGRUPO.Value) <> 0 then qrResGrupo.Frame.DrawBottom := True;
  if Pos('L', qryAuxGR_FRAME_RESGRUPO.Value) <> 0 then qrResGrupo.Frame.DrawLeft := True;
  if Pos('R', qryAuxGR_FRAME_RESGRUPO.Value) <> 0 then qrResGrupo.Frame.DrawRight := True;

  if Pos('T', qryAuxGR_FRAME_RESUMO.Value) <> 0 then qrResumo.Frame.DrawTop := True;
  if Pos('B', qryAuxGR_FRAME_RESUMO.Value) <> 0 then qrResumo.Frame.DrawBottom := True;
  if Pos('L', qryAuxGR_FRAME_RESUMO.Value) <> 0 then qrResumo.Frame.DrawLeft := True;
  if Pos('R', qryAuxGR_FRAME_RESUMO.Value) <> 0 then qrResumo.Frame.DrawRight := True;

  //Filtros:
  for cont := ComponentCount - 1 downto 0 do
   if (Components[cont] is TMaskEdit) then
    if (TMaskEdit(Components[cont]).Text <> '') and (TMaskEdit(Components[cont]).Text <> '  /  /    ') then
    begin
      if TMaskEdit(Components[cont]).EditMask = '99/99/9999;1; ' then TMaskEdit(Components[cont]).Text := InverteData(TMaskEdit(Components[cont]).Text);
      for cont2 := 0 to listaSQL.Items.Count - 1 do
      if TMaskEdit(Components[cont]).Hint = copy(listaSQL.Items.Strings[cont2],1,2) then
      begin
        vAuxSQL := vAuxSQL + ' ' + copy(listaSQL.Items.Strings[cont2],3,30) + ' ' + QuotedStr(TMaskEdit(Components[cont]).Text);
      end;
    end;
  //

  with qryDados do
  begin
    Close;
    SQL.Clear;
    SQL.Add(copy(qryAuxGR_TEXTOSQL.Value, 1, Pos('order by',qryAuxGR_TEXTOSQL.Value)-1));
    SQL.Add(vAuxSQL);
    SQL.Add(copy(qryAuxGR_TEXTOSQL.Value, Pos('order by',qryAuxGR_TEXTOSQL.Value), 30));
    Open;
  end;

  QuickRep1.DataSet := qryDados;
  CompQRTitulo.Left := -200; CompQRCampo.Left := -200;
  CompQRGrupo.Left  := -200; compQRResGrupo.Left := -200;
  CompQRResumo.Left := -200;

  while NOT qryAux.EOF do
  begin
    //titulos:
    if qryAuxGR_TIT_BANDA.Value <> '' then
    begin
      vqrLabel := TQRLabel.Create(Application);
      vqrLabel.Caption := qryAuxGR_TIT_CAPTION.Value;
      vqrLabel.Font.Name := qryAuxGR_TIT_FONT_NOME.Value;
      vqrLabel.Font.Size := qryAuxGR_TIT_FONT_TAM.Value;
      vqrLabel.Font.Color := qryAuxGR_TIT_FONT_COR.AsInteger;
      vqrLabel.Font.Style := StringToEstiloFonte(qryAuxGR_TIT_FONT_ESTILO.Value);
      vqrLabel.Top := qryAuxGR_TIT_TOP.Value;
      vqrLabel.Left := qryAuxGR_TIT_LEFT.Value;
      if qryAuxGR_TIT_ALIGN.Value = 'L' then vqrLabel.Alignment := taLeftJustify;
      if qryAuxGR_TIT_ALIGN.Value = 'R' then vqrLabel.Alignment := taRightJustify;
      if qryAuxGR_TIT_BANDA.Value = 'CABECALHO' then vqrLabel.Parent := CompQRTitulo.Parent;
      if qryAuxGR_TIT_BANDA.Value = 'DETALHE'   then vqrLabel.Parent := CompQRCampo.Parent;
      if qryAuxGR_TIT_BANDA.Value = 'GRUPO'     then vqrLabel.Parent := CompQRGrupo.Parent;
      if qryAuxGR_TIT_BANDA.Value = 'RESGRUPO'  then vqrLabel.Parent := CompQRResGrupo.Parent;
      if qryAuxGR_TIT_BANDA.Value = 'RESUMO'    then vqrLabel.Parent := CompQRResumo.Parent;
    end;
    //campos:
    if qryAuxGR_CAMPO_BANDA.Value <> '' then
    begin
      vqrCampo := TQRDBText.Create(Application);
      vqrCampo.DataSet := qryDados;
      vqrCampo.DataField := qryAuxGR_CAMPO_CAMPO.Value;
      vqrCampo.AutoSize := False;
      vqrCampo.Width := qryAuxGR_CAMPO_TAMANHO.Value;
      vqrCampo.Mask := qryAuxGR_CAMPO_MASK.Value;
      vqrCampo.Font.Name := qryAuxGR_CAMPO_FONT_NOME.Value;
      vqrCampo.Font.Size := qryAuxGR_CAMPO_FONT_TAM.Value;
      vqrCampo.Font.Color := qryAuxGR_CAMPO_FONT_COR.AsInteger;
      vqrCampo.Font.Style := StringToEstiloFonte(qryAuxGR_CAMPO_FONT_ESTILO.Value);
      vqrCampo.Top := qryAuxGR_CAMPO_TOP.Value;
      vqrCampo.Left := qryAuxGR_CAMPO_LEFT.Value;
      if qryAuxGR_CAMPO_ALIGN.Value = 'L' then vqrCampo.Alignment := taLeftJustify;
      if qryAuxGR_CAMPO_ALIGN.Value = 'R' then vqrCampo.Alignment := taRightJustify;
      if qryAuxGR_CAMPO_ALIGN.Value = 'C' then vqrCampo.Alignment := taCenter;
      if qryAuxGR_CAMPO_BANDA.Value = 'CABECALHO' then vqrCampo.Parent := CompQRTitulo.Parent;
      if qryAuxGR_CAMPO_BANDA.Value = 'DETALHE'   then vqrCampo.Parent := CompQRCampo.Parent;
      if qryAuxGR_CAMPO_BANDA.Value = 'GRUPO'     then vqrCampo.Parent := CompQRGrupo.Parent;
      if qryAuxGR_CAMPO_BANDA.Value = 'RESGRUPO'  then vqrCampo.Parent := CompQRResGrupo.Parent;
      if qryAuxGR_CAMPO_BANDA.Value = 'RESUMO'    then vqrCampo.Parent := CompQRResumo.Parent;
    end;
    //expressoes:
    if qryAuxGR_EXPR_BANDA.Value <> '' then
    begin
      vqrExp := TQRExpr.Create(Application);
      vqrExp.Expression := qryAuxGR_EXPR_EXPRESSAO.Value;
      vqrExp.AutoSize := False;
      vqrExp.Width := qryAuxGR_EXPR_TAMANHO.Value;
      vqrExp.Mask := qryAuxGR_EXPR_MASK.Value;
      vqrExp.Font.Name := qryAuxGR_EXPR_FONT_NOME.Value;
      vqrExp.Font.Size := qryAuxGR_EXPR_FONT_TAM.Value;
      vqrExp.Font.Color := qryAuxGR_EXPR_FONT_COR.AsVariant;
      vqrExp.Font.Style := StringToEstiloFonte(qryAuxGR_EXPR_FONT_ESTILO.Value);
      vqrExp.Top := qryAuxGR_EXPR_TOP.Value;
      vqrExp.Left := qryAuxGR_EXPR_LEFT.Value;
      if qryAuxGR_EXPR_RESETA.Value = 'S' then vqrExp.ResetAfterPrint := True;
      if qryAuxGR_EXPR_RESETA.Value = 'N' then vqrExp.ResetAfterPrint := False;
      if qryAuxGR_EXPR_ALIGN.Value = 'L' then vqrExp.Alignment := taLeftJustify;
      if qryAuxGR_EXPR_ALIGN.Value = 'R' then vqrExp.Alignment := taRightJustify;
      if qryAuxGR_EXPR_ALIGN.Value = 'C' then vqrExp.Alignment := taCenter;
      if qryAuxGR_EXPR_BANDA.Value = 'CABECALHO' then vqrExp.Parent := CompQRTitulo.Parent;
      if qryAuxGR_EXPR_BANDA.Value = 'DETALHE'   then vqrExp.Parent := CompQRCampo.Parent;
      if qryAuxGR_EXPR_BANDA.Value = 'GRUPO'     then vqrExp.Parent := CompQRGrupo.Parent;
      if qryAuxGR_EXPR_BANDA.Value = 'RESGRUPO'  then vqrExp.Parent := CompQRResGrupo.Parent;
      if qryAuxGR_EXPR_BANDA.Value = 'RESUMO'    then vqrExp.Parent := CompQRResumo.Parent;
    end;

    //macros:
    if qryAuxGR_MACRO_BANDA.Value <> '' then
    begin
      vqrMacro := TQRSysData.Create(Application);
      if qryAuxGR_MACRO_MACRO.Value = 'Data' then vqrMacro.Data := qrsDate;
      if qryAuxGR_MACRO_MACRO.Value = 'Hora' then vqrMacro.Data := qrsTime;
      if qryAuxGR_MACRO_MACRO.Value = 'NumPagina' then vqrMacro.Data := qrsPageNumber;
      vqrMacro.Font.Name := qryAuxGR_MACRO_FONT_NOME.Value;
      vqrMacro.Font.Size := qryAuxGR_MACRO_FONT_TAM.Value;
      vqrMacro.Font.Color := qryAuxGR_MACRO_FONT_COR.AsVariant;
      vqrMacro.Font.Style := StringToEstiloFonte(qryAuxGR_MACRO_FONT_ESTILO.Value);
      vqrMacro.Top := qryAuxGR_MACRO_TOP.Value;
      vqrMacro.Left := qryAuxGR_MACRO_LEFT.Value;
      if qryAuxGR_MACRO_BANDA.Value = 'CABECALHO' then vqrMacro.Parent := CompQRTitulo.Parent;
      if qryAuxGR_MACRO_BANDA.Value = 'DETALHE'   then vqrMacro.Parent := CompQRCampo.Parent;
      if qryAuxGR_MACRO_BANDA.Value = 'GRUPO'     then vqrMacro.Parent := CompQRGrupo.Parent;
      if qryAuxGR_MACRO_BANDA.Value = 'RESGRUPO'  then vqrMacro.Parent := CompQRResGrupo.Parent;
      if qryAuxGR_MACRO_BANDA.Value = 'RESUMO'    then vqrMacro.Parent := CompQRResumo.Parent;
    end;

    //linhas:
    if qryAuxGR_LINHA_BANDA.Value <> '' then
    begin
      vqrLinha := TQRShape.Create(Application);
      if qryAuxGR_LINHA_TIPO.Value = 'H' then
      begin
        vqrLinha.Shape := qrsHorLine;
        vqrLinha.Width := qryAuxGR_LINHA_TAMANHO.Value;
        vqrLinha.Height := 3;
      end;
      if qryAuxGR_LINHA_TIPO.Value = 'V' then
      begin
        vqrLinha.Shape := qrsVertLine;
        vqrLinha.Width := 3;
        vqrLinha.Height := qryAuxGR_LINHA_TAMANHO.Value;
      end;
      vqrLinha.Top := qryAuxGR_LINHA_TOP.Value;
      vqrLinha.Left := qryAuxGR_LINHA_LEFT.Value;
      if qryAuxGR_LINHA_BANDA.Value = 'CABECALHO' then vqrLinha.Parent := CompQRTitulo.Parent;
      if qryAuxGR_LINHA_BANDA.Value = 'DETALHE'   then vqrLinha.Parent := CompQRCampo.Parent;
      if qryAuxGR_LINHA_BANDA.Value = 'GRUPO'     then vqrLinha.Parent := CompQRGrupo.Parent;
      if qryAuxGR_LINHA_BANDA.Value = 'RESGRUPO'  then vqrLinha.Parent := CompQRResGrupo.Parent;
      if qryAuxGR_LINHA_BANDA.Value = 'RESUMO'    then vqrLinha.Parent := CompQRResumo.Parent;
    end;

    //figuras:
    if qryAuxGR_FIG_BANDA.Value <> '' then
    begin
      vqrImagem := TQRDBImage.Create(Application);
      {vStream := TMemoryStream.Create;
      qryAuxGR_FIG_FIGURA.SaveToStream(vStream);
      vqrImagem.Picture.Bitmap.LoadFromStream(vStream);
      vStream.Free;}
      ExecutaSQL('select * from GERADOR_REL_FIG where GER_COD = ' + QuotedStr(qryAuxGR_CODIGO.AsString), qryAuxFig);
      vqrImagem.DataSet := qryAuxFig;
      vqrImagem.DataField := qryAuxFigGER_FIG.FieldName;
      vqrImagem.Top := qryAuxGR_FIG_TOP.Value;
      vqrImagem.Left := qryAuxGR_FIG_LEFT.Value;
      vqrImagem.Height := qryAuxGR_FIG_HEIGHT.Value;
      vqrImagem.Width := qryAuxGR_FIG_WIDTH.Value;
      vqrImagem.Stretch := True;
      vqrImagem.LoadPicture;
      if qryAuxGR_FIG_BANDA.Value = 'CABECALHO' then vqrImagem.Parent := CompQRTitulo.Parent;
      if qryAuxGR_FIG_BANDA.Value = 'DETALHE'   then vqrImagem.Parent := CompQRCampo.Parent;
      if qryAuxGR_FIG_BANDA.Value = 'GRUPO'     then vqrImagem.Parent := CompQRGrupo.Parent;
      if qryAuxGR_FIG_BANDA.Value = 'RESGRUPO'  then vqrImagem.Parent := CompQRResGrupo.Parent;
      if qryAuxGR_FIG_BANDA.Value = 'RESUMO'    then vqrImagem.Parent := CompQRResumo.Parent;
    end;

    qryAux.Next;
  end;
  if SaidaTela.Checked then QuickRep1.Preview;
  if SaidaImp.Checked then QuickRep1.Print;
  if SaidaHTML.Checked then
  begin
    SaveDialog1.FileName := qryAuxGR_IDENTIFICACAO.Value;
    //SaveDialog1.Filter
    SaveDialog1.Execute;


  end;

  //********************************************************************
   //exportando em modo texto
  { vExportFiltroTexto := TQRTextDocumentFilter.Create('REPORT.TXT');
   QuickRep1.ExportToFilter(vExportFiltroTexto );
   vExportFiltroTexto.Free;
   //exportando em html
   vExportFiltroHtml := TQRHTMLDocumentFilter.Create('REPORT.HTM');
   QuickRep1.ExportToFilter(vExportFiltroHtml);
   vExportFiltroHtml.Free;}
  //**************************************************************


  //apagar os Labels e dbLabels criados
  //menos os que ja existiam (Tag=20)
  for cont := ComponentCount - 1 downto 0 do
    if (Components[cont] is TQRLabel) then
      if TQRLabel(Components[cont]).Tag <> 20 then
        TQRLabel(Components[cont]).Free;

  for cont := ComponentCount - 1 downto 0 do
    if (Components[cont] is TQRDBText) then
      if TQRDBText(Components[cont]).Tag <> 20 then
        TQRDBText(Components[cont]).Free;

  for cont := ComponentCount - 1 downto 0 do
    if (Components[cont] is TQRExpr) then
      if TQRexpr(Components[cont]).Tag <> 20 then
        TQRExpr(Components[cont]).Free;
end;

procedure TfrmFiltroRel.BotaoSairClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmFiltroRel.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
	cont : integer;
begin
  Action := caFree;
 { for cont := ComponentCount - 1 downto 0 do
    if (Components[cont] is TLabel) then
    	TLabel(Components[cont]).Free;
  for cont := ComponentCount - 1 downto 0 do
    if (Components[cont] is TMaskEdit) then
    	TMaskEdit(Components[cont]).Free;  }
end;

procedure TfrmFiltroRel.QuickRep1Preview(Sender: TObject);
begin
  FormPreview := TFormPreview.Create(Application);
  FormPreview.QRPreview1.QRPrinter := TQRPrinter(Sender);
  FormPreview.Show;
end;

procedure TfrmFiltroRel.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
