object frmRotinas: TfrmRotinas
  Left = 192
  Top = 107
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Par'#226'metros para execu'#231#227'o de rotinas'
  ClientHeight = 319
  ClientWidth = 487
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 17
    Top = 42
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 55
    Top = 42
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 300
    Top = 42
    Width = 48
    Height = 13
    Caption = 'Execu'#231#227'o'
  end
  object Label4: TLabel
    Left = 17
    Top = 82
    Width = 76
    Height = 13
    Caption = 'Data executada'
    FocusControl = DBEdit4
  end
  object Bevel1: TBevel
    Left = 18
    Top = 124
    Width = 422
    Height = 3
    Shape = bsTopLine
  end
  object Bevel2: TBevel
    Left = 18
    Top = 35
    Width = 422
    Height = 3
    Shape = bsTopLine
  end
  object RxLabel1: TRxLabel
    Left = 16
    Top = 10
    Width = 123
    Height = 27
    Caption = 'Par'#226'metros'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Bevel3: TBevel
    Left = 18
    Top = 256
    Width = 422
    Height = 3
    Shape = bsTopLine
  end
  object Bevel5: TBevel
    Left = 322
    Top = 265
    Width = 3
    Height = 28
  end
  object DBEdit1: TDBEdit
    Left = 17
    Top = 57
    Width = 35
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'ROT_CODIGO'
    DataSource = dsDados
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 55
    Top = 57
    Width = 241
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'ROT_DESCRICAO'
    DataSource = dsDados
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit4: TDBEdit
    Left = 17
    Top = 97
    Width = 131
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'ROT_ULT_DATA'
    DataSource = dsDados
    ReadOnly = True
    TabOrder = 3
  end
  object RxDBComboBox1: TRxDBComboBox
    Left = 300
    Top = 57
    Width = 140
    Height = 21
    DataField = 'ROT_EXECUCAO'
    DataSource = dsDados
    ItemHeight = 13
    Items.Strings = (
      'N'#227'o executar'
      'Para todos usu'#225'rios'
      'Para usu'#225'rio determinado')
    TabOrder = 2
    Values.Strings = (
      '1'
      '2'
      '3')
  end
  object RxDBGrid1: TRxDBGrid
    Left = 18
    Top = 131
    Width = 422
    Height = 121
    Color = clInfoBk
    DataSource = dsDados
    FixedColor = clGray
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ROT_CODIGO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROT_DESCRICAO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 340
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 347
    Top = 90
    Width = 93
    Height = 29
    Caption = '&Usu'#225'rios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = Button1Click
  end
  object dbNavBtnCancel: TDBNavigationButton
    Left = 110
    Top = 263
    Width = 90
    Height = 30
    Hint = 'Cancelar a edi'#231#227'o atual'
    Caption = '&Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    NumGlyphs = 2
    DataButtonType = nbCancel
    DataSource = dsDados
    DisableReasons = [drNotEditing]
    RuntimeEnabled = True
  end
  object dbNavBtnSave: TDBNavigationButton
    Left = 17
    Top = 263
    Width = 90
    Height = 30
    Hint = 'Grava os dados no arquivo'
    Caption = '&Gravar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    NumGlyphs = 2
    DataButtonType = nbPost
    DataSource = dsDados
    DisableReasons = [drNotEditing]
    RuntimeEnabled = True
  end
  object dbNavBtnFirst1: TDBNavigationButton
    Left = 203
    Top = 263
    Width = 24
    Height = 30
    Hint = 'Primeiro registro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Glyph.Data = {
      3E050000424D3E0500000000000036000000280000001E0000000E0000000100
      18000000000008050000C40E0000C40E00000000000000000000BFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBFBFBFBF7F
      7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F
      BFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBF7F7F7F7F7F7FBFBFBF0000BFBFBFFFFFFF0000000000000000
      007F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000000000007F7F7FBFBFBFBF
      BFBFFFFFFFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      7F7F7FBFBFBF7F7F7FBFBFBF0000BFBFBFFFFFFF0000000000000000007F7F7F
      BFBFBFBFBFBFBFBFBFBFBFBF0000000000000000007F7F7FBFBFBFBFBFBFFFFF
      FFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBFBF
      BFBF7F7F7FBFBFBF0000BFBFBFFFFFFF0000000000000000007F7F7FBFBFBFBF
      BFBFBFBFBF0000000000000000000000007F7F7FBFBFBFBFBFBFFFFFFFBFBFBF
      BFBFBFBFBFBF7F7F7FBFBFBFBFBFBFBFBFBF7F7F7FBFBFBFBFBFBFBFBFBF7F7F
      7FBFBFBF0000BFBFBFFFFFFF0000000000000000007F7F7FBFBFBFBFBFBF0000
      000000000000000000000000007F7F7FBFBFBFBFBFBFFFFFFFBFBFBFBFBFBFBF
      BFBF7F7F7FBFBFBFBFBFBF7F7F7FBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBF
      0000BFBFBFFFFFFF0000000000000000007F7F7FBFBFBF000000000000000000
      0000000000000000007F7F7FBFBFBFBFBFBFFFFFFFBFBFBFBFBFBFBFBFBF7F7F
      7FBFBFBF7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBF0000BFBF
      BFFFFFFF0000000000000000007F7F7FFFFFFF00000000000000000000000000
      00000000007F7F7FBFBFBFBFBFBFFFFFFFBFBFBFBFBFBFBFBFBF7F7F7FFFFFFF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBF0000BFBFBFFFFFFF
      0000000000000000007F7F7FFFFFFFFFFFFF0000000000000000000000000000
      007F7F7FBFBFBFBFBFBFFFFFFFBFBFBFBFBFBFBFBFBF7F7F7FFFFFFFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBF0000BFBFBFFFFFFF00000000
      00000000007F7F7FBFBFBFFFFFFFFFFFFF0000000000000000000000007F7F7F
      BFBFBFBFBFBFFFFFFFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBFFFFFFFFFFFFFBFBF
      BFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBF0000BFBFBFFFFFFF0000000000000000
      007F7F7FBFBFBFBFBFBFFFFFFFFFFFFF0000000000000000007F7F7FBFBFBFBF
      BFBFFFFFFFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBFBFBFBFFFFFFFFFFFFFBFBFBF
      BFBFBFBFBFBF7F7F7FBFBFBF0000BFBFBFFFFFFF0000000000000000007F7F7F
      BFBFBFBFBFBFBFBFBFFFFFFFFFFFFF0000000000007F7F7FBFBFBFBFBFBFFFFF
      FFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFBFBFBFBF
      BFBF7F7F7FBFBFBF0000BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFF
      FFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFBFBF
      BFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      0000}
    NumGlyphs = 2
    ConfirmDelete = False
    DataButtonType = nbFirst
    DataSource = dsDados
    DisableReasons = [drBOF, drEditing, drEmpty]
    RuntimeEnabled = True
  end
  object dbNavBtnPrior: TDBNavigationButton
    Left = 227
    Top = 263
    Width = 24
    Height = 30
    Hint = 'Registro anterior'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    Glyph.Data = {
      76050000424D76050000000000003600000028000000200000000E0000000100
      18000000000040050000C40E0000C40E00000000000000000000BFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7FBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F
      7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBF0000000000007F7F7FBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F
      7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBF0000000000000000007F7F7FBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F
      7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBF0000000000000000000000007F7F7F7F7F7F7F7F7F7F7F7F7F7F
      7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F
      7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FBFBFBFBFBFBFBFBFBF
      BFBFBF0000000000000000000000000000000000000000000000000000000000
      000000000000007F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBFBFBFBFBFBFBF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000007F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBFBFBFBFFFFFFF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000007F7F7FFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBFBFBFBFFFFFFF
      FFFFFF0000000000000000000000000000000000000000000000000000000000
      000000000000007F7F7FFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBFBFBFBFBFBFBF
      FFFFFFFFFFFF000000000000000000000000BFBFBFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFBFBFBFBFBFBFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFFFFFFFFFFFFF0000000000000000007F7F7FBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBF7F
      7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFFFFFFFFFFFFF0000000000007F7F7FBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFBFBFBFBFBFBF7F
      7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF}
    NumGlyphs = 2
    ConfirmDelete = False
    DataButtonType = nbPrior
    DataSource = dsDados
    DisableReasons = [drBOF, drEditing, drEmpty]
    RuntimeEnabled = True
  end
  object dbNavBtnNext: TDBNavigationButton
    Left = 251
    Top = 263
    Width = 23
    Height = 30
    Hint = 'Pr'#243'ximo registro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    Glyph.Data = {
      56010000424D560100000000000076000000280000001F0000000E0000000100
      040000000000E000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777777777777777777077777778877777777777777887777770777777780077
      7777777777787777777077777778000777777777777877777770888888880000
      7777888888887777777080000000000007778777777777777770800000000000
      0077877777777777777080000000000000F787777777777777F0800000000000
      0FF787777777777777F07FFFFFF70000FF777FFFFFF77777FF7077777778000F
      F77777777778777FF7707777777800FF77777777777877FF777077777777FFF7
      777777777777FFF7777077777777777777777777777777777770}
    NumGlyphs = 2
    ConfirmDelete = False
    DataButtonType = nbNext
    DataSource = dsDados
    DisableReasons = [drEOF, drEditing, drEmpty]
    RuntimeEnabled = True
  end
  object dbNavBtnLast: TDBNavigationButton
    Left = 274
    Top = 263
    Width = 23
    Height = 30
    Hint = #218'ltimo registro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    Glyph.Data = {
      3E050000424D3E0500000000000036000000280000001E0000000E0000000100
      18000000000008050000C40E0000C40E00000000000000000000BFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000BFBFBFBFBFBF7F7F7F7F
      7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F7F7F7F7F7F7F7F7F7FBFBFBF
      BFBFBFBFBFBFBFBFBF7F7F7F7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BF7F7F7F7F7F7F7F7F7F7F7F7FBFBFBF0000BFBFBFFFFFFF0000000000007F7F
      7FBFBFBFBFBFBFBFBFBFFFFFFF0000000000000000007F7F7FBFBFBFBFBFBFBF
      BFBFFFFFFFBFBFBFBFBFBF7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFBFBFBF
      BFBFBFBFBFBF7F7F7FBFBFBF0000BFBFBFFFFFFF0000000000000000007F7F7F
      BFBFBFBFBFBFFFFFFF0000000000000000007F7F7FBFBFBFBFBFBFBFBFBFFFFF
      FFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBFBFBFBFBFBFBFFFFFFFBFBFBFBFBFBFBF
      BFBF7F7F7FBFBFBF0000BFBFBFFFFFFF0000000000000000000000007F7F7FBF
      BFBFFFFFFF0000000000000000007F7F7FBFBFBFBFBFBFBFBFBFFFFFFFBFBFBF
      BFBFBFBFBFBFBFBFBF7F7F7FBFBFBFBFBFBFFFFFFFBFBFBFBFBFBFBFBFBF7F7F
      7FBFBFBF0000BFBFBFFFFFFF0000000000000000000000000000007F7F7FFFFF
      FF0000000000000000007F7F7FBFBFBFBFBFBFBFBFBFFFFFFFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBF7F7F7FBFBFBFFFFFFFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBF
      0000BFBFBFFFFFFF0000000000000000000000000000000000007F7F7F000000
      0000000000007F7F7FBFBFBFBFBFBFBFBFBFFFFFFFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBF7F7F7FFFFFFFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBF0000BFBF
      BFFFFFFF000000000000000000000000000000000000FFFFFF00000000000000
      00007F7F7FBFBFBFBFBFBFBFBFBFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      7F7F7FBFBFBFFFFFFFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBF0000BFBFBFFFFFFF
      000000000000000000000000000000BFBFBFFFFFFF0000000000000000007F7F
      7FBFBFBFBFBFBFBFBFBFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBFBF
      BFBFFFFFFFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBF0000BFBFBFFFFFFF00000000
      0000000000000000BFBFBFBFBFBFFFFFFF0000000000000000007F7F7FBFBFBF
      BFBFBFBFBFBFFFFFFFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBFBFBFBFBFBFBFFFFF
      FFBFBFBFBFBFBFBFBFBF7F7F7FBFBFBF0000BFBFBFFFFFFF0000000000000000
      00BFBFBFBFBFBFBFBFBFFFFFFF0000000000000000007F7F7FBFBFBFBFBFBFBF
      BFBFFFFFFFBFBFBFBFBFBF7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFBFBFBF
      BFBFBFBFBFBF7F7F7FBFBFBF0000BFBFBFFFFFFF000000000000BFBFBFBFBFBF
      BFBFBFBFBFBFFFFFFF0000000000000000007F7F7FBFBFBFBFBFBFBFBFBFFFFF
      FFBFBFBF7F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFBFBFBFBFBFBFBF
      BFBF7F7F7FBFBFBF0000BFBFBFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFBFBF
      BFBFBFBF0000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
      0000}
    NumGlyphs = 2
    ConfirmDelete = False
    DataButtonType = nbLast
    DataSource = dsDados
    DisableReasons = [drEOF, drEditing, drEmpty]
    RuntimeEnabled = True
  end
  object btnSair: TDBNavigationButton
    Left = 350
    Top = 264
    Width = 90
    Height = 30
    Hint = 'Sair desta tela'
    Caption = '&Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = btnSairClick
    ConfirmDelete = False
    DataButtonType = nbCustom
    DataSource = dsDados
    DisableReasons = [drEditing]
    RuntimeEnabled = True
  end
  object dsDados: TDataSource
    DataSet = qyDados
    Left = 248
    Top = 16
  end
  object FormStorage1: TFormStorage
    Options = [fpPosition]
    UseRegistry = False
    StoredValues = <>
    Left = 112
    Top = 8
  end
  object dsUsuarios: TDataSource
    DataSet = qyUsuarios
    Left = 248
    Top = 44
  end
  object qyDados: TIBQuery
    Database = dm2.Database1
    Transaction = dm2.IBTransaction1
    AfterOpen = qyDadosAfterOpen
    AfterPost = qyDadosAfterPost
    AfterScroll = qyDadosAfterScroll
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  ROTINAS'
      'ORDER BY'
      '  ROT_CODIGO')
    UpdateObject = updDados
    Left = 192
    Top = 16
    object qyDadosROT_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ROT_CODIGO'
      Origin = 'ROTINAS.ROT_CODIGO'
      Required = True
    end
    object qyDadosROT_DESCRICAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'ROT_DESCRICAO'
      Origin = 'ROTINAS.ROT_DESCRICAO'
      Required = True
      Size = 150
    end
    object qyDadosROT_EXECUCAO: TIBStringField
      DisplayLabel = 'Execu'#231#227'o'
      FieldName = 'ROT_EXECUCAO'
      Origin = 'ROTINAS.ROT_EXECUCAO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qyDadosROT_ULT_DATA: TDateTimeField
      DisplayLabel = 'Data executada'
      FieldName = 'ROT_ULT_DATA'
      Origin = 'ROTINAS.ROT_ULT_DATA'
    end
  end
  object updDados: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ROT_CODIGO,'
      '  ROT_DESCRICAO,'
      '  ROT_EXECUCAO,'
      '  ROT_ULT_DATA'
      'from ROTINAS '
      'where'
      '  ROT_CODIGO = :ROT_CODIGO')
    ModifySQL.Strings = (
      'update ROTINAS'
      'set'
      '  ROT_CODIGO = :ROT_CODIGO,'
      '  ROT_DESCRICAO = :ROT_DESCRICAO,'
      '  ROT_EXECUCAO = :ROT_EXECUCAO,'
      '  ROT_ULT_DATA = :ROT_ULT_DATA'
      'where'
      '  ROT_CODIGO = :OLD_ROT_CODIGO')
    InsertSQL.Strings = (
      'insert into ROTINAS'
      '  (ROT_CODIGO, ROT_DESCRICAO, ROT_EXECUCAO, ROT_ULT_DATA)'
      'values'
      '  (:ROT_CODIGO, :ROT_DESCRICAO, :ROT_EXECUCAO, :ROT_ULT_DATA)')
    DeleteSQL.Strings = (
      'delete from ROTINAS'
      'where'
      '  ROT_CODIGO = :OLD_ROT_CODIGO')
    Left = 220
    Top = 16
  end
  object qyUsuarios: TIBQuery
    Database = dm2.Database1
    Transaction = dm2.IBTransaction1
    AfterDelete = qyUsuariosAfterDelete
    AfterInsert = qyUsuariosAfterInsert
    AfterPost = qyUsuariosAfterPost
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  ROTINAS_USUARIOS'
      'ORDER BY'
      '  RUS_ROTINA')
    UpdateObject = updUsuarios
    Left = 192
    Top = 44
    object qyUsuariosRUS_ROTINA: TIntegerField
      DisplayLabel = 'Rotina'
      FieldName = 'RUS_ROTINA'
      Origin = 'ROTINAS_USUARIOS.RUS_ROTINA'
      Required = True
    end
    object qyUsuariosRUS_USUARIO: TIBStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'RUS_USUARIO'
      Origin = 'ROTINAS_USUARIOS.RUS_USUARIO'
      Required = True
      Size = 30
    end
  end
  object updUsuarios: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  RUS_ROTINA,'
      '  RUS_USUARIO'
      'from ROTINAS_USUARIOS '
      'where'
      '  RUS_ROTINA = :RUS_ROTINA and'
      '  RUS_USUARIO = :RUS_USUARIO')
    ModifySQL.Strings = (
      'update ROTINAS_USUARIOS'
      'set'
      '  RUS_ROTINA = :RUS_ROTINA,'
      '  RUS_USUARIO = :RUS_USUARIO'
      'where'
      '  RUS_ROTINA = :OLD_RUS_ROTINA and'
      '  RUS_USUARIO = :OLD_RUS_USUARIO')
    InsertSQL.Strings = (
      'insert into ROTINAS_USUARIOS'
      '  (RUS_ROTINA, RUS_USUARIO)'
      'values'
      '  (:RUS_ROTINA, :RUS_USUARIO)')
    DeleteSQL.Strings = (
      'delete from ROTINAS_USUARIOS'
      'where'
      '  RUS_ROTINA = :OLD_RUS_ROTINA and'
      '  RUS_USUARIO = :OLD_RUS_USUARIO')
    Left = 220
    Top = 44
  end
end