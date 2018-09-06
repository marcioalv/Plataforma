
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
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis privadas do formul�rio.
  //
  priListViewColuna     := 0;
  priListViewAscendente := True;
  
  //
  // Inicializa vari�veis p�blicas.
  //
  pubClicouFechar := True;
  pubItem         := 0;
  pubTitulo       := '';
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormShow(Sender: TObject);
begin
  //
  // Background do formul�rio.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Carrega lista de conex�es cadastradas.
  //
  FormularioAtualizar;
end;

//
// Evento de pressionamento de teclas no formul�rio.
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
// Evento de click no bot�o "selecionar".
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.btnSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

//
// Evento de click no bot�o "minimizar'.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormularioLimpar;
begin
  VCLListViewLimpar(lvwLista);
  FormularioControlar;
end;

//
// Procedimento para controlar a exibi��o dos componentes do formul�rio.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormularioControlar;
begin
  mniSelecionar.Visible := (lvwLista.Items.Count > 0);
  btnSelecionar.Visible := mniSelecionar.Visible;
end;

//
// Procedimento para selecionar uma das conex�es configuradas.
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
  // Usu�rio n�o clicou em sair.
  //
  pubClicouFechar := False;

  //
  // Fecha formul�rio.
  //
  Close;
end;

//
// Procedimento para atualizar a lista de conex�es configuradas.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormularioAtualizar;
const
  PROCEDIMENTO_NOME: string = 'FormularioAtualizar';
  ERRO_MENSAGEM    : string = 'Imposs�vel consultar dados do arquivo de configura��o da aplica��o!';
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
  // Verifica se o arquivo de configura��o existe na pasta adequada.
  //
  if not FileExists(gloConfiguracaoArquivo) then
  begin
    VCLCursorTrocar;
    Exit;
  end;

  //
  // L� a quantidade de conex�es existente no arquivo de configura��o.
  //
  try
    locQuantidade := ArquivoIniIntegerRecuperar(gloConfiguracaoArquivo, ARQUIVO_INI_CONEXAO_GERAL, ARQUIVO_INI_CONEXAO_GERAL_QUANTIDADE);
  except
    on locExcecao: Exception do
    begin
      locLogMensagem := 'Erro ao ler a quantidade de conex�es configuradas no arquivo de configura��o da aplica��o!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Inicia la�o para ler cada uma das configura��es de conex�o do arquivo de configura��o.
  //
  for locContador := 0 to (locQuantidade - 1) do
  begin
    //
    // Formata o nome da sess�o.
    //
    locSessao := ARQUIVO_INI_CONEXAO_SESSAO + '_' + StringPreencher(IntegerStringConverter(locContador + 1), 4, '0');

    //
    // Carrega os dados da conex�o.
    //
    try
      locItem       := ArquivoIniIntegerRecuperar(gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_ITEM);
      locTitulo     := ArquivoIniStringRecuperar (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_TITULO);
    except
      on locExcecao: Exception do
      begin
        locLogMensagem := 'Erro ao ler par�metros das conex�es com o banco de daos do arquivo de configura��o da aplica��o!';
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
