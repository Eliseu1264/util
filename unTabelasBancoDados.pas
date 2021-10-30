unit unTabelasBancoDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBLists, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, unDataModule2,
  IBCustomDataSet, IBQuery, DBTables;

type
  TfrmTabelasBancoDados = class(TForm)
    DatabaseItems1: TDatabaseItems;
    cbTabelas: TComboBox;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    BDEItems1: TBDEItems;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DataSource1: TDataSource;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBComboBox1: TDBComboBox;
    ListBox1: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    TableItems1: TTableItems;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    EditTemp: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    qry1: TIBQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbTabelasChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListBox1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit3Enter(Sender: TObject);
    procedure cbTabelasExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTabelasBancoDados: TfrmTabelasBancoDados;

implementation

{$R *.DFM}

procedure TfrmTabelasBancoDados.BitBtn1Click(Sender: TObject);
begin
	OpenDialog1.Execute;
  Edit1.Text := OpenDialog1.FileName;
  DatabaseItems1.DatabaseName := Edit1.Text;
  DatabaseItems1.Active := True;
  DatabaseItems1.Open;
  while not DatabaseItems1.EOF do
  begin
    cbTabelas.Items.Add(DatabaseItems1.FieldByName('Name').Value);
    DatabaseItems1.Next;
  end;
end;

procedure TfrmTabelasBancoDados.FormShow(Sender: TObject);
begin
  qry1.Open;
  DatabaseItems1.DatabaseName := Edit1.Text;
  DatabaseItems1.Active := True;
  DatabaseItems1.Open;
  while not DatabaseItems1.EOF do
  begin
    cbTabelas.Items.Add(DatabaseItems1.FieldByName('Name').Value);
    DatabaseItems1.Next;
  end;
  cbTabelas.SetFocus;
end;

procedure TfrmTabelasBancoDados.cbTabelasChange(Sender: TObject);
begin
	TableItems1.DatabaseName := Edit1.Text;
  TableItems1.TableName := cbTabelas.Items.Strings[cbTabelas.ItemIndex];
  TableItems1.Open;
  ListBox1.Items.Clear;
  while NOT TableItems1.EOF do
  begin
  	ListBox1.Items.Add(TableItems1.FieldByName('Name').AsString + ' - ' +
                       TableItems1.FieldByName('Type').AsString + ' ' +
                       TableItems1.FieldByName('Length').AsString);
    TableItems1.Next;
  end;
end;

procedure TfrmTabelasBancoDados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry1.Close;
	Action := caFree;
end;

procedure TfrmTabelasBancoDados.ListBox1Click(Sender: TObject);
begin
  if qry1.State = dsInsert then
  begin
  	qry1.FieldByName('GRT_TABELA').Value := cbTabelas.Items.Strings[cbTabelas.ItemIndex];
    qry1.FieldByName('GRT_CAMPO').Value := ListBox1.Items.Strings[ListBox1.ItemIndex];
		DBEdit3.SetFocus;
  end;
end;

procedure TfrmTabelasBancoDados.BitBtn2Click(Sender: TObject);
begin
	qry1.Insert;
  BitBtn2.Enabled := False;
  BitBtn3.Enabled := True;
  ListBox1.SetFocus;
end;

procedure TfrmTabelasBancoDados.BitBtn3Click(Sender: TObject);
begin
	qry1.Post;
  BitBtn3.Enabled := False;
  BitBtn2.Enabled := True;
  BitBtn2.SetFocus;
end;

procedure TfrmTabelasBancoDados.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
	if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmTabelasBancoDados.BitBtn4Click(Sender: TObject);
begin
	Close;
end;

procedure TfrmTabelasBancoDados.BitBtn5Click(Sender: TObject);
begin
	qry1.Cancel;
  BitBtn3.Enabled := False;
  BitBtn2.Enabled := True;
end;

procedure TfrmTabelasBancoDados.DBEdit3Exit(Sender: TObject);
begin
	EditTemp.Text := DBEdit3.Field.AsString;
end;

procedure TfrmTabelasBancoDados.DBEdit3Enter(Sender: TObject);
begin
  if qry1.State = dsInsert then
		DBEdit3.Field.AsString := EditTemp.Text;
end;

procedure TfrmTabelasBancoDados.cbTabelasExit(Sender: TObject);
begin
  if BitBtn2.Enabled then
  	BitBtn2.SetFocus;
end;

end.
