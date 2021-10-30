object frmFiltroRel: TfrmFiltroRel
  Left = 158
  Top = 82
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Filtragem'
  ClientHeight = 414
  ClientWidth = 469
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 15
    Top = 396
    Width = 444
    Height = 2
    Shape = bsTopLine
  end
  object Bevel1: TBevel
    Left = 15
    Top = 346
    Width = 444
    Height = 2
    Shape = bsTopLine
  end
  object lTitulo: TRxLabel
    Left = 15
    Top = 11
    Width = 119
    Height = 27
    Caption = 'Relat'#243'rios'
    Color = clSilver
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Bevel3: TBevel
    Left = 15
    Top = 39
    Width = 442
    Height = 2
    Shape = bsTopLine
  end
  object BotaoSair: TBitBtn
    Left = 369
    Top = 355
    Width = 90
    Height = 32
    Caption = '&Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BotaoSairClick
    Glyph.Data = {
      E6010000424DE60100000000000076000000280000001A000000170000000100
      0400000000007001000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F00000000000
      33333333330030000000F0000000000033333333308030000000FFFFFFFFFFF0
      3333333308803F000000FFFFFFFFFFF0A333333388803F000000FFFFFFFFFFF0
      AAAA333388803F000000FFFFFFFFFFF0AAAAAAA388803F000000FFFFFFFFFFF0
      222AAAA388803F000000FFFF00FFFFF022222AA388803F000000FFFF0A0FFFF0
      22222223F8803F000000F0000220FFF022222223F8803F000000F3A222220FF0
      11111113F8803F000000F3A2222220F0FFFF1113F8803F000000F3AAAA220FF0
      FFFFFF13F8803F000000F3333A20FFF0FFFFFFF3F8803F000000FFFF3A0FFFF0
      FFFFFFF3F8803F000000FFFF30FFFFF0EEEEEEE388803F000000FFFFFFFFFFF0
      EFFFFEE388803F000000FFFFFFFFFFF0EFFFEEE388803F000000FFFFFFFFFFF0
      FEEFEEE388803F000000FFFFFFFFFFF0FFEEEEEE38803F000000FFFFFFFFFFF0
      EEEEEEEEE3803F000000FFFFFFFFFFF0EEEEEEEEEE303F000000FFFFFFFFFFF0
      0000000000000F000000}
  end
  object Panel1: TPanel
    Left = 15
    Top = 356
    Width = 253
    Height = 32
    TabOrder = 0
    object Label4: TLabel
      Left = 5
      Top = 10
      Width = 52
      Height = 13
      Caption = 'Destino :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SaidaImp: TRadioButton
      Left = 60
      Top = 9
      Width = 73
      Height = 17
      Caption = 'Impressora'
      TabOrder = 0
    end
    object SaidaTela: TRadioButton
      Left = 138
      Top = 9
      Width = 45
      Height = 17
      Caption = 'Tela'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object SaidaHTML: TRadioButton
      Left = 188
      Top = 9
      Width = 56
      Height = 17
      Caption = 'HTML'
      TabOrder = 2
    end
  end
  object BitBtn2: TBitBtn
    Left = 276
    Top = 355
    Width = 90
    Height = 32
    Caption = '&Imprimir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn2Click
    Glyph.Data = {
      96010000424D9601000000000000760000002800000018000000180000000100
      0400000000002001000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF8888888888
      88888888FFFFF0000000000000000008FFFF07F7F7F7F7F7F7F7F7F08FFF0F0F
      7F7F7F7F7F7F70708FFF07F7F7F7F7888887F7F08FFF0F0F7F7F7F7F7F7F7070
      8FFF07F7F88888888887F7F08FFF0F0F7F7F7F7F7F7F70708FFF07F7F8888888
      8887F7F08FFF0F0F7F7F7F7F7F7F70708FFF07F7F88888888887F7F08FFF0F0F
      7F7F7F7F7F7F70708FFF07F7F78788888787F7F08FFF0F0F7F7F7F7F7F7F7070
      8FFF07F7F88888888887F7F08FFF0F0F7F7F7F7F7F7F707088FF07F7F88887F7
      F7F7F7F088FF0F0F7F7F7F7F7F7F7070088F07F7F7F7888887F7F7F070880F0F
      7F7F7F7F7F7F70707088F0F7F7F7F7F7F7F7F7F08708F0707F7F7F7F7F7F7F80
      8708FF07F7F7F7F7F7F7F7F0080FFFF0000000000000000000FF}
  end
  object QuickRep1: TQuickRep
    Left = -227
    Top = 419
    Width = 738
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    OnPreview = QuickRep1Preview
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Custom
    Page.Values = (
      100.000000000000000000
      2971.270833333330000000
      100.000000000000000000
      1952.625000000000000000
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
    object qrTitulo: TQRBand
      Left = 38
      Top = 38
      Width = 662
      Height = 44
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        116.416666666666700000
        1751.541666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object CompQRTitulo: TQRLabel
        Tag = 20
        Left = 17
        Top = 4
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.302083333333300000
          46.302083333333300000
          9.921875000000000000
          224.895833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CompQRTitulo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrDetalhe: TQRBand
      Left = 38
      Top = 104
      Width = 662
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        111.125000000000000000
        1751.541666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object CompQRCampo: TQRDBText
        Tag = 20
        Left = 13
        Top = 13
        Width = 95
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.302083333333300000
          33.072916666666700000
          33.072916666666700000
          251.354166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrGrupo: TQRGroup
      Left = 38
      Top = 82
      Width = 662
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333340000
        1751.541666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = qrResGrupo
      Master = QuickRep1
      ReprintOnNewPage = False
      object CompQRGrupo: TQRLabel
        Tag = 20
        Left = 13
        Top = 0
        Width = 89
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.302083333333300000
          33.072916666666700000
          0.000000000000000000
          234.817708333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CompQRGrupo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrResGrupo: TQRBand
      Left = 38
      Top = 146
      Width = 662
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333340000
        1751.541666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object CompQRResGrupo: TQRLabel
        Tag = 20
        Left = 13
        Top = 0
        Width = 112
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.302083333333300000
          33.072916666666700000
          0.000000000000000000
          297.656250000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CompQRResGrupo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrResumo: TQRBand
      Left = 38
      Top = 168
      Width = 662
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        100.541666666666700000
        1751.541666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object CompQRResumo: TQRLabel
        Tag = 20
        Left = 13
        Top = 8
        Width = 103
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.302083333333300000
          33.072916666666700000
          19.843750000000000000
          271.197916666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CompQRResumo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object listaSQL: TListBox
    Left = 477
    Top = 224
    Width = 193
    Height = 97
    ItemHeight = 13
    Sorted = True
    TabOrder = 4
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'htm'
    Filter = 'Formato html|*.htm'
    Title = 'Salvar relat'#243'rio em formato HTML'
    Left = 56
    Top = 296
  end
  object qryAux: TIBQuery
    Database = dm2.Database1
    Transaction = dm2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from GERADOR_RELATORIOS')
    Left = 24
    Top = 248
    object qryAuxGR_CODIGO: TIntegerField
      FieldName = 'GR_CODIGO'
    end
    object qryAuxGR_IDENTIFICACAO: TIBStringField
      FieldName = 'GR_IDENTIFICACAO'
    end
    object qryAuxGR_DATA_CRIACAO: TDateTimeField
      FieldName = 'GR_DATA_CRIACAO'
    end
    object qryAuxGR_TIT_NOME: TIBStringField
      FieldName = 'GR_TIT_NOME'
    end
    object qryAuxGR_TIT_BANDA: TIBStringField
      FieldName = 'GR_TIT_BANDA'
    end
    object qryAuxGR_TIT_FONT_NOME: TIBStringField
      FieldName = 'GR_TIT_FONT_NOME'
    end
    object qryAuxGR_TIT_FONT_TAM: TIntegerField
      FieldName = 'GR_TIT_FONT_TAM'
    end
    object qryAuxGR_TIT_FONT_COR: TIBStringField
      FieldName = 'GR_TIT_FONT_COR'
    end
    object qryAuxGR_TIT_FONT_ESTILO: TIBStringField
      FieldName = 'GR_TIT_FONT_ESTILO'
      Size = 30
    end
    object qryAuxGR_TIT_ALIGN: TIBStringField
      FieldName = 'GR_TIT_ALIGN'
      Size = 1
    end
    object qryAuxGR_TIT_TOP: TIntegerField
      FieldName = 'GR_TIT_TOP'
    end
    object qryAuxGR_TIT_LEFT: TIntegerField
      FieldName = 'GR_TIT_LEFT'
    end
    object qryAuxGR_TIT_CAPTION: TIBStringField
      FieldName = 'GR_TIT_CAPTION'
      Size = 50
    end
    object qryAuxGR_CAMPO_NOME: TIBStringField
      FieldName = 'GR_CAMPO_NOME'
    end
    object qryAuxGR_CAMPO_BANDA: TIBStringField
      FieldName = 'GR_CAMPO_BANDA'
    end
    object qryAuxGR_CAMPO_FONT_NOME: TIBStringField
      FieldName = 'GR_CAMPO_FONT_NOME'
    end
    object qryAuxGR_CAMPO_FONT_TAM: TIntegerField
      FieldName = 'GR_CAMPO_FONT_TAM'
    end
    object qryAuxGR_CAMPO_FONT_COR: TIBStringField
      FieldName = 'GR_CAMPO_FONT_COR'
    end
    object qryAuxGR_CAMPO_FONT_ESTILO: TIBStringField
      FieldName = 'GR_CAMPO_FONT_ESTILO'
      Size = 30
    end
    object qryAuxGR_CAMPO_ALIGN: TIBStringField
      FieldName = 'GR_CAMPO_ALIGN'
      Size = 1
    end
    object qryAuxGR_CAMPO_TOP: TIntegerField
      FieldName = 'GR_CAMPO_TOP'
    end
    object qryAuxGR_CAMPO_LEFT: TIntegerField
      FieldName = 'GR_CAMPO_LEFT'
    end
    object qryAuxGR_CAMPO_TAMANHO: TIntegerField
      FieldName = 'GR_CAMPO_TAMANHO'
    end
    object qryAuxGR_CAMPO_MASK: TIBStringField
      FieldName = 'GR_CAMPO_MASK'
    end
    object qryAuxGR_CAMPO_TABELA: TIBStringField
      FieldName = 'GR_CAMPO_TABELA'
      Size = 25
    end
    object qryAuxGR_CAMPO_CAMPO: TIBStringField
      FieldName = 'GR_CAMPO_CAMPO'
      Size = 25
    end
    object qryAuxGR_CAMPO_LKP_TBL: TIBStringField
      FieldName = 'GR_CAMPO_LKP_TBL'
      Size = 25
    end
    object qryAuxGR_CAMPO_LKP_KEY: TIBStringField
      FieldName = 'GR_CAMPO_LKP_KEY'
      Size = 25
    end
    object qryAuxGR_CAMPO_LKP_RESULT: TIBStringField
      FieldName = 'GR_CAMPO_LKP_RESULT'
      Size = 25
    end
    object qryAuxGR_LINHA_NOME: TIBStringField
      FieldName = 'GR_LINHA_NOME'
    end
    object qryAuxGR_LINHA_BANDA: TIBStringField
      FieldName = 'GR_LINHA_BANDA'
    end
    object qryAuxGR_LINHA_TOP: TIntegerField
      FieldName = 'GR_LINHA_TOP'
    end
    object qryAuxGR_LINHA_LEFT: TIntegerField
      FieldName = 'GR_LINHA_LEFT'
    end
    object qryAuxGR_LINHA_TAMANHO: TIntegerField
      FieldName = 'GR_LINHA_TAMANHO'
    end
    object qryAuxGR_LINHA_TIPO: TIBStringField
      FieldName = 'GR_LINHA_TIPO'
      Size = 1
    end
    object qryAuxGR_FIG_NOME: TIBStringField
      FieldName = 'GR_FIG_NOME'
    end
    object qryAuxGR_FIG_BANDA: TIBStringField
      FieldName = 'GR_FIG_BANDA'
    end
    object qryAuxGR_FIG_TOP: TIntegerField
      FieldName = 'GR_FIG_TOP'
    end
    object qryAuxGR_FIG_LEFT: TIntegerField
      FieldName = 'GR_FIG_LEFT'
    end
    object qryAuxGR_FIG_HEIGHT: TIntegerField
      FieldName = 'GR_FIG_HEIGHT'
    end
    object qryAuxGR_FIG_WIDTH: TIntegerField
      FieldName = 'GR_FIG_WIDTH'
    end
    object qryAuxGR_FIG_STRETCH: TIBStringField
      FieldName = 'GR_FIG_STRETCH'
      Size = 1
    end
    object qryAuxGR_FIG_AUTOSIZE: TIBStringField
      FieldName = 'GR_FIG_AUTOSIZE'
      Size = 1
    end
    object qryAuxGR_BNDHEADER_TAM: TIntegerField
      FieldName = 'GR_BNDHEADER_TAM'
    end
    object qryAuxGR_BNDDETAIL_TAM: TIntegerField
      FieldName = 'GR_BNDDETAIL_TAM'
    end
    object qryAuxGR_BNDSUMARY_TAM: TIntegerField
      FieldName = 'GR_BNDSUMARY_TAM'
    end
    object qryAuxGR_BNDGROUPHEADER_EXISTE: TIBStringField
      FieldName = 'GR_BNDGROUPHEADER_EXISTE'
      Size = 1
    end
    object qryAuxGR_BNDGROUPHEADER_CAMPO: TIBStringField
      FieldName = 'GR_BNDGROUPHEADER_CAMPO'
      Size = 25
    end
    object qryAuxGR_BNDGROUPHEADER_TAM: TIntegerField
      FieldName = 'GR_BNDGROUPHEADER_TAM'
    end
    object qryAuxGR_BNDGROUPFOOTER_EXISTE: TIBStringField
      FieldName = 'GR_BNDGROUPFOOTER_EXISTE'
      Size = 1
    end
    object qryAuxGR_BNDGROUPFOOTER_TAM: TIntegerField
      FieldName = 'GR_BNDGROUPFOOTER_TAM'
    end
    object qryAuxGR_EXPR_NOME: TIBStringField
      FieldName = 'GR_EXPR_NOME'
    end
    object qryAuxGR_EXPR_BANDA: TIBStringField
      FieldName = 'GR_EXPR_BANDA'
    end
    object qryAuxGR_EXPR_FONT_NOME: TIBStringField
      FieldName = 'GR_EXPR_FONT_NOME'
    end
    object qryAuxGR_EXPR_FONT_TAM: TIntegerField
      FieldName = 'GR_EXPR_FONT_TAM'
    end
    object qryAuxGR_EXPR_FONT_COR: TIBStringField
      FieldName = 'GR_EXPR_FONT_COR'
    end
    object qryAuxGR_EXPR_FONT_ESTILO: TIBStringField
      FieldName = 'GR_EXPR_FONT_ESTILO'
      Size = 30
    end
    object qryAuxGR_EXPR_TOP: TIntegerField
      FieldName = 'GR_EXPR_TOP'
    end
    object qryAuxGR_EXPR_LEFT: TIntegerField
      FieldName = 'GR_EXPR_LEFT'
    end
    object qryAuxGR_EXPR_MASK: TIBStringField
      FieldName = 'GR_EXPR_MASK'
    end
    object qryAuxGR_EXPR_EXPRESSAO: TIBStringField
      FieldName = 'GR_EXPR_EXPRESSAO'
      Size = 50
    end
    object qryAuxGR_EXPR_TAMANHO: TIntegerField
      FieldName = 'GR_EXPR_TAMANHO'
    end
    object qryAuxGR_MACRO_NOME: TIBStringField
      FieldName = 'GR_MACRO_NOME'
    end
    object qryAuxGR_EXPR_RESETA: TIBStringField
      FieldName = 'GR_EXPR_RESETA'
      Size = 1
    end
    object qryAuxGR_MACRO_BANDA: TIBStringField
      FieldName = 'GR_MACRO_BANDA'
    end
    object qryAuxGR_MACRO_FONT_NOME: TIBStringField
      FieldName = 'GR_MACRO_FONT_NOME'
    end
    object qryAuxGR_MACRO_FONT_TAM: TIntegerField
      FieldName = 'GR_MACRO_FONT_TAM'
    end
    object qryAuxGR_MACRO_FONT_COR: TIBStringField
      FieldName = 'GR_MACRO_FONT_COR'
    end
    object qryAuxGR_MACRO_FONT_ESTILO: TIBStringField
      FieldName = 'GR_MACRO_FONT_ESTILO'
      Size = 30
    end
    object qryAuxGR_MACRO_TOP: TIntegerField
      FieldName = 'GR_MACRO_TOP'
    end
    object qryAuxGR_MACRO_LEFT: TIntegerField
      FieldName = 'GR_MACRO_LEFT'
    end
    object qryAuxGR_MACRO_MACRO: TIBStringField
      FieldName = 'GR_MACRO_MACRO'
      Size = 40
    end
    object qryAuxGR_TEXTOSQL: TIBStringField
      FieldName = 'GR_TEXTOSQL'
      Size = 500
    end
    object qryAuxGR_USUARIO: TIBStringField
      FieldName = 'GR_USUARIO'
      Size = 40
    end
    object qryAuxGR_CRIADOR: TIBStringField
      FieldName = 'GR_CRIADOR'
      Size = 40
    end
    object qryAuxGR_EXPR_ALIGN: TIBStringField
      FieldName = 'GR_EXPR_ALIGN'
      Size = 1
    end
    object qryAuxGR_FRAME_CABECALHO: TIBStringField
      FieldName = 'GR_FRAME_CABECALHO'
      Size = 4
    end
    object qryAuxGR_FRAME_DETALHE: TIBStringField
      FieldName = 'GR_FRAME_DETALHE'
      Size = 4
    end
    object qryAuxGR_FRAME_GRUPO: TIBStringField
      FieldName = 'GR_FRAME_GRUPO'
      Size = 4
    end
    object qryAuxGR_FRAME_RESGRUPO: TIBStringField
      FieldName = 'GR_FRAME_RESGRUPO'
      Size = 4
    end
    object qryAuxGR_FRAME_RESUMO: TIBStringField
      FieldName = 'GR_FRAME_RESUMO'
      Size = 4
    end
    object qryAuxGR_FIG_FIGURA: TBlobField
      FieldName = 'GR_FIG_FIGURA'
      Size = 8
    end
  end
  object qryAux1: TIBQuery
    Database = dm2.Database1
    Transaction = dm2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 88
    Top = 248
  end
  object qryAuxFig: TIBQuery
    Database = dm2.Database1
    Transaction = dm2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from gerador_rel_fig')
    Left = 336
    Top = 72
    object qryAuxFigGER_FIG: TBlobField
      FieldName = 'GER_FIG'
      Size = 8
    end
    object qryAuxFigGER_COD: TIBStringField
      FieldName = 'GER_COD'
      Size = 10
    end
  end
  object qryDados: TIBQuery
    Database = dm2.Database1
    Transaction = dm2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 276
    Top = 74
  end
end
