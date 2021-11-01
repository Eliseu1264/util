object frmSpedContribuicao: TfrmSpedContribuicao
  Left = 234
  Top = 336
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'SPED CONTRIBUI'#199#195'O'
  ClientHeight = 388
  ClientWidth = 660
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label9: TLabel
    Left = 17
    Top = 40
    Width = 66
    Height = 13
    Caption = 'Per'#237'odo Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 118
    Top = 40
    Width = 61
    Height = 13
    Caption = 'Per'#237'odo Final'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 454
    Top = 41
    Width = 131
    Height = 13
    Caption = 'Per'#237'odo de apura'#231#227'o do IPI'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 237
    Top = 85
    Width = 148
    Height = 13
    Caption = 'Indicador de situa'#231#227'o especial:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 17
    Top = 85
    Width = 101
    Height = 13
    Caption = 'Tipo de escritura'#231#227'o:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 17
    Top = 131
    Width = 133
    Height = 13
    Caption = 'Natureza da pessoa jur'#237'dica'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 237
    Top = 131
    Width = 143
    Height = 13
    Caption = 'Indicador de tipo de atividade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 17
    Top = 179
    Width = 148
    Height = 13
    Caption = 'Regimes da Contribui'#231#227'o Social'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 17
    Top = 273
    Width = 162
    Height = 13
    Caption = 'm'#233'todo de apropria'#231#227'o de cr'#233'dito'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 237
    Top = 273
    Width = 167
    Height = 13
    Caption = 'crit'#233'rio de escritura'#231#227'o e apura'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 17
    Top = 226
    Width = 142
    Height = 13
    Caption = 'Tipo de Contribui'#231#227'o Apurada'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 237
    Top = 226
    Width = 309
    Height = 13
    Caption = 'Indicador da apura'#231#227'o das contribui'#231#245'es e cr'#233'ditos (NF-e e ECF)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object RxLabel2: TRxLabel
    Left = 17
    Top = 5
    Width = 231
    Height = 27
    Caption = 'SPED de Contribui'#231#227'o'
    Color = clSilver
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object bvSup: TBevel
    Left = 17
    Top = 33
    Width = 632
    Height = 2
  end
  object Label11: TLabel
    Left = 237
    Top = 179
    Width = 186
    Height = 13
    Caption = 'Tabela para Fins de Rateio de Cr'#233'ditos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel
    Left = 446
    Top = 273
    Width = 30
    Height = 13
    Caption = 'PIS %'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label15: TLabel
    Left = 515
    Top = 273
    Width = 52
    Height = 13
    Caption = 'COFINS %'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 506
    Top = 328
    Width = 141
    Height = 50
    Caption = 'Executar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 20
    OnClick = BitBtn1Click
  end
  object DATA_INICIAL: TDateEdit
    Left = 17
    Top = 56
    Width = 93
    Height = 19
    NumGlyphs = 2
    TabOrder = 0
  end
  object DATA_FINAL: TDateEdit
    Left = 118
    Top = 56
    Width = 95
    Height = 19
    NumGlyphs = 2
    TabOrder = 1
  end
  object NUM_REC_ANTERIOR: TLabeledEdit
    Left = 237
    Top = 56
    Width = 192
    Height = 21
    EditLabel.Width = 128
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#250'mero do Recibo Anterior'
    TabOrder = 2
  end
  object ApuracaoIPI: TComboBox
    Left = 454
    Top = 56
    Width = 195
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 3
    Items.Strings = (
      '0 - Mensal'
      '1 - Decendial'
      'nenhum')
  end
  object COD_CTA_PRODUTO: TLabeledEdit
    Left = 454
    Top = 100
    Width = 193
    Height = 21
    EditLabel.Width = 133
    EditLabel.Height = 13
    EditLabel.Caption = 'Conta Anal'#237'tica de Produtos'
    TabOrder = 6
    Text = '1.1.1.000001'
  end
  object IND_SIT_ESP: TComboBox
    Left = 237
    Top = 100
    Width = 195
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 5
    Text = '0 - Abertura'
    Items.Strings = (
      '0 - Abertura'
      '1 - Cis'#227'o'
      '2 - Fus'#227'o'
      '3 - Incorpora'#231#227'o'
      '4 - Encerramento')
  end
  object TIPO_ESCRIT: TComboBox
    Left = 17
    Top = 100
    Width = 195
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 4
    Text = '0 - Original'
    OnClick = TIPO_ESCRITClick
    Items.Strings = (
      '0 - Original'
      '1 - Retificadora')
  end
  object IND_NAT_PJ: TComboBox
    Left = 17
    Top = 147
    Width = 195
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 7
    Text = '00 - Pessoa jur'#237'dica em geral'
    Items.Strings = (
      '00 - Pessoa jur'#237'dica em geral'
      '01 - Sociedade cooperativa'
      '02 - Entidade sujeita ao PIS/Pasep'
      '03 - Pessoa jur'#237'dica em SCP'
      '04 - Sociedade cooperativa SCP'
      '05 - Sociedade em Conta SCP')
  end
  object IND_ATIV: TComboBox
    Left = 237
    Top = 147
    Width = 195
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 8
    Text = '0 - Industrial ou equiparado a industrial;'
    Items.Strings = (
      '0 - Industrial ou equiparado a industrial;'
      '1 - Prestador de servi'#231'os;'
      '2 - Atividade de com'#233'rcio;'
      '3 - Pessoas jur'#237'dicas Lei n'#186' 9.718, de 1998;'
      '4 - Atividade imobili'#225'ria;'
      '9 - Outros.')
  end
  object CONTA_PIS_COFINS: TLabeledEdit
    Left = 454
    Top = 147
    Width = 193
    Height = 21
    EditLabel.Width = 130
    EditLabel.Height = 13
    EditLabel.Caption = 'Conta Anal'#237'tica (Pis/Cofins)'
    TabOrder = 9
    Text = '1.1.1.000001'
  end
  object COD_INC_TRIB: TComboBox
    Left = 17
    Top = 194
    Width = 195
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 10
    Text = '1 - Regime n'#227'o-cumulativo;'
    Items.Strings = (
      '1 - Regime n'#227'o-cumulativo;'
      '2 - Regime cumulativo;'
      '3 - N'#227'o-cumulativo e cumulativo.')
  end
  object IND_APRO_CRED: TComboBox
    Left = 17
    Top = 289
    Width = 195
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 14
    Text = '1 - M'#233'todo de Apropria'#231#227'o Direta;'
    Items.Strings = (
      '1 - M'#233'todo de Apropria'#231#227'o Direta;'
      '2 - M'#233'todo de Rateio Proporcional (Receita Bruta)')
  end
  object IND_REG_CUM: TComboBox
    Left = 237
    Top = 289
    Width = 195
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 15
    Text = '1 - Regime de Caixa'
    Items.Strings = (
      '1 - Regime de Caixa'
      '2 - Regime de Compet'#234'ncia consolidada'
      '9 - Regime de Compet'#234'ncia detalhada')
  end
  object COD_TIPO_CONT: TComboBox
    Left = 17
    Top = 242
    Width = 195
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 12
    Text = '1 - Exclusivamente a Al'#237'quota B'#225'sica'
    Items.Strings = (
      '1 - Exclusivamente a Al'#237'quota B'#225'sica'
      '2 - Al'#237'quotas Espec'#237'ficas')
  end
  object DESTACA_IPI_ENTRADA: TCheckBox
    Left = 17
    Top = 354
    Width = 195
    Height = 17
    Caption = 'Destacar IPI em notas de entrada'
    TabOrder = 19
  end
  object CheckBoxBlocoP: TCheckBox
    Left = 17
    Top = 325
    Width = 299
    Height = 17
    Caption = 'Apurar Contribui'#231#227'o Previdenci'#225'ria sobre a Receita Bruta'
    TabOrder = 18
  end
  object COD_INC_TRIB_P: TComboBox
    Left = 237
    Top = 194
    Width = 411
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 11
    Text = '1 - Contribui'#231#227'o exclusivamente com base na Receita Bruta;'
    Items.Strings = (
      '1 - Contribui'#231#227'o exclusivamente com base na Receita Bruta;'
      
        '2 - Contribui'#231#227'o Receita Bruta e Remunera'#231#245'es pagas, Lei 8.212, ' +
        '1991')
  end
  object IND_ESCRI: TComboBox
    Left = 237
    Top = 242
    Width = 411
    Height = 22
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ItemIndex = 1
    ParentFont = False
    TabOrder = 13
    Text = 
      '2 - Apura'#231#227'o com base no registro individualizado de NF-e (C100 ' +
      'e C170) e de ECF (C400)'
    Items.Strings = (
      
        '1 - Apura'#231#227'o com base nos registros de consolida'#231#227'o das opera'#231#245'e' +
        's por NF-e (C180 e C190) e por ECF (C490);'
      
        '2 - Apura'#231#227'o com base no registro individualizado de NF-e (C100 ' +
        'e C170) e de ECF (C400)')
  end
  object ALIQUOTA_PIS: TCurrencyEdit
    Left = 444
    Top = 289
    Width = 58
    Height = 21
    DisplayFormat = ',0.00'
    TabOrder = 16
    Value = 1.650000000000000000
  end
  object ALIQUOTA_COFINS: TCurrencyEdit
    Left = 513
    Top = 289
    Width = 58
    Height = 21
    DisplayFormat = ',0.00'
    TabOrder = 17
    Value = 7.600000000000000000
  end
  object ACBrSPEDPisCofins1: TACBrSPEDPisCofins
    Path = 'C:\Program Files (x86)\Borland\Delphi7\Bin\'
    Delimitador = '|'
    TrimString = True
    CurMascara = '#0.00'
    Left = 320
    Top = 1
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Title = 'SPED Contribui'#231#227'o'
    Left = 272
  end
  object FormStorage1: TFormStorage
    UseRegistry = False
    StoredProps.Strings = (
      'DATA_FINAL.Text'
      'DATA_INICIAL.Text'
      'ApuracaoIPI.ItemIndex'
      'TIPO_ESCRIT.ItemIndex'
      'IND_NAT_PJ.ItemIndex'
      'COD_CTA_PRODUTO.Text'
      'COD_INC_TRIB.Text'
      'COD_INC_TRIB_P.Text'
      'COD_TIPO_CONT.Text'
      'IND_APRO_CRED.ItemIndex'
      'IND_ATIV.ItemIndex'
      'IND_ESCRI.ItemIndex'
      'IND_REG_CUM.ItemIndex'
      'IND_SIT_ESP.ItemIndex'
      'ALIQUOTA_COFINS.Value'
      'ALIQUOTA_PIS.Value')
    StoredValues = <>
    Left = 356
    Top = 65530
  end
end
