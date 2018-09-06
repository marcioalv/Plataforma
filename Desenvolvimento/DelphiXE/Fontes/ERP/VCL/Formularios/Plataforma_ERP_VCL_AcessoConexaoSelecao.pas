
unit Plataforma_ERP_VCL_AcessoConexaoSelecao;

interface

uses
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
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TPlataformaERPVCLAcessoConexaoSelecao = class(TForm)
    panFormulario: TPanel;
    lvwLista: TListView;
    imgFormulario: TImage;
    imgBackground: TImage;
    btnFechar: TBitBtn;
    btnMinimizar: TBitBtn;
    btnSelecionar: TBitBtn;
    mnuFormulario: TMainMenu;
    mniFechar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniSelecionar: TMenuItem;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaDblClick(Sender: TObject);
    procedure lvwListaKeyPress(Sender: TObject; var Key: Char);
    procedure lvwListaColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure btnFecharClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure mniSelecionarClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
  private
    priListViewColuna    : Integer;
    priListViewAscendente: Boolean;
    
    procedure FormularioLimpar;
    procedure FormularioControlar;
    procedure FormularioSelecionar;
    procedure FormularioAtualizar;
  public
    pubClicouFechar: Boolean;
    pubItem        : Integer;
    pubTitulo      : string;
  end;

var
  PlataformaERPVCLAcessoConexaoSelecao: TPlataformaERPVCLAcessoConexaoSelecao;

implementation

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_Framework_ArquivoIni,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico,
  Plataforma_ERP_Inicializacao;

const
  LVW_COLUNA_ITEM  : Integer = 0;
  LVW_COLUNA_TITULO: Integer = 1;

{$R *.dfm}

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis privadas do formulário.
  //
  priListViewColuna     := 0;
  priListViewAscendente := True;
  
  //
  // Inicializa variáveis públicas.
  //
  pubClicouFechar := True;
  pubItem         := 0;
  pubTitulo       := '';
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormShow(Sender: TObject);
begin
  //
  // Background do formulário.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Carrega lista de conexões cadastradas.
  //
  FormularioAtualizar;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nos itens do menu.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.mniSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLAcessoConexaoSelecao.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLAcessoConexaoSelecao.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos da lista.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.lvwListaColumnClick(Sender: TObject; Column: TListColumn);
begin
  VCLListViewColunaClicar(Sender, Column, priListViewColuna, priListViewAscendente);
end;

procedure TPlataformaERPVCLAcessoConexaoSelecao.lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  VCLListViewComparar(Sender, Item1, Item2, Compare, priListViewColuna, priListViewAscendente);
end;

procedure TPlataformaERPVCLAcessoConexaoSelecao.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLAcessoConexaoSelecao.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLAcessoConexaoSelecao.lvwListaDblClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLAcessoConexaoSelecao.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

//
// Evento de click no botão "selecionar".
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.btnSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

//
// Evento de click no botão "minimizar'.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormularioLimpar;
begin
  VCLListViewLimpar(lvwLista);
  FormularioControlar;
end;

//
// Procedimento para controlar a exibição dos componentes do formulário.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormularioControlar;
begin
  mniSelecionar.Visible := (lvwLista.Items.Count > 0);
  btnSelecionar.Visible := mniSelecionar.Visible;
end;

//
// Procedimento para selecionar uma das conexões configuradas.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormularioSelecionar;
var
  locIndice: Integer;
begin
  //
  // Determina o item da linha selecionada.
  //
  if VCLListViewIndiceItemRetornar(lvwLista) = VCL_NENHUM_INDICE then
  begin
    Exit;
  end;

  locIndice := lvwLista.Selected.Index;

  //
  // Define o valor do item.
  //
  pubItem   := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_ITEM]);
  pubTitulo := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_TITULO];

  //
  // Usuário não clicou em sair.
  //
  pubClicouFechar := False;

  //
  // Fecha formulário.
  //
  Close;
end;

//
// Procedimento para atualizar a lista de conexões configuradas.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormularioAtualizar;
const
  PROCEDIMENTO_NOME: string = 'FormularioAtualizar';
  ERRO_MENSAGEM    : string = 'Impossível consultar dados do arquivo de configuração da aplicação!';
var
  locLogMensagem: string;
  locSessao     : string;
  locQuantidade : Integer;
  locContador   : Integer;
  locItem       : Integer;
  locTitulo     : string;
  locListItem   : TListItem;
begin
  //
  // Troca o cursor.
  //
  VCLCursorTrocar(True);

  //
  // Limpa componentes.
  //
  FormularioLimpar;

  //
  // Verifica se o arquivo de configuração existe na pasta adequada.
  //
  if not FileExists(gloConfiguracaoArquivo) then
  begin
    VCLCursorTrocar;
    Exit;
  end;

  //
  // Lê a quantidade de conexões existente no arquivo de configuração.
  //
  try
    locQuantidade := ArquivoIniIntegerRecuperar(gloConfiguracaoArquivo, ARQUIVO_INI_CONEXAO_GERAL, ARQUIVO_INI_CONEXAO_GERAL_QUANTIDADE);
  except
    on locExcecao: Exception do
    begin
      locLogMensagem := 'Erro ao ler a quantidade de conexões configuradas no arquivo de configuração da aplicação!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Inicia laço para ler cada uma das configurações de conexão do arquivo de configuração.
  //
  for locContador := 0 to (locQuantidade - 1) do
  begin
    //
    // Formata o nome da sessão.
    //
    locSessao := ARQUIVO_INI_CONEXAO_SESSAO + '_' + StringPreencher(IntegerStringConverter(locContador + 1), 4, '0');

    //
    // Carrega os dados da conexão.
    //
    try
      locItem       := ArquivoIniIntegerRecuperar(gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_ITEM);
      locTitulo     := ArquivoIniStringRecuperar (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_TITULO);
    except
      on locExcecao: Exception do
      begin
        locLogMensagem := 'Erro ao ler parâmetros das conexões com o banco de daos do arquivo de configuração da aplicação!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
        Exit;
      end;
    end;

    //
    // Insere linha na lista.
    //
    locListItem         := lvwLista.Items.Add;
    locListItem.Caption := '';
    locListItem.SubItems.Add(IntegerStringConverter(locItem));
    locListItem.SubItems.Add(locTitulo);
  end;  

  //
  // Troca o cursor.
  //
  VCLCursorTrocar;  

  //
  // Controlar os componentes.
  //
  FormularioControlar;

  //
  // Foco no listview.
  //
  VCLListViewItemPosicionar(lvwLista, 0);
  VCLListViewFocar(lvwLista);
end;

end.
