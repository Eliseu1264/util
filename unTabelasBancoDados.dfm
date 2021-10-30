object frmTabelasBancoDados: TfrmTabelasBancoDados
  Left = 128
  Top = 131
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de tabelas do Gerador de Relatórios'
  ClientHeight = 258
  ClientWidth = 531
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
    Left = 17
    Top = 115
    Width = 506
    Height = 94
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 25
    Top = 123
    Width = 33
    Height = 13
    Caption = 'Tabela'
  end
  object Label2: TLabel
    Left = 181
    Top = 123
    Width = 33
    Height = 13
    Caption = 'Campo'
  end
  object Label3: TLabel
    Left = 25
    Top = 163
    Width = 88
    Height = 13
    Caption = 'Tabela (descrição)'
  end
  object Label4: TLabel
    Left = 181
    Top = 163
    Width = 88
    Height = 13
    Caption = 'Campo (descrição)'
  end
  object Label5: TLabel
    Left = 424
    Top = 164
    Width = 71
    Height = 13
    Caption = 'Tipo/Tamanho'
  end
  object Label6: TLabel
    Left = 17
    Top = 58
    Width = 81
    Height = 13
    Caption = 'Tabela escolhida'
  end
  object Label7: TLabel
    Left = 17
    Top = 9
    Width = 78
    Height = 13
    Caption = 'Bando de dados'
  end
  object cbTabelas: TComboBox
    Left = 17
    Top = 72
    Width = 192
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    OnChange = cbTabelasChange
    OnExit = cbTabelasExit
  end
  object Edit1: TEdit
    Left = 17
    Top = 22
    Width = 166
    Height = 21
    TabOrder = 6
    Text = 'GrafManager'
  end
  object BitBtn1: TBitBtn
    Left = 184
    Top = 22
    Width = 26
    Height = 23
    Caption = '...'
    TabOrder = 7
    OnClick = BitBtn1Click
  end
  object DBEdit1: TDBEdit
    Left = 25
    Top = 136
    Width = 153
    Height = 21
    Color = 15859450
    DataField = 'GRT_TABELA'
    DataSource = DataSource1
    TabOrder = 8
  end
  object DBEdit2: TDBEdit
    Left = 181
    Top = 136
    Width = 237
    Height = 21
    Color = 15859450
    DataField = 'GRT_CAMPO'
    DataSource = DataSource1
    TabOrder = 9
  end
  object DBEdit3: TDBEdit
    Left = 25
    Top = 176
    Width = 153
    Height = 21
    DataField = 'GRT_DESC_TABELA'
    DataSource = DataSource1
    TabOrder = 0
    OnEnter = DBEdit3Enter
    OnExit = DBEdit3Exit
  end
  object DBEdit4: TDBEdit
    Left = 181
    Top = 176
    Width = 238
    Height = 21
    DataField = 'GRT_DESC_CAMPO'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit5: TDBEdit
    Left = 491
    Top = 176
    Width = 25
    Height = 21
    DataField = 'GRT_TAMANHO'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBComboBox1: TDBComboBox
    Left = 425
    Top = 176
    Width = 65
    Height = 21
    DataField = 'GRT_TIPO'
    DataSource = DataSource1
    ItemHeight = 13
    Items.Strings = (
      'Data'
      'String'
      'Valor')
    TabOrder = 2
  end
  object ListBox1: TListBox
    Left = 221
    Top = 8
    Width = 301
    Height = 101
    Columns = 1
    ItemHeight = 13
    TabOrder = 10
    OnClick = ListBox1Click
  end
  object BitBtn2: TBitBtn
    Left = 17
    Top = 218
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 11
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 97
    Top = 218
    Width = 75
    Height = 25
    Caption = 'Salvar'
    Enabled = False
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 448
    Top = 218
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 12
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 177
    Top = 218
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 13
    OnClick = BitBtn5Click
  end
  object EditTemp: TEdit
    Left = -126
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 14
  end
  object DatabaseItems1: TDatabaseItems
    DatabaseName = 'GrafManager'
    Left = 272
    Top = 8
  end
  object OpenDialog1: TOpenDialog
    Left = 320
    Top = 8
  end
  object BDEItems1: TBDEItems
    Left = 224
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = qry1
    Left = 272
    Top = 56
  end
  object TableItems1: TTableItems
    DatabaseName = 'GrafManager'
    TableName = 'AGENCIAS'
    Left = 320
    Top = 56
  end
  object qry1: TIBQuery
    Database = dm2.Database1
    Transaction = dm2.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from GERADOR_RELATORIO_TABELAS')
    Left = 216
    Top = 56
  end
end
