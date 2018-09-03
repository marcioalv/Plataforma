

unit Plataforma_ERP_VCL_AcessoConexaoConfiguracao;

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
  Vcl.Buttons,
  Vcl.Menus,
  Vcl.Imaging.pngimage;

type
  TPlataformaERPVCLAcessoConexaoConfiguracao = class(TForm)
    panFormulario: TPanel;
    lblitem: TLabel;
    lblTitulo: TLabel;
    lblServidor: TLabel;
    lblPorta: TLabel;
    lblInstancia: TLabel;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    lblBancoDados: TLabel;
    lblTimeOut: TLabel;
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
    mnuFormulario: TMainMenu;
    mniAtualizar: TMenuItem;
    btnFechar: TBitBtn;
    mniFechar: TMenuItem;
    btnMinimizar: TBitBtn;
    btnGravar: TBitBtn;
    imgTodosSubir: TImage;
    imgTodosDescer: TImage;
    imgSubir: TImage;
    imgDescer: TImage;
    imgAdicionar: TImage;
    imgEditar: TImage;
    imgRemover: TImage;
    imgFormulario: TImage;
    imgConfirmar: TImage;
    imgCancelar: TImage;
    btnTestar: TBitBtn;
    mniMinimizar: TMenuItem;
    mniGravar: TMenuItem;
    mniTestar: TMenuItem;
    imgBackground: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtTituloEnter(Sender: TObject);
    procedure edtTituloExit(Sender: TObject);
    procedure edtTituloKeyPress(Sender: TObject; var Key: Char);
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
    procedure mniAtualizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
    procedure mniGravarClick(Sender: TObject);
    procedure mniTestarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure imgAdicionarClick(Sender: TObject);
    procedure imgConfirmarClick(Sender: TObject);
    procedure imgCancelarClick(Sender: TObject);
    procedure lvwListaChange(Sender: TObject; Item: TListItem; Change: TItemChange);
    procedure imgEditarClick(Sender: TObject);
    procedure imgRemoverClick(Sender: TObject);
    procedure imgTodosSubirClick(Sender: TObject);
    procedure imgSubirClick(Sender: TObject);
    procedure imgDescerClick(Sender: TObject);
    procedure imgTodosDescerClick(Sender: TObject);
  private
    procedure FormularioLimpar(argCompleto: Boolean);
    procedure FormularioControlar(argEdicao: Boolean);
    procedure FormularioAtualizar(argSolicitarConfirmacao: Boolean = True);
    procedure FormularioAdicionar;
    procedure FormularioEditar;
    procedure FormularioRemover;
    procedure FormularioConfirmar;
    procedure FormularioCancelar;
    procedure FormularioItemSelecionar;

//    procedure FormularioMovimentar(argMovimento: Byte);

//    procedure FormularioTestar;    

//    procedure FormularioGravar;
  public
    pubClicouSair: Boolean;
  end;

var
  PlataformaERPVCLAcessoConexaoConfiguracao: TPlataformaERPVCLAcessoConexaoConfiguracao;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_Framework_Criptografia,
  Plataforma_Framework_ArquivoIni,
  Plataforma_ERP_VCL_Generico,
  Plataforma_ERP_Inicializacao;  

//  Plataforma_Framework_Conexao,
//  Plataforma_ERP_Principal_Unit_ArquivoInicializacao,
//  Plataforma_ERP_VCL_AcessoConexaoConfiguracaoLocalizacao,
//  Plataforma_ERP_Principal_VCL_ConexaoTeste,

const
  LVW_COLUNA_ITEM       : Integer = 0;
  LVW_COLUNA_TITULO     : Integer = 1;
  LVW_COLUNA_SERVIDOR   : Integer = 2;
  LVW_COLUNA_PORTA      : Integer = 3;
  LVW_COLUNA_INSTANCIA  : Integer = 4;
  LVW_COLUNA_USUARIO    : Integer = 5;
  LVW_COLUNA_SENHA      : Integer = 6;
  LVW_COLUNA_BANCO_DADOS: Integer = 7;
  LVW_COLUNA_TIME_OUT   : Integer = 8;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas.
  //
  pubClicouSair := True;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormShow(Sender: TObject);
begin
  //
  // Background do formulário.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);
  
  //
  // Limpa os componentes do formulário.
  //
  FormularioLimpar(True);

  //
  // Controlar os componentes do formulário.
  //
  FormularioControlar(False);

  //
  // Carrega lista.
  //
  FormularioAtualizar(False);
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nos itens do menu.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.mniTestarClick(Sender: TObject);
begin
  Exit;
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.mniAtualizarClick(Sender: TObject);
begin
  Exit;
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.mniGravarClick(Sender: TObject);
begin
  Exit;
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "lista".
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.lvwListaChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
  FormularioItemSelecionar;
end;

//
// Eventos de click nos botões de ações com a lista.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.imgAdicionarClick(Sender: TObject);
begin
  FormularioAdicionar;
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.imgEditarClick(Sender: TObject);
begin
  FormularioEditar;
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.imgRemoverClick(Sender: TObject);
begin
  FormularioRemover;
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.imgConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.imgCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.imgTodosSubirClick(Sender: TObject);
begin
  VCLListViewLinhaMover(lvwLista, VCL_MOVIMENTO_SUBIR_TODOS);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.imgSubirClick(Sender: TObject);
begin
  VCLListViewLinhaMover(lvwLista, VCL_MOVIMENTO_SUBIR);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.imgDescerClick(Sender: TObject);
begin
  VCLListViewLinhaMover(lvwLista, VCL_MOVIMENTO_DESCER)
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.imgTodosDescerClick(Sender: TObject);
begin
  VCLListViewLinhaMover(lvwLista, VCL_MOVIMENTO_DESCER_TODOS)
end;

//
// Eventos do componente "título".
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtTituloEnter(Sender: TObject);
begin
  VCLEditEntrar(edtTitulo);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtTituloKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtTituloExit(Sender: TObject);
begin
  VCLEditSair(edtTitulo);
end;

//
// Eventos do componente "servidor".
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtServidorEnter(Sender: TObject);
begin
  VCLEditEntrar(edtServidor);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtServidorKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtServidorExit(Sender: TObject);
begin
  VCLEditSair(edtServidor);
end;

//
// Eventos do componente "porta".
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtPortaEnter(Sender: TObject);
begin
  VCLEditEntrar(edtPorta);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtPortaKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtPortaExit(Sender: TObject);
begin
  VCLEditSair(EdtPorta);
end;

//
// Eventos do componente "instância".
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtInstanciaEnter(Sender: TObject);
begin
  VCLEditEntrar(edtInstancia);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtInstanciaKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtInstanciaExit(Sender: TObject);
begin
  VCLEditSair(edtInstancia);
end;

//
// Eventos do componente "usuário".
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtUsuarioEnter(Sender: TObject);
begin
  VCLEditEntrar(edtUsuario);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtUsuarioExit(Sender: TObject);
begin
  VCLEditSair(edtUsuario);
end;

//
// Eventos do componente "senha".
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtSenhaEnter(Sender: TObject);
begin
  VCLEditEntrar(edtSenha);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtSenhaExit(Sender: TObject);
begin
  VCLEditSair(edtSenha);
end;

//
// Eventos do componente "banco dados".
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtBancoDadosEnter(Sender: TObject);
begin
  VCLEditEntrar(edtBancoDados);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtBancoDadosKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtBancoDadosExit(Sender: TObject);
begin
  VCLEditSair(EdtBancoDados);
end;

//
// Eventos do componente "time-out".
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtTimeOutEnter(Sender: TObject);
begin
  VCLEditEntrar(edtTimeOut);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtTimeOutKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.edtTimeOutExit(Sender: TObject);
begin
  VCLEditSair(edtTimeOut);
end;

//
// Evento de click no botão "gravar".
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.btnGravarClick(Sender: TObject);
begin
  Exit;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar; 
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormularioLimpar(argCompleto: Boolean);
begin
  if argCompleto then
  begin
    VCLListViewLimpar(lvwLista);
  end;
  
  VCLEditLimpar(edtItem);
  VCLEditLimpar(edtTitulo);
  VCLEditLimpar(edtServidor);
  VCLEditLimpar(edtPorta);
  VCLEditLimpar(edtInstancia);
  VCLEditLimpar(edtUsuario);
  VCLEditLimpar(edtSenha);
  VCLEditLimpar(edtBancoDados);
  VCLEditLimpar(edtTimeOut);
end;

//
// Procedimento para controlar a exibição dos componentes do formulário.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormularioControlar(argEdicao: Boolean);
var
  locDadosPopulados: Boolean;
begin
  //
  // Existem dados populados no formulário.
  //
  locDadosPopulados := (lvwLista.Items.Count > 0);

  //
  // Controla se os componentes estarão em modo de edição ou não.
  //
  lvwLista.Enabled := (not argEdicao);

  VCLEditControlar(edtTitulo,     argEdicao);
  VCLEditControlar(edtServidor,   argEdicao);
  VCLEditControlar(edtPorta,      argEdicao);
  VCLEditControlar(edtInstancia,  argEdicao);
  VCLEditControlar(edtUsuario,    argEdicao);
  VCLEditControlar(edtSenha,      argEdicao);
  VCLEditControlar(edtBancoDados, argEdicao);
  VCLEditControlar(edtTimeOut,    argEdicao);

  //
  // Itens do menu.
  //
  mniTestar.Visible    := locDadosPopulados;
  mniAtualizar.Visible := True;
  mniGravar.Visible    := (not argEdicao) and locDadosPopulados;
  mniMinimizar.Visible := True;
  mniFechar.Visible    := True;

  //
  // Botões do panel principal.
  //
  imgTodosSubir.Visible  := (not argEdicao) and locDadosPopulados;
  imgSubir.Visible       := (not argEdicao) and locDadosPopulados;
  imgDescer.Visible      := (not argEdicao) and locDadosPopulados;
  imgTodosDescer.Visible := (not argEdicao) and locDadosPopulados;

  imgAdicionar.Visible := (not argEdicao);
  imgEditar.Visible    := (not argEdicao) and locDadosPopulados;
  imgRemover.Visible   := (not argEdicao) and locDadosPopulados;

  imgConfirmar.Visible := argEdicao;
  imgCancelar.Visible  := argEdicao;
  
  //
  // Botões do formulário.
  //
  btnTestar.Visible    := mniTestar.Visible;
  btnGravar.Visible    := mniGravar.Visible;
  btnMinimizar.Visible := mniMinimizar.Visible;
  btnFechar.Visible    := mniFechar.Visible;
end;

//
// Procedimento para configurar uma nova conexão com o banco de dados.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormularioAdicionar;
begin
  FormularioLimpar(False);
  FormularioControlar(True);
  edtItem.Text := IntegerStringConverter(lvwLista.Items.Count + 1);
  edtTitulo.SetFocus;
end;

//
// Procedimento para remover da lista uma das conexões ao banco de dados.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormularioRemover;
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
  FormularioControlar(False);

  //
  // Garante atualização dos dados de edição.
  //
  VCLListViewFocar(lvwLista);
end;

// Procedimento para editar os dados de uma conexão com o banco de dados.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormularioEditar;
begin
  FormularioControlar(True);
  edtTitulo.SetFocus;
end;

//
// Procedimento para confirmar os dados da configuração da conexão ao banco de dados.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormularioConfirmar;
var
  locIndice            : Integer;
  locListItem          : TListItem;
  locCriptografia      : TCriptografia;
  locSenhaCriptografada: string;
begin
  //
  // Determina a senha criptografada.
  //
  locCriptografia       := TCriptografia.Create;
  locSenhaCriptografada := locCriptografia.Criptografar(edtSenha.Text);
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
    locListItem.SubItems.Add(edtServidor.Text);        
    locListItem.SubItems.Add(edtPorta.Text);    
    locListItem.SubItems.Add(edtInstancia.Text);
    locListItem.SubItems.Add(edtUsuario.Text);
    locListItem.SubItems.Add(locSenhaCriptografada);
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
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_SERVIDOR]    := edtServidor.Text;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_PORTA]       := edtPorta.Text;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_INSTANCIA]   := edtInstancia.Text;    
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_USUARIO]     := edtUsuario.Text;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_SENHA]       := locSenhaCriptografada;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_BANCO_DADOS] := edtBancoDados.Text;    
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_TIME_OUT]    := edtTimeOut.Text;    
  end;

  //
  // Controla componentes do formulário.
  //  
  FormularioControlar(False);

  //
  // Foco no listview.
  //
  VCLListViewItemPosicionar(lvwLista, locIndice);
  VCLListViewFocar(lvwLista);
end;

//
// Procedimento para cancelar a edição dos dados da conexão ao banco de dados.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormularioCancelar;
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
  FormularioControlar(False);
  VCLListViewItemPosicionar(lvwLista, locIndice);
  VCLListViewFocar(lvwLista);
end;

//
// Procedimento para carregar os componentes com o item selecionada da lista.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormularioItemSelecionar;
var  
  locIndice            : Integer;
  locItem              : Integer;
  locTitulo            : string;
  locServidor          : string;
  locPorta             : Integer;
  locInstancia         : string;
  locUsuario           : string;
  locSenha             : string;
  locBancoDados        : string;
  locTimeOut           : Integer;
  locCriptografia      : TCriptografia;
  locSenhaCriptografada: string;
begin
  //
  // Limpa os componentes de edição.
  //
  FormularioLimpar(False);

  //
  // Nenhum item selecionado.
  //
  if lvwLista.Selected = nil then Exit;

  //
  // Carrega componentes com o item selecionado no listview.
  //
  try
    //
    // Determina o índice da lista correto para fazer a leitura das informações.
    //
    locIndice := lvwLista.Selected.Index;
    if (locIndice < 0) or (locIndice > (lvwLista.Items.Count - 1)) then Exit;

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
end;

//
// Procedimento para atualizar os dados do formulário.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormularioAtualizar(argSolicitarConfirmacao: Boolean = True);
var
  locSessao    : string;
  locQuantidade: Integer;
  locContador  : Integer;
  locListItem  : TListItem;
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
  FormularioLimpar(True);

  //
  // Verifica se o arquivo de configuração existe na pasta adequada.
  //
  if not PathArquivoExisteDeterminar(gloPathArquivoConfiguracao) then Exit;

  //
  // Lê a quantidade de conexões existente no arquivo de configuração.
  //
  try
    locQuantidade := ArquivoIniIntegerRecuperar(gloPathArquivoConfiguracao, ARQUIVO_INI_CONEXAO_GERAL, ARQUIVI_INI_CONEXAO_GERAL_QUANTIDADE);
  except
    on locErro: Exception do
    begin
      raise Exception.Create(locErro.Message);
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
    locSessao := ARQUIVO_INI_CONEXAO_SESSAO + '_' + StringPreencher(IntegerStringConverter(locContador + 1), 4, '0', ESQUERDA);

    //
    // Carrega os dados da conexão.
    //
    ConexaoLimpar(locConexao);
    locConexao.Item        := ArquivoIniIntegerRecuperar(gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_ITEM);
    locConexao.Titulo      := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_TITULO);
    locConexao.Modo        := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_MODO);
    locConexao.ChaveCodigo := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_CHAVE_CODIGO);
    locConexao.ChaveID     := ArquivoIniIntegerRecuperar(gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_CHAVE_ID);
    locConexao.BaseID      := ArquivoIniIntegerRecuperar(gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_BASE_ID);
    locConexao.SGBD        := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_SGBD);
    locConexao.Driver      := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_DRIVER);
    locConexao.Servidor    := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_SERVIDOR);
    locConexao.Porta       := ArquivoIniIntegerRecuperar(gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_PORTA);
    locConexao.Instancia   := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_INSTANCIA);
    locConexao.Usuario     := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_USUARIO);
    locConexao.Senha       := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_SENHA);
    locConexao.BancoDados  := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_BANCO_DADOS);
    locConexao.TimeOut     := ArquivoIniIntegerRecuperar(gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_TIME_OUT);

    //
    // Consiste filtros.
    //
    if argItemInicial > 0 then
    begin
      if locConexao.Item < argItemInicial then Continue;
    end;

    if argItemFinal > 0 then
    begin
      if locConexao.Item > argItemFinal then Continue;
    end;

    if argTitulo <> '' then
    begin
      if not StringLocalizar(StringFoneticaDeterminar(locConexao.Titulo), StringFoneticaDeterminar(argTitulo)) then Continue;
    end;

    //
    // Determina o índice do array depois que uma nova linha for inserida.
    //
    locIndice := Length(Result);

    //
    // Insere uma nova linha no registro.
    //
    SetLength(Result, locIndice + 1);

    //
    // Popula os campos do registro dessa nova linha do array.
    //
    Result[locIndice] := locConexao;
  end;  

  //
  // Troca o cursor.
  //
  VCLCursorTrocar;  

  //
  // Controlar os componentes.
  //
  FormularioControlar(False);

  //
  // Foco no listview.
  //
  VCLListViewItemPosicionar(lvwLista, 0);
  VCLListViewFocar(lvwLista);
end;

{
//
// Procedimento para gravar as configurações de acesso ao banco de dados.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormularioGravar;
var
  locContador: Integer;
  locIndice  : Integer;
begin
  //
  // Confirma gravação.
  //
  if not VCLQuestionamentoExibir('Deseja realmente gravar?') then Exit;

  //
  // Monta lista de conexões.
  //
  for locContador := 0 to (lvwLista.Items.Count - 1) do
  begin
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
}
end.
