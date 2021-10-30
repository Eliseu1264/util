object frmCopiaNFe: TfrmCopiaNFe
  Left = 130
  Top = 38
  ActiveControl = edtDe
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Copiar XML'#39'S das NFe'#39's para novo destino'
  ClientHeight = 455
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 24
    Top = 120
    Width = 489
    Height = 105
    Caption = ' Consulta '
    TabOrder = 1
    object Label3: TLabel
      Left = 144
      Top = 29
      Width = 28
      Height = 13
      Caption = 'Inicio:'
    end
    object Label4: TLabel
      Left = 320
      Top = 29
      Width = 25
      Height = 13
      Caption = 'Final:'
    end
    object lblQtd: TLabel
      Left = 312
      Top = 51
      Width = 16
      Height = 13
      Caption = '[0]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 176
      Top = 51
      Width = 128
      Height = 13
      Caption = 'Registros encontrados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object rgCampo: TRadioGroup
      Left = 16
      Top = 24
      Width = 121
      Height = 73
      Caption = ' Campo '
      ItemIndex = 0
      Items.Strings = (
        'N'#250'mero da Nota'
        'Emiss'#227'o')
      TabOrder = 0
    end
    object edtInicio: TEdit
      Left = 176
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 1
      OnChange = edtInicioChange
    end
    object edtFim: TEdit
      Left = 352
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 2
      OnChange = edtFimChange
      OnExit = edtFimExit
    end
    object BitBtn1: TBitBtn
      Left = 406
      Top = 76
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 3
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 328
      Top = 77
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = BitBtn2Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 24
    Top = 16
    Width = 489
    Height = 97
    Caption = ' Origem\ Destino '
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 17
      Height = 13
      Caption = 'De:'
    end
    object Label2: TLabel
      Left = 16
      Top = 64
      Width = 25
      Height = 13
      Caption = 'Para:'
    end
    object edtDe: TDirectoryEdit
      Left = 56
      Top = 24
      Width = 417
      Height = 21
      NumGlyphs = 1
      TabOrder = 0
    end
    object edtPara: TDirectoryEdit
      Left = 56
      Top = 57
      Width = 417
      Height = 21
      NumGlyphs = 1
      TabOrder = 1
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 250
    Width = 549
    Height = 205
    ActivePage = TabSheet1
    Align = alBottom
    TabOrder = 2
    TabPosition = tpBottom
    object TabSheet1: TTabSheet
      Caption = 'Notas Fiscais'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 541
        Height = 179
        Align = alClient
        DataSource = dtsNotas
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Resultado'
      ImageIndex = 1
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 541
        Height = 179
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 234
    Width = 549
    Height = 16
    Align = alBottom
    TabOrder = 3
  end
  object cdsNotas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 320
    Data = {
      A30000009619E0BD010000001800000005000000000003000000A3000A4E6F74
      6146697363616C0100490000000100055749445448020002000600064D696E75
      7461010049000000010005574944544802000200010005436861766501004900
      00000100055749445448020002002D0006537461747573010049000000010005
      5749445448020002000100054163686F75010049000000010005574944544802
      00020001000000}
    object cdsNotasNotaFiscal: TStringField
      FieldName = 'NotaFiscal'
      Size = 6
    end
    object cdsNotasMinuta: TStringField
      FieldName = 'Minuta'
      Size = 1
    end
    object cdsNotasChave: TStringField
      FieldName = 'Chave'
      Size = 45
    end
    object cdsNotasStatus: TStringField
      FieldName = 'Status'
      Size = 1
    end
    object cdsNotasAchou: TStringField
      FieldName = 'Achou'
      Size = 1
    end
  end
  object dtsNotas: TDataSource
    DataSet = cdsNotas
    Left = 264
    Top = 328
  end
end
