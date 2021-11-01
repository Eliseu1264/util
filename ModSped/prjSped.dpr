program prjSped;

uses
  Forms,
  Dialogs,
  SysUtils,
  IBQuery,
  unPVendasPeriodo in '..\ModPAF\unPVendasPeriodo.pas' {frmPVendasPeriodo},
  USintegra in '..\ModPAF\USintegra.pas',
  unSpedFiscal in '..\ModPAF\unSpedFiscal.pas',
  unAlteracaoProduto in '..\ModPAF\unAlteracaoProduto.pas',
  unSpedFiscalBlocoC in '..\ModPAF\unSpedFiscalBlocoC.pas',
  unAcessoInterno in '..\ModPAF\unAcessoInterno.pas',
  md5 in '..\ModPAF\md5.pas',
  unECF in '..\ModPAF\unECF.pas',
  unConsultaTabela in '..\ModPAF\unConsultaTabela.pas',
  unMovimentoECF in '..\ModPAF\unMovimentoECF.pas',
  unValor in '..\ModPAF\unValor.pas',
  unDadosClienteCupom in '..\ModPAF\unDadosClienteCupom.pas',
  unEspelhamento in '..\ModPAF\unEspelhamento.pas',
  unMedicao in '..\ModPAF\unMedicao.pas',
  unController in '..\ModPAF\controller\unController.pas',
  unUnidadeTO in '..\ModPAF\model\unUnidadeTO.pas',
  unUsuarioTO in '..\ModPAF\model\unUsuarioTO.pas',
  unConfiguracaoController in '..\ModPAF\controller\unConfiguracaoController.pas',
  unConfiguracaoTO in '..\ModPAF\model\unConfiguracaoTO.pas',
  unR01TO in '..\ModPAF\model\unR01TO.pas',
  unR02TO in '..\ModPAF\model\unR02TO.pas',
  unR03TO in '..\ModPAF\model\unR03TO.pas',
  unR04TO in '..\ModPAF\model\unR04TO.pas',
  unR05TO in '..\ModPAF\model\unR05TO.pas',
  unR06TO in '..\ModPAF\model\unR06TO.pas',
  unR07TO in '..\ModPAF\model\unR07TO.pas',
  unEmpresaTO in '..\ModPAF\model\unEmpresaTO.pas',
  unImpressoraTO in '..\ModPAF\model\unImpressoraTO.pas',
  SpedFiscalController in '..\ModPAF\controller\SpedFiscalController.pas',
  SpedFiscalC321TO in '..\ModPAF\model\SpedFiscalC321TO.pas',
  SpedFiscalC390TO in '..\ModPAF\model\SpedFiscalC390TO.pas',
  SpedFiscalC425TO in '..\ModPAF\model\SpedFiscalC425TO.pas',
  SpedFiscalC490TO in '..\ModPAF\model\SpedFiscalC490TO.pas',
  unMeiosPagamentoTO in '..\ModPAF\model\unMeiosPagamentoTO.pas',
  unMovimentoTO in '..\ModPAF\model\unMovimentoTO.pas',
  unProdutoTO in '..\ModPAF\model\unProdutoTO.pas',
  unSintegra60ATO in '..\ModPAF\model\unSintegra60ATO.pas',
  unSintegra60DTO in '..\ModPAF\model\unSintegra60DTO.pas',
  unSintegra60MTO in '..\ModPAF\model\unSintegra60MTO.pas',
  unSintegra60RTO in '..\ModPAF\model\unSintegra60RTO.pas',
  unSintegra61RTO in '..\ModPAF\model\unSintegra61RTO.pas',
  unSintegra61TO in '..\ModPAF\model\unSintegra61TO.pas',
  unNF2CabecalhoTO in '..\ModPAF\model\unNF2CabecalhoTO.pas',
  unNF2DetalheTO in '..\ModPAF\model\unNF2DetalheTO.pas',
  unNF2Controller in '..\ModPAF\controller\unNF2Controller.pas',
  unProdutoController in '..\ModPAF\controller\unProdutoController.pas',
  unVendaTO in '..\ModPAF\model\unVendaTO.pas',
  unVendaItemTO in '..\ModPAF\model\unVendaItemTO.pas',
  unPrevendaItemController in '..\ModPAF\controller\unPrevendaItemController.pas',
  unPrevendaItemTO in '..\ModPAF\model\unPrevendaItemTO.pas',
  unClienteController in '..\ModPAF\controller\unClienteController.pas',
  unClienteTO in '..\ModPAF\model\unClienteTO.pas',
  unVendaItemController in '..\ModPAF\controller\unVendaItemController.pas',
  unECFContadorController in '..\ModPAF\controller\unECFContadorController.pas',
  unECFContadorTO in '..\ModPAF\model\unECFContadorTO.pas',
  unPrevendaController in '..\ModPAF\controller\unPrevendaController.pas',
  unPrevendaTO in '..\ModPAF\model\unPrevendaTO.pas',
  unVendaController in '..\ModPAF\controller\unVendaController.pas',
  unParcelaController in '..\ModPAF\controller\unParcelaController.pas',
  unParcelaTO in '..\ModPAF\model\unParcelaTO.pas',
  unAACController in '..\ModPAF\controller\unAACController.pas',
  unRzTotaisController in '..\ModPAF\controller\unRzTotaisController.pas',
  unRzTotaisTO in '..\ModPAF\model\unRzTotaisTO.pas',
  unImpressoraController in '..\ModPAF\controller\unImpressoraController.pas',
  unEmpresaController in '..\ModPAF\controller\unEmpresaController.pas',
  unSangriaController in '..\ModPAF\controller\unSangriaController.pas',
  unSangriaTO in '..\ModPAF\model\unSangriaTO.pas',
  unSuprimentoController in '..\ModPAF\controller\unSuprimentoController.pas',
  unSuprimentoTO in '..\ModPAF\model\unSuprimentoTO.pas',
  unUsuarioController in '..\ModPAF\controller\unUsuarioController.pas',
  SintegraController in '..\ModPAF\controller\SintegraController.pas',
  unCentroCustoController in '..\ModPAF\controller\unCentroCustoController.pas',
  unCentroCustoTO in '..\ModPAF\model\unCentroCustoTO.pas',
  unPlanoContaTO in '..\ModPAF\model\unPlanoContaTO.pas',
  unPlanoContaController in '..\ModPAF\controller\unPlanoContaController.pas',
  unAdmCartaoTO in '..\ModPAF\model\unAdmCartaoTO.pas',
  unAdmCartaoController in '..\ModPAF\controller\unAdmCartaoController.pas',
  unContaReceberTO in '..\ModPAF\model\unContaReceberTO.pas',
  unContaReceberController in '..\ModPAF\controller\unContaReceberController.pas',
  unCfopController in '..\ModPAF\controller\unCfopController.pas',
  unCfopTO in '..\ModPAF\model\unCfopTO.pas',
  unRegistroRController in '..\ModPAF\controller\unRegistroRController.pas',
  unContadorController in '..\ModPAF\controller\unContadorController.pas',
  unContadorTO in '..\ModPAF\model\unContadorTO.pas',
  unDocsEmitidosEcfController in '..\ModPAF\controller\unDocsEmitidosEcfController.pas',
  unDocsEmitidosEcfTO in '..\ModPAF\model\unDocsEmitidosEcfTO.pas',
  unNFConsumidorController in '..\ModPAF\controller\unNFConsumidorController.pas',
  unNFConsumidorDetalheController in '..\ModPAF\controller\unNFConsumidorDetalheController.pas',
  unUnidadeController in '..\ModPAF\controller\unUnidadeController.pas',
  unFornecedorController in '..\ModPAF\controller\unFornecedorController.pas',
  unFornecedorTO in '..\ModPAF\model\unFornecedorTO.pas',
  unAliquota in '..\ModPAF\controller\unAliquota.pas',
  unMenu in 'unMenu.pas' {frmMenu},
  unFuncoesPAF in '..\ModPAF\unFuncoesPAF.pas',
  unValidacao in '..\ModPAF-DAV\unValidacao.pas' {frmValidacao},
  unRelCuponsFromECF in '..\ModPAF-DAV\unRelCuponsFromECF.pas' {qrRelCuponsFromECF: TQuickRep},
  unScriptController in '..\ModPAF\controller\unScriptController.pas';

{$R *.res}

var
  i:integer;
  banco, senha, usuario: String;

begin
  Application.Initialize;
  Application.CreateForm(TfrmPVendasPeriodo, frmPVendasPeriodo);
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmValidacao, frmValidacao);
  Application.CreateForm(TqrRelCuponsFromECF, qrRelCuponsFromECF);
  try
    gsAppPath := ExtractFilePath(Application.ExeName);

    banco := ParamStr(1);
    if banco = '' then banco := gsAppPath + 'calcexpress.gdb';
    senha := ParamStr(2);
    if senha = '' then senha := '2815358';
    usuario := ParamStr(3);
    if usuario = '' then usuario := 'ASSIST';

    //unController.DB_LOCAL := 'localhost:' + gsAppPath +'PAF.GDB';
    unController.DB_REDE := banco;
    unController.SENHA_REDE := senha;

    unController.DB_LOCAL := unController.DB_REDE;
    unController.SENHA_LOCAL := unController.SENHA_REDE;

    with TIBQuery.Create(nil) do
    begin
      Database := TConexao.Create.Conectar(dRede);
      SQL.Add('SELECT COUNT(*) FROM USUARIOS ');
      SQL.Add('WHERE USU_NOME  = '+quotedStr(usuario));
      Open;
      if Fields[0].AsInteger > 0
        then frmPVendasPeriodo.Caption := 'Vendas do período - ' + usuario;
    end;
  finally
    if usuario = '' then
    begin
      MessageDlg('Não foi possível logar no sistema',mtError,[mbOk],0);
      Application.Terminate;
    end;
  end;

  EMPRESA := TEmpresaController.MostraEmpresa(dRede);
  frmPVendasPeriodo.getChaves();
  //frmPVendasPeriodo.PaginaSintegra.Destroy;

  Application.Run;

end.
