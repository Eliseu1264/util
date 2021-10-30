unit unRotinas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBQuery, DB, DBClient, StdCtrls, RxDBComb, Mask, DBCtrls,
  ExtCtrls, RXCtrls, Grids, DBGrids, RXDBCtrl, IBCustomDataSet,
  IBUpdateSQL, Buttons, Navbtn, rxPlacemnt;

type
  TUsuarios = array of string;

  TRotina = record
    codigo: integer;
    descricao: string;
    execucao: char;
    usuarios: TUsuarios;
    ultimaData: TDateTime;
  end;

  TfrmRotinas = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsDados: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    RxDBComboBox1: TRxDBComboBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    RxLabel1: TRxLabel;
    Bevel3: TBevel;
    RxDBGrid1: TRxDBGrid;
    FormStorage1: TFormStorage;
    Button1: TButton;
    dsUsuarios: TDataSource;
    qyDados: TIBQuery;
    updDados: TIBUpdateSQL;
    qyDadosROT_CODIGO: TIntegerField;
    qyDadosROT_DESCRICAO: TIBStringField;
    qyDadosROT_EXECUCAO: TIBStringField;
    qyDadosROT_ULT_DATA: TDateTimeField;
    qyUsuarios: TIBQuery;
    updUsuarios: TIBUpdateSQL;
    qyUsuariosRUS_ROTINA: TIntegerField;
    qyUsuariosRUS_USUARIO: TIBStringField;
    Bevel5: TBevel;
    dbNavBtnCancel: TDBNavigationButton;
    dbNavBtnSave: TDBNavigationButton;
    dbNavBtnFirst1: TDBNavigationButton;
    dbNavBtnPrior: TDBNavigationButton;
    dbNavBtnNext: TDBNavigationButton;
    dbNavBtnLast: TDBNavigationButton;
    btnSair: TDBNavigationButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure qyDadosAfterPost(DataSet: TDataSet);
    procedure btnSairClick(Sender: TObject);
    procedure qyDadosAfterScroll(DataSet: TDataSet);
    procedure qyDadosAfterOpen(DataSet: TDataSet);
    procedure qyUsuariosAfterInsert(DataSet: TDataSet);
    procedure qyUsuariosAfterPost(DataSet: TDataSet);
    procedure qyUsuariosAfterDelete(DataSet: TDataSet);
  private
    function rotinaGravada(codigo: integer): boolean;
    procedure incluiRotinas();
    procedure getRotinasBanco();
    procedure getUsuariosRotina();
    procedure incluiRotina(codigo: integer; descricao: string; execucao: char);
    procedure gravaRotinasBanco();
  public
    { Public declarations }
  end;

function usuExecutaRotina(usuario: string; rotina: integer): boolean;
procedure marcaRotinaExecutada(codigo: integer; limpa: boolean = false);

const
  rotinas: array [1..1, 1..2] of string = (
                                           ('1', 'IMPRIMIR RELATÓRIO PARA AVISO DE PARCELA(S) DE CONTRATO(S) NÃO FATURADA(S)')
                                          );

var
  frmRotinas: TfrmRotinas;

implementation

uses
  unDataModule2, unRotinasUsuarios, unFuncoes;

{$R *.dfm}

procedure marcaRotinaExecutada(codigo: integer; limpa: boolean = false);
var
  qy: TIBQuery;
begin
  qy := TIBQuery.create(nil);
  try
    qy.database := dm2.database1;

    qy.sql.clear();
    qy.sql.add('UPDATE                       ');
    qy.sql.add('  ROTINAS                    ');
    qy.sql.add('SET                          ');
    if limpa then
      qy.sql.add('  ROT_ULT_DATA = NULL        ')
    else
      qy.sql.add('  ROT_ULT_DATA = CURRENT_DATE');
    qy.sql.add('WHERE                        ');
    qy.sql.add('  ROT_CODIGO = :ROT_CODIGO   ');
    qy.paramByName('ROT_CODIGO').asInteger := codigo;
    qy.execSQL();
    dm2.IBTransaction1.commitRetaining();

    freeAndNil(qy);
  except
    freeAndNil(qy);
    raise;
  end;
end;

function usuExecutaRotina(usuario: string; rotina: integer): boolean;
var
  qy: TIBQuery;
begin
  result := false;
  qy := TIBQuery.create(nil);
  try
    qy.database := dm2.database1;

    qy.sql.clear();
    qy.sql.add('SELECT                          ');
    qy.sql.add('  RUS_USUARIO,                  ');
    qy.sql.add('  ROT_ULT_DATA,                 ');
    qy.sql.add('  ROT_EXECUCAO                  ');
    qy.sql.add('FROM                            ');
    qy.sql.add('  ROTINAS                       ');
    qy.sql.add('  LEFT JOIN ROTINAS_USUARIOS ON ');
    qy.sql.add('    ROT_CODIGO = RUS_ROTINA     ');
    qy.sql.add('WHERE                           ');
    qy.sql.add('  ROT_CODIGO = :ROT_CODIGO      ');
    qy.paramByName('ROT_CODIGO').asInteger := rotina;
    qy.open();

    if (trunc(qy.fieldByName('ROT_ULT_DATA').asDateTime) >= dataHoraBanco()) then
    begin
      exit;
    end
    else if (qy.fieldByName('ROT_EXECUCAO').asString = '2') then
    begin
      result := true;
    end
    else if (qy.fieldByName('ROT_EXECUCAO').asString = '3') then
    begin
      while (not qy.eof) do
      begin
        if (qy.fieldByName('RUS_USUARIO').asString = usuario) then
        begin
          result := true;
          break;
        end;

        qy.next();
      end;
    end;

    marcaRotinaExecutada(rotina);
    {
    qy.Close;
    qy.SQL.Clear();
    qy.SQL.Add('UPDATE                          ');
    qy.SQL.Add('  ROTINAS                       ');
    qy.SQL.Add('SET                             ');
    qy.SQL.Add('  ROT_ULT_DATA = ''09/09/1999'' ');
    qy.SQL.Add('WHERE                           ');
    qy.SQL.Add('  ROT_CODIGO = :ROT_CODIGO      ');
    qy.ParamByName('ROT_CODIGO').AsInteger := rotina;
    qy.ExecSQL;
    dm2.IBTransaction1.CommitRetaining;
    }
    freeAndNil(qy);
  except
    freeAndNil(qy);
    raise;
  end;
end;

procedure TfrmRotinas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfrmRotinas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    key := #0;
    selectNext(activeControl, true, true);
  end;
end;

procedure TfrmRotinas.getRotinasBanco;
begin
  qyDados.sql.clear();
  qyDados.sql.add('SELECT      ');
  qyDados.sql.add('  *         ');
  qyDados.sql.add('FROM        ');
  qyDados.sql.add('  ROTINAS   ');
  qyDados.sql.add('ORDER BY    ');
  qyDados.sql.add('  ROT_CODIGO');
  qyDados.open();
end;

procedure TfrmRotinas.gravaRotinasBanco;
begin
  
end;

procedure TfrmRotinas.incluiRotina(codigo: integer; descricao: string;
  execucao: char);
var
  qy: TIBQuery;
begin
  qy := TIBQuery.create(nil);
  try
    qy.database := dm2.database1;

    qy.sql.clear();
    qy.sql.add('INSERT INTO              ');
    qy.sql.add('  ROTINAS(               ');
    qy.sql.add('          ROT_CODIGO,    ');
    qy.sql.add('          ROT_DESCRICAO, ');
    qy.sql.add('          ROT_EXECUCAO   ');
    qy.sql.add('         )               ');
    qy.sql.add('   VALUES(               ');
    qy.sql.add('          :ROT_CODIGO,   ');
    qy.sql.add('          :ROT_DESCRICAO,');
    qy.sql.add('          :ROT_EXECUCAO  ');
    qy.sql.add('         )               ');
    qy.paramByName('ROT_CODIGO'   ).asInteger := codigo;
    qy.paramByName('ROT_DESCRICAO').asString  := descricao;
    qy.paramByName('ROT_EXECUCAO' ).asString  := execucao;
    qy.execSQL();

    dm2.IBTransaction1.commitRetaining();
    freeAndNil(qy);
  except
    freeAndNil(qy);
    raise;
  end;
end;

procedure TfrmRotinas.incluiRotinas;
var
 i: integer;
begin
  for i := low(rotinas) to high(rotinas) do
  begin
    if (not rotinaGravada(strToInt(rotinas[i][1]))) then
    begin
      incluiRotina(
                   strToInt(rotinas[i][1]),
                   rotinas[i][2],
                   '1'
                  );
    end;
  end;
end;

procedure TfrmRotinas.FormShow(Sender: TObject);
begin
  incluiRotinas();
  getRotinasBanco();
end;

function TfrmRotinas.rotinaGravada(codigo: integer): boolean;
var
  qy: TIBQuery;
begin
  qy := TIBQuery.create(nil);
  try
    qy.database := dm2.database1;

    qy.sql.clear();
    qy.sql.add('SELECT                    ');
    qy.sql.add('  1                       ');
    qy.sql.add('FROM                      ');
    qy.sql.add('  ROTINAS                 ');
    qy.sql.add('WHERE                     ');
    qy.sql.add('  ROT_CODIGO = :ROT_CODIGO');
    qy.paramByName('ROT_CODIGO').asInteger := codigo;
    qy.open();

    result := not qy.isEmpty();

    freeAndNil(qy);
  except
    freeAndNil(qy);
    raise;
  end;
end;

procedure TfrmRotinas.Button1Click(Sender: TObject);
begin
  frmRotinasUsuarios := TfrmRotinasUsuarios.create(application);
  try
    frmRotinasUsuarios.showModal();
    if qyUsuarios.state in [dsInsert, dsEdit] then
    begin
      qyUsuarios.post();
    end;
    freeAndNil(frmRotinasUsuarios);
  except
    freeAndNil(frmRotinasUsuarios);
    raise;
  end;
end;

procedure TfrmRotinas.qyDadosAfterPost(DataSet: TDataSet);
begin
  dm2.IBTransaction1.commitRetaining();
end;

procedure TfrmRotinas.btnSairClick(Sender: TObject);
begin
  close();
end;

procedure TfrmRotinas.getUsuariosRotina;
begin
  qyUsuarios.sql.clear();
  qyUsuarios.sql.add('SELECT                    ');
  qyUsuarios.sql.add('  *                       ');
  qyUsuarios.sql.add('FROM                      ');
  qyUsuarios.sql.add('  ROTINAS_USUARIOS        ');
  qyUsuarios.sql.add('WHERE                     ');
  qyUsuarios.sql.add('  RUS_ROTINA = :RUS_ROTINA');
  qyUsuarios.paramByName('RUS_ROTINA').asInteger := qyDadosROT_CODIGO.asInteger;
  qyUsuarios.open();
end;

procedure TfrmRotinas.qyDadosAfterScroll(DataSet: TDataSet);
begin
  getUsuariosRotina();
end;

procedure TfrmRotinas.qyDadosAfterOpen(DataSet: TDataSet);
begin
  getUsuariosRotina();
end;

procedure TfrmRotinas.qyUsuariosAfterInsert(DataSet: TDataSet);
begin
  qyUsuariosRUS_ROTINA.asInteger := qyDadosROT_CODIGO.asInteger;
end;

procedure TfrmRotinas.qyUsuariosAfterPost(DataSet: TDataSet);
begin
  dm2.IBTransaction1.commitRetaining();
end;

procedure TfrmRotinas.qyUsuariosAfterDelete(DataSet: TDataSet);
begin
  dm2.IBTransaction1.commitRetaining();
end;

end.
