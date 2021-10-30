unit unSobreEditor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfrmSobre = class(TForm)
    Image1: TImage;
    Bevel1: TBevel;
    Label1: TLabel;
    Image2: TImage;
    Bevel2: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

{$R *.DFM}

function VersaoWin: string;
var
  Ver: TOSVersionInfo;
  S: string;
begin
  Ver.dwOSVersionInfoSize := SizeOf(Ver);
  GetVersionEx(Ver);
  with Ver do
  begin
    case dwPlatformId of
      VER_PLATFORM_WIN32_WINDOWS:
        S := 'Windows';
      VER_PLATFORM_WIN32_NT:
        S := 'Windows NT'
    else
        S := 'Win32s';
    end;
    Result := Format('%s %d.%.2d (%s)', [S, dwMajorVersion, dwMinorVersion, szCSDVersion]);
  end;
end;

function Memoria: string;
var
  Ver: TMemoryStatus;
  S: string;
begin
  Ver.dwTotalPhys := SizeOf(Ver);
  GlobalMemoryStatus(Ver);
  Result := FloatToStr(Ver.dwTotalPhys);
end;

procedure TfrmSobre.BitBtn1Click(Sender: TObject);
begin
	Close;
end;

procedure TfrmSobre.FormShow(Sender: TObject);
begin
  Label3.Caption := VersaoWin;
  Label4.Caption := IntToStr(Trunc(StrToFloat(Memoria)/1024/1000)) + 'MB RAM';
end;

procedure TfrmSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree;
end;

end.

