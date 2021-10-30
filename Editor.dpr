program Editor;

uses
  Forms,
  ExcptDlg,
  REMain in '\\SERVIDOR\D\Sistemas\Delphi\GrafManagerIB\MODUTIL\REMain.pas' {MainForm},
  ParaFmt in '\\SERVIDOR\D\Sistemas\Delphi\GrafManagerIB\MODUTIL\ParaFmt.pas' {ParaFormatDlg},
  unSobreEditor in 'unSobreEditor.pas' {frmSobre};

{$R *.RES}

begin
  Application.Initialize;
  RxErrorIntercept;
  Application.Title := 'Editor';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

