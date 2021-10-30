object frmBackupNovo: TfrmBackupNovo
  Left = 206
  Top = 106
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Backup'
  ClientHeight = 343
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 11
    Top = 128
    Width = 422
    Height = 150
  end
  object Bevel1: TBevel
    Left = 11
    Top = 16
    Width = 422
    Height = 96
  end
  object Label4: TLabel
    Left = 19
    Top = 30
    Width = 88
    Height = 13
    Caption = 'Caminho do GBAK'
  end
  object Label5: TLabel
    Left = 19
    Top = 68
    Width = 148
    Height = 13
    Caption = 'Pasta onde ser'#225' feito o backup'
  end
  object Label7: TLabel
    Left = 21
    Top = 8
    Width = 68
    Height = 13
    Caption = 'Configura'#231#245'es'
  end
  object Label6: TLabel
    Left = 21
    Top = 120
    Width = 92
    Height = 13
    Caption = 'Backup autom'#225'tico'
  end
  object Label8: TLabel
    Left = 112
    Top = 290
    Width = 225
    Height = 29
    Alignment = taCenter
    AutoSize = False
    Caption = 'Backup di'#225'rio autom'#225'tico ativado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Label11: TLabel
    Left = 106
    Top = 290
    Width = 225
    Height = 29
    Alignment = taCenter
    AutoSize = False
    Caption = 'Backup em andamento...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
    WordWrap = True
  end
  object AbMeter2: TAbMeter
    Left = 105
    Top = 323
    Width = 236
    Height = 10
    Orientation = moHorizontal
    UnusedColor = clBtnFace
    UsedColor = clNavy
  end
  object RxDBGrid1: TRxDBGrid
    Left = 21
    Top = 138
    Width = 402
    Height = 128
    TabStop = False
    Color = clInfoBk
    Ctl3D = False
    DataSource = dsBackup
    FixedColor = clGray
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    IniStorage = FormStorage1
    Columns = <
      item
        Expanded = False
        FieldName = 'DIA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAK_HORA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BAK_MAQUINA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindow
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 11
    Top = 285
    Width = 92
    Height = 31
    Caption = '&Backup'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
      FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
      FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
      007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
      7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
      99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
  end
  object BitBtn3: TBitBtn
    Left = 342
    Top = 285
    Width = 92
    Height = 31
    Caption = 'Fechar[F4]'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object edtPasta: TDirectoryEdit
    Left = 19
    Top = 82
    Width = 318
    Height = 21
    NumGlyphs = 1
    TabOrder = 4
    OnChange = edtGbakChange
  end
  object edtGbak: TDirectoryEdit
    Left = 19
    Top = 44
    Width = 318
    Height = 21
    NumGlyphs = 1
    TabOrder = 5
    OnChange = edtGbakChange
  end
  object Button2: TButton
    Left = 341
    Top = 44
    Width = 86
    Height = 29
    Caption = '&Gravar'
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 341
    Top = 75
    Width = 86
    Height = 29
    Caption = '&Cancelar'
    TabOrder = 7
    OnClick = Button3Click
  end
  object pnlNovo: TJvCaptionPanel
    Left = 418
    Top = 178
    Width = 255
    Height = 167
    Buttons = [capClose]
    Caption = 'Configura'#231#227'o'
    CaptionColor = clNavy
    CaptionPosition = dpTop
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWhite
    CaptionFont.Height = -13
    CaptionFont.Name = 'MS Sans Serif'
    CaptionFont.Style = [fsBold]
    OutlookLook = False
    TabOrder = 1
    Visible = False
    OnButtonClick = pnlNovoButtonClick
    OnExit = pnlNovoExit
    object Label2: TLabel
      Left = 24
      Top = 46
      Width = 16
      Height = 13
      Caption = 'Dia'
    end
    object Label3: TLabel
      Left = 152
      Top = 46
      Width = 23
      Height = 13
      Caption = 'Hora'
    end
    object cbDia: TComboBox
      Left = 24
      Top = 62
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'Domingo'
      Items.Strings = (
        'Domingo'
        'Segunda Feira'
        'Ter'#231'a Feira'
        'Quarta Feira'
        'Quinta Feira'
        'Sexta Feira'
        'S'#225'bado')
    end
    object edtHora: TMaskEdit
      Left = 152
      Top = 62
      Width = 42
      Height = 21
      EditMask = '!90:00;0;_'
      MaxLength = 5
      TabOrder = 1
    end
    object Button1: TButton
      Left = 80
      Top = 109
      Width = 75
      Height = 25
      Caption = 'Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object pnlMaquina: TPanel
    Left = 602
    Top = 146
    Width = 188
    Height = 129
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 8
    Visible = False
    object Label9: TLabel
      Left = 2
      Top = 2
      Width = 184
      Height = 15
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'M'#225'quina para backup'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label10: TLabel
      Left = 8
      Top = 32
      Width = 41
      Height = 13
      Cursor = crHandPoint
      Caption = 'M'#225'quina'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = Label10Click
    end
    object edtMaquina: TEdit
      Left = 8
      Top = 48
      Width = 169
      Height = 21
      TabOrder = 0
    end
    object Button5: TButton
      Left = 16
      Top = 93
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 96
      Top = 93
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button6Click
    end
  end
  object qyBackup: TIBQuery
    Database = dm2.Database1
    Transaction = dm2.IBTransaction1
    OnCalcFields = qyBackupCalcFields
    SQL.Strings = (
      'SELECT'
      ' * '
      'FROM '
      ' BACKUP_CONFIG'
      'ORDER BY '
      ' BAK_DIA,'
      ' BAK_HORA')
    UpdateObject = upBackup
    Left = 211
    object qyBackupDIA: TStringField
      DisplayLabel = 'Dia'
      FieldKind = fkCalculated
      FieldName = 'DIA'
      Calculated = True
    end
    object qyBackupBAK_DIA: TIntegerField
      DisplayLabel = 'Dia'
      FieldName = 'BAK_DIA'
      Origin = 'BACKUP_CONFIG.BAK_DIA'
      Required = True
    end
    object qyBackupBAK_HORA: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'BAK_HORA'
      Origin = 'BACKUP_CONFIG.BAK_HORA'
      Required = True
      DisplayFormat = 'HH:MM'
      EditMask = '99:99;1; '
    end
    object qyBackupBAK_DESCRICAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'BAK_DESCRICAO'
      Origin = 'BACKUP_CONFIG.BAK_DESCRICAO'
      Size = 50
    end
    object qyBackupBAK_MAQUINA: TIBStringField
      DisplayLabel = 'M'#225'quina'
      FieldName = 'BAK_MAQUINA'
      Origin = 'BACKUP_CONFIG.BAK_MAQUINA'
      Size = 30
    end
    object qyBackupBAK_NOME_SERVIDOR: TIBStringField
      DisplayLabel = 'Nome do servidor'
      FieldName = 'BAK_NOME_SERVIDOR'
      Origin = 'BACKUP_CONFIG.BAK_NOME_SERVIDOR'
      Size = 30
    end
    object qyBackupBAK_SENHA: TIBStringField
      DisplayLabel = 'Senha'
      FieldName = 'BAK_SENHA'
      Origin = 'BACKUP_CONFIG.BAK_SENHA'
      Size = 15
    end
    object qyBackupBAK_DESTINO: TIBStringField
      DisplayLabel = 'Pasta de destino'
      FieldName = 'BAK_DESTINO'
      Origin = 'BACKUP_CONFIG.BAK_DESTINO'
      Size = 200
    end
    object qyBackupBAK_USUARIO: TIBStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'BAK_USUARIO'
      Origin = 'BACKUP_CONFIG.BAK_USUARIO'
      Size = 30
    end
    object qyBackupBAK_CAMINHO_GBAK: TIBStringField
      FieldName = 'BAK_CAMINHO_GBAK'
      Origin = '"BACKUP_CONFIG"."BAK_CAMINHO_GBAK"'
      Size = 200
    end
  end
  object upBackup: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  BAK_DIA,'
      '  BAK_HORA,'
      '  BAK_DESCRICAO,'
      '  BAK_MAQUINA,'
      '  BAK_NOME_SERVIDOR,'
      '  BAK_SENHA,'
      '  BAK_USUARIO,'
      '  BAK_DESTINO,'
      '  BAK_CAMINHO_GBAK'
      'from BACKUP_CONFIG '
      'where'
      '  BAK_DIA = :BAK_DIA and'
      '  BAK_HORA = :BAK_HORA')
    ModifySQL.Strings = (
      'update BACKUP_CONFIG'
      'set'
      '  BAK_DIA = :BAK_DIA,'
      '  BAK_HORA = :BAK_HORA,'
      '  BAK_DESCRICAO = :BAK_DESCRICAO,'
      '  BAK_MAQUINA = :BAK_MAQUINA,'
      '  BAK_NOME_SERVIDOR = :BAK_NOME_SERVIDOR,'
      '  BAK_SENHA = :BAK_SENHA,'
      '  BAK_USUARIO = :BAK_USUARIO,'
      '  BAK_DESTINO = :BAK_DESTINO,'
      '  BAK_CAMINHO_GBAK = :BAK_CAMINHO_GBAK'
      'where'
      '  BAK_DIA = :OLD_BAK_DIA and'
      '  BAK_HORA = :OLD_BAK_HORA')
    InsertSQL.Strings = (
      'insert into BACKUP_CONFIG'
      
        '  (BAK_DIA, BAK_HORA, BAK_DESCRICAO, BAK_MAQUINA, BAK_NOME_SERVI' +
        'DOR, BAK_SENHA, '
      '   BAK_USUARIO, BAK_DESTINO, BAK_CAMINHO_GBAK)'
      'values'
      
        '  (:BAK_DIA, :BAK_HORA, :BAK_DESCRICAO, :BAK_MAQUINA, :BAK_NOME_' +
        'SERVIDOR, '
      '   :BAK_SENHA, :BAK_USUARIO, :BAK_DESTINO, :BAK_CAMINHO_GBAK)')
    DeleteSQL.Strings = (
      'delete from BACKUP_CONFIG'
      'where'
      '  BAK_DIA = :OLD_BAK_DIA and'
      '  BAK_HORA = :OLD_BAK_HORA')
    Left = 239
  end
  object dsBackup: TDataSource
    DataSet = qyBackup
    Left = 295
  end
  object FormStorage1: TFormStorage
    UseRegistry = False
    StoredValues = <>
    Left = 267
  end
  object PopupMenu1: TPopupMenu
    Left = 176
    object Incluirnovo1: TMenuItem
      Caption = 'Incluir novo'
      OnClick = Incluirnovo1Click
    end
    object Excluir1: TMenuItem
      Caption = 'Excluir'
      OnClick = Excluir1Click
    end
    object Informarmquinaparabackup1: TMenuItem
      Caption = 'Informar m'#225'quina para backup'
      OnClick = Informarmquinaparabackup1Click
    end
  end
  object AbZipper1: TAbZipper
    ArchiveProgressMeter = AbMeter2
    ArchiveSaveProgressMeter = AbMeter2
    AutoSave = True
    BaseDirectory = 'C:\BackupAssist'
    DOSMode = False
    StoreOptions = [soStripDrive, soStripPath, soRemoveDots, soReplace]
    Left = 208
    Top = 64
  end
end
