unit unSqlExplorer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RxRichEd, Db, DBTables, Menus, Grids, DBGrids, ExtCtrls,
  ComCtrls, RXCtrls, ImgList, RXDBCtrl, Buttons, FMTBcd, 
  Provider, DBClient, DBXpress, ToolWin, IBCustomDataSet, IBQuery,
  IBUpdateSQL, rxPlacemnt;

type
  TfrmSqlExplorer = class(TForm)
    DataSource1: TDataSource;
    PopupTexto: TPopupMenu;
    SalvarTexto: TMenuItem;
    AbrirTexto: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    PopupGrid: TPopupMenu;
    SalvarGrid: TMenuItem;
    StatusBar1: TStatusBar;
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    ImageList1: TImageList;
    FormStorage1: TFormStorage;
    PageControl1: TPageControl;
    TabSql: TTabSheet;
    Panel2: TPanel;
    Splitter2: TSplitter;
    Panel1: TPanel;
    btnRollBack2: TSpeedButton;
    btnRollBack1: TSpeedButton;
    btnRun: TSpeedButton;
    btnPrior: TSpeedButton;
    btnNext: TSpeedButton;
    btnStart: TSpeedButton;
    Panel3: TPanel;
    Grid: TRxDBGrid;
    RichTexto: TRxRichEdit;
    TabDados: TTabSheet;
    GridDados: TRxDBGrid;
    DataSource2: TDataSource;
    qrySql: TIBQuery;
    qryGet: TIBQuery;
    qryDados: TIBQuery;
    SpeedButton1: TSpeedButton;
    N1: TMenuItem;
    SELECTFROMtabelaWHEREcondio1: TMenuItem;
    UPDATEtabelaSETcampoconteudo1: TMenuItem;
    DELETEFROMtabelaWHEREcondicao1: TMenuItem;
    Edit1: TEdit;
    qryAux: TIBQuery;
    updAux: TIBUpdateSQL;
    qrQtd: TLabel;
    procedure SalvarTextoClick(Sender: TObject);
    procedure SalvarGridClick(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure TreeView1GetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure btnStartClick(Sender: TObject);
    procedure btnRollBack1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure FormResize(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SELECTFROMtabelaWHEREcondio1Click(Sender: TObject);
    procedure UPDATEtabelaSETcampoconteudo1Click(Sender: TObject);
    procedure DELETEFROMtabelaWHEREcondicao1Click(Sender: TObject);
    procedure RichTextoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Splitter2CanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
  private
    FSQLHistory: TStringList;
    FSQLHistoryIndex, SQLHistoryCapacity: Integer;
    procedure SalvaSaida(Arq: String);
    procedure UpdateSQLHistory;
    procedure EnableSQLHistoryItems;
    function Repl(C: string; Tamanho: integer): string;
    procedure GetObjeto(Obj: TTreeNode);
    procedure EncheNode(Node: TTreeNode);
    procedure GetTabela(Obj: TTreeNode);
    procedure MontaNode(Node: TTreeNode; Obj: String);
    procedure GetDados(Obj: TTreeNode);
    procedure Acrescenta_3_ao_Fone;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSqlExplorer: TfrmSqlExplorer;

implementation

uses unDataModule, unDataModule2, unFuncoes, StrUtils;

{$R *.DFM}

var
  Transacao: TTransactionDesc;

procedure TfrmSqlExplorer.EncheNode(Node: TTreeNode);
var
  NewNode: TTreeNode;
begin
  while not qryGet.Eof do
  begin
    NewNode:= TreeView1.Items.AddChild(Node, qryGet.FieldByName('CAMPO').AsString);
    MontaNode(NewNode, NewNode.Parent.Text);
    qryGet.Next
  end;
end;

procedure TfrmSqlExplorer.MontaNode(Node: TTreeNode; Obj: String);
begin
  (* *)
  if TreeView1.Items.Count = 0 then
  begin
    Node:= TreeView1.Items.AddChild(Nil, 'INTERBASE');
    Obj:= 'INTERBASE';
  end;
  (* *)
  if Obj = 'INTERBASE' then
  begin
    TreeView1.Items.AddChild(Node, 'Domains');
    TreeView1.Items.AddChild(Node, 'Tables');
    TreeView1.Items.AddChild(Node, 'Views');
    TreeView1.Items.AddChild(Node, 'Procedures');
    TreeView1.Items.AddChild(Node, 'Functions');
    TreeView1.Items.AddChild(Node, 'Generators');
    TreeView1.Items.AddChild(Node, 'Exceptions');
    TreeView1.Items.AddChild(Node, 'Blob Filters');
  end
  else if Obj = 'Tables' then
  begin
    TreeView1.Items.AddChild(Node, 'Columns');
    TreeView1.Items.AddChild(Node, 'Indices');
    TreeView1.Items.AddChild(Node, 'Primary Key');
    TreeView1.Items.AddChild(Node, 'Referential Constraints');
    TreeView1.Items.AddChild(Node, 'Unique Constraints');
    TreeView1.Items.AddChild(Node, 'Check Constraints');
    TreeView1.Items.AddChild(Node, 'Triggers');
  end
  else if Obj = 'Views' then
  begin
    TreeView1.Items.AddChild(Node, 'Columns');
  end
  else if Obj = 'Indices' then
  begin
    TreeView1.Items.AddChild(Node, 'Columns');
  end
  else if Obj = 'Primary Key' then
  begin
    TreeView1.Items.AddChild(Node, 'Columns');
  end
  else if Obj = 'Referential Constraints' then
  begin
    TreeView1.Items.AddChild(Node, 'Columns');
  end;
end;

procedure TfrmSqlExplorer.GetObjeto(Obj: TTreeNode);
begin
  if Obj.Parent.Text = 'INTERBASE' then
  begin
    GetTabela(Obj);
  end
  else if Obj.Parent.Text = 'Tables' then
  begin
    MontaNode(Obj, Obj.Parent.Text);
  end
  else if Obj.Parent.Text = 'Views' then
  begin
    MontaNode(Obj, Obj.Parent.Text);
  end
  else if Obj.Parent.Text = 'Indices' then
  begin
    MontaNode(Obj, Obj.Parent.Text);
  end
  else if Obj.Parent.Text = 'Primary Key' then
  begin
    MontaNode(Obj, Obj.Parent.Text);
  end
  else if Obj.Parent.Text = 'Referential Constraints' then
  begin
    MontaNode(Obj, Obj.Parent.Text);
  end

  (* *)
  else
  begin
    if Obj.Text = 'Columns' then
    begin
      GetTabela(Obj);
    end
    else if Obj.Text = 'Indices' then
    begin
      GetTabela(Obj);
    end
    else if Obj.Text = 'Primary Key' then
    begin
      GetTabela(Obj);
    end
    else if Obj.Text = 'Referential Constraints' then
    begin
      GetTabela(Obj);
    end
    else if Obj.Text = 'Unique Constraints' then
    begin
      GetTabela(Obj);
    end
    else if Obj.Text = 'Check Constraints' then
    begin
      GetTabela(Obj);
    end
    else if Obj.Text = 'Triggers' then
    begin
      GetTabela(Obj);
    end;
  end;
end;

procedure TfrmSqlExplorer.GetDados(Obj: TTreeNode);
begin
  if Obj.Text <> 'INTERBASE' then
  begin
    if Obj.Parent.Text = 'Tables' then
    begin
      PageControl1.Pages[0].TabVisible:= True;
      if PageControl1.ActivePageIndex = 0 then
      begin
        qryDados.Close;
        qryDados.Sql.Clear;
        qryDados.Sql.Add('SELECT         ');
        qryDados.Sql.Add('  *            ');
        qryDados.Sql.Add('FROM           ');
        qryDados.Sql.Add('  '+Obj.Text+' ');
        qryDados.Open;
      end;
    end
    else
      PageControl1.Pages[0].TabVisible:= False;
  end;
end;

procedure TfrmSqlExplorer.GetTabela(Obj: TTreeNode);
begin
  with qryGet, qryGet.Sql do
  begin
    Close;
    Clear;

    if Obj.Text = 'Domains' then
    begin
    //
    end
    else if Obj.Text = 'Tables' then
    begin
      Add('SELECT                       ');
      Add(' RDB$RELATION_NAME CAMPO     ');
      Add('FROM                         ');
      Add(' RDB$RELATIONS               ');
      Add('WHERE RDB$SYSTEM_FLAG = ''0''');
      Add('AND RDB$VIEW_SOURCE IS NULL  ');
      Add('ORDER BY RDB$RELATION_NAME   ');
    end
    else if Obj.Text = 'Views' then
    begin
      Add('SELECT                         ');
      Add(' RDB$RELATION_NAME CAMPO       ');
      Add('FROM                           ');
      Add(' RDB$RELATIONS                 ');
      Add('WHERE RDB$SYSTEM_FLAG = ''0''  ');
      Add('AND RDB$VIEW_SOURCE IS NOT NULL');
      Add('ORDER BY RDB$RELATION_NAME     ');
    end
    else if Obj.Text = 'Procedures' then
    begin
      Add('SELECT                       ');
      Add(' RDB$PROCEDURE_NAME CAMPO    ');
      Add('FROM                         ');
      Add(' RDB$PROCEDURES              ');
      Add('WHERE RDB$SYSTEM_FLAG = ''0''');
    end
    else if Obj.Text = 'Functions' then
    begin
      Add('SELECT                       ');
      Add(' RDB$FUNCTION_NAME CAMPO     ');
      Add('FROM                         ');
      Add(' RDB$FUNCTIONS               ');
      Add('WHERE RDB$SYSTEM_FLAG = ''0''');
    end
    else if Obj.Text = 'Generators' then
    begin
      Add('SELECT                         ');
      Add(' RDB$GENERATOR_NAME CAMPO      ');
      Add('FROM                           ');
      Add(' RDB$GENERATORS                ');
      Add('WHERE RDB$SYSTEM_FLAG = ''0''  ');
    end
    else if Obj.Text = 'Exceptions' then
    begin
      Add('SELECT                       ');
      Add(' RDB$EXCEPTION_NAME CAMPO    ');
      Add('FROM                         ');
      Add(' RDB$EXCEPTIONS              ');
      Add('WHERE RDB$SYSTEM_FLAG = ''0''');
    end
    else if Obj.Text = 'Blob Filters' then
    begin
      Add('SELECT                       ');
      Add(' RDB$FUNCTION_NAME CAMPO     ');
      Add('FROM                         ');
      Add(' RDB$FILTERS                 ');
      Add('WHERE RDB$SYSTEM_FLAG = ''0''');
    end
    (* *)
    else if Obj.Text = 'Columns' then
    begin
      if (Obj.Parent).Parent.Text = 'Tables' then
      begin
        Add('SELECT                                           ');
        Add('  RDB$FIELD_NAME CAMPO                           ');
        Add('FROM                                             ');
        Add('  RDB$RELATION_FIELDS                            ');
        Add('WHERE RDB$RELATION_NAME = '''+Obj.Parent.Text+'''');
        Add('ORDER BY RDB$FIELD_NAME                          ');
      end
      else if (Obj.Parent).Parent.Text = 'Views' then
      begin
        Add('SELECT                                           ');
        Add('  RDB$FIELD_NAME CAMPO                           ');
        Add('FROM                                             ');
        Add('  RDB$RELATION_FIELDS                            ');
        Add('WHERE RDB$RELATION_NAME = '''+Obj.Parent.Text+'''');
        Add('ORDER BY RDB$FIELD_NAME                          ');
      end
      else if (Obj.Parent).Parent.Text = 'Indices' then
      begin
        Add('SELECT                                        ');
        Add(' RDB$FIELD_NAME CAMPO                         ');
        Add('FROM                                          ');
        Add(' RDB$INDEX_SEGMENTS                           ');
        Add('WHERE RDB$INDEX_NAME = '''+Obj.Parent.Text+'''');
        Add('ORDER BY RDB$FIELD_NAME                       ');
      end
      else if (Obj.Parent).Parent.Text = 'Primary Key' then
      begin
        Add('SELECT                                             ');
        Add(' RDB$FIELD_NAME CAMPO                              ');
        Add('FROM                                               ');
        Add(' RDB$RELATION_CONSTRAINTS A,                       ');
        Add(' RDB$INDEX_SEGMENTS B                              ');
        Add('WHERE A.RDB$INDEX_NAME = B.RDB$INDEX_NAME          ');
        Add('AND A.RDB$CONSTRAINT_NAME = '''+Obj.Parent.Text+'''');
        Add('AND A.RDB$CONSTRAINT_TYPE = ''PRIMARY KEY''        ');
        Add('ORDER BY RDB$FIELD_NAME                            ');
      end
      else if (Obj.Parent).Parent.Text = 'Referential Constraints' then
      begin
        Add('SELECT                                             ');
        Add(' RDB$FIELD_NAME CAMPO                              ');
        Add('FROM                                               ');
        Add(' RDB$RELATION_CONSTRAINTS A,                       ');
        Add(' RDB$INDEX_SEGMENTS B                              ');
        Add('WHERE A.RDB$INDEX_NAME = B.RDB$INDEX_NAME          ');
        Add('AND A.RDB$CONSTRAINT_NAME = '''+Obj.Parent.Text+'''');
        Add('AND RDB$CONSTRAINT_TYPE = ''FOREIGN KEY''          ');
        Add('ORDER BY RDB$FIELD_NAME                            ');
      end;
    end
    else if Obj.Text = 'Indices' then
    begin
      Add('SELECT                                           ');
      Add('  RDB$INDEX_NAME CAMPO                           ');
      Add('FROM                                             ');
      Add('  RDB$INDICES                                    ');
      Add('WHERE RDB$RELATION_NAME = '''+Obj.Parent.Text+'''');
      Add('ORDER BY RDB$INDEX_NAME                          ');
    end
    else if Obj.Text = 'Primary Key' then
    begin
      Add('SELECT                                           ');
      Add('  RDB$CONSTRAINT_NAME CAMPO                      ');
      Add('FROM                                             ');
      Add('  RDB$RELATION_CONSTRAINTS                       ');
      Add('WHERE RDB$RELATION_NAME = '''+Obj.Parent.Text+'''');
      Add('AND RDB$CONSTRAINT_TYPE = ''PRIMARY KEY''        ');
      Add('ORDER BY RDB$CONSTRAINT_NAME                     ');
    end
    else if Obj.Text = 'Referential Constraints' then
    begin
      Add('SELECT                                           ');
      Add('  RDB$CONSTRAINT_NAME CAMPO                      ');
      Add('FROM                                             ');
      Add('  RDB$RELATION_CONSTRAINTS                       ');
      Add('WHERE RDB$RELATION_NAME = '''+Obj.Parent.Text+'''');
      Add('AND RDB$CONSTRAINT_TYPE = ''FOREIGN KEY''        ');
      Add('ORDER BY RDB$CONSTRAINT_NAME                     ');
    end
    else if Obj.Text = 'Unique Constraints' then
    begin
      Add('SELECT                                           ');
      Add(' RDB$CONSTRAINT_NAME CAMPO                       ');
      Add('FROM                                             ');
      Add(' RDB$RELATION_CONSTRAINTS                        ');
      Add('WHERE RDB$RELATION_NAME = '''+Obj.Parent.Text+'''');
      Add('AND RDB$CONSTRAINT_TYPE = ''UNIQUE''             ');
      Add('ORDER BY RDB$CONSTRAINT_NAME                     ');
    end
    else if Obj.Text = 'Check Constraints' then
    begin
      Add('SELECT                                           ');
      Add(' RDB$CONSTRAINT_NAME CAMPO                       ');
      Add('FROM                                             ');
      Add(' RDB$RELATION_CONSTRAINTS                        ');
      Add('WHERE RDB$RELATION_NAME = '''+Obj.Parent.Text+'''');
      Add('AND RDB$CONSTRAINT_TYPE = ''CHECK''              ');
      Add('ORDER BY RDB$CONSTRAINT_NAME                     ');
    end
    else if Obj.Text = 'Triggers' then
    begin
      Add('SELECT                                           ');
      Add('  RDB$TRIGGER_NAME CAMPO                         ');
      Add('FROM                                             ');
      Add('  RDB$TRIGGERS                                   ');
      Add('WHERE RDB$RELATION_NAME = '''+Obj.Parent.Text+'''');
      Add('ORDER BY RDB$TRIGGER_NAME                        ');
    end;

    if Text <> '' then
    begin
      Open;
      EncheNode(Obj);
    end;

  end;
end;

function TfrmSqlExplorer.Repl(C: string; Tamanho: integer): string;
var
  Conteudo: String;
  Contar: Integer;
begin
  Conteudo:= '';
  for Contar:= 1 to Tamanho do
    Conteudo:= Conteudo + C;
  Result:= Conteudo;
end;

procedure TfrmSqlExplorer.EnableSQLHistoryItems;
begin
  btnPrior.Enabled := ((FSQLHistoryIndex > 0) or (FSQLHistoryIndex = -1)) and
    (FSQLHistory.Count > 0);
//  PriorSQLItem.Enabled := btnPrior.Enabled;
  btnNext.Enabled := (FSQLHistoryIndex <> -1);
//  NextSQLItem.Enabled := btnNext.Enabled;
end;

procedure TfrmSqlExplorer.UpdateSQLHistory;
begin
  if (RichTexto.Modified) and (RichTexto.Lines.Count > 0) then
  begin
    while FSQLHistory.Count >= SQLHistoryCapacity do
      if FSQLHistory.Count > 0 then
        FSQLHistory.Delete(0);
    if (SQLHistoryCapacity > 0) then
    begin
      FSQLHistoryIndex:= FSQLHistory.AddObject('', TStringList.Create);
      TStrings(FSQLHistory.Objects[FSQLHistoryIndex]).Assign(RichTexto.Lines);
      RichTexto.Modified := False;
    end;
  end;
  EnableSQLHistoryItems;
end;

procedure TfrmSqlExplorer.SalvaSaida(Arq: String);
var
  F: TextFile;
  I, M: Integer;
  S, S1: String;
  L: TStringList;
begin
  try
    L:= TStringList.Create;
    AssignFile(F, Arq);
    ReWrite(F);
    qrySql.First;
    Grid.DisableScroll;

    for I:= 0 to qrySql.FieldCount-1 do
    begin
      if Length(qrySql.FieldDefList[I].Name) > qrySql.FieldList[I].DataSize then
        M:= Length(qrySql.FieldDefList[I].Name)
      else
        M:= qrySql.FieldList[I].DataSize;
      S:= S + Format('%-'+IntToStr(M)+'.'+IntToStr(M)+'s', [qrySql.FieldDefList[I].Name])+' ';
      S1:= S1 + Repl('=', M)+' ';
      L.Add(IntToStr(M));
    end;

    WriteLn(F, S);
    WriteLn(F, S1);

    while not qrySql.Eof do
    begin
      S:= '';
      for I:= 0 to L.Count-1 do
        S:= S + Format('%-'+L[I]+'.'+L[I]+'s', [qrySql.Fields[I].AsString])+' ';
      WriteLn(F, S);

      qrySql.Next;
    end;
    qrySql.First;
    Application.MessageBox(PChar('Dados salvos em: '+Arq+''), 'Informação', MB_OK + MB_ICONINFORMATION);

  finally
    CloseFile(F);
    FreeAndNil(L);
    Grid.EnableScroll;
  end;
end;

procedure TfrmSqlExplorer.SalvarTextoClick(Sender: TObject);
begin
  case TMenuItem(Sender).Tag of
    1: if SaveDialog1.Execute then
       begin
         SaveDialog1.InitialDir:= ExtractFilePath(SaveDialog1.FileName);
         RichTexto.Lines.SaveToFile(SaveDialog1.FileName);
       end;

    2: if OpenDialog1.Execute then
       begin
         OpenDialog1.InitialDir:= ExtractFilePath(OpenDialog1.FileName);
         RichTexto.Lines.LoadFromFile(OpenDialog1.FileName);
       end;
  end;
end;

procedure TfrmSqlExplorer.SalvarGridClick(Sender: TObject);
begin
  case TMenuItem(Sender).Tag of
    1: if SaveDialog1.Execute then
       begin
         SaveDialog1.InitialDir:= ExtractFilePath(SaveDialog1.FileName);
         SalvaSaida(SaveDialog1.FileName);
       end;
  end;
end;

procedure TfrmSqlExplorer.btnRunClick(Sender: TObject);
var
  Res: String;
  Sep, I: Integer;
  naoParar: boolean;
begin
  naoParar := false;
  if RichTexto.Lines.Count > 0 then
  begin
    try
      if Edit1.Text <> '' then
        if Edit1.Text = RichTexto.Text then
        begin
          mensagem('Esse texto SQL deve ser implementado com as palavras em minúsculo substituídas pelos termos adequados!');
          exit;
        end;
      Edit1.Text := '';
      qrySql.Close;
      qrySql.Sql.Clear;
      (* procura separador ';' *)
      for I:= 0 to RichTexto.Lines.Count-1 do
      begin
        try
          qrQtd.Caption := InTToStr(I+1);
          Application.ProcessMessages;
          Sep:= Pos(';', RichTexto.Lines[I]);
          if Sep > 0 then
          begin
            if Trim(Res)+Trim(Copy(RichTexto.Lines[I], 1, Sep-1)) <> '' then
            begin
              qrySql.Sql.Add(Trim(Res)+Trim(Copy(RichTexto.Lines[I], 1, Sep-1)));
              Res := Copy(RichTexto.Lines[I], Sep+1, Length(RichTexto.Lines[I]));
              qrySql.Open;
              if i < RichTexto.Lines.Count-1 then
                qrySql.Sql.Clear;
            end;
          end
          else
          begin
            if Trim(Res)+Trim(RichTexto.Lines[I]) <> '' then
              qrySql.Sql.Add(Trim(Res)+Trim(RichTexto.Lines[I]));
            Res:= '';
          end;
        except
          on E:Exception do
          begin
            Grid.Visible:= False;
            StatusBar1.SimpleText:= IntToStr(qrySql.RowsAffected)+' colunas foram afetadas';
            if E.Message <> 'qrySql: Cursor not returned from Query' then
            begin
              if not naoParar then
              begin
                if Application.MessageBox(PChar(E.Message+ #10#13 +Trim(RichTexto.Lines[I])), 'SQL Erro', MB_OKCANCEL + MB_ICONWARNING) = IDCANCEL then
                begin
                  Break;
                  exit;
                end
                else
                if pergunta('Continuar exibindo erros se houver ? ') <> 'S' then
                  naoParar := true;
              end;
              StatusBar1.SimpleText:= 'Execução completada';
            end;
            qrySql.Sql.Clear;
            Continue;
          end;
        end;
      end;
      UpdateSQLHistory;
      if qrySql.Sql.Count > 0 then
      begin
        qrySql.Open;
        Grid.Visible := True;
        StatusBar1.SimpleText:= IntToStr(qrySql.RowsAffected)+' colunas foram afetadas';
      end;
      qrQtd.Caption := '';
      RichTexto.Clear;
      if RichTexto.CanFocus then
        RichTexto.SetFocus;
    except
      on E:Exception do
      begin
        Grid.Visible:= False;
        StatusBar1.SimpleText:= IntToStr(qrySql.RowsAffected)+' colunas foram afetadas';
        if E.Message <> 'qrySql: Cursor not returned from Query' then
        begin
          if not naoParar then
          begin
            if Application.MessageBox(PChar(E.Message+ #10#13 +Trim(RichTexto.Lines[I])), 'SQL Erro', MB_OKCANCEL + MB_ICONWARNING) = IDCANCEL then
              exit
            else
              if pergunta('Continuar exibindo erros se houver ? ') <> 'S' then
                naoParar := true;
          end;
          StatusBar1.SimpleText:= 'Execução completada';
        end;
      end;
    end;
  end;
end;

procedure TfrmSqlExplorer.FormCreate(Sender: TObject);
begin
  FSQLHistoryIndex := -1;
  FSQLHistory:= TStringList.Create;
  SQLHistoryCapacity:= 5;
  TreeView1.AutoExpand:= True;
end;

procedure TfrmSqlExplorer.btnPriorClick(Sender: TObject);
var
  NewSQL: Boolean;
begin
  if (FSQLHistory = nil) or (FSQLHistory.Count = 0) then Exit;
  NewSQL := False;
  if Sender = btnPrior then
  begin
    if FSQLHistoryIndex > 0 then Dec(FSQLHistoryIndex)
    else if FSQLHistoryIndex = -1 then begin
      UpdateSQLHistory;
      FSQLHistoryIndex := FSQLHistory.Count - 1;
    end;
  end
  else if Sender = btnNext then begin
    if FSQLHistoryIndex = -1 then UpdateSQLHistory;
    if FSQLHistoryIndex < FSQLHistory.Count - 1 then
      Inc(FSQLHistoryIndex)
    else begin
      NewSQL := True;
    end;
  end;
  if NewSQL then begin
    FSQLHistoryIndex := -1;
    RichTexto.Clear;
    RichTexto.Modified := False;
  end
  else
  begin
    RichTexto.Lines.Assign(TStrings(FSQLHistory.Objects[FSQLHistoryIndex]));
    RichTexto.Modified := False;
  end;
  EnableSQLHistoryItems;
end;

procedure TfrmSqlExplorer.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (shift = ([ssCtrl])) and (Key = Word('E')) then
  begin
    btnRunClick(Sender);
  end
  else if (shift = ([ssCtrl])) and (Key = Word('P')) then
  begin
    btnPriorClick(btnPrior);
  end
  else if (shift = ([ssCtrl])) and (Key = Word('Q')) then
  begin
    if Pergunta('Deseja executar a rotina que acrescenta o número 3 ao número dos telefones ?. (Deve ser executada apenas uma vez!) ') = 'S' then
      Acrescenta_3_ao_Fone;
  end
  else if (shift = ([ssCtrl])) and (Key = Word('N')) then
  begin
    btnPriorClick(btnNext);
  end;
end;

procedure TfrmSqlExplorer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if btnStart.Down then
  begin
    if Application.MessageBox('Deseja gravar a transação iniciada ?', 'Pergunta', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      btnStart.Down:= False;
      btnStartClick(Sender);
    end
    else
      btnRollBack1Click(Sender);
  end;
  TreeView1.SetFocus;    
	Action:= caFree;
  frmSqlExplorer:= nil;
end;

procedure TfrmSqlExplorer.FormShow(Sender: TObject);
begin
  MontaNode(Nil, '');
  btnRollBack1.SendToBack;
  btnRollBack1.Visible:= False;
  PageControl1.Pages[0].TabVisible:= False;
end;

procedure TfrmSqlExplorer.TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  if TreeView1.Items.GetFirstNode = Node then
    Node.ImageIndex:= 0
  else if (Node.Parent.ImageIndex = 0) or (Node.Parent.ImageIndex = 1) then
    Node.ImageIndex:= 2
  else if Node.Parent.ImageIndex = 2 then
    Node.ImageIndex:= 1;
end;

procedure TfrmSqlExplorer.TreeView1GetSelectedIndex(Sender: TObject; Node: TTreeNode);
begin
  Node.SelectedIndex:= Node.ImageIndex;
end;

procedure TfrmSqlExplorer.btnStartClick(Sender: TObject);
var
  I: Word;
begin
  if btnStart.Down then
  begin
    Random(I);
    btnRollBack1.BringToFront;
    btnRollBack1.Visible:= True;
  end
  else
  begin
    if dm2.IBTransaction1.Intransaction then
      dm2.IBTransaction1.CommitRetaining;
    btnRollBack1.SendToBack;
    btnRollBack1.Visible:= False;
  end;
end;

procedure TfrmSqlExplorer.btnRollBack1Click(Sender: TObject);
begin
  if dm2.IBTransaction1.Intransaction then
    dm2.IBTransaction1.RollbackRetaining;
  btnStart.Down:= False;
  btnRollBack1.SendToBack;
  btnRollBack1.Visible:= False;
end;

procedure TfrmSqlExplorer.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 0 then
    TreeView1Change(Sender, TreeView1.Selected);
end;

procedure TfrmSqlExplorer.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  if TreeView1.Selected.Count = 0 then
    GetObjeto(TreeView1.Selected);
  (* *)
  GetDados(TreeView1.Selected);
end;

procedure TfrmSqlExplorer.FormResize(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmSqlExplorer.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmSqlExplorer.SELECTFROMtabelaWHEREcondio1Click(
  Sender: TObject);
var s: String;
    i: Integer;
begin
  RichTexto.Lines.Clear;
  for i := 1 to length(PopupTexto.Items[3].Caption) do
  if Copy(PopupTexto.Items[3].Caption, i, 1) <> '&' then
    s := s + Copy(PopupTexto.Items[3].Caption, i, 1);
  RichTexto.Lines.Add(s);
  Edit1.Text := s;
end;

procedure TfrmSqlExplorer.UPDATEtabelaSETcampoconteudo1Click(
  Sender: TObject);
var s: String;
    i: Integer;
begin
  RichTexto.Lines.Clear;
  for i := 1 to length(PopupTexto.Items[4].Caption) do
  if Copy(PopupTexto.Items[4].Caption, i, 1) <> '&' then
    s := s + Copy(PopupTexto.Items[4].Caption, i, 1);
  RichTexto.Lines.Add(s);
  Edit1.Text := s;
end;

procedure TfrmSqlExplorer.DELETEFROMtabelaWHEREcondicao1Click(
  Sender: TObject);
var s: String;
    i: Integer;
begin
  RichTexto.Lines.Clear;
  for i := 1 to length(PopupTexto.Items[5].Caption) do
  if Copy(PopupTexto.Items[5].Caption, i, 1) <> '&' then
    s := s + Copy(PopupTexto.Items[5].Caption, i, 1);
  RichTexto.Lines.Add(s);
  Edit1.Text := s;
end;

procedure TfrmSqlExplorer.Acrescenta_3_ao_Fone;
var StFone, NumFone: String;
    i: Integer;
begin
  // Atualizando Tabela -> CLIENTE
  with dm.qry, dm.qry.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM CLIENTE');
    Open;
    while not dm.qry.eof do
    begin
      // CLI_FONE -> 12 Posicaoes
      if (Trim(dm.qry.FieldByName('CLI_ESTADO').AsString) = 'CE')  and  (Trim(dm.qry.FieldByName('CLI_FONE').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('CLI_FONE').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('CLI_FONE').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('CLI_FONE').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('CLI_FONE').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('CLI_FONE').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('CLI_FONE').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('CLI_FONE').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('CLI_FONE').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('CLI_FONE').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('CLI_FONE').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE CLIENTE SET CLI_FONE = :FONE');
            qryAux.SQL.Add(' WHERE CLI_CODIGO = '+QuotedStr(dm.qry.FieldByName('CLI_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('CLI_FONE').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      // CLI_FONE2 -> 12 Posicaoes
      if (Trim(dm.qry.FieldByName('CLI_ESTADO').AsString) = 'CE')  and  (Trim(dm.qry.FieldByName('CLI_FONE2').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('CLI_FONE2').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('CLI_FONE2').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('CLI_FONE2').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('CLI_FONE2').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('CLI_FONE2').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('CLI_FONE2').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('CLI_FONE2').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('CLI_FONE2').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('CLI_FONE2').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('CLI_FONE2').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE CLIENTE SET CLI_FONE2 = :FONE');
            qryAux.SQL.Add(' WHERE CLI_CODIGO = '+QuotedStr(dm.qry.FieldByName('CLI_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('CLI_FONE2').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      // CLI_FAX -> 12 Posicaoes
      if (Trim(dm.qry.FieldByName('CLI_ESTADO').AsString) = 'CE')  and  (Trim(dm.qry.FieldByName('CLI_FAX').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('CLI_FAX').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('CLI_FAX').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('CLI_FAX').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('CLI_FAX').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('CLI_FAX').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('CLI_FAX').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('CLI_FAX').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('CLI_FAX').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('CLI_FAX').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('CLI_FAX').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE CLIENTE SET CLI_FAX = :FONE');
            qryAux.SQL.Add(' WHERE CLI_CODIGO = '+QuotedStr(dm.qry.FieldByName('CLI_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('CLI_FAX').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      dm.qry.Next;
    end;
  end;
  // Atualizando Tabela -> CONTATOS_CLIENTE
  with dm.qry, dm.qry.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM CONTATOS_CLIENTES');
    Open;
    while not dm.qry.eof do
    begin
      // CLI_FONE -> 12 Posicaoes
      if Trim(dm.qry.FieldByName('CTC_FONE').AsString) <> ''   then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('CTC_FONE').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('CTC_FONE').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('CTC_FONE').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('CTC_FONE').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('CTC_FONE').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('CTC_FONE').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('CTC_FONE').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('CTC_FONE').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('CTC_FONE').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('CTC_FONE').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE CONTATOS_CLIENTES SET CTC_FONE = :FONE');
            qryAux.SQL.Add(' WHERE CTC_CLIENTE = '+QuotedStr(dm.qry.FieldByName('CTC_CLIENTE').AsString));
            qryAux.SQL.Add(' AND CTC_CONTATO = '+QuotedStr(dm.qry.FieldByName('CTC_CONTATO').AsString));
            qryAux.SQL.Add(' AND CTC_NOME = '+QuotedStr(dm.qry.FieldByName('CTC_NOME').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('CTC_FONE').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      dm.qry.Next;
    end;
  end;
  // Atualizando Tabela -> FORNECEDORES
  with dm.qry, dm.qry.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM FORNECEDORES');
    Open;
    while not dm.qry.eof do
    begin
      // FRN_FONE -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('FRN_ESTADO').AsString) = 'CE') and (Trim(dm.qry.FieldByName('FRN_FONE').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('FRN_FONE').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('FRN_FONE').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('FRN_FONE').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('FRN_FONE').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FONE').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FONE').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FONE').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FONE').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FONE').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('FRN_FONE').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE FORNECEDORES SET FRN_FONE = :FONE');
            qryAux.SQL.Add(' WHERE FRN_CODIGO = '+QuotedStr(dm.qry.FieldByName('FRN_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('FRN_FONE').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      // FRN_FAX -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('FRN_ESTADO').AsString) = 'CE') and (Trim(dm.qry.FieldByName('FRN_FAX').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('FRN_FAX').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('FRN_FAX').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('FRN_FAX').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('FRN_FAX').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FAX').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FAX').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FAX').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FAX').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FAX').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('FRN_FAX').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE FORNECEDORES SET FRN_FAX = :FONE');
            qryAux.SQL.Add(' WHERE FRN_CODIGO = '+QuotedStr(dm.qry.FieldByName('FRN_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('FRN_FAX').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      // FRN_FONE1 -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('FRN_ESTADO').AsString) = 'CE') and (Trim(dm.qry.FieldByName('FRN_FONE1').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('FRN_FONE1').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('FRN_FONE1').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('FRN_FONE1').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('FRN_FONE1').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FONE1').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FONE1').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FONE1').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FONE1').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FONE1').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('FRN_FONE1').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE FORNECEDORES SET FRN_FONE1 = :FONE');
            qryAux.SQL.Add(' WHERE FRN_CODIGO = '+QuotedStr(dm.qry.FieldByName('FRN_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('FRN_FONE1').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      // FRN_FONE2 -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('FRN_ESTADO').AsString) = 'CE') and (Trim(dm.qry.FieldByName('FRN_FONE2').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('FRN_FONE2').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('FRN_FONE2').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('FRN_FONE2').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('FRN_FONE2').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FONE2').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FONE2').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FONE2').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FONE2').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FONE2').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('FRN_FONE2').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE FORNECEDORES SET FRN_FONE2 = :FONE');
            qryAux.SQL.Add(' WHERE FRN_CODIGO = '+QuotedStr(dm.qry.FieldByName('FRN_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('FRN_FONE2').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      // FRN_FONE2 -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('FRN_ESTADO').AsString) = 'CE') and (Trim(dm.qry.FieldByName('FRN_FONE3').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('FRN_FONE3').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('FRN_FONE3').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('FRN_FONE3').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('FRN_FONE3').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FONE3').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FONE3').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FONE3').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FONE3').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('FRN_FONE3').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('FRN_FONE3').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE FORNECEDORES SET FRN_FONE3 = :FONE');
            qryAux.SQL.Add(' WHERE FRN_CODIGO = '+QuotedStr(dm.qry.FieldByName('FRN_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('FRN_FONE3').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      dm.qry.Next;
    end;
  end;
  // Atualizando Tabela -> FORNECEDORES
  with dm.qry, dm.qry.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM AGENCIAS');
    Open;
    while not dm.qry.eof do
    begin
      // AG_FONE1 -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('AG_ESTADO').AsString) = 'CE') and (Trim(dm.qry.FieldByName('AG_FONE1').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('AG_FONE1').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('AG_FONE1').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('AG_FONE1').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('AG_FONE1').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('AG_FONE1').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('AG_FONE1').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('AG_FONE1').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('AG_FONE1').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('AG_FONE1').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('AG_FONE1').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE AGENCIAS SET AG_FONE1 = :FONE');
            qryAux.SQL.Add(' WHERE AG_CODIGO = '+QuotedStr(dm.qry.FieldByName('AG_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('AG_FONE1').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      // AG_FONE2 -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('AG_ESTADO').AsString) = 'CE') and (Trim(dm.qry.FieldByName('AG_FONE2').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('AG_FONE2').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('AG_FONE2').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('AG_FONE2').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('AG_FONE2').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('AG_FONE2').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('AG_FONE2').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('AG_FONE2').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('AG_FONE2').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('AG_FONE2').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('AG_FONE2').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE AGENCIAS SET AG_FONE2 = :FONE');
            qryAux.SQL.Add(' WHERE AG_CODIGO = '+QuotedStr(dm.qry.FieldByName('AG_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('AG_FONE2').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      // AG_FONE2 -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('AG_ESTADO').AsString) = 'CE') and (Trim(dm.qry.FieldByName('AG_FONE3').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('AG_FONE3').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('AG_FONE3').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('AG_FONE3').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('AG_FONE3').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('AG_FONE3').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('AG_FONE3').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('AG_FONE3').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('AG_FONE3').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('AG_FONE3').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('AG_FONE3').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE AGENCIAS SET AG_FONE3 = :FONE');
            qryAux.SQL.Add(' WHERE AG_CODIGO = '+QuotedStr(dm.qry.FieldByName('AG_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('AG_FONE3').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      // AG_FAX -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('AG_ESTADO').AsString) = 'CE') and (Trim(dm.qry.FieldByName('AG_FAX').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('AG_FAX').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('AG_FAX').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('AG_FAX').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('AG_FAX').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('AG_FAX').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('AG_FAX').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('AG_FAX').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('AG_FAX').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('AG_FAX').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('AG_FAX').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE AGENCIAS SET AG_FAX = :FONE');
            qryAux.SQL.Add(' WHERE AG_CODIGO = '+QuotedStr(dm.qry.FieldByName('AG_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('AG_FAX').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      dm.qry.Next;
    end;
  end;

  // Atualizando Tabela -> EMPRESA99
  with dm.qry, dm.qry.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM EMPRESA99');
    Open;
    while not dm.qry.eof do
    begin
      // EMP_FONE -> 12 Posicaoes
      if Trim(dm.qry.FieldByName('EMP_FONE').AsString) <> '' then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('EMP_FONE').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('EMP_FONE').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('EMP_FONE').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('EMP_FONE').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('EMP_FONE').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('EMP_FONE').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('EMP_FONE').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('EMP_FONE').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('EMP_FONE').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('EMP_FONE').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE EMPRESA99 SET EMP_FONE = :FONE');
            qryAux.SQL.Add(' WHERE EMP_NOME = '+QuotedStr(dm.qry.FieldByName('EMP_NOME').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('EMP_FONE').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      // EMP_FAX -> 12 Posicaoes
      if Trim(dm.qry.FieldByName('EMP_FAX').AsString) <> '' then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('EMP_FAX').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('EMP_FAX').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('EMP_FAX').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('EMP_FAX').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('EMP_FAX').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('EMP_FAX').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('EMP_FAX').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('EMP_FAX').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('EMP_FAX').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('EMP_FAX').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE EMPRESA99 SET EMP_FAX = :FONE');
            qryAux.SQL.Add(' WHERE EMP_NOME = '+QuotedStr(dm.qry.FieldByName('EMP_NOME').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('EMP_FAX').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      dm.qry.Next;
    end;
  end;
  // Atualizando Tabela -> FORNECEDORES
  with dm.qry, dm.qry.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM VENDEDORES');
    Open;
    while not dm.qry.eof do
    begin
      // AG_FONE1 -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('VD_FONE').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('VD_FONE').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('VD_FONE').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('VD_FONE').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('VD_FONE').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('VD_FONE').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('VD_FONE').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('VD_FONE').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('VD_FONE').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('VD_FONE').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('VD_FONE').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE VENDEDORES SET VD_FONE = :FONE');
            qryAux.SQL.Add(' WHERE VD_CODIGO = '+QuotedStr(dm.qry.FieldByName('VD_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('VD_FONE').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      dm.qry.Next;
    end;
  end;
  // Atualizando Tabela -> BANCO
  with dm.qry, dm.qry.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM BANCO');
    Open;
    while not dm.qry.eof do
    begin
      // BNC_FAX -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('BNC_FAX').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('BNC_FAX').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('BNC_FAX').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('BNC_FAX').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('BNC_FAX').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('BNC_FAX').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('BNC_FAX').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('BNC_FAX').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('BNC_FAX').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('BNC_FAX').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('BNC_FAX').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE BANCO SET BNC_FAX = :FONE');
            qryAux.SQL.Add(' WHERE BNC_CODIGO = '+QuotedStr(dm.qry.FieldByName('BNC_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('BNC_FAX').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      // BNC_FONE1 -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('BNC_FONE1').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('BNC_FONE1').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('BNC_FONE1').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('BNC_FONE1').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('BNC_FONE1').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('BNC_FONE1').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('BNC_FONE1').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('BNC_FONE1').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('BNC_FONE1').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('BNC_FONE1').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('BNC_FONE1').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE BANCO SET BNC_FONE1 = :FONE');
            qryAux.SQL.Add(' WHERE BNC_CODIGO = '+QuotedStr(dm.qry.FieldByName('BNC_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('BNC_FONE1').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      // BNC_FONE2 -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('BNC_FONE2').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('BNC_FONE2').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('BNC_FONE2').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('BNC_FONE2').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('BNC_FONE2').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('BNC_FONE2').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('BNC_FONE2').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('BNC_FONE2').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('BNC_FONE2').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('BNC_FONE2').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('BNC_FONE2').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE BANCO SET BNC_FONE2 = :FONE');
            qryAux.SQL.Add(' WHERE BNC_CODIGO = '+QuotedStr(dm.qry.FieldByName('BNC_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('BNC_FONE2').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      dm.qry.Next;
    end;
  end;
  // Atualizando Tabela -> CARTORIOS
  with dm.qry, dm.qry.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM CARTORIOS');
    Open;
    while not dm.qry.eof do
    begin
      // CRT_FAX -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('CRT_FAX').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('CRT_FAX').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('CRT_FAX').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('CRT_FAX').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('CRT_FAX').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('CRT_FAX').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('CRT_FAX').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('CRT_FAX').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('CRT_FAX').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('CRT_FAX').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('CRT_FAX').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE CARTORIOS SET CRT_FAX = :FONE');
            qryAux.SQL.Add(' WHERE CRT_CODIGO = '+QuotedStr(dm.qry.FieldByName('CRT_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('CRT_FAX').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      // CRT_FONE1 -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('CRT_FONE1').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('CRT_FONE1').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('CRT_FONE1').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('CRT_FONE1').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('CRT_FONE1').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('CRT_FONE1').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('CRT_FONE1').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('CRT_FONE1').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('CRT_FONE1').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('CRT_FONE1').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('CRT_FONE1').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE CARTORIOS SET CRT_FONE1 = :FONE');
            qryAux.SQL.Add(' WHERE CRT_CODIGO = '+QuotedStr(dm.qry.FieldByName('CRT_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('CRT_FONE1').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      // CRT_FONE2 -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('CRT_FONE2').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('CRT_FONE2').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('CRT_FONE2').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('CRT_FONE2').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('CRT_FONE2').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('CRT_FONE2').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('CRT_FONE2').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('CRT_FONE2').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('CRT_FONE2').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('CRT_FONE2').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('CRT_FONE2').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE CARTORIOS SET CRT_FONE2 = :FONE');
            qryAux.SQL.Add(' WHERE CRT_CODIGO = '+QuotedStr(dm.qry.FieldByName('CRT_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('CRT_FONE2').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      dm.qry.Next;
    end;
  end;
  // Atualizando Tabela -> COBRADORES
  with dm.qry, dm.qry.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM COBRADORES');
    Open;
    while not dm.qry.eof do
    begin
      // CBR_FAX -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('CBR_FAX').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('CBR_FAX').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('CBR_FAX').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('CBR_FAX').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('CBR_FAX').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('CBR_FAX').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('CBR_FAX').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('CBR_FAX').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('CBR_FAX').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('CBR_FAX').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('CBR_FAX').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE COBRADORES SET CBR_FAX = :FONE');
            qryAux.SQL.Add(' WHERE CBR_CODIGO = '+QuotedStr(dm.qry.FieldByName('CBR_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('CBR_FAX').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      // CBR_FONE1 -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('CBR_FONE1').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('CBR_FONE1').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('CBR_FONE1').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('CBR_FONE1').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('CBR_FONE1').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('CBR_FONE1').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('CBR_FONE1').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('CBR_FONE1').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('CBR_FONE1').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('CBR_FONE1').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('CBR_FONE1').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE COBRADORES SET CBR_FONE1 = :FONE');
            qryAux.SQL.Add(' WHERE CBR_CODIGO = '+QuotedStr(dm.qry.FieldByName('CBR_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('CBR_FONE1').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      // CBR_FONE2 -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('CBR_FONE2').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('CBR_FONE2').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('CBR_FONE2').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('CBR_FONE2').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('CBR_FONE2').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('CBR_FONE2').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('CBR_FONE2').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('CBR_FONE2').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('CBR_FONE2').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('CBR_FONE2').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('CBR_FONE2').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE COBRADORES SET CBR_FONE2 = :FONE');
            qryAux.SQL.Add(' WHERE CBR_CODIGO = '+QuotedStr(dm.qry.FieldByName('CBR_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('CBR_FONE2').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      dm.qry.Next;
    end;
  end;
  // Atualizando Tabela -> TRANSPORTADORAS
  with dm.qry, dm.qry.SQL do
  begin
    Close;
    Clear;
    Add('SELECT * FROM TRANSPORTADORAS');
    Open;
    while not dm.qry.eof do
    begin
      // TRN_FAX -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('TRN_FAX').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('TRN_FAX').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('TRN_FAX').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('TRN_FAX').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('TRN_FAX').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FAX').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FAX').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FAX').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FAX').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FAX').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('TRN_FAX').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE TRANSPORTADORAS SET TRN_FAX = :FONE');
            qryAux.SQL.Add(' WHERE TRN_CODIGO = '+QuotedStr(dm.qry.FieldByName('TRN_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('TRN_FAX').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      // TRN_FONE -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('TRN_FONE').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('TRN_FONE').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('TRN_FONE').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('TRN_FONE').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('TRN_FONE').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FONE').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FONE').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FONE').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FONE').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FONE').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('TRN_FONE').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE TRANSPORTADORAS SET TRN_FONE = :FONE');
            qryAux.SQL.Add(' WHERE TRN_CODIGO = '+QuotedStr(dm.qry.FieldByName('TRN_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('TRN_FONE').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      // TRN_FONE1 -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('TRN_FONE1').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('TRN_FONE1').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('TRN_FONE1').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('TRN_FONE1').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('TRN_FONE1').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FONE1').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FONE1').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FONE1').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FONE1').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FONE1').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('TRN_FONE1').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE TRANSPORTADORAS SET TRN_FONE1 = :FONE');
            qryAux.SQL.Add(' WHERE TRN_CODIGO = '+QuotedStr(dm.qry.FieldByName('TRN_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('TRN_FONE1').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      // TRN_FONE2 -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('TRN_FONE2').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('TRN_FONE2').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('TRN_FONE2').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('TRN_FONE2').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('TRN_FONE2').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FONE2').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FONE2').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FONE2').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FONE2').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FONE2').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('TRN_FONE2').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE TRANSPORTADORAS SET TRN_FONE2 = :FONE');
            qryAux.SQL.Add(' WHERE TRN_CODIGO = '+QuotedStr(dm.qry.FieldByName('TRN_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('TRN_FONE2').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      // TRN_FONE3 -> 14 Posicaoes
      if (Trim(dm.qry.FieldByName('TRN_FONE3').AsString) <> '') then
      begin
        if (Pos('85', Copy(dm.qry.FieldByName('TRN_FONE3').AsString, 1, 3)) > 0) or
           (Pos('88', Copy(dm.qry.FieldByName('TRN_FONE3').AsString, 1, 3)) > 0) or
           (Copy(dm.qry.FieldByName('TRN_FONE3').AsString, 1, 4) = '0085') or
           (Copy(dm.qry.FieldByName('TRN_FONE3').AsString, 1, 4) = '0088') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FONE3').AsString, 1, 4)) = '85') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FONE3').AsString, 1, 4)) = '88') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FONE3').AsString, 1, 4)) = '085') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FONE3').AsString, 1, 4)) = '088') or
           (Trim(Copy(dm.qry.FieldByName('TRN_FONE3').AsString, 1, 3)) = '') then
        begin
          StFone := Right(dm.qry.FieldByName('TRN_FONE3').AsString, 8);
          NumFone := '';
          for i := 1 to Length(StFone) do
          begin
            if Copy(StFone, i, 1) <> ' ' then
              NumFone := NumFone + Copy(StFone, i, 1);
          end;
          if Length(Trim(NumFone)) = 7 then
          begin
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add('UPDATE TRANSPORTADORAS SET TRN_FONE3 = :FONE');
            qryAux.SQL.Add(' WHERE TRN_CODIGO = '+QuotedStr(dm.qry.FieldByName('TRN_CODIGO').AsString));
            qryAux.ParamByName('FONE').AsString := Copy(dm.qry.FieldByName('TRN_FONE3').AsString, 1, 4) + '3' + NumFone;
            qryAux.ExecSQL;
          end;
        end;
      end;
      dm.qry.Next;
    end;
  end;

  if dm2.IBTransaction1.InTransaction then
    dm2.IBTransaction1.CommitRetaining;
  mensagem('Operação concluída');
  qryAux.Close;
end;

procedure TfrmSqlExplorer.RichTextoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbRight) then
    PopupTexto.Popup(X + Left + 30, Y + Top + 70);
end;

procedure TfrmSqlExplorer.Splitter2CanResize(Sender: TObject;
  var NewSize: Integer; var Accept: Boolean);
begin
  if NewSize > 252 then
    NewSize := 252;
end;

end.


