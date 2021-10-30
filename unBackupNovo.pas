unit unBackupNovo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, DB, IBCustomDataSet, IBUpdateSQL, IBQuery, Grids,
  DBGrids, RXDBCtrl, Menus, ExtCtrls, StdCtrls, Mask, Buttons, StrUtils,
  rxPlacemnt, rxToolEdit, JvExExtCtrls, JvExtComponent, JvCaptionPanel,
  msxml2_tlb, uS3Thread, uS3Storage,
  AbZipper, AbArcTyp, AbZBrows, AbMeter, AbBrowse, AbBase;

type
  TfrmBackupNovo = class(TForm)
    qyBackup: TIBQuery;
    qyBackupDIA: TStringField;
    qyBackupBAK_DIA: TIntegerField;
    qyBackupBAK_HORA: TTimeField;
    qyBackupBAK_DESCRICAO: TIBStringField;
    qyBackupBAK_MAQUINA: TIBStringField;
    qyBackupBAK_NOME_SERVIDOR: TIBStringField;
    qyBackupBAK_SENHA: TIBStringField;
    qyBackupBAK_DESTINO: TIBStringField;
    qyBackupBAK_USUARIO: TIBStringField;
    qyBackupBAK_CAMINHO_GBAK: TIBStringField;
    upBackup: TIBUpdateSQL;
    dsBackup: TDataSource;
    FormStorage1: TFormStorage;
    RxDBGrid1: TRxDBGrid;
    PopupMenu1: TPopupMenu;
    Incluirnovo1: TMenuItem;
    Excluir1: TMenuItem;
    pnlNovo: TJvCaptionPanel;
    cbDia: TComboBox;
    Label2: TLabel;
    edtHora: TMaskEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Button1: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Label7: TLabel;
    edtPasta: TDirectoryEdit;
    edtGbak: TDirectoryEdit;
    Bevel2: TBevel;
    Label6: TLabel;
    Button2: TButton;
    Button3: TButton;
    Label8: TLabel;
    pnlMaquina: TPanel;
    Label9: TLabel;
    edtMaquina: TEdit;
    Label10: TLabel;
    Button5: TButton;
    Button6: TButton;
    Informarmquinaparabackup1: TMenuItem;
    Label11: TLabel;
    AbMeter2: TAbMeter;
    AbZipper1: TAbZipper;
    procedure Excluir1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure qyBackupCalcFields(DataSet: TDataSet);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edtGbakChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Incluirnovo1Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Informarmquinaparabackup1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnlNovoButtonClick(Sender: TObject; Button: TJvCapBtnStyle);
    procedure pnlNovoExit(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
//  procedure ThreadDone(sender: TObject);

  private
    theThread: TS3Thread;
    procedure habDesBotoes(h: boolean);
    procedure EnvioSite(diretorio, pathArq, arquivo: String);

  public
    { Public declarations }
    function IsThreadNil: boolean;

  end;

var
  FS3Storage: TS3Storage;
  frmBackupNovo: TfrmBackupNovo;

const Dias : Array [1..7] of String = ('Domingo',
                                       'Segunda Feira',
                                       'Terça Feira',
                                       'Quarta Feira',
                                       'Quinta Feira',
                                       'Sexta Feira',
                                       'Sábado');

implementation

uses unDataModule2, unFuncoes, IBDatabase, unMenu;

{$R *.dfm}

procedure TfrmBackupNovo.Excluir1Click(Sender: TObject);
begin
  if not qyBackup.IsEmpty then
  begin
    qyBackup.Delete;
    dm2.IBTransaction1.CommitRetaining;
  end;
end;

procedure TfrmBackupNovo.FormCreate(Sender: TObject);
var
  i: integer;
  keyPublic, keyPrivate: String;
begin
  frmmenu.threadOrigem := 'B';
  if ((VerificaParametros('878')<>'') and (VerificaParametros('879')<>'') and (VerificaParametros('880')<>'') and (VerificaParametros('880')<>'ERRO') ) or
     ((VerificaParametros('881')<>'') and (VerificaParametros('882')<>'') and (VerificaParametros('883')<>'') and (VerificaParametros('883')<>'ERRO')) then
  begin
    if VerificaParametros('881')<>'' then
    begin
      keyPublic  := DesembaralhaChaveAWS(VerificaParametros('882'));
      keyPrivate := DesembaralhaChaveAWS(VerificaParametros('881'));
    end
    else
    begin
      keyPublic  := DesembaralhaChaveAWS(VerificaParametros('879'));
      keyPrivate := DesembaralhaChaveAWS(VerificaParametros('878'));
    end;
    FS3Storage := TS3Storage.create(keyPublic, keyPrivate);
    self.theThread := nil;
  end;
  //
  qyBackup.Close;
  qyBackup.SQL.Clear;
  qyBackup.SQL.Add('SELECT          ');
  qyBackup.SQL.Add('  *             ');
  qyBackup.SQL.Add('FROM            ');
  qyBackup.SQL.Add('  BACKUP_CONFIG ');
  qyBackup.SQL.Add('ORDER BY        ');
  qyBackup.SQL.Add('  BAK_DIA,      ');
  qyBackup.SQL.Add('  BAK_HORA      ');
  qyBackup.Open;

  if qyBackup.IsEmpty then
  begin
    if Pergunta('Nenhum backup foi configurado! Deseja criar o backup padrão?') = 'S' then
    begin
      for i := 1 to 7 do
      begin
        qyBackup.Insert;
        qyBackupBAK_DIA.AsInteger := i;
        qyBackupBAK_HORA.AsDateTime := StrToDateTime('17:00');
        qyBackup.Post;
      end;
      if DirectoryExists('C:\Arquivos de programas\Firebird\Firebird_1_5\bin') then
        GravaParametros('376', 'C:\Arquivos de programas\Firebird\Firebird_1_5\bin')
      else if DirectoryExists('C:\Arquivos de programas\Firebird\Firebird_2_0\bin') then
        GravaParametros('376', 'C:\Arquivos de programas\Firebird\Firebird_2_0\bin')
      else if DirectoryExists('C:\Arquivos de programas\Firebird\Firebird_2_5\bin') then
        GravaParametros('376', 'C:\Arquivos de programas\Firebird\Firebird_2_5\bin')
      else if DirectoryExists('C:\Arquivos de programas\Firebird\Firebird_3_0') then
        GravaParametros('376', 'C:\Arquivos de programas\Firebird\Firebird_3_0');
      GravaParametros('377', 'C:\BKAssist');
    end;
  end;
  edtGbak.Text := VerificaParametros('376');
  edtPasta.Text := VerificaParametros('377');
  habDesBotoes(false);
end;

procedure TfrmBackupNovo.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmBackupNovo.Button1Click(Sender: TObject);
var
  criaTodos: boolean;
  i: integer;
begin
  if cbDia.ItemIndex < 0 then
  begin
    Mensagem('Dia não informado!');
    cbDia.SetFocus;
    Exit;
  end;
  if Trim(edtHora.Text) = '' then
  begin
    Mensagem('Hora não informada!');
    edtHora.SetFocus;
    Exit;
  end;

  criaTodos := false;
  if qyBackup.IsEmpty then
  begin
    if Pergunta('Deseja criar configuração padrão?') = 'S' then
      criaTodos := true;
  end;

  try
    if pnlNovo.Tag = 0 then
    begin
      if criaTodos then
      begin
        for i := 1 to 7 do
        begin
          qyBackup.Insert;
          qyBackupBAK_DIA.AsInteger := i;
          qyBackupBAK_HORA.AsDateTime := StrToDateTime(LeftStr(edtHora.Text, 2)+':'+RightStr(edtHora.Text, 2));
          qyBackup.Post;
        end;
      end
      else
      begin
        qyBackup.Insert;
        qyBackupBAK_DIA.AsInteger := cbDia.ItemIndex+1;
        qyBackupBAK_HORA.AsDateTime := StrToDateTime(LeftStr(edtHora.Text, 2)+':'+RightStr(edtHora.Text, 2));
        qyBackup.Post;
      end;
    end
    else
    begin
      qyBackup.Edit;
      qyBackupBAK_HORA.AsDateTime := StrToDateTime(LeftStr(edtHora.Text, 2)+':'+RightStr(edtHora.Text, 2));
      qyBackup.Post;
    end;
  finally
    if (dm2.IBTransaction1.InTransaction)
      then dm2.IBTransaction1.CommitRetaining;
    pnlNovo.Visible := false;
  end;
end;

procedure TfrmBackupNovo.qyBackupCalcFields(DataSet: TDataSet);
begin
  if not qyBackupBAK_DIA.IsNull then
    qyBackupDIA.AsString := Dias[qyBackupBAK_DIA.AsInteger];
end;

procedure TfrmBackupNovo.Button3Click(Sender: TObject);
begin
  edtGbak.Text := VerificaParametros('376');
  edtPasta.Text := VerificaParametros('377');
  habDesBotoes(false);
end;

procedure TfrmBackupNovo.Button2Click(Sender: TObject);
begin
  GravaParametros('376',edtGbak.Text);
  GravaParametros('377',edtPasta.Text);
  habDesBotoes(false);
end;

procedure TfrmBackupNovo.habDesBotoes(h: boolean);
begin
  button2.Enabled := h;
  button3.Enabled := h;

  BitBtn1.Enabled := not h;
  BitBtn3.Enabled := not h;
end;

procedure TfrmBackupNovo.edtGbakChange(Sender: TObject);
begin
  habDesBotoes(true);
end;

procedure TfrmBackupNovo.BitBtn1Click(Sender: TObject);
var
  strCon: string;
  usuario, senha, gbak, pasta, nome, nome2, hhmm: string;
  tam: longint;
  data: TDateTime;
  f: file of byte;
begin
  gbak := edtGbak.Text;
  pasta := edtPasta.Text;
  if RightStr(gbak, 1) <> '\' then
    gbak := gbak + '\';
  if RightStr(pasta, 1) <> '\' then
    pasta := pasta + '\';

  if Trim(edtPasta.Text) = '' then
  begin
    Mensagem('Informe a pasta onde será feito o backup!');
    edtPasta.SetFocus;
    Exit;
  end;
  if not DirectoryExists(Trim(edtPasta.Text)) then
  begin
    if pergunta('A pasta para backup não existe! Deseja criá-la?') = 'S' then
    begin
      if not ForceDirectories(Trim(edtPasta.Text)) then
      begin
        Mensagem('Erro ao criar o diretório '+QuotedStr(Trim(edtPasta.Text))+'!');
        edtPasta.SetFocus;
        Exit;
      end;
    end
    else
    begin
      edtPasta.SetFocus;
      Exit;
    end;  
  end;
  if not FileExists(gbak+'gbak.exe') then
  begin
    Mensagem('O GBAK não foi localizado no caminho informado!');
    edtGbak.SetFocus;
    Exit;
  end;
  if qyBackup.IsEmpty then
  begin
    Mensagem('Nenhuma configuração do backup automático foi feita!');
    RxDBGrid1.SetFocus;
    Exit;
  end;

  strCon := dm2.Database1.DatabaseName;
  usuario := dm2.Database1.Params.Values['user_name'];
  senha := dm2.Database1.Params.Values['password'];
  hhmm := FormatDateTime('HHMM', now);
  nome := qyBackupDIA.AsString+'-'+hhmm+'.fbk';
  nome2 := Trim(qyBackupDIA.AsString)+'.zip';
  nome := LowerCase(RetiraCaracterEspecial(nome, '.-'));
  nome2 := LowerCase(RetiraCaracterEspecial(nome2, '.-'));
  nome := TrocaStr(' ', nome, '-');
  nome2 := TrocaStr(' ', nome2, '-');

  Label11.Top := Label8.Top;
  Label11.Left := Label8.Left;
  Label11.BringToFront;
  Label11.Visible := true;
  Label11.Caption := 'Backup em andamento...';
  Application.ProcessMessages;
  Executa(PChar(gbak+'gbak -v -user "'+usuario+'" -pass "'+senha+'" "'+
                strCon+'" "'+pasta+nome+'"'),
          SW_HIDE);
  Label11.Visible := false;
  marcaBackup(qyBackupBAK_DIA.asInteger, qyBackupBAK_HORA.asDateTime, qyBackupBAK_MAQUINA.asString);
  GravaParametros('372', DateTimeToStr(Trunc(dataHoraBanco)));

  if not FileExists(pasta+nome) then
  begin
    Mensagem('O backup não foi feito!');
    Exit;
  end;

  data := FileDateToDateTime(FileAge(pasta+nome));
  AssignFile(f, pasta+nome);
  Reset(f);
  try
    tam := FileSize(f);
  finally
    CloseFile(f);
  end;


  //
  // Enviando backup para nuvem
  if ((VerificaParametros('880') <> '') and (VerificaParametros('880') <> 'ERRO')) or
     ((VerificaParametros('883') <> '') and (VerificaParametros('883') <> 'ERRO')) then
  begin
    Label11.Visible := true;
    //
    Label11.Caption := 'Compactando backup...';
    Application.ProcessMessages;

    if fileExists(pasta+nome2) then
      Windows.DeleteFile(PChar(pasta+nome2));

    AbZipper1.BaseDirectory := pasta;   // Pasta do arquivo origem a ser compactado e onde será gerado o aquivo zip
    AbZipper1.FileName := pasta+nome2;  // Nome do arquivo zip a ser gerado
    AbZipper1.AddFiles(pasta+nome, 0 ); // Lista de arquvos a serem adicionados no arquivo zip
    AbZipper1.Save;
    AbZipper1.CloseArchive;
    //
    Label11.Caption := 'Enviando backup para nuvem...';
    Application.ProcessMessages;
    if (VerificaParametros('883') <> '') and (VerificaParametros('883') <> 'ERRO') then
      EnvioSite(VerificaParametros('883')+'/cli-'+frmMenu.CGCDaEmpresa, pasta+nome2, nome2)
    else
      EnvioSite(VerificaParametros('880')+'/cli-'+frmMenu.CGCDaEmpresa, pasta+nome2, nome2);
    Label11.Visible := false;
    Application.ProcessMessages;
    //
    Mensagem('Backup concluído com sucesso (também em nuvem)! '+pasta+nome+' '+FormatFloat(',0.00',tam/1024/1024)+' Megabytes '+FormatDateTime('DD/MM/YYYY HH:MM', data));
  end
  else
  begin
    Mensagem('Backup concluído com sucesso! '+pasta+nome+' '+FormatFloat(',0.00',tam/1024/1024)+' Megabytes '+FormatDateTime('DD/MM/YYYY HH:MM', data));
  end;
end;

procedure TfrmBackupNovo.Incluirnovo1Click(Sender: TObject);
begin
  with pnlNovo do Left := (Self.Width - Width) div 2;
  with pnlNovo do Top := (Self.Height - Height) div 2;
  pnlNovo.Tag := 0;
  cbDia.Enabled := true;
  pnlNovo.Show;
  edtHora.SetFocus();
  //pnlNovo.Left := 122;
  //pnlNovo.Top := 90;
  //pnlNovo.BringToFront;
  //pnlNovo.Visible := true;
end;

procedure TfrmBackupNovo.Label10Click(Sender: TObject);
var
  maq: PChar;
  Tam: cardinal;
begin
  getMem(maq,255);
  Tam := 255;
  GetComputerName(maq,Tam);
  edtMaquina.Text := maq;
end;

procedure TfrmBackupNovo.Informarmquinaparabackup1Click(Sender: TObject);
begin
  edtMaquina.Clear;
  pnlMaquina.Left := 122;
  pnlMaquina.Top := 90;
  pnlMaquina.BringToFront;
  pnlMaquina.Visible := true;
end;

procedure TfrmBackupNovo.Button5Click(Sender: TObject);
begin
  {-- CALCEXPRESS --}
  if Trim(edtMaquina.Text) = '' then
  begin
    Mensagem('Informe a máquina!');
    edtMaquina.SetFocus;
    Exit;
  end;

  if Pergunta('Deseja que o backup seja feito nesta máquina todos os dias?') = 'S' then
  begin
    qyBackup.First;
    while not qyBackup.Eof do
    begin
      qyBackup.Edit;
      qyBackupBAK_MAQUINA.AsString := edtMaquina.Text;
      qyBackup.Post;
      qyBackup.Next;
    end;
    dm2.IBTransaction1.CommitRetaining;
  end
  else
  begin
    qyBackup.Edit;
    qyBackupBAK_MAQUINA.AsString := edtMaquina.Text;
    qyBackup.Post;
    dm2.IBTransaction1.CommitRetaining;
  end;
  pnlMaquina.Visible := false;
end;

procedure TfrmBackupNovo.Button6Click(Sender: TObject);
begin
  pnlMaquina.Visible := false;
end;

procedure TfrmBackupNovo.FormShow(Sender: TObject);
var
  param: string;
begin
  param := Trim(VerificaParametros('060'));
  if (param = '0') or (param = '') then
  begin
    Label8.Caption := 'Backup diário automático desativado';
  end
  else
  begin
    Label8.Caption := 'Backup diário automático ativado';
  end;
  width := 450;
  height := 350;
end;

procedure TfrmBackupNovo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not BitBtn1.Enabled then
  begin
    Mensagem('Grave ou cancele as alterações!');
    Action := caNone;
  end;
end;

procedure TfrmBackupNovo.pnlNovoButtonClick(Sender: TObject;
  Button: TJvCapBtnStyle);
begin
  TJvCaptionPanel(Sender).Hide;
end;

procedure TfrmBackupNovo.pnlNovoExit(Sender: TObject);
begin
  TJvCaptionPanel(Sender).Hide;
end;

procedure TfrmBackupNovo.RxDBGrid1DblClick(Sender: TObject);
begin

  if TRxDBGrid(Sender).DataSource.DataSet.IsEmpty then
    Raise Exception.Create('Sem dados para edição!');

  edtHora.Text := FormatDateTime('hh:mm', qyBackupBAK_HORA.AsDateTime);
  with pnlNovo do Left := (Self.Width - Width) div 2;
  with pnlNovo do Top := (Self.Height - Height) div 2;
  pnlNovo.Tag := 1;
  cbDia.Enabled := false;
  pnlNovo.Show;
  edtHora.SetFocus();

end;

Procedure TfrmBackupNovo.EnvioSite(diretorio, pathArq, arquivo: String);
var
  theStream: TFileStream;
begin
  theStream := TFileStream.Create(pathArq, fmOpenRead);
  self.theThread := TS3Thread.Create('PUTFILE', diretorio, arquivo, theStream, FS3Storage, true);
  theThread.OnTerminate := dm2.ThreadDone;
  theThread.Resume;
end;

function TfrmBackupNovo.IsThreadNil: boolean;
begin
  result := (self.theThread = nil);
end;

{
Procedure TfrmBackupNovo.ThreadDone(sender: TObject);
var
  thisThread: TS3Thread; //could alternatively directly address theThread variable
  msg: String;
begin
  thisThread := TS3Thread(Sender);
  try
    msg := thisThread.theMessage;
    if Pos('Error', msg) > 0 then
    begin
      Label11.Visible := false;
      mensagem('Houve erro na tentativa de envio para nuvem!');
    end
  finally
    thisThread.ResultStream.Free;
    self.theThread := nil;
  end;
end;
}

end.
