//
// Arquivo..: Plataforma_ERP_VCL_PaisSelecao.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com os parâmetros de seleção do cadastro de país.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_PaisSelecao;

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
  TPlataformaERPVCLPaisSelecao = class(TForm)
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
    btnLocalizar: TBitBtn;
    mniLocalizar: TMenuItem;
    lblListaQtde: TLabel;
    lblListaFiltros: TLabel;
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
    pubPaisID      : Integer;
    pubCodigo      : string;
    pubNome        : string;
  end;

var
  PlataformaERPVCLPaisSelecao: TPlataformaERPVCLPaisSelecao;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_PaisSelecaoFiltro;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_PaisSelecao';

const
  LVW_LISTA_PAIS_ID  : Integer = 0;
  LVW_LISTA_CODIGO   : Integer = 1;
  LVW_LISTA_NOME     : Integer = 2;
  LVW_LISTA_BLOQUEADO: Integer = 3;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLPaisSelecao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis privadas.
  //
  priListViewIndiceColuna    := VCL_NENHUM_INDICE;
  priListViewOrdemAscendente := False;

  priFiltroNome := '';

  //
  // Inicializa variáveis públicas.
  //
  pubClicouFechar := True;
  pubNovo         := True;
  pubPaisID       := 0;
  pubCodigo       := '';
  pubNome         := '';

  //
  // Limpa componentes do formulário.
  //
  VCLListViewLimpar(lvwLista);
end;

//
// Evento de ativação do formulário.
//
procedure TPlataformaERPVCLPaisSelecao.FormActivate(Sender: TObject);
begin
  VCLListViewColunarDimensionar(lvwLista);

  lblListaQtde.Left := lvwLista.Left;
  lblListaQtde.Top  := (lvwLista.Top + lvwLista.Height) + 8;

  lblListaFiltros.Left := (lvwLista.Left + lvwLista.Width) - lblListaFiltros.Width;
  lblListaFiltros.Top  := (lvwLista.Top + lvwLista.Height) + 8;

  lvwLista.Refresh;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLPaisSelecao.FormShow(Sender: TObject);
begin
  FormularioAtualizar;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLPaisSelecao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLPaisSelecao.mniLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

procedure TPlataformaERPVCLPaisSelecao.mniSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLPaisSelecao.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

procedure TPlataformaERPVCLPaisSelecao.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLPaisSelecao.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente listview.
//
procedure TPlataformaERPVCLPaisSelecao.lvwListaColumnClick(Sender: TObject; Column: TListColumn);
begin
  VCLListViewColunaClicar(Sender, Column, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLPaisSelecao.lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  VCLListViewComparar(Sender, Item1, Item2, Compare, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLPaisSelecao.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLPaisSelecao.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLPaisSelecao.lvwListaDblClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLPaisSelecao.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

//
// Evento de click no botão "localizar".
//
procedure TPlataformaERPVCLPaisSelecao.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no botão "confirmar".
//
procedure TPlataformaERPVCLPaisSelecao.btnSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLPaisSelecao.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLPaisSelecao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para localizar registros cadastrados.
//
procedure TPlataformaERPVCLPaisSelecao.FormularioLocalizar;
var
  locFormulario  : TPlataformaERPVCLPaisSelecaoFiltro;
  locClicouFechar: Boolean;
  locNome        : string;
begin
  locFormulario := TPlataformaERPVCLPaisSelecaoFiltro.Create(Self);

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
// Procedimento para atualizar a lista do formulário.
//
procedure TPlataformaERPVCLPaisSelecao.FormularioAtualizar;
const
  PROCEDIMENTO_NOME: string = 'FormularioAtualizar';
  ERRO_MENSAGEM    : string = 'Impossível atualizar lista de país!';
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

  //
  // Limpa componentes.
  //
  VCLListViewLimpar(lvwLista);
  lblListaQtde.Caption    := '';
  lblListaFiltros.Visible := False;

  //
  // Conexão ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(Self);

  //
  // Abre conexão com o banco de dados da aplicação.
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
  locADOQuery.SQL.Add('SELECT                              ');
  locADOQuery.SQL.Add('  [pais].[pais_id]   AS [pais_id],  ');
  locADOQuery.SQL.Add('  [pais].[codigo]    AS [codigo],   ');
  locADOQuery.SQL.Add('  [pais].[nome]      AS [nome],     ');
  locADOQuery.SQL.Add('  [pais].[bloqueado] AS [bloqueado] ');
  locADOQuery.SQL.Add('FROM                                ');
  locADOQuery.SQL.Add('  [pais] WITH (NOLOCK)              ');
  locADOQuery.SQL.Add('WHERE                               ');
  locADOQuery.SQL.Add('  [pais].[ativo] = ''S''            ');

  if pubNovo then
  begin
    locADOQuery.SQL.Add(' AND [pais].[bloqueado] = ''N'' ');
  end;

  //
  // Filtros.
  //
  locFiltros := False;

  if priFiltroNome <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [pais].[nome] LIKE :nome ');
    locADOQuery.Parameters.ParamByName('nome').Value := StringLikeGerar(priFiltroNome);
  end;

  //
  // Order by.
  //  
  locADOQuery.SQL.Add('ORDER BY                    ');
  locADOQuery.SQL.Add('  [pais].[codigo] ASC ');

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar os registros na tabela [pais]!';
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
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('pais_id').AsInteger));
      locListItem.SubItems.Add(locADOQuery.FieldByName('codigo').AsString);
      locListItem.SubItems.Add(locADOQuery.FieldByName('nome').AsString);
      locListItem.SubItems.Add(FlagSimNaoStringConverter(locADOQuery.FieldByName('bloqueado').AsString));

      if pubPaisID = locADOQuery.FieldByName('pais_id').AsInteger then
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
procedure TPlataformaERPVCLPaisSelecao.FormularioSelecionar;
var
  locIndice: Integer;
begin
  locIndice := VCLListViewIndiceItemRetornar(lvwLista);
  if locIndice = VCL_NENHUM_INDICE then Exit;

  pubClicouFechar := False;
  pubPaisID       := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_PAIS_ID]);
  pubCodigo       := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_CODIGO];
  pubNome         := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_NOME];
  
  Close; 
end;

end.
