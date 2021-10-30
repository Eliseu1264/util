unit unMenu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, ToolWin, ComCtrls, Menus, StdCtrls, Navbtn, GIFCtrl, jpeg,
  ExtDlgs, Grids, DBGrids, Db, ImgList, RXCtrls, Mask, IBCustomDataSet, IBQuery,
  IBSQL, rxPlacemnt, rxToolEdit, unPadrao, RLConsts, uLkJSON;

type
  TfrmMenu = class(TFrmPadrao)
    MainMenu1: TMainMenu;
    Arquivos2: TMenuItem;
    Sair1: TMenuItem;
    Ajuda1: TMenuItem;
    Janelas1: TMenuItem;
    Minimizartodas1: TMenuItem;
    ToolBar1: TToolBar;
    SpeedButton5: TSpeedButton;
    ToolButton1: TToolButton;
    botSair: TSpeedButton;
    Ajudadosistema1: TMenuItem;
    N2: TMenuItem;
    Sobre1: TMenuItem;
    Configuraogeral1: TMenuItem;
    Empresa1: TMenuItem;
    Timer1: TTimer;
    ToolButton2: TToolButton;
    Panel1: TPanel;
    Usurios1: TMenuItem;
    Cadastrarusurios2: TMenuItem;
    Mudarsenha1: TMenuItem;
    N8: TMenuItem;
    SpeedButton1: TSpeedButton;
    FormStorage1: TFormStorage;
    Backup1: TMenuItem;
    vDataExpiracao: TLabel;
    N4: TMenuItem;
    Label1: TRxLabel;
    Data: TRxLabel;
    PanelArquivar: TPanel;
    btnArquivar: TButton;
    btnFechar: TButton;
    edtDataArquiva: TDateEdit;
    Label2: TLabel;
    Panel3: TPanel;
    qryArquivar: TIBQuery;
    PnlFechar: TPanel;
    Bevel1: TBevel;
    Image1: TImage;
    RxLabel1: TRxLabel;
    VisualizarrelatriosQRp1: TMenuItem;
    SpeedButton2: TSpeedButton;
    Verificaodeproblemascomconversodestring1: TMenuItem;
    SpeedButton11: TSpeedButton;
    ToolButton3: TToolButton;
    ExecutarcomandosSQL1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Visualizarusurios1: TMenuItem;
    N7: TMenuItem;
    EfetuarLogoff1: TMenuItem;
    Agenda1: TMenuItem;
    Definiracessos1: TMenuItem;
    Timer2: TTimer;
    Importarlogdetexto1: TMenuItem;
    PopupMenu1: TPopupMenu;
    emporrias1: TMenuItem;
    MigrardadosFortGrficas1: TMenuItem;
    Copiarbancodedados1: TMenuItem;
    Parmetrosparaexecuoderotinas1: TMenuItem;
    Definirfaixasdesequncias1: TMenuItem;
    N3: TMenuItem;
    Alteraratualizarsequncianica1: TMenuItem;
    N9: TMenuItem;
    Exportaodedados1: TMenuItem;
    InformaesfiscaisCOFISn15ReceitaFederal1: TMenuItem;
    LayOutparaSistemaFiscal1: TMenuItem;
    CopiarXMLsdasNFes1: TMenuItem;
    ED776: TComboBox;
    ED777: TMaskEdit;
    ED778: TMaskEdit;
    ImportarregistradoresPAF1: TMenuItem;
    N10: TMenuItem;
    Limpardadoscompactar1: TMenuItem;
    N1: TMenuItem;
    menuProcessarScript: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure botSairClick(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Ajudadosistema1Click(Sender: TObject);
    procedure Configuraogeral1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Cadastrarusurios2Click(Sender: TObject);
    procedure Mudarsenha1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Backup1Click(Sender: TObject);
    procedure Gerarrelatrios1Click(Sender: TObject);
    procedure Relatrios1Click(Sender: TObject);
    procedure Editordetexto1Click(Sender: TObject);
    procedure Editorpessoal1Click(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnArquivarClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtDataArquivaChange(Sender: TObject);
    procedure VisualizarrelatriosQRp1Click(Sender: TObject);
    procedure Verificaodeproblemascomconversodestring1Click(
      Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure ExecutarcomandosSQL1Click(Sender: TObject);
    procedure Visualizarusurios1Click(Sender: TObject);
    procedure EfetuarLogoff1Click(Sender: TObject);
    procedure Agenda1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Definiracessos1Click(Sender: TObject);
    procedure Configurarbackup1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Importarlogdetexto1Click(Sender: TObject);
    procedure MigrardadosFortGrficas1Click(Sender: TObject);
    procedure Copiarbancodedados1Click(Sender: TObject);
    procedure Parmetrosparaexecuoderotinas1Click(Sender: TObject);
    procedure Definirfaixasdesequncias1Click(Sender: TObject);
    procedure Alteraratualizarsequncianica1Click(Sender: TObject);
    procedure InformaesfiscaisCOFISn15ReceitaFederal1Click(
      Sender: TObject);
    procedure LayOutparaSistemaFiscal1Click(Sender: TObject);
    procedure CopiarXMLsdasNFes1Click(Sender: TObject);
    procedure ImportarregistradoresPAF1Click(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
  private
    // Estas 2 procedures destinam-se a arquivar, ou seja, colocar a letra 'S' nos campos xxx_OCULT_1
    // das tabelas CONTAS_PAGAR,CONTAS_RECEBER,LANCAMENTO_DIA, FATURA e ENTRADA, marcando conforme
    // uma data informada os lançamentos tipo 1 (extra-oficial) que não devem mais ser exibidos
    // nos forms de consultas ou relatórios.
    procedure UpdateContas;
    procedure UpdateOutros;
    { Private declarations }
  public
    { Public declarations }
    Vendedores1: TMenuItem;
    CodCli_Acessando: string;
    acessa_conexao: boolean;
    lista: TStringList;
    mostraPrint, mostraEmail, controla : boolean;
    Ver_Email: Boolean;
    SalvarRelQRP: boolean;

    ImprimirAgora: Boolean;
    FImpressora: String;
    NomeUsuario: String;
    Diretorio: String;
    CodigoDaEmpresa: String;
    NomeDaEmpresa: String;
    FantasiaDaEmpresa: String;
    CGCDaEmpresa: String;
    EmpEndNumDaEmpresa: String;
    EstabUnico : String;
    InscMunicipalDaEmpresa: string;
    HomePageDaEmpresa: string;
    TerminarAcessoInterno : boolean;
    EnderecoDaEmpresa: string;
  	BairroDaEmpresa: string;
  	CepDaEmpresa: string;
  	CidadeDaEmpresa: string;
  	UFDaEmpresa: string;
  	PaisDaEmpresa: string;
  	FoneDaEmpresa: string;
  	FaxDaEmpresa: string;
  	CGFDaEmpresa: string;
  	EmailDaEmpresa: string;
  	ContatoDaEmpresa: string;
    threadOrigem: string;
    procedure AtualizaMenu(HabilitaGerencia : Boolean);
    procedure GetValores;
  end;

const
  NOME_MODULO = 'UTIL';

var
  frmMenu: TfrmMenu;
  oldObj : TFarProc;

implementation

uses unFuncoes, unerro, unSobre, unConfiguraGeral, unEmpresa, unAcessos,
  unCadastrarSenhas, unMudancaSenha, unDataModule2, unAcesso, unGeraRelatorios,
  unRelatorios, unOffice, unVisualizarRel, unErrosConversaoString, unAgenda,
  unSqlExplorer, unUsuariosLogados, unConfigBackup, unImportaLogTexto,
  unMigrarDads, unRotinas, unFaixaSequencia, unBackupNovo, unSequenciaUnica,
  unAtoCofis15, unExportaFiscal, unSubstituirVendedor, unCopiaNFe, unPafImport,
  unManifestacao, unGerarCFe, unPesquisa, unServerMailLista, Compliance;

{$R *.DFM}

procedure TfrmMenu.GetValores;
Begin
  dm2.tblEmpresa.Open;
  NomeDaEmpresa := dm2.tblEmpresaEMP_NOME.Value;
  EnderecoDaEmpresa := dm2.tblEmpresaEMP_ENDERECO.Value;
  BairroDaEmpresa := dm2.tblEmpresaEMP_BAIRRO.Value;
  CepDaEmpresa := dm2.tblEmpresaEMP_CEP.Value;
  CidadeDaEmpresa := dm2.tblEmpresaEMP_CIDADE.Value;
  UFDaEmpresa := dm2.tblEmpresaEMP_UF.Value;
  PaisDaEmpresa := 'BR';
  FoneDaEmpresa := dm2.tblEmpresaEMP_FONE.Value;
  FaxDaEmpresa := dm2.tblEmpresaEMP_FAX.Value;
  CGCDaEmpresa := dm2.tblEmpresaEMP_CGC.Value;
  CGFDaEmpresa := dm2.tblEmpresaEMP_CGF.Value;
  EMailDaEmpresa := dm2.tblEmpresaEMP_EMAIL.Value;
  ContatoDaEmpresa := dm2.tblEmpresaEMP_CONTATO.Value;
  dm2.tblEmpresa.Close;
  Caption := NomeDaEmpresa + ' - [UTILITÁRIOS] - V. '+GetBuildInfo(Application.exeName)+
            ' de '+FormatDateTime('DD/MM/YYYY HH:MM', FileDateToDateTime(FileAge(Application.ExeName)));
End;

procedure TfrmMenu.FormShow(Sender: TObject);
begin
   TwoDigitYearCenturyWindow := 70;
   //
   Diretorio := PegaDiretorioDoBanco;
   GetValores;
   Data.Caption := 'Data    : '+Copy(DateTimeToStr(Now),1,10);

   // Temporário - apenas para forçar fixar o numero de série para 27/12/2005
   if ((CGCdaEmpresa = '01163890000115') or // Clube
      (CGCdaEmpresa = '01932204000123') or // Access
      (CGCdaEmpresa = '05221897000105')) and // BrasilCredito
      (DateToStr(Date) = '26/12/2005') then
   begin
		 qryArquivar.Close;
		 qryArquivar.Sql.Clear;
		 qryArquivar.Sql.Add('SELECT * FROM CLSDADO');
		 qryArquivar.Open;
     if (CGCdaEmpresa = '01163890000115') and
        (qryArquivar.FieldByName('CFG_TELA').AsString <> '37347893-526') then // Clube
     begin
  		 qryArquivar.Close;
    	 qryArquivar.Sql.Clear;
   		 qryArquivar.Sql.Add('UPDATE CLSDADO SET CFG_TELA = ''37347893-526''');
       qryArquivar.ExecSQL;
    	 qryArquivar.Sql.Clear;
   		 qryArquivar.Sql.Add('UPDATE CLSDADO SET CFG_VIDEO = ''2:783464¨‘¨‘¨‘¨‘''');
       qryArquivar.ExecSQL;
     end;

     if (CGCdaEmpresa = '01932204000123') and // Access
        (qryArquivar.FieldByName('CFG_TELA').AsString <> '373478933-513') then // Clube
     begin
  		 qryArquivar.Close;
    	 qryArquivar.Sql.Clear;
   		 qryArquivar.Sql.Add('UPDATE CLSDADO SET CFG_TELA = ''373478933-513''');
       qryArquivar.ExecSQL;
    	 qryArquivar.Sql.Clear;
   		 qryArquivar.Sql.Add('UPDATE CLSDADO SET CFG_VIDEO = ''2:783464¨‘¨‘¨‘¨‘''');
       qryArquivar.ExecSQL;
     end;

     if (CGCdaEmpresa = '05221897000105') and // Credito
        (qryArquivar.FieldByName('CFG_TELA').AsString <> '37347893-523') then
     begin
  		 qryArquivar.Close;
    	 qryArquivar.Sql.Clear;
   		 qryArquivar.Sql.Add('UPDATE CLSDADO SET CFG_TELA = ''37347893-523''');
       qryArquivar.ExecSQL;
    	 qryArquivar.Sql.Clear;       
   		 qryArquivar.Sql.Add('UPDATE CLSDADO SET CFG_VIDEO = ''2:783464¨‘¨‘¨‘¨‘''');
       qryArquivar.ExecSQL;
     end;

   end;

   if not dm2.tblEmpresa.Active then
     dm2.tblEmpresa.Open;
   if Trim(dm2.tblEmpresaEMP_TITULO.AsString) <> '' then
   begin
     Application.Title := Trim(dm2.tblEmpresaEMP_TITULO.AsString)+'('+Application.Title+')';
     Data.Caption      := 'Ident    : '+Copy(dm2.tblEmpresaEMP_TITULO.AsString,1,12);
   end;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
  gsAppPath := ExtractFilePath(Application.ExeName);
  Timer1.Enabled := True;
  WindowMenu := Janelas1;
  controla := False;  
end;

procedure TfrmMenu.botSairClick(Sender: TObject);
begin                                         
  if criticaBackup then
  begin
    Exit;
  end;
  
  Application.Terminate;
end;

procedure TfrmMenu.Sobre1Click(Sender: TObject);
begin
  frmSobre := TfrmSobre.Create(Application);
  frmSobre.ShowModal;
  frmSobre.Free;
end;

procedure TfrmMenu.Ajudadosistema1Click(Sender: TObject);
begin
  Application.HelpCommand(Help_Contents,0)
end;

procedure TfrmMenu.Configuraogeral1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmConfiguracaoGeral, frmConfiguracaoGeral);
    frmConfiguracaoGeral.ShowModal;
  finally
    frmConfiguracaoGeral.Free();
  end;
end;

procedure TfrmMenu.Timer1Timer(Sender: TObject);
begin
  try
    Timer1.Enabled := False;
    frmAcesso.ShowModal;
    Log_Usuario(False);
    Log_Usuario(True);

    if VerificaParametros('060') <> 'ERRO' then
    begin
      if Trim(VerificaParametros('060')) <> '999' then
      begin
        Timer2.Interval := 1000 * 60 * StrToIntDef(verificaParametros('060'),10);
        Timer2.Enabled := True;
      end;
    end;
  finally
    if (UpperCase(frmAcesso.Operador.Text) <> 'ASSIST') then
      if not versaoEstaAtualizada then
      begin
        Label1.Font.Color := clRed;
        Data.Font.Color := Label1.Font.Color;
        Data.Caption := 'Versão desatualizada';
        MostraMSG(Self, Data.Caption, 3000);
      end;
  end;
end;

procedure TfrmMenu.Mudarsenha1Click(Sender: TObject);
begin
  if TfrmMudancaSenha(Application.FindComponent('frmMudancaSenha')) = nil
    then frmMudancaSenha := TfrmMudancaSenha.Create(Application)
    else frmMudancaSenha.Show;
end;

procedure TfrmMenu.SpeedButton1Click(Sender: TObject);
begin
  if not FmDireitos.soConsulta then
  begin
    if FmDireitos.Acesso(fmDireitos.mOperador, frmMenu.Definiracessos1) then
      Definiracessos1Click(Self);
  end
  else
    Definiracessos1Click(Self);
end;

procedure TfrmMenu.SpeedButton2Click(Sender: TObject);
begin
  if not FmDireitos.soConsulta then
  begin
    if FmDireitos.Acesso(fmDireitos.mOperador, frmMenu.Cadastrarusurios2) then
      Cadastrarusurios2Click(Self);
  end
  else
    Cadastrarusurios2Click(Self);
end;

procedure MostreFundo(Canvas:TCanvas; i:TImage; w,h:integer);
var x,y: integer;
begin
  y := 0;
  while y < h do
  begin
    x := 0;
    while x < w do
    begin
      Canvas.Draw(x,y,i.Picture.Bitmap);
      inc(x, i.Picture.Bitmap.Width);
    end;
    inc(y, i.Picture.Bitmap.Height);
  end;
end;

procedure TfrmMenu.Backup1Click(Sender: TObject);
begin
  //WinExec('IB_Backup',SW_SHOW);
  frmBackupNovo := TfrmBackupNovo.Create(self);
  try
    frmBackupNovo.ShowModal;
  finally
    frmBackupNovo.Free;
  end;

end;

procedure TfrmMenu.Gerarrelatrios1Click(Sender: TObject);
begin
  frmGeraRelatorios.ShowModal;
end;

procedure TfrmMenu.Relatrios1Click(Sender: TObject);
begin
  frmRelatorios.ShowModal;
end;

procedure TfrmMenu.Editordetexto1Click(Sender: TObject);
begin
	  if WinExec('Editor',SW_SHOW) < 31 then
    	Mensagem('Arquivo Editor.exe não encontrado em ' + GetCurrentDir);
end;

procedure TfrmMenu.Editorpessoal1Click(Sender: TObject);
begin
  if TfrmOffice(Application.FindComponent('frmOffice')) = nil then
    frmOffice := TfrmOffice.Create(Application)
  else
  begin
    Mensagem('Janela já está ativa');
    frmOffice.Show;
  end;
end;

procedure TfrmMenu.btnFecharClick(Sender: TObject);
begin
	edtDataArquiva.Clear;
	PanelArquivar.Visible:=False;
end;

procedure TfrmMenu.btnArquivarClick(Sender: TObject);
begin
	if Trim(edtDataArquiva.Text)<>'/  /' then
  	try
      if Pergunta('Arquivar registros até ' + edtDataArquiva.Text +
      		#13+#13'Confirma a operação?')='S' then
      begin
      	// Atualiza CONTAS_PAGAR e CONTAS_RECEBER;
        UpdateContas;
        // Atualiza LANCAMENTO_DIA, ENTRADAS e FATURAS
        UpdateOutros;
        Mensagem('Operação realizada com sucesso!');
      end;
    finally
			edtDataArquiva.Clear;
      PanelArquivar.Visible:=False;
    end;
end;

procedure TfrmMenu.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
	if (ssRight in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
  begin
  	PanelArquivar.Left:=(frmMenu.ClientWidth div 2)-(PanelArquivar.Width div 2);
  	PanelArquivar.Top:=(frmMenu.ClientHeight div 2)-(PanelArquivar.Height div 2);
    PanelArquivar.Visible:=True;
  end;
end;

procedure TfrmMenu.UpdateContas;
var I:Integer;
	TabelaC,TabelaB,Ocult_1,SeqC,SeqB,Vr,VrPg,Flg,DtPg:ShortString;
begin
 	if not qryArquivar.Transaction.Active then
		qryArquivar.Transaction.StartTransaction;
	for I:=0 to 1 do
  begin
  	Case I of
	    0:begin    // CONTAS A PAGAR
					TabelaC:='CONTAS_PAGAR';
					Ocult_1:='CTP_OCULT_1';
    		  SeqC:='CTP_SEQUENCIA';
        	TabelaB:='BAIXA_PAGAR';
	        SeqB:='BXP_SEQUENCIA';
  	      Vr:='CTP_VALOR';
    	    VrPg:='CTP_VRPAGO';
      	  Flg:='CTP_FLG';
        	DtPg:='BXP_DT_PAGO';
	    	end;
  	  1:begin    // CONTAS A RECEBER
					TabelaC:='CONTAS_RECEBER';
					Ocult_1:='CTR_OCULT_1';
    	  	SeqC:='CTR_SEQUENCIA';
	        TabelaB:='BAIXA_RECEB';
  	      SeqB:='CTR_SEQUENCIA';   { deveria ser BXR_SEQUENCIA, mas não é }
    	    Vr:='CTR_VR_DEBITO';
      	  VrPg:='CTR_TOTAL_CREDITO';
        	Flg:='CTR_FLG';
  	      DtPg:='BXR_DT_CREDITO';
	    	end;
    end;
		qryArquivar.Sql.Clear;
		qryArquivar.Sql.Add('Update '+TabelaC                 );
		qryArquivar.Sql.Add('Set '+Ocult_1+'='+#39+'S'+#39    );
		qryArquivar.Sql.Add(' Where '+SeqC+' In'              );
		qryArquivar.Sql.Add(' (Select '+SeqC                  );
		qryArquivar.Sql.Add('  From '+TabelaC+' C'            );
		qryArquivar.Sql.Add('  Inner Join '+TabelaB+' B'      );
		qryArquivar.Sql.Add('    On (B.'+SeqB+'=C.'+SeqC+')'  );
    qryArquivar.Sql.Add('  Where (C.'+Ocult_1+' Is Null or '+Ocult_1+' <> ''S'' )');
		qryArquivar.Sql.Add('  And C.'+VrPg+'=C.'+Vr          );
		qryArquivar.Sql.Add('  And C.'+Flg+'='+#39+'1'+#39    );
		qryArquivar.Sql.Add('  And B.'+SeqB+' Not In'         );
		qryArquivar.Sql.Add('    (Select DISTINCT BB.'+SeqB   );
		qryArquivar.Sql.Add('     From '+TabelaB+' BB'        );
		qryArquivar.Sql.Add('     Where BB.'+DtPg+'>'+QuotedStr(
    	FormatDateTime('mm/dd/yyyy',StrToDateTime(edtDataArquiva.Text))));
		qryArquivar.Sql.Add('    )');
		qryArquivar.Sql.Add(' )'   );
	  qryArquivar.ExecSQL;
  end;
 	qryArquivar.Transaction.Commit;
end;

procedure TfrmMenu.UpdateOutros;
var I: Integer;
	Tabela,Ocult_1,Flg,Data:ShortString;
begin
 	if not qryArquivar.Transaction.Active then
		qryArquivar.Transaction.StartTransaction;
	for I:=0 to 4 do
  begin
  	Case I of
    	0:begin    // LANCAMENTO_DIA
					Tabela:='LANCAMENTO_DIA';
  	      Ocult_1:='LND_OCULT_1';
    	    Flg:='LND_FLG';
      	  Data:='LND_DATA';
      	end;
      1:begin    // ENTRADAS
					Tabela:='ENTRADAS';
  	      Ocult_1:='ENT_OCULT_1';
    	    Flg:='ENT_FLG';
      	  Data:='ENT_EMISSAO';
      	end;
      2:begin    // FATURAS
					Tabela:='FATURAS';
  	      Ocult_1:='FTR_OCULT_1';
    	    Flg:='FTR_FLG';
      	  Data:='FTR_DTEMISSAO';
      	end;
      3:begin    // EXTRATO DE CONTAS
					Tabela:='EXTRATO_DE_CONTA';
  	      Ocult_1:='EXC_OCULT_1';
    	    Flg:='EXC_FLG';
      	  Data:='EXC_DATA';
      	end;				//********  CONCLUIR  *********//
    end;
		qryArquivar.Sql.Clear;
		qryArquivar.Sql.Add('Update '+Tabela);
    qryArquivar.Sql.Add('Set '+Ocult_1+' = '+#39+'S'+#39);
    //ASPAS
		qryArquivar.Sql.Add('Where ('+Ocult_1+' Is Null or '+Ocult_1+' <> ''S'' )');
    qryArquivar.Sql.Add('And '+Flg+'='+#39+'1'+#39);
    qryArquivar.Sql.Add('And '+Data+'<='+QuotedStr(
                         FormatDateTime('mm/dd/yyyy',StrToDateTime(edtDataArquiva.Text))));
	  qryArquivar.ExecSQL;
  end;
 	qryArquivar.Transaction.Commit;
end;

procedure TfrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if criticaBackup then
    Action := caNone
  else
  begin
    PnlFechar.Top  := 288;
    PnlFechar.Left := 198;
    PnlFechar.Visible := True;
    Application.ProcessMessages;
    Log_Usuario(False);
  end;
end;

procedure TfrmMenu.edtDataArquivaChange(Sender: TObject);
begin
	if Length(Trim(edtDataArquiva.Text))>=8
    then btnArquivar.Enabled:=True
    else btnArquivar.Enabled:=False;
end;

procedure TfrmMenu.AtualizaMenu(HabilitaGerencia : Boolean);
begin

end;

procedure TfrmMenu.VisualizarrelatriosQRp1Click(Sender: TObject);
begin
  if TFrmVisualizarRel(Application.FindComponent('FrmVisualizarRel')) = nil then
  begin
    FrmVisualizarRel := TFrmVisualizarRel.Create(Application);
    FrmVisualizarRel.QuickRep1.Preview;
  end
  else
    FrmVisualizarRel.QuickRep1.Preview;
end;

procedure TfrmMenu.Verificaodeproblemascomconversodestring1Click(
  Sender: TObject);
begin
	if TfrmErrosConversaoString(Application.FindComponent('frmErrosConversaoString')) = nil
    then frmErrosConversaoString := TfrmErrosConversaoString.Create(Application)
    else frmErrosConversaoString.Show;
end;

procedure TfrmMenu.SpeedButton11Click(Sender: TObject);
begin
  if not FmDireitos.soConsulta then
  begin
    if FmDireitos.Acesso(unMenu.NOME_MODULO, fmDireitos.mOperador, 'Agenda1') then
      Agenda1Click(Self);
  end
  else
    Agenda1Click(Self);
end;

procedure TfrmMenu.ExecutarcomandosSQL1Click(Sender: TObject);
begin
	if TfrmSqlExplorer(Application.FindComponent('frmSqlExplorer')) = nil
    then frmSqlExplorer:= TfrmSqlExplorer.Create(Application)
    else frmSqlExplorer.Show;
end;

procedure TfrmMenu.Visualizarusurios1Click(Sender: TObject);
begin
	if TfrmUsuariosLogados(Application.FindComponent('frmUsuariosLogados')) = nil
    then frmUsuariosLogados := TfrmUsuariosLogados.Create(Application)
    else frmUsuariosLogados.Show;
end;

procedure TfrmMenu.EfetuarLogoff1Click(Sender: TObject);
Var
  i: Integer;
begin
  if Pergunta( 'Deseja fechar todas as janelas abertas,'+#13#10+'e se logar como novo usuário ?' ) = 'S' then
  begin
  //  mostra_oculta_imagens_fundo(true);
    with frmMenu do
    for I := MDIChildCount-1 downto 0 do
      MDIChildren[I].Close;
    fmDireitos.FormCreate(Sender);
    frmAcesso.ShowModal;
  end;
end;

procedure TfrmMenu.Agenda1Click(Sender: TObject);
begin
	if TfrmAgenda(Application.FindComponent('frmAgenda')) = nil
    then frmAgenda:= TfrmAgenda.Create(Application)
    else frmAgenda.Show;
end;

procedure TfrmMenu.SpeedButton5Click(Sender: TObject);
begin
  if not FmDireitos.soConsulta then
  begin
    if FmDireitos.Acesso(fmDireitos.mOperador, frmMenu.Configuraogeral1) then
      Configuraogeral1Click(Self);
  end
  else
    Configuraogeral1Click(Self);
end;

procedure TfrmMenu.Definiracessos1Click(Sender: TObject);
begin
  FmDireitos.ShowModal;
end;

procedure TfrmMenu.Configurarbackup1Click(Sender: TObject);
begin
  try
    frmConfigBackup := TfrmConfigBackup.Create(Application);
    frmConfigBackup.ShowModal;
  finally
    if Assigned(frmConfigBackup) then
      FreeAndNil(frmConfigBackup);
  end;
end;

procedure TfrmMenu.Timer2Timer(Sender: TObject);
begin
  executaBackup('');
  TTimer(Sender).Interval := StrToIntDef(verificaParametros('060'),0) * 1000 * 60;
end;

procedure TfrmMenu.Importarlogdetexto1Click(Sender: TObject);
begin
  if TfrmImportaLogTexto(Application.FindComponent('frmImportaLogTexto')) = nil
    then frmImportaLogTexto := TfrmImportaLogTexto.Create(Application)
    else frmImportaLogTexto.Show;
end;

procedure TfrmMenu.MigrardadosFortGrficas1Click(Sender: TObject);
begin
	if TfrmMigrarDads(Application.FindComponent('frmMigrarDads')) = nil
    then frmMigrarDads := TfrmMigrarDads.Create(Application)
    else frmMigrarDads.Show;
end;

procedure TfrmMenu.Copiarbancodedados1Click(Sender: TObject);
var
  origem, destino: string;
begin
  screen.cursor := crSQLWait;
  try
    origem  := verificaParametros('239');
    destino := verificaParametros('240');

    if fileExists(origem) then
    begin
      if copyFile(PChar(origem), PChar(destino), false)
        then mensagem('O arquivo foi copiado para ''' + extractFilePath(destino) + '''!')
        else msgInfo('O arquivo não foi copiado!');
    end
    else Exception.create('O arquivo ''' + origem + ''' não existe!');

    screen.cursor := crDefault;
  except
    screen.cursor := crDefault;
    raise;
  end;
end;

procedure TfrmMenu.Parmetrosparaexecuoderotinas1Click(Sender: TObject);
begin
  if TfrmRotinas(Application.FindComponent('frmRotinas')) = nil
    then frmRotinas := TfrmRotinas.Create(Application)
    else frmRotinas.Show;
end;

procedure TfrmMenu.Definirfaixasdesequncias1Click(Sender: TObject);
begin
  if TfrmFaixaSequencia(Application.FindComponent('frmFaixaSequencia')) = nil
    then frmFaixaSequencia := TfrmFaixaSequencia.Create(Application)
    else frmFaixaSequencia.Show;
end;

procedure TfrmMenu.Alteraratualizarsequncianica1Click(Sender: TObject);
begin
  if TfrmSequenciaUnica(Application.FindComponent('frmSequenciaUnica')) = nil
    then frmSequenciaUnica := TfrmSequenciaUnica.Create(Application)
    else frmSequenciaUnica.Show;
end;

procedure TfrmMenu.InformaesfiscaisCOFISn15ReceitaFederal1Click(
  Sender: TObject);
begin
  if TfrmAtoCofis15(Application.FindComponent('frmAtoCofis15')) = nil
    then frmAtoCofis15 := TfrmAtoCofis15.Create(Application)
    else frmAtoCofis15.Show;
end;

procedure TfrmMenu.LayOutparaSistemaFiscal1Click(Sender: TObject);
begin
  if TfrmExportaFiscal(Application.FindComponent('frmExportaFiscal')) = nil
    then frmExportaFiscal := TfrmExportaFiscal.Create(Application)
    else frmExportaFiscal.Show;
end;

procedure TfrmMenu.CopiarXMLsdasNFes1Click(Sender: TObject);
begin
  if TfrmCopiaNFe(Application.FindComponent('frmCopiaNFe')) = nil
    then frmCopiaNFe := TfrmCopiaNFe.Create(Application)
    else frmCopiaNFe.Show;
end;

procedure TfrmMenu.ImportarregistradoresPAF1Click(Sender: TObject);
begin
  if TfrmPafImport(Application.FindComponent('frmPafImport')) = nil
    then frmPafImport := TfrmPafImport.Create(Application)
    else frmPafImport.Show;
end;

procedure TfrmMenu.Cadastrarusurios2Click(Sender: TObject);
begin
  if TfrmCadastrarSenhas(Application.FindComponent('frmCadastrarSenhas')) = nil
    then frmCadastrarSenhas := TfrmCadastrarSenhas.Create(Application)
    else frmCadastrarSenhas.Show;
end;
procedure TfrmMenu.Empresa1Click(Sender: TObject);
begin
  if TfrmEmpresa(Application.FindComponent('frmEmpresa')) = nil
    then frmEmpresa := TfrmEmpresa.Create(Application)
    else frmEmpresa.Show;
end;

//Initialization
//  RLConsts.SetVersion(3,70,'B');

end.
