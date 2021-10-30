object frmAtoCofis15: TfrmAtoCofis15
  Left = 257
  Top = 224
  Width = 739
  Height = 478
  BorderStyle = bsSizeToolWin
  Caption = 'Informa'#231#245'es Fiscais COFIS n'#186' 15'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 12
    Top = 0
    Width = 314
    Height = 36
    Shape = bsBottomLine
  end
  object Label1: TLabel
    Left = 13
    Top = 56
    Width = 113
    Height = 13
    Caption = 'Per'#237'odo de informa'#231#245'es'
    FocusControl = DateEdit1
  end
  object RxLabel1: TRxLabel
    Left = 10
    Top = 5
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
    Left = 13
    Top = 153
    Width = 315
    Height = 25
    Shape = bsBottomLine
  end
  object DateEdit1: TDateEdit
    Left = 136
    Top = 50
    Width = 88
    Height = 21
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 0
  end
  object DateEdit2: TDateEdit
    Left = 240
    Top = 50
    Width = 89
    Height = 21
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 1
  end
  object cbMestreNf: TCheckBox
    Left = 13
    Top = 79
    Width = 236
    Height = 17
    Caption = 'Gerar arquivo mestre de nota fiscal'
    TabOrder = 2
    OnClick = cbMestreNfClick
  end
  object cgGerarItens: TCheckBox
    Left = 13
    Top = 97
    Width = 236
    Height = 17
    Caption = 'Gerar arquivo itens de nota fiscal'
    TabOrder = 4
  end
  object cbGerarPessoa: TCheckBox
    Left = 13
    Top = 115
    Width = 236
    Height = 17
    Caption = 'Gerar arquivo de pessoa Jur'#237'dica e F'#237'sica'
    TabOrder = 5
  end
  object cbGerarNatureza: TCheckBox
    Left = 13
    Top = 133
    Width = 236
    Height = 17
    Caption = 'Gerar arquivo natureza da opera'#231#227'o'
    TabOrder = 6
  end
  object cbGerarServProd: TCheckBox
    Left = 13
    Top = 151
    Width = 236
    Height = 17
    Caption = 'Gerar arquivo tabela de servi'#231'os/mercadoria'
    TabOrder = 7
  end
  object BitBtn2: TBitBtn
    Left = 166
    Top = 185
    Width = 78
    Height = 33
    Caption = '&Exportar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
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
    Left = 253
    Top = 185
    Width = 78
    Height = 33
    Caption = '&Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 9
    OnClick = BotaoSairClick
  end
  object ProgressBar1: TProgressBar
    Left = 13
    Top = 190
    Width = 88
    Height = 16
    TabOrder = 10
    Visible = False
  end
  object DirectoryEdit1: TDirectoryEdit
    Left = 344
    Top = 50
    Width = 57
    Height = 21
    DialogKind = dkWin32
    DirectInput = False
    NumGlyphs = 1
    TabOrder = 11
    Visible = False
  end
  object cbGerarSeparado: TCheckBox
    Left = 13
    Top = 330
    Width = 228
    Height = 17
    Caption = 'Gerar arquivos separadamente'
    Checked = True
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    State = cbChecked
    TabOrder = 12
    Visible = False
  end
  object ckOpExcelNf: TCheckBox
    Left = 229
    Top = 79
    Width = 100
    Height = 17
    Caption = 'Op. em excel'
    TabOrder = 3
    OnClick = ckOpExcelNfClick
  end
  object pnOperacaoCom: TPanel
    Left = 456
    Top = 59
    Width = 318
    Height = 191
    TabOrder = 13
    Visible = False
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
      Top = 19
      Width = 305
      Height = 137
      ItemHeight = 13
      TabOrder = 0
      OnExit = CheckListBoxPlanExit
    end
    object btnFecharPlan: TBitBtn
      Left = 140
      Top = 160
      Width = 75
      Height = 25
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnFecharPlanClick
      OnExit = btnFecharPlanExit
    end
    object CheckBoxPlan: TCheckBox
      Left = 7
      Top = 160
      Width = 104
      Height = 17
      Caption = 'Seleciona todos'
      TabOrder = 1
      OnClick = CheckBoxPlanClick
      OnExit = CheckBoxPlanExit
    end
  end
  object cdsNota: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'EMISSAO'
        DataType = ftDate
      end
      item
        Name = 'NUMERO'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'SERIE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ESPECIE'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CADASTRO'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftFloat
      end
      item
        Name = 'UNITARIO'
        DataType = ftFloat
      end
      item
        Name = 'IPI'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'ISS'
        DataType = ftFloat
      end
      item
        Name = 'CFOP'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'TIPI'
        DataType = ftString
        Size = 7
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
        Fields = 'NUMERO'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    StoreDefs = True
    Left = 280
    object cdsNotaEMISSAO: TDateField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'EMISSAO'
    end
    object cdsNotaNUMERO: TStringField
      DisplayLabel = 'Nota'
      FieldName = 'NUMERO'
      Size = 6
    end
    object cdsNotaSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Size = 1
    end
    object cdsNotaESPECIE: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'ESPECIE'
      Size = 2
    end
    object cdsNotaCADASTRO: TStringField
      DisplayLabel = 'CNPJ'
      FieldName = 'CADASTRO'
      Size = 14
    end
    object cdsNotaNOME: TStringField
      DisplayLabel = 'Raz'#227'o social'
      FieldName = 'NOME'
      Size = 60
    end
    object cdsNotaDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsNotaQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
    end
    object cdsNotaUNITARIO: TFloatField
      DisplayLabel = 'Unit'#225'rio'
      FieldName = 'UNITARIO'
    end
    object cdsNotaIPI: TFloatField
      DisplayLabel = 'Valor IPI'
      FieldName = 'IPI'
    end
    object cdsNotaVALOR: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR'
    end
    object cdsNotaISS: TFloatField
      DisplayLabel = 'Valor ISS'
      FieldName = 'ISS'
    end
    object cdsNotaCFOP: TStringField
      FieldName = 'CFOP'
      Size = 5
    end
    object cdsNotaTIPI: TStringField
      FieldName = 'TIPI'
      Size = 7
    end
  end
end
