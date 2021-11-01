object frmMenu: TfrmMenu
  Left = 192
  Top = 268
  Width = 448
  Height = 308
  Caption = 'frmMenu'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ACBrEAD1: TACBrEAD
    Left = 66
    Top = 64
  end
  object ACBrTEFD1: TACBrTEFD
    MultiplosCartoes = True
    NumeroMaximoCartoes = 3
    AutoEfetuarPagamento = True
    AutoFinalizarCupom = False
    EsperaSTS = 7
    TEFDial.ArqTemp = 'C:\TEF_DIAL\req\intpos.tmp'
    TEFDial.ArqReq = 'C:\TEF_DIAL\req\intpos.001'
    TEFDial.ArqSTS = 'C:\TEF_DIAL\resp\intpos.sts'
    TEFDial.ArqResp = 'C:\TEF_DIAL\resp\intpos.001'
    TEFDial.GPExeName = 'C:\TEF_DIAL\tef_dial.exe'
    TEFDisc.ArqTemp = 'C:\TEF_Disc\req\intpos.tmp'
    TEFDisc.ArqReq = 'C:\TEF_Disc\req\intpos.001'
    TEFDisc.ArqSTS = 'C:\TEF_Disc\resp\intpos.sts'
    TEFDisc.ArqResp = 'C:\TEF_Disc\resp\intpos.001'
    TEFDisc.GPExeName = 'C:\TEF_Disc\tef_Disc.exe'
    TEFHiper.ArqTemp = 'c:\HiperTEF\req\IntPos.tmp'
    TEFHiper.ArqReq = 'C:\HiperTEF\req\IntPos.001'
    TEFHiper.ArqSTS = 'C:\HiperTEF\resp\IntPos.sts'
    TEFHiper.ArqResp = 'C:\HiperTEF\resp\IntPos.001'
    TEFHiper.GPExeName = 'C:\HiperTEF\HiperTEF.exe'
    TEFVeSPague.EnderecoIP = 'localhost'
    TEFVeSPague.Porta = '60906'
    TEFVeSPague.TemPendencias = False
    TEFVeSPague.TransacaoCRT = 'Cartao Vender'
    TEFVeSPague.TransacaoCHQ = 'Cheque Consultar'
    TEFVeSPague.TransacaoCNC = 'Administracao Cancelar'
    TEFVeSPague.TransacaoReImpressao = 'Administracao Reimprimir'
    TEFVeSPague.TransacaoPendente = 'Administracao Pendente'
    TEFGPU.ArqTemp = 'C:\TEF_GPU\req\intpos.tmp'
    TEFGPU.ArqReq = 'C:\TEF_GPU\req\intpos.001'
    TEFGPU.ArqSTS = 'C:\TEF_GPU\resp\intpos.sts'
    TEFGPU.ArqResp = 'C:\TEF_GPU\resp\intpos.001'
    TEFGPU.GPExeName = 'C:\TEF_GPU\GPU.exe'
    TEFBanese.ArqTemp = 'C:\bcard\req\pergunta.tmp'
    TEFBanese.ArqReq = 'C:\bcard\req\pergunta.txt'
    TEFBanese.ArqSTS = 'C:\bcard\resp\status.txt'
    TEFBanese.ArqResp = 'C:\bcard\resp\resposta.txt'
    TEFBanese.ArqRespBkp = 'C:\bcard\resposta.txt'
    TEFBanese.ArqRespMovBkp = 'C:\bcard\copiamovimento.txt'
    TEFAuttar.ArqTemp = 'C:\Auttar_TefIP\req\intpos.tmp'
    TEFAuttar.ArqReq = 'C:\Auttar_TefIP\req\intpos.001'
    TEFAuttar.ArqSTS = 'C:\Auttar_TefIP\resp\intpos.sts'
    TEFAuttar.ArqResp = 'C:\Auttar_TefIP\resp\intpos.001'
    TEFAuttar.GPExeName = 'C:\Arquivos de programas\Auttar\IntegradorTEF-IP.exe'
    TEFGood.ArqTemp = 'C:\good\gettemp.dat'
    TEFGood.ArqReq = 'C:\good\getreq.dat'
    TEFGood.ArqSTS = 'C:\good\getstat.dat'
    TEFGood.ArqResp = 'C:\good\getresp.dat'
    TEFGood.GPExeName = 'C:\good\GETGoodMed.exe'
    TEFFoxWin.ArqTemp = 'C:\FwTEF\req\intpos.tmp'
    TEFFoxWin.ArqReq = 'C:\FwTEF\req\intpos.001'
    TEFFoxWin.ArqSTS = 'C:\FwTEF\rsp\intpos.sts'
    TEFFoxWin.ArqResp = 'C:\FwTEF\rsp\intpos.001'
    TEFFoxWin.GPExeName = 'C:\FwTEF\bin\FwTEF.exe'
    TEFPetrocard.ArqTemp = 'C:\CardTech\req\intpos.tmp'
    TEFPetrocard.ArqReq = 'C:\CardTech\req\intpos.001'
    TEFPetrocard.ArqSTS = 'C:\CardTech\resp\intpos.sts'
    TEFPetrocard.ArqResp = 'C:\CardTech\resp\intpos.001'
    TEFPetrocard.GPExeName = 'C:\CardTech\sac.exe'
    TEFCrediShop.ArqTemp = 'C:\tef_cshp\req\intpos.tmp'
    TEFCrediShop.ArqReq = 'C:\tef_cshp\req\intpos.001'
    TEFCrediShop.ArqSTS = 'C:\tef_cshp\resp\intpos.sts'
    TEFCrediShop.ArqResp = 'C:\tef_cshp\resp\intpos.001'
    TEFCrediShop.GPExeName = 'C:\tef_cshp\vpos_tef.exe'
    TEFTicketCar.ArqTemp = 'C:\TCS\TX\INTTCS.tmp'
    TEFTicketCar.ArqReq = 'C:\TCS\TX\INTTCS.001'
    TEFTicketCar.ArqSTS = 'C:\TCS\RX\INTTCS.RET'
    TEFTicketCar.ArqResp = 'C:\TCS\RX\INTTCS.001'
    TEFTicketCar.GPExeName = 'C:\TCS\tcs.exe'
    TEFTicketCar.NumLoja = 0
    TEFTicketCar.NumCaixa = 0
    TEFTicketCar.AtualizaPrecos = False
    TEFConvCard.ArqTemp = 'C:\ger_convenio\tx\crtsol.tmp'
    TEFConvCard.ArqReq = 'C:\ger_convenio\tx\crtsol.001'
    TEFConvCard.ArqSTS = 'C:\ger_convenio\rx\crtsol.ok'
    TEFConvCard.ArqResp = 'C:\ger_convenio\rx\crtsol.001'
    TEFConvCard.GPExeName = 'C:\ger_convcard\convcard.exe'
    Left = 24
    Top = 16
  end
  object ACBrECF1: TACBrECF
    QuebraLinhaRodape = False
    Porta = 'COM1'
    MsgAguarde = 'Aguardando a resposta da Impressora: %d segundos'
    MsgTrabalhando = 'Impressora est'#225' trabalhando'
    MsgRelatorio = 'Imprimindo %s  %d'#170' Via '
    MsgPausaRelatorio = 'Destaque a %d'#170' via, <ENTER> proxima, %d seg.'
    PaginaDeCodigo = 0
    MemoParams.Strings = (
      '[Cabecalho]'
      'LIN000=<center><b>Nome da Empresa</b></center>'
      'LIN001=<center>Nome da Rua , 1234  -  Bairro</center>'
      'LIN002=<center>Cidade  -  UF  -  99999-999</center>'
      
        'LIN003=<center>CNPJ: 01.234.567/0001-22    IE: 012.345.678.90</c' +
        'enter>'
      
        'LIN004=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>COO: <b><code>NumCupom</code' +
        '></b></td></tr></table>'
      'LIN005=<hr>'
      ' '
      '[Cabecalho_Item]'
      'LIN000=ITEM   CODIGO      DESCRICAO'
      'LIN001=QTD         x UNITARIO       Aliq     VALOR (R$)'
      'LIN002=<hr>'
      
        'MascaraItem=III CCCCCCCCCCCCCC DDDDDDDDDDDDDDDDDDDDDDDDDDDDDQQQQ' +
        'QQQQ UU x VVVVVVVVVVVVV AAAAAA TTTTTTTTTTTTT'
      ' '
      '[Rodape]'
      'LIN000=<hr>'
      
        'LIN001=<table width=100%><tr><td align=left><code>Data</code> <c' +
        'ode>Hora</code></td><td align=right>Projeto ACBr: <b><code>ACBR<' +
        '/code></b></td></tr></table>'
      'LIN002=<center>Obrigado Volte Sempre</center>'
      'LIN003=<hr>'
      ' '
      '[Formato]'
      'Colunas=48'
      'HTML=1'
      'HTML_Title_Size=2'
      'HTML_Font=<font size="2" face="Lucida Console">')
    AAC = ACBrAAC1
    EAD = ACBrEAD1
    ConfigBarras.MostrarCodigo = True
    ConfigBarras.LarguraLinha = 3
    ConfigBarras.Altura = 10
    ConfigBarras.Margem = 0
    InfoRodapeCupom.Imposto.ModoCompacto = False
    Left = 66
    Top = 16
  end
  object ACBrAAC1: TACBrAAC
    NomeArquivoAux = 'AX.txt'
    IdentPAF.Paf.TipoFuncionamento = tpfStandAlone
    IdentPAF.Paf.TipoDesenvolvimento = tpdComercializavel
    IdentPAF.Paf.IntegracaoPAFECF = tpiRetaguarda
    IdentPAF.Paf.RealizaPreVenda = False
    IdentPAF.Paf.RealizaDAVECF = False
    IdentPAF.Paf.RealizaDAVNaoFiscal = False
    IdentPAF.Paf.RealizaDAVOS = False
    IdentPAF.Paf.DAVConfAnexoII = False
    IdentPAF.Paf.RealizaLancamentoMesa = False
    IdentPAF.Paf.IndiceTecnicoProd = False
    IdentPAF.Paf.BarSimilarECFRestaurante = False
    IdentPAF.Paf.BarSimilarECFComum = False
    IdentPAF.Paf.BarSimilarBalanca = False
    IdentPAF.Paf.UsaImpressoraNaoFiscal = False
    IdentPAF.Paf.DAVDiscrFormula = False
    IdentPAF.Paf.ImpedeVendaVlrZero = False
    IdentPAF.Paf.AcumulaVolumeDiario = False
    IdentPAF.Paf.ArmazenaEncerranteIniFinal = False
    IdentPAF.Paf.EmiteContrEncerrAposREDZLEIX = False
    IdentPAF.Paf.IntegradoComBombas = False
    IdentPAF.Paf.CriaAbastDivergEncerrante = False
    IdentPAF.Paf.CadastroPlacaBomba = False
    IdentPAF.Paf.TransportePassageiro = False
    IdentPAF.Paf.TotalizaValoresLista = False
    IdentPAF.Paf.TransfPreVenda = False
    IdentPAF.Paf.TransfDAV = False
    IdentPAF.Paf.RecompoeGT = False
    IdentPAF.Paf.RecompoeNumSerie = False
    IdentPAF.Paf.EmitePED = False
    IdentPAF.Paf.CupomMania = False
    IdentPAF.Paf.MinasLegal = False
    IdentPAF.Paf.NotaLegalDF = False
    IdentPAF.Paf.ParaibaLegal = False
    IdentPAF.Paf.TrocoEmCartao = False
    Left = 108
    Top = 16
  end
  object ACBrPAF1: TACBrPAF
    LinesBuffer = 1000
    Path = 'C:\Program Files (x86)\Borland\Delphi7\Bin\'
    EAD = ACBrEAD1
    AAC = ACBrAAC1
    Left = 24
    Top = 64
  end
  object Timer1: TTimer
    Left = 192
    Top = 16
  end
  object tmImportaDados: TTimer
    Enabled = False
    Interval = 5000
    Left = 150
    Top = 16
  end
  object tmReducaoZ: TTimer
    Enabled = False
    Interval = 500
    Left = 194
    Top = 64
  end
  object tmrHoraPCvsECF: TTimer
    Enabled = False
    Interval = 60000
    Left = 151
    Top = 64
  end
  object MainMenu1: TMainMenu
    Left = 104
    Top = 64
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object PDV1: TMenuItem
        Caption = 'PDV...'
      end
      object Prvenda1: TMenuItem
        Caption = 'Pr'#233'-venda...'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        ShortCut = 115
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object EfetuarLogout1: TMenuItem
        Caption = 'Efetuar Logout'
      end
    end
    object MenuFiscal1: TMenuItem
      Caption = 'Menu Fiscal [F5]'
      ShortCut = 116
      object LX1: TMenuItem
        Caption = 'LX'
      end
      object LMFC1: TMenuItem
        Caption = 'LMFC'
      end
      object LMFCLeituradaMemriaFiscalCompleta1: TMenuItem
        Caption = 'LMFS'
      end
      object EspelhoMFD1: TMenuItem
        Caption = 'Espelho MFD'
      end
      object ArqMFD1: TMenuItem
        Caption = 'Arquivo MFD'
      end
      object abProd1: TMenuItem
        Caption = 'Tab. Prod.'
      end
      object Estoque1: TMenuItem
        Caption = 'Estoque'
        object Estoquetotal1: TMenuItem
          Caption = 'Estoque total'
        end
        object Estoqueparcial1: TMenuItem
          Caption = 'Estoque parcial...'
        end
      end
      object MovimentoporECF1: TMenuItem
        Caption = 'Movimento por ECF'
      end
      object MeiosdePagto1: TMenuItem
        Caption = 'Meios de Pagto.'
      end
      object IdentificaodoPAFECF1: TMenuItem
        Caption = 'Identifica'#231#227'o do PAF-ECF'
      end
      object VendadoPerodo1: TMenuItem
        Caption = 'Venda do Per'#237'odo'
      end
      object abndiceTcnicoProduo1: TMenuItem
        Caption = 'Tab. '#205'ndice T'#233'cnico Produ'#231#227'o'
      end
      object ParmetrosdeConfigurao1: TMenuItem
        Caption = 'Par'#226'metros de Configura'#231#227'o'
      end
      object ADVEmitidos1: TMenuItem
        Caption = 'DAV Emitidos'
        Visible = False
      end
    end
    object Janelas1: TMenuItem
      Caption = 'Janelas'
      Visible = False
      object MinimizarTodas1: TMenuItem
        Caption = 'Minimizar Todas'
      end
      object N2: TMenuItem
        Caption = '-'
      end
    end
    object Ultilitrios1: TMenuItem
      Caption = 'Ultilit'#225'rios'
      object DefinirAcessos1: TMenuItem
        Caption = 'Definir Acessos'
        Visible = False
      end
      object InicializarMdulosPDV1: TMenuItem
        Caption = 'Inicializar M'#243'dulos PDV'
        Visible = False
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Importarconfiguraes1: TMenuItem
        Caption = 'Importar configura'#231#245'es'
      end
      object Importarclientes1: TMenuItem
        Caption = 'Importar clientes'
        Visible = False
      end
      object Importarprodutos1: TMenuItem
        Caption = 'Importar produtos'
        Visible = False
      end
      object ImportarCFOP1: TMenuItem
        Caption = 'Importar CFOP'
        Visible = False
      end
      object EF1: TMenuItem
        Caption = 'TEF'
        object FunesAdministrativas1: TMenuItem
          Caption = 'Fun'#231#245'es Administrativas'
        end
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object menuRotinasECF1: TMenuItem
        Caption = 'Rotinas ECF'
        object ECF1: TMenuItem
          Caption = 'ECF'
        end
        object Sangria1: TMenuItem
          Caption = 'Sangria'
        end
        object Suprimento1: TMenuItem
          Caption = 'Suprimento'
        end
        object Caixa1: TMenuItem
          Caption = 'Caixa'
          Visible = False
        end
        object N7: TMenuItem
          Caption = '-'
        end
        object Cancelarprvenda1: TMenuItem
          Caption = 'Cancelar pr'#233'-venda'
        end
        object Cancelarcupomfiscal1: TMenuItem
          Caption = 'Cancelar cupom fiscal'
        end
        object N9: TMenuItem
          Caption = '-'
        end
        object ReduoZ1: TMenuItem
          Caption = 'Redu'#231#227'o Z'
        end
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Atualizahashproduto1: TMenuItem
        Caption = 'Atualiza hash produto'
      end
      object Atualizarprodutos1: TMenuItem
        Caption = 'Atualizar produtos'
      end
      object Atualizarestoque1: TMenuItem
        Caption = 'Atualizar estoque'
        Visible = False
      end
      object ListagemdePrVendas1: TMenuItem
        Caption = 'Listagem de Pr'#233'-Vendas'
      end
    end
    object Listadeexecutveis1: TMenuItem
      Caption = 'Lista de execut'#225'veis'
    end
  end
end
