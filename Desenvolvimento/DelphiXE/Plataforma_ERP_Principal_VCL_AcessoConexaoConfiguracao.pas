{+------------------------------------------------------------------------------------------------+}
{| Plataforma Tecnologia e Informação Ltda                               CNPJ: 22.508.362/0001-20 |}
{+------------------------------------------------------------------------------------------------+}
{| Projeto: ERP/VCL                                                                               |}
{|   Fonte: Plataforma_ERP_Principal_VCL_AcessoConexaoConfiguracao.pas                            |}
{+------------------------------------------------------------------------------------------------+}
{| Formulário para o cadastro das configurações de acesso à aplicação.                            |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
{| Todos os direitos reservados:                                                                  |}
{| O código fonte com o programa de computador contido nesse arquivo são de propriedade           |}
{| exclusiva da empresa Plataforma Tecnologia e Informação Ltda, e seus direitos autorais são     |}
{| protegidos por lei.                                                                            |}
{| Nenhuma parte pode ser acessada, visualizada, utilizada, modificada, copiada ou transferida    |}
{| sem prévia permissão por escrito da proprietária.                                              |}
{| A violação de qualquer um destes direitos é crime!                                             |}
{+------------------------------------------------------------------------------------------------+}

unit Plataforma_ERP_Principal_VCL_AcessoConexaoConfiguracao;

interface

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_Framework_ArquivoIni,
  Plataforma_Framework_Conexao,
  Plataforma_Framework_Criptografia,
  Plataforma_ERP_Principal_Unit_ArquivoInicializacao,
  Plataforma_ERP_Principal_VCL_AcessoConexaoConfiguracaoLocalizacao,
  Plataforma_ERP_Principal_VCL_ConexaoTeste,
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
  Vcl.ExtCtrls, Vcl.Buttons;

const
  LVW_COLUNA_ITEM       : Integer = 0;
  LVW_COLUNA_TITULO     : Integer = 1;
  LVW_COLUNA_MODO       : Integer = 2;
  LVW_COLUNA_CODIGO     : Integer = 3;
  LVW_COLUNA_CHAVE_ID   : Integer = 4;
  LVW_COLUNA_BASE_ID    : Integer = 5;
  LVW_COLUNA_SGBD       : Integer = 6;
  LVW_COLUNA_DRIVER     : Integer = 7;
  LVW_COLUNA_SERVIDOR   : Integer = 8;
  LVW_COLUNA_PORTA      : Integer = 9;
  LVW_COLUNA_INSTANCIA  : Integer = 10;
  LVW_COLUNA_USUARIO    : Integer = 11;
  LVW_COLUNA_SENHA      : Integer = 12;
  LVW_COLUNA_BANCO_DADOS: Integer = 13;
  LVW_COLUNA_TIME_OUT   : Integer = 14;

type
  TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao = class(TForm)
    btnAtualizar: TButton;
    btnSair: TButton;
    btnNovo: TButton;
    btnEditar: TButton;
    btnRemover: TButton;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    btnGravar: TButton;
    btnTestar: TButton;
    panFormulario: TPanel;
    lblQtdeLinhas: TLabel;
    lblitem: TLabel;
    lblTitulo: TLabel;
    lblServidor: TLabel;
    lblPorta: TLabel;
    lblInstancia: TLabel;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    lblBancoDados: TLabel;
    lblTimeOut: TLabel;
    lblSGBD: TLabel;
    sbtListaSubirTodos: TSpeedButton;
    sbtListaSubir: TSpeedButton;
    sbtListaDescer: TSpeedButton;
    sbtListaDescerTodos: TSpeedButton;
    sbtListaLocalizar: TSpeedButton;
    Label1: TLabel;
    lvwLista: TListView;
    edtItem: TEdit;
    edtTitulo: TEdit;
    edtServidor: TEdit;
    edtPorta: TEdit;
    edtInstancia: TEdit;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    edtBancoDados: TEdit;
    edtTimeOut: TEdit;
    cbxSGBD: TComboBox;
    cbxModo: TComboBox;
    lblCodigo: TLabel;
    lblID: TLabel;
    edtCodigo1: TEdit;
    edtCodigo2: TEdit;
    edtCodigo3: TEdit;
    edtCodigo4: TEdit;
    edtChaveID: TEdit;
    Label2: TLabel;
    edtBaseID: TEdit;
    lblDriver: TLabel;
    edtDriver: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure lvwListaChange(Sender: TObject; Item: TListItem; Change: TItemChange);
    procedure edtTituloEnter(Sender: TObject);
    procedure edtTituloExit(Sender: TObject);
    procedure edtTituloKeyPress(Sender: TObject; var Key: Char);
    procedure cbxSGBDEnter(Sender: TObject);
    procedure cbxSGBDExit(Sender: TObject);
    procedure cbxSGBDKeyPress(Sender: TObject; var Key: Char);
    procedure edtServidorEnter(Sender: TObject);
    procedure edtServidorExit(Sender: TObject);
    procedure edtServidorKeyPress(Sender: TObject; var Key: Char);
    procedure edtPortaEnter(Sender: TObject);
    procedure edtPortaExit(Sender: TObject);
    procedure edtPortaKeyPress(Sender: TObject; var Key: Char);
    procedure edtInstanciaEnter(Sender: TObject);
    procedure edtInstanciaExit(Sender: TObject);
    procedure edtInstanciaKeyPress(Sender: TObject; var Key: Char);
    procedure edtUsuarioEnter(Sender: TObject);
    procedure edtUsuarioExit(Sender: TObject);
    procedure edtUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaEnter(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure edtBancoDadosEnter(Sender: TObject);
    procedure edtBancoDadosExit(Sender: TObject);
    procedure edtBancoDadosKeyPress(Sender: TObject; var Key: Char);
    procedure edtTimeOutEnter(Sender: TObject);
    procedure edtTimeOutExit(Sender: TObject);
    procedure edtTimeOutKeyPress(Sender: TObject; var Key: Char);
    procedure lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure btnNovoClick(Sender: TObject);
    procedure bt(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure sbtListaLocalizarClick(Sender: TObject);
    procedure sbtListaSubirTodosClick(Sender: TObject);
    procedure sbtListaSubirClick(Sender: TObject);
    procedure sbtListaDescerClick(Sender: TObject);
    procedure sbtListaDescerTodosClick(Sender: TObject);
    procedure btnTestarClick(Sender: TObject);
    procedure edtCodigo1Enter(Sender: TObject);
    procedure edtCodigo1Exit(Sender: TObject);
    procedure edtCodigo1KeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigo2Enter(Sender: TObject);
    procedure edtCodigo2Exit(Sender: TObject);
    procedure edtCodigo2KeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigo3Enter(Sender: TObject);
    procedure edtCodigo3Exit(Sender: TObject);
    procedure edtCodigo3KeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigo4Enter(Sender: TObject);
    procedure edtCodigo4Exit(Sender: TObject);
    procedure edtCodigo4KeyPress(Sender: TObject; var Key: Char);
    procedure edtChaveIDEnter(Sender: TObject);
    procedure edtChaveIDExit(Sender: TObject);
    procedure edtChaveIDKeyPress(Sender: TObject; var Key: Char);
    procedure cbxModoEnter(Sender: TObject);
    procedure cbxModoExit(Sender: TObject);
    procedure cbxModoKeyPress(Sender: TObject; var Key: Char);
    procedure edtBaseIDEnter(Sender: TObject);
    procedure edtBaseIDExit(Sender: TObject);
    procedure edtBaseIDKeyPress(Sender: TObject; var Key: Char);
    procedure edtDriverEnter(Sender: TObject);
    procedure edtDriverExit(Sender: TObject);
    procedure edtDriverKeyPress(Sender: TObject; var Key: Char);
    procedure cbxSGBDChange(Sender: TObject);
  private
    priLocalizarModo  : Byte;
    priLocalizarTitulo: string;
  
    /// <summary>
    /// Procedimento para controlar os componentes do formulário.
    /// </summary>
    /// <param name="argModo">
    /// Determina o moodo do controle desejado, utilizar as constantes:
    ///   VCL_MODO_NOVO.
    ///   VCL_MODO_EDITAR.
    ///   VCL_MODO_VISUALIZAR.
    /// </param>
    procedure ComponentesControlar(argModo: Byte);

    /// <summary>
    /// Procedimento para controlar alguns componentes do formulário conforme a seleção do SGBD.
    /// </summary>
    procedure ComponentesControlarSGBD;
  
    /// <summary>
    /// Procedimento para limpar os componentes do formulário.
    /// </summary>
    /// <param name="argCompleto">
    /// Se TRUE todos os componentes do formulário serão limpos caso contrário somente os de edição de dados.
    /// </param>
    procedure ComponentesLimpar(argCompleto: Boolean = True);

    /// <summary>
    /// Procedimento para popular os componentes no formulário.
    /// </summary>
    /// <param name="argIndice">
    /// Índice da lista da qual serão populados os dados.
    /// </param>
    procedure ComponentesPopular(argIndice: Integer);

    /// <summary>
    /// Procedimento para localizar um dos itens da lista.
    /// </summary>
    procedure FormularioLocalizar;

    /// <summary>
    /// Procedimento para movimentar um item da lista.
    /// </summary>
    /// <param name="argMovimento">
    /// Movimento que deve ser executado com o item, utilizar as constantes:
    ///   VCL_MOVIMENTO_SUBIR_TODOS.
    ///   VCL_MOVIMENTO_SUBIR.
    ///   VCL_MOVIMENTO_DESCER.
    ///   VCL_MOVIMENTO_DESCER_TODOS.
    /// </param>
    procedure FormularioMovimentar(argMovimento: Byte);

    /// <summary>
    /// Procedimento para preparar o formulário para uma nova configuração.
    /// </summary>
    procedure FormularioNovo;

    /// <summary>
    /// Procedimento para preparar o formulário para uma edição de configuração.
    /// </summary>
    procedure FormularioEditar;

    /// <summary>
    /// Procedimento para remover um item da lista.
    /// </summary>
    procedure FormularioRemover;

    /// <summary>
    /// Procedimento para testar a conexão.
    /// </summary>
    procedure FormularioTestar;    

    /// <summary>
    /// Procedimento para confirmar a edição dos dados.
    /// </summary>
    procedure FormularioConfirmar;

    /// <summary>
    /// Procedimento para cancelar a edição dos dados.
    /// </summary>
    procedure FormularioCancelar;

    /// <summary>
    /// Procedimento para atualizar a lista de conexões disponíveis.
    /// </summary>
    procedure FormularioAtualizar(argSolicitarConfirmacao: Boolean = True);

    /// <summary>
    /// Procedimento para gravar a lista de conexões disponíveis.
    /// </summary>
    procedure FormularioGravar;

    /// <summary>
    /// Procedimento para sair do formulário.
    /// </summary>
    procedure FormularioSair;

    /// <summary>
    /// Função para converter uma constante modo em seu título.
    /// </summary>
    function ModoTituloConverter(argModo: string): string;

    /// <summary>
    /// Função para o título de um modo em sua constante.
    /// </summary>
    function TituloModoConverter(argModo: string): string;
    
    /// <summary>
    /// Função para converter uma constante SGBD em seu título.
    /// </summary>
    function SGBDTituloConverter(argSGBD: string): string;

    /// <summary>
    /// Função para o título de uma SGBD em sua constante.
    /// </summary>
    function TituloSGBDConverter(argSGBD: string): string;
  public
    pubClicouSair: Boolean;
  end;

var
  PlataformaERPPrincipalVCLAcessoConexaoConfiguracao: TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao;

implementation

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ÁREA DE EVENTOS                                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////

{+------------------------------------------------------------------------------------------------+}
{| FormCreate                                                                                     |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de criação do formulário.                                                               |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis privadas.
  //
  priLocalizarModo   := VCL_LOCALIZAR_PRIMEIRO;
  priLocalizarTitulo := '';

  //
  // Inicializa variáveis públicas.
  //
  pubClicouSair := True;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormShow                                                                                       |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de exibição do formulário.                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.FormShow(Sender: TObject);
begin
  //
  // Carrega listas fixas.
  //
  VCLListaModoAcessoInserir(cbxModo);
  VCLListaSGBDInserir(cbxSGBD);

  //
  // Limpa os componentes do formulário.
  //
  ComponentesLimpar;

  //
  // Controlar componentes.
  //
  ComponentesControlar(VCL_MODO_VISUALIZAR);

  //
  // Carrega lista.
  //
  FormularioAtualizar(False);
end;

{+------------------------------------------------------------------------------------------------+}
{| FormKeyPress                                                                                   |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de pressionamento de teclas no formulário.                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

{+------------------------------------------------------------------------------------------------+}
{| lvwListaChange                                                                                 |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente lvwLista.                                                   |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.lvwListaChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
  ComponentesPopular(Item.Index);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

{+------------------------------------------------------------------------------------------------+}
{| sbtListaLocalizarClick                                                                         |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de clique no botão componente sbtListaLocalizar.                                       |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.sbtListaLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

{+------------------------------------------------------------------------------------------------+}
{| Eventos de clique nos botões de movimentação dos itens da lista.                               |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.sbtListaSubirTodosClick(Sender: TObject);
begin
  FormularioMovimentar(VCL_MOVIMENTO_SUBIR_TODOS);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.sbtListaSubirClick(Sender: TObject);
begin
  FormularioMovimentar(VCL_MOVIMENTO_SUBIR);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.sbtListaDescerClick(Sender: TObject);
begin
  FormularioMovimentar(VCL_MOVIMENTO_DESCER);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.sbtListaDescerTodosClick(Sender: TObject);
begin
  FormularioMovimentar(VCL_MOVIMENTO_DESCER_TODOS);
end;

{+------------------------------------------------------------------------------------------------+}
{| edtTitulo                                                                                      |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente edtTitulo.                                                   |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtTituloEnter(Sender: TObject);
begin
  VCLEditEntrar(edtTitulo);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtTituloKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtTituloExit(Sender: TObject);
begin
  VCLEditSair(edtTitulo);
end;

{+------------------------------------------------------------------------------------------------+}
{| cbxModo                                                                                        |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente cbxModo.                                                     |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 05/Março/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.cbxModoEnter(Sender: TObject);
begin
  VCLComboBoxEntrar(cbxModo);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.cbxModoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.cbxModoExit(Sender: TObject);
begin
  VCLComboBoxSair(cbxModo);
end;

{+------------------------------------------------------------------------------------------------+}
{| edtCodigo1                                                                                     |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente edtCodigo1.                                                  |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 05/Março/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtCodigo1Enter(Sender: TObject);
begin
  VCLEditEntrar(edtCodigo1);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtCodigo1KeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtCodigo1Exit(Sender: TObject);
begin
  VCLEditSair(edtCodigo1);
end;

{+------------------------------------------------------------------------------------------------+}
{| edtCodigo2                                                                                     |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente edtCodigo2.                                                  |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 05/Março/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtCodigo2Enter(Sender: TObject);
begin
  VCLEditEntrar(edtCodigo2);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtCodigo2KeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtCodigo2Exit(Sender: TObject);
begin
  VCLEditSair(edtCodigo2);
end;

{+------------------------------------------------------------------------------------------------+}
{| edtCodigo3                                                                                     |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente edtCodigo3.                                                  |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 05/Março/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtCodigo3Enter(Sender: TObject);
begin
  VCLEditEntrar(edtCodigo3);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtCodigo3KeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtCodigo3Exit(Sender: TObject);
begin
  VCLEditSair(edtCodigo3);
end;

{+------------------------------------------------------------------------------------------------+}
{| edtCodigo4                                                                                     |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente edtCodigo4.                                                  |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 05/Março/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtCodigo4Enter(Sender: TObject);
begin
  VCLEditEntrar(edtCodigo4);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtCodigo4KeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtCodigo4Exit(Sender: TObject);
begin
  VCLEditSair(edtCodigo4);
end;

{+------------------------------------------------------------------------------------------------+}
{| edtChaveID                                                                                     |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente edtChaveID.                                                  |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 05/Março/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtChaveIDEnter(Sender: TObject);
begin
  VCLEditEntrar(edtChaveID);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtChaveIDKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtChaveIDExit(Sender: TObject);
begin
  VCLEditSair(edtChaveID);
end;

{+------------------------------------------------------------------------------------------------+}
{| edtBaseID                                                                                      |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente edtBaseID.                                                   |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 05/Março/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtBaseIDEnter(Sender: TObject);
begin
  VCLEditEntrar(edtBaseID);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtBaseIDKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtBaseIDExit(Sender: TObject);
begin
  VCLEditSair(edtBaseID);
end;


{+------------------------------------------------------------------------------------------------+}
{| cbxSGBD                                                                                        |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente cbxSGBD.                                                     |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.cbxSGBDChange(Sender: TObject);
begin
  ComponentesControlarSGBD;
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.cbxSGBDEnter(Sender: TObject);
begin
  VCLComboBoxEntrar(cbxSGBD);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.cbxSGBDKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.cbxSGBDExit(Sender: TObject);
begin
  VCLComboBoxSair(cbxSGBD);
end;


{+------------------------------------------------------------------------------------------------+}
{| edtDriverEnter                                                                                 |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente edtDriver.                                                   |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtDriverEnter(Sender: TObject);
begin
  VCLEditEntrar(edtDriver);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtDriverKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtDriverExit(Sender: TObject);
begin
  VCLEditSair(edtDriver);
end;

{+------------------------------------------------------------------------------------------------+}
{| edtServidor                                                                                    |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente edtServidor.                                                 |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtServidorEnter(Sender: TObject);
begin
  VCLEditEntrar(edtServidor);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtServidorKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtServidorExit(Sender: TObject);
begin
  VCLEditSair(edtServidor);
end;

{+------------------------------------------------------------------------------------------------+}
{| edtPorta                                                                                       |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente edtPorta.                                                    |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtPortaEnter(Sender: TObject);
begin
  VCLEditEntrar(edtPorta);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtPortaKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtPortaExit(Sender: TObject);
begin
  VCLEditSair(EdtPorta);
end;

{+------------------------------------------------------------------------------------------------+}
{| edtInstancia                                                                                   |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente edtInstancia.                                                |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtInstanciaEnter(Sender: TObject);
begin
  VCLEditEntrar(edtInstancia);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtInstanciaKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtInstanciaExit(Sender: TObject);
begin
  VCLEditSair(edtInstancia);
end;

{+------------------------------------------------------------------------------------------------+}
{| edtUsuario                                                                                     |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente edtUsuario.                                                  |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtUsuarioEnter(Sender: TObject);
begin
  VCLEditEntrar(edtUsuario);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtUsuarioExit(Sender: TObject);
begin
  VCLEditSair(edtUsuario);
end;

{+------------------------------------------------------------------------------------------------+}
{| edtSenha                                                                                       |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente edtSenha.                                                    |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtSenhaEnter(Sender: TObject);
begin
  VCLEditEntrar(edtSenha);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtSenhaExit(Sender: TObject);
begin
  VCLEditSair(edtSenha);
end;

{+------------------------------------------------------------------------------------------------+}
{| edtBancoDados                                                                                  |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente edtBancoDados.                                               |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtBancoDadosEnter(Sender: TObject);
begin
  VCLEditEntrar(edtBancoDados);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtBancoDadosKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtBancoDadosExit(Sender: TObject);
begin
  VCLEditSair(EdtBancoDados);
end;

{+------------------------------------------------------------------------------------------------+}
{| edtTimeOut                                                                                     |}
{+------------------------------------------------------------------------------------------------+}
{| Eventos de controle do componente edtTimeOut.                                                  |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtTimeOutEnter(Sender: TObject);
begin
  VCLEditEntrar(edtTimeOut);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtTimeOutKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.edtTimeOutExit(Sender: TObject);
begin
  VCLEditSair(edtTimeOut);
end;

{+------------------------------------------------------------------------------------------------+}
{| btnNovoClick                                                                                   |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no botão btnNovo.                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.btnNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

{+------------------------------------------------------------------------------------------------+}
{| btnEditarClick                                                                                 |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no botão btnEditar.                                                            |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.bt(Sender: TObject);
begin
  FormularioEditar;
end;

{+------------------------------------------------------------------------------------------------+}
{| btnRemoverClick                                                                                |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no botão btnRemover.                                                           |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.btnRemoverClick(Sender: TObject);
begin
  FormularioRemover;
end;

{+------------------------------------------------------------------------------------------------+}
{| btnTestarClick                                                                                 |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no botão btnTestar.                                                            |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.btnTestarClick(Sender: TObject);
begin
  FormularioTestar;
end;

{+------------------------------------------------------------------------------------------------+}
{| btnConfirmarClick                                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no botão btnConfirmar.                                                         |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.btnConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

{+------------------------------------------------------------------------------------------------+}
{| btnCancelarClick                                                                               |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no botão btnCancelar.                                                          |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.btnCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

{+------------------------------------------------------------------------------------------------+}
{| btnAtualizarClick                                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no botão btnAtualizar.                                                         |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.btnAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

{+------------------------------------------------------------------------------------------------+}
{| btnGravarClick                                                                                 |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no botão btnGravar.                                                            |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

{+------------------------------------------------------------------------------------------------+}
{| btnSairClick                                                                                   |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de click no botão btnSair.                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.btnSairClick(Sender: TObject);
begin
  FormularioSair;
end;

////////////////////////////////////////////////////////////////////////////////////////////////////
// ÁREA DE PROCEDIMENTOS E FUNÇÕES                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////

{+------------------------------------------------------------------------------------------------+}
{| ComponentesControlar                                                                           |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.ComponentesControlar(argModo: Byte);
var
  locEditar: Boolean;
begin
  //
  // Determina se a tela ficará em modo de edição.
  //
  locEditar := False;

  if (argModo = VCL_MODO_NOVO) or (argModo = VCL_MODO_EDITAR) then
  begin
    locEditar := True;
  end;

  //
  // Controla o modo dos componentes.
  //
  VCLListViewControlar(lvwLista,      (not locEditar));
  VCLEditControlar    (edtTitulo,     locEditar);
  VCLComboBoxControlar(cbxModo,       locEditar);
  VCLEditControlar    (edtCodigo1,    locEditar);
  VCLEditControlar    (edtCodigo2,    locEditar);
  VCLEditControlar    (edtCodigo3,    locEditar);
  VCLEditControlar    (edtCodigo4,    locEditar);
  VCLEditControlar    (edtChaveID,    locEditar);
  VCLEditControlar    (edtBaseID,     locEditar);
  VCLComboBoxControlar(cbxSGBD,       locEditar);
  VCLEditControlar    (edtDriver,     locEditar);
  VCLEditControlar    (edtServidor,   locEditar);
  VCLEditControlar    (edtPorta,      locEditar);
  VCLEditControlar    (edtInstancia,  locEditar);
  VCLEditControlar    (edtUsuario,    locEditar);
  VCLEditControlar    (edtSenha,      locEditar);
  VCLEditControlar    (edtBancoDados, locEditar);
  VCLEditControlar    (edtTimeOut,    locEditar);

  //
  // Controla a exibição dos botões.
  //
  sbtListaLocalizar.Visible   := (lvwLista.Items.Count > 0);
  sbtListaSubirTodos.Visible  := (lvwLista.Items.Count > 0);
  sbtListaSubir.Visible       := (lvwLista.Items.Count > 0);
  sbtListaDescer.Visible      := (lvwLista.Items.Count > 0);
  sbtListaDescerTodos.Visible := (lvwLista.Items.Count > 0);
  
  btnNovo.Visible      := (not locEditar);
  btnEditar.Visible    := (not locEditar) and (lvwLista.Items.Count > 0);
  btnRemover.Visible   := (not locEditar) and (lvwLista.Items.Count > 0);
  btnTestar.Visible    := (lvwLista.Items.Count > 0);
  btnConfirmar.Visible := locEditar;
  btnCancelar.Visible  := locEditar;
  btnAtualizar.Visible := (not locEditar);
  btnGravar.Visible    := (not locEditar);
  btnSair.Visible      := (not locEditar);
end;

{+------------------------------------------------------------------------------------------------+}
{| ComponentesControlarSGBD                                                                       |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.ComponentesControlarSGBD;
var
  locSGBD: string;
begin
  //
  // Recupera o SGBD selecionado.
  //
  locSGBD := cbxSGBD.Text;

  //
  // Se SQL SERVER então não precisa de driver.
  //
  if locSGBD = SGBD_SQL_SERVER_TITULO then
  begin
    lblDriver.Visible := False;
    edtDriver.Visible := False;
  end;
  
  //
  // Se MySQL então precisa de driver.
  //
  if locSGBD = SGBD_MY_SQL_TITULO then
  begin
    lblDriver.Visible := True;
    edtDriver.Visible := True;
  end;
end;

{+------------------------------------------------------------------------------------------------+}
{| ComponentesLimpar                                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.ComponentesLimpar(argCompleto: Boolean = True);
begin
  if argCompleto then
  begin
    VCLListViewLimpar(lvwLista);
  end;

  VCLEditLimpar    (edtItem);
  VCLEditLimpar    (edtTitulo);
  VCLcomboBoxLimpar(cbxModo);
  VCLEditLimpar    (edtCodigo1);
  VCLEditLimpar    (edtCodigo2);
  VCLEditLimpar    (edtCodigo3);
  VCLEditLimpar    (edtCodigo4);
  VCLEditLimpar    (edtChaveID);
  VCLEditLimpar    (edtBaseID);
  VCLComboBoxLimpar(cbxSGBD);
  VCLEditLimpar    (edtDriver);
  VCLEditLimpar    (edtServidor);
  VCLEditLimpar    (edtPorta);
  VCLEditLimpar    (edtInstancia);
  VCLEditLimpar    (edtUsuario);
  VCLEditLimpar    (edtSenha);
  VCLEditLimpar    (edtBancoDados);
  VCLEditLimpar    (edtTimeOut);
end;

{+------------------------------------------------------------------------------------------------+}
{| ComponentesPopular                                                                             |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.ComponentesPopular(argIndice: Integer);
var  
  locIndice      : Integer;
  locModo        : string;
  locCodigo      : TStringList;
  locCodigo1     : string;
  locCodigo2     : string;
  locCodigo3     : string;
  locCodigo4     : string;
  locSGBD        : string;
  locCriptografia: TCriptografia;
  locSenha       : string;
begin
  //
  // Limpa os componentes de edição.
  //
  ComponentesLimpar(False);

  //
  // Carrega componentes com o item selecionado no listview.
  //
  try
    //
    // Determina o índice da lista correto para fazer a leitura das informações.
    //
    locIndice := argIndice;
    if (locIndice < 0) or (locIndice > (lvwLista.Items.Count - 1)) then Exit;

    //
    // Determina o modo.
    //
    locModo := ModoTituloConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_MODO]);

    //
    // Determina os códigos.
    //
    locCodigo := StringSeparar(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_CODIGO], '.');

    if locCodigo.Count = 4 then
    begin
      locCodigo1 := locCodigo[0];
      locCodigo2 := locCodigo[1];
      locCodigo3 := locCodigo[2];
      locCodigo4 := locCodigo[3];
    end;

    //
    // Determina o SGBD.
    //
    locSGBD := SGBDTituloConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_SGBD]);

    //
    // Descriptografa senha para colocar na caixa de texto.
    //
    locCriptografia := TCriptografia.Create;
    locSenha        := locCriptografia.Descriptografar(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_SENHA]);
    FreeAndNil(locCriptografia);
    
    //
    // Carrega caixas de texto com os conteúdos da lista.
    //
    edtItem.Text       := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_ITEM];
    edtTitulo.Text     := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_TITULO];
    VCLComboBoxPopular(cbxModo, locModo);
    edtCodigo1.Text    := locCodigo1;
    edtCodigo2.Text    := locCodigo2;
    edtCodigo3.Text    := locCodigo3;
    edtCodigo4.Text    := locCodigo4;
    edtChaveID.Text    := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_CHAVE_ID];
    edtBaseID.Text     := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_BASE_ID];
    VCLComboBoxPopular(cbxSGBD, locSGBD);
    edtDriver.Text     := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_DRIVER];
    edtServidor.Text   := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_SERVIDOR];
    edtPorta.Text      := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_PORTA];
    edtInstancia.Text  := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_INSTANCIA];
    edtUsuario.Text    := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_USUARIO];
    edtSenha.Text      := locSenha;
    edtBancoDados.Text := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_BANCO_DADOS];
    edtTimeOut.Text    := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_TIME_OUT];
  except
    Exit;
  end;

  //
  // Controlar componentes.
  //
  ComponentesControlarSGBD;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioLocalizar                                                                            |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.FormularioLocalizar;
var
  locFormulario : TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao;
  locClicouSair : Boolean;
  locItemInicial: Integer;
  locContador   : Integer;
begin
  //
  // Exibe formulário para exibir opções de localização.
  //
  locFormulario := TPlataformaERPPrincipalVCLAcessoConexaoConfiguracaoLocalizacao.Create(Self);

  locFormulario.pubLocalizarModo   := priLocalizarModo;
  locFormulario.pubLocalizarTitulo := priLocalizarTitulo;
  
  locFormulario.ShowModal;

  locClicouSair := locFormulario.pubClicouSair;

  if not locClicouSair then
  begin
    priLocalizarModo   := locFormulario.pubLocalizarModo;
    priLocalizarTitulo := locFormulario.pubLocalizarTitulo;
  end;
  
  locFormulario.Release;
  FreeAndNil(locFormulario);

  if locClicouSair then Exit;

  //
  // Inicia a localização.
  //
  locItemInicial := 0;

  if priLocalizarModo = VCL_LOCALIZAR_PROXIMO then
  begin
    locItemInicial := (VCLListViewIndiceItemRetornar(lvwLista) + 1);
    if locItemInicial > (lvwLista.Items.Count - 1) then locItemInicial := 0;    
  end;
    
  for locContador := locItemInicial to (lvwLista.Items.Count - 1) do
  begin
    //
    // String fonética foi encontrada?
    //
    if StringLocalizar(StringFoneticaDeterminar(lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_TITULO]), StringFoneticaDeterminar(priLocalizarTitulo)) then
    begin
      VCLListViewItemPosicionar(lvwLista, locContador);
      Exit;
    end;
  end;

  //
  // String fonética não foi encontrada.
  //
  VCLConsistenciaExibir('O título informado não foi localizado na lista!');
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioMovimentar                                                                           |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.FormularioMovimentar(argMovimento: Byte);
begin
  VCLListViewLinhaMover(lvwLista, argMovimento, LVW_COLUNA_ITEM);
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioNovo                                                                                 |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.FormularioNovo;
begin
  ComponentesLimpar(False);
  ComponentesControlar(VCL_MODO_EDITAR);
  edtItem.Text := IntegerStringConverter(lvwLista.Items.Count + 1);
  edtTitulo.SetFocus;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioEditar                                                                               |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.FormularioEditar;
begin
  ComponentesControlar(VCL_MODO_EDITAR);
  edtTitulo.SetFocus;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioRemover                                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.FormularioRemover;
var
  locIndice: Integer;
begin
  //
  // Determina se um índice da lista foi selecinado.
  //
  locIndice := VCLListViewIndiceItemRetornar(lvwLista);

  if locIndice = VCL_NENHUM_INDICE then
  begin
    VCLListViewFocar(lvwLista);
    Exit;
  end;

  //
  // Confirma remoção.
  //
  if not VCLQuestionamentoExibir('Deseja realmente remover a linha "' + lvwLista.Selected.SubItems.Strings[LVW_COLUNA_TITULO] + '"?') then
  begin
    VCLListViewFocar(lvwLista);
    Exit;
  end;

  //
  // Remove linha da lista.
  //
  VCLListViewItemRemover(lvwLista, locIndice, LVW_COLUNA_ITEM);

  //
  // Controlar componentes.
  //
  ComponentesControlar(VCL_MODO_VISUALIZAR);

  //
  // Garante atualização dos dados de edição.
  //
  ComponentesPopular(locIndice - 1);
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioTestar                                                                               |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.FormularioTestar;
var
  locConexao   : TConexao;
  locFormulario: TPlataformaERPPrincipalVCLConexaoTeste;
begin
  //
  // Carrega informações sobre a conexão.
  //
  locConexao.Item       := StringIntegerConverter(edtItem.Text);
  locConexao.Titulo     := edtTitulo.Text;
  locConexao.SGBD       := TituloSGBDConverter(cbxSGBD.Text);
  locConexao.Driver     := edtDriver.Text;
  locConexao.Servidor   := edtServidor.Text;
  locConexao.Porta      := StringIntegerConverter(edtPorta.Text);
  locConexao.Instancia  := edtInstancia.Text;
  locConexao.Usuario    := edtUsuario.Text;
  locConexao.Senha      := edtSenha.Text;
  locConexao.BancoDados := edtBancoDados.Text;
  locConexao.TimeOut    := StringIntegerConverter(edtTimeOut.Text);

  //
  // Exibe formulário de teste de conexão.
  //
  locFormulario            := TPlataformaERPPrincipalVCLConexaoTeste.Create(Self);
  locFormulario.pubConexao := locConexao;
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioConfirmar                                                                            |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.FormularioConfirmar;
var
  locIndice      : Integer;
  locListItem    : TListItem;
  locModo        : string;
  locCodigo      : string;
  locSGBD        : string;  
  locCriptografia: TCriptografia;
  locSenha       : string;
begin
  //
  // Determiona o modo de acesso..
  //
  locModo := TituloModoConverter(cbxModo.Text);

  //
  // Determina o código da chave de acesso.
  //
  locCodigo := edtCodigo1.Text + '.' + edtCodigo2.Text + '.' + edtCodigo3.Text + '.' + edtCodigo4.Text;

  //
  // Determina o SGBD.
  //
  locSGBD := TituloSGBDConverter(cbxSGBD.Text);

  //
  // Determina a senha criptografada.
  //
  locCriptografia := TCriptografia.Create;
  locSenha        := locCriptografia.Criptografar(edtSenha.Text);
  FreeAndNil(locCriptografia);

  //
  // Pelo sequencial do item determina se um novo ou uma alteração.
  //
  if StringIntegerConverter(edtItem.Text) > lvwLista.Items.Count then
  begin
    //
    // Determina o índice do listview.
    //
    locIndice := StringIntegerConverter(edtItem.Text);

    //
    // Insere nova linha na lista.
    //
    locListItem := lvwLista.Items.Add;
    locListItem.Caption := '';
    locListItem.SubItems.Add(edtItem.Text);
    locListItem.SubItems.Add(edtTitulo.Text);
    locListItem.SubItems.Add(locModo);
    locListItem.SubItems.Add(locCodigo);
    locListItem.SubItems.Add(edtChaveID.Text);
    locListItem.SubItems.Add(edtBaseID.Text);
    locListItem.SubItems.Add(locSGBD);
    locListItem.SubItems.Add(edtDriver.Text);
    locListItem.SubItems.Add(edtServidor.Text);        
    locListItem.SubItems.Add(edtPorta.Text);    
    locListItem.SubItems.Add(edtInstancia.Text);
    locListItem.SubItems.Add(edtUsuario.Text);
    locListItem.SubItems.Add(locSenha);
    locListItem.SubItems.Add(edtBancoDados.Text);
    locListItem.SubItems.Add(edtTimeOut.Text);
  end
  else
  begin
    //
    // Determina o índice do listview.
    //
    locIndice := StringIntegerConverter(edtItem.Text) - 1;

    //
    // Atualiza informações na lista.
    //
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_ITEM]        := edtItem.Text;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_TITULO]      := edtTitulo.Text;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_MODO]        := locModo;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_CODIGO]      := locCodigo;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_CHAVE_ID]    := edtChaveID.Text;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_BASE_ID]     := edtBaseID.Text;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_SGBD]        := locSGBD;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_DRIVER]      := edtDriver.Text;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_SERVIDOR]    := edtServidor.Text;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_PORTA]       := edtPorta.Text;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_INSTANCIA]   := edtInstancia.Text;    
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_USUARIO]     := edtUsuario.Text;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_SENHA]       := locSenha;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_BANCO_DADOS] := edtBancoDados.Text;    
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_TIME_OUT]    := edtTimeOut.Text;    
  end;

  //
  // Controla componentes do formulário.
  //  
  ComponentesControlar(VCL_MODO_VISUALIZAR);

  //
  // Foco no listview.
  //
  VCLListViewItemPosicionar(lvwLista, locIndice);
  VCLListViewFocar(lvwLista);
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioCancelar                                                                             |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.FormularioCancelar;
var
  locIndice: Integer;
begin
  //
  // Confirma com o usuário.
  //
  if not VCLQuestionamentoExibir('Deseja realmente cancelar a edição destes dados?') then Exit;

  //
  // Determina o índice.
  //
  locIndice := StringIntegerConverter(edtItem.Text) - 1;
  if locIndice > (lvwLista.Items.Count - 1) then locIndice := (lvwLista.Items.Count - 1);  
  
  //
  // Muda modo de edição e recarrega dados dos componentes.
  //  
  ComponentesControlar(VCL_MODO_VISUALIZAR);
  VCLListViewItemPosicionar(lvwLista, locIndice);
  ComponentesPopular(locIndice);
  VCLListViewFocar(lvwLista);
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioAtualizar                                                                            |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.FormularioAtualizar(argSolicitarConfirmacao: Boolean = True);
var
  locListaConexoes: TListaConexoes;
  locContador     : Integer;
  locListItem     : TListItem;
begin
  //
  // Confirma execução com o usuário.
  //
  if argSolicitarConfirmacao then
  begin
    if not VCLQuestionamentoExibir('Deseja realmente atualizar e recarregar os dados da lista?') then Exit;
  end;

  //
  // Troca o cursor.
  //
  VCLCursorTrocar(True);

  //
  // Limpa componentes.
  //
  ComponentesLimpar(True);

  //
  // Carrega lista de conexoes configuradas.
  //
  try
    locListaConexoes := ListaConexoesLocaisCarregar;
  except
    on locErro: Exception do
    begin
      VCLCursorTrocar;
      VCLErroExibir('Ocorreu algum erro ao carregar os dados da lista!',
                    locErro.Message);
      Exit;
    end;
  end;

  //
  // Carrega listview com a lista de conexões.
  //
  if locListaConexoes <> nil then
  begin
    for locContador := 0 to (Length(locListaConexoes) - 1) do
    begin       
      //
      // Insere linha no listview.
      //
      locListItem         := lvwLista.Items.Add;
      locListItem.Caption := '';
      locListItem.SubItems.Add(IntegerStringConverter(locListaConexoes[locContador].Item));
      locListItem.SubItems.Add(locListaConexoes[locContador].Titulo);
      locListItem.SubItems.Add(locListaConexoes[locContador].Modo);
      locListItem.SubItems.Add(locListaConexoes[locContador].ChaveCodigo);
      locListItem.SubItems.Add(IntegerStringConverter(locListaConexoes[locContador].ChaveID));
      locListItem.SubItems.Add(IntegerStringConverter(locListaConexoes[locContador].BaseID));
      locListItem.SubItems.Add(locListaConexoes[locContador].SGBD);
      locListItem.SubItems.Add(locListaConexoes[locContador].Driver);
      locListItem.SubItems.Add(locListaConexoes[locContador].Servidor);
      locListItem.SubItems.Add(IntegerStringConverter(locListaConexoes[locContador].Porta));
      locListItem.SubItems.Add(locListaConexoes[locContador].Instancia);
      locListItem.SubItems.Add(locListaConexoes[locContador].Usuario);
      locListItem.SubItems.Add(locListaConexoes[locContador].Senha);
      locListItem.SubItems.Add(locListaConexoes[locContador].BancoDados);
      locListItem.SubItems.Add(IntegerStringConverter(locListaConexoes[locContador].TimeOut));
    end;
  end;

  //
  // Atualiza a quantidade de itens da lista.
  //
  VCLLabelQtdeLinhasExibir(lblQtdeLinhas, lvwLista);

  //
  // Troca o cursor.
  //
  VCLCursorTrocar;

  //
  // Controlar os componentes.
  //
  ComponentesControlar(VCL_MODO_VISUALIZAR);

  //
  // Foco no listview.
  //
  VCLListViewItemPosicionar(lvwLista, 0);
  VCLListViewFocar(lvwLista);
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioGravar                                                                               |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.FormularioGravar;
var
  locContador     : Integer;
  locIndice       : Integer;
  locListaConexoes: TListaConexoes;
begin
  //
  // Confirma gravação.
  //
  if not VCLQuestionamentoExibir('Deseja realmente gravar?') then Exit;

  //
  // Monta lista de conexões.
  //
  locListaConexoes := nil;

  for locContador := 0 to (lvwLista.Items.Count - 1) do
  begin
    //
    // Insere nova linha no array.
    //
    SetLength(locListaConexoes, Length(locListaConexoes) + 1);

    //
    // Determina o índice da nova linha do array.
    //
    locIndice := Length(locListaConexoes) - 1;

    //
    // Insere dados no array.
    //
    locListaConexoes[locIndice].Item        := StringIntegerConverter(lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_ITEM]);
    locListaConexoes[locIndice].Titulo      := lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_TITULO];
    locListaConexoes[locIndice].Modo        := lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_MODO];
    locListaConexoes[locIndice].ChaveCodigo := lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_CODIGO];
    locListaConexoes[locIndice].ChaveID     := StringIntegerConverter(lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_CHAVE_ID]);
    locListaConexoes[locIndice].BaseID      := StringIntegerConverter(lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_BASE_ID]);
    locListaConexoes[locIndice].SGBD        := lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_SGBD];
    locListaConexoes[locIndice].Driver      := lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_DRIVER];
    locListaConexoes[locIndice].Servidor    := lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_SERVIDOR];
    locListaConexoes[locIndice].Porta       := StringIntegerConverter(lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_PORTA]);
    locListaConexoes[locIndice].Instancia   := lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_INSTANCIA];
    locListaConexoes[locIndice].Usuario     := lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_USUARIO];
    locListaConexoes[locIndice].Senha       := lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_SENHA];
    locListaConexoes[locIndice].BancoDados  := lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_BANCO_DADOS];
    locListaConexoes[locIndice].TimeOut     := StringIntegerConverter(lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_TIME_OUT]);
  end;

  //
  // Grava informações.
  //
  try
    ListaConexoesLocaisGravar(locListaConexoes);
  except
    on locErro: Exception do
    begin
      VCLErroExibir('Impossível gravar dados sobre as configurações de conexões de acesso à aplicação!', locErro.Message);
      Exit;
    end;
  end;

  //
  // Fecha formulário.
  //
  pubClicouSair := False;  
  Close;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormularioSair                                                                                 |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.FormularioSair;
begin
  //
  // Confirma saída com o usuário.
  //
  if not VCLQuestionamentoExibir('Deseja realmente sair sem gravar?') then Exit;

  //
  // Fecha o formulário.
  //
  Close;
end;

{+------------------------------------------------------------------------------------------------+}
{| ModoTituloConverter                                                                            |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
function TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.ModoTituloConverter(argModo: string): string;
begin
  Result := '';
  if argModo = MODO_ACESSO_CLOUD   then Result := MODO_ACESSO_CLOUD_TITULO;
  if argModo = MODO_ACESSO_PRIVADO then Result := MODO_ACESSO_PRIVADO_TITULO;
end;

{+------------------------------------------------------------------------------------------------+}
{| TituloModoConverter                                                                            |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
function TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.TituloModoConverter(argModo: string): string;
begin
  Result := '';
  if argModo = MODO_ACESSO_CLOUD_TITULO   then Result := MODO_ACESSO_CLOUD;
  if argModo = MODO_ACESSO_PRIVADO_TITULO then Result := MODO_ACESSO_PRIVADO;
end;

{+------------------------------------------------------------------------------------------------+}
{| SGBDTituloConverter                                                                            |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
function TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.SGBDTituloConverter(argSGBD: string): string;
begin
  Result := '';
  if argSGBD = SGBD_SQL_SERVER then Result := SGBD_SQL_SERVER_TITULO;
  if argSGBD = SGBD_MY_SQL     then Result := SGBD_MY_SQL_TITULO;
end;

{+------------------------------------------------------------------------------------------------+}
{| TituloSGBDConverter                                                                            |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
function TPlataformaERPPrincipalVCLAcessoConexaoConfiguracao.TituloSGBDConverter(argSGBD: string): string;
begin
  Result := '';
  if argSGBD = SGBD_SQL_SERVER_TITULO then Result := SGBD_SQL_SERVER;
  if argSGBD = SGBD_MY_SQL_TITULO     then Result := SGBD_MY_SQL;
end;

end.
