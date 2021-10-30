unit unGeraRelatorios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, ExtCtrls, Db, ImgList, Grids,
  Menus, Placemnt, RXCombos, ToolWin, ExtDlgs, RXSpin, QuickRpt, Qrctrls,
  QRExport, Mask, unDataModule2, IBCustomDataSet, IBUpdateSQL, IBQuery;

type
  TfrmGeraRelatorios = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    lCoordenadas: TLabel;
    Label9: TLabel;
    popAritimetico: TPopupMenu;
    Sinaldesoma1: TMenuItem;
    Sinaldesubtrao1: TMenuItem;
    Multiplicao1: TMenuItem;
    Diviso1: TMenuItem;
    Exponenciao1: TMenuItem;
    popLogico: TPopupMenu;
    EAND1: TMenuItem;
    OUOR1: TMenuItem;
    NONOT1: TMenuItem;
    N1: TMenuItem;
    nuloisnull1: TMenuItem;
    popCondicao: TPopupMenu;
    Igual1: TMenuItem;
    Maiorque1: TMenuItem;
    Menorque1: TMenuItem;
    Maoirouiguala1: TMenuItem;
    Menorouiguala1: TMenuItem;
    Diferente1: TMenuItem;
    N2: TMenuItem;
    Igualasubstringlike1: TMenuItem;
    FormStorage1: TFormStorage;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btSublinhado: TSpeedButton;
    btNegrito: TSpeedButton;
    btItalico: TSpeedButton;
    btEsquerda: TSpeedButton;
    btCentro: TSpeedButton;
    btDireita: TSpeedButton;
    FontComboBox1: TFontComboBox;
    ColorComboBox1: TColorComboBox;
    ToolButton2: TToolButton;
    ComboBox1: TComboBox;
    pnTextoTitulo: TPanel;
    Panel3: TPanel;
    edTitulo: TEdit;
    Label8: TLabel;
    LabelAux: TLabel;
    pnChamaTextoTitulo: TPanel;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    pnDataAtual: TPanel;
    pnNumPagina: TPanel;
    popLinhas: TPopupMenu;
    ImageListLinhas: TImageList;
    Vertical1: TMenuItem;
    Horizontal1: TMenuItem;
    pnTamCampo: TPanel;
    Panel2: TPanel;
    TrackBar1: TTrackBar;
    Label10: TLabel;
    lTamOriginal: TLabel;
    Label13: TLabel;
    lTamCampo: TLabel;
    Panel4: TPanel;
    pnChamaTamCampo: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ImageMacros: TImageList;
    popMacros: TPopupMenu;
    Hora1: TMenuItem;
    Data1: TMenuItem;
    Npgina1: TMenuItem;
    Bevel3: TBevel;
    Bevel4: TBevel;
    pnHoraAtual: TPanel;
    OpenPictureDialog1: TOpenPictureDialog;
    lNomeCampo: TLabel;
    pnCampos: TPanel;
    Panel5: TPanel;
    SpeedButton4: TSpeedButton;
    listaTabelas: TListBox;
    listaTabelasX: TListBox;
    listaCampos: TListBox;
    listaCamposTam: TListBox;
    listaCamposX: TListBox;
    Label11: TLabel;
    BitBtn23: TBitBtn;
    Label14: TLabel;
    BitBtn24: TBitBtn;
    linhaDivisaoC: TPanel;
    linhaDivisaoD: TPanel;
    pnChamaTamLinha: TPanel;
    pnTamLinha: TPanel;
    Panel6: TPanel;
    SpeedButton5: TSpeedButton;
    lTamLinha: TLabel;
    pnConfiguraFigura: TPanel;
    Label6: TLabel;
    Bevel2: TBevel;
    Label2: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    cbAjustaAutoSize: TCheckBox;
    cbAjustaStretch: TCheckBox;
    edImagemAltura: TRxSpinEdit;
    edImagemLargura: TRxSpinEdit;
    BitBtn28: TBitBtn;
    BitBtn29: TBitBtn;
    BitBtn30: TBitBtn;
    BitBtn31: TBitBtn;
    edImagemX: TEdit;
    edImagemY: TEdit;
    pnChamaCfgFigura: TPanel;
    Panel7: TPanel;
    SpeedButton6: TSpeedButton;
    Label18: TLabel;
    BitBtn1: TBitBtn;
    Label19: TLabel;
    lCabecalho: TLabel;
    lCampos: TLabel;
    linhaDivisaoGrupo: TPanel;
    lGrupo: TLabel;
    linhaDivisaoResGrupo: TPanel;
    lResGrupo: TLabel;
    linhaDivisaoResumo: TPanel;
    lResumo: TLabel;
    pnConfigBandas: TPanel;
    Panel9: TPanel;
    SpeedButton7: TSpeedButton;
    chkBandaGrupo: TCheckBox;
    cbCampoGrupo: TComboBox;
    Label21: TLabel;
    chkResumoGrupo: TCheckBox;
    Bevel5: TBevel;
    QuickRep1: TQuickRep;
    qrTitulo: TQRBand;
    qrDetalhe: TQRBand;
    qrGrupo: TQRGroup;
    qrResGrupo: TQRBand;
    qrResumo: TQRBand;
    CompQRTitulo: TQRLabel;
    CompQRGrupo: TQRLabel;
    CompQRResGrupo: TQRLabel;
    CompQRResumo: TQRLabel;
    CompQRCampo: TQRDBText;
    Bevel6: TBevel;
    Label22: TLabel;
    chkFrameCabTop: TCheckBox;
    chkFrameCabBottom: TCheckBox;
    chkFrameCabLeft: TCheckBox;
    chkFrameCabRight: TCheckBox;
    Label23: TLabel;
    chkFrameGrupoTop: TCheckBox;
    chkFrameGrupoBottom: TCheckBox;
    chkFrameGrupoLeft: TCheckBox;
    chkFrameGrupoRight: TCheckBox;
    Label24: TLabel;
    chkFrameCamposTop: TCheckBox;
    chkFrameCamposBottom: TCheckBox;
    chkFrameCamposLeft: TCheckBox;
    chkFrameCamposRight: TCheckBox;
    Label25: TLabel;
    chkFrameResGrupoTop: TCheckBox;
    chkFrameResGrupoBottom: TCheckBox;
    chkFrameResGrupoLeft: TCheckBox;
    chkFrameResGrupoRight: TCheckBox;
    Label26: TLabel;
    chkFrameResumoTop: TCheckBox;
    chkFrameResumoBottom: TCheckBox;
    chkFrameResumoLeft: TCheckBox;
    chkFrameResumoRight: TCheckBox;
    Image1: TImage;
    Label27: TLabel;
    pnConfigExpressoes: TPanel;
    Panel8: TPanel;
    SpeedButton8: TSpeedButton;
    cbExpReset: TCheckBox;
    edExpressao: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    listaTabelas2: TListBox;
    listaTabelas2X: TListBox;
    listaCampos2: TListBox;
    listaCamposTam2: TListBox;
    listaCampos2X: TListBox;
    BitBtn26: TBitBtn;
    BitBtn34: TBitBtn;
    BitBtn35: TBitBtn;
    BitBtn36: TBitBtn;
    BitBtn37: TBitBtn;
    BitBtn38: TBitBtn;
    BitBtn39: TBitBtn;
    BitBtn40: TBitBtn;
    GroupBox2: TGroupBox;
    BitBtn41: TBitBtn;
    cbExpFormatar: TCheckBox;
    cbCampoMascara: TComboBox;
    Label7: TLabel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    BitBtn5: TBitBtn;
    SpeedButton19: TSpeedButton;
    pnFiltragem: TPanel;
    Panel11: TPanel;
    SpeedButton20: TSpeedButton;
    pnExpressoes: TPanel;
    comboCamposX: TComboBox;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn20: TBitBtn;
    comboCampos: TComboBox;
    BitBtn22: TBitBtn;
    Memo2: TRichEdit;
    Memo1: TRichEdit;
    BitBtn32: TBitBtn;
    pnCamposFiltragem: TPanel;
    Label4: TLabel;
    listaFiltragem: TListBox;
    BitBtn6: TBitBtn;
    BitBtn2: TBitBtn;
    Panel12: TPanel;
    SpeedButton21: TSpeedButton;
    btSalvar: TSpeedButton;
    pnSalvaRelat: TPanel;
    Panel10: TPanel;
    SpeedButton23: TSpeedButton;
    edNomeRelat: TEdit;
    Label3: TLabel;
    edDataCriacaoRelat: TMaskEdit;
    Label5: TLabel;
    edCriador: TEdit;
    Label12: TLabel;
    btSalvarRel: TBitBtn;
    BitBtn4: TBitBtn;
    lUsuarioRelat: TLabel;
    popAlinha: TPopupMenu;
    Marcar1: TMenuItem;
    Desmarcar1: TMenuItem;
    SpeedButton25: TSpeedButton;
    popAlinha2: TPopupMenu;
    Alinharhorizontalmente1: TMenuItem;
    Alinharverticalmente1: TMenuItem;
    SpeedButton22: TSpeedButton;
    listaCamposTipo: TListBox;
    gridFiltro: TStringGrid;
    Label31: TLabel;
    Button1: TButton;
    Button2: TButton;
    btInsereOperadores: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    Label32: TLabel;
    TrackBar2: TTrackBar;
    Panel13: TPanel;
    pnTabelas: TPanel;
    Panel14: TPanel;
    listaTabelasDisp: TListBox;
    listaTabelasEscolhidas: TListBox;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    BitBtn7: TBitBtn;
    Label33: TLabel;
    listaTabelasEscolhidasX: TListBox;
    listaTabelasDispX: TListBox;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    cbTabelasFiltro: TComboBox;
    cbTabelasFiltroX: TComboBox;
    listaFiltragemX: TListBox;
    gridFiltroX: TStringGrid;
    BitBtn21: TBitBtn;
    listaFiltragemTipo: TListBox;
    listaFiltragemTam: TListBox;
    BitBtn8: TBitBtn;
    Bevel1: TBevel;
    BitBtn9: TBitBtn;
    ImageList1: TImageList;
    ListView1: TListView;
    ImageList2: TImageList;
    Label34: TLabel;
    Bevel7: TBevel;
    SpeedButton1: TSpeedButton;
    SpeedButton24: TSpeedButton;
    pnFiltragemOutrosCampos: TPanel;
    Panel16: TPanel;
    SpeedButton29: TSpeedButton;
    cbTabelasFiltragem: TComboBox;
    listaFiltro: TListBox;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    cbTabelasFiltragemX: TComboBox;
    listaFiltroX: TListBox;
    CheckBox1: TCheckBox;
    pnHelp: TPanel;
    bHelpAvanca: TSpeedButton;
    bHelpRecua: TSpeedButton;
    SpeedButton30: TSpeedButton;
    memoTextoHelp: TMemo;
    Label35: TLabel;
    Label36: TLabel;
    qryRelFig: TIBQuery;
    Query2: TIBQuery;
    qryTabelasCampos: TIBQuery;
    Query1: TIBQuery;
    qryAux: TIBQuery;
    qryPegaRelatorio: TIBQuery;
    updRelFig: TIBUpdateSQL;
    qryPegaRelatorioGR_CODIGO: TIntegerField;
    qryPegaRelatorioGR_IDENTIFICACAO: TStringField;
    qryPegaRelatorioGR_DATA_CRIACAO: TDateTimeField;
    qryPegaRelatorioGR_TIT_NOME: TStringField;
    qryPegaRelatorioGR_TIT_BANDA: TStringField;
    qryPegaRelatorioGR_TIT_FONT_NOME: TStringField;
    qryPegaRelatorioGR_TIT_FONT_TAM: TIntegerField;
    qryPegaRelatorioGR_TIT_FONT_COR: TStringField;
    qryPegaRelatorioGR_TIT_FONT_ESTILO: TStringField;
    qryPegaRelatorioGR_TIT_ALIGN: TStringField;
    qryPegaRelatorioGR_TIT_TOP: TIntegerField;
    qryPegaRelatorioGR_TIT_LEFT: TIntegerField;
    qryPegaRelatorioGR_TIT_CAPTION: TStringField;
    qryPegaRelatorioGR_CAMPO_NOME: TStringField;
    qryPegaRelatorioGR_CAMPO_BANDA: TStringField;
    qryPegaRelatorioGR_CAMPO_FONT_NOME: TStringField;
    qryPegaRelatorioGR_CAMPO_FONT_TAM: TIntegerField;
    qryPegaRelatorioGR_CAMPO_FONT_COR: TStringField;
    qryPegaRelatorioGR_CAMPO_FONT_ESTILO: TStringField;
    qryPegaRelatorioGR_CAMPO_ALIGN: TStringField;
    qryPegaRelatorioGR_CAMPO_TOP: TIntegerField;
    qryPegaRelatorioGR_CAMPO_LEFT: TIntegerField;
    qryPegaRelatorioGR_CAMPO_TAMANHO: TIntegerField;
    qryPegaRelatorioGR_CAMPO_MASK: TStringField;
    qryPegaRelatorioGR_CAMPO_TABELA: TStringField;
    qryPegaRelatorioGR_CAMPO_CAMPO: TStringField;
    qryPegaRelatorioGR_CAMPO_LKP_TBL: TStringField;
    qryPegaRelatorioGR_CAMPO_LKP_KEY: TStringField;
    qryPegaRelatorioGR_CAMPO_LKP_RESULT: TStringField;
    qryPegaRelatorioGR_LINHA_NOME: TStringField;
    qryPegaRelatorioGR_LINHA_BANDA: TStringField;
    qryPegaRelatorioGR_LINHA_TOP: TIntegerField;
    qryPegaRelatorioGR_LINHA_LEFT: TIntegerField;
    qryPegaRelatorioGR_LINHA_TAMANHO: TIntegerField;
    qryPegaRelatorioGR_LINHA_TIPO: TStringField;
    qryPegaRelatorioGR_FIG_NOME: TStringField;
    qryPegaRelatorioGR_FIG_BANDA: TStringField;
    qryPegaRelatorioGR_FIG_FIGURA: TBlobField;
    qryPegaRelatorioGR_FIG_TOP: TIntegerField;
    qryPegaRelatorioGR_FIG_LEFT: TIntegerField;
    qryPegaRelatorioGR_FIG_HEIGHT: TIntegerField;
    qryPegaRelatorioGR_FIG_WIDTH: TIntegerField;
    qryPegaRelatorioGR_FIG_STRETCH: TStringField;
    qryPegaRelatorioGR_FIG_AUTOSIZE: TStringField;
    qryPegaRelatorioGR_BNDHEADER_TAM: TIntegerField;
    qryPegaRelatorioGR_BNDDETAIL_TAM: TIntegerField;
    qryPegaRelatorioGR_BNDSUMARY_TAM: TIntegerField;
    qryPegaRelatorioGR_BNDGROUPHEADER_EXISTE: TStringField;
    qryPegaRelatorioGR_BNDGROUPHEADER_CAMPO: TStringField;
    qryPegaRelatorioGR_BNDGROUPHEADER_TAM: TIntegerField;
    qryPegaRelatorioGR_BNDGROUPFOOTER_EXISTE: TStringField;
    qryPegaRelatorioGR_BNDGROUPFOOTER_TAM: TIntegerField;
    qryPegaRelatorioGR_EXPR_NOME: TStringField;
    qryPegaRelatorioGR_EXPR_BANDA: TStringField;
    qryPegaRelatorioGR_EXPR_FONT_NOME: TStringField;
    qryPegaRelatorioGR_EXPR_FONT_TAM: TIntegerField;
    qryPegaRelatorioGR_EXPR_FONT_COR: TStringField;
    qryPegaRelatorioGR_EXPR_FONT_ESTILO: TStringField;
    qryPegaRelatorioGR_EXPR_TOP: TIntegerField;
    qryPegaRelatorioGR_EXPR_LEFT: TIntegerField;
    qryPegaRelatorioGR_EXPR_MASK: TStringField;
    qryPegaRelatorioGR_EXPR_EXPRESSAO: TStringField;
    qryPegaRelatorioGR_EXPR_TAMANHO: TIntegerField;
    qryPegaRelatorioGR_MACRO_NOME: TStringField;
    qryPegaRelatorioGR_EXPR_RESETA: TStringField;
    qryPegaRelatorioGR_MACRO_BANDA: TStringField;
    qryPegaRelatorioGR_MACRO_FONT_NOME: TStringField;
    qryPegaRelatorioGR_MACRO_FONT_TAM: TIntegerField;
    qryPegaRelatorioGR_MACRO_FONT_COR: TStringField;
    qryPegaRelatorioGR_MACRO_FONT_ESTILO: TStringField;
    qryPegaRelatorioGR_MACRO_TOP: TIntegerField;
    qryPegaRelatorioGR_MACRO_LEFT: TIntegerField;
    qryPegaRelatorioGR_MACRO_MACRO: TStringField;
    qryPegaRelatorioGR_USUARIO: TStringField;
    qryPegaRelatorioGR_CRIADOR: TStringField;
    qryPegaRelatorioGR_EXPR_ALIGN: TStringField;
    qryPegaRelatorioGR_FRAME_CABECALHO: TStringField;
    qryPegaRelatorioGR_FRAME_DETALHE: TStringField;
    qryPegaRelatorioGR_FRAME_GRUPO: TStringField;
    qryPegaRelatorioGR_FRAME_RESGRUPO: TStringField;
    qryPegaRelatorioGR_FRAME_RESUMO: TStringField;
    qryPegaRelatorioGR_TEXTOSQL: TMemoField;
    qryFiltro: TIBQuery;
    qryFiltroGRF_CODIGO: TIntegerField;
    qryFiltroGRF_CONDICAO: TStringField;
    qryFiltroGRF_CAMPO: TStringField;
    qryFiltroGRF_OPERADOR: TStringField;
    qryFiltroGRF_TITULO: TStringField;
    qryFiltroGRF_TAMANHO: TIntegerField;
    qryFiltroGRF_TIPO: TStringField;
    updFiltro: TIBUpdateSQL;
    qryRelat: TIBQuery;
    qryRelatGR_CODIGO: TIntegerField;
    qryRelatGR_IDENTIFICACAO: TStringField;
    qryRelatGR_DATA_CRIACAO: TDateTimeField;
    qryRelatGR_TIT_NOME: TStringField;
    qryRelatGR_TIT_BANDA: TStringField;
    qryRelatGR_TIT_FONT_NOME: TStringField;
    qryRelatGR_TIT_FONT_TAM: TIntegerField;
    qryRelatGR_TIT_FONT_COR: TStringField;
    qryRelatGR_TIT_ALIGN: TStringField;
    qryRelatGR_TIT_TOP: TIntegerField;
    qryRelatGR_TIT_LEFT: TIntegerField;
    qryRelatGR_TIT_CAPTION: TStringField;
    qryRelatGR_CAMPO_NOME: TStringField;
    qryRelatGR_CAMPO_BANDA: TStringField;
    qryRelatGR_CAMPO_FONT_NOME: TStringField;
    qryRelatGR_CAMPO_FONT_TAM: TIntegerField;
    qryRelatGR_CAMPO_FONT_COR: TStringField;
    qryRelatGR_CAMPO_ALIGN: TStringField;
    qryRelatGR_CAMPO_TOP: TIntegerField;
    qryRelatGR_CAMPO_LEFT: TIntegerField;
    qryRelatGR_CAMPO_TAMANHO: TIntegerField;
    qryRelatGR_CAMPO_TABELA: TStringField;
    qryRelatGR_CAMPO_CAMPO: TStringField;
    qryRelatGR_CAMPO_LKP_TBL: TStringField;
    qryRelatGR_CAMPO_LKP_KEY: TStringField;
    qryRelatGR_CAMPO_LKP_RESULT: TStringField;
    qryRelatGR_LINHA_NOME: TStringField;
    qryRelatGR_LINHA_BANDA: TStringField;
    qryRelatGR_LINHA_TOP: TIntegerField;
    qryRelatGR_LINHA_LEFT: TIntegerField;
    qryRelatGR_FIG_NOME: TStringField;
    qryRelatGR_FIG_BANDA: TStringField;
    qryRelatGR_FIG_FIGURA: TBlobField;
    qryRelatGR_FIG_TOP: TIntegerField;
    qryRelatGR_FIG_LEFT: TIntegerField;
    qryRelatGR_FIG_HEIGHT: TIntegerField;
    qryRelatGR_FIG_WIDTH: TIntegerField;
    qryRelatGR_FIG_STRETCH: TStringField;
    qryRelatGR_FIG_AUTOSIZE: TStringField;
    qryRelatGR_BNDHEADER_TAM: TIntegerField;
    qryRelatGR_BNDDETAIL_TAM: TIntegerField;
    qryRelatGR_BNDSUMARY_TAM: TIntegerField;
    qryRelatGR_BNDGROUPHEADER_EXISTE: TStringField;
    qryRelatGR_BNDGROUPHEADER_CAMPO: TStringField;
    qryRelatGR_BNDGROUPHEADER_TAM: TIntegerField;
    qryRelatGR_BNDGROUPFOOTER_EXISTE: TStringField;
    qryRelatGR_BNDGROUPFOOTER_TAM: TIntegerField;
    qryRelatGR_EXPR_NOME: TStringField;
    qryRelatGR_EXPR_BANDA: TStringField;
    qryRelatGR_EXPR_FONT_NOME: TStringField;
    qryRelatGR_EXPR_FONT_TAM: TIntegerField;
    qryRelatGR_EXPR_FONT_COR: TStringField;
    qryRelatGR_EXPR_TOP: TIntegerField;
    qryRelatGR_EXPR_LEFT: TIntegerField;
    qryRelatGR_MACRO_NOME: TStringField;
    qryRelatGR_MACRO_BANDA: TStringField;
    qryRelatGR_MACRO_FONT_NOME: TStringField;
    qryRelatGR_MACRO_FONT_TAM: TIntegerField;
    qryRelatGR_MACRO_FONT_COR: TStringField;
    qryRelatGR_MACRO_TOP: TIntegerField;
    qryRelatGR_MACRO_LEFT: TIntegerField;
    qryRelatGR_MACRO_MACRO: TStringField;
    qryRelatGR_TIT_FONT_ESTILO: TStringField;
    qryRelatGR_CAMPO_FONT_ESTILO: TStringField;
    qryRelatGR_EXPR_FONT_ESTILO: TStringField;
    qryRelatGR_MACRO_FONT_ESTILO: TStringField;
    qryRelatGR_LINHA_TAMANHO: TIntegerField;
    qryRelatGR_USUARIO: TStringField;
    qryRelatGR_CRIADOR: TStringField;
    qryRelatGR_CAMPO_MASK: TStringField;
    qryRelatGR_EXPR_MASK: TStringField;
    qryRelatGR_EXPR_TAMANHO: TIntegerField;
    qryRelatGR_EXPR_RESETA: TStringField;
    qryRelatGR_EXPR_ALIGN: TStringField;
    qryRelatGR_FRAME_CABECALHO: TStringField;
    qryRelatGR_FRAME_DETALHE: TStringField;
    qryRelatGR_FRAME_GRUPO: TStringField;
    qryRelatGR_FRAME_RESGRUPO: TStringField;
    qryRelatGR_FRAME_RESUMO: TStringField;
    qryRelatGR_LINHA_TIPO: TStringField;
    qryRelatGR_EXPR_EXPRESSAO: TStringField;
    updRelat: TIBUpdateSQL;
    qryRelFigGER_FIG: TBlobField;
    qryRelFigGER_COD: TIBStringField;
    qryRelatGR_TEXTOSQL: TIBStringField;
    procedure FormShow(Sender: TObject);
    procedure listaTabelasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure EAND1Click(Sender: TObject);
    procedure OUOR1Click(Sender: TObject);
    procedure NONOT1Click(Sender: TObject);
    procedure Igual1Click(Sender: TObject);
    procedure Maiorque1Click(Sender: TObject);
    procedure Menorque1Click(Sender: TObject);
    procedure Maoirouiguala1Click(Sender: TObject);
    procedure Menorouiguala1Click(Sender: TObject);
    procedure Diferente1Click(Sender: TObject);
    //
    procedure Colorir();
    procedure Colorir2();
    procedure AjeitaTamanhoTitulos();
    procedure AtualizaExibicoesDeFormatacao();
    //
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure btNegritoClick(Sender: TObject);
    procedure btSublinhadoClick(Sender: TObject);
    procedure btItalicoClick(Sender: TObject);
    procedure btEsquerdaClick(Sender: TObject);
    procedure btCentroClick(Sender: TObject);
    procedure btDireitaClick(Sender: TObject);
    procedure FontComboBox1Change(Sender: TObject);
    procedure ColorComboBox1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure edTituloKeyPress(Sender: TObject; var Key: Char);
    procedure pnChamaTextoTituloDblClick(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure pnChamaTamCampoDblClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Data1Click(Sender: TObject);
    procedure Npgina1Click(Sender: TObject);
    procedure Hora1Click(Sender: TObject);
    procedure Vertical1Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure Horizontal1Click(Sender: TObject);
    procedure pnChamaTamLinhaDblClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure pnChamaCfgFiguraDblClick(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure edImagemLarguraChange(Sender: TObject);
    procedure edImagemAlturaChange(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure cbAjustaStretchClick(Sender: TObject);
    procedure cbAjustaAutoSizeClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure chkBandaGrupoClick(Sender: TObject);
    procedure chkResumoGrupoClick(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure Memo2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn32Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure listaTabelas2Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure BitBtn39Click(Sender: TObject);
    procedure BitBtn40Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btSalvarRelClick(Sender: TObject);
    procedure Marcar1Click(Sender: TObject);
    procedure Desmarcar1Click(Sender: TObject);
    procedure Alinharhorizontalmente1Click(Sender: TObject);
    procedure Alinharverticalmente1Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btInsereOperadoresClick(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton28Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure cbTabelasFiltroChange(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ListView1DblClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure cbTabelasFiltragemChange(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure listaCamposClick(Sender: TObject);
    procedure QuickRep1AfterPreview(Sender: TObject);
    procedure edTituloChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton30Click(Sender: TObject);
    procedure bHelpAvancaClick(Sender: TObject);
    procedure bHelpRecuaClick(Sender: TObject);
    procedure qryFiltroAfterPost(DataSet: TDataSet);
    procedure qryRelFigAfterPost(DataSet: TDataSet);
    procedure qryRelatAfterPost(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

{ PAINEIS COM TAG = 6 SAO TITULOS
  PAINEIS COM TAG = 5 SAO CAMPOS
  PAINEIS COM TAG = 7 SAO MACROS
  PAINEIS COM TAG = 8 SAO LINHAS
  PAINEIS COM TAG = 9 SAO DIVISOES
  PAINEIS COM TAG = 10 SAO EXPRESSOES
  COMPONENTES COM TAG = 20 SAO QRLABELS E QRDBLABELS PERMANENTES DO QUICKREP
                           E NAO DEVE SER DADO FREE NELES}

const
  vCorrigeTopObj = -9;
  vCorrigeBanda = -5;
  constCorPrimaria = $00E0EFFF;
  constCorSecundaria = $00E0E4FB;

var
  frmGeraRelatorios: TfrmGeraRelatorios;
  MouseDownSpot : TPoint;
  Capturing : bool;
  vPosTitAnterior : integer; //guarda posicao final do ultimo titulo de campo
  vQtdTitulosCampos : integer; //guarda qtd de titulos de campos para dar nome ao proximo
  vCampos : array[1..8, 1..20] of string;
  vTabelas : array [1..8] of string;
  vCamposX : array[1..8, 1..20] of string;
  vTabelasX : array [1..8] of string;
  vQtTabelas : integer;
  vQtCampos : integer;
  CompAtivo : TObject;
  FigAtiva : TObject;
  vQtdCampos : integer;
  vLinhaHelp : integer;

implementation
uses unFuncoes, unEmpresa, unAcessos, unPreview, qrprntr;

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


procedure TfrmGeraRelatorios.AtualizaExibicoesDeFormatacao();
begin
  if fsBold in TPanel(CompAtivo).Font.Style then btNegrito.Flat := False
  else btNegrito.Flat := True;
  if fsItalic in TPanel(CompAtivo).Font.Style then btItalico.Flat := False
  else btItalico.Flat := True;
  if fsUnderline in TPanel(CompAtivo).Font.Style then btSublinhado.Flat := False
  else btSublinhado.Flat := True;

  if TPanel(CompAtivo).Alignment = taLeftJustify then btEsquerda.Flat := False
  else btEsquerda.Flat := True;
  if TPanel(CompAtivo).Alignment = taCenter then btCentro.Flat := False
  else btCentro.Flat := True;
  if TPanel(CompAtivo).Alignment = taRightJustify then btDireita.Flat := False
  else btDireita.Flat := True;

  FontComboBox1.FontName := TPanel(CompAtivo).Font.Name;
  ColorComboBox1.ColorValue := TPanel(CompAtivo).Font.Color;

  case TPanel(CompAtivo).Font.Size of
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

procedure TfrmGeraRelatorios.AjeitaTamanhoTitulos();
begin
    if (TPanel(CompAtivo).Tag = 8) then Exit;
    if (TPanel(CompAtivo).Tag = 9) then Exit;
    LabelAux.Caption := TPanel(CompAtivo).Caption;
    LabelAux.Font := TPanel(CompAtivo).Font;
    LabelAux.AutoSize := True;
    if (TPanel(CompAtivo).Tag = 6) or (TPanel(CompAtivo).Tag = 7) then //se nao for titulo ou macro nao ajeita o tamanho
      TPanel(CompAtivo).Width := LabelAux.Width + 12;
    TPanel(CompAtivo).Height := LabelAux.Height + 4;
    AtualizaExibicoesDeFormatacao();
end;

procedure TfrmGeraRelatorios.Colorir();
var i : integer;
    Texto : String;
begin
  Texto := Memo1.Text;
  i := 0;
  Memo1.BringToFront;
  while i <= Length(Memo1.Text)-1 do
  begin
    Memo1.SelStart := i;
    Memo1.SelLength := 1;
    if not(Texto[i+1] in ['A'..'Z']) then
    begin
      if (Texto[i+1] = ')') or (Texto[i+1] = '(') then
      begin
        Memo1.SelAttributes.Color := clBlack;
        Memo1.SelAttributes.Style := [fsBold];
      end
      else if (Texto[i+1] in ['+','-','*','/','^','=','>','<']) then
      begin
        Memo1.SelAttributes.Color := clRed;
        Memo1.SelAttributes.Style := [fsBold];
      end
      else if (Texto[i+1] in [']','[']) then
      begin
        Memo1.SelAttributes.Color := clBlue;
        Memo1.SelAttributes.Style := [];
      end
      else if (Texto[i+1] = '#') then
      begin
        Memo1.SelAttributes.Color := clGreen;
        Memo1.SelAttributes.Style := [fsBold];
      end
      else
      begin
        Memo1.SelAttributes.Color := clBlack;
        Memo1.SelAttributes.Style := [];
      end;
    end
    else
    begin
      Memo1.SelAttributes.Color := clBlue;
      Memo1.SelAttributes.Style := [];
    end;
    if (Texto[i+1] in ['0'..'9']) or (Text[i+1] = '.') then
    begin
      Memo1.SelAttributes.Color := clBlue;
      Memo1.SelAttributes.Style := [];
    end;
    if (Texto[i+1] in ['a'..'z']) then
    begin
      Memo1.SelAttributes.Color := clBlack;
      Memo1.SelAttributes.Style := [];
    end;

    if (Texto[i+1] = 'E') and (Texto[i+2] = ' ') and (Texto[i] = ' ') then
    begin
      Memo1.SelAttributes.Color := clBlack;
      Memo1.SelAttributes.Style := [fsBold];
    end;
    if (Texto[i+1] = 'O') and (Texto[i+2] = 'U') and (Texto[i+3] = ' ') and (Texto[i] = ' ') then
    begin
      Memo1.SelAttributes.Color := clBlack;
      Memo1.SelAttributes.Style := [fsBold];
    end;
    if (Texto[i+1] = 'U') and (Texto[i+2] = ' ') and (Texto[i-1] = ' ') and (Texto[i] = 'O') then
    begin
      Memo1.SelAttributes.Color := clBlack;
      Memo1.SelAttributes.Style := [fsBold];
    end;
    if (Texto[i+1] = 'N') and (Texto[i+2] = 'Ã') and (Texto[i+3] = 'O') and (Texto[i+4] = ' ') and (Texto[i] = ' ') then
    begin
      Memo1.SelAttributes.Color := clBlack;
      Memo1.SelAttributes.Style := [fsBold];
    end;
    if (Texto[i+1] = 'Ã') and (Texto[i+2] = 'O') and (Texto[i+3] = ' ') and (Texto[i-1] = ' ') and (Texto[i] = 'N') then
    begin
      Memo1.SelAttributes.Color := clBlack;
      Memo1.SelAttributes.Style := [fsBold];
    end;
    if (Texto[i+1] = 'O') and (Texto[i+2] = ' ') and (Texto[i] = 'Ã') and (Texto[i-1] = 'N') and (Texto[i-2] = ' ') then
    begin
      Memo1.SelAttributes.Color := clBlack;
      Memo1.SelAttributes.Style := [fsBold];
    end;
    i := i + 1;
  end;
  Memo1.SelLength := 0;
  Memo1.BringToFront;
end;

procedure TfrmGeraRelatorios.Colorir2();
var i : integer;
    Texto : String;
begin
  Texto := Memo2.Text;
  i := 0;
  Memo2.BringToFront;
  while i <= Length(Memo2.Text)-1 do
  begin
    Memo2.SelStart := i;
    Memo2.SelLength := 1;
    if not(Texto[i+1] in ['A'..'Z']) then
    begin
      if (Texto[i+1] = ')') or (Texto[i+1] = '(') then
      begin
        Memo2.SelAttributes.Color := clBlack;
        Memo2.SelAttributes.Style := [fsBold];
      end
      else if (Texto[i+1] in ['+','-','*','/','^','=','>','<']) then
      begin
        Memo2.SelAttributes.Color := clRed;
        Memo2.SelAttributes.Style := [fsBold];
      end
      else if (Texto[i+1] in [']','[']) then
      begin
        Memo2.SelAttributes.Color := clBlue;
        Memo2.SelAttributes.Style := [];
      end
      else if (Texto[i+1] = '#') then
      begin
        Memo2.SelAttributes.Color := clGreen;
        Memo2.SelAttributes.Style := [fsBold];
      end
      else
      begin
        Memo2.SelAttributes.Color := clBlack;
        Memo2.SelAttributes.Style := [];
      end;
    end
    else
    begin
      Memo2.SelAttributes.Color := clBlue;
      Memo2.SelAttributes.Style := [];
    end;
    if (Texto[i+1] in ['0'..'9']) or (Text[i+1] = '.') then
    begin
      Memo2.SelAttributes.Color := clBlue;
      Memo2.SelAttributes.Style := [];
    end;
    if (Texto[i+1] in ['a'..'z']) then
    begin
      Memo2.SelAttributes.Color := clBlack;
      Memo2.SelAttributes.Style := [];
    end;

    if (Texto[i+1] = 'A') and (Texto[i+2] = 'N') and (Texto[i+3] = 'D') and (Texto[i+4] = ' ') and (Texto[i] = ' ') then
    begin
      Memo2.SelAttributes.Color := clBlack;
      Memo2.SelAttributes.Style := [fsBold];
    end;
    if (Texto[i+1] = 'N') and (Texto[i+2] = 'D') and (Texto[i+3] = ' ') and (Texto[i-1] = ' ') and (Texto[i] = 'A') then
    begin
      Memo2.SelAttributes.Color := clBlack;
      Memo2.SelAttributes.Style := [fsBold];
    end;
    if (Texto[i+1] = 'D') and (Texto[i+2] = ' ') and (Texto[i] = 'N') and (Texto[i-1] = 'A') and (Texto[i-2] = ' ') then
    begin
      Memo2.SelAttributes.Color := clBlack;
      Memo2.SelAttributes.Style := [fsBold];
    end;
    if (Texto[i+1] = 'O') and (Texto[i+2] = 'R') and (Texto[i+3] = ' ') and (Texto[i] = ' ') then
    begin
      Memo2.SelAttributes.Color := clBlack;
      Memo2.SelAttributes.Style := [fsBold];
    end;
    if (Texto[i+1] = 'R') and (Texto[i+2] = ' ') and (Texto[i-1] = ' ') and (Texto[i] = 'O') then
    begin
      Memo2.SelAttributes.Color := clBlack;
      Memo2.SelAttributes.Style := [fsBold];
    end;
    if (Texto[i+1] = 'N') and (Texto[i+2] = 'O') and (Texto[i+3] = 'T') and (Texto[i+4] = ' ') and (Texto[i] = ' ') then
    begin
      Memo2.SelAttributes.Color := clBlack;
      Memo2.SelAttributes.Style := [fsBold];
    end;
    if (Texto[i+1] = 'O') and (Texto[i+2] = 'T') and (Texto[i+3] = ' ') and (Texto[i-1] = ' ') and (Texto[i] = 'N') then
    begin
      Memo2.SelAttributes.Color := clBlack;
      Memo2.SelAttributes.Style := [fsBold];
    end;
    if (Texto[i+1] = 'T') and (Texto[i+2] = ' ') and (Texto[i] = 'O') and (Texto[i-1] = 'N') and (Texto[i-2] = ' ') then
    begin
      Memo2.SelAttributes.Color := clBlack;
      Memo2.SelAttributes.Style := [fsBold];
    end;
    i := i + 1;
  end;
  Memo1.SelLength := 0;
  Memo1.BringToFront;
end;

procedure TfrmGeraRelatorios.FormShow(Sender: TObject);
var
	cont : integer;
begin
  Query1.Open;

  vPosTitAnterior := 0;
  vQtdTitulosCampos := 0;
  vQtdCampos := 0;

  CompAtivo := nil;

  Capturing := False;
  Panel1.Left := 1;
  Panel1.Top := 9;

  pnTabelas.Top := 38;
  pnTabelas.Left := 144;

  ExecutaSQL('select distinct GRT_DESC_TABELA, GRT_TABELA from GERADOR_RELATORIO_TABELAS', qryTabelasCampos);
  listaTabelasDisp.Items.Clear;
  listaTabelasDispX.Items.Clear;
  qryTabelasCampos.First;
  while NOT qryTabelasCampos.EOF do
  begin
    listaTabelasDisp.Items.Add(qryTabelasCampos.FieldByName('GRT_DESC_TABELA').AsString);
    listaTabelasDispX.Items.Add(qryTabelasCampos.FieldByName('GRT_TABELA').AsString);
    qryTabelasCampos.Next;
  end;

  ListView1.Items.Clear;
  with Query2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select distinct GR_IDENTIFICACAO, GR_CODIGO from GERADOR_RELATORIOS');
    SQL.Add('order by GR_IDENTIFICACAO');
    Open;
  end;
  cont := 0;
  while NOT Query2.EOF do
  begin
    ListView1.Items.Add;
    ListView1.Items[cont].ImageIndex := 0;
    ListView1.Items[cont].Caption := Query2.FieldByName('GR_IDENTIFICACAO').AsString;
    cont := cont + 1;
    Query2.next;
  end;
end;

procedure TfrmGeraRelatorios.listaTabelasClick(Sender: TObject);
begin
  ExecutaSQL('select GRT_TIPO, GRT_DESC_CAMPO, GRT_CAMPO, GRT_TAMANHO from GERADOR_RELATORIO_TABELAS where GRT_DESC_TABELA = ' + QuotedStr(listaTabelas.Items.Strings[listaTabelas.ItemIndex]), qryTabelasCampos);
  listaCampos.Items.Clear;
  listaCamposX.Items.Clear;
  listaCamposTam.Items.Clear;
  listaCamposTipo.Items.Clear;
  qryTabelasCampos.First;
  while NOT qryTabelasCampos.EOF do
  begin
    listaCampos.Items.Add(qryTabelasCampos.FieldByName('GRT_DESC_CAMPO').AsString);
    listaCamposX.Items.Add(qryTabelasCampos.FieldByName('GRT_CAMPO').AsString);
    listaCamposTam.Items.Add(qryTabelasCampos.FieldByName('GRT_TAMANHO').AsString);
    listaCamposTipo.Items.Add(qryTabelasCampos.FieldByName('GRT_TIPO').AsString);
    qryTabelasCampos.Next;
  end;
end;

procedure TfrmGeraRelatorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  cont : integer;
begin
  dm2.IBTransaction1.CommitRetaining;
  for cont := ComponentCount - 1 downto 0 do
    if Components[cont] is TPanel then
      if TPanel(Components[cont]).Tag in [5,6,7,8,10] then
        TPanel(Components[cont]).Free;
 // Action := caFree;
end;

procedure TfrmGeraRelatorios.BitBtn2Click(Sender: TObject);
var
  cont : integer;
begin
  for cont := 0 to 10 do
  if gridFiltro.Cells[1,cont] = '' then
  begin
    gridFiltro.Cells[1,cont] := listaFiltragem.Items.Strings[listaFiltragem.ItemIndex];
    gridFiltro.Cells[4,cont] := listaFiltragemTam.Items.Strings[listaFiltragem.ItemIndex];
    gridFiltro.Cells[5,cont] := listaFiltragemTipo.Items.Strings[listaFiltragem.ItemIndex];
    gridFiltroX.Cells[1,cont] := listaFiltragemX.Items.Strings[listaFiltragem.ItemIndex];
    Break;
  end;
end;

procedure TfrmGeraRelatorios.PageControl1Change(Sender: TObject);
var
  cont, vAnterior, contAux : integer;
  vPn : TPanel;
  vAuxCampos, vAuxTabelas : string;
  vAuxTblJaExiste : boolean;
begin
{  vAnterior := 4;
  if PageControl1.ActivePage = TabSheet2 then
  begin
    for cont := 0 to listaImpressao.Items.Count - 1 do
    begin
      vPn := TPanel.Create(Application);
      vPn.Name := 'vPn' + IntToStr(cont);
      vPn.Caption := copy(listaImpressao.Items.Strings[cont], 1, Pos('[', listaImpressao.Items.Strings[cont])-1);
      if ProgressBar1.Position <= 100 then
        vPn.Width := Trunc(StrToInt(listaImpressaoTam.Items.Strings[cont])*6.4);
      if (ProgressBar1.Position > 100) and (ProgressBar1.Position <= 117) then
        vPn.Width := Trunc(StrToInt(listaImpressaoTam.Items.Strings[cont])*5.8);
      if ProgressBar1.Position > 117 then
        vPn.Width := Trunc(StrToInt(listaImpressaoTam.Items.Strings[cont])*4.8);
      vPn.Height := 18;
      vPn.Top := linhaDivisaoCD.Top + 18;
      if vAnterior <> 4 then
        vPn.Left := vAnterior
      else
        vPn.Left := Panel1.Left + 5;
      vPn.Color := clWhite;
      vPn.Font.Name := 'Arial';
      vPn.Font.Size := 7;
      vPn.Hint := 'Duplo clique para ajustar tamanho';
      vPn.ShowHint := True;
      vPn.Tag := 5; //PARA IDENTIFICAR QUE E UM PAINEL RELATIVO A CAMPO
      vPn.OnDblClick := pnChamaTamCampo.OnDblClick;
      vPn.OnMouseMove := Panel1.OnMouseMove;
      vPn.OnMouseDown := Panel1.OnMouseDown;
      vPn.OnMouseUp := Panel1.OnMouseUp;
      vPn.Parent := Panel1.Parent;
      vPn.BringToFront;
      vAnterior := vPn.Left + vPn.Width;
    end;
  end;}


  EXIT; //!!!!!
  //
//  if PageControl1.ActivePage = TabSheet3 then
{  begin
    //GERANDO SQL EM PORTUGUES:
    vAuxTabelas := '';
    vAuxCampos := '';
    vQtTabelas := 0;
    vQtCampos := 1;
    for contAux := 1 to 8 do
    begin
      vTabelas[contAux] := '';
      for cont := 1 to 20 do
        vCampos[contAux, cont] := '';
    end;
    for cont := 0 to listaImpressao.Items.Count - 1 do
    begin
      for contAux := 1 to 8 do
        if (Pos(vTabelas[contAux], listaImpressao.Items.Strings[cont]) = 0) and (vTabelas[contAux] <> '') then
        begin
          vQtTabelas := vQtTabelas + 1;
          vQtCampos := 1;
          Break;
        end;
      if vQtTabelas = 0 then vQtTabelas := 1;
      vTabelas[vQtTabelas] := copy(listaImpressao.Items.Strings[cont], Pos('[',listaImpressao.Items.Strings[cont])+1, Pos(']',listaImpressao.Items.Strings[cont]) - Pos('[',listaImpressao.Items.Strings[cont])-1);
      vCampos[vQtTabelas, vQtCampos] := copy(listaImpressao.Items.Strings[cont], 1, Pos('[',listaImpressao.Items.Strings[cont])-1);
      vQtCampos := vQtCampos + 1;
    end;
    comboCampos.Items.Clear;
    for cont := 1 to 8 do
      for contAux := 1 to 20 do
        if vCampos[cont, contAux] <> '' then
          comboCampos.Items.Add('T' + IntToStr(cont) + '.' + vCampos[cont, contAux]);

    for cont := 1 to 8 do
      if vTabelas[cont] <> '' then
        if cont = 1 then
          vAuxTabelas := vTabelas[cont] + ' T1'
        else
          vAuxTabelas := vAuxTabelas + ', ' + vTabelas[cont] + ' T' + IntToStr(cont);

    for cont := 0 to comboCampos.Items.Count-1 do
      if cont = 0 then
        vAuxCampos := comboCampos.Items.Strings[cont]
      else
        vAuxCampos := vAuxCampos + ', ' + comboCampos.Items.Strings[cont];

    Memo1.Lines.Add('exibir ' + vAuxCampos + ' das tabelas ' + vAuxTabelas + ' quando ');
    //FIM GERANDO SQL EM PORTUGUES

    //GERANDO SQL EM SQL:
    vAuxTabelas := '';
    vAuxCampos := '';
    vQtTabelas := 0;
    vQtCampos := 1;
    for contAux := 1 to 8 do
    begin
      vTabelasX[contAux] := '';
      for cont := 1 to 20 do
        vCamposX[contAux, cont] := '';
    end;
    for cont := 0 to listaImpressaoX.Items.Count - 1 do
    begin
      for contAux := 1 to 8 do
        if (Pos(vTabelasX[contAux], listaImpressaoX.Items.Strings[cont]) = 0) and (vTabelasX[contAux] <> '') then
        begin
          vQtTabelas := vQtTabelas + 1;
          vQtCampos := 1;
          Break;
        end;
      if vQtTabelas = 0 then vQtTabelas := 1;
      vTabelasX[vQtTabelas] := copy(listaImpressaoX.Items.Strings[cont], Pos('[',listaImpressaoX.Items.Strings[cont])+1, Pos(']',listaImpressaoX.Items.Strings[cont]) - Pos('[',listaImpressaoX.Items.Strings[cont])-1);
      vCamposX[vQtTabelas, vQtCampos] := copy(listaImpressaoX.Items.Strings[cont], 1, Pos('[',listaImpressaoX.Items.Strings[cont])-1);
      vQtCampos := vQtCampos + 1;
    end;
    comboCamposX.Items.Clear;
    for cont := 1 to 8 do
      for contAux := 1 to 20 do
        if vCamposX[cont, contAux] <> '' then
          comboCamposX.Items.Add('T' + IntToStr(cont) + '.' + vCamposX[cont, contAux]);

    for cont := 1 to 8 do
      if vTabelasX[cont] <> '' then
        if cont = 1 then
          vAuxTabelas := vTabelasX[cont] + ' T1'
        else
          vAuxTabelas := vAuxTabelas + ', ' + vTabelasX[cont] + ' T' + IntToStr(cont);

    for cont := 0 to comboCamposX.Items.Count-1 do
      if cont = 0 then
        vAuxCampos := comboCamposX.Items.Strings[cont]
      else
        vAuxCampos := vAuxCampos + ', ' + comboCamposX.Items.Strings[cont];

    Memo2.Lines.Add('select ' + vAuxCampos + ' from ' + vAuxTabelas + ' where 1=1');
    //FIM GERANDO SQL EM SQL
  end;}
end;

procedure TfrmGeraRelatorios.Panel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if pnTextoTitulo.Visible then Exit;
  if pnTamCampo.Visible then Exit;

  try
    if CompAtivo <> nil then
      if TComponent(Sender) is TPanel then
        TPanel(CompAtivo).BevelWidth := 1;
    CompAtivo := TComponent(Sender);
    if TComponent(Sender) is TPanel then
      TPanel(CompAtivo).BevelWidth := 2;
  except
    CompAtivo := nil;
  end;

  if TComponent(Sender) is TLabel then Exit;
  if Sender = Panel1 then Exit;
  AtualizaExibicoesDeFormatacao();
  if (ssLeft in Shift) and (Sender <> Panel1) then
  begin
    SetCapture(TButton(Sender).Handle);
    Capturing := True;
    MouseDownSpot.X := X;
    MouseDownSpot.Y := Y;
  end;
end;

procedure TfrmGeraRelatorios.Panel1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
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
      if (TButton(Sender).Left/30.15 < 0 ) or (TButton(Sender).Top/30.15 < 0.4) or (TButton(Sender).Left/30.15 > 21.2 ) or (TButton(Sender).Top > 320 ) then
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

procedure TfrmGeraRelatorios.Panel1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Capturing then
  begin
    Capturing := False;
    ReleaseCapture;
    TButton(Sender).Left := TButton(Sender).Left - (MouseDownSpot.x - X);
    TButton(Sender).Top  := TButton(Sender).Top - (MouseDownSpot.y - Y);
    linhaDivisaoC.Left := 3;
    linhaDivisaoD.Left := 3;
    linhaDivisaoResumo.Left := 3;
    linhaDivisaoGrupo.Left := 3;
    linhaDivisaoResGrupo.Left := 3;
    lCabecalho.Top := linhaDivisaoC.Top - 14;
    lCampos.Top := linhaDivisaoD.Top - 14;
    lResumo.Top := linhaDivisaoResumo.Top - 14;
    lGrupo.Top := linhaDivisaoGrupo.Top - 14;
    lResGrupo.Top := linhaDivisaoResGrupo.Top - 14;
  end
  else
    Capturing := False;
end;

procedure TfrmGeraRelatorios.BitBtn16Click(Sender: TObject);
begin
  popAritimetico.Popup(BitBtn16.Left+55+Left, BitBtn16.Top+Top+100);
end;

procedure TfrmGeraRelatorios.BitBtn17Click(Sender: TObject);
begin
  popLogico.Popup(BitBtn17.Left+55+Left, BitBtn17.Top+Top+100);
end;

procedure TfrmGeraRelatorios.BitBtn19Click(Sender: TObject);
begin
  popCondicao.Popup(BitBtn19.Left+55+Left, BitBtn19.Top+Top+100);
end;

procedure TfrmGeraRelatorios.BitBtn21Click(Sender: TObject);
var
  cont, contAux : integer;
  vAuxCampos, vAuxTabelas : string;
begin
  vAuxCampos := '';
  vAuxTabelas := '';
  Memo1.Clear;
  Memo2.Clear;
  for cont := ComponentCount - 1 downto 0 do
    if Components[cont] is TPanel then
      if TPanel(Components[cont]).Tag = 5 then
      begin
        for contAux := 0 to listaTabelasEscolhidas.Items.Count - 1 do
        begin
          if copy(TPanel(Components[cont]).Name, Pos('__',TPanel(Components[cont]).Name)+2, Length(TPanel(Components[cont]).Name)) = listaTabelasEscolhidasX.Items.Strings[contAux] then
          begin
            //comboCamposX.Items.Add('T' + IntToStr(contAux+1) + '.' + copy(TPanel(Components[cont]).Name, 1, Pos('__',TPanel(Components[cont]).Name)-1));
            //comboCampos.Items.Add('T' + IntToStr(contAux+1) + '.' + copy(TPanel(Components[cont]).Hint, 1, Pos('[',TPanel(Components[cont]).Hint)-1));
          end;
        end;
      end;
  //GERANDO SQL EM PORTUG:
  vAuxCampos := ''; vAuxTabelas := '';
  for cont := 0 to comboCampos.Items.Count - 1 do
    if cont = comboCampos.Items.Count - 1 then
      vAuxCampos := vAuxCampos + comboCampos.Items.Strings[cont]
    else
      vAuxCampos := vAuxCampos + comboCampos.Items.Strings[cont] + ', ';
  for cont := 0 to listaTabelasEscolhidas.Items.Count - 1 do
    vAuxTabelas := vAuxTabelas + listaTabelasEscolhidas.Items.Strings[cont] + ' T' + IntToStr(cont+1) + ', ';
  Delete(vAuxTabelas, Length(vAuxTabelas)-1, 2);
  Memo1.Text := 'selecione os campos: ' + vAuxCampos + ' das tabelas ' +
                vAuxTabelas + ' quando 1=1 ';
  //GERANDO SQL EM SQL:
  vAuxCampos := ''; vAuxtabelas := '';
  for cont := 0 to comboCamposX.Items.Count - 1 do
    if cont = comboCamposX.Items.Count - 1 then
      vAuxCampos := vAuxCampos + comboCamposX.Items.Strings[cont]
    else
      vAuxCampos := vAuxCampos + comboCamposX.Items.Strings[cont] + ', ';
  for cont := 0 to listaTabelasEscolhidasX.Items.Count - 1 do
    vAuxTabelas := vAuxTabelas + listaTabelasEscolhidasX.Items.Strings[cont] + ' T' + IntToStr(cont+1) + ', ';
  Delete(vAuxTabelas, Length(vAuxTabelas)-1, 2);
  Memo2.Text := 'select ' + vAuxCampos + ' from ' +
                vAuxTabelas + ' where 1=1 ';
end;

procedure TfrmGeraRelatorios.BitBtn14Click(Sender: TObject);
begin
  Memo1.Text := Memo1.Text + ' ( ';
  Memo2.Text := Memo2.Text + ' ( ';  //Colorir();
end;

procedure TfrmGeraRelatorios.BitBtn15Click(Sender: TObject);
begin
  Memo1.Text := Memo1.Text + ' ) ';
  Memo2.Text := Memo2.Text + ' ) ';  //Colorir();
end;

procedure TfrmGeraRelatorios.EAND1Click(Sender: TObject);
begin
  Memo1.Text := Memo1.Text + ' E ';
  Memo2.Text := Memo2.Text + ' AND ';  //Colorir();
end;

procedure TfrmGeraRelatorios.OUOR1Click(Sender: TObject);
begin
  Memo1.Text := Memo1.Text + ' OU ';
  Memo2.Text := Memo2.Text + ' OR '; //Colorir();
end;

procedure TfrmGeraRelatorios.NONOT1Click(Sender: TObject);
begin
  Memo1.Text := Memo1.Text + ' NÃO ';
  Memo2.Text := Memo2.Text + ' NOT ';  //Colorir();
end;

procedure TfrmGeraRelatorios.Igual1Click(Sender: TObject);
begin
  Memo1.Text := Memo1.Text + ' = ';
  Memo2.Text := Memo2.Text + ' = ';  //Colorir();
end;

procedure TfrmGeraRelatorios.Maiorque1Click(Sender: TObject);
begin
  Memo1.Text := Memo1.Text + ' > ';
  Memo2.Text := Memo2.Text + ' > ';   //Colorir();
end;

procedure TfrmGeraRelatorios.Menorque1Click(Sender: TObject);
begin
  Memo1.Text := Memo1.Text + ' < ';
  Memo2.Text := Memo2.Text + ' < '; //Colorir();
end;

procedure TfrmGeraRelatorios.Maoirouiguala1Click(Sender: TObject);
begin
  Memo1.Text := Memo1.Text + ' >= ';
  Memo2.Text := Memo2.Text + ' >= ';  //Colorir();
end;

procedure TfrmGeraRelatorios.Menorouiguala1Click(Sender: TObject);
begin
  Memo1.Text := Memo1.Text + ' <= ';
  Memo2.Text := Memo2.Text + ' <= '; //Colorir();
end;

procedure TfrmGeraRelatorios.Diferente1Click(Sender: TObject);
begin
  Memo1.Text := Memo1.Text + ' <> ';
  Memo2.Text := Memo2.Text + ' <> ';  //Colorir();
end;

procedure TfrmGeraRelatorios.BitBtn22Click(Sender: TObject);
begin
  if Memo1.Visible then
  begin
    Memo1.Text := Memo1.Text + ' ' + comboCampos.Items.Strings[comboCampos.ItemIndex] + ' ';
    Memo2.Text := Memo2.Text + ' ' + comboCamposX.Items.Strings[comboCampos.ItemIndex] + ' ';
  end
  else
  begin
    Memo1.Text := Memo1.Text + ' ' + comboCampos.Items.Strings[comboCamposX.ItemIndex] + ' ';
    Memo2.Text := Memo2.Text + ' ' + comboCamposX.Items.Strings[comboCamposX.ItemIndex] + ' ';
  end
end;

procedure TfrmGeraRelatorios.BitBtn20Click(Sender: TObject);
var
  vAux : string;
begin
  vAux := QuotedStr(InputBox('Entrada de texto', 'Digite o texto desejado', ''));
  if vAux = '' then Exit;
  Memo1.Text := Memo1.Text + vAux;
  Memo2.Text := Memo2.Text + vAux;
end;

procedure TfrmGeraRelatorios.BitBtn18Click(Sender: TObject);
var
  vAux : string;
begin
  vAux := InputBox('Entrada de texto', 'Digite o valor desejado', '');
  if vAux = '' then Exit;
  Memo1.Text := Memo1.Text + vAux;
  Memo2.Text := Memo2.Text + vAux;
end;

procedure TfrmGeraRelatorios.btNegritoClick(Sender: TObject);
begin
  if CompAtivo is TPanel then
  begin
    if fsBold in TPanel(CompAtivo).Font.Style then
      TPanel(CompAtivo).Font.Style := TPanel(CompAtivo).Font.Style - [fsBold]
    else
      TPanel(CompAtivo).Font.Style := TPanel(CompAtivo).Font.Style + [fsBold];
    AjeitaTamanhoTitulos();
  end;
end;

procedure TfrmGeraRelatorios.btSublinhadoClick(Sender: TObject);
begin
  if CompAtivo is TPanel then
  begin
    if fsUnderline in TPanel(CompAtivo).Font.Style then
      TPanel(CompAtivo).Font.Style := TPanel(CompAtivo).Font.Style - [fsUnderline]
    else
      TPanel(CompAtivo).Font.Style := TPanel(CompAtivo).Font.Style + [fsUnderline];
    AjeitaTamanhoTitulos();
  end;
end;

procedure TfrmGeraRelatorios.btItalicoClick(Sender: TObject);
begin
  if CompAtivo is TPanel then
  begin
    if fsItalic in TPanel(CompAtivo).Font.Style then
      TPanel(CompAtivo).Font.Style := TPanel(CompAtivo).Font.Style - [fsItalic]
    else
      TPanel(CompAtivo).Font.Style := TPanel(CompAtivo).Font.Style + [fsItalic];
    AjeitaTamanhoTitulos();
  end;
end;

procedure TfrmGeraRelatorios.btEsquerdaClick(Sender: TObject);
begin
  if CompAtivo is TPanel then
  begin
    TPanel(CompAtivo).Alignment := taLeftJustify;
    AjeitaTamanhoTitulos();
  end;
end;

procedure TfrmGeraRelatorios.btCentroClick(Sender: TObject);
begin
  if CompAtivo is TPanel then
  begin
    TPanel(CompAtivo).Alignment := taCenter;
    AjeitaTamanhoTitulos();
  end;
end;

procedure TfrmGeraRelatorios.btDireitaClick(Sender: TObject);
begin
  if CompAtivo is TPanel then
  begin
    TPanel(CompAtivo).Alignment := taRightJustify;
    AjeitaTamanhoTitulos();
  end;
end;

procedure TfrmGeraRelatorios.FontComboBox1Change(Sender: TObject);
begin
  if CompAtivo is TPanel then
  begin
    TPanel(CompAtivo).Font.Name := FontComboBox1.FontName;
    AjeitaTamanhoTitulos();
  end;
end;

procedure TfrmGeraRelatorios.ColorComboBox1Change(Sender: TObject);
begin
  if CompAtivo is TPanel then
    TPanel(CompAtivo).Font.Color := ColorComboBox1.ColorValue;
end;

procedure TfrmGeraRelatorios.ComboBox1Change(Sender: TObject);
begin
  if CompAtivo is TPanel then
  begin
    TPanel(CompAtivo).Font.Size := StrToInt(ComboBox1.Items.Strings[ComboBox1.ItemIndex]);
    AjeitaTamanhoTitulos();
  end;
end;

procedure TfrmGeraRelatorios.edTituloKeyPress(Sender: TObject;
  var Key: Char);
begin
//  if key = #13 then
//    BitBtn8.Click;
  if key = #8 then key := #0;
  if CompAtivo is TPanel then
  begin
    TPanel(CompAtivo).Caption := edTitulo.Text + Key;
    AjeitaTamanhoTitulos();
  end;
end;

procedure TfrmGeraRelatorios.pnChamaTextoTituloDblClick(Sender: TObject);
begin
  pnTextoTitulo.Visible := True;
  pnTextoTitulo.BringToFront;
  pnTextoTitulo.Left := 493;
  pnTextoTitulo.Top := 245;
  edTitulo.SetFocus;
  edTitulo.Text := TPanel(CompAtivo).Caption;
end;

procedure TfrmGeraRelatorios.TrackBar1Change(Sender: TObject);
begin
  if NOT(TPanel(CompAtivo).Tag in [5,10]) then Exit;
  TPanel(CompAtivo).Width := TrackBar1.Position;
  lTamCampo.Caption := IntToStr(TrackBar1.Position) + ' (' + FormatFloat('###,##0.00', TrackBar1.Position/30.15) + 'cm)';
  if TPanel(CompAtivo).Width + TPanel(CompAtivo).Left > 660 then
    TrackBar1.Position := TrackBar1.Position - 5;
  if TrackBar1.Position < 20 then
      TrackBar1.Position := 20;
end;

procedure TfrmGeraRelatorios.pnChamaTamCampoDblClick(Sender: TObject);
begin
  pnTamCampo.Visible := True;
  pnTamCampo.Left := 157;
  pnTamCampo.Top := 12;
  pnTamCampo.BringToFront;
  TrackBar1.Position := TPanel(CompAtivo).Width;
  lTamOriginal.Caption := IntToStr(TPanel(CompAtivo).Width);
  if TPanel(CompAtivo).Tag = 5 then
    lNomeCampo.Caption := TPanel(CompAtivo).Hint
  else
    lNomeCampo.Caption := TPanel(CompAtivo).Caption;
end;

procedure TfrmGeraRelatorios.SpeedButton2Click(Sender: TObject);
begin
  pnTamCampo.Visible := False;
end;

procedure TfrmGeraRelatorios.SpeedButton3Click(Sender: TObject);
begin
  AjeitaTamanhoTitulos();
  pnTextoTitulo.Visible := False;
end;

procedure TfrmGeraRelatorios.Data1Click(Sender: TObject);
begin
  if pnDataAtual.Visible then
    pnDataAtual.Visible := False
  else
    pnDataAtual.Visible := True;
end;

procedure TfrmGeraRelatorios.Npgina1Click(Sender: TObject);
begin
  if pnNumPagina.Visible then
    pnNumPagina.Visible := False
  else
    pnNumPagina.Visible := True;
end;

procedure TfrmGeraRelatorios.Hora1Click(Sender: TObject);
begin
  if pnHoraAtual.Visible then
    pnHoraAtual.Visible := False
  else
    pnHoraAtual.Visible := True;
end;

procedure TfrmGeraRelatorios.Vertical1Click(Sender: TObject);
var
  vpnLinha : TPanel;
begin
  vpnLinha := TPanel.Create(self);
  vpnLinha.Width := 3;
  vpnLinha.Height := 50;
  vpnLinha.Parent := Panel1.Parent;
  vpnLinha.Caption := '';
  vpnLinha.Color := clBlack;
  vpnLinha.Tag := 8;
  vpnLinha.BringToFront;
  vpnLinha.OnMouseDown := Panel1.OnMouseDown;
  vpnLinha.OnMouseMove := Panel1.OnMouseMove;
  vpnLinha.OnMouseUp := Panel1.OnMouseUp;
  vpnLinha.OnDblClick := pnChamaTamLinha.OnDblClick;

  SetCapture(TButton(vpnLinha).Handle);
  Capturing := True;
  MouseDownSpot.X := 0;
  MouseDownSpot.Y := 0;
end;

procedure TfrmGeraRelatorios.BitBtn23Click(Sender: TObject);
var
  vLCampo : TPanel;
  vCampoMascara : string;
begin
  if ListaCampos.ItemIndex = -1 then
  begin
    Beep;
    Exit;
  end;
  vLCampo := TPanel.Create(self);
  vQtdCampos := vQtdCampos + 1;
  try
  	vLCampo.Name := listaCamposX.Items.Strings[listaCampos.ItemIndex] + '__' +
    	              listaTabelasX.Items.Strings[listaTabelas.ItemIndex];
  except
    Mensagem('O campo selecionado já encontra-se no formulário!');
  end;
  vLCampo.Caption := listaCampos.Items.Strings[listaCampos.ItemIndex];
  vLCampo.Width := Trunc(StrToInt(listaCamposTam.Items.Strings[listaCampos.ItemIndex])*6.4);
  vLCampo.Height := 18;
  vLCampo.Color := clWhite;
  vLCampo.Font.Name := 'Arial';
  vLCampo.Font.Size := 7;
  vLCampo.Hint := vLCampo.Caption + '[' + listaTabelas.Items.Strings[listaTabelas.ItemIndex] + ']';
  case cbCampoMascara.ItemIndex of
    1 : vCampoMascara := ',0.00';
    2 : vCampoMascara := '';
  end;
  if vCampoMascara <> '' then
    vLCampo.Hint := vLCampo.Hint + '&MSK:' + vCampoMascara;
  vLCampo.ShowHint := True;
  vLCampo.Tag := 5; //PARA IDENTIFICAR QUE E UM PAINEL RELATIVO A CAMPO
  vLCampo.OnDblClick := pnChamaTamCampo.OnDblClick;
  vLCampo.OnMouseMove := Panel1.OnMouseMove;
  vLCampo.OnMouseDown := Panel1.OnMouseDown;
  vLCampo.OnMouseUp := Panel1.OnMouseUp;
  vLCampo.Parent := Panel1.Parent;
  vLCampo.BringToFront;
  vLCampo.PopupMenu := popAlinha;
  vLCampo.ParentFont := False;

  SetCapture(TButton(vLCampo).Handle);
  Capturing := True;
  MouseDownSpot.X := 0;
  MouseDownSpot.Y := 0;
  pnCampos.Visible := False;
end;

procedure TfrmGeraRelatorios.BitBtn24Click(Sender: TObject);
begin
  pnCampos.Visible := False;
end;

procedure TfrmGeraRelatorios.Horizontal1Click(Sender: TObject);
var
  vpnLinha : TPanel;
begin
  vpnLinha := TPanel.Create(self);
  vpnLinha.Width := 50;
  vpnLinha.Height := 3;
  vpnLinha.Parent := Panel1.Parent;
  vpnLinha.Caption := '';
  vpnLinha.Color := clBlack;
  vpnLinha.Tag := 8;
  vpnLinha.BringToFront;
  vpnLinha.OnMouseDown := Panel1.OnMouseDown;
  vpnLinha.OnMouseMove := Panel1.OnMouseMove;
  vpnLinha.OnMouseUp := Panel1.OnMouseUp;
  vpnLinha.OnDblClick := pnChamaTamLinha.OnDblClick;

  SetCapture(TButton(vpnLinha).Handle);
  Capturing := True;
  MouseDownSpot.X := 0;
  MouseDownSpot.Y := 0;
end;

procedure TfrmGeraRelatorios.pnChamaTamLinhaDblClick(Sender: TObject);
begin
  pnTamLinha.Top := 294;
  pnTamLinha.Left := 284;
  pnTamLinha.Visible := True;
  pnTamLinha.BringToFront;
  if TPanel(CompAtivo).Height = 3 then
  begin
    TrackBar2.Position := (TPanel(CompAtivo).Width);
    lTamLinha.Caption := 'Tamanho da linha: ' + IntToStr(TrackBar2.Position) + ' (' + FormatFloat('###,##0.00', TrackBar2.Position/30.15) + 'cm)';
  end;
  if TPanel(CompAtivo).Width = 3 then
  begin
    TrackBar2.Position := (TPanel(CompAtivo).Height);
    lTamLinha.Caption := 'Tamanho da linha: ' + IntToStr(TrackBar2.Position) + ' (' + FormatFloat('###,##0.00', TrackBar2.Position/30.15) + 'cm)';
  end;
end;

procedure TfrmGeraRelatorios.SpeedButton5Click(Sender: TObject);
begin
  pnTamLinha.Visible := False;
end;

procedure TfrmGeraRelatorios.BitBtn28Click(Sender: TObject);
begin
  TImage(FigAtiva).Top := TImage(FigAtiva).Top - 2;
  edImagemX.Text := FormatFloat('###,##0.00', TImage(FigAtiva).Left/30.15);
  edImagemY.Text := FormatFloat('###,##0.00', TImage(FigAtiva).Top/30.15);
end;

procedure TfrmGeraRelatorios.pnChamaCfgFiguraDblClick(Sender: TObject);
begin
  FigAtiva := Sender;
  pnConfiguraFigura.Visible := True;
  pnConfiguraFigura.BringToFront;
  pnConfiguraFigura.Top := 20;
  pnConfiguraFigura.Left := 477;
end;

procedure TfrmGeraRelatorios.BitBtn31Click(Sender: TObject);
begin
  TImage(FigAtiva).Left := TImage(FigAtiva).Left + 2;
  edImagemX.Text := FormatFloat('###,##0.00', TImage(FigAtiva).Left/30.15);
  edImagemY.Text := FormatFloat('###,##0.00', TImage(FigAtiva).Top/30.15);
end;

procedure TfrmGeraRelatorios.BitBtn29Click(Sender: TObject);
begin
  TImage(FigAtiva).Top := TImage(FigAtiva).Top + 2;
  edImagemX.Text := FormatFloat('###,##0.00', TImage(FigAtiva).Left/30.15);
  edImagemY.Text := FormatFloat('###,##0.00', TImage(FigAtiva).Top/30.15);
end;

procedure TfrmGeraRelatorios.BitBtn30Click(Sender: TObject);
begin
  TImage(FigAtiva).Left := TImage(FigAtiva).Left - 2;
  edImagemX.Text := FormatFloat('###,##0.00', TImage(FigAtiva).Left/30.15);
  edImagemY.Text := FormatFloat('###,##0.00', TImage(FigAtiva).Top/30.15);
end;

procedure TfrmGeraRelatorios.edImagemLarguraChange(Sender: TObject);
begin
  TImage(FigAtiva).Width := Trunc(edImagemLargura.Value*30.15);
end;

procedure TfrmGeraRelatorios.edImagemAlturaChange(Sender: TObject);
begin
  TImage(FigAtiva).Height := Trunc(edImagemAltura.Value*30.15);
end;

procedure TfrmGeraRelatorios.SpeedButton6Click(Sender: TObject);
begin
  pnConfiguraFigura.Visible := False;
end;

procedure TfrmGeraRelatorios.cbAjustaStretchClick(Sender: TObject);
begin
  if cbAjustaStretch.Checked then
    TImage(FigAtiva).Stretch := True
  else
    TImage(FigAtiva).Stretch := False;
  edImagemAltura.Value := TImage(FigAtiva).Height / 30.15;
  edImagemLargura.Value := TImage(FigAtiva).Width / 30.15;
end;

procedure TfrmGeraRelatorios.cbAjustaAutoSizeClick(Sender: TObject);
begin
  if cbAjustaAutoSize.Checked then
    TImage(FigAtiva).AutoSize := True
  else
    TImage(FigAtiva).AutoSize := False;
  edImagemAltura.Value := TImage(FigAtiva).Height / 30.15;
  edImagemLargura.Value := TImage(FigAtiva).Width / 30.15;
end;

procedure TfrmGeraRelatorios.SpeedButton4Click(Sender: TObject);
begin
  pnCampos.Visible := False;
end;

procedure TfrmGeraRelatorios.BitBtn1Click(Sender: TObject);
begin
  TImage(FigAtiva).Free;
  FigAtiva := nil;
  pnConfiguraFigura.Visible := False;
end;

procedure TfrmGeraRelatorios.chkBandaGrupoClick(Sender: TObject);
var
  cont : integer;
begin
  if chkBandaGrupo.Checked then
  begin
    linhaDivisaoGrupo.Visible := True;
    lGrupo.Visible := True;
    linhaDivisaoGrupo.Top := linhaDivisaoD.Top;
    lGrupo.Top := linhaDivisaoGrupo.Top - 14;
    for cont := ComponentCount - 1 downto 0 do //abaixar tudo q esteja abaixo da linha de campos:
      if Components[cont] is TPanel then
        if (TPanel(Components[cont]).Tag in [5,6,8,9]) and (TPanel(Components[cont]).Top > linhaDivisaoD.Top) then
          TPanel(Components[cont]).Top := TPanel(Components[cont]).Top + 40;

    linhaDivisaoD.Top := linhaDivisaoD.Top + 40;
    lCampos.Top := linhaDivisaoD.Top - 14;
    lResumo.Top := linhaDivisaoResumo.Top - 14;
    cbCampoGrupo.Enabled := True;
    chkResumoGrupo.Enabled := True;
    cbCampoGrupo.SetFocus;
  end
  else
  begin
    linhaDivisaoGrupo.Visible := False;
    lGrupo.Visible := False;
    for cont := ComponentCount - 1 downto 0 do //abaixar tudo q esteja abaixo da linha de campos:
      if Components[cont] is TPanel then
        if (TPanel(Components[cont]).Tag in [5,6,8,9]) and (TPanel(Components[cont]).Top > linhaDivisaoD.Top) then
          TPanel(Components[cont]).Top := TPanel(Components[cont]).Top - 40;

    linhaDivisaoD.Top := linhaDivisaoD.Top - 40;
    lCampos.Top := linhaDivisaoD.Top - 14;
    lResumo.Top := linhaDivisaoResumo.Top - 14;
    cbCampoGrupo.Enabled := False;
    chkResumoGrupo.Enabled := False;
  end;

  if chkBandaGrupo.Checked then
  begin
    chkFrameGrupoTop.Enabled := True; chkFrameGrupoBottom.Enabled := True;
    chkFrameGrupoLeft.Enabled := True; chkFrameGrupoRight.Enabled := True;
  end
  else
  begin
    chkFrameGrupoTop.Enabled := False; chkFrameGrupoBottom.Enabled := False;
    chkFrameGrupoLeft.Enabled := False; chkFrameGrupoRight.Enabled := False;
    chkFrameGrupoTop.Checked := False; chkFrameGrupoBottom.Checked := False;
    chkFrameGrupoLeft.Checked := False; chkFrameGrupoRight.Checked := False;
  end;
end;

procedure TfrmGeraRelatorios.chkResumoGrupoClick(Sender: TObject);
var
  cont : integer;
begin
  if chkResumoGrupo.Checked then
  begin
    //chkBandaGrupo.Enabled := False;
    linhaDivisaoResGrupo.Visible := True;
    lResGrupo.Visible := True;
    linhaDivisaoResGrupo.Top := linhaDivisaoResumo.Top;
    lResGrupo.Top := linhaDivisaoResGrupo.Top - 14;
    for cont := ComponentCount - 1 downto 0 do //abaixar tudo q esteja abaixo da linha de campos:
      if Components[cont] is TPanel then
        if (TPanel(Components[cont]).Tag in [5,6,8,9]) and (TPanel(Components[cont]).Top > linhaDivisaoResumo.Top) then
          TPanel(Components[cont]).Top := TPanel(Components[cont]).Top + 40;

    linhaDivisaoResumo.Top := linhaDivisaoResumo.Top + 40;
    lResumo.Top := linhaDivisaoResumo.Top - 14;
    lResGrupo.Top := linhaDivisaoResGrupo.Top - 14;
  end
  else
  begin
    //chkBandaGrupo.Enabled := True;
    linhaDivisaoResGrupo.Visible := False;
    lResGrupo.Visible := False;
    for cont := ComponentCount - 1 downto 0 do //abaixar tudo q esteja abaixo da linha de campos:
      if Components[cont] is TPanel then
        if (TPanel(Components[cont]).Tag in [5,6,8,9]) and (TPanel(Components[cont]).Top > linhaDivisaoResumo.Top) then
          TPanel(Components[cont]).Top := TPanel(Components[cont]).Top - 40;

    linhaDivisaoResumo.Top := linhaDivisaoResumo.Top - 40;
    lResumo.Top := linhaDivisaoResumo.Top - 14;
    lResGrupo.Top := linhaDivisaoResGrupo.Top - 14;
  end;
end;

procedure TfrmGeraRelatorios.SpeedButton7Click(Sender: TObject);
begin
  if (NOT chkBandaGrupo.Checked) and (chkResumoGrupo.Checked) then
  begin
    Mensagem('Não pode haver resumo de grupo se não houver grupo!');
    Exit;
  end;
  pnConfigBandas.Visible := False;
end;

procedure TfrmGeraRelatorios.Memo1KeyPress(Sender: TObject; var Key: Char);
var
  linha, coluna : integer;
begin
{  Modificando a posição:
ActiveControl:=Memo1;
MemoCursorTo(Memo1,2,3);
Obtendo a Posição:}
 // Memo2.SelStart := Memo1.CaretPos.X;
  Memo2.OnKeyPress(self,  key);
  SendMessage(Memo2.Handle,Integer(key),Integer(True),0);

  {if Key  = #8 then
  begin
    SendMessage(Memo2.Handle,vk_delete,Integer(True),0);
  end
  else
    }
end;

procedure TfrmGeraRelatorios.Memo2KeyPress(Sender: TObject; var Key: Char);
begin
 // Memo1.Text := Memo1.Text + Key;
end;

procedure TfrmGeraRelatorios.BitBtn32Click(Sender: TObject);
var
  vQuery : TIBQuery;
begin
  vQuery := TIBQuery.Create(Application);
  vQuery.Database := dm2.Database1;
  vQuery.SQL.Clear;
  vQuery.SQL.Add(Memo2.Text);
  try
    vQuery.Open;
    Mensagem('Código SQL válido!');
  except
    Mensagem('Houve um erro na execução do código SQL!');
  end;
  vQuery.Close;
  vQuery.Free;
end;

procedure TfrmGeraRelatorios.SpeedButton8Click(Sender: TObject);
begin
  pnConfigExpressoes.Visible := False;
end;

procedure TfrmGeraRelatorios.BitBtn26Click(Sender: TObject);
begin
  edExpressao.Text := edExpressao.Text + 'SUM(';
end;

procedure TfrmGeraRelatorios.BitBtn41Click(Sender: TObject);
var
  vExpressao : TPanel;
  vExpMascara : string;
begin
  vExpressao := TPanel.Create(self);
  //vExpressao.Name := '';
  vExpressao.Caption := edExpressao.Text;
  vExpressao.Width := 30;
  vExpressao.Height := 18;
  vExpressao.Color := clWhite;
  vExpressao.Font.Name := 'Arial';
  vExpressao.Font.Size := 7;
  vExpMascara := ',0.00';
  if cbExpFormatar.Checked then
  begin
    if cbExpReset.Checked then vExpressao.Hint := 'M' + vExpMascara + 'ResetaS' //Reseta Sim
    else vExpressao.Hint := 'M' + vExpMascara + 'ResetaN' //Reseta Nao
  end
  else
  begin
    if cbExpReset.Checked then vExpressao.Hint := 'ResetaS' //Reseta Sim
    else vExpressao.Hint := 'ResetaN' //Reseta Nao
  end;
  vExpressao.ShowHint := False;
  vExpressao.Tag := 10; //PARA IDENTIFICAR QUE E UM PAINEL RELATIVO A EXPRESSOES
  vExpressao.OnDblClick := pnChamaTamCampo.OnDblClick;
  vExpressao.OnMouseMove := Panel1.OnMouseMove;
  vExpressao.OnMouseDown := Panel1.OnMouseDown;
  vExpressao.OnMouseUp := Panel1.OnMouseUp;
  vExpressao.Parent := Panel1.Parent;
  vExpressao.BringToFront;
  vExpressao.PopupMenu := popAlinha;
  vExpressao.ParentFont := False;

  SetCapture(TButton(vExpressao).Handle);
  Capturing := True;
  MouseDownSpot.X := 0;
  MouseDownSpot.Y := 0;
  pnConfigExpressoes.Visible := False;
end;

procedure TfrmGeraRelatorios.listaTabelas2Click(Sender: TObject);
begin
  ExecutaSQL('select GRT_DESC_CAMPO, GRT_CAMPO, GRT_TAMANHO from GERADOR_RELATORIO_TABELAS where GRT_DESC_TABELA = ' + QuotedStr(listaTabelas2.Items.Strings[listaTabelas2.ItemIndex]), qryTabelasCampos);
  listaCampos2.Items.Clear;
  listaCampos2X.Items.Clear;
  listaCamposTam2.Items.Clear;
  qryTabelasCampos.First;
  while NOT qryTabelasCampos.EOF do
  begin
    listaCampos2.Items.Add(qryTabelasCampos.FieldByName('GRT_DESC_CAMPO').AsString);
    listaCampos2X.Items.Add(qryTabelasCampos.FieldByName('GRT_CAMPO').AsString);
    listaCamposTam2.Items.Add(qryTabelasCampos.FieldByName('GRT_TAMANHO').AsString);
    qryTabelasCampos.Next;
  end;
end;

procedure TfrmGeraRelatorios.SpeedButton9Click(Sender: TObject);
begin
  SpeedButton19.Enabled := True;
  pnCampos.Visible := True;
  pnCampos.Top := 15;
  pnCampos.Left := 386;
  pnCampos.BringToFront;
end;

procedure TfrmGeraRelatorios.SpeedButton10Click(Sender: TObject);
var
  vLTitulo : TPanel;
  cont : integer;
begin
  vLTitulo := TPanel.Create(self);
  vQtdTitulosCampos := vQtdTitulosCampos + 1;
  vLTitulo.Name := 'vLTitulo' + IntToStr(vQtdTitulosCampos);
  vLTitulo.Caption := 'Novo título';
  vLTitulo.Hint := 'Duplo clique para alterar texto';
  vlTitulo.ShowHint := True;
  vLTitulo.Height := 16;
  vLTitulo.BevelOuter := bvRaised;
  vLTitulo.BevelInner := bvLowered;
  vLTitulo.BevelWidth := 1;
  vlTitulo.Width := Length(vLTitulo.Caption)*7;
  vLTitulo.Color := Panel1.Color;
  vLTitulo.Font.Color := clBlack;
  vLTitulo.Font.Name := 'Arial';
  vLTitulo.Font.Size := 8;
  vLTitulo.Font.Style := [];
  vlTitulo.Alignment := taLeftJustify;
  vLTitulo.Tag := 6; //PARA IDENTIFICAR QUE E UM PAINEL RELATIVO A TITULO
  vLTitulo.OnDblClick := pnChamaTextoTitulo.OnDblClick;
  vLTitulo.OnMouseMove := Panel1.OnMouseMove;
  vLTitulo.OnMouseDown := Panel1.OnMouseDown;
  vLTitulo.OnMouseUp := Panel1.OnMouseUp;
  vLTitulo.ParentFont := False;
  vLTitulo.Parent := Panel1.Parent;
  vLTitulo.BringToFront;
  vLTitulo.PopupMenu := popAlinha;

  SetCapture(TButton(vLTitulo).Handle);
  Capturing := True;
  MouseDownSpot.X := 0;
  MouseDownSpot.Y := 0;
end;

procedure TfrmGeraRelatorios.SpeedButton11Click(Sender: TObject);
begin
  popLinhas.Popup(SpeedButton11.Left+20, SpeedButton11.Top+150);
end;

procedure TfrmGeraRelatorios.SpeedButton12Click(Sender: TObject);
var
  Figura1 : TImage;
begin
  if OpenPictureDialog1.Execute then
  if OpenPictureDialog1.FileName <> '' then
  begin
    Figura1 := TImage.Create(self);
    Figura1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    Figura1.Hint := OpenPictureDialog1.FileName;
    //Figura1.AutoSize := True;
    Figura1.Top := 40;
    Figura1.Tag := 11;
    Figura1.Left := 160;
    //Figura1.OnMouseDown := Panel1.OnMouseDown;
    //Figura1.OnMouseMove := Panel1.OnMouseMove;
    //Figura1.OnMouseUp   := Panel1.OnMouseUp;
    Figura1.OnDblClick := pnChamaCfgFigura.OnDblClick;
    Figura1.Parent := linhaDivisaoC.Parent;
  end;
end;

procedure TfrmGeraRelatorios.SpeedButton13Click(Sender: TObject);
begin
  popMacros.Popup(SpeedButton13.Left+20, SpeedButton13.Top+150);
end;

procedure TfrmGeraRelatorios.SpeedButton14Click(Sender: TObject);
begin
  pnConfigExpressoes.Visible := True;
  pnConfigExpressoes.BringToFront;
  pnConfigExpressoes.Top := 11;
  pnConfigExpressoes.Left := 278;
  listaTabelas2.Items := listaTabelas.Items;
  listaTabelas2X.Items := listaTabelasX.Items;
  listaCampos2.Items := listaCampos.Items;
  listaCampos2X.Items := listaCamposX.Items;
  listaCamposTam2.Items := listaCamposTam.Items;
end;

procedure TfrmGeraRelatorios.SpeedButton15Click(Sender: TObject);
begin
  if CompAtivo = nil then Exit;
  if TPanel(CompAtivo).Tag in [6,8,10] then
    TPanel(CompAtivo).Free;
  if TPanel(CompAtivo).Tag = 5 then
    if Pergunta('O campo selecionado será apagado. Continua?') <> 'N' then
    begin
      TPanel(CompAtivo).Free;
      CompAtivo := nil;
    end;
  CompAtivo := nil;
end;

procedure TfrmGeraRelatorios.SpeedButton17Click(Sender: TObject);
var
  cont : integer;
begin
  pnConfigBandas.Visible := True;
  pnConfigBandas.BringToFront;
  cbCampoGrupo.Items.Clear;
  for cont := ComponentCount - 1 downto 0 do
    if Components[cont] is TPanel then
      if TPanel(Components[cont]).Tag = 5 then
        cbCampoGrupo.Items.Add(TPanel(Components[cont]).Name);
  pnConfigBandas.Top := 94;
  pnConfigBandas.Left := 3;
  if chkBandaGrupo.Checked then
  begin
    chkFrameGrupoTop.Enabled := True; chkFrameGrupoBottom.Enabled := True;
    chkFrameGrupoLeft.Enabled := True; chkFrameGrupoRight.Enabled := True;
  end
  else
  begin
    chkFrameGrupoTop.Enabled := False; chkFrameGrupoBottom.Enabled := False;
    chkFrameGrupoLeft.Enabled := False; chkFrameGrupoRight.Enabled := False;
    chkFrameGrupoTop.Checked := False; chkFrameGrupoBottom.Checked := False;
    chkFrameGrupoLeft.Checked := False; chkFrameGrupoRight.Checked := False;
  end;
end;

procedure TfrmGeraRelatorios.SpeedButton18Click(Sender: TObject);
var
  cont : integer;
  vQtdQRLabel : integer;
  vqrLabel : TQRLabel;
  vqrCampo : TQRDBText;
  vqrExp   : TQRExpr;
  vqrLinha : TQRShape;
  vqrImagem: TQRImage;
  vqrMacro : TQRSysData;
begin
  if Trim(Memo2.Text) = '' then
  begin
    Mensagem('A filtragem não foi definida!');
    Exit;
  end;
  btSalvar.Enabled := True;
  
  with Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text := Memo2.Text;
    try
    	Open;
    except
      Mensagem('O filtro não está definido corretamente. Verifique-o em "Filtragem(SQL)"');
      Exit;
    end;
  end;

  CompQRTitulo.Left := -200; CompQRCampo.Left := -200;
  CompQRGrupo.Left  := -200; compQRResGrupo.Left := -200;
  CompQRResumo.Left := -200;
  QuickRep1.DataSet := Query1;
  qrTitulo.Height := linhaDivisaoC.Top + vCorrigeBanda;
  qrDetalhe.Height := linhaDivisaoD.Top - linhaDivisaoC.Top + vCorrigeBanda;
  qrResumo.Height := linhaDivisaoResumo.Top - linhaDivisaoD.Top + vCorrigeBanda;
  if linhaDivisaoGrupo.Visible then
  begin
    qrGrupo.Height := linhaDivisaoGrupo.Top - linhaDivisaoC.Top + vCorrigeBanda;
    qrDetalhe.Height := linhaDivisaoD.Top - linhaDivisaoGrupo.Top + vCorrigeBanda;
    qrGrupo.Expression := 'Query1.' + copy(cbCampoGrupo.Text, 1, Pos('__', cbCampoGrupo.Text) - 1);
  end
  else
    qrGrupo.Height := 1;
  if linhaDivisaoResGrupo.Visible then
    qrResGrupo.Height := linhaDivisaoResGrupo.Top - linhaDivisaoD.Top + vCorrigeBanda
  else
    qrResGrupo.Height := 1;

  //frames das bandas:
  qrTitulo.Frame.DrawTop := False; qrTitulo.Frame.DrawBottom := False;
  qrTitulo.Frame.DrawRight := False; qrTitulo.Frame.DrawLeft := False;
  if chkFrameCabTop.Checked    then qrTitulo.Frame.DrawTop := True;
  if chkFrameCabBottom.Checked then qrTitulo.Frame.DrawBottom := True;
  if chkFrameCabRight.Checked  then qrTitulo.Frame.DrawRight := True;
  if chkFrameCabLeft.Checked   then qrTitulo.Frame.DrawLeft := True;

  qrGrupo.Frame.DrawTop := False; qrGrupo.Frame.DrawBottom := False;
  qrGrupo.Frame.DrawRight := False; qrGrupo.Frame.DrawLeft := False;
  if chkFrameGrupoTop.Checked    then qrGrupo.Frame.DrawTop := True;
  if chkFrameGrupoBottom.Checked then qrGrupo.Frame.DrawBottom := True;
  if chkFrameGrupoRight.Checked  then qrGrupo.Frame.DrawRight := True;
  if chkFrameGrupoLeft.Checked   then qrGrupo.Frame.DrawLeft := True;

  qrDetalhe.Frame.DrawTop := False; qrDetalhe.Frame.DrawBottom := False;
  qrDetalhe.Frame.DrawRight := False; qrDetalhe.Frame.DrawLeft := False;
  if chkFrameCamposTop.Checked    then qrDetalhe.Frame.DrawTop := True;
  if chkFrameCamposBottom.Checked then qrDetalhe.Frame.DrawBottom := True;
  if chkFrameCamposRight.Checked  then qrDetalhe.Frame.DrawRight := True;
  if chkFrameCamposLeft.Checked   then qrDetalhe.Frame.DrawLeft := True;

  qrResGrupo.Frame.DrawTop := False; qrResGrupo.Frame.DrawBottom := False;
  qrResGrupo.Frame.DrawRight := False; qrResGrupo.Frame.DrawLeft := False;
  if chkFrameResGrupoTop.Checked    then qrResGrupo.Frame.DrawTop := True;
  if chkFrameResGrupoBottom.Checked then qrResGrupo.Frame.DrawBottom := True;
  if chkFrameResGrupoRight.Checked  then qrResGrupo.Frame.DrawRight := True;
  if chkFrameResGrupoLeft.Checked   then qrResGrupo.Frame.DrawLeft := True;

  qrResumo.Frame.DrawTop := False; qrResumo.Frame.DrawBottom := False;
  qrResumo.Frame.DrawRight := False; qrResumo.Frame.DrawLeft := False;
  if chkFrameResumoTop.Checked    then qrResumo.Frame.DrawTop := True;
  if chkFrameResumoBottom.Checked then qrResumo.Frame.DrawBottom := True;
  if chkFrameResumoRight.Checked  then qrResumo.Frame.DrawRight := True;
  if chkFrameResumoLeft.Checked   then qrResumo.Frame.DrawLeft := True;
  //fim dos frames das bandas


  //Geracao de titulos
  for cont := ComponentCount - 1 downto 0 do
    if (Components[cont] is TPanel) and (Components[cont].Tag = 6) then
    begin
      vqrLabel := TQRLabel.Create(self);
      //vqrLabel.Name := 'qrl' + TPanel(Components[cont]).Name;
      vqrLabel.Caption := TPanel(Components[cont]).Caption;
      vqrLabel.Left := TPanel(Components[cont]).Left;
      vqrLabel.Font := TPanel(Components[cont]).Font;

      if TPanel(Components[cont]).Top < linhaDivisaoC.Top then
      begin
        vqrLabel.Parent := CompQRTitulo.Parent;
        vqrLabel.Top := TPanel(Components[cont]).Top + vCorrigeTopObj;
      end;
      if linhaDivisaoGrupo.Visible then
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoC.Top) and (TPanel(Components[cont]).Top < linhaDivisaoGrupo.Top)then
        begin
          vqrLabel.Parent := CompQRGrupo.Parent;
          vqrLabel.Top := TPanel(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoGrupo.Top) and (TPanel(Components[cont]).Top < linhaDivisaoD.Top)then
        begin
          vqrLabel.Parent := CompQRCampo.Parent;
          vqrLabel.Top := TPanel(Components[cont]).Top - linhaDivisaoGrupo.Top + vCorrigeTopObj;
        end;
      end
      else
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoC.Top) and (TPanel(Components[cont]).Top < linhaDivisaoD.Top)then
        begin
          vqrLabel.Parent := CompQRCampo.Parent;
          vqrLabel.Top := TPanel(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          vqrLabel.Parent := CompQRResumo.Parent;
          vqrLabel.Top := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
      end;
      if linhaDivisaoResGrupo.Visible then
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResGrupo.Top)then
        begin
          vqrLabel.Parent := CompQRResGrupo.Parent;
          vqrLabel.Top := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoResGrupo.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          vqrLabel.Parent := CompQRResumo.Parent;
          vqrLabel.Top := TPanel(Components[cont]).Top - linhaDivisaoResGrupo.Top + vCorrigeTopObj;
        end;
      end
      else
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          vqrLabel.Parent := CompQRResumo.Parent;
          vqrLabel.Top := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
      end;
    end;

  //Geracao de campos
  for cont := ComponentCount - 1 downto 0 do
    if (Components[cont] is TPanel) and (Components[cont].Tag = 5) then
    begin
      vqrCampo := TQRDBText.Create(self);
   //   vqrCampo.Name := 'qrc' + TPanel(Components[cont]).Name;
      vqrCampo.Left := TPanel(Components[cont]).Left;
      vqrCampo.Font := TPanel(Components[cont]).Font;
      vqrCampo.AutoSize := False;
      vqrCampo.Width := TPanel(Components[cont]).Width;
      vqrCampo.Alignment := TPanel(Components[cont]).Alignment;
      vqrCampo.DataField := copy(TPanel(Components[cont]).Name, 1, Pos('__', TPanel(Components[cont]).Name)-1);
      vqrCampo.DataSet := Query1; //!!!!!!!
      if Pos('&MSK:', TPanel(Components[cont]).Hint) <> 0 then
        vqrCampo.Mask := copy(TPanel(Components[cont]).Hint, Pos('&MSK:', TPanel(Components[cont]).Hint)+5, 10);
      if TPanel(Components[cont]).Top < linhaDivisaoC.Top then
      begin
        vqrCampo.Parent := CompQRTitulo.Parent;
        vqrCampo.Top := TPanel(Components[cont]).Top + vCorrigeTopObj;
      end;
      if linhaDivisaoGrupo.Visible then
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoC.Top) and (TPanel(Components[cont]).Top < linhaDivisaoGrupo.Top)then
        begin
          vqrCampo.Parent := CompQRGrupo.Parent;
          vqrCampo.Top := TPanel(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoGrupo.Top) and (TPanel(Components[cont]).Top < linhaDivisaoD.Top)then
        begin
          vqrCampo.Parent := CompQRCampo.Parent;
          vqrCampo.Top := TPanel(Components[cont]).Top - linhaDivisaoGrupo.Top + vCorrigeTopObj;
        end;
      end
      else
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoC.Top) and (TPanel(Components[cont]).Top < linhaDivisaoD.Top)then
        begin
          vqrCampo.Parent := CompQRCampo.Parent;
          vqrCampo.Top := TPanel(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          vqrCampo.Parent := CompQRResumo.Parent;
          vqrCampo.Top := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
      end;
      if linhaDivisaoResGrupo.Visible then
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResGrupo.Top)then
        begin
          vqrCampo.Parent := CompQRResGrupo.Parent;
          vqrCampo.Top := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoResGrupo.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          vqrCampo.Parent := CompQRResumo.Parent;
          vqrCampo.Top := TPanel(Components[cont]).Top - linhaDivisaoResGrupo.Top + vCorrigeTopObj;
        end;
      end
      else
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          vqrCampo.Parent := CompQRResumo.Parent;
          vqrCampo.Top := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
      end;
    end;

  //Geracao de expressoes
  for cont := ComponentCount - 1 downto 0 do
    if (Components[cont] is TPanel) and (Components[cont].Tag = 10) then
    begin
      vqrExp := TQRExpr.Create(self);
      //vqrExp.Name := 'qrc' + TPanel(Components[cont]).Name;
      vqrExp.Left := TPanel(Components[cont]).Left;
      vqrExp.AutoSize := False;
      vqrExp.Width := TPanel(Components[cont]).Width;
      vqrExp.Font := TPanel(Components[cont]).Font;
      vqrExp.Alignment := TPanel(Components[cont]).Alignment;
      vqrExp.Expression := TPanel(Components[cont]).Caption;
      if Pos('M', TPanel(Components[cont]).Hint) <> 0 then
        vqrExp.Mask := copy(TPanel(Components[cont]).Hint, 2, Pos('Reseta',TPanel(Components[cont]).Hint)-2);
      if Pos('ResetaS', TPanel(Components[cont]).Hint) <> 0 then
        vqrExp.ResetAfterPrint := True
      else
        vqrExp.ResetAfterPrint := False;
      if TPanel(Components[cont]).Top < linhaDivisaoC.Top then
      begin
        vqrExp.Parent := CompQRTitulo.Parent;
        vqrExp.Top := TPanel(Components[cont]).Top + vCorrigeTopObj;
      end;
      if linhaDivisaoGrupo.Visible then
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoC.Top) and (TPanel(Components[cont]).Top < linhaDivisaoGrupo.Top)then
        begin
          vqrExp.Parent := CompQRGrupo.Parent;
          vqrExp.Top := TPanel(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoGrupo.Top) and (TPanel(Components[cont]).Top < linhaDivisaoD.Top)then
        begin
          vqrExp.Parent := CompQRCampo.Parent;
          vqrExp.Top := TPanel(Components[cont]).Top - linhaDivisaoGrupo.Top + vCorrigeTopObj;
        end;
      end
      else
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoC.Top) and (TPanel(Components[cont]).Top < linhaDivisaoD.Top)then
        begin
          vqrExp.Parent := CompQRCampo.Parent;
          vqrExp.Top := TPanel(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          vqrExp.Parent := CompQRResumo.Parent;
          vqrExp.Top := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
      end;
      if linhaDivisaoResGrupo.Visible then
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResGrupo.Top)then
        begin
          vqrExp.Parent := CompQRResGrupo.Parent;
          vqrExp.Top := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoResGrupo.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          vqrExp.Parent := CompQRResumo.Parent;
          vqrExp.Top := TPanel(Components[cont]).Top - linhaDivisaoResGrupo.Top + vCorrigeTopObj;
        end;
      end
      else
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          vqrExp.Parent := CompQRResumo.Parent;
          vqrExp.Top := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
      end;
    end;

  //Geracao de linhas
  for cont := ComponentCount - 1 downto 0 do
    if (Components[cont] is TPanel) and (Components[cont].Tag = 8) then
    begin
      vqrLinha := TQRShape.Create(Self);
      //vqrLabel.Name := 'qrl' + TPanel(Components[cont]).Name;
      if TPanel(Components[cont]).Width = 3 then
      begin
        vqrLinha.Shape := qrsVertLine;
        vqrLinha.Height := TPanel(Components[cont]).Height;
        vqrLinha.Width := 3;
      end
      else
      begin
        vqrLinha.Shape := qrsHorLine;
        vqrLinha.Width := TPanel(Components[cont]).Width;
        vqrLinha.Height := 3;
      end;
      vqrLinha.Left := TPanel(Components[cont]).Left;

      if TPanel(Components[cont]).Top < linhaDivisaoC.Top then
      begin
        vqrLinha.Parent := CompQRTitulo.Parent;
        vqrLinha.Top := TPanel(Components[cont]).Top + vCorrigeTopObj;
      end;
      if linhaDivisaoGrupo.Visible then
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoC.Top) and (TPanel(Components[cont]).Top < linhaDivisaoGrupo.Top)then
        begin
          vqrLinha.Parent := CompQRGrupo.Parent;
          vqrLinha.Top := TPanel(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoGrupo.Top) and (TPanel(Components[cont]).Top < linhaDivisaoD.Top)then
        begin
          vqrLinha.Parent := CompQRCampo.Parent;
          vqrLinha.Top := TPanel(Components[cont]).Top - linhaDivisaoGrupo.Top + vCorrigeTopObj;
        end;
      end
      else
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoC.Top) and (TPanel(Components[cont]).Top < linhaDivisaoD.Top)then
        begin
          vqrLinha.Parent := CompQRCampo.Parent;
          vqrLinha.Top := TPanel(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          vqrLinha.Parent := CompQRResumo.Parent;
          vqrLinha.Top := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
      end;
      if linhaDivisaoResGrupo.Visible then
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResGrupo.Top)then
        begin
          vqrLinha.Parent := CompQRResGrupo.Parent;
          vqrLinha.Top := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoResGrupo.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          vqrLinha.Parent := CompQRResumo.Parent;
          vqrLinha.Top := TPanel(Components[cont]).Top - linhaDivisaoResGrupo.Top + vCorrigeTopObj;
        end;
      end
      else
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          vqrLinha.Parent := CompQRResumo.Parent;
          vqrLinha.Top := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
      end;
    end;

  //Geracao de figuras
  for cont := ComponentCount - 1 downto 0 do
    if (Components[cont] is TImage) then
    if TImage(Components[cont]).Name <> 'Image1' then
    begin
      vqrImagem := TQRImage.Create(application);
      vqrImagem.Left := TImage(Components[cont]).Left;
      vqrImagem.Picture := TImage(Components[cont]).Picture;
     { vqrImagem.Stretch := True;
      vqrImagem.AutoSize := cbAjustaAutoSize.Checked;
      vqrImagem.Height := Trunc(edImagemAltura.Value*30.15);
      vqrImagem.Width := Trunc(edImagemLargura.Value*30.15);}

      if TImage(Components[cont]).Top < linhaDivisaoC.Top then
      begin
        vqrImagem.Parent := CompQRTitulo.Parent;
        vqrImagem.Top := TImage(Components[cont]).Top + vCorrigeTopObj;
      end;
      if linhaDivisaoGrupo.Visible then
      begin
        if (TImage(Components[cont]).Top > linhaDivisaoC.Top) and (TImage(Components[cont]).Top < linhaDivisaoGrupo.Top)then
        begin
          vqrImagem.Parent := CompQRGrupo.Parent;
          vqrImagem.Top := TImage(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
        end;
        if (TImage(Components[cont]).Top > linhaDivisaoGrupo.Top) and (TImage(Components[cont]).Top < linhaDivisaoD.Top)then
        begin
          vqrImagem.Parent := CompQRCampo.Parent;
          vqrImagem.Top := TImage(Components[cont]).Top - linhaDivisaoGrupo.Top + vCorrigeTopObj;
        end;
      end
      else
      begin
        if (TImage(Components[cont]).Top > linhaDivisaoC.Top) and (TImage(Components[cont]).Top < linhaDivisaoD.Top)then
        begin
          vqrImagem.Parent := CompQRCampo.Parent;
          vqrImagem.Top := TImage(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
        end;
        if (TImage(Components[cont]).Top > linhaDivisaoD.Top) and (TImage(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          vqrImagem.Parent := CompQRResumo.Parent;
          vqrImagem.Top := TImage(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
      end;
      if linhaDivisaoResGrupo.Visible then
      begin
        if (TImage(Components[cont]).Top > linhaDivisaoD.Top) and (TImage(Components[cont]).Top < linhaDivisaoResGrupo.Top)then
        begin
          vqrImagem.Parent := CompQRResGrupo.Parent;
          vqrImagem.Top := TImage(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
        if (TImage(Components[cont]).Top > linhaDivisaoResGrupo.Top) and (TImage(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          vqrImagem.Parent := CompQRResumo.Parent;
          vqrImagem.Top := TImage(Components[cont]).Top - linhaDivisaoResGrupo.Top + vCorrigeTopObj;
        end;
      end
      else
      begin
        if (TImage(Components[cont]).Top > linhaDivisaoD.Top) and (TImage(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          vqrImagem.Parent := CompQRResumo.Parent;
          vqrImagem.Top := TImage(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
      end;
    end;

  //Geracao de macros
  for cont := ComponentCount - 1 downto 0 do
    if (Components[cont] is TPanel) and (Components[cont].Tag = 7) then
    begin
      if TPanel(Components[cont]).Visible then
      begin
        vqrMacro := TQRSysData.Create(self);
        //vqrMacro.Name := TPanel(Components[cont]).Name;
        if TPanel(Components[cont]).Name = 'pnNumPagina' then
          vqrMacro.Data := qrsPageNumber;
        if TPanel(Components[cont]).Name = 'pnHoraAtual' then
          vqrMacro.Data := qrsTime;
        if TPanel(Components[cont]).Name = 'pnDataAtual' then
          vqrMacro.Data := qrsDate;
        vqrMacro.Left := TPanel(Components[cont]).Left;
        vqrMacro.Font := TPanel(Components[cont]).Font;

        if TPanel(Components[cont]).Top < linhaDivisaoC.Top then
        begin
          vqrMacro.Parent := CompQRTitulo.Parent;
          vqrMacro.Top := TPanel(Components[cont]).Top + vCorrigeTopObj;
        end;
        if linhaDivisaoGrupo.Visible then
        begin
          if (TPanel(Components[cont]).Top > linhaDivisaoC.Top) and (TPanel(Components[cont]).Top < linhaDivisaoGrupo.Top)then
          begin
            vqrMacro.Parent := CompQRGrupo.Parent;
            vqrMacro.Top := TPanel(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
          end;
          if (TPanel(Components[cont]).Top > linhaDivisaoGrupo.Top) and (TPanel(Components[cont]).Top < linhaDivisaoD.Top)then
          begin
            vqrMacro.Parent := CompQRCampo.Parent;
            vqrMacro.Top := TPanel(Components[cont]).Top - linhaDivisaoGrupo.Top + vCorrigeTopObj;
          end;
        end
        else
        begin
          if (TPanel(Components[cont]).Top > linhaDivisaoC.Top) and (TPanel(Components[cont]).Top < linhaDivisaoD.Top)then
          begin
            vqrMacro.Parent := CompQRCampo.Parent;
            vqrMacro.Top := TPanel(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
          end;
          if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
          begin
            vqrMacro.Parent := CompQRResumo.Parent;
            vqrMacro.Top := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
          end;
        end;
        if linhaDivisaoResGrupo.Visible then
        begin
          if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResGrupo.Top)then
          begin
            vqrMacro.Parent := CompQRResGrupo.Parent;
            vqrMacro.Top := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
          end;
          if (TPanel(Components[cont]).Top > linhaDivisaoResGrupo.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
          begin
            vqrMacro.Parent := CompQRResumo.Parent;
            vqrMacro.Top := TPanel(Components[cont]).Top - linhaDivisaoResGrupo.Top + vCorrigeTopObj;
          end;
        end
        else
        begin
          if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
          begin
            vqrMacro.Parent := CompQRResumo.Parent;
            vqrMacro.Top := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
          end;
        end;
      end;
    end;


  QuickRep1.Preview;

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

  for cont := ComponentCount - 1 downto 0 do
    if (Components[cont] is TQRSysData) then
      if TQRSysData(Components[cont]).Tag <> 20 then
        TQRSysData(Components[cont]).Free;

  for cont := ComponentCount - 1 downto 0 do
    if (Components[cont] is TQRShape) then
      if TQRShape(Components[cont]).Tag <> 20 then
        TQRShape(Components[cont]).Free;

 // QuickRep1.Free;
end;

procedure TfrmGeraRelatorios.BitBtn5Click(Sender: TObject);
begin
  if copy(edExpressao.Text, Length(edExpressao.Text), 1) = '(' then
    edExpressao.Text := edExpressao.Text + listaCampos2X.Items.Strings[listaCampos2.ItemIndex] + ')'
  else
    edExpressao.Text := edExpressao.Text + listaCampos2X.Items.Strings[listaCampos2.ItemIndex];
end;

procedure TfrmGeraRelatorios.BitBtn34Click(Sender: TObject);
begin
  edExpressao.Text := edExpressao.Text + 'MAX(';
end;

procedure TfrmGeraRelatorios.BitBtn35Click(Sender: TObject);
begin
  edExpressao.Text := edExpressao.Text + 'MIN(';
end;

procedure TfrmGeraRelatorios.BitBtn36Click(Sender: TObject);
begin
  edExpressao.Text := edExpressao.Text + 'COUNT';
end;

procedure TfrmGeraRelatorios.BitBtn37Click(Sender: TObject);
begin
  edExpressao.Text := edExpressao.Text + ' + ';
end;

procedure TfrmGeraRelatorios.BitBtn38Click(Sender: TObject);
begin
  edExpressao.Text := edExpressao.Text + ' - ';
end;

procedure TfrmGeraRelatorios.BitBtn39Click(Sender: TObject);
begin
  edExpressao.Text := edExpressao.Text + ' * ';
end;

procedure TfrmGeraRelatorios.BitBtn40Click(Sender: TObject);
begin
  edExpressao.Text := edExpressao.Text + ' / ';
end;

procedure TfrmGeraRelatorios.SpeedButton16Click(Sender: TObject);
var
  cont : integer;
begin
  for cont := ComponentCount - 1 downto 0 do
    if Components[cont] is TPanel then
      if TPanel(Components[cont]).Tag in [5,6,7,8,10] then
        TPanel(Components[cont]).Free;
  CompAtivo := nil;
end;

procedure TfrmGeraRelatorios.SpeedButton19Click(Sender: TObject);
var
  cont, contAux : integer;
  vAuxCampos, vAuxTabelas : string;
begin
  //comboCampos.Items.Clear;
 // comboCamposX.Items.Clear;

  pnFiltragem.Visible := True;
  pnFiltragem.BringToFront;
  pnFiltragem.Top := 12;
  pnFiltragem.Left := 36;

  if Trim(Memo1.Text) <> '' then Exit;

  for cont := ComponentCount - 1 downto 0 do
    if Components[cont] is TPanel then
      if TPanel(Components[cont]).Tag = 5 then
      begin
        for contAux := 0 to listaTabelasEscolhidas.Items.Count - 1 do
        begin
          if copy(TPanel(Components[cont]).Name, Pos('__',TPanel(Components[cont]).Name)+2, Length(TPanel(Components[cont]).Name)) = listaTabelasEscolhidasX.Items.Strings[contAux] then
          begin
            comboCamposX.Items.Add('T' + IntToStr(contAux+1) + '.' + copy(TPanel(Components[cont]).Name, 1, Pos('__',TPanel(Components[cont]).Name)-1));
            comboCampos.Items.Add('T' + IntToStr(contAux+1) + '.' + copy(TPanel(Components[cont]).Hint, 1, Pos('[',TPanel(Components[cont]).Hint)-1));
          end;
        end;
      end;
  //GERANDO SQL EM PORTUG:
  vAuxCampos := ''; vAuxTabelas := '';
  for cont := 0 to comboCampos.Items.Count - 1 do
    if cont = comboCampos.Items.Count - 1 then
      vAuxCampos := vAuxCampos + comboCampos.Items.Strings[cont]
    else
      vAuxCampos := vAuxCampos + comboCampos.Items.Strings[cont] + ', ';
  for cont := 0 to listaTabelasEscolhidas.Items.Count - 1 do
    vAuxTabelas := vAuxTabelas + listaTabelasEscolhidas.Items.Strings[cont] + ' T' + IntToStr(cont+1) + ', ';
  Delete(vAuxTabelas, Length(vAuxTabelas)-1, 2);
  Memo1.Text := 'selecione os campos: ' + vAuxCampos + ' das tabelas ' +
                vAuxTabelas + ' quando 1=1 ';
  //GERANDO SQL EM SQL:
  vAuxCampos := ''; vAuxtabelas := '';
  for cont := 0 to comboCamposX.Items.Count - 1 do
    if cont = comboCamposX.Items.Count - 1 then
      vAuxCampos := vAuxCampos + comboCamposX.Items.Strings[cont]
    else
      vAuxCampos := vAuxCampos + comboCamposX.Items.Strings[cont] + ', ';
  for cont := 0 to listaTabelasEscolhidasX.Items.Count - 1 do
    vAuxTabelas := vAuxTabelas + listaTabelasEscolhidasX.Items.Strings[cont] + ' T' + IntToStr(cont+1) + ', ';
  Delete(vAuxTabelas, Length(vAuxTabelas)-1, 2);
  Memo2.Text := 'select ' + vAuxCampos + ' from ' +
                vAuxTabelas + ' where 1=1 ';
end;

procedure TfrmGeraRelatorios.SpeedButton20Click(Sender: TObject);
begin
  pnFiltragem.Visible := False;
end;

procedure TfrmGeraRelatorios.btSalvarClick(Sender: TObject);
begin
  pnSalvaRelat.Visible := True;
  pnSalvaRelat.Top := 48;
  pnSalvaRelat.Left := 168;
  pnSalvaRelat.BringToFront;
  edDataCriacaoRelat.Text := DateToStr(NOW);
  lUsuarioRelat.Caption := 'Usuário: ' + fmDireitos.mOperador;
  edNomeRelat.SetFocus;
end;

procedure TfrmGeraRelatorios.SpeedButton23Click(Sender: TObject);
begin
  pnSalvaRelat.Visible := False;
end;

procedure TfrmGeraRelatorios.BitBtn4Click(Sender: TObject);
begin
  pnSalvaRelat.Visible := False;
end;

procedure TfrmGeraRelatorios.btSalvarRelClick(Sender: TObject);
var
  cont, cont2, vSequencia : integer;
  vStream : TFileStream;
begin
  ExecutaSQL('select MAX(GR_CODIGO) as SEQ from GERADOR_RELATORIOS', qryAux);
  if qryAux.FieldByName('SEQ').IsNull then
    vSequencia := 1
  else
    vSequencia := qryAux.FieldByName('SEQ').Value + 1;
  qryAux.Close;
  qryRelat.Open;

  for cont := ComponentCount - 1 downto 0 do
  if (Components[cont] is TPanel) then
  if (TPanel(Components[cont]).Tag in [5,6,7,8,10]) and (TPanel(Components[cont]).Visible) then
  begin
    qryRelat.Insert;
    qryRelatGR_CODIGO.Value := vSequencia;
    qryRelatGR_IDENTIFICACAO.Value := edNomeRelat.Text;
    qryRelatGR_DATA_CRIACAO.AsString := edDataCriacaoRelat.Text;
    qryRelatGR_USUARIO.Value := fmDireitos.mOperador;
    qryRelatGR_CRIADOR.Value := edCriador.Text;
    qryRelatGR_TEXTOSQL.Value := Memo2.Lines.Text;
    qryRelatGR_BNDHEADER_TAM.Value := qrTitulo.Height;
    qryRelatGR_BNDDETAIL_TAM.Value := qrDetalhe.Height;
    qryRelatGR_BNDSUMARY_TAM.Value := qrResumo.Height;
    qryRelatGR_BNDGROUPHEADER_TAM.Value := qrGrupo.Height;
    if chkBandaGrupo.Checked then qryRelatGR_BNDGROUPHEADER_EXISTE.Value := 'S'
    else qryRelatGR_BNDGROUPHEADER_EXISTE.Value := 'N';
    qryRelatGR_BNDGROUPHEADER_CAMPO.Value := copy(cbCampoGrupo.Text, 1, Pos('__', cbCampoGrupo.Text) - 1);
    if chkResumoGrupo.Checked then qryRelatGR_BNDGROUPFOOTER_EXISTE.Value := 'S'
    else qryRelatGR_BNDGROUPFOOTER_EXISTE.Value := 'N';
    qryRelatGR_BNDGROUPFOOTER_TAM.Value := qrResGrupo.Height;

    //frames das bandas:
    if chkFrameCabTop.Checked    then qryRelatGR_FRAME_CABECALHO.Value := qryRelatGR_FRAME_CABECALHO.Value + 'T';
    if chkFrameCabBottom.Checked then qryRelatGR_FRAME_CABECALHO.Value := qryRelatGR_FRAME_CABECALHO.Value + 'B';
    if chkFrameCabRight.Checked  then qryRelatGR_FRAME_CABECALHO.Value := qryRelatGR_FRAME_CABECALHO.Value + 'R';
    if chkFrameCabLeft.Checked   then qryRelatGR_FRAME_CABECALHO.Value := qryRelatGR_FRAME_CABECALHO.Value + 'L';

    if chkFrameGrupoTop.Checked    then qryRelatGR_FRAME_GRUPO.Value := qryRelatGR_FRAME_GRUPO.Value + 'T';
    if chkFrameGrupoBottom.Checked then qryRelatGR_FRAME_GRUPO.Value := qryRelatGR_FRAME_GRUPO.Value + 'B';
    if chkFrameGrupoRight.Checked  then qryRelatGR_FRAME_GRUPO.Value := qryRelatGR_FRAME_GRUPO.Value + 'R';
    if chkFrameGrupoLeft.Checked   then qryRelatGR_FRAME_GRUPO.Value := qryRelatGR_FRAME_GRUPO.Value + 'L';

    if chkFrameCamposTop.Checked    then qryRelatGR_FRAME_DETALHE.Value := qryRelatGR_FRAME_DETALHE.Value + 'T';
    if chkFrameCamposBottom.Checked then qryRelatGR_FRAME_DETALHE.Value := qryRelatGR_FRAME_DETALHE.Value + 'B';
    if chkFrameCamposRight.Checked  then qryRelatGR_FRAME_DETALHE.Value := qryRelatGR_FRAME_DETALHE.Value + 'R';
    if chkFrameCamposLeft.Checked   then qryRelatGR_FRAME_DETALHE.Value := qryRelatGR_FRAME_DETALHE.Value + 'L';

    if chkFrameResGrupoTop.Checked    then qryRelatGR_FRAME_RESGRUPO.Value := qryRelatGR_FRAME_RESGRUPO.Value + 'T';
    if chkFrameResGrupoBottom.Checked then qryRelatGR_FRAME_RESGRUPO.Value := qryRelatGR_FRAME_RESGRUPO.Value + 'B';
    if chkFrameResGrupoRight.Checked  then qryRelatGR_FRAME_RESGRUPO.Value := qryRelatGR_FRAME_RESGRUPO.Value + 'R';
    if chkFrameResGrupoLeft.Checked   then qryRelatGR_FRAME_RESGRUPO.Value := qryRelatGR_FRAME_RESGRUPO.Value + 'L';

    if chkFrameResumoTop.Checked    then qryRelatGR_FRAME_RESUMO.Value := qryRelatGR_FRAME_RESUMO.Value + 'T';
    if chkFrameResumoBottom.Checked then qryRelatGR_FRAME_RESUMO.Value := qryRelatGR_FRAME_RESUMO.Value + 'B';
    if chkFrameResumoRight.Checked  then qryRelatGR_FRAME_RESUMO.Value := qryRelatGR_FRAME_RESUMO.Value + 'R';
    if chkFrameResumoLeft.Checked   then qryRelatGR_FRAME_RESUMO.Value := qryRelatGR_FRAME_RESUMO.Value + 'L';
    //fim dos frames das bandas

    //Obtencao dos dados dos titulos:
    if TPanel(Components[cont]).Tag = 6 then
    begin
      qryRelatGR_TIT_NOME.Value := '';
      qryRelatGR_TIT_FONT_NOME.Value := TPanel(Components[cont]).Font.Name;
      qryRelatGR_TIT_FONT_TAM.Value := TPanel(Components[cont]).Font.Size;
      qryRelatGR_TIT_FONT_COR.AsInteger := TPanel(Components[cont]).Font.Color;
      qryRelatGR_TIT_FONT_ESTILO.Value := EstiloFonteToString(TPanel(Components[cont]).Font.Style);
      if TPanel(Components[cont]).Alignment = taCenter then
        qryRelatGR_TIT_ALIGN.Value := 'C';
      if TPanel(Components[cont]).Alignment = taLeftJustify then
        qryRelatGR_TIT_ALIGN.Value := 'L';
      if TPanel(Components[cont]).Alignment = taRightJustify then
        qryRelatGR_TIT_ALIGN.Value := 'R';
      qryRelatGR_TIT_LEFT.Value := TPanel(Components[cont]).Left;
      qryRelatGR_TIT_CAPTION.Value := TPanel(Components[cont]).Caption;
      if TPanel(Components[cont]).Top < linhaDivisaoC.Top then
      begin
        qryRelatGR_TIT_BANDA.Value := 'CABECALHO';
        qryRelatGR_TIT_TOP.Value := TPanel(Components[cont]).Top + vCorrigeTopObj;
      end;
      if linhaDivisaoGrupo.Visible then
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoC.Top) and (TPanel(Components[cont]).Top < linhaDivisaoGrupo.Top)then
        begin
          qryRelatGR_TIT_BANDA.Value := 'GRUPO';
          qryRelatGR_TIT_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoGrupo.Top) and (TPanel(Components[cont]).Top < linhaDivisaoD.Top)then
        begin
          qryRelatGR_TIT_BANDA.Value := 'DETALHE';
          qryRelatGR_TIT_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoGrupo.Top + vCorrigeTopObj;
        end;
      end
      else
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoC.Top) and (TPanel(Components[cont]).Top < linhaDivisaoD.Top)then
        begin
          qryRelatGR_TIT_BANDA.Value := 'DETALHE';
          qryRelatGR_TIT_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          qryRelatGR_TIT_BANDA.Value := 'RESUMO';
          qryRelatGR_TIT_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
      end;
      if linhaDivisaoResGrupo.Visible then
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResGrupo.Top)then
        begin
          qryRelatGR_TIT_BANDA.Value := 'RESGRUPO';
          qryRelatGR_TIT_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoResGrupo.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          qryRelatGR_TIT_BANDA.Value := 'RESUMO';
          qryRelatGR_TIT_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoResGrupo.Top + vCorrigeTopObj;
        end;
      end
      else
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          qryRelatGR_TIT_BANDA.Value := 'RESUMO';
          qryRelatGR_TIT_TOP.Value:= TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
      end;
    end;

    //Obtencao dos dados dos campos:
    if TPanel(Components[cont]).Tag = 5 then
    begin
      qryRelatGR_CAMPO_NOME.Value := TPanel(Components[cont]).Name;
      qryRelatGR_CAMPO_FONT_NOME.Value := TPanel(Components[cont]).Font.Name;
      qryRelatGR_CAMPO_FONT_TAM.Value := TPanel(Components[cont]).Font.Size;
      qryRelatGR_CAMPO_FONT_COR.AsInteger := TPanel(Components[cont]).Font.Color;
      qryRelatGR_CAMPO_FONT_ESTILO.Value := EstiloFonteToString(TPanel(Components[cont]).Font.Style);
      qryRelatGR_CAMPO_TAMANHO.Value := TPanel(Components[cont]).Width;
      if Pos('&MSK:', TPanel(Components[cont]).Hint) <> 0 then
       qryRelatGR_CAMPO_MASK.Value := copy(TPanel(Components[cont]).Hint, Pos('&MSK:', TPanel(Components[cont]).Hint)+5, 10);
      if TPanel(Components[cont]).Alignment = taCenter then
        qryRelatGR_CAMPO_ALIGN.Value := 'C';
      if TPanel(Components[cont]).Alignment = taLeftJustify then
        qryRelatGR_CAMPO_ALIGN.Value := 'L';
      if TPanel(Components[cont]).Alignment = taRightJustify then
        qryRelatGR_CAMPO_ALIGN.Value := 'R';
      qryRelatGR_CAMPO_LEFT.Value := TPanel(Components[cont]).Left;
      qryRelatGR_CAMPO_CAMPO.Value := copy(TPanel(Components[cont]).Name, 1, Pos('__', TPanel(Components[cont]).Name)-1);
      qryRelatGR_CAMPO_TABELA.Value := copy(TPanel(Components[cont]).Name, Pos('__', TPanel(Components[cont]).Name)+2, 30);
      if TPanel(Components[cont]).Top < linhaDivisaoC.Top then
      begin
        qryRelatGR_CAMPO_BANDA.Value := 'CABECALHO';
        qryRelatGR_CAMPO_TOP.Value := TPanel(Components[cont]).Top + vCorrigeTopObj;
      end;
      if linhaDivisaoGrupo.Visible then
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoC.Top) and (TPanel(Components[cont]).Top < linhaDivisaoGrupo.Top)then
        begin
          qryRelatGR_CAMPO_BANDA.Value := 'GRUPO';
          qryRelatGR_CAMPO_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoGrupo.Top) and (TPanel(Components[cont]).Top < linhaDivisaoD.Top)then
        begin
          qryRelatGR_CAMPO_BANDA.Value := 'DETALHE';
          qryRelatGR_CAMPO_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoGrupo.Top + vCorrigeTopObj;
        end;
      end
      else
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoC.Top) and (TPanel(Components[cont]).Top < linhaDivisaoD.Top)then
        begin
          qryRelatGR_CAMPO_BANDA.Value := 'DETALHE';
          qryRelatGR_CAMPO_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          qryRelatGR_CAMPO_BANDA.Value := 'RESUMO';
          qryRelatGR_CAMPO_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
      end;
      if linhaDivisaoResGrupo.Visible then
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResGrupo.Top)then
        begin
          qryRelatGR_CAMPO_BANDA.Value := 'RESGRUPO';
          qryRelatGR_CAMPO_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoResGrupo.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          qryRelatGR_CAMPO_BANDA.Value := 'RESUMO';
          qryRelatGR_CAMPO_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoResGrupo.Top + vCorrigeTopObj;
        end;
      end
      else
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          qryRelatGR_CAMPO_BANDA.Value := 'RESUMO';
          qryRelatGR_CAMPO_TOP.Value:= TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
      end;
    end;

    //Obtencao dos dados das expressoes:
    if TPanel(Components[cont]).Tag = 10 then
    begin
      qryRelatGR_EXPR_NOME.Value := '';
      qryRelatGR_EXPR_FONT_NOME.Value := TPanel(Components[cont]).Font.Name;
      qryRelatGR_EXPR_FONT_TAM.Value := TPanel(Components[cont]).Font.Size;
      qryRelatGR_EXPR_FONT_COR.AsInteger := TPanel(Components[cont]).Font.Color;
      qryRelatGR_EXPR_FONT_ESTILO.Value := EstiloFonteToString(TPanel(Components[cont]).Font.Style);
      qryRelatGR_EXPR_LEFT.Value := TPanel(Components[cont]).Left;
      qryRelatGR_EXPR_EXPRESSAO.Value := TPanel(Components[cont]).Caption;
      qryRelatGR_EXPR_TAMANHO.Value := TPanel(Components[cont]).Width;
      if Pos('M', TPanel(Components[cont]).Hint) <> 0 then
        qryRelatGR_EXPR_MASK.Value := copy(TPanel(Components[cont]).Hint, 2, Pos('Reseta',TPanel(Components[cont]).Hint)-2);

      if TPanel(Components[cont]).Alignment = taCenter then
        qryRelatGR_EXPR_ALIGN.Value := 'C';
      if TPanel(Components[cont]).Alignment = taLeftJustify then
        qryRelatGR_EXPR_ALIGN.Value := 'L';
      if TPanel(Components[cont]).Alignment = taRightJustify then
        qryRelatGR_EXPR_ALIGN.Value := 'R';
      if TPanel(Components[cont]).Top < linhaDivisaoC.Top then
      begin
        qryRelatGR_EXPR_BANDA.Value := 'CABECALHO';
        qryRelatGR_EXPR_TOP.Value := TPanel(Components[cont]).Top + vCorrigeTopObj;
      end;
      if linhaDivisaoGrupo.Visible then
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoC.Top) and (TPanel(Components[cont]).Top < linhaDivisaoGrupo.Top)then
        begin
          qryRelatGR_EXPR_BANDA.Value := 'GRUPO';
          qryRelatGR_EXPR_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoGrupo.Top) and (TPanel(Components[cont]).Top < linhaDivisaoD.Top)then
        begin
          qryRelatGR_EXPR_BANDA.Value := 'DETALHE';
          qryRelatGR_EXPR_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoGrupo.Top + vCorrigeTopObj;
        end;
      end
      else
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoC.Top) and (TPanel(Components[cont]).Top < linhaDivisaoD.Top)then
        begin
          qryRelatGR_EXPR_BANDA.Value := 'DETALHE';
          qryRelatGR_EXPR_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          qryRelatGR_EXPR_BANDA.Value := 'RESUMO';
          qryRelatGR_EXPR_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
      end;
      if linhaDivisaoResGrupo.Visible then
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResGrupo.Top)then
        begin
          qryRelatGR_EXPR_BANDA.Value := 'RESGRUPO';
          qryRelatGR_EXPR_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoResGrupo.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          qryRelatGR_EXPR_BANDA.Value := 'RESUMO';
          qryRelatGR_EXPR_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoResGrupo.Top + vCorrigeTopObj;
        end;
      end
      else
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          qryRelatGR_EXPR_BANDA.Value := 'RESUMO';
          qryRelatGR_EXPR_TOP.Value:= TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
      end;
    end;

    //Obtencao dos dados das macros:
    if TPanel(Components[cont]).Tag = 7 then
    begin
      qryRelatGR_MACRO_FONT_NOME.Value := TPanel(Components[cont]).Font.Name;
      qryRelatGR_MACRO_FONT_TAM.Value := TPanel(Components[cont]).Font.Size;
      qryRelatGR_MACRO_FONT_COR.AsInteger := TPanel(Components[cont]).Font.Color;
      qryRelatGR_MACRO_FONT_ESTILO.Value := EstiloFonteToString(TPanel(Components[cont]).Font.Style);
      qryRelatGR_MACRO_LEFT.Value := TPanel(Components[cont]).Left;
      if TPanel(Components[cont]).Name = 'pnHoraAtual' then qryRelatGR_MACRO_MACRO.Value := 'Hora';
      if TPanel(Components[cont]).Name = 'pnDataAtual' then qryRelatGR_MACRO_MACRO.Value := 'Data';
      if TPanel(Components[cont]).Name = 'pnNumPagina' then qryRelatGR_MACRO_MACRO.Value := 'NumPagina';

      if TPanel(Components[cont]).Top < linhaDivisaoC.Top then
      begin
        qryRelatGR_MACRO_BANDA.Value := 'CABECALHO';
        qryRelatGR_MACRO_TOP.Value := TPanel(Components[cont]).Top + vCorrigeTopObj;
      end;
      if linhaDivisaoGrupo.Visible then
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoC.Top) and (TPanel(Components[cont]).Top < linhaDivisaoGrupo.Top)then
        begin
          qryRelatGR_MACRO_BANDA.Value := 'GRUPO';
          qryRelatGR_MACRO_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoGrupo.Top) and (TPanel(Components[cont]).Top < linhaDivisaoD.Top)then
        begin
          qryRelatGR_MACRO_BANDA.Value := 'DETALHE';
          qryRelatGR_MACRO_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoGrupo.Top + vCorrigeTopObj;
        end;
      end
      else
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoC.Top) and (TPanel(Components[cont]).Top < linhaDivisaoD.Top)then
        begin
          qryRelatGR_MACRO_BANDA.Value := 'DETALHE';
          qryRelatGR_MACRO_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          qryRelatGR_MACRO_BANDA.Value := 'RESUMO';
          qryRelatGR_MACRO_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
      end;
      if linhaDivisaoResGrupo.Visible then
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResGrupo.Top)then
        begin
          qryRelatGR_MACRO_BANDA.Value := 'RESGRUPO';
          qryRelatGR_MACRO_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoResGrupo.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          qryRelatGR_MACRO_BANDA.Value := 'RESUMO';
          qryRelatGR_MACRO_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoResGrupo.Top + vCorrigeTopObj;
        end;
      end
      else
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          qryRelatGR_MACRO_BANDA.Value := 'RESUMO';
          qryRelatGR_MACRO_TOP.Value:= TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
      end;
    end;

    //Obtencao dos dados das linhas
    if TPanel(Components[cont]).Tag = 8 then
    begin
      qryRelatGR_LINHA_NOME.Value := '';
      if TPanel(Components[cont]).Width = 3 then
      begin
        qryRelatGR_LINHA_TIPO.Value := 'V';
        qryRelatGR_LINHA_TAMANHO.Value := TPanel(Components[cont]).Height;
      end
      else
      begin
        qryRelatGR_LINHA_TIPO.Value := 'H';
        qryRelatGR_LINHA_TAMANHO.Value := TPanel(Components[cont]).Width;
      end;
      qryRelatGR_LINHA_LEFT.Value := TPanel(Components[cont]).Left;
       if TPanel(Components[cont]).Top < linhaDivisaoC.Top then
      begin
        qryRelatGR_LINHA_BANDA.Value := 'CABECALHO';
        qryRelatGR_LINHA_TOP.Value := TPanel(Components[cont]).Top + vCorrigeTopObj;
      end;
      if linhaDivisaoGrupo.Visible then
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoC.Top) and (TPanel(Components[cont]).Top < linhaDivisaoGrupo.Top)then
        begin
          qryRelatGR_LINHA_BANDA.Value := 'GRUPO';
          qryRelatGR_LINHA_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoGrupo.Top) and (TPanel(Components[cont]).Top < linhaDivisaoD.Top)then
        begin
          qryRelatGR_LINHA_BANDA.Value := 'DETALHE';
          qryRelatGR_LINHA_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoGrupo.Top + vCorrigeTopObj;
        end;
      end
      else
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoC.Top) and (TPanel(Components[cont]).Top < linhaDivisaoD.Top)then
        begin
          qryRelatGR_LINHA_BANDA.Value := 'DETALHE';
          qryRelatGR_LINHA_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          qryRelatGR_LINHA_BANDA.Value := 'RESUMO';
          qryRelatGR_LINHA_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
      end;
      if linhaDivisaoResGrupo.Visible then
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResGrupo.Top)then
        begin
          qryRelatGR_LINHA_BANDA.Value := 'RESGRUPO';
          qryRelatGR_LINHA_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
        if (TPanel(Components[cont]).Top > linhaDivisaoResGrupo.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          qryRelatGR_LINHA_BANDA.Value := 'RESUMO';
          qryRelatGR_LINHA_TOP.Value := TPanel(Components[cont]).Top - linhaDivisaoResGrupo.Top + vCorrigeTopObj;
        end;
      end
      else
      begin
        if (TPanel(Components[cont]).Top > linhaDivisaoD.Top) and (TPanel(Components[cont]).Top < linhaDivisaoResumo.Top)then
        begin
          qryRelatGR_LINHA_BANDA.Value := 'RESUMO';
          qryRelatGR_LINHA_TOP.Value:= TPanel(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
        end;
      end;
    end;
    qryRelat.Post;
  end; //END do FOR principal

  //Insercao das figuras:
  for cont := ComponentCount - 1 downto 0 do
  if (Components[cont] is TImage) then
  if (TImage(Components[cont]).Tag = 11) then
  begin
    qryRelat.Insert;
    qryRelatGR_CODIGO.Value := vSequencia;
    qryRelatGR_IDENTIFICACAO.Value := edNomeRelat.Text;
    qryRelatGR_DATA_CRIACAO.AsString := edDataCriacaoRelat.Text;
    qryRelatGR_USUARIO.Value := fmDireitos.mOperador;
    qryRelatGR_CRIADOR.Value := edCriador.Text;
    qryRelatGR_TEXTOSQL.Value := Memo2.Lines.Text;
    qryRelatGR_BNDHEADER_TAM.Value := qrTitulo.Height;
    qryRelatGR_BNDDETAIL_TAM.Value := qrDetalhe.Height;
    qryRelatGR_BNDSUMARY_TAM.Value := qrResumo.Height;
    qryRelatGR_BNDGROUPHEADER_TAM.Value := qrGrupo.Height;
    if chkBandaGrupo.Checked then qryRelatGR_BNDGROUPHEADER_EXISTE.Value := 'S'
    else qryRelatGR_BNDGROUPHEADER_EXISTE.Value := 'N';
    qryRelatGR_BNDGROUPHEADER_CAMPO.Value := copy(cbCampoGrupo.Text, 1, Pos('__', cbCampoGrupo.Text) - 1);
    if chkResumoGrupo.Checked then qryRelatGR_BNDGROUPFOOTER_EXISTE.Value := 'S'
    else qryRelatGR_BNDGROUPFOOTER_EXISTE.Value := 'N';
    qryRelatGR_BNDGROUPFOOTER_TAM.Value := qrResGrupo.Height;

    qryRelatGR_FIG_NOME.Value := '';
    qryRelatGR_FIG_LEFT.Value := TImage(Components[cont]).Left;

    qryRelFig.Open;
  	qryRelFig.Insert;
  	vStream := TFileStream.Create(TImage(Components[cont]).Hint, fmOpenRead);
    try
    	qryRelFigGER_FIG.LoadFromStream(vstream);
      qryRelatGR_FIG_FIGURA.Value := qryRelFigGER_FIG.Value;
      qryRelFigGER_COD.AsString := IntToStr(vSequencia);
      qryRelFig.Post;
    finally
     	vStream.Free;
    end;

    qryRelatGR_FIG_HEIGHT.Value := TImage(Components[cont]).Height;
    qryRelatGR_FIG_WIDTH.Value := TImage(Components[cont]).Width;
    if TImage(Components[cont]).Top < linhaDivisaoC.Top then
    begin
      qryRelatGR_FIG_BANDA.Value := 'CABECALHO';
      qryRelatGR_FIG_TOP.Value := TImage(Components[cont]).Top + vCorrigeTopObj;
    end;
    if linhaDivisaoGrupo.Visible then
    begin
      if (TImage(Components[cont]).Top > linhaDivisaoC.Top) and (TImage(Components[cont]).Top < linhaDivisaoGrupo.Top)then
      begin
        qryRelatGR_FIG_BANDA.Value := 'GRUPO';
        qryRelatGR_FIG_TOP.Value := TImage(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
      end;
      if (TImage(Components[cont]).Top > linhaDivisaoGrupo.Top) and (TImage(Components[cont]).Top < linhaDivisaoD.Top)then
      begin
        qryRelatGR_FIG_BANDA.Value := 'DETALHE';
        qryRelatGR_FIG_TOP.Value := TImage(Components[cont]).Top - linhaDivisaoGrupo.Top + vCorrigeTopObj;
      end;
    end
    else
    begin
      if (TImage(Components[cont]).Top > linhaDivisaoC.Top) and (TImage(Components[cont]).Top < linhaDivisaoD.Top)then
      begin
        qryRelatGR_FIG_BANDA.Value := 'DETALHE';
        qryRelatGR_FIG_TOP.Value := TImage(Components[cont]).Top - linhaDivisaoC.Top + vCorrigeTopObj;
      end;
      if (TImage(Components[cont]).Top > linhaDivisaoD.Top) and (TImage(Components[cont]).Top < linhaDivisaoResumo.Top)then
      begin
        qryRelatGR_FIG_BANDA.Value := 'RESUMO';
        qryRelatGR_FIG_TOP.Value := TImage(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
      end;
    end;
    if linhaDivisaoResGrupo.Visible then
    begin
      if (TImage(Components[cont]).Top > linhaDivisaoD.Top) and (TImage(Components[cont]).Top < linhaDivisaoResGrupo.Top)then
      begin
        qryRelatGR_FIG_BANDA.Value := 'RESGRUPO';
        qryRelatGR_FIG_TOP.Value := TImage(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
      end;
      if (TImage(Components[cont]).Top > linhaDivisaoResGrupo.Top) and (TImage(Components[cont]).Top < linhaDivisaoResumo.Top)then
      begin
        qryRelatGR_FIG_BANDA.Value := 'RESUMO';
        qryRelatGR_FIG_TOP.Value := TImage(Components[cont]).Top - linhaDivisaoResGrupo.Top + vCorrigeTopObj;
      end;
    end
    else
    begin
      if (TImage(Components[cont]).Top > linhaDivisaoD.Top) and (TImage(Components[cont]).Top < linhaDivisaoResumo.Top)then
      begin
        qryRelatGR_FIG_BANDA.Value := 'RESUMO';
        qryRelatGR_FIG_TOP.Value:= TImage(Components[cont]).Top - linhaDivisaoD.Top + vCorrigeTopObj;
      end;
    end;
    qryRelat.Post;
  end;

  qryFiltro.Open;
  for cont := 0 to gridFiltro.RowCount - 1 do
  begin
    if gridFiltro.Cells[0,cont] <> '' then
    begin
      qryFiltro.Insert;
      qryFiltroGRF_CODIGO.Value := qryRelatGR_CODIGO.Value;
      qryFiltroGRF_CONDICAO.Value := gridFiltroX.Cells[0,cont];
      qryFiltroGRF_CAMPO.Value    := gridFiltroX.Cells[1,cont];
      qryFiltroGRF_OPERADOR.Value := gridFiltro.Cells[2,cont];
      qryFiltroGRF_TITULO.Value   := gridFiltro.Cells[3,cont];
      qryFiltroGRF_TAMANHO.AsString := gridFiltro.Cells[4,cont];
      qryFiltroGRF_TIPO.Value := gridFiltro.Cells[5,cont];
      qryFiltro.Post;
    end;
  end;

  pnSalvaRelat.Visible := False;
end;

procedure TfrmGeraRelatorios.Marcar1Click(Sender: TObject);
var
  cont : integer;
begin
  if TPanel(popAlinha.PopupComponent).Color = constCorPrimaria then Exit;

  for cont := ComponentCount - 1 downto 0 do
    if Components[cont] is TPanel then
      if TPanel(Components[cont]).Color = constCorPrimaria then
        TPanel(popAlinha.PopupComponent).Color := constCorSecundaria;

  if TPanel(popAlinha.PopupComponent).Color = clWhite then
    TPanel(popAlinha.PopupComponent).Color := constCorPrimaria;
end;

procedure TfrmGeraRelatorios.Desmarcar1Click(Sender: TObject);
var
  cont : integer;
begin
  if TPanel(popAlinha.PopupComponent).Color = constCorPrimaria then
  begin
    if Pergunta('Este é o componente chave do alinhamento. Se você desmarcá-lo, todos os outros componentes serão desmarcados! Continua?') = 'N' then
      Exit
      else
  		begin
  			for cont := ComponentCount - 1 downto 0 do
    			if Components[cont] is TPanel then
      			if TPanel(Components[cont]).Color = constCorSecundaria then
        			TPanel(Components[cont]).Color := clWhite;
  		end;
  end;
  TPanel(popAlinha.PopupComponent).Color := clWhite;
end;

procedure TfrmGeraRelatorios.Alinharhorizontalmente1Click(Sender: TObject);
var
  cont, vAltura : integer;
begin
  for cont := ComponentCount - 1 downto 0 do
    if Components[cont] is TPanel then
      if TPanel(Components[cont]).Color = constCorPrimaria then
      begin
        vAltura := TPanel(Components[cont]).Top;
        TPanel(Components[cont]).Color := clWhite;
      end;
  for cont := ComponentCount - 1 downto 0 do
    if Components[cont] is TPanel then
      if TPanel(Components[cont]).Color = constCorSecundaria then
      begin
        TPanel(Components[cont]).Top := vAltura;
        TPanel(Components[cont]).Color := clWhite;
      end;
end;

procedure TfrmGeraRelatorios.Alinharverticalmente1Click(Sender: TObject);
var
  cont, vEsquerda : integer;
begin
  for cont := ComponentCount - 1 downto 0 do
    if Components[cont] is TPanel then
      if TPanel(Components[cont]).Color = constCorPrimaria then
      begin
        vEsquerda := TPanel(Components[cont]).Left;
        TPanel(Components[cont]).Color := clWhite;
      end;
  for cont := ComponentCount - 1 downto 0 do
    if Components[cont] is TPanel then
      if TPanel(Components[cont]).Color = constCorSecundaria then
      begin
        TPanel(Components[cont]).Left := vEsquerda;
        TPanel(Components[cont]).Color := clWhite;
      end;
end;

procedure TfrmGeraRelatorios.SpeedButton25Click(Sender: TObject);
begin
  popAlinha2.Popup(SpeedButton25.Left+20, SpeedButton25.Top+150);
end;

procedure TfrmGeraRelatorios.SpeedButton22Click(Sender: TObject);
var
  cont, contAux : integer;
  vAuxCampos, vAuxTabelas : string;
begin
  pnCamposFiltragem.Visible := True;
  pnCamposFiltragem.Top := 104;
  pnCamposFiltragem.Left := 3;
  pnCamposFiltragem.BringToFront;
  gridFiltro.ColWidths[0] := 40;
  gridFiltro.ColWidths[1] := 200;
  gridFiltro.ColWidths[2] := 30;
  gridFiltro.ColWidths[3] := 181;
  gridFiltroX.ColWidths[0] := 40;
  gridFiltroX.ColWidths[1] := 200;
  gridFiltroX.ColWidths[2] := 30;
  gridFiltroX.ColWidths[3] := 186;

  cbTabelasFiltro.Items.Clear;
  for cont := 0 to listaTabelasEscolhidas.Items.Count - 1 do
    cbTabelasFiltro.Items.Add(listaTabelasEscolhidas.Items.Strings[cont] + ' T' + IntToStr(cont+1));

  cbTabelasFiltroX.Items.Clear;
  for cont := 0 to listaTabelasEscolhidasX.Items.Count - 1 do
    cbTabelasFiltroX.Items.Add(listaTabelasEscolhidasX.Items.Strings[cont] + ' T' + IntToStr(cont+1));
end;

procedure TfrmGeraRelatorios.Button1Click(Sender: TObject);
var
  cont : integer;
begin
  for cont := 0 to 10 do
  if gridFiltro.Cells[0,cont] = '' then
  begin
    gridFiltro.Cells[0,cont] := 'E';
    gridFiltroX.Cells[0,cont] := 'AND';
    Break;
  end;
end;

procedure TfrmGeraRelatorios.Button2Click(Sender: TObject);
var
  cont : integer;
begin
  for cont := 0 to 10 do
  if gridFiltro.Cells[0,cont] = '' then
  begin
    gridFiltro.Cells[0,cont] := 'OU';
    gridFiltroX.Cells[0,cont] := 'OR';
    Break;
  end;
end;

procedure TfrmGeraRelatorios.btInsereOperadoresClick(Sender: TObject);
var
  cont : integer;
begin
  for cont := 0 to 10 do
  if gridFiltro.Cells[2,cont] = '' then
  begin
    gridFiltro.Cells[2,cont] := TButton(Sender).Caption;
    gridFiltroX.Cells[2,cont] := TButton(Sender).Caption;
    Break;
  end;
end;

procedure TfrmGeraRelatorios.SpeedButton21Click(Sender: TObject);
begin
  pnCamposFiltragem.Visible := False;
end;

procedure TfrmGeraRelatorios.BitBtn6Click(Sender: TObject);
begin
  gridFiltro.Cells[0, gridFiltro.Row] := '';
  gridFiltro.Cells[1, gridFiltro.Row] := '';
  gridFiltro.Cells[2, gridFiltro.Row] := '';
  gridFiltro.Cells[3, gridFiltro.Row] := '';
  gridFiltroX.Cells[0, gridFiltro.Row] := '';
  gridFiltroX.Cells[1, gridFiltro.Row] := '';
  gridFiltroX.Cells[2, gridFiltro.Row] := '';
  gridFiltroX.Cells[3, gridFiltro.Row] := '';
end;

procedure TfrmGeraRelatorios.TrackBar2Change(Sender: TObject);
begin
  if NOT(TPanel(CompAtivo).Tag = 8) then Exit;
  if TPanel(CompAtivo).Height = 3 then
  begin
    TPanel(CompAtivo).Width := TrackBar2.Position;
    lTamLinha.Caption := 'Tamanho da linha: ' + IntToStr(TrackBar2.Position) + ' (' + FormatFloat('###,##0.00', TrackBar2.Position/30.15) + 'cm)';
    if TPanel(CompAtivo).Width + TPanel(CompAtivo).Left > 660 then
      TrackBar2.Position := TrackBar1.Position - 5;
    if TrackBar2.Position < 20 then
      TrackBar2.Position := 20;
  end;
  if TPanel(CompAtivo).Width = 3 then
  begin
    TPanel(CompAtivo).Height := TrackBar2.Position;
    lTamLinha.Caption := 'Tamanho da linha: ' + IntToStr(TrackBar2.Position) + ' (' + FormatFloat('###,##0.00', TrackBar2.Position/30.15) + 'cm)';
    if TPanel(CompAtivo).Height + TPanel(CompAtivo).Left > 660 then
      TrackBar2.Position := TrackBar1.Position - 5;
    if TrackBar2.Position < 20 then
      TrackBar2.Position := 20;
  end;
end;

procedure TfrmGeraRelatorios.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then gridFiltro.SetFocus;
end;

procedure TfrmGeraRelatorios.SpeedButton28Click(Sender: TObject);
begin
  TabSheet2.Enabled := True;
  pnTabelas.Left := -500;
  listaTabelas.Items := listaTabelasEscolhidas.Items;
  listaTabelasX.Items := listaTabelasEscolhidasX.Items;
  cbTabelasFiltro.Items := listaTabelasEscolhidas.Items;
  cbTabelasFiltroX.Items := listaTabelasEscolhidasX.Items;
end;

procedure TfrmGeraRelatorios.BitBtn3Click(Sender: TObject);
var
	cont : integer;
begin
  for cont := 0 to listaTabelasEscolhidas.Items.Count - 1 do
    if listaTabelasEscolhidas.Items.Strings[cont] = listaTabelasDisp.Items.Strings[listaTabelasDisp.ItemIndex] then
    begin
      Mensagem('Esta tabela já foi escolhida!');
      Exit;
    end;
  listaTabelasEscolhidas.Items.Add(listaTabelasDisp.Items.Strings[listaTabelasDisp.ItemIndex]);
  listaTabelasEscolhidasX.Items.Add(listaTabelasDispX.Items.Strings[listaTabelasDisp.ItemIndex]);
end;

procedure TfrmGeraRelatorios.cbTabelasFiltroChange(Sender: TObject);
begin
  ExecutaSQL('select GRT_DESC_CAMPO, GRT_CAMPO, GRT_TAMANHO, GRT_TIPO from GERADOR_RELATORIO_TABELAS where GRT_DESC_TABELA = ' + QuotedStr(copy(cbTabelasFiltro.Items.Strings[cbTabelasFiltro.ItemIndex], 1, Length(cbTabelasFiltro.Items.Strings[cbTabelasFiltro.ItemIndex])-3)), qryTabelasCampos);
  listaFiltragem.Items.Clear;
  listaFiltragemX.Items.Clear;
  listaFiltragemTam.Items.Clear;
  listaFiltragemTipo.Items.Clear;
  qryTabelasCampos.First;
  while NOT qryTabelasCampos.EOF do
  begin
    listaFiltragem.Items.Add(qryTabelasCampos.FieldByName('GRT_DESC_CAMPO').AsString);
    listaFiltragemX.Items.Add(qryTabelasCampos.FieldByName('GRT_CAMPO').AsString);
    listaFiltragemTam.Items.Add(qryTabelasCampos.FieldByName('GRT_TAMANHO').AsString);
    listaFiltragemTipo.Items.Add(qryTabelasCampos.FieldByName('GRT_TIPO').AsString);
    qryTabelasCampos.Next;
  end;
end;

procedure TfrmGeraRelatorios.QuickRep1Preview(Sender: TObject);
begin
  FormPreview := TFormPreview.Create(Application);
  FormPreview.QRPreview1.QRPrinter := TQRPrinter(Sender);
  FormPreview.Show;
end;

procedure TfrmGeraRelatorios.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmGeraRelatorios.BitBtn9Click(Sender: TObject);
var
  cont : integer;
begin
  for cont := 0 to 10 do
  if gridFiltro.Cells[3,cont] = '' then
  begin
    gridFiltro.Cells[3,cont] := Edit1.Text;
    gridFiltroX.Cells[3,cont] := Edit1.Text;
    Edit1.Text := '';
    Break;
  end;
end;


procedure TfrmGeraRelatorios.BitBtn8Click(Sender: TObject);
var
	vAuxTextoSQL1, vAuxTextoSQL2 : string;
begin
  if Pergunta('A ordenação deve ser o último passo da filtragem. Você ainda quer inserir mais algum filtro?') = 'S' then
  	Exit;
  vAuxTextoSQL1 := Memo1.Text;
  vAuxTextoSQL2 := Memo2.Text;
  if Pos('order by ', Memo2.Text) <> 0 then
  begin
    if Pergunta('Já existe ordenação no código de consulta SQL. Substituir?') = 'N' then
    else
    begin
      Delete(vAuxTextoSQL1, Pos('ordenado por', Memo1.Text), 30);
      Memo1.Text := vAuxTextoSQL1;
      Delete(vAuxTextoSQL2, Pos('order by', Memo2.Text), 30);
      Memo2.Text := vAuxTextoSQL2;
    	Memo1.Lines.Add('ordenado por ' + comboCampos.Items.Strings[comboCampos.ItemIndex]);
			Memo2.Lines.Add('order by ' + comboCamposX.Items.Strings[comboCampos.ItemIndex]);
  	end;
  end
  else
  begin
    Memo1.Lines.Add('ordenado por ' + comboCampos.Items.Strings[comboCampos.ItemIndex]);
		Memo2.Lines.Add('order by ' + comboCamposX.Items.Strings[comboCampos.ItemIndex]);
  end;
end;

procedure TfrmGeraRelatorios.SpeedButton1Click(Sender: TObject);
begin
	Close;
end;

procedure TfrmGeraRelatorios.ListView1SelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
	ListView1.Hint := Item.Caption;
end;

procedure TfrmGeraRelatorios.ListView1DblClick(Sender: TObject);
var
	vLCampo : TPanel;
begin
	Mensagem('Em construcao...');
  Exit;
  with qryPegaRelatorio do
  begin
    CLose;
    SQL.CLear;
    SQL.Add('select * from GERADOR_RELATORIOS');
    SQL.Add('where GR_IDENTIFICACAO = ' + QuotedStr(ListView1.Selected.Caption));
    Open;
  end;
  qryPegaRelatorio.First;
  linhaDivisaoC.Top := qryPegaRelatorioGR_BNDHEADER_TAM.Value;
  if qryPegaRelatorioGR_BNDGROUPHEADER_EXISTE.Value = 'S' then
  begin
    linhaDivisaoGrupo.Visible := True; lGrupo.Visible := True;
    linhaDivisaoGrupo.Top := qryPegaRelatorioGR_BNDGROUPHEADER_TAM.Value + qryPegaRelatorioGR_BNDHEADER_TAM.Value;
    linhaDivisaoD.Top := qryPegaRelatorioGR_BNDGROUPHEADER_TAM.Value + qryPegaRelatorioGR_BNDHEADER_TAM.Value + qryPegaRelatorioGR_BNDDETAIL_TAM.Value;
    if qryPegaRelatorioGR_BNDGROUPFOOTER_EXISTE.Value = 'S' then
    begin
      linhaDivisaoResGrupo.Visible := True;  lResGrupo.Visible := True;
    	linhaDivisaoResGrupo.Top := linhaDivisaoD.Top + qryPegaRelatorioGR_BNDGROUPFOOTER_TAM.Value;
      linhaDivisaoResumo.Top := linhaDivisaoResGrupo.Top + qryPegaRelatorioGR_BNDSUMARY_TAM.Value;
    end
    else
    begin
      linhaDivisaoResGrupo.Visible := False; lResGrupo.Visible := False;
      linhaDivisaoResumo.Top := linhaDivisaoD.Top + qryPegaRelatorioGR_BNDSUMARY_TAM.Value;
    end;
  end
  else
  begin
    linhaDivisaoGrupo.Visible := False; lGrupo.Visible := False;
  	linhaDivisaoD.Top := qryPegaRelatorioGR_BNDDETAIL_TAM.Value + qryPegaRelatorioGR_BNDHEADER_TAM.Value;
    linhaDivisaoResumo.Top := linhaDivisaoD.Top + qryPegaRelatorioGR_BNDSUMARY_TAM.Value;
  end;
  lCabecalho.Top := linhaDivisaoC.Top - 14;
  lCampos.Top := linhaDivisaoD.Top - 14;
  lResumo.Top := linhaDivisaoResumo.Top - 14;
  lGrupo.Top := linhaDivisaoGrupo.Top - 14;
  lResGrupo.Top := linhaDivisaoResGrupo.Top - 14;
  //qrGrupo.Expression := 'qryDados.' + qryAuxGR_BNDGROUPHEADER_CAMPO.Value;

  while NOT qryPegaRelatorio.EOF do
  begin
    //campos
    if qryPegaRelatorioGR_CAMPO_BANDA.Value <> '' then
    begin
      vLCampo := TPanel.Create(self);
      vLCampo.Name := qryPegaRelatorioGR_CAMPO_NOME.Value;
      vLCampo.Caption := qryPegaRelatorioGR_CAMPO_CAMPO.Value;
      vLCampo.AutoSize := False;
      vLCampo.Width := qryPegaRelatorioGR_CAMPO_TAMANHO.Value;
      vLCampo.Height := 18;
      //vLCampo.Mask := qryPegaRelatorioGR_CAMPO_MASK.Value;
      vLCampo.Font.Name := qryPegaRelatorioGR_CAMPO_FONT_NOME.Value;
      vLCampo.Font.Size := qryPegaRelatorioGR_CAMPO_FONT_TAM.Value;
      vLCampo.Font.Color := qryPegaRelatorioGR_CAMPO_FONT_COR.AsInteger;
      vLCampo.Font.Style := StringToEstiloFonte(qryPegaRelatorioGR_CAMPO_FONT_ESTILO.Value);
      vLCampo.Left := qryPegaRelatorioGR_CAMPO_LEFT.Value;
      if qryPegaRelatorioGR_CAMPO_ALIGN.Value = 'L' then vLCampo.Alignment := taLeftJustify;
      if qryPegaRelatorioGR_CAMPO_ALIGN.Value = 'R' then vLCampo.Alignment := taRightJustify;
      if qryPegaRelatorioGR_CAMPO_ALIGN.Value = 'C' then vLCampo.Alignment := taCenter;
      if qryPegaRelatorioGR_CAMPO_BANDA.Value = 'CABECALHO' then vLCampo.Top := qryPegaRelatorioGR_CAMPO_TOP.Value;
      if qryPegaRelatorioGR_CAMPO_BANDA.Value = 'DETALHE'   then vLCampo.Top := qryPegaRelatorioGR_CAMPO_TOP.Value + linhaDivisaoD.Top;
      if qryPegaRelatorioGR_CAMPO_BANDA.Value = 'GRUPO'     then vLCampo.Top := qryPegaRelatorioGR_CAMPO_TOP.Value + linhaDivisaoGrupo.Top;
      if qryPegaRelatorioGR_CAMPO_BANDA.Value = 'RESGRUPO'  then vLCampo.Top := qryPegaRelatorioGR_CAMPO_TOP.Value + linhaDivisaoResGrupo.Top;
      if qryPegaRelatorioGR_CAMPO_BANDA.Value = 'RESUMO'    then vLCampo.Top := qryPegaRelatorioGR_CAMPO_TOP.Value + linhaDivisaoResumo.Top;
      vLCampo.ShowHint := True;
  		vLCampo.Tag := 5; //PARA IDENTIFICAR QUE E UM PAINEL RELATIVO A CAMPO
  		vLCampo.OnDblClick := pnChamaTamCampo.OnDblClick;
  		vLCampo.OnMouseMove := Panel1.OnMouseMove;
  		vLCampo.OnMouseDown := Panel1.OnMouseDown;
  		vLCampo.OnMouseUp := Panel1.OnMouseUp;
  		vLCampo.Parent := Panel1.Parent;
  		vLCampo.BringToFront;
  		vLCampo.PopupMenu := popAlinha;
  		vLCampo.ParentFont := False;
    end;
    //
    qryPegaRelatorio.Next;
  end;
  TabSheet2.Enabled := True;
  pnTabelas.Visible := False;
end;

procedure TfrmGeraRelatorios.BitBtn7Click(Sender: TObject);
begin
  listaTabelasEscolhidasX.Items.Delete(listaTabelasEscolhidas.ItemIndex);
  listaTabelasEscolhidas.Items.Delete(listaTabelasEscolhidas.ItemIndex);
end;

procedure TfrmGeraRelatorios.SpeedButton24Click(Sender: TObject);
var
	cont : integer;
begin
  pnFiltragemOutrosCampos.Visible := True;
  pnFiltragemOutrosCampos.Left := pnFiltragem.Left + 385;
  pnFiltragemOutrosCampos.Top  := 19;
  pnFiltragemOutrosCampos.BringToFront;

  cbTabelasFiltragem.Items.Clear;
  for cont := 0 to listaTabelasEscolhidas.Items.Count - 1 do
    cbTabelasFiltragem.Items.Add(listaTabelasEscolhidas.Items.Strings[cont] + ' T' + IntToStr(cont+1));
  cbTabelasFiltragemX.Items.Clear;
  for cont := 0 to listaTabelasEscolhidasX.Items.Count - 1 do
    cbTabelasFiltragemX.Items.Add(listaTabelasEscolhidasX.Items.Strings[cont] + ' T' + IntToStr(cont+1));
end;

procedure TfrmGeraRelatorios.BitBtn10Click(Sender: TObject);
begin
  if listaFiltro.ItemIndex = -1 then
  begin
  	Mensagem('Não há campo selecionado!');
    Exit;
  end;
  Memo1.Text := Memo1.Text + ' ' + listaFiltro.Items.Strings[listaFiltro.ItemIndex] + ' ';
  Memo2.Text := Memo2.Text + ' ' + listaFiltroX.Items.Strings[listaFiltro.ItemIndex] + ' ';
end;

procedure TfrmGeraRelatorios.BitBtn11Click(Sender: TObject);
var
	vAuxTextoSQL1, vAuxTextoSQL2 : string;
begin
  if Pergunta('A ordenação deve ser o último passo da filtragem. Você ainda quer inserir mais algum filtro?') = 'S' then
  	Exit;
  if listaFiltro.ItemIndex = -1 then
  begin
  	Mensagem('Não há campo selecionado!');
    Exit;
  end;
  vAuxTextoSQL1 := Memo1.Text;
  vAuxTextoSQL2 := Memo2.Text;
  if Pos('order by ', Memo2.Text) <> 0 then
  begin
    if Pergunta('Já existe ordenação no código de consulta SQL. Substituir?') = 'N' then
    else
    begin
      Delete(vAuxTextoSQL1, Pos('ordenado por', Memo1.Text), 30);
      Memo1.Text := vAuxTextoSQL1;
      Delete(vAuxTextoSQL2, Pos('order by', Memo2.Text), 30);
      Memo2.Text := vAuxTextoSQL2;
    	Memo1.Lines.Add('ordenado por ' + listaFiltro.Items.Strings[listaFiltro.ItemIndex]);
			Memo2.Lines.Add('order by ' + listaFiltroX.Items.Strings[listaFiltro.ItemIndex]);
  	end;
  end
  else
  begin
    Memo1.Lines.Add('ordenado por ' + listaFiltro.Items.Strings[listaFiltro.ItemIndex]);
		Memo2.Lines.Add('order by ' + listaFiltroX.Items.Strings[listaFiltro.ItemIndex]);
  end;
end;

procedure TfrmGeraRelatorios.cbTabelasFiltragemChange(Sender: TObject);
begin
  ExecutaSQL('select GRT_DESC_CAMPO, GRT_CAMPO, GRT_TAMANHO, GRT_TIPO from GERADOR_RELATORIO_TABELAS where GRT_DESC_TABELA = ' + QuotedStr(copy(cbTabelasFiltragem.Items.Strings[cbTabelasFiltragem.ItemIndex], 1, Length(cbTabelasFiltragem.Items.Strings[cbTabelasFiltragem.ItemIndex])-3)), qryTabelasCampos);
  listaFiltro.Items.Clear;
  listaFiltroX.Items.Clear;
  qryTabelasCampos.First;
  while NOT qryTabelasCampos.EOF do
  begin
    listaFiltro.Items.Add(copy(cbTabelasFiltragem.Items.Strings[cbTabelasFiltragem.ItemIndex], Pos(' T', cbTabelasFiltragem.Items.Strings[cbTabelasFiltragem.ItemIndex])+1, 3) + '.' + qryTabelasCampos.FieldByName('GRT_DESC_CAMPO').AsString);
    listaFiltroX.Items.Add(copy(cbTabelasFiltragemX.Items.Strings[cbTabelasFiltragem.ItemIndex], Pos(' T', cbTabelasFiltragemX.Items.Strings[cbTabelasFiltragem.ItemIndex])+1, 3) + '.' + qryTabelasCampos.FieldByName('GRT_CAMPO').AsString);
    qryTabelasCampos.Next;
  end;
end;

procedure TfrmGeraRelatorios.SpeedButton29Click(Sender: TObject);
begin
	pnFiltragemOutrosCampos.Visible := False;
end;

procedure TfrmGeraRelatorios.listaCamposClick(Sender: TObject);
begin
	if listaCamposTipo.Items.Strings[listaCampos.ItemIndex] = 'F' then
  	cbCampoMascara.ItemIndex := 1;
  if listaCamposTipo.Items.Strings[listaCampos.ItemIndex] = 'D' then
  	cbCampoMascara.ItemIndex := 2;
  if listaCamposTipo.Items.Strings[listaCampos.ItemIndex] = '' then
  	cbCampoMascara.ItemIndex := 0;
end;

procedure TfrmGeraRelatorios.QuickRep1AfterPreview(Sender: TObject);
var
	cont : integer;
begin
	for cont := ComponentCount - 1 downto 0 do
    if (Components[cont] is TQRLabel) then
      if TQRLabel(Components[cont]).Tag <> 20 then
        TQRLabel(Components[cont]).Free;

end;

procedure TfrmGeraRelatorios.edTituloChange(Sender: TObject);
begin
	if CompAtivo is TPanel then
  begin
    TPanel(CompAtivo).Caption := edTitulo.Text;
    AjeitaTamanhoTitulos();
  end;
end;

procedure TfrmGeraRelatorios.CheckBox1Click(Sender: TObject);
begin
	if CheckBox1.Checked then
  begin
  	Memo2.ReadOnly := False;
    Memo2.Top := Memo1.Top;
    Memo2.BringToFront;
    Memo2.Height := 2*Memo1.Height;
  end;
end;

procedure TfrmGeraRelatorios.SpeedButton30Click(Sender: TObject);
var
	vStream : TFileStream;
begin
  qryRelFig.Open;
  qryRelFig.Insert;
  vStream := TFileStream.Create('c:\cap5.bmp', fmOpenRead);
    try
    	qryRelFigGER_FIG.LoadFromStream(vstream);
      qryRelFigGER_COD.AsString := '44';
      qryRelFig.post;
    finally
     	vStream.Free;
    end;

  if pnHelp.Visible then
  begin
  	pnHelp.Visible := False;
    Exit;
  end;
	pnHelp.Visible := True;
  memoTextoHelp.Lines.Clear;
  memoTextoHelp.Lines.LoadFromFile('GERELHLP1.TXT');
  Label35.Caption := memoTextoHelp.Lines.Strings[0];
  Label36.Caption := memoTextoHelp.Lines.Strings[1];
end;

procedure TfrmGeraRelatorios.bHelpAvancaClick(Sender: TObject);
begin
  if not bHelpRecua.Enabled then
  	vLinhaHelp := 0;
  bHelpRecua.Enabled := True;
  vLinhaHelp := vLinhaHelp + 2;
  Label35.Caption := memoTextoHelp.Lines.Strings[vLinhaHelp];
  Label36.Caption := memoTextoHelp.Lines.Strings[vLinhaHelp+1];
end;

procedure TfrmGeraRelatorios.bHelpRecuaClick(Sender: TObject);
begin
  bHelpRecua.Enabled := True;
  if vLinhaHelp <> 0 then
  	vLinhaHelp := vLinhaHelp - 2
  else
    bHelpRecua.Enabled := False;
  if vLinhaHelp = 0 then
  begin
  	Label35.Caption := memoTextoHelp.Lines.Strings[0];
  	Label36.Caption := memoTextoHelp.Lines.Strings[1];
  end
  else
  begin
  	Label35.Caption := memoTextoHelp.Lines.Strings[vLinhaHelp];
  	Label36.Caption := memoTextoHelp.Lines.Strings[vLinhaHelp+1];
  end;
end;

procedure TfrmGeraRelatorios.qryFiltroAfterPost(DataSet: TDataSet);
begin
  if qryFiltro.UpdateStatus = usInserted then updFiltro.Apply(ukInsert);
  if qryFiltro.UpdateStatus = usModified then updFiltro.Apply(ukModify);
end;

procedure TfrmGeraRelatorios.qryRelFigAfterPost(DataSet: TDataSet);
begin
  if qryRelFig.UpdateStatus = usInserted then updRelFig.Apply(ukInsert);
  if qryRelFig.UpdateStatus = usModified then updRelFig.Apply(ukModify);
end;

procedure TfrmGeraRelatorios.qryRelatAfterPost(DataSet: TDataSet);
begin
  if qryRelat.UpdateStatus = usInserted then updRelat.Apply(ukInsert);
  if qryRelat.UpdateStatus = usModified then updRelat.Apply(ukModify);
end;

end.

{ CABECALHO
  DETALHE
  GRUPO
  RESGRUPO
  RESUMO}

