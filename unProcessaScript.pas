unit unProcessaScript;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, StdCtrls, Buttons, ComCtrls, ExtCtrls, RXCtrls;

type
  TfrmProcessaScript = class(TFrmPadrao)
    brnLocalizar: TBitBtn;
    OpenDialog1: TOpenDialog;
    BitBtn1: TBitBtn;
    btnLimpar: TBitBtn;
    Panel1: TPanel;
    MemoConteudo: TMemo;
    Splitter1: TSplitter;
    ListViewCte: TListView;
    BitBtn3: TBitBtn;
    RxLabel2: TRxLabel;
    BitBtn2: TBitBtn;
    procedure brnLocalizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure ListViewCteSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    arquivo: TStrings;
    procedure setArquivoTexto(nome: string);
    function getTipoArquivo: string;
    function existeArquivoNaLista(valor: string): boolean;
    procedure verificarSeProcessado;
  public
    { Public declarations }
  end;

var
  frmProcessaScript: TfrmProcessaScript;

implementation

uses unPesquisa, unFuncoes, unDataModule2, unMenu, unAcessos;

{$R *.dfm}

procedure TfrmProcessaScript.brnLocalizarClick(Sender: TObject);
var
  i: integer;
  tipo, nome: string;
  itemList: TListItem;
begin
  try
    if not OpenDialog1.Execute then Exit;
    btnLimpar.Click;
    for i := 0 to OpenDialog1.Files.Count - 1 do
    begin
      nome := OpenDialog1.Files.Strings[i];
      if not existeArquivoNaLista(nome) then
      begin
        setArquivoTexto(nome);
        tipo := getTipoArquivo;
        if not (tipo = 'ERRO') then
        begin
          itemList := ListViewCte.Items.Add;
          itemList.Caption := tipo;
          itemList.SubItems.Add('');
          itemList.SubItems.Add(nome);
        end;
      end;
    end;
  finally
    verificarSeProcessado;
  end;
end;

function TfrmProcessaScript.getTipoArquivo: string;
begin
  if not Assigned(arquivo) then Exit;
  if Pos('INSERT', arquivo.Text) > 0 then
    Result := 'INSERT'
  else if Pos('UPDATE', arquivo.Text) > 0 then
    Result := 'UPDATE'
  else
    Result := 'ERRO';
end;

procedure TfrmProcessaScript.setArquivoTexto(nome: string);
begin
  arquivo.LoadFromFile(nome);
end;

procedure TfrmProcessaScript.FormCreate(Sender: TObject);
begin
  arquivo := TStringList.Create;
  BitBtn2.Visible := usuarioLogadoIsAssistSistemas;
end;

function TfrmProcessaScript.existeArquivoNaLista(valor: string): boolean;
var
  i: integer;
  tem: boolean;
begin
  tem := false;
  for i := 0 to ListViewCte.Items.Count - 1 do
  begin
    tem := ListViewCte.Items[i].SubItems[1] = valor;
    if tem then Break;
  end;
  Result := tem;
end;

procedure TfrmProcessaScript.btnLimparClick(Sender: TObject);
begin
  ListViewCte.Clear;
  MemoConteudo.Clear;
end;

procedure TfrmProcessaScript.ListViewCteSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if FileExists(Item.SubItems[1])
    then MemoConteudo.Lines.LoadFromFile(Item.SubItems[1]);
end;

procedure TfrmProcessaScript.BitBtn3Click(Sender: TObject);
var
  qt, i: integer;
  nome: string;
begin
  try
    qt := 0;
    try
      msgException('Sem itens para executar!', nil, ListViewCte.Items.Count = 0);
      if not msgConfirma('Confirma processamento?') then Exit;
      MostraMSG(Self, 'Iniciando processo');
      for i := 0 to ListViewCte.Items.Count - 1 do
      begin
        if (not (ListViewCte.Items[i].SubItems[0] = 'Importado'))
          and FileExists(ListViewCte.Items[i].SubItems[1]) then
          begin
            inc(qt);
            ListViewCte.ItemIndex := i;
            nome := ExtractFileName(ListViewCte.Items[i].SubItems[1]);
            MostraMSG(Self, 'Processando: ' + nome);
            try TIBConsulta.Executar(MemoConteudo.Text); except end;
            TIBConsulta.Executar('INSERT INTO SCRIPT_EXTRA (ARQUIVO) VALUES('+QuotedStr(nome)+')');
            ListViewCte.Items[i].SubItems[0] := 'ok';
            Application.ProcessMessages;
          end;

        if FileExists(ListViewCte.Items[i].SubItems[1])
          then RenameFile(ListViewCte.Items[i].SubItems[1], ListViewCte.Items[i].SubItems[1]+'_OK');

      end;

      if qt > 0 then MostraMSG(Self, 'Gravando dados...');
      if qt > 0 then GravarNoBancoDeDados;

      MemoConteudo.Clear;
      msgInfo('Processado '+IntToStr(qt) + ' registro(s).');

    except on E: Exception do
      msgError(PChar(E.Message), PChar(TITULO));
    end;
  finally
    MostraMSG();
  end;
end;

procedure TfrmProcessaScript.verificarSeProcessado;
var
  i: integer;
  nome: string;
begin
  for i := 0 to ListViewCte.Items.Count - 1 do
  begin
    nome := ExtractFileName(ListViewCte.Items[i].SubItems[1]);
    if ExisteRegistro('SCRIPT_EXTRA', 'UPPER(ARQUIVO)=UPPER('+QuotedStr(nome)+')')
      then ListViewCte.Items[i].SubItems[0] := 'Importado';
  end;
end;

procedure TfrmProcessaScript.BitBtn2Click(Sender: TObject);
var
  i: integer;
  caminho, nome, novo: string;
begin
  try
    OpenDialog1.Filter := '*.*ok';
    if OpenDialog1.Execute then
      for i := 0 to OpenDialog1.Files.Count - 1 do
      begin
        MostraMSG(Self, 'Processando: ' + OpenDialog1.Files.Strings[i]);
        caminho := ExtractFilePath(OpenDialog1.Files.Strings[i]);
        nome := caminho + ExtractFileName(OpenDialog1.Files.Strings[i]);
        novo := Copy(nome, 1, Pos('.', nome)-1)+'.txt';
        if CopyFile(PAnsiChar(nome), PAnsiChar(novo), True)
          then DeleteFile(nome);
      end;
  finally
    MostraMSG();
  end;
end;

end.
