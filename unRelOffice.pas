unit unRelOffice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  TfrmRelOffice = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    qrl1: TQRLabel;
    qrl2: TQRLabel;
    qrl3: TQRLabel;
    qrl4: TQRLabel;
    qrl5: TQRLabel;
    qrl6: TQRLabel;
    qrl7: TQRLabel;
    qrl8: TQRLabel;
    qrl9: TQRLabel;
    qrl10: TQRLabel;
    qrl11: TQRLabel;
    qrl12: TQRLabel;
    qrl13: TQRLabel;
    qrl14: TQRLabel;
    qrl15: TQRLabel;
    qrl16: TQRLabel;
    qrl17: TQRLabel;
    qrl18: TQRLabel;
    qrl19: TQRLabel;
    qrl20: TQRLabel;
    qrl21: TQRLabel;
    qrl22: TQRLabel;
    qrl23: TQRLabel;
    qrl24: TQRLabel;
    qrl25: TQRLabel;
    qrl26: TQRLabel;
    qrl27: TQRLabel;
    qrl28: TQRLabel;
    qrl29: TQRLabel;
    qrl30: TQRLabel;
    L1: TQRShape;
    L2: TQRShape;
    L3: TQRShape;
    L4: TQRShape;
    L5: TQRShape;
    qrF: TQRImage;
    procedure QuickRep1Preview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelOffice: TfrmRelOffice;

implementation

uses unPreview, Qrprntr;
{$R *.DFM}

procedure TfrmRelOffice.QuickRep1Preview(Sender: TObject);
begin
  FormPreview := TFormPreview.Create(Application);
  FormPreview.QRPreview1.QRPrinter := TQRPrinter(Sender);
  FormPreview.Show;
end;

end.

