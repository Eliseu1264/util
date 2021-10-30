unit unBackupBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, Buttons, FileCtrl, Placemnt, IBServices;

type
  TfrmBackupBanco = class(TForm)
    edDestino: TEdit;
    BitBtn1: TBitBtn;
    Bevel2: TBevel;
    edOrigem: TEdit;
    Label4: TLabel;
    OpenDialog1: TOpenDialog;
    SpeedButton1: TSpeedButton;
    BitBtn2: TBitBtn;
    Label6: TLabel;
    FormStorage1: TFormStorage;
    Label1: TLabel;
    Label5: TLabel;
    cbDet: TCheckBox;
    Edit1: TEdit;
    IBBackupService1: TIBBackupService;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cbDetClick(Sender: TObject);
    procedure edDestinoEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBackupBanco: TfrmBackupBanco;

implementation
uses unFuncoes, unDataModule2;

{$R *.DFM}

procedure TfrmBackupBanco.BitBtn1Click(Sender: TObject);
var
  F: file of Byte;
  vAux : string;
  vDataI, vDataF : TDateTime;
  cont : integer;
begin
  if edDestino.Text = '' then
  begin
  	Mensagem('Caminho de destinho inválido!');
    Exit;
  end;
  Label6.Caption := 'Tempo de cópia: ';
  Label5.Caption := 'Fazendo backup do banco de dados...';
  vDataI := StrToDateTime(DateTimeToStr(NOW));
 	with dm2.IBBackupService1 do
  begin
    BitBtn1.Enabled := False;
    ServerName := dm2.IBDataBaseInfo1.DBSiteName;
    LoginPrompt := False;
    Params.Add('user_name=SYSDBA');
    Params.Add('password=2815358');
    Active := True;
    try
      if cbDet.Checked then
      	Verbose := True
      else
      	Verbose := False;
      Options := [NonTransportable, IgnoreLimbo];
      DatabaseName := dm2.IBDataBaseInfo1.DBFileName;
      BackupFile.Clear;
      BackupFile.Add(edDestino.Text);
      ServiceStart;
      if cbDet.Checked then
      	While not Eof do
      	begin
      		Application.ProcessMessages;
        	Edit1.Text := GetNextLine;
      	end;
      vDataF := StrToDateTime(DateTimeToStr(NOW));
  		{if StrToInt(copy(TimeToStr(vDataF - vDataI), 4, 2)) = 0	then
      	Label6.Caption := 'Tempo de cópia: ' + IntToStr(StrToInt(copy(TimeToStr(vDataF - vDataI), 7, 2))) + ' segundos'
  		else
    		Label6.Caption := 'Tempo de cópia: ' + IntToStr(StrToInt(copy(TimeToStr(vDataF - vDataI), 4, 2))) + ' m ' + IntToStr(StrToInt(copy(TimeToStr(vDataF - vDataI), 7, 2))) + ' s';
      ShowMessage('Backup concluído!');}
    finally
      Active := False;
    end;
  end;

  vAux := copy(edDestino.Text, 1, Length(edDestino.Text)-4) + Copy(DateToStr(NOW),1,2) + Copy(DateToStr(NOW),4,2) + Copy(DateToStr(NOW),7,4) + '.GDB';
  if FileExists(vAux) then
    DeleteFile(vAux);
  Application.ProcessMessages;
  copyfile(PChar(edOrigem.Text), PChar(vAux), False);
  if StrToInt(copy(TimeToStr(vDataF - vDataI), 4, 2)) = 0	then
   	Label6.Caption := 'Tempo de cópia: ' + IntToStr(StrToInt(copy(TimeToStr(vDataF - vDataI), 7, 2))) + ' segundos'
  else
  	Label6.Caption := 'Tempo de cópia: ' + IntToStr(StrToInt(copy(TimeToStr(vDataF - vDataI), 4, 2))) + ' m ' + IntToStr(StrToInt(copy(TimeToStr(vDataF - vDataI), 7, 2))) + ' s';
  Label5.Caption := 'Backup concluído.';
  Mensagem('Backup concluído!');
  BitBtn2.SetFocus;
end;

procedure TfrmBackupBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmBackupBanco.FormShow(Sender: TObject);
begin
  Label5.Caption := 'Aguardando...';
  edOrigem.Text := dm2.IBDatabaseInfo1.DBFileName;
  //edDestino.Text := copy(edOrigem.Text, 1, Length(edOrigem.Text)-3) + 'gbk';
end;

procedure TfrmBackupBanco.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmBackupBanco.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  edDestino.Text := OpenDialog1.FileName;
end;

procedure TfrmBackupBanco.cbDetClick(Sender: TObject);
begin
	if cbDet.Checked then
  begin
  	Mensagem('A ativação de "Exibir detalhes do backup", torna o processo de backup mais lento!');
    Edit1.Visible := True;
    Height := 220;
  end
  else
  begin
    Edit1.Visible := False;
    Height := 190;
  end;
end;

procedure TfrmBackupBanco.edDestinoEnter(Sender: TObject);
begin
	if edDestino.Text = '' then
  	edDestino.Text := copy(edOrigem.Text, 1, Length(edOrigem.Text)-3) + 'gbk';
end;

end.
