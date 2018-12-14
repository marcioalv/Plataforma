//
// Arquivo..: Plataforma_ERP_VCL_LogradouroSelecao.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com os parâmetros de seleção do cadastro de logradouros.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_LogradouroSelecao;

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
  TPlataformaERPVCLLogradouroSelecao = class(TForm)
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
    mniLocalizar: TMenuItem;
    btnLocalizar: TBitBtn;
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
    procedure FormActivate(Sender: TObject);
    procedure mniLocalizarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
  private
    priListViewIndiceColuna   : Integer;
    priListViewOrdemAscendente: Boolean;

    priFiltroDescricao        : string;

    procedure FormularioLocalizar;
    procedure FormularioAtualizar;
    procedure FormularioSelecionar;
  public
    pubClicouFechar: Boolean;
    pubNovo        : Boolean;
    pubLogradouroID: Integer;
    pubCodigo      : string;
    pubDescricao   : string;
  end;

var
  PlataformaERPVCLLogradouroSelecao: TPlataformaERPVCLLogradouroSelecao;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_LogradouroSelecaoFiltro;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_LogradouroSelecao';

const
  LVW_LISTA_LOGRADOURO_ID: Integer = 0;
  LVW_LISTA_CODIGO       : Integer = 1;
  LVW_LISTA_DESCRICAO    : Integer = 2;
  LVW_LISTA_BLOQUEADO    : Integer = 3;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLLogradouroSelecao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis privadas.
  //
  priListViewIndiceColuna    := VCL_NENHUM_INDICE;
  priListViewOrdemAscendente := False;

  priFiltroDescricao := '';


  //
  // Inicializa variáveis públicas.
  //
  pubClicouFechar := True;
  pubNovo         := True;
  pubLogradouroID := 0;
  pubCodigo       := '';
  pubDescricao    := '';

  //
  // Limpa componentes do formulário.
  //
  VCLListViewLimpar(lvwLista);
end;

//
// Evento de ativação do formulário.
//
procedure TPlataformaERPVCLLogradouroSelecao.FormActivate(Sender: TObject);
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
procedure TPlataformaERPVCLLogradouroSelecao.FormShow(Sender: TObject);
begin
  FormularioAtualizar;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLLogradouroSelecao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

// 
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLLogradouroSelecao.mniLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

procedure TPlataformaERPVCLLogradouroSelecao.mniSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLLogradouroSelecao.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

procedure TPlataformaERPVCLLogradouroSelecao.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLLogradouroSelecao.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente listview.
//
procedure TPlataformaERPVCLLogradouroSelecao.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLLogradouroSelecao.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLLogradouroSelecao.lvwListaDblClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLLogradouroSelecao.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

//
// Evento de click no botão "localizar".
//
procedure TPlataformaERPVCLLogradouroSelecao.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no botão "confirmar".
//
procedure TPlataformaERPVCLLogradouroSelecao.btnSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLLogradouroSelecao.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLLogradouroSelecao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para localizar registros cadastrados.
//
procedure TPlataformaERPVCLLogradouroSelecao.FormularioLocalizar;
var
  locFormulario  : TPlataformaERPVCLLogradouroSelecaoFiltro;
  locClicouFechar: Boolean;
  locDescricao   : string;
begin
  locFormulario := TPlataformaERPVCLLogradouroSelecaoFiltro.Create(Self);

  locFormulario.pubDescricao := priFiltroDescricao;

  locFormulario.ShowModal;

  locClicouFechar := locFormulario.pubClicouFechar;
  locDescricao    := locFormulario.pubDescricao;

  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    priFiltroDescricao := locDescricao;

    FormularioAtualizar;
  end;
end;


//
// Procedimento para atualizar a lista do formulário.
//
procedure TPlataformaERPVCLLogradouroSelecao.FormularioAtualizar;
const
  PROCEDIMENTO_NOME: string = 'FormularioAtualizar';
  ERRO_MENSAGEM    : string = 'Impossível atualizar lista de logradouros!';
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
  // Limpa listview.
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
  locADOQuery.SQL.Add('SELECT                                             ');
  locADOQuery.SQL.Add('  [logradouro].[logradouro_id] AS [logradouro_id], ');
  locADOQuery.SQL.Add('  [logradouro].[codigo]        AS [codigo],        ');
  locADOQuery.SQL.Add('  [logradouro].[descricao]     AS [descricao],     ');
  locADOQuery.SQL.Add('  [logradouro].[bloqueado]     AS [bloqueado]      ');
  locADOQuery.SQL.Add('FROM                                               ');
  locADOQuery.SQL.Add('  [logradouro] WITH (NOLOCK)                       ');
  locADOQuery.SQL.Add('WHERE                                              ');
  locADOQuery.SQL.Add('  [logradouro].[ativo] = ''S''                     ');

  if pubNovo then
  begin
    locADOQuery.SQL.Add(' AND [logradouro].[bloqueado] = ''N'' ');
  end;

  //
  // Filtros.
  //
  locFiltros := False;

  if priFiltroDescricao <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [logradouro].[descricao] LIKE :descricao ');
    locADOQuery.Parameters.ParamByName('descricao').Value := StringLikeGerar(priFiltroDescricao);
  end; 

  //
  // Order by.
  //  
  locADOQuery.SQL.Add('ORDER BY                    ');
  locADOQuery.SQL.Add('  [logradouro].[codigo] ASC ');


  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar os registros na tabela [logradouro]!';
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
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('logradouro_id').AsInteger));
      locListItem.SubItems.Add(locADOQuery.FieldByName('codigo').AsString);
      locListItem.SubItems.Add(locADOQuery.FieldByName('descricao').AsString);
      locListItem.SubItems.Add(FlagSimNaoStringConverter(locADOQuery.FieldByName('bloqueado').AsString));

      if pubLogradouroID = locADOQuery.FieldByName('logradouro_id').AsInteger then
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
procedure TPlataformaERPVCLLogradouroSelecao.FormularioSelecionar;
var
  locIndice: Integer;
begin
  locIndice := VCLListViewIndiceItemRetornar(lvwLista);
  if locIndice = VCL_NENHUM_INDICE then Exit;

  pubClicouFechar := False;
  pubLogradouroID := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_LOGRADOURO_ID]);
  pubCodigo       := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_CODIGO];
  pubDescricao    := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_DESCRICAO];
  
  Close; 
end;

end.
