object frmExportaFiscal: TfrmExportaFiscal
  Left = 173
  Top = 185
  ActiveControl = DateEdit1
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Exportar Informa'#231#245'es Fiscais'
  ClientHeight = 347
  ClientWidth = 361
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
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 11
    Top = 36
    Width = 343
    Height = 3
    Shape = bsBottomLine
  end
  object RxLabel1: TRxLabel
    Left = 9
    Top = 8
    Width = 231
    Height = 27
    Caption = 'Exportar Informa'#231#245'es'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 12
    Top = 304
    Width = 342
    Height = 2
    Shape = bsBottomLine
  end
  object Label1: TLabel
    Left = 13
    Top = 51
    Width = 118
    Height = 13
    Caption = 'Per'#237'odo das informa'#231#245'es'
  end
  object Label3: TLabel
    Left = 31
    Top = 122
    Width = 77
    Height = 13
    Caption = 'Filtros adicionais'
  end
  object Label5: TLabel
    Left = 231
    Top = 50
    Width = 6
    Height = 13
    Caption = 'a'
  end
  object Bevel5: TBevel
    Left = 2
    Top = 96
    Width = 2
    Height = 70
  end
  object Bevel6: TBevel
    Left = 2
    Top = 129
    Width = 25
    Height = 2
  end
  object Bevel7: TBevel
    Left = 3
    Top = 96
    Width = 9
    Height = 2
  end
  object Bevel8: TBevel
    Left = 2
    Top = 113
    Width = 10
    Height = 2
  end
  object Label6: TLabel
    Left = 24
    Top = 122
    Width = 6
    Height = 13
    Caption = '>'
  end
  object Label7: TLabel
    Left = 31
    Top = 209
    Width = 77
    Height = 13
    Caption = 'Filtros adicionais'
  end
  object Label8: TLabel
    Left = 24
    Top = 208
    Width = 6
    Height = 13
    Caption = '>'
  end
  object Bevel3: TBevel
    Left = 2
    Top = 215
    Width = 25
    Height = 2
  end
  object Bevel9: TBevel
    Left = 2
    Top = 199
    Width = 2
    Height = 16
  end
  object Bevel10: TBevel
    Left = 2
    Top = 199
    Width = 10
    Height = 2
  end
  object Label10: TLabel
    Left = 32
    Top = 255
    Width = 230
    Height = 12
    Caption = '(Para o invent'#225'rio, n'#227'o precisa informar o periodo aqui)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label16: TLabel
    Left = 32
    Top = 159
    Width = 77
    Height = 13
    Caption = 'Modelo fatura....'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Bevel11: TBevel
    Left = 2
    Top = 165
    Width = 24
    Height = 2
  end
  object Label12: TLabel
    Left = 23
    Top = 158
    Width = 6
    Height = 13
    Caption = '>'
  end
  object BitBtn2: TBitBtn
    Left = 192
    Top = 310
    Width = 78
    Height = 25
    Caption = '&Exportar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = BitBtn2Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
      333333333333337FF3333333333333903333333333333377FF33333333333399
      03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
      99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
      99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
      03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
      33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
      33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
      3333777777333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object BotaoSair: TBitBtn
    Left = 274
    Top = 310
    Width = 78
    Height = 25
    Caption = '&Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 12
    OnClick = BotaoSairClick
  end
  object ProgressBar1: TProgressBar
    Left = 12
    Top = 315
    Width = 167
    Height = 16
    TabOrder = 13
    Visible = False
  end
  object cbExpCliente: TCheckBox
    Left = 13
    Top = 72
    Width = 316
    Height = 17
    Hint = 'Exportar clientes'
    TabStop = False
    Caption = 'Exportar dados de clientes -> [ CLIEINT.TXT ]'
    Checked = True
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 2
    OnClick = cbExpClienteClick
  end
  object CheckBoxExpNf: TCheckBox
    Left = 13
    Top = 89
    Width = 316
    Height = 17
    Hint = 'Exportar notas de servi'#231'o'
    TabStop = False
    Caption = 'Exportar notas de sa'#237'da-servi'#231'o -> [ SERVINT.TXT ]'
    Checked = True
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 3
    OnClick = cbExpClienteClick
  end
  object CheckBoxTipoSel: TCheckBox
    Left = 110
    Top = 122
    Width = 119
    Height = 17
    TabStop = False
    Caption = 'Tipo de faturamento'
    TabOrder = 5
    OnClick = CheckBoxTipoSelClick
  end
  object CheckBoxCFOPSel: TCheckBox
    Left = 110
    Top = 135
    Width = 119
    Height = 17
    TabStop = False
    Caption = 'CFOP'
    TabOrder = 8
    OnClick = CheckBoxCFOPSelClick
  end
  object pnCFOP: TPanel
    Left = 432
    Top = 235
    Width = 318
    Height = 214
    TabOrder = 15
    Visible = False
    DesignSize = (
      318
      214)
    object Label4: TLabel
      Left = 1
      Top = 1
      Width = 316
      Height = 13
      Align = alTop
      Caption = '  CFOP para envio Sa'#237'das'
      Color = 16737380
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object CheckListBoxCfop: TCheckListBox
      Left = 7
      Top = 25
      Width = 304
      Height = 152
      OnClickCheck = CheckListBoxCfopClickCheck
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 140
      Top = 183
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object CheckBoxCFOP: TCheckBox
      Left = 7
      Top = 183
      Width = 104
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Seleciona todos'
      TabOrder = 1
      OnClick = CheckBoxCFOPClick
    end
  end
  object DirectoryEdit1OLD: TDirectoryEdit
    Left = 290
    Top = 13
    Width = 57
    Height = 21
    DirectInput = False
    NumGlyphs = 1
    TabOrder = 16
    Visible = False
  end
  object DateEdit1: TDateEdit
    Left = 139
    Top = 46
    Width = 89
    Height = 21
    CheckOnExit = True
    NumGlyphs = 2
    TabOrder = 0
  end
  object DateEdit2: TDateEdit
    Left = 240
    Top = 45
    Width = 89
    Height = 21
    CheckOnExit = True
    ButtonWidth = 20
    NumGlyphs = 2
    StartOfWeek = Sun
    TabOrder = 1
  end
  object pnOperacaoCom: TPanel
    Left = 456
    Top = 19
    Width = 318
    Height = 214
    TabOrder = 14
    Visible = False
    DesignSize = (
      318
      214)
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 316
      Height = 13
      Align = alTop
      Caption = ' Op'#231#245'es de envio para planilha'
      Color = 16737380
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object CheckListBoxPlan: TCheckListBox
      Left = 7
      Top = 24
      Width = 305
      Height = 153
      OnClickCheck = CheckListBoxPlanClickCheck
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      TabOrder = 1
    end
    object btnFecharPlan: TBitBtn
      Left = 140
      Top = 183
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnFecharPlanClick
    end
    object CheckBoxPlan: TCheckBox
      Left = 7
      Top = 183
      Width = 104
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Seleciona todos'
      TabOrder = 0
      OnClick = CheckBoxPlanClick
    end
  end
  object CheckBoxExpNSaida: TCheckBox
    Left = 13
    Top = 106
    Width = 348
    Height = 17
    Hint = 'Exportar notas de produtos'
    TabStop = False
    Caption = 'Exportar notas de sa'#237'da-produto -> [ FISCALS.TXT,  ITEMINT.TXT ]'
    Checked = True
    State = cbChecked
    TabOrder = 4
    OnClick = cbExpClienteClick
  end
  object CheckBoxExpEnt: TCheckBox
    Left = 13
    Top = 191
    Width = 349
    Height = 17
    Hint = 'Fornecedores, Produtos e Entradas'
    TabStop = False
    Caption = 'Exportar entradas -> [ FORALM.TXT, PRODINT.TXT, FISCAL.TXT ]'
    Checked = True
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 9
    OnClick = cbExpClienteClick
  end
  object CheckBoxExpInv: TCheckBox
    Left = 13
    Top = 239
    Width = 204
    Height = 17
    Hint = 'Exportar invent'#225'rio'
    TabStop = False
    Caption = 'Exportar Invent'#225'rio -> [ INVEINT.TXT ]'
    Checked = True
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 10
    OnClick = CheckBoxExpInvClick
  end
  object CheckBoxCFOPSelEnt: TCheckBox
    Left = 110
    Top = 209
    Width = 119
    Height = 17
    TabStop = False
    Caption = 'CFOP'
    TabOrder = 17
    OnClick = CheckBoxCFOPSelEntClick
  end
  object pnCFOPEnt: TPanel
    Left = 352
    Top = 235
    Width = 318
    Height = 214
    TabOrder = 18
    Visible = False
    DesignSize = (
      318
      214)
    object Label9: TLabel
      Left = 1
      Top = 1
      Width = 316
      Height = 13
      Align = alTop
      Caption = '  CFOP para envio Entradas'
      Color = 16737380
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object CheckListBoxCfopEnt: TCheckListBox
      Left = 7
      Top = 25
      Width = 304
      Height = 152
      OnClickCheck = CheckListBoxCfopEntClickCheck
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      TabOrder = 0
    end
    object BitBtn3: TBitBtn
      Left = 140
      Top = 183
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object CheckBoxCFOPEnt: TCheckBox
      Left = 7
      Top = 183
      Width = 104
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Seleciona todos'
      TabOrder = 1
      OnClick = CheckBoxCFOPEntClick
    end
  end
  object Panel1: TPanel
    Left = 352
    Top = 123
    Width = 345
    Height = 214
    TabOrder = 19
    Visible = False
    DesignSize = (
      345
      214)
    object Label11: TLabel
      Left = 1
      Top = 1
      Width = 343
      Height = 13
      Align = alTop
      Caption = 'Demonstrativo dos dados gerados'
      Color = 16737380
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object BitBtn4: TBitBtn
      Left = 152
      Top = 183
      Width = 75
      Height = 23
      Anchors = [akLeft, akBottom]
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn4Click
    end
    object mDadosGer: TMemo
      Left = 8
      Top = 24
      Width = 328
      Height = 153
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      Lines.Strings = (
        '')
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 1
      WordWrap = False
    end
  end
  object cbModelo: TComboBox
    Left = 110
    Top = 151
    Width = 141
    Height = 21
    Style = csDropDownList
    DropDownCount = 12
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 6
    TabStop = False
    Text = 'Todos'
    Items.Strings = (
      'Todos'
      'Modelo 1'
      'Modelo 2'
      'Modelo 3'
      'Modelo 4'
      'Modelo 5'
      'Modelo 6'
      'Modelo 7'
      'Modelo 8'
      'Modelo 9')
  end
  object cbOper: TComboBox
    Left = 252
    Top = 151
    Width = 95
    Height = 21
    Style = csDropDownList
    DropDownCount = 12
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 7
    TabStop = False
    Text = 'Incluir modelo'
    Items.Strings = (
      'Incluir modelo'
      'Excluir modelo')
  end
  object QuickRep2: TQuickRep
    Left = 16
    Top = 576
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = cdsRel
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    object QRBand3: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 41
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        108.479166666666700000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRLabel2: TQRLabel
        Left = 8
        Top = 12
        Width = 705
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          21.166666666666670000
          31.750000000000000000
          1865.312500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'LISTAGEM DOS DADOS GERADOS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRShape2: TQRShape
        Left = 3
        Top = 37
        Width = 715
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          97.895833333333330000
          1891.770833333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 79
      Width = 718
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.270833333333330000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 4
        Top = 1
        Width = 711
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          2.645833333333333000
          1881.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = cdsRel
        DataField = 'PRD2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        FontSize = 9
      end
    end
  end
  object CheckBoxCTe: TCheckBox
    Left = 13
    Top = 273
    Width = 204
    Height = 17
    Hint = 'Exportar conhecimento de frete'
    TabStop = False
    Caption = 'Exportar CTe -> [ CONHINT.TXT ]'
    Checked = True
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 21
    OnClick = CheckBoxExpInvClick
  end
  object cdsCli: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'PRD'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 296
    Top = 200
    Data = {
      320000009619E0BD010000001800000001000000000003000000320003505244
      01004900000001000557494454480200020014000000}
    object cdsCliPRD: TStringField
      DisplayWidth = 20
      FieldName = 'PRD'
    end
  end
  object cdsRel: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'INDX'
        DataType = ftInteger
      end
      item
        Name = 'PRD2'
        DataType = ftString
        Size = 120
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'INDX'
    Params = <>
    StoreDefs = True
    Left = 256
    Top = 217
    Data = {
      400000009619E0BD010000001800000002000000000003000000400004494E44
      5804000100000000000450524432010049000000010005574944544802000200
      78000000}
    object cdsRelINDX: TIntegerField
      FieldName = 'INDX'
      KeyFields = 'INDX'
    end
    object cdsRelPRD2: TStringField
      DisplayWidth = 120
      FieldName = 'PRD2'
      Size = 120
    end
  end
  object DirectoryEdit1: TJvBrowseForFolderDialog
    Left = 248
    Top = 8
  end
end
