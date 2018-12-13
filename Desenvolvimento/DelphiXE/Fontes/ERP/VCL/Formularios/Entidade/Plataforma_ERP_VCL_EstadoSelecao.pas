//
// Arquivo..: Plataforma_ERP_VCL_EstadoSelecao.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com os par�metros de sele��o do cadastro de estado.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_EstadoSelecao;

interface

uses
  Data.Win.ADODB,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls,
  Vcl.Menus;

type
  TPlataformaERPVCLEstadoSelecao = class(TForm)
    imgFormulario: TImage;
    btnSelecionar: TBitBtn;
    btnFechar: TBitBtn;
    panFormulario: TPanel;
    btnMinimizar: TBitBtn;
    imgBackground: TImage;
    lvwLista: TListView;
    pbaProgresso: TProgressBar;
    mnuFormulario: TMainMenu;
    mniFechar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniAtualizar: TMenuItem;
    mniSelecionar: TMenuItem;
    lblListaQtde: TLabel;
    lblListaFiltros: TLabel;
    btnLocalizar: TBitBtn;
    mniLocalizar: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaDblClick(Sender: TObject);
    procedure lvwListaKeyPress(Sender: TObject; var Key: Char);
    procedure mniFecharClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
    procedure mniAtualizarClick(Sender: TObject);
    procedure mniSelecionarClick(Sender: TObject);
    procedure mniLocalizarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure lvwListaColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure FormActivate(Sender: TObject);
  private
    priListViewIndiceColuna   : Integer;
    priListViewOrdemAscendente: Boolean;

    priFiltroNome             : string;

    procedure FormularioLocalizar;
    procedure FormularioAtualizar;
    procedure FormularioSelecionar;
  public
    pubClicouFechar: Boolean;
    pubNovo        : Boolean;
    pubEstadoID    : Integer;
    pubCodigo      : string;
    pubNome        : string;
  end;

var
  PlataformaERPVCLEstadoSelecao: TPlataformaERPVCLEstadoSelecao;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_EstadoSelecaoFiltro;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_EstadoSelecao';

const
  LVW_LISTA_ESTADO_ID: Integer = 0;
  LVW_LISTA_CODIGO   : Integer = 1;
  LVW_LISTA_NOME     : Integer = 2;
  LVW_LISTA_BLOQUEADO: Integer = 3;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLEstadoSelecao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis privadas.
  //
  priListViewIndiceColuna    := VCL_NENHUM_INDICE;
  priListViewOrdemAscendente := False;

  priFiltroNome := '';

  //
  // Inicializa vari�veis p�blicas.
  //
  pubClicouFechar := True;
  pubNovo         := True;
  pubEstadoID     := 0;
  pubCodigo       := '';
  pubNome         := '';

  //
  // Limpa componentes do formul�rio.
  //
  VCLListViewLimpar(lvwLista);
end;

//
// Evento de ativa��o do formul�rio.
//
procedure TPlataformaERPVCLEstadoSelecao.FormActivate(Sender: TObject);
begin
  VCLListViewColunarDimensionar(lvwLista);

  lblListaQtde.Left := lvwLista.Left;
  lblListaQtde.Top  := (lvwLista.Top + lvwLista.Height) + 8;

  lblListaFiltros.Left := (lvwLista.Left + lvwLista.Width) - lblListaFiltros.Width;
  lblListaFiltros.Top  := (lvwLista.Top + lvwLista.Height) + 8;

  lvwLista.Refresh;
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLEstadoSelecao.FormShow(Sender: TObject);
begin
  FormularioAtualizar;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLEstadoSelecao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas op��es do menu.
//
procedure TPlataformaERPVCLEstadoSelecao.mniLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

procedure TPlataformaERPVCLEstadoSelecao.mniSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLEstadoSelecao.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

procedure TPlataformaERPVCLEstadoSelecao.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLEstadoSelecao.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente listview.
//
procedure TPlataformaERPVCLEstadoSelecao.lvwListaColumnClick(Sender: TObject; Column: TListColumn);
begin
  VCLListViewColunaClicar(Sender, Column, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLEstadoSelecao.lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  VCLListViewComparar(Sender, Item1, Item2, Compare, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLEstadoSelecao.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLEstadoSelecao.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLEstadoSelecao.lvwListaDblClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLEstadoSelecao.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

//
// Evento de click no bot�o "localizar".
//
procedure TPlataformaERPVCLEstadoSelecao.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no bot�o "confirmar".
//
procedure TPlataformaERPVCLEstadoSelecao.btnSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

//
// Evento de click no bot�o "minimizar".
//
procedure TPlataformaERPVCLEstadoSelecao.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLEstadoSelecao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para localizar registros cadastrados.
//
procedure TPlataformaERPVCLEstadoSelecao.FormularioLocalizar;
var
  locFormulario  : TPlataformaERPVCLEstadoSelecaoFiltro;
  locClicouFechar: Boolean;
  locNome        : string;
begin
  locFormulario := TPlataformaERPVCLEstadoSelecaoFiltro.Create(Self);

  locFormulario.pubNome := priFiltroNome;

  locFormulario.ShowModal;

  locClicouFechar := locFormulario.pubClicouFechar;
  locNome         := locFormulario.pubNome;

  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    priFiltroNome := locNome;

    FormularioAtualizar;
  end;
end;

//
// Procedimento para atualizar a lista do formul�rio.
//
procedure TPlataformaERPVCLEstadoSelecao.FormularioAtualizar;
const
  PROCEDIMENTO_NOME: string = 'FormularioAtualizar';
  ERRO_MENSAGEM    : string = 'Imposs�vel atualizar lista de estados!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
  locListItem     : TListItem;
  locIndice       : Integer;
  locFiltros      : Boolean;
begin
  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);
  lblListaQtde.Caption    := '';
  lblListaFiltros.Visible := False;

  //
  // Limpa listview.
  //
  VCLListViewLimpar(lvwLista);

  //
  // Conex�o ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(Self);

  //
  // Abre conex�o com o banco de dados da aplica��o.
  //
  try
    Plataforma_ERP_ADO_ConexaoAbrir(locADOConnection);
  except
    on locExcecao: Exception do
    begin
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Query.
  //
  locADOQuery                := TADOQuery.Create(Self);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Seleciona dados.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                 ');
  locADOQuery.SQL.Add('  [estado].[estado_id] AS [estado_id], ');
  locADOQuery.SQL.Add('  [estado].[codigo]    AS [codigo],    ');
  locADOQuery.SQL.Add('  [estado].[nome]      AS [nome],      ');
  locADOQuery.SQL.Add('  [estado].[bloqueado] AS [bloqueado]  ');
  locADOQuery.SQL.Add('FROM                                   ');
  locADOQuery.SQL.Add('  [estado] WITH (NOLOCK)               ');
  locADOQuery.SQL.Add('WHERE                                  ');
  locADOQuery.SQL.Add('  [estado].[ativo] = ''S''             ');

  if pubNovo then
  begin
    locADOQuery.SQL.Add(' AND [estado].[bloqueado] = ''N'' ');
  end;

  //
  // Filtros.
  //
  locFiltros := False;

  if priFiltroNome <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [estado].[nome] LIKE :nome ');
    locADOQuery.Parameters.ParamByName('nome').Value := StringLikeGerar(priFiltroNome);
  end;

  //
  // Order by.
  //  
  locADOQuery.SQL.Add('ORDER BY                ');
  locADOQuery.SQL.Add('  [estado].[codigo] ASC ');

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar os registros na tabela [estado]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  locADOQuery.Last;
  locADOQuery.First;

  //
  // Ajusta progressbar.
  //
  VCLProgressBarInicializar(pbaProgresso, locADOQuery.RecordCount);

  //
  // Insere registros no listview.
  //
  locIndice := VCL_NENHUM_INDICE;
  
  if locADOQuery.RecordCount > 0 then
  begin  
    lvwLista.Items.BeginUpdate;
    while not locADOQuery.EOF do
    begin
      VCLProgressBarIncrementar(pbaProgresso);
    
      locListItem         := lvwLista.Items.Add;
      locListItem.Caption := '';
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('estado_id').AsInteger));
      locListItem.SubItems.Add(locADOQuery.FieldByName('codigo').AsString);
      locListItem.SubItems.Add(locADOQuery.FieldByName('nome').AsString);
      locListItem.SubItems.Add(FlagSimNaoStringConverter(locADOQuery.FieldByName('bloqueado').AsString));

      if pubEstadoID = locADOQuery.FieldByName('estado_id').AsInteger then
      begin
        locIndice := (lvwLista.Items.Count - 1);
      end;

      locADOQuery.Next;
    end;
    lvwLista.Items.EndUpdate;
  end;

  //
  // Label de quantidade de linhas no listview.
  //
  VCLListViewQtdeLinhasMensagem(lblListaQtde, lvwLista, locFiltros);
  lblListaFiltros.Visible := locFiltros;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);
  VCLProgressBarLimpar(pbaProgresso);
  VCLCursorTrocar;

  //
  // Foco no item correto da lista.
  //
  if locIndice <> VCL_NENHUM_INDICE then
  begin
    VCLListViewItemPosicionar(lvwLista, locIndice);
  end;
  VCLListViewFocar(lvwLista);
end;

//
// Procedimento para selecionar uma das linhas da lista.
//
procedure TPlataformaERPVCLEstadoSelecao.FormularioSelecionar;
var
  locIndice: Integer;
begin
  locIndice := VCLListViewIndiceItemRetornar(lvwLista);
  if locIndice = VCL_NENHUM_INDICE then Exit;

  pubClicouFechar := False;
  pubEstadoID     := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_ESTADO_ID]);
  pubCodigo       := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_CODIGO];
  pubNome         := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_NOME];
  
  Close; 
end;

end.
