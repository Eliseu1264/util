object frmMigrarDads: TfrmMigrarDads
  Left = 136
  Top = 188
  BorderStyle = bsSingle
  Caption = 'Migrar dados'
  ClientHeight = 214
  ClientWidth = 486
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
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 16
    Top = 16
    Width = 449
    Height = 161
    Shape = bsFrame
  end
  object Bevel2: TBevel
    Left = 32
    Top = 77
    Width = 417
    Height = 90
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 27
    Top = 22
    Width = 249
    Height = 13
    Caption = 'Banco de dados origem (InterBase/FireBird)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 71
    Width = 135
    Height = 13
    Caption = 'Movimentos para migrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 368
    Top = 22
    Width = 76
    Height = 13
    Caption = 'Senha banco'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 29
    Top = 59
    Width = 208
    Height = 12
    Caption = '* O banco destino '#233' o banco principal do sistema.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 16
    Top = 188
    Width = 52
    Height = 16
    Caption = 'Cliente...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Banco_de_dados: TFilenameEdit
    Left = 26
    Top = 36
    Width = 337
    Height = 21
    NumGlyphs = 1
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 215
    Top = 183
    Width = 75
    Height = 25
    Caption = 'Executar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 378
    Top = 183
    Width = 75
    Height = 25
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object chCliente: TCheckBox
    Left = 44
    Top = 85
    Width = 125
    Height = 17
    Caption = 'Clientes'
    TabOrder = 3
  end
  object chContasReceber: TCheckBox
    Left = 44
    Top = 108
    Width = 125
    Height = 17
    Caption = 'Contas a Receber'
    TabOrder = 4
  end
  object chContasPagar: TCheckBox
    Left = 179
    Top = 107
    Width = 126
    Height = 17
    Caption = 'Contas a Pagar'
    TabOrder = 5
  end
  object chFornecedores: TCheckBox
    Left = 179
    Top = 84
    Width = 142
    Height = 17
    Caption = 'Fornecedores'
    TabOrder = 6
  end
  object edSenha: TMaskEdit
    Left = 368
    Top = 36
    Width = 81
    Height = 21
    TabOrder = 7
  end
  object Cancelar: TCheckBox
    Left = 131
    Top = -1
    Width = 70
    Height = 17
    Caption = 'Cancelar'
    TabOrder = 8
    Visible = False
  end
  object BitBtn3: TBitBtn
    Left = 297
    Top = 183
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = BitBtn3Click
  end
  object FormStorage1: TFormStorage
    UseRegistry = False
    StoredProps.Strings = (
      'Banco_de_dados.FileName'
      'edSenha.Text')
    StoredValues = <>
    Left = 432
    Top = 56
  end
  object Database1: TIBDatabase
    Params.Strings = (
      'user_name=SYSDBA'
      'password=2815358')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    Left = 312
    Top = 3
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = Database1
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 344
    Top = 3
  end
  object qryOrigem: TIBQuery
    Database = Database1
    Transaction = IBTransaction1
    SQL.Strings = (
      '')
    Left = 320
    Top = 34
  end
  object updDestino: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CLI_CODIGO,'
      '  CLI_PESSOA,'
      '  CLI_ESTADO,'
      '  CLI_CEP,'
      '  CLI_CPF,'
      '  CLI_CGC,'
      '  CLI_CGF,'
      '  CLI_AGENCIA,'
      '  CLI_FAX,'
      '  CLI_FATCEP,'
      '  CLI_FATESTADO,'
      '  CLI_FATCGC,'
      '  CLI_FATCGF,'
      '  CLI_CREDITO,'
      '  CLI_COBCEP,'
      '  CLI_COBESTADO,'
      '  CLI_COBCGC,'
      '  CLI_COBCGF,'
      '  CLI_FATCPF,'
      '  CLI_COBCPF,'
      '  CLI_VENAGE,'
      '  CLI_CARAC,'
      '  CLI_ANTI_PENULTIMA,'
      '  CLI_PENULTIMA,'
      '  CLI_ULTIMA,'
      '  CLI_RESULT_ULTIMA,'
      '  CLI_RESULT_PENULTIMA,'
      '  CLI_RESULT_ANTIPENUL,'
      '  CLI_DT_RETORNO,'
      '  CLI_VENDEDOR,'
      '  CLI_ATIVIDADE,'
      '  CLI_OBS,'
      '  CLI_FONE,'
      '  CLI_NOME,'
      '  CLI_ENDERECO,'
      '  CLI_FATENDERECO,'
      '  CLI_CIDADE,'
      '  CLI_BAIRRO,'
      '  CLI_FATBAIRRO,'
      '  CLI_FATCIDADE,'
      '  CLI_COBENDERECO,'
      '  CLI_COBBAIRRO,'
      '  CLI_COBCIDADE,'
      '  CLI_WEB,'
      '  CLI_EMAIL,'
      '  CLI_FANTASIA,'
      '  CLI_FONE2,'
      '  CLI_INSC_MUNICIPAL,'
      '  CLI_COBINSC_MUNICIPAL,'
      '  CLI_FATINSC_MUNICIPAL,'
      '  CLI_CREDIO_MOTIVO,'
      '  CLI_ISS_RETIDO,'
      '  CLI_COD_FORTTS,'
      '  CLI_CONTA_FORTTS,'
      '  CLI_ORG_PUBL_FEDERAL,'
      '  CLI_ISENTO_ICMS,'
      '  CLI_LIMITE_CREDITO,'
      '  CLI_ATUALIZA,'
      '  CLI_CODIGO_BANCO,'
      '  CLI_AREA_COMPENSACAO,'
      '  CLI_AGENCIA_BANCO,'
      '  CLI_CONTA,'
      '  CLI_DIGI_VERIFICA,'
      '  CLI_CONTROLE_INTERNO,'
      '  CLI_LIMITE,'
      '  CLI_PRAZO,'
      '  CLI_SENHA,'
      '  CLI_NIVEL_DESCONTO,'
      '  CLI_BANCO,'
      '  CLI_AGE_BANCO,'
      '  CLI_CONTA_COR,'
      '  CLI_REF_COMERCIAL,'
      '  CLI_BANCO1,'
      '  CLI_AGE_BANCO1,'
      '  CLI_CONTA_COR1,'
      '  CLI_REF_COMERCIAL1,'
      '  CLI_PAG_PROGRAMADO,'
      '  CLI_CADASTRO,'
      '  CLI_LIMITE_PERMUTA,'
      '  CLI_FORNECEDOR,'
      '  CLI_DT_VENDEDOR,'
      '  CLI_TRANSPORTADORA,'
      '  CLI_DESC_M2,'
      '  CLI_FRETE,'
      '  CLI_CORTESIA_ACABAMENTO,'
      '  CLI_DESCONTO_ACABAMENTO,'
      '  CLI_PAG1,'
      '  CLI_PAG2,'
      '  CLI_PAG3,'
      '  CLI_PAG4,'
      '  CLI_PAG5,'
      '  CLI_PAG6,'
      '  CLI_PAG7,'
      '  CLI_PAG8,'
      '  CLI_PAG9,'
      '  CLI_FORMA_PGTO,'
      '  CLI_MARGEM_LUCRO,'
      '  CLI_ATIVO,'
      '  CLI_USA_PROMOCAO,'
      '  CLI_DT_CADASTRO,'
      '  CLI_DT_RECADASTRO,'
      '  CLI_QT_AVISOS_RECADASTROS,'
      '  CLI_NOME_MAE,'
      '  CLI_RG_MAE,'
      '  CLI_PONTO_REFERENCIA,'
      '  CLI_USA_TABELA,'
      '  CLI_INFO_OS,'
      '  CLI_DT_MSG1,'
      '  CLI_DT_MSG2'
      'from CLIENTE '
      'where'
      '  CLI_CODIGO = :CLI_CODIGO')
    ModifySQL.Strings = (
      'update CLIENTE'
      'set'
      '  CLI_AGE_BANCO = :CLI_AGE_BANCO,'
      '  CLI_AGE_BANCO1 = :CLI_AGE_BANCO1,'
      '  CLI_AGENCIA = :CLI_AGENCIA,'
      '  CLI_AGENCIA_BANCO = :CLI_AGENCIA_BANCO,'
      '  CLI_ANTI_PENULTIMA = :CLI_ANTI_PENULTIMA,'
      '  CLI_AREA_COMPENSACAO = :CLI_AREA_COMPENSACAO,'
      '  CLI_ATIVIDADE = :CLI_ATIVIDADE,'
      '  CLI_ATIVO = :CLI_ATIVO,'
      '  CLI_ATUALIZA = :CLI_ATUALIZA,'
      '  CLI_BAIRRO = :CLI_BAIRRO,'
      '  CLI_BANCO = :CLI_BANCO,'
      '  CLI_BANCO1 = :CLI_BANCO1,'
      '  CLI_CADASTRO = :CLI_CADASTRO,'
      '  CLI_CARAC = :CLI_CARAC,'
      '  CLI_CEP = :CLI_CEP,'
      '  CLI_CGC = :CLI_CGC,'
      '  CLI_CGF = :CLI_CGF,'
      '  CLI_CIDADE = :CLI_CIDADE,'
      '  CLI_COBBAIRRO = :CLI_COBBAIRRO,'
      '  CLI_COBCEP = :CLI_COBCEP,'
      '  CLI_COBCGC = :CLI_COBCGC,'
      '  CLI_COBCGF = :CLI_COBCGF,'
      '  CLI_COBCIDADE = :CLI_COBCIDADE,'
      '  CLI_COBCPF = :CLI_COBCPF,'
      '  CLI_COBENDERECO = :CLI_COBENDERECO,'
      '  CLI_COBESTADO = :CLI_COBESTADO,'
      '  CLI_COBINSC_MUNICIPAL = :CLI_COBINSC_MUNICIPAL,'
      '  CLI_COD_FORTTS = :CLI_COD_FORTTS,'
      '  CLI_CODIGO = :CLI_CODIGO,'
      '  CLI_CODIGO_BANCO = :CLI_CODIGO_BANCO,'
      '  CLI_CONTA = :CLI_CONTA,'
      '  CLI_CONTA_COR = :CLI_CONTA_COR,'
      '  CLI_CONTA_COR1 = :CLI_CONTA_COR1,'
      '  CLI_CONTA_FORTTS = :CLI_CONTA_FORTTS,'
      '  CLI_CONTROLE_INTERNO = :CLI_CONTROLE_INTERNO,'
      '  CLI_CORTESIA_ACABAMENTO = :CLI_CORTESIA_ACABAMENTO,'
      '  CLI_CPF = :CLI_CPF,'
      '  CLI_CREDIO_MOTIVO = :CLI_CREDIO_MOTIVO,'
      '  CLI_CREDITO = :CLI_CREDITO,'
      '  CLI_DESC_M2 = :CLI_DESC_M2,'
      '  CLI_DESCONTO_ACABAMENTO = :CLI_DESCONTO_ACABAMENTO,'
      '  CLI_DIGI_VERIFICA = :CLI_DIGI_VERIFICA,'
      '  CLI_DT_CADASTRO = :CLI_DT_CADASTRO,'
      '  CLI_DT_RECADASTRO = :CLI_DT_RECADASTRO,'
      '  CLI_DT_RETORNO = :CLI_DT_RETORNO,'
      '  CLI_DT_VENDEDOR = :CLI_DT_VENDEDOR,'
      '  CLI_EMAIL = :CLI_EMAIL,'
      '  CLI_ENDERECO = :CLI_ENDERECO,'
      '  CLI_ESTADO = :CLI_ESTADO,'
      '  CLI_FANTASIA = :CLI_FANTASIA,'
      '  CLI_FATBAIRRO = :CLI_FATBAIRRO,'
      '  CLI_FATCEP = :CLI_FATCEP,'
      '  CLI_FATCGC = :CLI_FATCGC,'
      '  CLI_FATCGF = :CLI_FATCGF,'
      '  CLI_FATCIDADE = :CLI_FATCIDADE,'
      '  CLI_FATCPF = :CLI_FATCPF,'
      '  CLI_FATENDERECO = :CLI_FATENDERECO,'
      '  CLI_FATESTADO = :CLI_FATESTADO,'
      '  CLI_FATINSC_MUNICIPAL = :CLI_FATINSC_MUNICIPAL,'
      '  CLI_FAX = :CLI_FAX,'
      '  CLI_FONE = :CLI_FONE,'
      '  CLI_FONE2 = :CLI_FONE2,'
      '  CLI_FORMA_PGTO = :CLI_FORMA_PGTO,'
      '  CLI_FORNECEDOR = :CLI_FORNECEDOR,'
      '  CLI_FRETE = :CLI_FRETE,'
      '  CLI_INFO_OS = :CLI_INFO_OS,'
      '  CLI_INSC_MUNICIPAL = :CLI_INSC_MUNICIPAL,'
      '  CLI_ISENTO_ICMS = :CLI_ISENTO_ICMS,'
      '  CLI_ISS_RETIDO = :CLI_ISS_RETIDO,'
      '  CLI_LIMITE = :CLI_LIMITE,'
      '  CLI_LIMITE_CREDITO = :CLI_LIMITE_CREDITO,'
      '  CLI_LIMITE_PERMUTA = :CLI_LIMITE_PERMUTA,'
      '  CLI_MARGEM_LUCRO = :CLI_MARGEM_LUCRO,'
      '  CLI_NIVEL_DESCONTO = :CLI_NIVEL_DESCONTO,'
      '  CLI_NOME = :CLI_NOME,'
      '  CLI_NOME_MAE = :CLI_NOME_MAE,'
      '  CLI_OBS = :CLI_OBS,'
      '  CLI_ORG_PUBL_FEDERAL = :CLI_ORG_PUBL_FEDERAL,'
      '  CLI_PAG_PROGRAMADO = :CLI_PAG_PROGRAMADO,'
      '  CLI_PAG1 = :CLI_PAG1,'
      '  CLI_PAG2 = :CLI_PAG2,'
      '  CLI_PAG3 = :CLI_PAG3,'
      '  CLI_PAG4 = :CLI_PAG4,'
      '  CLI_PAG5 = :CLI_PAG5,'
      '  CLI_PAG6 = :CLI_PAG6,'
      '  CLI_PAG7 = :CLI_PAG7,'
      '  CLI_PAG8 = :CLI_PAG8,'
      '  CLI_PAG9 = :CLI_PAG9,'
      '  CLI_PENULTIMA = :CLI_PENULTIMA,'
      '  CLI_PESSOA = :CLI_PESSOA,'
      '  CLI_PONTO_REFERENCIA = :CLI_PONTO_REFERENCIA,'
      '  CLI_PRAZO = :CLI_PRAZO,'
      '  CLI_QT_AVISOS_RECADASTROS = :CLI_QT_AVISOS_RECADASTROS,'
      '  CLI_REF_COMERCIAL = :CLI_REF_COMERCIAL,'
      '  CLI_REF_COMERCIAL1 = :CLI_REF_COMERCIAL1,'
      '  CLI_RESULT_ANTIPENUL = :CLI_RESULT_ANTIPENUL,'
      '  CLI_RESULT_PENULTIMA = :CLI_RESULT_PENULTIMA,'
      '  CLI_RESULT_ULTIMA = :CLI_RESULT_ULTIMA,'
      '  CLI_RG_MAE = :CLI_RG_MAE,'
      '  CLI_SENHA = :CLI_SENHA,'
      '  CLI_TRANSPORTADORA = :CLI_TRANSPORTADORA,'
      '  CLI_ULTIMA = :CLI_ULTIMA,'
      '  CLI_USA_PROMOCAO = :CLI_USA_PROMOCAO,'
      '  CLI_USA_TABELA = :CLI_USA_TABELA,'
      '  CLI_VENAGE = :CLI_VENAGE,'
      '  CLI_VENDEDOR = :CLI_VENDEDOR,'
      '  CLI_WEB = :CLI_WEB'
      'where'
      '  CLI_CODIGO = :OLD_CLI_CODIGO')
    InsertSQL.Strings = (
      'insert into CLIENTE'
      
        '  (CLI_AGE_BANCO, CLI_AGE_BANCO1, CLI_AGENCIA, CLI_AGENCIA_BANCO' +
        ', CLI_ANTI_PENULTIMA, '
      
        '   CLI_AREA_COMPENSACAO, CLI_ATIVIDADE, CLI_ATIVO, CLI_ATUALIZA,' +
        ' CLI_BAIRRO, '
      
        '   CLI_BANCO, CLI_BANCO1, CLI_CADASTRO, CLI_CARAC, CLI_CEP, CLI_' +
        'CGC, CLI_CGF, '
      
        '   CLI_CIDADE, CLI_COBBAIRRO, CLI_COBCEP, CLI_COBCGC, CLI_COBCGF' +
        ', CLI_COBCIDADE, '
      
        '   CLI_COBCPF, CLI_COBENDERECO, CLI_COBESTADO, CLI_COBINSC_MUNIC' +
        'IPAL, CLI_COD_FORTTS, '
      
        '   CLI_CODIGO, CLI_CODIGO_BANCO, CLI_CONTA, CLI_CONTA_COR, CLI_C' +
        'ONTA_COR1, '
      
        '   CLI_CONTA_FORTTS, CLI_CONTROLE_INTERNO, CLI_CORTESIA_ACABAMEN' +
        'TO, CLI_CPF, '
      
        '   CLI_CREDIO_MOTIVO, CLI_CREDITO, CLI_DESC_M2, CLI_DESCONTO_ACA' +
        'BAMENTO, '
      
        '   CLI_DIGI_VERIFICA, CLI_DT_CADASTRO, CLI_DT_RECADASTRO, CLI_DT' +
        '_RETORNO, '
      
        '   CLI_DT_VENDEDOR, CLI_EMAIL, CLI_ENDERECO, CLI_ESTADO, CLI_FAN' +
        'TASIA, '
      
        '   CLI_FATBAIRRO, CLI_FATCEP, CLI_FATCGC, CLI_FATCGF, CLI_FATCID' +
        'ADE, CLI_FATCPF, '
      
        '   CLI_FATENDERECO, CLI_FATESTADO, CLI_FATINSC_MUNICIPAL, CLI_FA' +
        'X, CLI_FONE, '
      
        '   CLI_FONE2, CLI_FORMA_PGTO, CLI_FORNECEDOR, CLI_FRETE, CLI_INF' +
        'O_OS, CLI_INSC_MUNICIPAL, '
      
        '   CLI_ISENTO_ICMS, CLI_ISS_RETIDO, CLI_LIMITE, CLI_LIMITE_CREDI' +
        'TO, CLI_LIMITE_PERMUTA, '
      
        '   CLI_MARGEM_LUCRO, CLI_NIVEL_DESCONTO, CLI_NOME, CLI_NOME_MAE,' +
        ' CLI_OBS, '
      
        '   CLI_ORG_PUBL_FEDERAL, CLI_PAG_PROGRAMADO, CLI_PAG1, CLI_PAG2,' +
        ' CLI_PAG3, '
      
        '   CLI_PAG4, CLI_PAG5, CLI_PAG6, CLI_PAG7, CLI_PAG8, CLI_PAG9, C' +
        'LI_PENULTIMA, '
      
        '   CLI_PESSOA, CLI_PONTO_REFERENCIA, CLI_PRAZO, CLI_QT_AVISOS_RE' +
        'CADASTROS, '
      
        '   CLI_REF_COMERCIAL, CLI_REF_COMERCIAL1, CLI_RESULT_ANTIPENUL, ' +
        'CLI_RESULT_PENULTIMA, '
      
        '   CLI_RESULT_ULTIMA, CLI_RG_MAE, CLI_SENHA, CLI_TRANSPORTADORA,' +
        ' CLI_ULTIMA, '
      
        '   CLI_USA_PROMOCAO, CLI_USA_TABELA, CLI_VENAGE, CLI_VENDEDOR, C' +
        'LI_WEB)'
      'values'
      
        '  (:CLI_AGE_BANCO, :CLI_AGE_BANCO1, :CLI_AGENCIA, :CLI_AGENCIA_B' +
        'ANCO, :CLI_ANTI_PENULTIMA, '
      
        '   :CLI_AREA_COMPENSACAO, :CLI_ATIVIDADE, :CLI_ATIVO, :CLI_ATUAL' +
        'IZA, :CLI_BAIRRO, '
      
        '   :CLI_BANCO, :CLI_BANCO1, :CLI_CADASTRO, :CLI_CARAC, :CLI_CEP,' +
        ' :CLI_CGC, '
      
        '   :CLI_CGF, :CLI_CIDADE, :CLI_COBBAIRRO, :CLI_COBCEP, :CLI_COBC' +
        'GC, :CLI_COBCGF, '
      
        '   :CLI_COBCIDADE, :CLI_COBCPF, :CLI_COBENDERECO, :CLI_COBESTADO' +
        ', :CLI_COBINSC_MUNICIPAL, '
      
        '   :CLI_COD_FORTTS, :CLI_CODIGO, :CLI_CODIGO_BANCO, :CLI_CONTA, ' +
        ':CLI_CONTA_COR, '
      
        '   :CLI_CONTA_COR1, :CLI_CONTA_FORTTS, :CLI_CONTROLE_INTERNO, :C' +
        'LI_CORTESIA_ACABAMENTO, '
      
        '   :CLI_CPF, :CLI_CREDIO_MOTIVO, :CLI_CREDITO, :CLI_DESC_M2, :CL' +
        'I_DESCONTO_ACABAMENTO, '
      
        '   :CLI_DIGI_VERIFICA, :CLI_DT_CADASTRO, :CLI_DT_RECADASTRO, :CL' +
        'I_DT_RETORNO, '
      
        '   :CLI_DT_VENDEDOR, :CLI_EMAIL, :CLI_ENDERECO, :CLI_ESTADO, :CL' +
        'I_FANTASIA, '
      
        '   :CLI_FATBAIRRO, :CLI_FATCEP, :CLI_FATCGC, :CLI_FATCGF, :CLI_F' +
        'ATCIDADE, '
      
        '   :CLI_FATCPF, :CLI_FATENDERECO, :CLI_FATESTADO, :CLI_FATINSC_M' +
        'UNICIPAL, '
      
        '   :CLI_FAX, :CLI_FONE, :CLI_FONE2, :CLI_FORMA_PGTO, :CLI_FORNEC' +
        'EDOR, :CLI_FRETE, '
      
        '   :CLI_INFO_OS, :CLI_INSC_MUNICIPAL, :CLI_ISENTO_ICMS, :CLI_ISS' +
        '_RETIDO, '
      
        '   :CLI_LIMITE, :CLI_LIMITE_CREDITO, :CLI_LIMITE_PERMUTA, :CLI_M' +
        'ARGEM_LUCRO, '
      
        '   :CLI_NIVEL_DESCONTO, :CLI_NOME, :CLI_NOME_MAE, :CLI_OBS, :CLI' +
        '_ORG_PUBL_FEDERAL, '
      
        '   :CLI_PAG_PROGRAMADO, :CLI_PAG1, :CLI_PAG2, :CLI_PAG3, :CLI_PA' +
        'G4, :CLI_PAG5, '
      
        '   :CLI_PAG6, :CLI_PAG7, :CLI_PAG8, :CLI_PAG9, :CLI_PENULTIMA, :' +
        'CLI_PESSOA, '
      
        '   :CLI_PONTO_REFERENCIA, :CLI_PRAZO, :CLI_QT_AVISOS_RECADASTROS' +
        ', :CLI_REF_COMERCIAL, '
      
        '   :CLI_REF_COMERCIAL1, :CLI_RESULT_ANTIPENUL, :CLI_RESULT_PENUL' +
        'TIMA, :CLI_RESULT_ULTIMA, '
      
        '   :CLI_RG_MAE, :CLI_SENHA, :CLI_TRANSPORTADORA, :CLI_ULTIMA, :C' +
        'LI_USA_PROMOCAO, '
      '   :CLI_USA_TABELA, :CLI_VENAGE, :CLI_VENDEDOR, :CLI_WEB)')
    DeleteSQL.Strings = (
      'delete from CLIENTE'
      'where'
      '  CLI_CODIGO = :OLD_CLI_CODIGO')
    Left = 352
    Top = 66
  end
  object qryDestino: TIBQuery
    Database = dm2.Database1
    Transaction = dm2.IBTransaction1
    SQL.Strings = (
      'SELECT * FROM CLIENTE')
    UpdateObject = updDestino
    Left = 320
    Top = 66
    object qryDestinoCLI_CODIGO: TIBStringField
      FieldName = 'CLI_CODIGO'
      Origin = '"CLIENTE"."CLI_CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 12
    end
    object qryDestinoCLI_PESSOA: TIBStringField
      FieldName = 'CLI_PESSOA'
      Origin = '"CLIENTE"."CLI_PESSOA"'
      Required = True
      Size = 1
    end
    object qryDestinoCLI_ESTADO: TIBStringField
      FieldName = 'CLI_ESTADO'
      Origin = '"CLIENTE"."CLI_ESTADO"'
      Size = 2
    end
    object qryDestinoCLI_CEP: TIBStringField
      FieldName = 'CLI_CEP'
      Origin = '"CLIENTE"."CLI_CEP"'
      Size = 8
    end
    object qryDestinoCLI_CPF: TIBStringField
      FieldName = 'CLI_CPF'
      Origin = '"CLIENTE"."CLI_CPF"'
      Size = 11
    end
    object qryDestinoCLI_CGC: TIBStringField
      FieldName = 'CLI_CGC'
      Origin = '"CLIENTE"."CLI_CGC"'
      Size = 14
    end
    object qryDestinoCLI_CGF: TIBStringField
      FieldName = 'CLI_CGF'
      Origin = '"CLIENTE"."CLI_CGF"'
      Size = 14
    end
    object qryDestinoCLI_AGENCIA: TIBStringField
      FieldName = 'CLI_AGENCIA'
      Origin = '"CLIENTE"."CLI_AGENCIA"'
      Size = 12
    end
    object qryDestinoCLI_FAX: TIBStringField
      FieldName = 'CLI_FAX'
      Origin = '"CLIENTE"."CLI_FAX"'
      Size = 12
    end
    object qryDestinoCLI_FATCEP: TIBStringField
      FieldName = 'CLI_FATCEP'
      Origin = '"CLIENTE"."CLI_FATCEP"'
      Size = 8
    end
    object qryDestinoCLI_FATESTADO: TIBStringField
      FieldName = 'CLI_FATESTADO'
      Origin = '"CLIENTE"."CLI_FATESTADO"'
      Size = 2
    end
    object qryDestinoCLI_FATCGC: TIBStringField
      FieldName = 'CLI_FATCGC'
      Origin = '"CLIENTE"."CLI_FATCGC"'
      Size = 14
    end
    object qryDestinoCLI_FATCGF: TIBStringField
      FieldName = 'CLI_FATCGF'
      Origin = '"CLIENTE"."CLI_FATCGF"'
      Size = 14
    end
    object qryDestinoCLI_CREDITO: TIBStringField
      FieldName = 'CLI_CREDITO'
      Origin = '"CLIENTE"."CLI_CREDITO"'
      Required = True
      Size = 1
    end
    object qryDestinoCLI_COBCEP: TIBStringField
      FieldName = 'CLI_COBCEP'
      Origin = '"CLIENTE"."CLI_COBCEP"'
      Size = 8
    end
    object qryDestinoCLI_COBESTADO: TIBStringField
      FieldName = 'CLI_COBESTADO'
      Origin = '"CLIENTE"."CLI_COBESTADO"'
      Size = 2
    end
    object qryDestinoCLI_COBCGC: TIBStringField
      FieldName = 'CLI_COBCGC'
      Origin = '"CLIENTE"."CLI_COBCGC"'
      Size = 14
    end
    object qryDestinoCLI_COBCGF: TIBStringField
      FieldName = 'CLI_COBCGF'
      Origin = '"CLIENTE"."CLI_COBCGF"'
      Size = 14
    end
    object qryDestinoCLI_FATCPF: TIBStringField
      FieldName = 'CLI_FATCPF'
      Origin = '"CLIENTE"."CLI_FATCPF"'
      Size = 14
    end
    object qryDestinoCLI_COBCPF: TIBStringField
      FieldName = 'CLI_COBCPF'
      Origin = '"CLIENTE"."CLI_COBCPF"'
      Size = 14
    end
    object qryDestinoCLI_VENAGE: TIBStringField
      FieldName = 'CLI_VENAGE'
      Origin = '"CLIENTE"."CLI_VENAGE"'
      Size = 10
    end
    object qryDestinoCLI_CARAC: TFloatField
      FieldName = 'CLI_CARAC'
      Origin = '"CLIENTE"."CLI_CARAC"'
    end
    object qryDestinoCLI_ANTI_PENULTIMA: TDateTimeField
      FieldName = 'CLI_ANTI_PENULTIMA'
      Origin = '"CLIENTE"."CLI_ANTI_PENULTIMA"'
    end
    object qryDestinoCLI_PENULTIMA: TDateTimeField
      FieldName = 'CLI_PENULTIMA'
      Origin = '"CLIENTE"."CLI_PENULTIMA"'
    end
    object qryDestinoCLI_ULTIMA: TDateTimeField
      FieldName = 'CLI_ULTIMA'
      Origin = '"CLIENTE"."CLI_ULTIMA"'
    end
    object qryDestinoCLI_RESULT_ULTIMA: TIBStringField
      FieldName = 'CLI_RESULT_ULTIMA'
      Origin = '"CLIENTE"."CLI_RESULT_ULTIMA"'
      Size = 100
    end
    object qryDestinoCLI_RESULT_PENULTIMA: TIBStringField
      FieldName = 'CLI_RESULT_PENULTIMA'
      Origin = '"CLIENTE"."CLI_RESULT_PENULTIMA"'
      Size = 100
    end
    object qryDestinoCLI_RESULT_ANTIPENUL: TIBStringField
      FieldName = 'CLI_RESULT_ANTIPENUL'
      Origin = '"CLIENTE"."CLI_RESULT_ANTIPENUL"'
      Size = 100
    end
    object qryDestinoCLI_DT_RETORNO: TDateTimeField
      FieldName = 'CLI_DT_RETORNO'
      Origin = '"CLIENTE"."CLI_DT_RETORNO"'
    end
    object qryDestinoCLI_VENDEDOR: TIBStringField
      FieldName = 'CLI_VENDEDOR'
      Origin = '"CLIENTE"."CLI_VENDEDOR"'
      Size = 10
    end
    object qryDestinoCLI_ATIVIDADE: TIBStringField
      FieldName = 'CLI_ATIVIDADE'
      Origin = '"CLIENTE"."CLI_ATIVIDADE"'
      Size = 10
    end
    object qryDestinoCLI_OBS: TMemoField
      FieldName = 'CLI_OBS'
      Origin = '"CLIENTE"."CLI_OBS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object qryDestinoCLI_FONE: TIBStringField
      FieldName = 'CLI_FONE'
      Origin = '"CLIENTE"."CLI_FONE"'
      Size = 12
    end
    object qryDestinoCLI_NOME: TIBStringField
      FieldName = 'CLI_NOME'
      Origin = '"CLIENTE"."CLI_NOME"'
      Required = True
      Size = 50
    end
    object qryDestinoCLI_ENDERECO: TIBStringField
      FieldName = 'CLI_ENDERECO'
      Origin = '"CLIENTE"."CLI_ENDERECO"'
      Required = True
      Size = 50
    end
    object qryDestinoCLI_FATENDERECO: TIBStringField
      FieldName = 'CLI_FATENDERECO'
      Origin = '"CLIENTE"."CLI_FATENDERECO"'
      Size = 50
    end
    object qryDestinoCLI_CIDADE: TIBStringField
      FieldName = 'CLI_CIDADE'
      Origin = '"CLIENTE"."CLI_CIDADE"'
      Size = 25
    end
    object qryDestinoCLI_BAIRRO: TIBStringField
      FieldName = 'CLI_BAIRRO'
      Origin = '"CLIENTE"."CLI_BAIRRO"'
      Size = 25
    end
    object qryDestinoCLI_FATBAIRRO: TIBStringField
      FieldName = 'CLI_FATBAIRRO'
      Origin = '"CLIENTE"."CLI_FATBAIRRO"'
      Size = 25
    end
    object qryDestinoCLI_FATCIDADE: TIBStringField
      FieldName = 'CLI_FATCIDADE'
      Origin = '"CLIENTE"."CLI_FATCIDADE"'
      Size = 25
    end
    object qryDestinoCLI_COBENDERECO: TIBStringField
      FieldName = 'CLI_COBENDERECO'
      Origin = '"CLIENTE"."CLI_COBENDERECO"'
      Size = 50
    end
    object qryDestinoCLI_COBBAIRRO: TIBStringField
      FieldName = 'CLI_COBBAIRRO'
      Origin = '"CLIENTE"."CLI_COBBAIRRO"'
      Size = 25
    end
    object qryDestinoCLI_COBCIDADE: TIBStringField
      FieldName = 'CLI_COBCIDADE'
      Origin = '"CLIENTE"."CLI_COBCIDADE"'
      Size = 25
    end
    object qryDestinoCLI_WEB: TIBStringField
      FieldName = 'CLI_WEB'
      Origin = '"CLIENTE"."CLI_WEB"'
      Size = 400
    end
    object qryDestinoCLI_EMAIL: TIBStringField
      FieldName = 'CLI_EMAIL'
      Origin = '"CLIENTE"."CLI_EMAIL"'
      Size = 400
    end
    object qryDestinoCLI_FANTASIA: TIBStringField
      FieldName = 'CLI_FANTASIA'
      Origin = '"CLIENTE"."CLI_FANTASIA"'
      Size = 50
    end
    object qryDestinoCLI_FONE2: TIBStringField
      FieldName = 'CLI_FONE2'
      Origin = '"CLIENTE"."CLI_FONE2"'
      Size = 12
    end
    object qryDestinoCLI_INSC_MUNICIPAL: TIBStringField
      FieldName = 'CLI_INSC_MUNICIPAL'
      Origin = '"CLIENTE"."CLI_INSC_MUNICIPAL"'
      Size = 14
    end
    object qryDestinoCLI_COBINSC_MUNICIPAL: TIBStringField
      FieldName = 'CLI_COBINSC_MUNICIPAL'
      Origin = '"CLIENTE"."CLI_COBINSC_MUNICIPAL"'
      Size = 14
    end
    object qryDestinoCLI_FATINSC_MUNICIPAL: TIBStringField
      FieldName = 'CLI_FATINSC_MUNICIPAL'
      Origin = '"CLIENTE"."CLI_FATINSC_MUNICIPAL"'
      Size = 14
    end
    object qryDestinoCLI_CREDIO_MOTIVO: TIBStringField
      FieldName = 'CLI_CREDIO_MOTIVO'
      Origin = '"CLIENTE"."CLI_CREDIO_MOTIVO"'
      Size = 50
    end
    object qryDestinoCLI_ISS_RETIDO: TIBStringField
      FieldName = 'CLI_ISS_RETIDO'
      Origin = '"CLIENTE"."CLI_ISS_RETIDO"'
      FixedChar = True
      Size = 1
    end
    object qryDestinoCLI_COD_FORTTS: TIBStringField
      FieldName = 'CLI_COD_FORTTS'
      Origin = '"CLIENTE"."CLI_COD_FORTTS"'
      Size = 10
    end
    object qryDestinoCLI_CONTA_FORTTS: TIBStringField
      FieldName = 'CLI_CONTA_FORTTS'
      Origin = '"CLIENTE"."CLI_CONTA_FORTTS"'
      Size = 10
    end
    object qryDestinoCLI_ORG_PUBL_FEDERAL: TIBStringField
      FieldName = 'CLI_ORG_PUBL_FEDERAL'
      Origin = '"CLIENTE"."CLI_ORG_PUBL_FEDERAL"'
      FixedChar = True
      Size = 1
    end
    object qryDestinoCLI_ISENTO_ICMS: TIBStringField
      FieldName = 'CLI_ISENTO_ICMS'
      Origin = '"CLIENTE"."CLI_ISENTO_ICMS"'
      FixedChar = True
      Size = 1
    end
    object qryDestinoCLI_LIMITE_CREDITO: TFloatField
      FieldName = 'CLI_LIMITE_CREDITO'
      Origin = '"CLIENTE"."CLI_LIMITE_CREDITO"'
    end
    object qryDestinoCLI_ATUALIZA: TIBStringField
      FieldName = 'CLI_ATUALIZA'
      Origin = '"CLIENTE"."CLI_ATUALIZA"'
      FixedChar = True
      Size = 1
    end
    object qryDestinoCLI_CODIGO_BANCO: TIBStringField
      FieldName = 'CLI_CODIGO_BANCO'
      Origin = '"CLIENTE"."CLI_CODIGO_BANCO"'
      Size = 3
    end
    object qryDestinoCLI_AREA_COMPENSACAO: TIBStringField
      FieldName = 'CLI_AREA_COMPENSACAO'
      Origin = '"CLIENTE"."CLI_AREA_COMPENSACAO"'
      Size = 3
    end
    object qryDestinoCLI_AGENCIA_BANCO: TIBStringField
      FieldName = 'CLI_AGENCIA_BANCO'
      Origin = '"CLIENTE"."CLI_AGENCIA_BANCO"'
    end
    object qryDestinoCLI_CONTA: TIBStringField
      FieldName = 'CLI_CONTA'
      Origin = '"CLIENTE"."CLI_CONTA"'
      Size = 14
    end
    object qryDestinoCLI_DIGI_VERIFICA: TIBStringField
      FieldName = 'CLI_DIGI_VERIFICA'
      Origin = '"CLIENTE"."CLI_DIGI_VERIFICA"'
      Size = 1
    end
    object qryDestinoCLI_CONTROLE_INTERNO: TIBStringField
      FieldName = 'CLI_CONTROLE_INTERNO'
      Origin = '"CLIENTE"."CLI_CONTROLE_INTERNO"'
      Size = 15
    end
    object qryDestinoCLI_LIMITE: TFloatField
      FieldName = 'CLI_LIMITE'
      Origin = '"CLIENTE"."CLI_LIMITE"'
    end
    object qryDestinoCLI_PRAZO: TIntegerField
      FieldName = 'CLI_PRAZO'
      Origin = '"CLIENTE"."CLI_PRAZO"'
    end
    object qryDestinoCLI_SENHA: TIBStringField
      FieldName = 'CLI_SENHA'
      Origin = '"CLIENTE"."CLI_SENHA"'
      Size = 9
    end
    object qryDestinoCLI_NIVEL_DESCONTO: TIntegerField
      FieldName = 'CLI_NIVEL_DESCONTO'
      Origin = '"CLIENTE"."CLI_NIVEL_DESCONTO"'
    end
    object qryDestinoCLI_BANCO: TIBStringField
      FieldName = 'CLI_BANCO'
      Origin = '"CLIENTE"."CLI_BANCO"'
    end
    object qryDestinoCLI_AGE_BANCO: TIBStringField
      FieldName = 'CLI_AGE_BANCO'
      Origin = '"CLIENTE"."CLI_AGE_BANCO"'
    end
    object qryDestinoCLI_CONTA_COR: TIBStringField
      FieldName = 'CLI_CONTA_COR'
      Origin = '"CLIENTE"."CLI_CONTA_COR"'
      Size = 14
    end
    object qryDestinoCLI_REF_COMERCIAL: TIBStringField
      FieldName = 'CLI_REF_COMERCIAL'
      Origin = '"CLIENTE"."CLI_REF_COMERCIAL"'
      Size = 50
    end
    object qryDestinoCLI_BANCO1: TIBStringField
      FieldName = 'CLI_BANCO1'
      Origin = '"CLIENTE"."CLI_BANCO1"'
    end
    object qryDestinoCLI_AGE_BANCO1: TIBStringField
      FieldName = 'CLI_AGE_BANCO1'
      Origin = '"CLIENTE"."CLI_AGE_BANCO1"'
    end
    object qryDestinoCLI_CONTA_COR1: TIBStringField
      FieldName = 'CLI_CONTA_COR1'
      Origin = '"CLIENTE"."CLI_CONTA_COR1"'
      Size = 14
    end
    object qryDestinoCLI_REF_COMERCIAL1: TIBStringField
      FieldName = 'CLI_REF_COMERCIAL1'
      Origin = '"CLIENTE"."CLI_REF_COMERCIAL1"'
      Size = 50
    end
    object qryDestinoCLI_PAG_PROGRAMADO: TIBStringField
      FieldName = 'CLI_PAG_PROGRAMADO'
      Origin = '"CLIENTE"."CLI_PAG_PROGRAMADO"'
      FixedChar = True
      Size = 1
    end
    object qryDestinoCLI_CADASTRO: TIBStringField
      FieldName = 'CLI_CADASTRO'
      Origin = '"CLIENTE"."CLI_CADASTRO"'
      FixedChar = True
      Size = 1
    end
    object qryDestinoCLI_LIMITE_PERMUTA: TFloatField
      FieldName = 'CLI_LIMITE_PERMUTA'
      Origin = '"CLIENTE"."CLI_LIMITE_PERMUTA"'
    end
    object qryDestinoCLI_FORNECEDOR: TIBStringField
      FieldName = 'CLI_FORNECEDOR'
      Origin = '"CLIENTE"."CLI_FORNECEDOR"'
      Size = 10
    end
    object qryDestinoCLI_DT_VENDEDOR: TDateTimeField
      FieldName = 'CLI_DT_VENDEDOR'
      Origin = '"CLIENTE"."CLI_DT_VENDEDOR"'
    end
    object qryDestinoCLI_TRANSPORTADORA: TIBStringField
      FieldName = 'CLI_TRANSPORTADORA'
      Origin = '"CLIENTE"."CLI_TRANSPORTADORA"'
      Size = 10
    end
    object qryDestinoCLI_DESC_M2: TFloatField
      FieldName = 'CLI_DESC_M2'
      Origin = '"CLIENTE"."CLI_DESC_M2"'
    end
    object qryDestinoCLI_FRETE: TIBStringField
      FieldName = 'CLI_FRETE'
      Origin = '"CLIENTE"."CLI_FRETE"'
      FixedChar = True
      Size = 1
    end
    object qryDestinoCLI_CORTESIA_ACABAMENTO: TIBStringField
      FieldName = 'CLI_CORTESIA_ACABAMENTO'
      Origin = '"CLIENTE"."CLI_CORTESIA_ACABAMENTO"'
      FixedChar = True
      Size = 1
    end
    object qryDestinoCLI_DESCONTO_ACABAMENTO: TFloatField
      FieldName = 'CLI_DESCONTO_ACABAMENTO'
      Origin = '"CLIENTE"."CLI_DESCONTO_ACABAMENTO"'
    end
    object qryDestinoCLI_PAG1: TFloatField
      FieldName = 'CLI_PAG1'
      Origin = '"CLIENTE"."CLI_PAG1"'
    end
    object qryDestinoCLI_PAG2: TFloatField
      FieldName = 'CLI_PAG2'
      Origin = '"CLIENTE"."CLI_PAG2"'
    end
    object qryDestinoCLI_PAG3: TFloatField
      FieldName = 'CLI_PAG3'
      Origin = '"CLIENTE"."CLI_PAG3"'
    end
    object qryDestinoCLI_PAG4: TFloatField
      FieldName = 'CLI_PAG4'
      Origin = '"CLIENTE"."CLI_PAG4"'
    end
    object qryDestinoCLI_PAG5: TFloatField
      FieldName = 'CLI_PAG5'
      Origin = '"CLIENTE"."CLI_PAG5"'
    end
    object qryDestinoCLI_PAG6: TFloatField
      FieldName = 'CLI_PAG6'
      Origin = '"CLIENTE"."CLI_PAG6"'
    end
    object qryDestinoCLI_PAG7: TFloatField
      FieldName = 'CLI_PAG7'
      Origin = '"CLIENTE"."CLI_PAG7"'
    end
    object qryDestinoCLI_PAG8: TFloatField
      FieldName = 'CLI_PAG8'
      Origin = '"CLIENTE"."CLI_PAG8"'
    end
    object qryDestinoCLI_PAG9: TFloatField
      FieldName = 'CLI_PAG9'
      Origin = '"CLIENTE"."CLI_PAG9"'
    end
    object qryDestinoCLI_FORMA_PGTO: TIntegerField
      FieldName = 'CLI_FORMA_PGTO'
      Origin = '"CLIENTE"."CLI_FORMA_PGTO"'
    end
    object qryDestinoCLI_MARGEM_LUCRO: TFloatField
      FieldName = 'CLI_MARGEM_LUCRO'
      Origin = '"CLIENTE"."CLI_MARGEM_LUCRO"'
    end
    object qryDestinoCLI_ATIVO: TIBStringField
      FieldName = 'CLI_ATIVO'
      Origin = '"CLIENTE"."CLI_ATIVO"'
      FixedChar = True
      Size = 1
    end
    object qryDestinoCLI_USA_PROMOCAO: TIBStringField
      FieldName = 'CLI_USA_PROMOCAO'
      Origin = '"CLIENTE"."CLI_USA_PROMOCAO"'
      FixedChar = True
      Size = 1
    end
    object qryDestinoCLI_DT_CADASTRO: TDateTimeField
      FieldName = 'CLI_DT_CADASTRO'
      Origin = '"CLIENTE"."CLI_DT_CADASTRO"'
    end
    object qryDestinoCLI_DT_RECADASTRO: TDateTimeField
      FieldName = 'CLI_DT_RECADASTRO'
      Origin = '"CLIENTE"."CLI_DT_RECADASTRO"'
    end
    object qryDestinoCLI_QT_AVISOS_RECADASTROS: TIntegerField
      FieldName = 'CLI_QT_AVISOS_RECADASTROS'
      Origin = '"CLIENTE"."CLI_QT_AVISOS_RECADASTROS"'
    end
    object qryDestinoCLI_NOME_MAE: TIBStringField
      FieldName = 'CLI_NOME_MAE'
      Origin = '"CLIENTE"."CLI_NOME_MAE"'
      Size = 60
    end
    object qryDestinoCLI_RG_MAE: TIBStringField
      FieldName = 'CLI_RG_MAE'
      Origin = '"CLIENTE"."CLI_RG_MAE"'
      Size = 14
    end
    object qryDestinoCLI_PONTO_REFERENCIA: TIBStringField
      FieldName = 'CLI_PONTO_REFERENCIA'
      Origin = '"CLIENTE"."CLI_PONTO_REFERENCIA"'
      Size = 40
    end
    object qryDestinoCLI_USA_TABELA: TIBStringField
      FieldName = 'CLI_USA_TABELA'
      Origin = '"CLIENTE"."CLI_USA_TABELA"'
      FixedChar = True
      Size = 1
    end
    object qryDestinoCLI_INFO_OS: TIBStringField
      FieldName = 'CLI_INFO_OS'
      Origin = '"CLIENTE"."CLI_INFO_OS"'
      Size = 1000
    end
  end
  object qryContas_Receber: TIBQuery
    Database = dm2.Database1
    Transaction = dm2.IBTransaction1
    SQL.Strings = (
      'SELECT * FROM CONTAS_RECEBER')
    UpdateObject = updContas_Receber
    Left = 320
    Top = 93
    object qryContas_ReceberCTR_SEQUENCIA: TIBStringField
      FieldName = 'CTR_SEQUENCIA'
      Origin = '"CONTAS_RECEBER"."CTR_SEQUENCIA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object qryContas_ReceberCTR_DUPLICATA: TIBStringField
      FieldName = 'CTR_DUPLICATA'
      Origin = '"CONTAS_RECEBER"."CTR_DUPLICATA"'
      Size = 12
    end
    object qryContas_ReceberCTR_CENTRO_CUSTO: TIBStringField
      FieldName = 'CTR_CENTRO_CUSTO'
      Origin = '"CONTAS_RECEBER"."CTR_CENTRO_CUSTO"'
      Size = 2
    end
    object qryContas_ReceberCTR_CSETOR: TIBStringField
      FieldName = 'CTR_CSETOR'
      Origin = '"CONTAS_RECEBER"."CTR_CSETOR"'
      Size = 2
    end
    object qryContas_ReceberCTR_SETOR: TIBStringField
      FieldName = 'CTR_SETOR'
      Origin = '"CONTAS_RECEBER"."CTR_SETOR"'
      Size = 2
    end
    object qryContas_ReceberCTR_CONT_TIT: TIBStringField
      FieldName = 'CTR_CONT_TIT'
      Origin = '"CONTAS_RECEBER"."CTR_CONT_TIT"'
      Size = 1
    end
    object qryContas_ReceberCTR_SUBCONTA: TIBStringField
      FieldName = 'CTR_SUBCONTA'
      Origin = '"CONTAS_RECEBER"."CTR_SUBCONTA"'
      Size = 2
    end
    object qryContas_ReceberCTR_CONT_SINT: TIBStringField
      FieldName = 'CTR_CONT_SINT'
      Origin = '"CONTAS_RECEBER"."CTR_CONT_SINT"'
      Size = 3
    end
    object qryContas_ReceberCTR_CONTA: TIBStringField
      FieldName = 'CTR_CONTA'
      Origin = '"CONTAS_RECEBER"."CTR_CONTA"'
      Size = 3
    end
    object qryContas_ReceberCTR_DETALHE: TIBStringField
      FieldName = 'CTR_DETALHE'
      Origin = '"CONTAS_RECEBER"."CTR_DETALHE"'
      Size = 3
    end
    object qryContas_ReceberCTR_EMISSAO: TDateTimeField
      FieldName = 'CTR_EMISSAO'
      Origin = '"CONTAS_RECEBER"."CTR_EMISSAO"'
    end
    object qryContas_ReceberCTR_VENCIMENTO: TDateTimeField
      FieldName = 'CTR_VENCIMENTO'
      Origin = '"CONTAS_RECEBER"."CTR_VENCIMENTO"'
    end
    object qryContas_ReceberCTR_VR_DEBITO: TFloatField
      FieldName = 'CTR_VR_DEBITO'
      Origin = '"CONTAS_RECEBER"."CTR_VR_DEBITO"'
    end
    object qryContas_ReceberCTR_CLIENTE: TIBStringField
      FieldName = 'CTR_CLIENTE'
      Origin = '"CONTAS_RECEBER"."CTR_CLIENTE"'
      Size = 12
    end
    object qryContas_ReceberCTR_APRESENTA: TIBStringField
      FieldName = 'CTR_APRESENTA'
      Origin = '"CONTAS_RECEBER"."CTR_APRESENTA"'
      Size = 1
    end
    object qryContas_ReceberCTR_BANCO: TIBStringField
      FieldName = 'CTR_BANCO'
      Origin = '"CONTAS_RECEBER"."CTR_BANCO"'
      Size = 3
    end
    object qryContas_ReceberCTR_DT_BANCO: TDateTimeField
      FieldName = 'CTR_DT_BANCO'
      Origin = '"CONTAS_RECEBER"."CTR_DT_BANCO"'
    end
    object qryContas_ReceberCTR_DT_RETORNO_BANC: TDateTimeField
      FieldName = 'CTR_DT_RETORNO_BANC'
      Origin = '"CONTAS_RECEBER"."CTR_DT_RETORNO_BANC"'
    end
    object qryContas_ReceberCTR_DOC_BANCO: TIBStringField
      FieldName = 'CTR_DOC_BANCO'
      Origin = '"CONTAS_RECEBER"."CTR_DOC_BANCO"'
    end
    object qryContas_ReceberCTR_AGENTE: TIBStringField
      FieldName = 'CTR_AGENTE'
      Origin = '"CONTAS_RECEBER"."CTR_AGENTE"'
      Size = 2
    end
    object qryContas_ReceberCTR_DT_COBRANCA: TDateTimeField
      FieldName = 'CTR_DT_COBRANCA'
      Origin = '"CONTAS_RECEBER"."CTR_DT_COBRANCA"'
    end
    object qryContas_ReceberCTR_DT_RETORNO_COBR: TDateTimeField
      FieldName = 'CTR_DT_RETORNO_COBR'
      Origin = '"CONTAS_RECEBER"."CTR_DT_RETORNO_COBR"'
    end
    object qryContas_ReceberCTR_DOC_COBR: TIBStringField
      FieldName = 'CTR_DOC_COBR'
      Origin = '"CONTAS_RECEBER"."CTR_DOC_COBR"'
      Size = 10
    end
    object qryContas_ReceberCTR_CARTORIO: TIBStringField
      FieldName = 'CTR_CARTORIO'
      Origin = '"CONTAS_RECEBER"."CTR_CARTORIO"'
      Size = 2
    end
    object qryContas_ReceberCTR_DT_CARTORIO: TDateTimeField
      FieldName = 'CTR_DT_CARTORIO'
      Origin = '"CONTAS_RECEBER"."CTR_DT_CARTORIO"'
    end
    object qryContas_ReceberCTR_DT_RETORNO_CART: TDateTimeField
      FieldName = 'CTR_DT_RETORNO_CART'
      Origin = '"CONTAS_RECEBER"."CTR_DT_RETORNO_CART"'
    end
    object qryContas_ReceberCTR_DOC_CART: TIBStringField
      FieldName = 'CTR_DOC_CART'
      Origin = '"CONTAS_RECEBER"."CTR_DOC_CART"'
    end
    object qryContas_ReceberCTR_SITUACAO: TIBStringField
      FieldName = 'CTR_SITUACAO'
      Origin = '"CONTAS_RECEBER"."CTR_SITUACAO"'
      Size = 1
    end
    object qryContas_ReceberCTR_ORIGEM: TIBStringField
      FieldName = 'CTR_ORIGEM'
      Origin = '"CONTAS_RECEBER"."CTR_ORIGEM"'
      Size = 1
    end
    object qryContas_ReceberCTR_TOTAL_CREDITO: TFloatField
      FieldName = 'CTR_TOTAL_CREDITO'
      Origin = '"CONTAS_RECEBER"."CTR_TOTAL_CREDITO"'
    end
    object qryContas_ReceberCTR_HISTORICO: TIBStringField
      FieldName = 'CTR_HISTORICO'
      Origin = '"CONTAS_RECEBER"."CTR_HISTORICO"'
      Size = 60
    end
    object qryContas_ReceberCTR_NUM_DOCUMENTO: TIBStringField
      FieldName = 'CTR_NUM_DOCUMENTO'
      Origin = '"CONTAS_RECEBER"."CTR_NUM_DOCUMENTO"'
      Size = 12
    end
    object qryContas_ReceberCTR_TIPONF: TIBStringField
      FieldName = 'CTR_TIPONF'
      Origin = '"CONTAS_RECEBER"."CTR_TIPONF"'
      Size = 1
    end
    object qryContas_ReceberCTR_NOTAFISCAL: TIBStringField
      FieldName = 'CTR_NOTAFISCAL'
      Origin = '"CONTAS_RECEBER"."CTR_NOTAFISCAL"'
      Size = 6
    end
    object qryContas_ReceberCTR_BORDERO: TIntegerField
      FieldName = 'CTR_BORDERO'
      Origin = '"CONTAS_RECEBER"."CTR_BORDERO"'
    end
    object qryContas_ReceberCTR_COBDESC_TIPO: TIBStringField
      FieldName = 'CTR_COBDESC_TIPO'
      Origin = '"CONTAS_RECEBER"."CTR_COBDESC_TIPO"'
      Size = 1
    end
    object qryContas_ReceberCTR_COBDESC_CHEQUE: TIBStringField
      FieldName = 'CTR_COBDESC_CHEQUE'
      Origin = '"CONTAS_RECEBER"."CTR_COBDESC_CHEQUE"'
      Size = 12
    end
    object qryContas_ReceberCTR_COBDESC_BANCO: TIBStringField
      FieldName = 'CTR_COBDESC_BANCO'
      Origin = '"CONTAS_RECEBER"."CTR_COBDESC_BANCO"'
      Size = 30
    end
    object qryContas_ReceberCTR_COBDESC_AGENCIA: TIBStringField
      FieldName = 'CTR_COBDESC_AGENCIA'
      Origin = '"CONTAS_RECEBER"."CTR_COBDESC_AGENCIA"'
      Size = 10
    end
    object qryContas_ReceberCTR_FLG: TIBStringField
      FieldName = 'CTR_FLG'
      Origin = '"CONTAS_RECEBER"."CTR_FLG"'
      FixedChar = True
      Size = 1
    end
    object qryContas_ReceberCTR_OCULT_1: TIBStringField
      FieldName = 'CTR_OCULT_1'
      Origin = '"CONTAS_RECEBER"."CTR_OCULT_1"'
      FixedChar = True
      Size = 1
    end
    object qryContas_ReceberCTR_TIPO_LANC: TIBStringField
      FieldName = 'CTR_TIPO_LANC'
      Origin = '"CONTAS_RECEBER"."CTR_TIPO_LANC"'
      Size = 1
    end
    object qryContas_ReceberCTR_VR_DESCONTO: TFloatField
      FieldName = 'CTR_VR_DESCONTO'
      Origin = '"CONTAS_RECEBER"."CTR_VR_DESCONTO"'
    end
    object qryContas_ReceberCTR_TIPO_CREDITO: TIBStringField
      FieldName = 'CTR_TIPO_CREDITO'
      Origin = '"CONTAS_RECEBER"."CTR_TIPO_CREDITO"'
      FixedChar = True
      Size = 1
    end
    object qryContas_ReceberCTR_DEBITO: TIBStringField
      FieldName = 'CTR_DEBITO'
      Origin = '"CONTAS_RECEBER"."CTR_DEBITO"'
      FixedChar = True
      Size = 1
    end
    object qryContas_ReceberCTR_DTREMESSA: TDateTimeField
      FieldName = 'CTR_DTREMESSA'
      Origin = '"CONTAS_RECEBER"."CTR_DTREMESSA"'
    end
    object qryContas_ReceberCTR_PDV_DOCUMENTO: TIBStringField
      FieldName = 'CTR_PDV_DOCUMENTO'
      Origin = '"CONTAS_RECEBER"."CTR_PDV_DOCUMENTO"'
      Size = 8
    end
    object qryContas_ReceberCTR_ADMIN_CARTAO: TIntegerField
      FieldName = 'CTR_ADMIN_CARTAO'
      Origin = '"CONTAS_RECEBER"."CTR_ADMIN_CARTAO"'
    end
    object qryContas_ReceberCTR_LOTE_CARTAO: TIntegerField
      FieldName = 'CTR_LOTE_CARTAO'
      Origin = '"CONTAS_RECEBER"."CTR_LOTE_CARTAO"'
    end
    object qryContas_ReceberCTR_ORCAMENTO: TIBStringField
      FieldName = 'CTR_ORCAMENTO'
      Origin = '"CONTAS_RECEBER"."CTR_ORCAMENTO"'
      Size = 6
    end
    object qryContas_ReceberCTR_PDV_ADIANT: TIBStringField
      FieldName = 'CTR_PDV_ADIANT'
      Origin = '"CONTAS_RECEBER"."CTR_PDV_ADIANT"'
      Size = 6
    end
    object qryContas_ReceberCTR_MES_ANO_REF: TIBStringField
      FieldName = 'CTR_MES_ANO_REF'
      Origin = '"CONTAS_RECEBER"."CTR_MES_ANO_REF"'
      Size = 6
    end
    object qryContas_ReceberCTR_RECIBO_PROVISORIO: TIBStringField
      FieldName = 'CTR_RECIBO_PROVISORIO'
      Origin = '"CONTAS_RECEBER"."CTR_RECIBO_PROVISORIO"'
      Size = 10
    end
    object qryContas_ReceberCTR_PEDIDO: TIBStringField
      FieldName = 'CTR_PEDIDO'
      Origin = '"CONTAS_RECEBER"."CTR_PEDIDO"'
      Size = 6
    end
    object qryContas_ReceberCTR_DT_BOLETO: TDateTimeField
      FieldName = 'CTR_DT_BOLETO'
      Origin = '"CONTAS_RECEBER"."CTR_DT_BOLETO"'
    end
    object qryContas_ReceberCTR_DT_RECIBO_PROV: TDateTimeField
      FieldName = 'CTR_DT_RECIBO_PROV'
      Origin = '"CONTAS_RECEBER"."CTR_DT_RECIBO_PROV"'
    end
    object qryContas_ReceberCTR_NUM_CONTRATO: TIntegerField
      FieldName = 'CTR_NUM_CONTRATO'
      Origin = '"CONTAS_RECEBER"."CTR_NUM_CONTRATO"'
    end
    object qryContas_ReceberCTR_TIPO_CONTRATO: TIntegerField
      FieldName = 'CTR_TIPO_CONTRATO'
      Origin = '"CONTAS_RECEBER"."CTR_TIPO_CONTRATO"'
    end
    object qryContas_ReceberCTR_ADITIVO_CONTRATO: TIntegerField
      FieldName = 'CTR_ADITIVO_CONTRATO'
      Origin = '"CONTAS_RECEBER"."CTR_ADITIVO_CONTRATO"'
    end
    object qryContas_ReceberCTR_SEQ_PILATIS: TIntegerField
      FieldName = 'CTR_SEQ_PILATIS'
      Origin = '"CONTAS_RECEBER"."CTR_SEQ_PILATIS"'
    end
    object qryContas_ReceberCTR_COD_CHEQUE_PILATIS: TIBStringField
      FieldName = 'CTR_COD_CHEQUE_PILATIS'
      Origin = '"CONTAS_RECEBER"."CTR_COD_CHEQUE_PILATIS"'
      Size = 10
    end
    object qryContas_ReceberCTR_NUMERO_OS: TIBStringField
      FieldName = 'CTR_NUMERO_OS'
      Origin = '"CONTAS_RECEBER"."CTR_NUMERO_OS"'
      Size = 6
    end
    object qryContas_ReceberCTR_OS_SEQ: TIBStringField
      FieldName = 'CTR_OS_SEQ'
      Origin = '"CONTAS_RECEBER"."CTR_OS_SEQ"'
      Size = 3
    end
    object qryContas_ReceberCTR_CAIXA: TIBStringField
      FieldName = 'CTR_CAIXA'
      Origin = '"CONTAS_RECEBER"."CTR_CAIXA"'
      Size = 3
    end
  end
  object updContas_Receber: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CTR_SEQUENCIA,'
      '  CTR_DUPLICATA,'
      '  CTR_CENTRO_CUSTO,'
      '  CTR_CSETOR,'
      '  CTR_SETOR,'
      '  CTR_CONT_TIT,'
      '  CTR_SUBCONTA,'
      '  CTR_CONT_SINT,'
      '  CTR_CONTA,'
      '  CTR_DETALHE,'
      '  CTR_EMISSAO,'
      '  CTR_VENCIMENTO,'
      '  CTR_VR_DEBITO,'
      '  CTR_CLIENTE,'
      '  CTR_APRESENTA,'
      '  CTR_BANCO,'
      '  CTR_DT_BANCO,'
      '  CTR_DT_RETORNO_BANC,'
      '  CTR_DOC_BANCO,'
      '  CTR_AGENTE,'
      '  CTR_DT_COBRANCA,'
      '  CTR_DT_RETORNO_COBR,'
      '  CTR_DOC_COBR,'
      '  CTR_CARTORIO,'
      '  CTR_DT_CARTORIO,'
      '  CTR_DT_RETORNO_CART,'
      '  CTR_DOC_CART,'
      '  CTR_SITUACAO,'
      '  CTR_ORIGEM,'
      '  CTR_TOTAL_CREDITO,'
      '  CTR_HISTORICO,'
      '  CTR_NUM_DOCUMENTO,'
      '  CTR_TIPONF,'
      '  CTR_NOTAFISCAL,'
      '  CTR_BORDERO,'
      '  CTR_COBDESC_TIPO,'
      '  CTR_COBDESC_CHEQUE,'
      '  CTR_COBDESC_BANCO,'
      '  CTR_COBDESC_AGENCIA,'
      '  CTR_FLG,'
      '  CTR_OCULT_1,'
      '  CTR_TIPO_LANC,'
      '  CTR_VR_DESCONTO,'
      '  CTR_TIPO_CREDITO,'
      '  CTR_DEBITO,'
      '  CTR_DTREMESSA,'
      '  CTR_PDV_DOCUMENTO,'
      '  CTR_ADMIN_CARTAO,'
      '  CTR_LOTE_CARTAO,'
      '  CTR_ORCAMENTO,'
      '  CTR_PDV_ADIANT,'
      '  CTR_MES_ANO_REF,'
      '  CTR_RECIBO_PROVISORIO,'
      '  CTR_PEDIDO,'
      '  CTR_DT_BOLETO,'
      '  CTR_DT_RECIBO_PROV,'
      '  CTR_NUM_CONTRATO,'
      '  CTR_TIPO_CONTRATO,'
      '  CTR_ADITIVO_CONTRATO,'
      '  CTR_SEQ_PILATIS,'
      '  CTR_COD_CHEQUE_PILATIS,'
      '  CTR_NUMERO_OS,'
      '  CTR_OS_SEQ,'
      '  CTR_CAIXA'
      'from CONTAS_RECEBER '
      'where'
      '  CTR_SEQUENCIA = :CTR_SEQUENCIA')
    ModifySQL.Strings = (
      'update CONTAS_RECEBER'
      'set'
      '  CTR_ADITIVO_CONTRATO = :CTR_ADITIVO_CONTRATO,'
      '  CTR_ADMIN_CARTAO = :CTR_ADMIN_CARTAO,'
      '  CTR_AGENTE = :CTR_AGENTE,'
      '  CTR_APRESENTA = :CTR_APRESENTA,'
      '  CTR_BANCO = :CTR_BANCO,'
      '  CTR_BORDERO = :CTR_BORDERO,'
      '  CTR_CAIXA = :CTR_CAIXA,'
      '  CTR_CARTORIO = :CTR_CARTORIO,'
      '  CTR_CENTRO_CUSTO = :CTR_CENTRO_CUSTO,'
      '  CTR_CLIENTE = :CTR_CLIENTE,'
      '  CTR_COBDESC_AGENCIA = :CTR_COBDESC_AGENCIA,'
      '  CTR_COBDESC_BANCO = :CTR_COBDESC_BANCO,'
      '  CTR_COBDESC_CHEQUE = :CTR_COBDESC_CHEQUE,'
      '  CTR_COBDESC_TIPO = :CTR_COBDESC_TIPO,'
      '  CTR_COD_CHEQUE_PILATIS = :CTR_COD_CHEQUE_PILATIS,'
      '  CTR_CONT_SINT = :CTR_CONT_SINT,'
      '  CTR_CONT_TIT = :CTR_CONT_TIT,'
      '  CTR_CONTA = :CTR_CONTA,'
      '  CTR_CSETOR = :CTR_CSETOR,'
      '  CTR_DEBITO = :CTR_DEBITO,'
      '  CTR_DETALHE = :CTR_DETALHE,'
      '  CTR_DOC_BANCO = :CTR_DOC_BANCO,'
      '  CTR_DOC_CART = :CTR_DOC_CART,'
      '  CTR_DOC_COBR = :CTR_DOC_COBR,'
      '  CTR_DT_BANCO = :CTR_DT_BANCO,'
      '  CTR_DT_BOLETO = :CTR_DT_BOLETO,'
      '  CTR_DT_CARTORIO = :CTR_DT_CARTORIO,'
      '  CTR_DT_COBRANCA = :CTR_DT_COBRANCA,'
      '  CTR_DT_RECIBO_PROV = :CTR_DT_RECIBO_PROV,'
      '  CTR_DT_RETORNO_BANC = :CTR_DT_RETORNO_BANC,'
      '  CTR_DT_RETORNO_CART = :CTR_DT_RETORNO_CART,'
      '  CTR_DT_RETORNO_COBR = :CTR_DT_RETORNO_COBR,'
      '  CTR_DTREMESSA = :CTR_DTREMESSA,'
      '  CTR_DUPLICATA = :CTR_DUPLICATA,'
      '  CTR_EMISSAO = :CTR_EMISSAO,'
      '  CTR_FLG = :CTR_FLG,'
      '  CTR_HISTORICO = :CTR_HISTORICO,'
      '  CTR_LOTE_CARTAO = :CTR_LOTE_CARTAO,'
      '  CTR_MES_ANO_REF = :CTR_MES_ANO_REF,'
      '  CTR_NOTAFISCAL = :CTR_NOTAFISCAL,'
      '  CTR_NUM_CONTRATO = :CTR_NUM_CONTRATO,'
      '  CTR_NUM_DOCUMENTO = :CTR_NUM_DOCUMENTO,'
      '  CTR_NUMERO_OS = :CTR_NUMERO_OS,'
      '  CTR_OCULT_1 = :CTR_OCULT_1,'
      '  CTR_ORCAMENTO = :CTR_ORCAMENTO,'
      '  CTR_ORIGEM = :CTR_ORIGEM,'
      '  CTR_OS_SEQ = :CTR_OS_SEQ,'
      '  CTR_PDV_ADIANT = :CTR_PDV_ADIANT,'
      '  CTR_PDV_DOCUMENTO = :CTR_PDV_DOCUMENTO,'
      '  CTR_PEDIDO = :CTR_PEDIDO,'
      '  CTR_RECIBO_PROVISORIO = :CTR_RECIBO_PROVISORIO,'
      '  CTR_SEQ_PILATIS = :CTR_SEQ_PILATIS,'
      '  CTR_SEQUENCIA = :CTR_SEQUENCIA,'
      '  CTR_SETOR = :CTR_SETOR,'
      '  CTR_SITUACAO = :CTR_SITUACAO,'
      '  CTR_SUBCONTA = :CTR_SUBCONTA,'
      '  CTR_TIPO_CONTRATO = :CTR_TIPO_CONTRATO,'
      '  CTR_TIPO_CREDITO = :CTR_TIPO_CREDITO,'
      '  CTR_TIPO_LANC = :CTR_TIPO_LANC,'
      '  CTR_TIPONF = :CTR_TIPONF,'
      '  CTR_TOTAL_CREDITO = :CTR_TOTAL_CREDITO,'
      '  CTR_VENCIMENTO = :CTR_VENCIMENTO,'
      '  CTR_VR_DEBITO = :CTR_VR_DEBITO,'
      '  CTR_VR_DESCONTO = :CTR_VR_DESCONTO'
      'where'
      '  CTR_SEQUENCIA = :OLD_CTR_SEQUENCIA')
    InsertSQL.Strings = (
      'insert into CONTAS_RECEBER'
      
        '  (CTR_ADITIVO_CONTRATO, CTR_ADMIN_CARTAO, CTR_AGENTE, CTR_APRES' +
        'ENTA, CTR_BANCO, '
      
        '   CTR_BORDERO, CTR_CAIXA, CTR_CARTORIO, CTR_CENTRO_CUSTO, CTR_C' +
        'LIENTE, '
      
        '   CTR_COBDESC_AGENCIA, CTR_COBDESC_BANCO, CTR_COBDESC_CHEQUE, C' +
        'TR_COBDESC_TIPO, '
      
        '   CTR_COD_CHEQUE_PILATIS, CTR_CONT_SINT, CTR_CONT_TIT, CTR_CONT' +
        'A, CTR_CSETOR, '
      
        '   CTR_DEBITO, CTR_DETALHE, CTR_DOC_BANCO, CTR_DOC_CART, CTR_DOC' +
        '_COBR, '
      
        '   CTR_DT_BANCO, CTR_DT_BOLETO, CTR_DT_CARTORIO, CTR_DT_COBRANCA' +
        ', CTR_DT_RECIBO_PROV, '
      
        '   CTR_DT_RETORNO_BANC, CTR_DT_RETORNO_CART, CTR_DT_RETORNO_COBR' +
        ', CTR_DTREMESSA, '
      
        '   CTR_DUPLICATA, CTR_EMISSAO, CTR_FLG, CTR_HISTORICO, CTR_LOTE_' +
        'CARTAO, '
      
        '   CTR_MES_ANO_REF, CTR_NOTAFISCAL, CTR_NUM_CONTRATO, CTR_NUM_DO' +
        'CUMENTO, '
      
        '   CTR_NUMERO_OS, CTR_OCULT_1, CTR_ORCAMENTO, CTR_ORIGEM, CTR_OS' +
        '_SEQ, CTR_PDV_ADIANT, '
      
        '   CTR_PDV_DOCUMENTO, CTR_PEDIDO, CTR_RECIBO_PROVISORIO, CTR_SEQ' +
        '_PILATIS, '
      
        '   CTR_SEQUENCIA, CTR_SETOR, CTR_SITUACAO, CTR_SUBCONTA, CTR_TIP' +
        'O_CONTRATO, '
      
        '   CTR_TIPO_CREDITO, CTR_TIPO_LANC, CTR_TIPONF, CTR_TOTAL_CREDIT' +
        'O, CTR_VENCIMENTO, '
      '   CTR_VR_DEBITO, CTR_VR_DESCONTO)'
      'values'
      
        '  (:CTR_ADITIVO_CONTRATO, :CTR_ADMIN_CARTAO, :CTR_AGENTE, :CTR_A' +
        'PRESENTA, '
      
        '   :CTR_BANCO, :CTR_BORDERO, :CTR_CAIXA, :CTR_CARTORIO, :CTR_CEN' +
        'TRO_CUSTO, '
      
        '   :CTR_CLIENTE, :CTR_COBDESC_AGENCIA, :CTR_COBDESC_BANCO, :CTR_' +
        'COBDESC_CHEQUE, '
      
        '   :CTR_COBDESC_TIPO, :CTR_COD_CHEQUE_PILATIS, :CTR_CONT_SINT, :' +
        'CTR_CONT_TIT, '
      
        '   :CTR_CONTA, :CTR_CSETOR, :CTR_DEBITO, :CTR_DETALHE, :CTR_DOC_' +
        'BANCO, '
      
        '   :CTR_DOC_CART, :CTR_DOC_COBR, :CTR_DT_BANCO, :CTR_DT_BOLETO, ' +
        ':CTR_DT_CARTORIO, '
      
        '   :CTR_DT_COBRANCA, :CTR_DT_RECIBO_PROV, :CTR_DT_RETORNO_BANC, ' +
        ':CTR_DT_RETORNO_CART, '
      
        '   :CTR_DT_RETORNO_COBR, :CTR_DTREMESSA, :CTR_DUPLICATA, :CTR_EM' +
        'ISSAO, '
      
        '   :CTR_FLG, :CTR_HISTORICO, :CTR_LOTE_CARTAO, :CTR_MES_ANO_REF,' +
        ' :CTR_NOTAFISCAL, '
      
        '   :CTR_NUM_CONTRATO, :CTR_NUM_DOCUMENTO, :CTR_NUMERO_OS, :CTR_O' +
        'CULT_1, '
      
        '   :CTR_ORCAMENTO, :CTR_ORIGEM, :CTR_OS_SEQ, :CTR_PDV_ADIANT, :C' +
        'TR_PDV_DOCUMENTO, '
      
        '   :CTR_PEDIDO, :CTR_RECIBO_PROVISORIO, :CTR_SEQ_PILATIS, :CTR_S' +
        'EQUENCIA, '
      
        '   :CTR_SETOR, :CTR_SITUACAO, :CTR_SUBCONTA, :CTR_TIPO_CONTRATO,' +
        ' :CTR_TIPO_CREDITO, '
      
        '   :CTR_TIPO_LANC, :CTR_TIPONF, :CTR_TOTAL_CREDITO, :CTR_VENCIME' +
        'NTO, :CTR_VR_DEBITO, '
      '   :CTR_VR_DESCONTO)')
    DeleteSQL.Strings = (
      'delete from CONTAS_RECEBER'
      'where'
      '  CTR_SEQUENCIA = :OLD_CTR_SEQUENCIA')
    Left = 352
    Top = 93
  end
  object qryBaixa_Receber: TIBQuery
    Database = dm2.Database1
    Transaction = dm2.IBTransaction1
    SQL.Strings = (
      'SELECT * FROM BAIXA_RECEB')
    UpdateObject = updBaixa_Receber
    Left = 320
    Top = 122
    object qryBaixa_ReceberCTR_SEQUENCIA: TIBStringField
      FieldName = 'CTR_SEQUENCIA'
      Origin = '"BAIXA_RECEB"."CTR_SEQUENCIA"'
      Required = True
      Size = 6
    end
    object qryBaixa_ReceberBXR_DT_CREDITO: TDateTimeField
      FieldName = 'BXR_DT_CREDITO'
      Origin = '"BAIXA_RECEB"."BXR_DT_CREDITO"'
      Required = True
    end
    object qryBaixa_ReceberBXR_DUPLICATA: TIBStringField
      FieldName = 'BXR_DUPLICATA'
      Origin = '"BAIXA_RECEB"."BXR_DUPLICATA"'
      Size = 12
    end
    object qryBaixa_ReceberBXR_CREDITO: TFloatField
      FieldName = 'BXR_CREDITO'
      Origin = '"BAIXA_RECEB"."BXR_CREDITO"'
    end
    object qryBaixa_ReceberBXR_JUROS: TFloatField
      FieldName = 'BXR_JUROS'
      Origin = '"BAIXA_RECEB"."BXR_JUROS"'
    end
    object qryBaixa_ReceberBXR_DESCONTO: TFloatField
      FieldName = 'BXR_DESCONTO'
      Origin = '"BAIXA_RECEB"."BXR_DESCONTO"'
    end
    object qryBaixa_ReceberBXR_OBSERVA: TIBStringField
      FieldName = 'BXR_OBSERVA'
      Origin = '"BAIXA_RECEB"."BXR_OBSERVA"'
      Size = 255
    end
    object qryBaixa_ReceberBXR_NUM_RECIBO: TIBStringField
      FieldName = 'BXR_NUM_RECIBO'
      Origin = '"BAIXA_RECEB"."BXR_NUM_RECIBO"'
      Size = 10
    end
    object qryBaixa_ReceberBXR_CAIXA: TIBStringField
      FieldName = 'BXR_CAIXA'
      Origin = '"BAIXA_RECEB"."BXR_CAIXA"'
      Size = 3
    end
    object qryBaixa_ReceberBXR_NUM_CHEQUE: TIBStringField
      FieldName = 'BXR_NUM_CHEQUE'
      Origin = '"BAIXA_RECEB"."BXR_NUM_CHEQUE"'
      Size = 15
    end
    object qryBaixa_ReceberBXR_COD_BANCO: TIBStringField
      FieldName = 'BXR_COD_BANCO'
      Origin = '"BAIXA_RECEB"."BXR_COD_BANCO"'
      Size = 50
    end
    object qryBaixa_ReceberBXR_BANCO: TIBStringField
      FieldName = 'BXR_BANCO'
      Origin = '"BAIXA_RECEB"."BXR_BANCO"'
      Size = 3
    end
    object qryBaixa_ReceberBXR_CONTA_BANCO: TIBStringField
      FieldName = 'BXR_CONTA_BANCO'
      Origin = '"BAIXA_RECEB"."BXR_CONTA_BANCO"'
      Size = 15
    end
    object qryBaixa_ReceberBXR_ORIGEM_RECURSO: TIBStringField
      FieldName = 'BXR_ORIGEM_RECURSO'
      Origin = '"BAIXA_RECEB"."BXR_ORIGEM_RECURSO"'
      Size = 1
    end
    object qryBaixa_ReceberBXR_HISTORICO: TIBStringField
      FieldName = 'BXR_HISTORICO'
      Origin = '"BAIXA_RECEB"."BXR_HISTORICO"'
      Size = 40
    end
    object qryBaixa_ReceberBXR_SEQUENCIA: TIntegerField
      FieldName = 'BXR_SEQUENCIA'
      Origin = '"BAIXA_RECEB"."BXR_SEQUENCIA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryBaixa_ReceberBXR_DT_MOVIMENTO: TDateTimeField
      FieldName = 'BXR_DT_MOVIMENTO'
      Origin = '"BAIXA_RECEB"."BXR_DT_MOVIMENTO"'
    end
    object qryBaixa_ReceberBXR_EMITENTE: TIBStringField
      FieldName = 'BXR_EMITENTE'
      Origin = '"BAIXA_RECEB"."BXR_EMITENTE"'
      Size = 35
    end
    object qryBaixa_ReceberBXR_LOGIN_RECEBEU: TIBStringField
      FieldName = 'BXR_LOGIN_RECEBEU'
      Origin = '"BAIXA_RECEB"."BXR_LOGIN_RECEBEU"'
    end
    object qryBaixa_ReceberBXR_PROTOCOLADO_EM: TDateTimeField
      FieldName = 'BXR_PROTOCOLADO_EM'
      Origin = '"BAIXA_RECEB"."BXR_PROTOCOLADO_EM"'
    end
    object qryBaixa_ReceberBXR_PROTOCOLO_CAIXA: TIBStringField
      FieldName = 'BXR_PROTOCOLO_CAIXA'
      Origin = '"BAIXA_RECEB"."BXR_PROTOCOLO_CAIXA"'
      Size = 3
    end
    object qryBaixa_ReceberBXR_PESSOA_CH: TIBStringField
      FieldName = 'BXR_PESSOA_CH'
      Origin = '"BAIXA_RECEB"."BXR_PESSOA_CH"'
      FixedChar = True
      Size = 1
    end
    object qryBaixa_ReceberBXR_CNPJ_CPF_CH: TIBStringField
      FieldName = 'BXR_CNPJ_CPF_CH'
      Origin = '"BAIXA_RECEB"."BXR_CNPJ_CPF_CH"'
      Size = 14
    end
    object qryBaixa_ReceberBXR_BCO_CH: TIBStringField
      FieldName = 'BXR_BCO_CH'
      Origin = '"BAIXA_RECEB"."BXR_BCO_CH"'
      Size = 3
    end
    object qryBaixa_ReceberBXR_AGENCIA_CH: TIBStringField
      FieldName = 'BXR_AGENCIA_CH'
      Origin = '"BAIXA_RECEB"."BXR_AGENCIA_CH"'
      Size = 12
    end
    object qryBaixa_ReceberBXR_CONTA_CH: TIBStringField
      FieldName = 'BXR_CONTA_CH'
      Origin = '"BAIXA_RECEB"."BXR_CONTA_CH"'
      Size = 15
    end
    object qryBaixa_ReceberBXR_USUARIO_INCLUSAO: TIBStringField
      FieldName = 'BXR_USUARIO_INCLUSAO'
      Origin = '"BAIXA_RECEB"."BXR_USUARIO_INCLUSAO"'
      Size = 30
    end
    object qryBaixa_ReceberBXR_DT_INCLUSAO: TDateTimeField
      FieldName = 'BXR_DT_INCLUSAO'
      Origin = '"BAIXA_RECEB"."BXR_DT_INCLUSAO"'
    end
    object qryBaixa_ReceberBXR_USUARIO_ALTERACAO: TIBStringField
      FieldName = 'BXR_USUARIO_ALTERACAO'
      Origin = '"BAIXA_RECEB"."BXR_USUARIO_ALTERACAO"'
      Size = 30
    end
    object qryBaixa_ReceberBXR_DT_ALTERACAO: TDateTimeField
      FieldName = 'BXR_DT_ALTERACAO'
      Origin = '"BAIXA_RECEB"."BXR_DT_ALTERACAO"'
    end
  end
  object updBaixa_Receber: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CTR_SEQUENCIA,'
      '  BXR_DT_CREDITO,'
      '  BXR_DUPLICATA,'
      '  BXR_CREDITO,'
      '  BXR_JUROS,'
      '  BXR_DESCONTO,'
      '  BXR_OBSERVA,'
      '  BXR_NUM_RECIBO,'
      '  BXR_CAIXA,'
      '  BXR_NUM_CHEQUE,'
      '  BXR_COD_BANCO,'
      '  BXR_BANCO,'
      '  BXR_CONTA_BANCO,'
      '  BXR_ORIGEM_RECURSO,'
      '  BXR_HISTORICO,'
      '  BXR_SEQUENCIA,'
      '  BXR_DT_MOVIMENTO,'
      '  BXR_EMITENTE,'
      '  BXR_LOGIN_RECEBEU,'
      '  BXR_PROTOCOLADO_EM,'
      '  BXR_PROTOCOLO_CAIXA,'
      '  BXR_PESSOA_CH,'
      '  BXR_CNPJ_CPF_CH,'
      '  BXR_BCO_CH,'
      '  BXR_AGENCIA_CH,'
      '  BXR_CONTA_CH,'
      '  BXR_USUARIO_INCLUSAO,'
      '  BXR_DT_INCLUSAO,'
      '  BXR_USUARIO_ALTERACAO,'
      '  BXR_DT_ALTERACAO'
      'from BAIXA_RECEB '
      'where'
      '  BXR_SEQUENCIA = :BXR_SEQUENCIA')
    ModifySQL.Strings = (
      'update BAIXA_RECEB'
      'set'
      '  BXR_AGENCIA_CH = :BXR_AGENCIA_CH,'
      '  BXR_BANCO = :BXR_BANCO,'
      '  BXR_BCO_CH = :BXR_BCO_CH,'
      '  BXR_CAIXA = :BXR_CAIXA,'
      '  BXR_CNPJ_CPF_CH = :BXR_CNPJ_CPF_CH,'
      '  BXR_COD_BANCO = :BXR_COD_BANCO,'
      '  BXR_CONTA_BANCO = :BXR_CONTA_BANCO,'
      '  BXR_CONTA_CH = :BXR_CONTA_CH,'
      '  BXR_CREDITO = :BXR_CREDITO,'
      '  BXR_DESCONTO = :BXR_DESCONTO,'
      '  BXR_DT_ALTERACAO = :BXR_DT_ALTERACAO,'
      '  BXR_DT_CREDITO = :BXR_DT_CREDITO,'
      '  BXR_DT_INCLUSAO = :BXR_DT_INCLUSAO,'
      '  BXR_DT_MOVIMENTO = :BXR_DT_MOVIMENTO,'
      '  BXR_DUPLICATA = :BXR_DUPLICATA,'
      '  BXR_EMITENTE = :BXR_EMITENTE,'
      '  BXR_HISTORICO = :BXR_HISTORICO,'
      '  BXR_JUROS = :BXR_JUROS,'
      '  BXR_LOGIN_RECEBEU = :BXR_LOGIN_RECEBEU,'
      '  BXR_NUM_CHEQUE = :BXR_NUM_CHEQUE,'
      '  BXR_NUM_RECIBO = :BXR_NUM_RECIBO,'
      '  BXR_OBSERVA = :BXR_OBSERVA,'
      '  BXR_ORIGEM_RECURSO = :BXR_ORIGEM_RECURSO,'
      '  BXR_PESSOA_CH = :BXR_PESSOA_CH,'
      '  BXR_PROTOCOLADO_EM = :BXR_PROTOCOLADO_EM,'
      '  BXR_PROTOCOLO_CAIXA = :BXR_PROTOCOLO_CAIXA,'
      '  BXR_SEQUENCIA = :BXR_SEQUENCIA,'
      '  BXR_USUARIO_ALTERACAO = :BXR_USUARIO_ALTERACAO,'
      '  BXR_USUARIO_INCLUSAO = :BXR_USUARIO_INCLUSAO,'
      '  CTR_SEQUENCIA = :CTR_SEQUENCIA'
      'where'
      '  BXR_SEQUENCIA = :OLD_BXR_SEQUENCIA')
    InsertSQL.Strings = (
      'insert into BAIXA_RECEB'
      
        '  (BXR_AGENCIA_CH, BXR_BANCO, BXR_BCO_CH, BXR_CAIXA, BXR_CNPJ_CP' +
        'F_CH, BXR_COD_BANCO, '
      
        '   BXR_CONTA_BANCO, BXR_CONTA_CH, BXR_CREDITO, BXR_DESCONTO, BXR' +
        '_DT_ALTERACAO, '
      
        '   BXR_DT_CREDITO, BXR_DT_INCLUSAO, BXR_DT_MOVIMENTO, BXR_DUPLIC' +
        'ATA, BXR_EMITENTE, '
      
        '   BXR_HISTORICO, BXR_JUROS, BXR_LOGIN_RECEBEU, BXR_NUM_CHEQUE, ' +
        'BXR_NUM_RECIBO, '
      
        '   BXR_OBSERVA, BXR_ORIGEM_RECURSO, BXR_PESSOA_CH, BXR_PROTOCOLA' +
        'DO_EM, '
      
        '   BXR_PROTOCOLO_CAIXA, BXR_SEQUENCIA, BXR_USUARIO_ALTERACAO, BX' +
        'R_USUARIO_INCLUSAO, '
      '   CTR_SEQUENCIA)'
      'values'
      
        '  (:BXR_AGENCIA_CH, :BXR_BANCO, :BXR_BCO_CH, :BXR_CAIXA, :BXR_CN' +
        'PJ_CPF_CH, '
      
        '   :BXR_COD_BANCO, :BXR_CONTA_BANCO, :BXR_CONTA_CH, :BXR_CREDITO' +
        ', :BXR_DESCONTO, '
      
        '   :BXR_DT_ALTERACAO, :BXR_DT_CREDITO, :BXR_DT_INCLUSAO, :BXR_DT' +
        '_MOVIMENTO, '
      
        '   :BXR_DUPLICATA, :BXR_EMITENTE, :BXR_HISTORICO, :BXR_JUROS, :B' +
        'XR_LOGIN_RECEBEU, '
      
        '   :BXR_NUM_CHEQUE, :BXR_NUM_RECIBO, :BXR_OBSERVA, :BXR_ORIGEM_R' +
        'ECURSO, '
      
        '   :BXR_PESSOA_CH, :BXR_PROTOCOLADO_EM, :BXR_PROTOCOLO_CAIXA, :B' +
        'XR_SEQUENCIA, '
      
        '   :BXR_USUARIO_ALTERACAO, :BXR_USUARIO_INCLUSAO, :CTR_SEQUENCIA' +
        ')')
    DeleteSQL.Strings = (
      'delete from BAIXA_RECEB'
      'where'
      '  BXR_SEQUENCIA = :OLD_BXR_SEQUENCIA')
    Left = 352
    Top = 122
  end
  object qryFornecedor: TIBQuery
    Database = dm2.Database1
    Transaction = dm2.IBTransaction1
    SQL.Strings = (
      'SELECT * FROM FORNECEDORES')
    UpdateObject = updFornecedor
    Left = 320
    Top = 151
    object qryFornecedorFRN_CODIGO: TIBStringField
      FieldName = 'FRN_CODIGO'
      Origin = '"FORNECEDORES"."FRN_CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object qryFornecedorFRN_NOME: TIBStringField
      FieldName = 'FRN_NOME'
      Origin = '"FORNECEDORES"."FRN_NOME"'
      Required = True
      Size = 40
    end
    object qryFornecedorFRN_PESSOAL: TIBStringField
      FieldName = 'FRN_PESSOAL'
      Origin = '"FORNECEDORES"."FRN_PESSOAL"'
      Size = 1
    end
    object qryFornecedorFRN_ENDERECO: TIBStringField
      FieldName = 'FRN_ENDERECO'
      Origin = '"FORNECEDORES"."FRN_ENDERECO"'
      Size = 40
    end
    object qryFornecedorFRN_BAIRRO: TIBStringField
      FieldName = 'FRN_BAIRRO'
      Origin = '"FORNECEDORES"."FRN_BAIRRO"'
    end
    object qryFornecedorFRN_CIDADE: TIBStringField
      FieldName = 'FRN_CIDADE'
      Origin = '"FORNECEDORES"."FRN_CIDADE"'
    end
    object qryFornecedorFRN_CEP: TIBStringField
      FieldName = 'FRN_CEP'
      Origin = '"FORNECEDORES"."FRN_CEP"'
      Size = 8
    end
    object qryFornecedorFRN_ESTADO: TIBStringField
      FieldName = 'FRN_ESTADO'
      Origin = '"FORNECEDORES"."FRN_ESTADO"'
      Size = 2
    end
    object qryFornecedorFRN_CGC: TIBStringField
      FieldName = 'FRN_CGC'
      Origin = '"FORNECEDORES"."FRN_CGC"'
      Size = 14
    end
    object qryFornecedorFRN_CGF: TIBStringField
      FieldName = 'FRN_CGF'
      Origin = '"FORNECEDORES"."FRN_CGF"'
      Size = 14
    end
    object qryFornecedorFRN_CPF: TIBStringField
      FieldName = 'FRN_CPF'
      Origin = '"FORNECEDORES"."FRN_CPF"'
      Size = 14
    end
    object qryFornecedorFRN_FONE: TIBStringField
      FieldName = 'FRN_FONE'
      Origin = '"FORNECEDORES"."FRN_FONE"'
      Size = 14
    end
    object qryFornecedorFRN_FAX: TIBStringField
      FieldName = 'FRN_FAX'
      Origin = '"FORNECEDORES"."FRN_FAX"'
      Size = 14
    end
    object qryFornecedorFRN_EMAIL: TIBStringField
      FieldName = 'FRN_EMAIL'
      Origin = '"FORNECEDORES"."FRN_EMAIL"'
      Size = 40
    end
    object qryFornecedorFRN_OBSERVACAO: TIBStringField
      FieldName = 'FRN_OBSERVACAO'
      Origin = '"FORNECEDORES"."FRN_OBSERVACAO"'
      Size = 250
    end
    object qryFornecedorFRN_WEB: TIBStringField
      FieldName = 'FRN_WEB'
      Origin = '"FORNECEDORES"."FRN_WEB"'
      Size = 40
    end
    object qryFornecedorFRN_DT_CADASTRO: TDateTimeField
      FieldName = 'FRN_DT_CADASTRO'
      Origin = '"FORNECEDORES"."FRN_DT_CADASTRO"'
    end
    object qryFornecedorFRN_CONTATO1: TIBStringField
      FieldName = 'FRN_CONTATO1'
      Origin = '"FORNECEDORES"."FRN_CONTATO1"'
    end
    object qryFornecedorFRN_CONTATO2: TIBStringField
      FieldName = 'FRN_CONTATO2'
      Origin = '"FORNECEDORES"."FRN_CONTATO2"'
    end
    object qryFornecedorFRN_CONTATO3: TIBStringField
      FieldName = 'FRN_CONTATO3'
      Origin = '"FORNECEDORES"."FRN_CONTATO3"'
    end
    object qryFornecedorFRN_CARGO1: TIBStringField
      FieldName = 'FRN_CARGO1'
      Origin = '"FORNECEDORES"."FRN_CARGO1"'
    end
    object qryFornecedorFRN_CARGO2: TIBStringField
      FieldName = 'FRN_CARGO2'
      Origin = '"FORNECEDORES"."FRN_CARGO2"'
    end
    object qryFornecedorFRN_CARGO3: TIBStringField
      FieldName = 'FRN_CARGO3'
      Origin = '"FORNECEDORES"."FRN_CARGO3"'
    end
    object qryFornecedorFRN_CELULAR1: TIBStringField
      FieldName = 'FRN_CELULAR1'
      Origin = '"FORNECEDORES"."FRN_CELULAR1"'
      Size = 14
    end
    object qryFornecedorFRN_CELULAR2: TIBStringField
      FieldName = 'FRN_CELULAR2'
      Origin = '"FORNECEDORES"."FRN_CELULAR2"'
      Size = 14
    end
    object qryFornecedorFRN_CELULAR3: TIBStringField
      FieldName = 'FRN_CELULAR3'
      Origin = '"FORNECEDORES"."FRN_CELULAR3"'
      Size = 14
    end
    object qryFornecedorFRN_NASC1: TDateTimeField
      FieldName = 'FRN_NASC1'
      Origin = '"FORNECEDORES"."FRN_NASC1"'
    end
    object qryFornecedorFRN_NASC2: TDateTimeField
      FieldName = 'FRN_NASC2'
      Origin = '"FORNECEDORES"."FRN_NASC2"'
    end
    object qryFornecedorFRN_NASC3: TDateTimeField
      FieldName = 'FRN_NASC3'
      Origin = '"FORNECEDORES"."FRN_NASC3"'
    end
    object qryFornecedorFRN_FONE1: TIBStringField
      FieldName = 'FRN_FONE1'
      Origin = '"FORNECEDORES"."FRN_FONE1"'
      Size = 14
    end
    object qryFornecedorFRN_FONE2: TIBStringField
      FieldName = 'FRN_FONE2'
      Origin = '"FORNECEDORES"."FRN_FONE2"'
      Size = 14
    end
    object qryFornecedorFRN_FONE3: TIBStringField
      FieldName = 'FRN_FONE3'
      Origin = '"FORNECEDORES"."FRN_FONE3"'
      Size = 14
    end
    object qryFornecedorFRN_RAMAL1: TIBStringField
      FieldName = 'FRN_RAMAL1'
      Origin = '"FORNECEDORES"."FRN_RAMAL1"'
      Size = 4
    end
    object qryFornecedorFRN_RAMAL2: TIBStringField
      FieldName = 'FRN_RAMAL2'
      Origin = '"FORNECEDORES"."FRN_RAMAL2"'
      Size = 4
    end
    object qryFornecedorFRN_RAMAL3: TIBStringField
      FieldName = 'FRN_RAMAL3'
      Origin = '"FORNECEDORES"."FRN_RAMAL3"'
      Size = 4
    end
    object qryFornecedorFRN_ATIVIDADE: TIBStringField
      FieldName = 'FRN_ATIVIDADE'
      Origin = '"FORNECEDORES"."FRN_ATIVIDADE"'
      Size = 10
    end
    object qryFornecedorFRN_NASC1_DIA_MES: TIBStringField
      FieldName = 'FRN_NASC1_DIA_MES'
      Origin = '"FORNECEDORES"."FRN_NASC1_DIA_MES"'
      Size = 4
    end
    object qryFornecedorFRN_NASC2_DIA_MES: TIBStringField
      FieldName = 'FRN_NASC2_DIA_MES'
      Origin = '"FORNECEDORES"."FRN_NASC2_DIA_MES"'
      Size = 4
    end
    object qryFornecedorFRN_NASC3_DIA_MES: TIBStringField
      FieldName = 'FRN_NASC3_DIA_MES'
      Origin = '"FORNECEDORES"."FRN_NASC3_DIA_MES"'
      Size = 4
    end
    object qryFornecedorFRN_PREFIXO_BOBINA: TIBStringField
      FieldName = 'FRN_PREFIXO_BOBINA'
      Origin = '"FORNECEDORES"."FRN_PREFIXO_BOBINA"'
      Size = 3
    end
    object qryFornecedorFRN_COD_FORTTS: TIBStringField
      FieldName = 'FRN_COD_FORTTS'
      Origin = '"FORNECEDORES"."FRN_COD_FORTTS"'
      Size = 10
    end
    object qryFornecedorFRN_CONTA_FORTTS: TIBStringField
      FieldName = 'FRN_CONTA_FORTTS'
      Origin = '"FORNECEDORES"."FRN_CONTA_FORTTS"'
      Size = 10
    end
    object qryFornecedorFTR_FONEX: TIBStringField
      FieldName = 'FTR_FONEX'
      Origin = '"FORNECEDORES"."FTR_FONEX"'
      Size = 14
    end
    object qryFornecedorFRN_ISS: TFloatField
      FieldName = 'FRN_ISS'
      Origin = '"FORNECEDORES"."FRN_ISS"'
    end
    object qryFornecedorFRN_IRRF: TFloatField
      FieldName = 'FRN_IRRF'
      Origin = '"FORNECEDORES"."FRN_IRRF"'
    end
    object qryFornecedorFRN_INSS: TFloatField
      FieldName = 'FRN_INSS'
      Origin = '"FORNECEDORES"."FRN_INSS"'
    end
    object qryFornecedorFRN_NUM_INSS: TFloatField
      FieldName = 'FRN_NUM_INSS'
      Origin = '"FORNECEDORES"."FRN_NUM_INSS"'
    end
    object qryFornecedorFRN_IDENTIDADE: TIBStringField
      FieldName = 'FRN_IDENTIDADE'
      Origin = '"FORNECEDORES"."FRN_IDENTIDADE"'
    end
    object qryFornecedorFRN_ORGAO_EMISSOR: TIBStringField
      FieldName = 'FRN_ORGAO_EMISSOR'
      Origin = '"FORNECEDORES"."FRN_ORGAO_EMISSOR"'
      Size = 15
    end
    object qryFornecedorFRN_CODIGO_BANCO: TIBStringField
      FieldName = 'FRN_CODIGO_BANCO'
      Origin = '"FORNECEDORES"."FRN_CODIGO_BANCO"'
      Size = 3
    end
    object qryFornecedorFRN_AREA_COMPENSACAO: TIBStringField
      FieldName = 'FRN_AREA_COMPENSACAO'
      Origin = '"FORNECEDORES"."FRN_AREA_COMPENSACAO"'
      Size = 3
    end
    object qryFornecedorFRN_AGENCIA: TIBStringField
      FieldName = 'FRN_AGENCIA'
      Origin = '"FORNECEDORES"."FRN_AGENCIA"'
    end
    object qryFornecedorFRN_CONTA: TIBStringField
      FieldName = 'FRN_CONTA'
      Origin = '"FORNECEDORES"."FRN_CONTA"'
      Size = 14
    end
    object qryFornecedorFRN_DIGI_VERIFICA: TIBStringField
      FieldName = 'FRN_DIGI_VERIFICA'
      Origin = '"FORNECEDORES"."FRN_DIGI_VERIFICA"'
      Size = 1
    end
    object qryFornecedorFRN_TIPO: TIntegerField
      FieldName = 'FRN_TIPO'
      Origin = '"FORNECEDORES"."FRN_TIPO"'
    end
    object qryFornecedorFRN_VALOR_COMISSAO: TFloatField
      FieldName = 'FRN_VALOR_COMISSAO'
      Origin = '"FORNECEDORES"."FRN_VALOR_COMISSAO"'
    end
    object qryFornecedorFRN_TIPO_COMISSAO: TIBStringField
      FieldName = 'FRN_TIPO_COMISSAO'
      Origin = '"FORNECEDORES"."FRN_TIPO_COMISSAO"'
      FixedChar = True
      Size = 1
    end
  end
  object updFornecedor: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  FRN_CODIGO,'
      '  FRN_NOME,'
      '  FRN_PESSOAL,'
      '  FRN_ENDERECO,'
      '  FRN_BAIRRO,'
      '  FRN_CIDADE,'
      '  FRN_CEP,'
      '  FRN_ESTADO,'
      '  FRN_CGC,'
      '  FRN_CGF,'
      '  FRN_CPF,'
      '  FRN_FONE,'
      '  FRN_FAX,'
      '  FRN_EMAIL,'
      '  FRN_OBSERVACAO,'
      '  FRN_WEB,'
      '  FRN_DT_CADASTRO,'
      '  FRN_CONTATO1,'
      '  FRN_CONTATO2,'
      '  FRN_CONTATO3,'
      '  FRN_CARGO1,'
      '  FRN_CARGO2,'
      '  FRN_CARGO3,'
      '  FRN_CELULAR1,'
      '  FRN_CELULAR2,'
      '  FRN_CELULAR3,'
      '  FRN_NASC1,'
      '  FRN_NASC2,'
      '  FRN_NASC3,'
      '  FRN_FONE1,'
      '  FRN_FONE2,'
      '  FRN_FONE3,'
      '  FRN_RAMAL1,'
      '  FRN_RAMAL2,'
      '  FRN_RAMAL3,'
      '  FRN_ATIVIDADE,'
      '  FRN_NASC1_DIA_MES,'
      '  FRN_NASC2_DIA_MES,'
      '  FRN_NASC3_DIA_MES,'
      '  FRN_PREFIXO_BOBINA,'
      '  FRN_COD_FORTTS,'
      '  FRN_CONTA_FORTTS,'
      '  FTR_FONEX,'
      '  FRN_ISS,'
      '  FRN_IRRF,'
      '  FRN_INSS,'
      '  FRN_NUM_INSS,'
      '  FRN_IDENTIDADE,'
      '  FRN_ORGAO_EMISSOR,'
      '  FRN_CODIGO_BANCO,'
      '  FRN_AREA_COMPENSACAO,'
      '  FRN_AGENCIA,'
      '  FRN_CONTA,'
      '  FRN_DIGI_VERIFICA,'
      '  FRN_TIPO,'
      '  FRN_VALOR_COMISSAO,'
      '  FRN_TIPO_COMISSAO'
      'from FORNECEDORES '
      'where'
      '  FRN_CODIGO = :FRN_CODIGO')
    ModifySQL.Strings = (
      'update FORNECEDORES'
      'set'
      '  FRN_AGENCIA = :FRN_AGENCIA,'
      '  FRN_AREA_COMPENSACAO = :FRN_AREA_COMPENSACAO,'
      '  FRN_ATIVIDADE = :FRN_ATIVIDADE,'
      '  FRN_BAIRRO = :FRN_BAIRRO,'
      '  FRN_CARGO1 = :FRN_CARGO1,'
      '  FRN_CARGO2 = :FRN_CARGO2,'
      '  FRN_CARGO3 = :FRN_CARGO3,'
      '  FRN_CELULAR1 = :FRN_CELULAR1,'
      '  FRN_CELULAR2 = :FRN_CELULAR2,'
      '  FRN_CELULAR3 = :FRN_CELULAR3,'
      '  FRN_CEP = :FRN_CEP,'
      '  FRN_CGC = :FRN_CGC,'
      '  FRN_CGF = :FRN_CGF,'
      '  FRN_CIDADE = :FRN_CIDADE,'
      '  FRN_COD_FORTTS = :FRN_COD_FORTTS,'
      '  FRN_CODIGO = :FRN_CODIGO,'
      '  FRN_CODIGO_BANCO = :FRN_CODIGO_BANCO,'
      '  FRN_CONTA = :FRN_CONTA,'
      '  FRN_CONTA_FORTTS = :FRN_CONTA_FORTTS,'
      '  FRN_CONTATO1 = :FRN_CONTATO1,'
      '  FRN_CONTATO2 = :FRN_CONTATO2,'
      '  FRN_CONTATO3 = :FRN_CONTATO3,'
      '  FRN_CPF = :FRN_CPF,'
      '  FRN_DIGI_VERIFICA = :FRN_DIGI_VERIFICA,'
      '  FRN_DT_CADASTRO = :FRN_DT_CADASTRO,'
      '  FRN_EMAIL = :FRN_EMAIL,'
      '  FRN_ENDERECO = :FRN_ENDERECO,'
      '  FRN_ESTADO = :FRN_ESTADO,'
      '  FRN_FAX = :FRN_FAX,'
      '  FRN_FONE = :FRN_FONE,'
      '  FRN_FONE1 = :FRN_FONE1,'
      '  FRN_FONE2 = :FRN_FONE2,'
      '  FRN_FONE3 = :FRN_FONE3,'
      '  FRN_IDENTIDADE = :FRN_IDENTIDADE,'
      '  FRN_INSS = :FRN_INSS,'
      '  FRN_IRRF = :FRN_IRRF,'
      '  FRN_ISS = :FRN_ISS,'
      '  FRN_NASC1 = :FRN_NASC1,'
      '  FRN_NASC1_DIA_MES = :FRN_NASC1_DIA_MES,'
      '  FRN_NASC2 = :FRN_NASC2,'
      '  FRN_NASC2_DIA_MES = :FRN_NASC2_DIA_MES,'
      '  FRN_NASC3 = :FRN_NASC3,'
      '  FRN_NASC3_DIA_MES = :FRN_NASC3_DIA_MES,'
      '  FRN_NOME = :FRN_NOME,'
      '  FRN_NUM_INSS = :FRN_NUM_INSS,'
      '  FRN_OBSERVACAO = :FRN_OBSERVACAO,'
      '  FRN_ORGAO_EMISSOR = :FRN_ORGAO_EMISSOR,'
      '  FRN_PESSOAL = :FRN_PESSOAL,'
      '  FRN_PREFIXO_BOBINA = :FRN_PREFIXO_BOBINA,'
      '  FRN_RAMAL1 = :FRN_RAMAL1,'
      '  FRN_RAMAL2 = :FRN_RAMAL2,'
      '  FRN_RAMAL3 = :FRN_RAMAL3,'
      '  FRN_TIPO = :FRN_TIPO,'
      '  FRN_TIPO_COMISSAO = :FRN_TIPO_COMISSAO,'
      '  FRN_VALOR_COMISSAO = :FRN_VALOR_COMISSAO,'
      '  FRN_WEB = :FRN_WEB,'
      '  FTR_FONEX = :FTR_FONEX'
      'where'
      '  FRN_CODIGO = :OLD_FRN_CODIGO')
    InsertSQL.Strings = (
      'insert into FORNECEDORES'
      
        '  (FRN_AGENCIA, FRN_AREA_COMPENSACAO, FRN_ATIVIDADE, FRN_BAIRRO,' +
        ' FRN_CARGO1, '
      
        '   FRN_CARGO2, FRN_CARGO3, FRN_CELULAR1, FRN_CELULAR2, FRN_CELUL' +
        'AR3, FRN_CEP, '
      
        '   FRN_CGC, FRN_CGF, FRN_CIDADE, FRN_COD_FORTTS, FRN_CODIGO, FRN' +
        '_CODIGO_BANCO, '
      
        '   FRN_CONTA, FRN_CONTA_FORTTS, FRN_CONTATO1, FRN_CONTATO2, FRN_' +
        'CONTATO3, '
      
        '   FRN_CPF, FRN_DIGI_VERIFICA, FRN_DT_CADASTRO, FRN_EMAIL, FRN_E' +
        'NDERECO, '
      
        '   FRN_ESTADO, FRN_FAX, FRN_FONE, FRN_FONE1, FRN_FONE2, FRN_FONE' +
        '3, FRN_IDENTIDADE, '
      
        '   FRN_INSS, FRN_IRRF, FRN_ISS, FRN_NASC1, FRN_NASC1_DIA_MES, FR' +
        'N_NASC2, '
      
        '   FRN_NASC2_DIA_MES, FRN_NASC3, FRN_NASC3_DIA_MES, FRN_NOME, FR' +
        'N_NUM_INSS, '
      
        '   FRN_OBSERVACAO, FRN_ORGAO_EMISSOR, FRN_PESSOAL, FRN_PREFIXO_B' +
        'OBINA, '
      
        '   FRN_RAMAL1, FRN_RAMAL2, FRN_RAMAL3, FRN_TIPO, FRN_TIPO_COMISS' +
        'AO, FRN_VALOR_COMISSAO, '
      '   FRN_WEB, FTR_FONEX)'
      'values'
      
        '  (:FRN_AGENCIA, :FRN_AREA_COMPENSACAO, :FRN_ATIVIDADE, :FRN_BAI' +
        'RRO, :FRN_CARGO1, '
      
        '   :FRN_CARGO2, :FRN_CARGO3, :FRN_CELULAR1, :FRN_CELULAR2, :FRN_' +
        'CELULAR3, '
      
        '   :FRN_CEP, :FRN_CGC, :FRN_CGF, :FRN_CIDADE, :FRN_COD_FORTTS, :' +
        'FRN_CODIGO, '
      
        '   :FRN_CODIGO_BANCO, :FRN_CONTA, :FRN_CONTA_FORTTS, :FRN_CONTAT' +
        'O1, :FRN_CONTATO2, '
      
        '   :FRN_CONTATO3, :FRN_CPF, :FRN_DIGI_VERIFICA, :FRN_DT_CADASTRO' +
        ', :FRN_EMAIL, '
      
        '   :FRN_ENDERECO, :FRN_ESTADO, :FRN_FAX, :FRN_FONE, :FRN_FONE1, ' +
        ':FRN_FONE2, '
      
        '   :FRN_FONE3, :FRN_IDENTIDADE, :FRN_INSS, :FRN_IRRF, :FRN_ISS, ' +
        ':FRN_NASC1, '
      
        '   :FRN_NASC1_DIA_MES, :FRN_NASC2, :FRN_NASC2_DIA_MES, :FRN_NASC' +
        '3, :FRN_NASC3_DIA_MES, '
      
        '   :FRN_NOME, :FRN_NUM_INSS, :FRN_OBSERVACAO, :FRN_ORGAO_EMISSOR' +
        ', :FRN_PESSOAL, '
      
        '   :FRN_PREFIXO_BOBINA, :FRN_RAMAL1, :FRN_RAMAL2, :FRN_RAMAL3, :' +
        'FRN_TIPO, '
      
        '   :FRN_TIPO_COMISSAO, :FRN_VALOR_COMISSAO, :FRN_WEB, :FTR_FONEX' +
        ')')
    DeleteSQL.Strings = (
      'delete from FORNECEDORES'
      'where'
      '  FRN_CODIGO = :OLD_FRN_CODIGO')
    Left = 352
    Top = 151
  end
  object qryContas_Pagar: TIBQuery
    Database = dm2.Database1
    Transaction = dm2.IBTransaction1
    SQL.Strings = (
      'SELECT * FROM CONTAS_PAGAR')
    UpdateObject = updContas_Pagar
    Left = 384
    Top = 93
    object qryContas_PagarCTP_SEQUENCIA: TIBStringField
      FieldName = 'CTP_SEQUENCIA'
      Origin = '"CONTAS_PAGAR"."CTP_SEQUENCIA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object qryContas_PagarCTP_DOCUMENTO: TIBStringField
      FieldName = 'CTP_DOCUMENTO'
      Origin = '"CONTAS_PAGAR"."CTP_DOCUMENTO"'
      Size = 12
    end
    object qryContas_PagarCTP_HISTORICO: TIBStringField
      FieldName = 'CTP_HISTORICO'
      Origin = '"CONTAS_PAGAR"."CTP_HISTORICO"'
      Size = 60
    end
    object qryContas_PagarCTP_COD_FAVORECIDO: TIBStringField
      FieldName = 'CTP_COD_FAVORECIDO'
      Origin = '"CONTAS_PAGAR"."CTP_COD_FAVORECIDO"'
      Required = True
      Size = 12
    end
    object qryContas_PagarCTP_NOM_FAVORECIDO: TIBStringField
      FieldName = 'CTP_NOM_FAVORECIDO'
      Origin = '"CONTAS_PAGAR"."CTP_NOM_FAVORECIDO"'
      Size = 35
    end
    object qryContas_PagarCTP_ESPECIE: TIBStringField
      FieldName = 'CTP_ESPECIE'
      Origin = '"CONTAS_PAGAR"."CTP_ESPECIE"'
      Size = 12
    end
    object qryContas_PagarCTP_EMISSAO: TDateTimeField
      FieldName = 'CTP_EMISSAO'
      Origin = '"CONTAS_PAGAR"."CTP_EMISSAO"'
    end
    object qryContas_PagarCTP_VENCIMENTO: TDateTimeField
      FieldName = 'CTP_VENCIMENTO'
      Origin = '"CONTAS_PAGAR"."CTP_VENCIMENTO"'
    end
    object qryContas_PagarCTP_VALOR: TFloatField
      FieldName = 'CTP_VALOR'
      Origin = '"CONTAS_PAGAR"."CTP_VALOR"'
    end
    object qryContas_PagarCTP_VRPAGO: TFloatField
      FieldName = 'CTP_VRPAGO'
      Origin = '"CONTAS_PAGAR"."CTP_VRPAGO"'
    end
    object qryContas_PagarCTP_REF_MESANO: TIBStringField
      FieldName = 'CTP_REF_MESANO'
      Origin = '"CONTAS_PAGAR"."CTP_REF_MESANO"'
      Size = 6
    end
    object qryContas_PagarCTP_CONTBANCO: TIBStringField
      FieldName = 'CTP_CONTBANCO'
      Origin = '"CONTAS_PAGAR"."CTP_CONTBANCO"'
      Size = 30
    end
    object qryContas_PagarCTP_CT_TIT: TIBStringField
      FieldName = 'CTP_CT_TIT'
      Origin = '"CONTAS_PAGAR"."CTP_CT_TIT"'
      Size = 1
    end
    object qryContas_PagarCTP_SUBCONTA: TIBStringField
      FieldName = 'CTP_SUBCONTA'
      Origin = '"CONTAS_PAGAR"."CTP_SUBCONTA"'
      Size = 2
    end
    object qryContas_PagarCTP_CT_SINTETICA: TIBStringField
      FieldName = 'CTP_CT_SINTETICA'
      Origin = '"CONTAS_PAGAR"."CTP_CT_SINTETICA"'
      Size = 3
    end
    object qryContas_PagarCTP_CT_ANALITICA: TIBStringField
      FieldName = 'CTP_CT_ANALITICA'
      Origin = '"CONTAS_PAGAR"."CTP_CT_ANALITICA"'
      Size = 3
    end
    object qryContas_PagarCTP_CT_DETALHE: TIBStringField
      FieldName = 'CTP_CT_DETALHE'
      Origin = '"CONTAS_PAGAR"."CTP_CT_DETALHE"'
      Size = 3
    end
    object qryContas_PagarCTP_CCUSTO: TIBStringField
      FieldName = 'CTP_CCUSTO'
      Origin = '"CONTAS_PAGAR"."CTP_CCUSTO"'
      Size = 2
    end
    object qryContas_PagarCTP_CSETOR: TIBStringField
      FieldName = 'CTP_CSETOR'
      Origin = '"CONTAS_PAGAR"."CTP_CSETOR"'
      Size = 2
    end
    object qryContas_PagarCTP_SETOR: TIBStringField
      FieldName = 'CTP_SETOR'
      Origin = '"CONTAS_PAGAR"."CTP_SETOR"'
      Size = 2
    end
    object qryContas_PagarCTP_STATUS: TIBStringField
      FieldName = 'CTP_STATUS'
      Origin = '"CONTAS_PAGAR"."CTP_STATUS"'
      Size = 1
    end
    object qryContas_PagarCTP_NUM_TITULO_BANCO: TIBStringField
      FieldName = 'CTP_NUM_TITULO_BANCO'
      Origin = '"CONTAS_PAGAR"."CTP_NUM_TITULO_BANCO"'
    end
    object qryContas_PagarCTP_PREVISAO_PAGAMENTO: TDateTimeField
      FieldName = 'CTP_PREVISAO_PAGAMENTO'
      Origin = '"CONTAS_PAGAR"."CTP_PREVISAO_PAGAMENTO"'
    end
    object qryContas_PagarCTP_FLG: TIBStringField
      FieldName = 'CTP_FLG'
      Origin = '"CONTAS_PAGAR"."CTP_FLG"'
      FixedChar = True
      Size = 1
    end
    object qryContas_PagarCTP_PEDIDO: TIBStringField
      FieldName = 'CTP_PEDIDO'
      Origin = '"CONTAS_PAGAR"."CTP_PEDIDO"'
      Size = 8
    end
    object qryContas_PagarCTP_OCULT_1: TIBStringField
      FieldName = 'CTP_OCULT_1'
      Origin = '"CONTAS_PAGAR"."CTP_OCULT_1"'
      FixedChar = True
      Size = 1
    end
    object qryContas_PagarCTP_DEBITO: TIBStringField
      FieldName = 'CTP_DEBITO'
      Origin = '"CONTAS_PAGAR"."CTP_DEBITO"'
      FixedChar = True
      Size = 1
    end
    object qryContas_PagarCTP_DTREMESSA: TDateTimeField
      FieldName = 'CTP_DTREMESSA'
      Origin = '"CONTAS_PAGAR"."CTP_DTREMESSA"'
    end
    object qryContas_PagarCTP_BANCO: TIBStringField
      FieldName = 'CTP_BANCO'
      Origin = '"CONTAS_PAGAR"."CTP_BANCO"'
      Size = 3
    end
    object qryContas_PagarCTP_DT_RETORNO_BANC: TDateTimeField
      FieldName = 'CTP_DT_RETORNO_BANC'
      Origin = '"CONTAS_PAGAR"."CTP_DT_RETORNO_BANC"'
    end
    object qryContas_PagarCTP_COD_BARRAS: TIBStringField
      FieldName = 'CTP_COD_BARRAS'
      Origin = '"CONTAS_PAGAR"."CTP_COD_BARRAS"'
      Size = 47
    end
    object qryContas_PagarCTP_QTD_SACOS: TFloatField
      FieldName = 'CTP_QTD_SACOS'
      Origin = '"CONTAS_PAGAR"."CTP_QTD_SACOS"'
    end
    object qryContas_PagarCTP_VALOR_DESCONTO: TFloatField
      FieldName = 'CTP_VALOR_DESCONTO'
      Origin = '"CONTAS_PAGAR"."CTP_VALOR_DESCONTO"'
    end
    object qryContas_PagarCTP_VALOR_UNITARIO: TFloatField
      FieldName = 'CTP_VALOR_UNITARIO'
      Origin = '"CONTAS_PAGAR"."CTP_VALOR_UNITARIO"'
    end
    object qryContas_PagarCTP_HISTORICO2: TIBStringField
      FieldName = 'CTP_HISTORICO2'
      Origin = '"CONTAS_PAGAR"."CTP_HISTORICO2"'
      Size = 60
    end
    object qryContas_PagarCTP_NOTAFISCAL: TIBStringField
      FieldName = 'CTP_NOTAFISCAL'
      Origin = '"CONTAS_PAGAR"."CTP_NOTAFISCAL"'
      Size = 15
    end
    object qryContas_PagarCTP_SEQ_PILATIS: TIntegerField
      FieldName = 'CTP_SEQ_PILATIS'
      Origin = '"CONTAS_PAGAR"."CTP_SEQ_PILATIS"'
    end
    object qryContas_PagarCTP_OS_TERCEIROS: TIntegerField
      FieldName = 'CTP_OS_TERCEIROS'
      Origin = '"CONTAS_PAGAR"."CTP_OS_TERCEIROS"'
    end
  end
  object updContas_Pagar: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CTP_SEQUENCIA,'
      '  CTP_DOCUMENTO,'
      '  CTP_HISTORICO,'
      '  CTP_COD_FAVORECIDO,'
      '  CTP_NOM_FAVORECIDO,'
      '  CTP_ESPECIE,'
      '  CTP_EMISSAO,'
      '  CTP_VENCIMENTO,'
      '  CTP_VALOR,'
      '  CTP_VRPAGO,'
      '  CTP_REF_MESANO,'
      '  CTP_CONTBANCO,'
      '  CTP_CT_TIT,'
      '  CTP_SUBCONTA,'
      '  CTP_CT_SINTETICA,'
      '  CTP_CT_ANALITICA,'
      '  CTP_CT_DETALHE,'
      '  CTP_CCUSTO,'
      '  CTP_CSETOR,'
      '  CTP_SETOR,'
      '  CTP_STATUS,'
      '  CTP_NUM_TITULO_BANCO,'
      '  CTP_PREVISAO_PAGAMENTO,'
      '  CTP_FLG,'
      '  CTP_PEDIDO,'
      '  CTP_OCULT_1,'
      '  CTP_DEBITO,'
      '  CTP_DTREMESSA,'
      '  CTP_BANCO,'
      '  CTP_DT_RETORNO_BANC,'
      '  CTP_COD_BARRAS,'
      '  CTP_QTD_SACOS,'
      '  CTP_VALOR_DESCONTO,'
      '  CTP_VALOR_UNITARIO,'
      '  CTP_HISTORICO2,'
      '  CTP_NOTAFISCAL,'
      '  CTP_SEQ_PILATIS,'
      '  CTP_OS_TERCEIROS'
      'from CONTAS_PAGAR '
      'where'
      '  CTP_SEQUENCIA = :CTP_SEQUENCIA')
    ModifySQL.Strings = (
      'update CONTAS_PAGAR'
      'set'
      '  CTP_BANCO = :CTP_BANCO,'
      '  CTP_CCUSTO = :CTP_CCUSTO,'
      '  CTP_COD_BARRAS = :CTP_COD_BARRAS,'
      '  CTP_COD_FAVORECIDO = :CTP_COD_FAVORECIDO,'
      '  CTP_CONTBANCO = :CTP_CONTBANCO,'
      '  CTP_CSETOR = :CTP_CSETOR,'
      '  CTP_CT_ANALITICA = :CTP_CT_ANALITICA,'
      '  CTP_CT_DETALHE = :CTP_CT_DETALHE,'
      '  CTP_CT_SINTETICA = :CTP_CT_SINTETICA,'
      '  CTP_CT_TIT = :CTP_CT_TIT,'
      '  CTP_DEBITO = :CTP_DEBITO,'
      '  CTP_DOCUMENTO = :CTP_DOCUMENTO,'
      '  CTP_DT_RETORNO_BANC = :CTP_DT_RETORNO_BANC,'
      '  CTP_DTREMESSA = :CTP_DTREMESSA,'
      '  CTP_EMISSAO = :CTP_EMISSAO,'
      '  CTP_ESPECIE = :CTP_ESPECIE,'
      '  CTP_FLG = :CTP_FLG,'
      '  CTP_HISTORICO = :CTP_HISTORICO,'
      '  CTP_HISTORICO2 = :CTP_HISTORICO2,'
      '  CTP_NOM_FAVORECIDO = :CTP_NOM_FAVORECIDO,'
      '  CTP_NOTAFISCAL = :CTP_NOTAFISCAL,'
      '  CTP_NUM_TITULO_BANCO = :CTP_NUM_TITULO_BANCO,'
      '  CTP_OCULT_1 = :CTP_OCULT_1,'
      '  CTP_OS_TERCEIROS = :CTP_OS_TERCEIROS,'
      '  CTP_PEDIDO = :CTP_PEDIDO,'
      '  CTP_PREVISAO_PAGAMENTO = :CTP_PREVISAO_PAGAMENTO,'
      '  CTP_QTD_SACOS = :CTP_QTD_SACOS,'
      '  CTP_REF_MESANO = :CTP_REF_MESANO,'
      '  CTP_SEQ_PILATIS = :CTP_SEQ_PILATIS,'
      '  CTP_SEQUENCIA = :CTP_SEQUENCIA,'
      '  CTP_SETOR = :CTP_SETOR,'
      '  CTP_STATUS = :CTP_STATUS,'
      '  CTP_SUBCONTA = :CTP_SUBCONTA,'
      '  CTP_VALOR = :CTP_VALOR,'
      '  CTP_VALOR_DESCONTO = :CTP_VALOR_DESCONTO,'
      '  CTP_VALOR_UNITARIO = :CTP_VALOR_UNITARIO,'
      '  CTP_VENCIMENTO = :CTP_VENCIMENTO,'
      '  CTP_VRPAGO = :CTP_VRPAGO'
      'where'
      '  CTP_SEQUENCIA = :OLD_CTP_SEQUENCIA')
    InsertSQL.Strings = (
      'insert into CONTAS_PAGAR'
      
        '  (CTP_BANCO, CTP_CCUSTO, CTP_COD_BARRAS, CTP_COD_FAVORECIDO, CT' +
        'P_CONTBANCO, '
      
        '   CTP_CSETOR, CTP_CT_ANALITICA, CTP_CT_DETALHE, CTP_CT_SINTETIC' +
        'A, CTP_CT_TIT, '
      
        '   CTP_DEBITO, CTP_DOCUMENTO, CTP_DT_RETORNO_BANC, CTP_DTREMESSA' +
        ', CTP_EMISSAO, '
      
        '   CTP_ESPECIE, CTP_FLG, CTP_HISTORICO, CTP_HISTORICO2, CTP_NOM_' +
        'FAVORECIDO, '
      
        '   CTP_NOTAFISCAL, CTP_NUM_TITULO_BANCO, CTP_OCULT_1, CTP_OS_TER' +
        'CEIROS, '
      
        '   CTP_PEDIDO, CTP_PREVISAO_PAGAMENTO, CTP_QTD_SACOS, CTP_REF_ME' +
        'SANO, CTP_SEQ_PILATIS, '
      
        '   CTP_SEQUENCIA, CTP_SETOR, CTP_STATUS, CTP_SUBCONTA, CTP_VALOR' +
        ', CTP_VALOR_DESCONTO, '
      '   CTP_VALOR_UNITARIO, CTP_VENCIMENTO, CTP_VRPAGO)'
      'values'
      
        '  (:CTP_BANCO, :CTP_CCUSTO, :CTP_COD_BARRAS, :CTP_COD_FAVORECIDO' +
        ', :CTP_CONTBANCO, '
      
        '   :CTP_CSETOR, :CTP_CT_ANALITICA, :CTP_CT_DETALHE, :CTP_CT_SINT' +
        'ETICA, '
      
        '   :CTP_CT_TIT, :CTP_DEBITO, :CTP_DOCUMENTO, :CTP_DT_RETORNO_BAN' +
        'C, :CTP_DTREMESSA, '
      
        '   :CTP_EMISSAO, :CTP_ESPECIE, :CTP_FLG, :CTP_HISTORICO, :CTP_HI' +
        'STORICO2, '
      
        '   :CTP_NOM_FAVORECIDO, :CTP_NOTAFISCAL, :CTP_NUM_TITULO_BANCO, ' +
        ':CTP_OCULT_1, '
      
        '   :CTP_OS_TERCEIROS, :CTP_PEDIDO, :CTP_PREVISAO_PAGAMENTO, :CTP' +
        '_QTD_SACOS, '
      
        '   :CTP_REF_MESANO, :CTP_SEQ_PILATIS, :CTP_SEQUENCIA, :CTP_SETOR' +
        ', :CTP_STATUS, '
      
        '   :CTP_SUBCONTA, :CTP_VALOR, :CTP_VALOR_DESCONTO, :CTP_VALOR_UN' +
        'ITARIO, '
      '   :CTP_VENCIMENTO, :CTP_VRPAGO)')
    DeleteSQL.Strings = (
      'delete from CONTAS_PAGAR'
      'where'
      '  CTP_SEQUENCIA = :OLD_CTP_SEQUENCIA')
    Left = 416
    Top = 93
  end
  object qryBaixa_Pagar: TIBQuery
    Database = dm2.Database1
    Transaction = dm2.IBTransaction1
    SQL.Strings = (
      'SELECT * FROM BAIXA_PAGAR')
    UpdateObject = updBaixa_Pagar
    Left = 384
    Top = 122
    object qryBaixa_PagarBXP_SEQUENCIA: TIBStringField
      FieldName = 'BXP_SEQUENCIA'
      Origin = '"BAIXA_PAGAR"."BXP_SEQUENCIA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object qryBaixa_PagarBXP_DT_PAGO: TDateTimeField
      FieldName = 'BXP_DT_PAGO'
      Origin = '"BAIXA_PAGAR"."BXP_DT_PAGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryBaixa_PagarBXP_DOCUMENTO: TIBStringField
      FieldName = 'BXP_DOCUMENTO'
      Origin = '"BAIXA_PAGAR"."BXP_DOCUMENTO"'
      Size = 12
    end
    object qryBaixa_PagarBXP_VR_PAGO: TFloatField
      FieldName = 'BXP_VR_PAGO'
      Origin = '"BAIXA_PAGAR"."BXP_VR_PAGO"'
    end
    object qryBaixa_PagarBXP_BANCO: TIBStringField
      FieldName = 'BXP_BANCO'
      Origin = '"BAIXA_PAGAR"."BXP_BANCO"'
      Size = 3
    end
    object qryBaixa_PagarBXP_CHEQUE: TIBStringField
      FieldName = 'BXP_CHEQUE'
      Origin = '"BAIXA_PAGAR"."BXP_CHEQUE"'
      Size = 12
    end
    object qryBaixa_PagarBXP_ORIGEM_RECURSO: TIBStringField
      FieldName = 'BXP_ORIGEM_RECURSO'
      Origin = '"BAIXA_PAGAR"."BXP_ORIGEM_RECURSO"'
      Size = 1
    end
    object qryBaixa_PagarBXP_CAIXA: TIBStringField
      FieldName = 'BXP_CAIXA'
      Origin = '"BAIXA_PAGAR"."BXP_CAIXA"'
      Size = 3
    end
    object qryBaixa_PagarBXP_CONTA_BANCO: TIBStringField
      FieldName = 'BXP_CONTA_BANCO'
      Origin = '"BAIXA_PAGAR"."BXP_CONTA_BANCO"'
      Size = 14
    end
    object qryBaixa_PagarBXP_DATA_PREVISAO_CHEQUE: TDateTimeField
      FieldName = 'BXP_DATA_PREVISAO_CHEQUE'
      Origin = '"BAIXA_PAGAR"."BXP_DATA_PREVISAO_CHEQUE"'
    end
    object qryBaixa_PagarBXP_HISTORICO: TIBStringField
      FieldName = 'BXP_HISTORICO'
      Origin = '"BAIXA_PAGAR"."BXP_HISTORICO"'
      Size = 40
    end
    object qryBaixa_PagarBXP_COMPENSADO: TIBStringField
      FieldName = 'BXP_COMPENSADO'
      Origin = '"BAIXA_PAGAR"."BXP_COMPENSADO"'
      Size = 1
    end
    object qryBaixa_PagarBXP_OBSERVA: TIBStringField
      FieldName = 'BXP_OBSERVA'
      Origin = '"BAIXA_PAGAR"."BXP_OBSERVA"'
      Size = 200
    end
    object qryBaixa_PagarBXP_DESPACHANTE: TIBStringField
      FieldName = 'BXP_DESPACHANTE'
      Origin = '"BAIXA_PAGAR"."BXP_DESPACHANTE"'
    end
    object qryBaixa_PagarBXP_CH_PRED_SN: TIBStringField
      FieldName = 'BXP_CH_PRED_SN'
      Origin = '"BAIXA_PAGAR"."BXP_CH_PRED_SN"'
      FixedChar = True
      Size = 1
    end
    object qryBaixa_PagarBXP_VR_JURO: TFloatField
      FieldName = 'BXP_VR_JURO'
      Origin = '"BAIXA_PAGAR"."BXP_VR_JURO"'
    end
    object qryBaixa_PagarBXP_VR_DESCONTO: TFloatField
      FieldName = 'BXP_VR_DESCONTO'
      Origin = '"BAIXA_PAGAR"."BXP_VR_DESCONTO"'
    end
    object qryBaixa_PagarBXP_NOMINAL: TIBStringField
      FieldName = 'BXP_NOMINAL'
      Origin = '"BAIXA_PAGAR"."BXP_NOMINAL"'
      Size = 50
    end
    object qryBaixa_PagarBXP_HR_PAGO: TIBStringField
      FieldName = 'BXP_HR_PAGO'
      Origin = '"BAIXA_PAGAR"."BXP_HR_PAGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object qryBaixa_PagarBXP_DT_MOVIMENTO: TDateTimeField
      FieldName = 'BXP_DT_MOVIMENTO'
      Origin = '"BAIXA_PAGAR"."BXP_DT_MOVIMENTO"'
    end
    object qryBaixa_PagarBXP_USUARIO_INCLUSAO: TIBStringField
      FieldName = 'BXP_USUARIO_INCLUSAO'
      Origin = '"BAIXA_PAGAR"."BXP_USUARIO_INCLUSAO"'
      Size = 30
    end
    object qryBaixa_PagarBXP_DT_INCLUSAO: TDateTimeField
      FieldName = 'BXP_DT_INCLUSAO'
      Origin = '"BAIXA_PAGAR"."BXP_DT_INCLUSAO"'
    end
    object qryBaixa_PagarBXP_USUARIO_ALTERACAO: TIBStringField
      FieldName = 'BXP_USUARIO_ALTERACAO'
      Origin = '"BAIXA_PAGAR"."BXP_USUARIO_ALTERACAO"'
      Size = 30
    end
    object qryBaixa_PagarBXP_DT_ALTERACAO: TDateTimeField
      FieldName = 'BXP_DT_ALTERACAO'
      Origin = '"BAIXA_PAGAR"."BXP_DT_ALTERACAO"'
    end
  end
  object updBaixa_Pagar: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  BXP_SEQUENCIA,'
      '  BXP_DT_PAGO,'
      '  BXP_DOCUMENTO,'
      '  BXP_VR_PAGO,'
      '  BXP_BANCO,'
      '  BXP_CHEQUE,'
      '  BXP_ORIGEM_RECURSO,'
      '  BXP_CAIXA,'
      '  BXP_CONTA_BANCO,'
      '  BXP_DATA_PREVISAO_CHEQUE,'
      '  BXP_HISTORICO,'
      '  BXP_COMPENSADO,'
      '  BXP_OBSERVA,'
      '  BXP_DESPACHANTE,'
      '  BXP_CH_PRED_SN,'
      '  BXP_VR_JURO,'
      '  BXP_VR_DESCONTO,'
      '  BXP_NOMINAL,'
      '  BXP_HR_PAGO,'
      '  BXP_DT_MOVIMENTO,'
      '  BXP_USUARIO_INCLUSAO,'
      '  BXP_DT_INCLUSAO,'
      '  BXP_USUARIO_ALTERACAO,'
      '  BXP_DT_ALTERACAO'
      'from BAIXA_PAGAR '
      'where'
      '  BXP_DT_PAGO = :BXP_DT_PAGO and'
      '  BXP_HR_PAGO = :BXP_HR_PAGO and'
      '  BXP_SEQUENCIA = :BXP_SEQUENCIA')
    ModifySQL.Strings = (
      'update BAIXA_PAGAR'
      'set'
      '  BXP_BANCO = :BXP_BANCO,'
      '  BXP_CAIXA = :BXP_CAIXA,'
      '  BXP_CH_PRED_SN = :BXP_CH_PRED_SN,'
      '  BXP_CHEQUE = :BXP_CHEQUE,'
      '  BXP_COMPENSADO = :BXP_COMPENSADO,'
      '  BXP_CONTA_BANCO = :BXP_CONTA_BANCO,'
      '  BXP_DATA_PREVISAO_CHEQUE = :BXP_DATA_PREVISAO_CHEQUE,'
      '  BXP_DESPACHANTE = :BXP_DESPACHANTE,'
      '  BXP_DOCUMENTO = :BXP_DOCUMENTO,'
      '  BXP_DT_ALTERACAO = :BXP_DT_ALTERACAO,'
      '  BXP_DT_INCLUSAO = :BXP_DT_INCLUSAO,'
      '  BXP_DT_MOVIMENTO = :BXP_DT_MOVIMENTO,'
      '  BXP_DT_PAGO = :BXP_DT_PAGO,'
      '  BXP_HISTORICO = :BXP_HISTORICO,'
      '  BXP_HR_PAGO = :BXP_HR_PAGO,'
      '  BXP_NOMINAL = :BXP_NOMINAL,'
      '  BXP_OBSERVA = :BXP_OBSERVA,'
      '  BXP_ORIGEM_RECURSO = :BXP_ORIGEM_RECURSO,'
      '  BXP_SEQUENCIA = :BXP_SEQUENCIA,'
      '  BXP_USUARIO_ALTERACAO = :BXP_USUARIO_ALTERACAO,'
      '  BXP_USUARIO_INCLUSAO = :BXP_USUARIO_INCLUSAO,'
      '  BXP_VR_DESCONTO = :BXP_VR_DESCONTO,'
      '  BXP_VR_JURO = :BXP_VR_JURO,'
      '  BXP_VR_PAGO = :BXP_VR_PAGO'
      'where'
      '  BXP_DT_PAGO = :OLD_BXP_DT_PAGO and'
      '  BXP_HR_PAGO = :OLD_BXP_HR_PAGO and'
      '  BXP_SEQUENCIA = :OLD_BXP_SEQUENCIA')
    InsertSQL.Strings = (
      'insert into BAIXA_PAGAR'
      
        '  (BXP_BANCO, BXP_CAIXA, BXP_CH_PRED_SN, BXP_CHEQUE, BXP_COMPENS' +
        'ADO, BXP_CONTA_BANCO, '
      
        '   BXP_DATA_PREVISAO_CHEQUE, BXP_DESPACHANTE, BXP_DOCUMENTO, BXP' +
        '_DT_ALTERACAO, '
      
        '   BXP_DT_INCLUSAO, BXP_DT_MOVIMENTO, BXP_DT_PAGO, BXP_HISTORICO' +
        ', BXP_HR_PAGO, '
      
        '   BXP_NOMINAL, BXP_OBSERVA, BXP_ORIGEM_RECURSO, BXP_SEQUENCIA, ' +
        'BXP_USUARIO_ALTERACAO, '
      
        '   BXP_USUARIO_INCLUSAO, BXP_VR_DESCONTO, BXP_VR_JURO, BXP_VR_PA' +
        'GO)'
      'values'
      
        '  (:BXP_BANCO, :BXP_CAIXA, :BXP_CH_PRED_SN, :BXP_CHEQUE, :BXP_CO' +
        'MPENSADO, '
      
        '   :BXP_CONTA_BANCO, :BXP_DATA_PREVISAO_CHEQUE, :BXP_DESPACHANTE' +
        ', :BXP_DOCUMENTO, '
      
        '   :BXP_DT_ALTERACAO, :BXP_DT_INCLUSAO, :BXP_DT_MOVIMENTO, :BXP_' +
        'DT_PAGO, '
      
        '   :BXP_HISTORICO, :BXP_HR_PAGO, :BXP_NOMINAL, :BXP_OBSERVA, :BX' +
        'P_ORIGEM_RECURSO, '
      
        '   :BXP_SEQUENCIA, :BXP_USUARIO_ALTERACAO, :BXP_USUARIO_INCLUSAO' +
        ', :BXP_VR_DESCONTO, '
      '   :BXP_VR_JURO, :BXP_VR_PAGO)')
    DeleteSQL.Strings = (
      'delete from BAIXA_PAGAR'
      'where'
      '  BXP_DT_PAGO = :OLD_BXP_DT_PAGO and'
      '  BXP_HR_PAGO = :OLD_BXP_HR_PAGO and'
      '  BXP_SEQUENCIA = :OLD_BXP_SEQUENCIA')
    Left = 416
    Top = 122
  end
end
