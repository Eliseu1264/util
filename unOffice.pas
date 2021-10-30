unit unOffice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXSpin, StdCtrls, Buttons, ExtCtrls, RxCombos, ComCtrls, ToolWin, ExtDlgs,
  IBCustomDataSet, IBUpdateSQL, Db, IBQuery, Menus, rxPlacemnt, Mask;

type
  TfrmOffice = class(TForm)
    FontComboBox1: TFontComboBox;
    ComboBox1: TComboBox;
    ColorComboBox1: TColorComboBox;
    btSublinhado: TSpeedButton;
    btItalico: TSpeedButton;
    btNegrito: TSpeedButton;
    GroupBox1: TGroupBox;
    lCoordenadas: TLabel;
    Bevel2: TBevel;
    LabelAux: TLabel;
    Panel99: TPanel;
    Panel1: TPanel;
    Logo: TImage;
    E1: TEdit;
    L1: TPanel;
    pnConfigura: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel3: TPanel;
    cbAjustaAutoSize: TCheckBox;
    cbAjustaStretch: TCheckBox;
    BitBtn5: TBitBtn;
    edImagem: TEdit;
    BitBtn3: TBitBtn;
    edImagemAltura: TRxSpinEdit;
    edImagemLargura: TRxSpinEdit;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    edImagemX: TEdit;
    edImagemY: TEdit;
    E2: TEdit;
    E3: TEdit;
    E4: TEdit;
    E5: TEdit;
    E6: TEdit;
    E7: TEdit;
    E8: TEdit;
    E9: TEdit;
    E10: TEdit;
    E11: TEdit;
    E12: TEdit;
    E13: TEdit;
    E14: TEdit;
    E15: TEdit;
    E16: TEdit;
    E17: TEdit;
    E18: TEdit;
    E19: TEdit;
    E20: TEdit;
    E21: TEdit;
    E22: TEdit;
    L2: TPanel;
    L3: TPanel;
    L4: TPanel;
    btUP: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn9: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    BitBtn10: TBitBtn;
    Bevel3: TBevel;
    E23: TEdit;
    E24: TEdit;
    E25: TEdit;
    E26: TEdit;
    E27: TEdit;
    E28: TEdit;
    E29: TEdit;
    E30: TEdit;
    cbModelos: TComboBox;
    Label1: TLabel;
    qryEditor: TIBQuery;
    updEditor: TIBUpdateSQL;
    qryEditorEDC_CAMPO: TIBStringField;
    qryEditorEDC_FONT_NOME: TIBStringField;
    qryEditorEDC_FONT_TAM: TIntegerField;
    qryEditorEDC_FONT_COR: TIBStringField;
    qryEditorEDC_TOP: TIntegerField;
    qryEditorEDC_LEFT: TIntegerField;
    qryEditorEDC_WIDTH: TIntegerField;
    qryEditorEDC_AUTOSIZE: TIBStringField;
    qryEditorEDC_STRETCH: TIBStringField;
    qryEditorEDC_CAMPO1: TIBStringField;
    qryEditorEDC_FONT_NOME1: TIBStringField;
    qryEditorEDC_FONT_TAM1: TIntegerField;
    qryEditorEDC_FONT_COR1: TIBStringField;
    qryEditorEDC_TOP1: TIntegerField;
    qryEditorEDC_LEFT1: TIntegerField;
    qryEditorEDC_WIDTH1: TIntegerField;
    qryEditorEDC_AUTOSIZE1: TIBStringField;
    qryEditorEDC_STRETCH1: TIBStringField;
    qryEditorEDC_CAMPO2: TIBStringField;
    qryEditorEDC_FONT_NOME2: TIBStringField;
    qryEditorEDC_FONT_TAM2: TIntegerField;
    qryEditorEDC_FONT_COR2: TIBStringField;
    qryEditorEDC_TOP2: TIntegerField;
    qryEditorEDC_LEFT2: TIntegerField;
    qryEditorEDC_WIDTH2: TIntegerField;
    qryEditorEDC_AUTOSIZE2: TIBStringField;
    qryEditorEDC_STRETCH2: TIBStringField;
    qryEditorEDC_FONT_ESTILO: TIBStringField;
    qryEditorEDC_FONT_ESTILO1: TIBStringField;
    qryEditorEDC_FONT_ESTILO2: TIBStringField;
    L5: TPanel;
    pnTamLinha: TPanel;
    lTamLinha: TLabel;
    Panel6: TPanel;
    SpeedButton5: TSpeedButton;
    TrackBar2: TTrackBar;
    Panel13: TPanel;
    popAlinha2: TPopupMenu;
    Alinharhorizontalmente1: TMenuItem;
    Alinharverticalmente1: TMenuItem;
    popAlinha: TPopupMenu;
    Marcar1: TMenuItem;
    Desmarcar1: TMenuItem;
    SpeedButton25: TSpeedButton;
    Label2: TLabel;
    FormStorage1: TFormStorage;
    qryEditorEDC_HEIGHT: TIntegerField;
    qryEditorEDC_HEIGHT1: TIntegerField;
    qryEditorEDC_HEIGHT2: TIntegerField;
    N1: TMenuItem;
    InserirData1: TMenuItem;
    DDMMAAAA1: TMenuItem;
    Extensa1: TMenuItem;
    Extensacomnomedacidade1: TMenuItem;
    Simplecomhora1: TMenuItem;
    Inserirdadosdaempresa1: TMenuItem;
    Nome1: TMenuItem;
    CGC1: TMenuItem;
    Endereo1: TMenuItem;
    BitBtn11: TBitBtn;
    Panel2: TPanel;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    InserirAutotexto1: TMenuItem;
    btMenu: TButton;
    qryEditorEDC_TEXTO: TIBStringField;
    qryEditorEDC_TEXTO1: TIBStringField;
    qryEditorEDC_TEXTO2: TIBStringField;
    Button1: TButton;
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    //
    procedure AtualizaExibicoesDeFormatacao();
    procedure AjeitaTamanhoTitulos();
    //
    procedure btNegritoClick(Sender: TObject);
    procedure btSublinhadoClick(Sender: TObject);
    procedure btItalicoClick(Sender: TObject);
    procedure FontComboBox1Change(Sender: TObject);
    procedure ColorComboBox1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure E1Change(Sender: TObject);
    procedure btUPClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure LogoClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure edImagemLarguraChange(Sender: TObject);
    procedure edImagemAlturaChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbAjustaStretchClick(Sender: TObject);
    procedure cbAjustaAutoSizeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure E1Enter(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure L1DblClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure qryEditorAfterPost(DataSet: TDataSet);
    procedure Marcar1Click(Sender: TObject);
    procedure Desmarcar1Click(Sender: TObject);
    procedure Alinharhorizontalmente1Click(Sender: TObject);
    procedure Alinharverticalmente1Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure cbModelosChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DDMMAAAA1Click(Sender: TObject);
    procedure Simplecomhora1Click(Sender: TObject);
    procedure Extensa1Click(Sender: TObject);
    procedure Extensacomnomedacidade1Click(Sender: TObject);
    procedure Nome1Click(Sender: TObject);
    procedure Endereo1Click(Sender: TObject);
    procedure CGC1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure btMenuClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    //
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
	constCorPrimaria = $00E0EFFF;
  constCorSecundaria = $00E0E4FB;
  constCorEdits = $00F2EFEE;

var
  frmOffice: TfrmOffice;
  CompAtivo : TObject;
  MouseDownSpot : TPoint;
  Capturing : bool;
  vSBh, vSBv : integer;


implementation

uses unDataModule2, unFuncoes, unRelOffice, QuickRpt, Qrctrls, unMenu;

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

function EstiloFonteToString(vEstilo : TFontStyles) : string;
var
  vAuxEstiloFonte : string;
begin
  vAuxEstiloFonte := '[';
  if fsBold in vEstilo then
    vAuxEstiloFonte := vAuxEstiloFonte + 'fsBold,';
  if fsItalic in vEstilo then
    vAuxEstiloFonte := vAuxEstiloFonte + 'fsItalic,';
  if fsUnderline in vEstilo then
    vAuxEstiloFonte := vAuxEstiloFonte + 'fsUnderline';
  if copy(vAuxEstiloFonte, Length(vAuxEstiloFonte), 1) = ',' then
    Delete(vAuxEstiloFonte, Length(vAuxEstiloFonte), 1);
  Result := vAuxEstiloFonte + ']';
end;

procedure TfrmOffice.AjeitaTamanhoTitulos();
begin
  try
  	if (TEdit(CompAtivo).Tag = 8) then Exit;
  	if (TEdit(CompAtivo).Tag = 9) then Exit;
  	LabelAux.Caption := TEdit(CompAtivo).Text;
  	LabelAux.Font := TEdit(CompAtivo).Font;
  	LabelAux.AutoSize := True;
  	TEdit(CompAtivo).Width := LabelAux.Width + 12;
 	 	TEdit(CompAtivo).Height := LabelAux.Height + 4;
  	AtualizaExibicoesDeFormatacao();
  except
  end;
end;

procedure TfrmOffice.AtualizaExibicoesDeFormatacao();
begin
  if fsBold in TEdit(CompAtivo).Font.Style then btNegrito.Flat := False
  else btNegrito.Flat := True;
  if fsItalic in TEdit(CompAtivo).Font.Style then btItalico.Flat := False
  else btItalico.Flat := True;
  if fsUnderline in TEdit(CompAtivo).Font.Style then btSublinhado.Flat := False
  else btSublinhado.Flat := True;

{  if TEdit(CompAtivo).Alignment = taLeftJustify then btEsquerda.Flat := False
  else btEsquerda.Flat := True;
  if TEdit(CompAtivo).Alignment = taCenter then btCentro.Flat := False
  else btCentro.Flat := True;
  if TEdit(CompAtivo).Alignment = taRightJustify then btDireita.Flat := False
  else btDireita.Flat := True;}

  FontComboBox1.FontName := TEdit(CompAtivo).Font.Name;
  ColorComboBox1.ColorValue := TEdit(CompAtivo).Font.Color;

  case TEdit(CompAtivo).Font.Size of
     7 : ComboBox1.ItemIndex := 0;
     8 : ComboBox1.ItemIndex := 1;
     9 : ComboBox1.ItemIndex := 2;
    10 : ComboBox1.ItemIndex := 3;
    11 : ComboBox1.ItemIndex := 4;
    12 : ComboBox1.ItemIndex := 5;
    14 : ComboBox1.ItemIndex := 6;
    16 : ComboBox1.ItemIndex := 7;
    18 : ComboBox1.ItemIndex := 8;
  end;
end;

procedure TfrmOffice.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then Exit;
  try
    if CompAtivo <> nil then
      if TComponent(Sender) is TEdit then
        TEdit(CompAtivo).BorderStyle := bsNone;
    CompAtivo := TComponent(Sender);
    if TComponent(Sender) is TEdit then
      TEdit(CompAtivo).BorderStyle := bsSingle;
  except
    CompAtivo := nil;
  end;

  if TComponent(Sender) is TLabel then Exit;
  if Sender = Panel1 then Exit;
  if TComponent(Sender) is TEdit then
  	AtualizaExibicoesDeFormatacao();
  if (ssLeft in Shift) and (Sender <> Panel1) then
  begin
    SetCapture(TButton(Sender).Handle);
    Capturing := True;
    MouseDownSpot.X := X;
    MouseDownSpot.Y := Y;
  end;
end;

procedure TfrmOffice.Panel1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if Sender = Panel1 then
    Panel1.Cursor := crDefault;
  if Capturing then
  begin
    TButton(Sender).BringToFront;
    TButton(Sender).Left := TButton(Sender).Left - (MouseDownSpot.x - X);
    TButton(Sender).Top  := TButton(Sender).Top - (MouseDownSpot.y - Y);
  end;
    if Sender = Panel1 then
    begin
      lCoordenadas.Caption := ' X = ' + (FormatFloat('#0.00', X/30.15)) + '  Y = ' + (FormatFloat('#0.00', Y/30.15));
    end
    else
      if (TButton(Sender).Left/30.15 < 0 ) or (TButton(Sender).Top/30.15 < 0.4) or (TButton(Sender).Left/30.15 > 23.2 ) or (TButton(Sender).Top > 420 ) then
      begin
        lCoordenadas.Caption := 'Objeto fora da área!';
        lCoordenadas.Font.Color := clRed;
      end
      else
      begin
        lCoordenadas.Caption := ' X = ' + (FormatFloat('#0.00', TButton(Sender).Left/30.15)) + '  Y = ' + (FormatFloat('#0.00', TButton(Sender).Top/30.15));
        lCoordenadas.Font.Color := clBlack;
      end;
end;

procedure TfrmOffice.Panel1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Capturing then
  begin
    Capturing := False;
    ReleaseCapture;
    TButton(Sender).Left := TButton(Sender).Left - (MouseDownSpot.x - X);
    TButton(Sender).Top  := TButton(Sender).Top - (MouseDownSpot.y - Y);
  end
  else
    Capturing := False;
end;

procedure TfrmOffice.btNegritoClick(Sender: TObject);
begin
  if CompAtivo is TEdit then
  begin
    if fsBold in TEdit(CompAtivo).Font.Style then
      TEdit(CompAtivo).Font.Style := TEdit(CompAtivo).Font.Style - [fsBold]
    else
      TEdit(CompAtivo).Font.Style := TEdit(CompAtivo).Font.Style + [fsBold];
    AjeitaTamanhoTitulos();
  end;
end;

procedure TfrmOffice.btSublinhadoClick(Sender: TObject);
begin
  if CompAtivo is TEdit then
  begin
    if fsUnderline in TEdit(CompAtivo).Font.Style then
      TEdit(CompAtivo).Font.Style := TEdit(CompAtivo).Font.Style - [fsUnderline]
    else
      TEdit(CompAtivo).Font.Style := TEdit(CompAtivo).Font.Style + [fsUnderline];
    AjeitaTamanhoTitulos();
  end;
end;

procedure TfrmOffice.btItalicoClick(Sender: TObject);
begin
  if CompAtivo is TEdit then
  begin
    if fsItalic in TEdit(CompAtivo).Font.Style then
      TEdit(CompAtivo).Font.Style := TEdit(CompAtivo).Font.Style - [fsItalic]
    else
      TEdit(CompAtivo).Font.Style := TEdit(CompAtivo).Font.Style + [fsItalic];
    AjeitaTamanhoTitulos();
  end;
end;

procedure TfrmOffice.FontComboBox1Change(Sender: TObject);
begin
  if CompAtivo is TEdit then
  begin
    TEdit(CompAtivo).Font.Name := FontComboBox1.FontName;
    AjeitaTamanhoTitulos();
  end;
end;

procedure TfrmOffice.ColorComboBox1Change(Sender: TObject);
begin
  if CompAtivo is TEdit then
    TEdit(CompAtivo).Font.Color := ColorComboBox1.ColorValue;
end;

procedure TfrmOffice.ComboBox1Change(Sender: TObject);
begin
  if CompAtivo is TEdit then
  begin
    TEdit(CompAtivo).Font.Size := StrToInt(ComboBox1.Items.Strings[ComboBox1.ItemIndex]);
    AjeitaTamanhoTitulos();
  end;
end;

procedure TfrmOffice.E1Change(Sender: TObject);
begin
	AjeitaTamanhoTitulos();
end;

procedure TfrmOffice.btUPClick(Sender: TObject);
begin
  if Panel1.Top = 0 then
    Panel1.Top := -350
  else if Panel1.Top = -350 then
    Panel1.Top := 0;
end;

procedure TfrmOffice.BitBtn2Click(Sender: TObject);
begin
  if Panel1.Left = 0 then
    Panel1.Left := -280
  else if Panel1.Left = -280 then
   	Panel1.Left := 0;
end;

procedure TfrmOffice.LogoClick(Sender: TObject);
begin
  pnConfigura.Visible := True;
  pnConfigura.BringToFront;
  pnConfigura.Left := 320;
  pnConfigura.Top := 60;
end;

procedure TfrmOffice.BitBtn4Click(Sender: TObject);
begin
  Logo.Top := Logo.Top - 2;
  edImagemX.Text := FormatFloat('###,##0.00', Logo.Left/30.15);
  edImagemY.Text := FormatFloat('###,##0.00', Logo.Top/30.15);
end;

procedure TfrmOffice.BitBtn6Click(Sender: TObject);
begin
  Logo.Top := Logo.Top + 2;
  edImagemX.Text := FormatFloat('###,##0.00', Logo.Left/30.15);
  edImagemY.Text := FormatFloat('###,##0.00', Logo.Top/30.15);
end;

procedure TfrmOffice.BitBtn7Click(Sender: TObject);
begin
  Logo.Left := Logo.Left - 2;
  edImagemX.Text := FormatFloat('###,##0.00', Logo.Left/30.15);
  edImagemY.Text := FormatFloat('###,##0.00', Logo.Top/30.15);
end;

procedure TfrmOffice.BitBtn8Click(Sender: TObject);
begin
  Logo.Left := Logo.Left + 2;
  edImagemX.Text := FormatFloat('###,##0.00', Logo.Left/30.15);
  edImagemY.Text := FormatFloat('###,##0.00', Logo.Top/30.15);
end;

procedure TfrmOffice.BitBtn5Click(Sender: TObject);
begin
  OpenPictureDialog1.Execute;
  edImagem.Text := OpenPictureDialog1.FileName;
  if Trim(edImagem.Text) <> '' then
    Logo.Picture.LoadFromFile(edImagem.Text);
  if cbAjustaStretch.Checked then
    Logo.Stretch := True
  else
    Logo.Stretch := False;
  if cbAjustaAutoSize.Checked then
    Logo.AutoSize := True
  else
    Logo.AutoSize := False;
end;

procedure TfrmOffice.edImagemLarguraChange(Sender: TObject);
begin
  Logo.Width := Trunc(edImagemLargura.Value*30.15);
end;

procedure TfrmOffice.edImagemAlturaChange(Sender: TObject);
begin
  Logo.Height := Trunc(edImagemAltura.Value*30.15);
end;

procedure TfrmOffice.BitBtn3Click(Sender: TObject);
begin
  pnConfigura.Visible := False;
end;

procedure TfrmOffice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree;
end;

procedure TfrmOffice.cbAjustaStretchClick(Sender: TObject);
begin
  if cbAjustaStretch.Checked then
    Logo.Stretch := True
  else
    Logo.Stretch := False;
  edImagemAltura.Value := Logo.Height / 30.15;
  edImagemLargura.Value := Logo.Width / 30.15;
end;

procedure TfrmOffice.cbAjustaAutoSizeClick(Sender: TObject);
begin
  if cbAjustaAutoSize.Checked then
    Logo.AutoSize := True
  else
    Logo.AutoSize := False;
  edImagemAltura.Value := Logo.Height / 30.15;
  edImagemLargura.Value := Logo.Width / 30.15;
end;

procedure TfrmOffice.FormShow(Sender: TObject);
var
  cont, cont2 : integer;
  vItem : string;
begin
  Panel2.Left := -500;
  SpeedButton1.Click;
	Panel1.Top := 0;
  Panel1.Left := 0;
  cbModelos.ItemIndex := 0;
  case cbModelos.ItemIndex of
  	0 : vItem := '';
    1 : vItem := '1';
    2 : vItem := '2';
  end;
  ExecutaSQL('select * from EDITOR_CONFIG', qryEditor);
  for cont := 1 to 30 do
  begin
    qryEditor.Locate('EDC_CAMPO'+vItem, 'E'+IntToStr(cont), []);
    for cont2 := ComponentCount - 1 downto 0 do
    	if Components[cont2] is TEdit then
      	if Components[cont2].Name = 'E' + IntToStr(cont) then
        begin
          TEdit(Components[cont2]).Left := qryEditor.FieldByName('EDC_LEFT'+vItem).Value;
          TEdit(Components[cont2]).Top  := qryEditor.FieldByName('EDC_TOP'+vItem).Value;
          TEdit(Components[cont2]).Text := qryEditor.FieldByName('EDC_TEXTO'+vItem).AsString;
          TEdit(Components[cont2]).Font.Name := qryEditor.FieldByName('EDC_FONT_NOME'+vItem).Value;
          TEdit(Components[cont2]).Font.Size := qryEditor.FieldByName('EDC_FONT_TAM' +vItem).Value;
          TEdit(Components[cont2]).Font.Color := qryEditor.FieldByName('EDC_FONT_COR'+vItem).AsInteger;
          TEdit(Components[cont2]).Font.Style := StringToEstiloFonte(qryEditor.FieldByName('EDC_FONT_ESTILO'+vItem).Value);
        end;
  end;

  for cont := 1 to 5 do
  begin
    qryEditor.Locate('EDC_CAMPO'+vItem, 'L'+IntToStr(cont), []);
    for cont2 := ComponentCount - 1 downto 0 do
    	if Components[cont2] is TPanel then
      	if Components[cont2].Name = 'L' + IntToStr(cont) then
        begin
          TPanel(Components[cont2]).Left  := qryEditor.FieldByName('EDC_LEFT'+vItem).Value;
          TPanel(Components[cont2]).Top   := qryEditor.FieldByName('EDC_TOP'+vItem).Value;
          TPanel(Components[cont2]).Width := qryEditor.FieldByName('EDC_WIDTH'+vItem).Value;
        end;
  end;

  qryEditor.Locate('EDC_CAMPO'+vItem, 'F', []);
  logo.Picture.LoadFromFile(qryEditor.FieldByName('EDC_FONT_ESTILO'+vItem).Value);
  edImagem.Text := qryEditor.FieldByName('EDC_FONT_ESTILO'+vItem).Value;
  if qryEditor.FieldByName('EDC_AUTOSIZE'+vItem).Value = 'S' then logo.AutoSize := True
  else logo.AutoSize := False;
  if qryEditor.FieldByName('EDC_STRETCH'+vItem).Value = 'S' then logo.Stretch := True
  else logo.Stretch := False;
  logo.Top := qryEditor.FieldByName('EDC_TOP'+vItem).Value;
  logo.Left := qryEditor.FieldByName('EDC_LEFT'+vItem).Value;
  logo.Width := qryEditor.FieldByName('EDC_WIDTH'+vItem).Value;
  logo.Height := qryEditor.FieldByName('EDC_HEIGHT'+vItem).Value;
  Button1.Click;
end;

procedure TfrmOffice.BitBtn10Click(Sender: TObject);
begin
	Close;
end;

procedure TfrmOffice.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOffice.E1Enter(Sender: TObject);
begin
	try
    if CompAtivo <> nil then
      if TComponent(Sender) is TEdit then
        TEdit(CompAtivo).BorderStyle := bsNone;
    CompAtivo := TComponent(Sender);
    if TComponent(Sender) is TEdit then
      TEdit(CompAtivo).BorderStyle := bsSingle;
  except
    CompAtivo := nil;
  end;
 	AtualizaExibicoesDeFormatacao();
end;

procedure TfrmOffice.TrackBar2Change(Sender: TObject);
begin
  if (TPanel(CompAtivo).Tag <> 3) then Exit;
  TPanel(CompAtivo).Width := TrackBar2.Position;
  lTamLinha.Caption := 'Tamanho da linha: ' + IntToStr(TrackBar2.Position) + ' (' + FormatFloat('###,##0.00', TrackBar2.Position/30.15) + 'cm)';
  if TPanel(CompAtivo).Width + TPanel(CompAtivo).Left > 660 then
  	TrackBar2.Position := TrackBar2.Position - 5;
  if TrackBar2.Position < 20 then
    TrackBar2.Position := 20;
end;

procedure TfrmOffice.L1DblClick(Sender: TObject);
begin
  pnTamLinha.Visible := True;
 	pnTamLinha.Top := 294;
 	pnTamLinha.Left := 284;
  pnTamLinha.BringToFront;
  TrackBar2.Position := (TPanel(CompAtivo).Width);
  lTamLinha.Caption := 'Tamanho da linha: ' + IntToStr(TrackBar2.Position) + ' (' + FormatFloat('###,##0.00', TrackBar2.Position/30.15) + 'cm)';
end;

procedure TfrmOffice.SpeedButton5Click(Sender: TObject);
begin
	pnTamLinha.Visible := False;
end;

procedure TfrmOffice.BitBtn9Click(Sender: TObject);
var
  cont, cont2 : integer;
  vItem : string;
begin
	case cbModelos.ItemIndex of
  	0 : vItem := '';
    1 : vItem := '1';
    2 : vItem := '2';
  end;
  ExecutaSQL('select * from EDITOR_CONFIG', qryEditor);
  for cont := 1 to 30 do
  begin
    qryEditor.Locate('EDC_CAMPO'+vItem, 'E'+IntToStr(cont), []);
    for cont2 := ComponentCount - 1 downto 0 do
    	if Components[cont2] is TEdit then
      	if Components[cont2].Name = 'E' + IntToStr(cont) then
        begin
          qryEditor.Edit;
          qryEditor.FieldByName('EDC_LEFT'+vItem).Value := TEdit(Components[cont2]).Left;
          qryEditor.FieldByName('EDC_TOP'+vItem).Value := TEdit(Components[cont2]).Top;
          qryEditor.FieldByName('EDC_TEXTO'+vItem).Value := TEdit(Components[cont2]).Text;
          qryEditor.FieldByName('EDC_FONT_NOME'+vItem).Value := TEdit(Components[cont2]).Font.Name;
          qryEditor.FieldByName('EDC_FONT_TAM' +vItem).Value := TEdit(Components[cont2]).Font.Size;
          qryEditor.FieldByName('EDC_FONT_COR'+vItem).AsInteger := TEdit(Components[cont2]).Font.Color;
          qryEditor.FieldByName('EDC_FONT_ESTILO'+vItem).Value := EstiloFonteToString(TEdit(Components[cont2]).Font.Style);
          qryEditor.Post;
        end;
  end;

  for cont := 1 to 5 do
  begin
    qryEditor.Locate('EDC_CAMPO'+vItem, 'L'+IntToStr(cont), []);
    for cont2 := ComponentCount - 1 downto 0 do
    	if Components[cont2] is TPanel then
      	if Components[cont2].Name = 'L' + IntToStr(cont) then
        begin
          qryEditor.Edit;
          qryEditor.FieldByName('EDC_LEFT'+vItem).Value := TPanel(Components[cont2]).Left;
          qryEditor.FieldByName('EDC_TOP'+vItem).Value := TPanel(Components[cont2]).Top;
          qryEditor.FieldByName('EDC_WIDTH'+vItem).Value := TPanel(Components[cont2]).Width;
          qryEditor.Post;
        end;
  end;

  qryEditor.Locate('EDC_CAMPO'+vItem, 'F', []);
  qryEditor.Edit;
  qryEditor.FieldByName('EDC_FONT_ESTILO'+vItem).Value := edImagem.Text;
  qryEditor.FieldByName('EDC_TOP'+vItem).Value := logo.Top;
  qryEditor.FieldByName('EDC_LEFT'+vItem).Value := logo.Left;
  qryEditor.FieldByName('EDC_WIDTH'+vItem).Value := logo.Width;
  qryEditor.FieldByName('EDC_HEIGHT'+vItem).Value := logo.Height;
  if logo.AutoSize then
  	qryEditor.FieldByName('EDC_AUTOSIZE'+vItem).Value := 'S'
  else
    qryEditor.FieldByName('EDC_AUTOSIZE'+vItem).Value := 'N';
  if logo.Stretch then
  	qryEditor.FieldByName('EDC_STRETCH'+vItem).Value := 'S'
  else
  	qryEditor.FieldByName('EDC_STRETCH'+vItem).Value := 'N';
  qryEditor.Post;

  dm2.IBTransaction1.CommitRetaining;
end;

procedure TfrmOffice.qryEditorAfterPost(DataSet: TDataSet);
begin
  if qryEditor.UpdateStatus = usInserted then updEditor.Apply(ukInsert);
  if qryEditor.UpdateStatus = usModified then updEditor.Apply(ukModify);
end;

procedure TfrmOffice.Marcar1Click(Sender: TObject);
var
  cont : integer;
begin
  if TEdit(popAlinha.PopupComponent).Color = constCorPrimaria then Exit;
  for cont := ComponentCount - 1 downto 0 do
    if Components[cont] is TEdit then
      if TEdit(Components[cont]).Color = constCorPrimaria then
        TEdit(popAlinha.PopupComponent).Color := constCorSecundaria;
  if TEdit(popAlinha.PopupComponent).Color = constCorEdits then
    TEdit(popAlinha.PopupComponent).Color := constCorPrimaria;
end;

procedure TfrmOffice.Desmarcar1Click(Sender: TObject);
var
  cont : integer;
begin
  if TEdit(popAlinha.PopupComponent).Color = constCorPrimaria then
  begin
    if Pergunta('Este é o componente chave do alinhamento. Se você desmarcá-lo, todos os outros componentes serão desmarcados! Continua?') = 'N' then
      Exit
      else
  		begin
  			for cont := ComponentCount - 1 downto 0 do
    			if Components[cont] is TEdit then
      			if TEdit(Components[cont]).Color = constCorSecundaria then
        			TEdit(Components[cont]).Color := constCorEdits;
  		end;
  end;
  TEdit(popAlinha.PopupComponent).Color := constCorEdits;
end;

procedure TfrmOffice.Alinharhorizontalmente1Click(Sender: TObject);
var
  cont, vAltura : integer;
begin
	vAltura:=0;
  for cont := ComponentCount - 1 downto 0 do
    if Components[cont] is TEdit then
      if TEdit(Components[cont]).Color = constCorPrimaria then
      begin
        vAltura := TEdit(Components[cont]).Top;
        TEdit(Components[cont]).Color := constCorEdits;
      end;
  for cont := ComponentCount - 1 downto 0 do
    if Components[cont] is TEdit then
      if TEdit(Components[cont]).Color = constCorSecundaria then
      begin
        TEdit(Components[cont]).Top := vAltura;
        TEdit(Components[cont]).Color := constCorEdits;
      end;
end;

procedure TfrmOffice.Alinharverticalmente1Click(Sender: TObject);
var
  cont, vEsquerda : integer;
begin
	vEsquerda:=0;
  for cont := ComponentCount - 1 downto 0 do
    if Components[cont] is TEdit then
      if TEdit(Components[cont]).Color = constCorPrimaria then
      begin
        vEsquerda := TEdit(Components[cont]).Left;
        TEdit(Components[cont]).Color := constCorEdits;
      end;
  for cont := ComponentCount - 1 downto 0 do
    if Components[cont] is TEdit then
      if TEdit(Components[cont]).Color = constCorSecundaria then
      begin
        TEdit(Components[cont]).Left := vEsquerda;
        TEdit(Components[cont]).Color := constCorEdits;
      end;
end;

procedure TfrmOffice.SpeedButton25Click(Sender: TObject);
begin
	popAlinha2.Popup(SpeedButton25.Left+Left-162, SpeedButton25.Top+Top+125);
end;

procedure TfrmOffice.cbModelosChange(Sender: TObject);
var
  cont, cont2 : integer;
  vItem : string;
begin
	Panel1.Top := 0;
  Panel1.Left := 0;
  case cbModelos.ItemIndex of
  	0 : vItem := '';
    1 : vItem := '1';
    2 : vItem := '2';
  end;
  ExecutaSQL('select * from EDITOR_CONFIG', qryEditor);
  for cont := 1 to 30 do
  begin
    qryEditor.Locate('EDC_CAMPO'+vItem, 'E'+IntToStr(cont), []);
    for cont2 := ComponentCount - 1 downto 0 do
    	if Components[cont2] is TEdit then
      	if Components[cont2].Name = 'E' + IntToStr(cont) then
        begin
          TEdit(Components[cont2]).Left := qryEditor.FieldByName('EDC_LEFT'+vItem).Value;
          TEdit(Components[cont2]).Top  := qryEditor.FieldByName('EDC_TOP'+vItem).Value;
          TEdit(Components[cont2]).Text  := qryEditor.FieldByName('EDC_TEXTO'+vItem).AsString;
          TEdit(Components[cont2]).Font.Name := qryEditor.FieldByName('EDC_FONT_NOME'+vItem).Value;
          TEdit(Components[cont2]).Font.Size := qryEditor.FieldByName('EDC_FONT_TAM' +vItem).Value;
          TEdit(Components[cont2]).Font.Color := qryEditor.FieldByName('EDC_FONT_COR'+vItem).AsInteger;
          TEdit(Components[cont2]).Font.Style := StringToEstiloFonte(qryEditor.FieldByName('EDC_FONT_ESTILO'+vItem).Value);
        end;
  end;

  for cont := 1 to 5 do
  begin
    qryEditor.Locate('EDC_CAMPO'+vItem, 'L'+IntToStr(cont), []);
    for cont2 := ComponentCount - 1 downto 0 do
    	if Components[cont2] is TPanel then
      	if Components[cont2].Name = 'L' + IntToStr(cont) then
        begin
          TPanel(Components[cont2]).Left  := qryEditor.FieldByName('EDC_LEFT'+vItem).Value;
          TPanel(Components[cont2]).Top   := qryEditor.FieldByName('EDC_TOP'+vItem).Value;
          TPanel(Components[cont2]).Width := qryEditor.FieldByName('EDC_WIDTH'+vItem).Value;
        end;
  end;

  qryEditor.Locate('EDC_CAMPO'+vItem, 'F', []);
  logo.Picture.LoadFromFile(qryEditor.FieldByName('EDC_FONT_ESTILO'+vItem).Value);
  edImagem.Text := qryEditor.FieldByName('EDC_FONT_ESTILO'+vItem).Value;
  if qryEditor.FieldByName('EDC_AUTOSIZE'+vItem).Value = 'S' then logo.AutoSize := True
  else logo.AutoSize := False;

  if qryEditor.FieldByName('EDC_STRETCH'+vItem).Value = 'S' then logo.Stretch := True
  else logo.Stretch := False;
  logo.Top := qryEditor.FieldByName('EDC_TOP'+vItem).Value;
  logo.Left := qryEditor.FieldByName('EDC_LEFT'+vItem).Value;
  logo.Width := qryEditor.FieldByName('EDC_WIDTH'+vItem).Value;
  logo.Height := qryEditor.FieldByName('EDC_HEIGHT'+vItem).Value;
  Button1.Click;
end;

procedure TfrmOffice.BitBtn1Click(Sender: TObject);
var
  cont, cont2, cont3 : integer;
  vItem : string;
begin
	case cbModelos.ItemIndex of
  	0 : vItem := '';
    1 : vItem := '1';
    2 : vItem := '2';
  end;
  ExecutaSQL('select * from EDITOR_CONFIG', qryEditor);
  frmRelOffice := TfrmRelOffice.Create(Application);
  for cont := 1 to 30 do
  begin
    qryEditor.Locate('EDC_CAMPO'+vItem, 'E'+IntToStr(cont), []);
    for cont2 := ComponentCount - 1 downto 0 do
    	if Components[cont2] is TEdit then
      	if Components[cont2].Name = 'E' + IntToStr(cont) then
        begin
        	for cont3 := frmRelOffice.ComponentCount - 1 downto 0 do
    				if frmRelOffice.Components[cont3].Name = 'qrl' + IntToStr(cont) then
        		begin
            	TQRLabel(frmRelOffice.Components[cont3]).Left := TEdit(Components[cont2]).Left;
          		TQRLabel(frmRelOffice.Components[cont3]).Top  := TEdit(Components[cont2]).Top;
          		TQRLabel(frmRelOffice.Components[cont3]).Font.Name := TEdit(Components[cont2]).Font.Name;
          		TQRLabel(frmRelOffice.Components[cont3]).Font.Size := TEdit(Components[cont2]).Font.Size;
          		TQRLabel(frmRelOffice.Components[cont3]).Font.Color := TEdit(Components[cont2]).Font.Color;
          		TQRLabel(frmRelOffice.Components[cont3]).Font.Style := TEdit(Components[cont2]).Font.Style;
              TQRLabel(frmRelOffice.Components[cont3]).Caption := TEdit(Components[cont2]).Text;
            end;
        end;
  end;

  for cont := 1 to 5 do
  begin
    qryEditor.Locate('EDC_CAMPO'+vItem, 'L'+IntToStr(cont), []);
    for cont2 := ComponentCount - 1 downto 0 do
    	if Components[cont2] is TPanel then
      	if Components[cont2].Name = 'L' + IntToStr(cont) then
        begin
        	for cont3 := frmRelOffice.ComponentCount - 1 downto 0 do
    				if frmRelOffice.Components[cont3].Name = 'L' + IntToStr(cont) then
        		begin
            	TQRShape(frmRelOffice.Components[cont3]).Left := TPanel(Components[cont2]).Left;
          		TQRShape(frmRelOffice.Components[cont3]).Top  := TPanel(Components[cont2]).Top;
          		TQRShape(frmRelOffice.Components[cont3]).Width := TPanel(Components[cont2]).Width;
            end;
        end;
  end;

  qryEditor.Locate('EDC_CAMPO'+vItem, 'F', []);
  frmRelOffice.qrF.Picture.LoadFromFile(edImagem.Text);
  frmRelOffice.qrF.Top := logo.Top;
  frmRelOffice.qrF.Left := logo.Left;
  frmRelOffice.qrF.AutoSize := logo.AutoSize;
  frmRelOffice.qrF.Stretch := logo.Stretch;
  frmRelOffice.qrF.Height := logo.Height;
  frmRelOffice.qrF.Width := logo.Width;
  
  frmRelOffice.QuickRep1.Preview;
end;

procedure TfrmOffice.DDMMAAAA1Click(Sender: TObject);
begin
	TEdit(popAlinha.PopupComponent).Text := DateToStr(NOW);
  CompAtivo := TEdit(popAlinha.PopupComponent);
  Application.ProcessMessages;
  AjeitaTamanhoTitulos();
end;

procedure TfrmOffice.Simplecomhora1Click(Sender: TObject);
begin
	TEdit(popAlinha.PopupComponent).Text := DateTimeToStr(NOW);
  CompAtivo := TEdit(popAlinha.PopupComponent);
  Application.ProcessMessages;
  AjeitaTamanhoTitulos();
end;

procedure TfrmOffice.Extensa1Click(Sender: TObject);
begin
	TEdit(popAlinha.PopupComponent).Text := DataExtenso(Date);
  CompAtivo := TEdit(popAlinha.PopupComponent);
  Application.ProcessMessages;
  AjeitaTamanhoTitulos();
end;

procedure TfrmOffice.Extensacomnomedacidade1Click(Sender: TObject);
begin
	TEdit(popAlinha.PopupComponent).Text := frmMenu.CidadeDaEmpresa + ', ' + DataExtenso(Date);
  CompAtivo := TEdit(popAlinha.PopupComponent);
  Application.ProcessMessages;
  AjeitaTamanhoTitulos();
end;

procedure TfrmOffice.Nome1Click(Sender: TObject);
begin
	TEdit(popAlinha.PopupComponent).Text := frmMenu.NomeDaEmpresa;
  CompAtivo := TEdit(popAlinha.PopupComponent);
  Application.ProcessMessages;
  AjeitaTamanhoTitulos();
end;

procedure TfrmOffice.Endereo1Click(Sender: TObject);
begin
	TEdit(popAlinha.PopupComponent).Text := frmMenu.EnderecoDaEmpresa + ' ' + frmMenu.BairroDaEmpresa;
  CompAtivo := TEdit(popAlinha.PopupComponent);
  Application.ProcessMessages;
  AjeitaTamanhoTitulos();
end;

procedure TfrmOffice.CGC1Click(Sender: TObject);
begin
	TEdit(popAlinha.PopupComponent).Text := copy(frmMenu.CGCDaEmpresa,1,2) + '.'+
  																				copy(frmMenu.CGCDaEmpresa,3,3) + '.'+
                                          copy(frmMenu.CGCDaEmpresa,6,3) + '/'+
                                          copy(frmMenu.CGCDaEmpresa,9,4) + '-'+
                                          copy(frmMenu.CGCDaEmpresa,13,2);
  CompAtivo := TEdit(popAlinha.PopupComponent);
  Application.ProcessMessages;
  AjeitaTamanhoTitulos();
end;

procedure TfrmOffice.SpeedButton1Click(Sender: TObject);
var
	x : TMenuItem;
  cont : integer;
begin
	Panel2.Left := -500;
  for cont := 0 to 100 do
  begin
    try
      popAlinha.Items[5][cont].Visible := False;
    except
    end;
  end;

  if Trim(Edit1.Text) <> '' then
  begin
  	x := TMenuItem.Create(Self);  x.Caption := Edit1.Text;
  	x.OnClick := btMenu.OnClick;  popAlinha.Items[5].Add(x);
  end;
  if Trim(Edit2.Text) <> '' then
  begin
  	x := TMenuItem.Create(Self);  x.Caption := Edit2.Text;
  	x.OnClick := btMenu.OnClick;  popAlinha.Items[5].Add(x);
  end;
  if Trim(Edit3.Text) <> '' then
  begin
  	x := TMenuItem.Create(Self);  x.Caption := Edit3.Text;
  	x.OnClick := btMenu.OnClick;  popAlinha.Items[5].Add(x);
  end;
  if Trim(Edit4.Text) <> '' then
  begin
  	x := TMenuItem.Create(Self);  x.Caption := Edit4.Text;
  	x.OnClick := btMenu.OnClick;  popAlinha.Items[5].Add(x);
  end;
  if Trim(Edit5.Text) <> '' then
  begin
  	x := TMenuItem.Create(Self);  x.Caption := Edit5.Text;
  	x.OnClick := btMenu.OnClick;  popAlinha.Items[5].Add(x);
  end;
  if Trim(Edit6.Text) <> '' then
  begin
  	x := TMenuItem.Create(Self);  x.Caption := Edit6.Text;
  	x.OnClick := btMenu.OnClick;  popAlinha.Items[5].Add(x);
  end;
  if Trim(Edit7.Text) <> '' then
  begin
  	x := TMenuItem.Create(Self);  x.Caption := Edit7.Text;
  	x.OnClick := btMenu.OnClick;  popAlinha.Items[5].Add(x);
  end;
  if Trim(Edit8.Text) <> '' then
  begin
  	x := TMenuItem.Create(Self);  x.Caption := Edit8.Text;
  	x.OnClick := btMenu.OnClick;  popAlinha.Items[5].Add(x);
  end;
  if Trim(Edit9.Text) <> '' then
  begin
  	x := TMenuItem.Create(Self);  x.Caption := Edit9.Text;
  	x.OnClick := btMenu.OnClick;  popAlinha.Items[5].Add(x);
  end;
  if Trim(Edit10.Text) <> '' then
  begin
  	x := TMenuItem.Create(Self);  x.Caption := Edit10.Text;
  	x.OnClick := btMenu.OnClick;  popAlinha.Items[5].Add(x);
  end;
  if Trim(Edit11.Text) <> '' then
  begin
  	x := TMenuItem.Create(Self);  x.Caption := Edit11.Text;
  	x.OnClick := btMenu.OnClick;  popAlinha.Items[5].Add(x);
  end;
  if Trim(Edit12.Text) <> '' then
  begin
  	x := TMenuItem.Create(Self);  x.Caption := Edit12.Text;
  	x.OnClick := btMenu.OnClick;  popAlinha.Items[5].Add(x);
  end;
end;

procedure TfrmOffice.BitBtn11Click(Sender: TObject);
begin
	Panel2.Left := 296;
  Panel2.Top := 253;
  Edit1.SetFocus;
end;

procedure TfrmOffice.btMenuClick(Sender: TObject);
begin
	TEdit(popAlinha.PopupComponent).Text := TMenuItem(sender).Caption;
  if Pos('&',TEdit(popAlinha.PopupComponent).Text) <> 0 then
  	TEdit(popAlinha.PopupComponent).Text := copy(TEdit(popAlinha.PopupComponent).Text,1,Pos('&',TEdit(popAlinha.PopupComponent).Text)-1) +
                                            copy(TEdit(popAlinha.PopupComponent).Text,Pos('&',TEdit(popAlinha.PopupComponent).Text)+1,Length(TEdit(popAlinha.PopupComponent).Text));
  CompAtivo := TEdit(popAlinha.PopupComponent);
  Application.ProcessMessages;
  AjeitaTamanhoTitulos();
end;

procedure TfrmOffice.Button1Click(Sender: TObject);
var
	cont : integer;
begin
  for cont := ComponentCount - 1 downto 0 do
   	if Components[cont] is TEdit then
    	if (copy(Components[cont].Name,1,1) = 'E') and
         (copy(Components[cont].Name,2,1) <> 'd') then
      begin
        CompAtivo := Components[cont];
				AjeitaTamanhoTitulos();
      end;
end;

end.
