unit unRotinasUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, ExtCtrls, StdCtrls, Buttons,
  Navbtn, IBQuery, rxPlacemnt;

type
  TfrmRotinasUsuarios = class(TForm)
    RxDBGrid1: TRxDBGrid;
    FormStorage1: TFormStorage;
    Bevel1: TBevel;
    dbNavBtnDelete: TDBNavigationButton;
    btnSair: TDBNavigationButton;
    Bevel2: TBevel;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRotinasUsuarios: TfrmRotinasUsuarios;

implementation

uses
  unRotinas, unDataModule2;

{$R *.dfm}

procedure TfrmRotinasUsuarios.btnSairClick(Sender: TObject);
begin
  close();
end;

procedure TfrmRotinasUsuarios.FormShow(Sender: TObject);
var
  qy: TIBQuery;
begin
  qy := TIBQuery.create(nil);
  try
    qy.database := dm2.database1;

    qy.sql.clear();
    qy.sql.add('SELECT    ');
    qy.sql.add('  USU_NOME');
    qy.sql.add('FROM      ');
    qy.sql.add('  USUARIOS');
    qy.sql.add('ORDER BY  ');
    qy.sql.add('  USU_NOME');
    qy.open();


      with rxDBGrid1.Columns[0].pickList do
      begin
        clear();
        while (not qy.eof) do
        begin
          add(qy.fieldByName('USU_NOME').asString);
          qy.next();
        end;
      end;

    freeAndNil(qy);
  except
    freeAndNil(qy);
    raise;
  end;
end;

end.
 