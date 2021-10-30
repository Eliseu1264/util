object frmRotinasUsuarios: TfrmRotinasUsuarios
  Left = 409
  Top = 119
  Width = 361
  Height = 259
  Caption = 'Usu'#225'rios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 18
    Top = 186
    Width = 318
    Height = 2
    Shape = bsTopLine
  end
  object Bevel2: TBevel
    Left = 234
    Top = 191
    Width = 3
    Height = 30
  end
  object RxDBGrid1: TRxDBGrid
    Left = 18
    Top = 17
    Width = 318
    Height = 160
    Color = clInfoBk
    DataSource = frmRotinas.dsUsuarios
    FixedColor = clGray
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'RUS_USUARIO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 291
        Visible = True
      end>
  end
  object dbNavBtnDelete: TDBNavigationButton
    Left = 136
    Top = 191
    Width = 90
    Height = 30
    Hint = 'Cancelar a edi'#231#227'o atual'
    Caption = '&Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    NumGlyphs = 2
    ConfirmDelete = False
    DataButtonType = nbDelete
    DataSource = frmRotinas.dsUsuarios
    DisableReasons = [drReadonly, drEditing, drEmpty]
    RuntimeEnabled = True
  end
  object btnSair: TDBNavigationButton
    Left = 245
    Top = 191
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
    TabOrder = 2
    OnClick = btnSairClick
    ConfirmDelete = False
    DataButtonType = nbCustom
    DisableReasons = [drEditing]
    RuntimeEnabled = True
  end
  object FormStorage1: TFormStorage
    Options = [fpPosition]
    UseRegistry = False
    StoredValues = <>
    Left = 72
    Top = 56
  end
end
