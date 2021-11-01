unit unMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ACBrEAD, ACBrPAF, Menus, ACBrAAC, ACBrBase, ACBrECF, ACBrTEFD,
  ExtCtrls;

type
  TfrmMenu = class(TForm)
    ACBrEAD1: TACBrEAD;
    ACBrTEFD1: TACBrTEFD;
    ACBrECF1: TACBrECF;
    ACBrAAC1: TACBrAAC;
    ACBrPAF1: TACBrPAF;
    Timer1: TTimer;
    tmImportaDados: TTimer;
    tmReducaoZ: TTimer;
    tmrHoraPCvsECF: TTimer;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    PDV1: TMenuItem;
    Prvenda1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    N3: TMenuItem;
    EfetuarLogout1: TMenuItem;
    MenuFiscal1: TMenuItem;
    LX1: TMenuItem;
    LMFC1: TMenuItem;
    LMFCLeituradaMemriaFiscalCompleta1: TMenuItem;
    EspelhoMFD1: TMenuItem;
    ArqMFD1: TMenuItem;
    abProd1: TMenuItem;
    Estoque1: TMenuItem;
    Estoquetotal1: TMenuItem;
    Estoqueparcial1: TMenuItem;
    MovimentoporECF1: TMenuItem;
    MeiosdePagto1: TMenuItem;
    IdentificaodoPAFECF1: TMenuItem;
    VendadoPerodo1: TMenuItem;
    abndiceTcnicoProduo1: TMenuItem;
    ParmetrosdeConfigurao1: TMenuItem;
    ADVEmitidos1: TMenuItem;
    Janelas1: TMenuItem;
    MinimizarTodas1: TMenuItem;
    N2: TMenuItem;
    Ultilitrios1: TMenuItem;
    DefinirAcessos1: TMenuItem;
    InicializarMdulosPDV1: TMenuItem;
    N4: TMenuItem;
    Importarconfiguraes1: TMenuItem;
    Importarclientes1: TMenuItem;
    Importarprodutos1: TMenuItem;
    ImportarCFOP1: TMenuItem;
    EF1: TMenuItem;
    FunesAdministrativas1: TMenuItem;
    N5: TMenuItem;
    menuRotinasECF1: TMenuItem;
    ECF1: TMenuItem;
    Sangria1: TMenuItem;
    Suprimento1: TMenuItem;
    Caixa1: TMenuItem;
    N7: TMenuItem;
    Cancelarprvenda1: TMenuItem;
    Cancelarcupomfiscal1: TMenuItem;
    N9: TMenuItem;
    ReduoZ1: TMenuItem;
    N6: TMenuItem;
    Atualizahashproduto1: TMenuItem;
    Atualizarprodutos1: TMenuItem;
    Atualizarestoque1: TMenuItem;
    ListagemdePrVendas1: TMenuItem;
    Listadeexecutveis1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
    NomeDaEmpresa: string;
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

end.
