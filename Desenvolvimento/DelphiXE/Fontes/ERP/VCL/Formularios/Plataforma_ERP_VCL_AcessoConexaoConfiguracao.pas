

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
    btnTestar: TBitBtn;
    mniMinimizar: TMenuItem;
    mniGravar: TMenuItem;
    mniTestar: TMenuItem;
    imgBackground: TImage;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
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
    procedure btnTestarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

    procedure FormularioItemAtualizar(argItem      : Integer;
                                      argTitulo    : string;
                                      argServidor  : string;
                                      argPorta     : Integer;
                                      argInstancia : string;
                                      argUsuario   : string;
                                      argSenha     : string;
                                      argBancoDados: string;
                                      argTimeOut   : Integer);

    procedure FormularioGravar;
    procedure FormularioTestar;
  public
    pubDadosAtualizados: Boolean;
    pubClicouSair      : Boolean;
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
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico,
  Plataforma_ERP_Inicializacao;

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
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if pubDadosAtualizados then
  begin
    if not VCLQuestionamentoExibir('Deseja realmente sair sem gravar os dados?') then Action := caNone;
  end;
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas.
  //
  pubDadosAtualizados := False;
  pubClicouSair       := True;
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormShow(Sender: TObject);
begin
  //
  // Background do formul�rio.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);
  
  //
  // Limpa os componentes do formul�rio.
  //
  FormularioLimpar(True);

  //
  // Controlar os componentes do formul�rio.
  //
  FormularioControlar(False);

  //
  // Carrega lista.
  //
  FormularioAtualizar(False);
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then
  begin
    if edtTitulo.ReadOnly then Close;
  end;
end;

//
// Eventos de click nos itens do menu.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.mniTestarClick(Sender: TObject);
begin
  FormularioTestar;
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
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

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

//
// Eventos de click nos bot�es de a��es com a lista.
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
  VCLListViewLinhaMover(lvwLista, VCL_MOVIMENTO_SUBIR_TODOS, LVW_COLUNA_ITEM);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.imgSubirClick(Sender: TObject);
begin
  VCLListViewLinhaMover(lvwLista, VCL_MOVIMENTO_SUBIR, LVW_COLUNA_ITEM);
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.imgDescerClick(Sender: TObject);
begin
  VCLListViewLinhaMover(lvwLista, VCL_MOVIMENTO_DESCER, LVW_COLUNA_ITEM)
end;

procedure TPlataformaERPVCLAcessoConexaoConfiguracao.imgTodosDescerClick(Sender: TObject);
begin
  VCLListViewLinhaMover(lvwLista, VCL_MOVIMENTO_DESCER_TODOS, LVW_COLUNA_ITEM)
end;

//
// Eventos do componente "t�tulo".
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
// Eventos do componente "inst�ncia".
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
// Eventos do componente "usu�rio".
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
// Evento de click no bot�o "confirmar".
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.btnConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

//
// Evento de click no bot�o "cancelar".
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.btnCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

//
// Evento de click no bot�o "testar".
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.btnTestarClick(Sender: TObject);
begin
  FormularioTestar;
end;

//
// Evento de click no bot�o "gravar".
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no bot�o "minimizar".
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar; 
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formul�rio.
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
// Procedimento para controlar a exibi��o dos componentes do formul�rio.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormularioControlar(argEdicao: Boolean);
var
  locDadosPopulados: Boolean;
begin
  //
  // Existem dados populados no formul�rio.
  //
  locDadosPopulados := (lvwLista.Items.Count > 0);

  //
  // Controla se os componentes estar�o em modo de edi��o ou n�o.
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
  mniAtualizar.Visible := (not argEdicao);
  mniGravar.Visible    := (not argEdicao) and locDadosPopulados;
  mniMinimizar.Visible := True;
  mniFechar.Visible    := (not argEdicao);

  //
  // Bot�es do panel principal.
  //
  imgTodosSubir.Visible  := (not argEdicao) and locDadosPopulados;
  imgSubir.Visible       := (not argEdicao) and locDadosPopulados;
  imgDescer.Visible      := (not argEdicao) and locDadosPopulados;
  imgTodosDescer.Visible := (not argEdicao) and locDadosPopulados;

  imgAdicionar.Visible := (not argEdicao);
  imgEditar.Visible    := (not argEdicao) and locDadosPopulados;
  imgRemover.Visible   := (not argEdicao) and locDadosPopulados;

  btnConfirmar.Visible := argEdicao;
  btnCancelar.Visible  := argEdicao;
  
  //
  // Bot�es do formul�rio.
  //
  btnTestar.Visible    := mniTestar.Visible;
  btnGravar.Visible    := mniGravar.Visible;
  btnMinimizar.Visible := mniMinimizar.Visible;
  btnFechar.Visible    := mniFechar.Visible;
end;

//
// Procedimento para configurar uma nova conex�o com o banco de dados.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormularioAdicionar;
begin
  FormularioLimpar(False);
  FormularioControlar(True);
  edtItem.Text := IntegerStringConverter(lvwLista.Items.Count + 1);
  edtTitulo.SetFocus;
end;

//
// Procedimento para remover da lista uma das conex�es ao banco de dados.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormularioRemover;
var
  locIndice: Integer;
begin
  //
  // Determina se um �ndice da lista foi selecinado.
  //
  locIndice := VCLListViewIndiceItemRetornar(lvwLista);

  if locIndice = VCL_NENHUM_INDICE then
  begin
    VCLListViewFocar(lvwLista);
    Exit;
  end;

  //
  // Confirma remo��o.
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
  // Dados atualizados no formul�rio.
  //
  pubDadosAtualizados := True;

  //
  // Controlar componentes.
  //
  FormularioControlar(False);

  //
  // Garante atualiza��o dos dados de edi��o.
  //
  VCLListViewFocar(lvwLista);
end;

// Procedimento para editar os dados de uma conex�o com o banco de dados.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormularioEditar;
begin
  FormularioControlar(True);
  edtTitulo.SetFocus;
end;

//
// Procedimento para confirmar os dados da configura��o da conex�o ao banco de dados.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormularioConfirmar;
var
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
  locIndice            : Integer;
  locListItem          : TListItem;
begin
  //
  // Carrega vari�veis com o conte�do dos componentes.
  //
  locItem       := StringIntegerConverter(edtItem.Text);
  locTitulo     := StringTrim(edtTitulo.Text);
  locServidor   := StringTrim(edtServidor.Text);
  locPorta      := StringIntegerConverter(edtPorta.Text);
  locInstancia  := StringTrim(edtInstancia.Text);
  locUsuario    := StringTrim(edtUsuario.Text);
  locSenha      := StringTrim(edtSenha.Text);
  locBancoDados := StringTrim(edtBancoDados.Text);
  locTimeOut    := StringIntegerConverter(edtTimeOut.Text);

  //
  // Determina a senha criptografada.
  //
  locCriptografia       := TCriptografia.Create;
  locSenhaCriptografada := locCriptografia.Criptografar(edtSenha.Text);
  FreeAndNil(locCriptografia);
  
  //
  // Insere linha na lista.
  //
  FormularioItemAtualizar(locItem,
                          locTitulo,
                          locServidor,
                          locPorta,
                          locInstancia,
                          locUsuario,
                          locSenhaCriptografada,
                          locBancoDados,
                          locTimeOut);

  //
  // Dados atualizados no formul�rio.
  //
  pubDadosAtualizados := True;

  //
  // Controla componentes do formul�rio.
  //  
  FormularioControlar(False);

  //
  // Foco no listview.
  //
  VCLListViewItemPosicionar(lvwLista, locIndice);
  VCLListViewFocar(lvwLista);
end;

//
// Procedimento para cancelar a edi��o dos dados da conex�o ao banco de dados.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormularioCancelar;
var
  locIndice: Integer;
begin
  //
  // Confirma com o usu�rio.
  //
  if not VCLQuestionamentoExibir('Deseja realmente cancelar a edi��o destes dados?') then Exit;

  //
  // Determina o �ndice.
  //
  locIndice := StringIntegerConverter(edtItem.Text) - 1;
  if locIndice > (lvwLista.Items.Count - 1) then locIndice := (lvwLista.Items.Count - 1);  
  
  //
  // Muda modo de edi��o e recarrega dados dos componentes.
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
  // Limpa os componentes de edi��o.
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
    // Determina o �ndice da lista correto para fazer a leitura das informa��es.
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
    // Carrega caixas de texto com os conte�dos da lista.
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
// Procedimento para atualizar um item da lista.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormularioItemAtualizar(argItem      : Integer;
                                                                             argTitulo    : string;
                                                                             argServidor  : string;
                                                                             argPorta     : Integer;
                                                                             argInstancia : string;
                                                                             argUsuario   : string;
                                                                             argSenha     : string;
                                                                             argBancoDados: string;
                                                                             argTimeOut   : Integer);
var
  locIndice  : Integer;
  locListItem: TListItem;
begin
  //
  // Pelo sequencial do item determina se um novo ou uma altera��o.
  //
  if argItem > lvwLista.Items.Count then
  begin
    //
    // Determina o �ndice do listview.
    //
    locIndice := StringIntegerConverter(edtItem.Text);

    //
    // Insere nova linha na lista.
    //
    locListItem := lvwLista.Items.Add;
    locListItem.Caption := '';
    locListItem.SubItems.Add(IntegerStringConverter(argItem));
    locListItem.SubItems.Add(argTitulo);
    locListItem.SubItems.Add(argServidor);
    locListItem.SubItems.Add(IntegerStringConverter(argPorta));
    locListItem.SubItems.Add(argInstancia);
    locListItem.SubItems.Add(argUsuario);
    locListItem.SubItems.Add(argSenha);
    locListItem.SubItems.Add(argBancoDados);
    locListItem.SubItems.Add(IntegerStringConverter(argTimeOut));
  end
  else
  begin
    //
    // Determina o �ndice do listview.
    //
    locIndice := argItem - 1;

    //
    // Atualiza informa��es na lista.
    //
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_ITEM]        := IntegerStringConverter(argItem);
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_TITULO]      := argTitulo;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_SERVIDOR]    := argServidor;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_PORTA]       := IntegerStringConverter(argPorta);
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_INSTANCIA]   := argInstancia;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_USUARIO]     := argUsuario;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_SENHA]       := argSenha;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_BANCO_DADOS] := argBancoDados;
    lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_TIME_OUT]    := IntegerStringConverter(argTimeOut);
  end;
end;

//
// Procedimento para atualizar os dados do formul�rio.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormularioAtualizar(argSolicitarConfirmacao: Boolean = True);
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
  locServidor   : string;
  locPorta      : Integer;
  locInstancia  : string;
  locUsuario    : string;
  locSenha      : string;
  locBancoDados : string;
  locTimeOut    : Integer;
  locListItem   : TListItem;
begin
  //
  // Confirma execu��o com o usu�rio.
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
  // Verifica se o arquivo de configura��o existe na pasta adequada.
  //
  if not PathArquivoExisteDeterminar(gloConfiguracaoArquivo) then
  begin
    VCLCursorTrocar;
    Exit;
  end;

  //
  // L� a quantidade de conex�es existente no arquivo de configura��o.
  //
  try
    locQuantidade := ArquivoIniIntegerRecuperar(gloConfiguracaoArquivo, ARQUIVO_INI_CONEXAO_GERAL, ARQUIVI_INI_CONEXAO_GERAL_QUANTIDADE);
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
      locServidor   := ArquivoIniStringRecuperar (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_SERVIDOR);
      locPorta      := ArquivoIniIntegerRecuperar(gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_PORTA);
      locInstancia  := ArquivoIniStringRecuperar (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_INSTANCIA);
      locUsuario    := ArquivoIniStringRecuperar (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_USUARIO);
      locSenha      := ArquivoIniStringRecuperar (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_SENHA);
      locBancoDados := ArquivoIniStringRecuperar (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_BANCO_DADOS);
      locTimeOut    := ArquivoIniIntegerRecuperar(gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_TIME_OUT);
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
    FormularioItemAtualizar(locItem, locTitulo, locServidor, locPorta, locInstancia, locUsuario, locSenha, locBancoDados, locTimeOut);
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

//
// Procedimento para gravar as configura��es de acesso ao banco de dados.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioGravar';
  ERRO_MENSAGEM    : string = 'Imposs�vel gravar dados no arquivo de configura��o da aplica��o!';
var
  locLogMensagem: string;
  locQuantidade : Integer;
  locSessao     : string;
  locContador   : Integer;
  locItem       : Integer;
  locTitulo     : string;
  locServidor   : string;
  locPorta      : Integer;
  locInstancia  : string;
  locUsuario    : string;
  locSenha      : string;
  locBancoDados : string;
  locTimeOut    : Integer;
begin
  //
  // Confirma grava��o.
  //
  if not VCLQuestionamentoExibir('Deseja realmente gravar?') then Exit;

  //
  // Troca o cursor.
  //
  VCLCursorTrocar(True);

  //
  // Se o arquivo de configura��o n�o existir na pasta adequada ent�o cria os diret�rios.
  //
  if not PathArquivoExisteDeterminar(gloConfiguracaoArquivo) then
  begin
    //
    // Somente os diret�rios est�o sendo criados.
    //
    try
      PathCriar(gloConfiguracaoArquivo);
    except
      on locExcecao: Exception do
      begin
        locLogMensagem := 'Erro ao criar o path de arquivos de configura��o da aplica��o!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
        Exit;
      end;
    end;
  end;

  //
  // Remove todas as configura��es de conex�o antes de inser�-las.
  //
  try
    locQuantidade := ArquivoIniIntegerRecuperar(gloConfiguracaoArquivo, ARQUIVO_INI_CONEXAO_GERAL, ARQUIVI_INI_CONEXAO_GERAL_QUANTIDADE);
  except
    on locExcecao: Exception do
    begin
      locLogMensagem := 'Erro ao ler a quantidade de configura��es de conex�o existentes atualmente no arquivo de configura��o da aplica��o!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  if locQuantidade > 0 then
  begin
    for locContador := 1 to locQuantidade do
    begin
      locSessao := ARQUIVO_INI_CONEXAO_SESSAO + '_' + StringPreencher(IntegerStringConverter(locContador + 1), 4, '0');
      try
        ArquivoIniSessaoExcluir(gloConfiguracaoArquivo, locSessao);
      except
        on locExcecao: Exception do
        begin
          locLogMensagem := 'Erro ao excluir as sess�es existentes no arquivo de configura��o para as conex�es com o banco de dados!';
          Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
          VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
          Exit;
        end;
      end;
    end;
  end;

  //
  // Determina a quantidade de conex�es na lista.
  //
  locQuantidade := lvwLista.Items.Count;

  //
  // Grava a nova quantidade de conex�es existente no arquivo de configura��o.
  //
  try
    ArquivoIniIntegerGravar(gloConfiguracaoArquivo, ARQUIVO_INI_CONEXAO_GERAL, ARQUIVI_INI_CONEXAO_GERAL_QUANTIDADE, locQuantidade);
  except
    on locExcecao: Exception do
    begin
      locLogMensagem := 'Erro ao gravar a quantidade de conex�es configuradas no arquivo de configura��o para as conex�es com o banco de dados!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Inicia la�o para gravar cada uma das configura��es de conex�o do arquivo de configura��o.
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
    locItem       := StringIntegerConverter(lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_ITEM]);
    locTitulo     := lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_TITULO];
    locServidor   := lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_SERVIDOR];
    locPorta      := StringIntegerConverter(lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_PORTA]);
    locInstancia  := lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_INSTANCIA];
    locUsuario    := lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_USUARIO];
    locSenha      := lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_SENHA];
    locBancoDados := lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_BANCO_DADOS];
    locTimeOut    := StringIntegerConverter(lvwLista.Items.Item[locContador].SubItems.Strings[LVW_COLUNA_TIME_OUT]);

    //
    // Grava cada uma das conex�es da lista.
    //
    try
      ArquivoIniIntegerGravar (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_ITEM,        locItem);
      ArquivoIniStringGravar  (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_TITULO,      locTitulo);
      ArquivoIniStringGravar  (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_SERVIDOR,    locServidor);
      ArquivoIniIntegerGravar (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_PORTA,       locPorta);
      ArquivoIniStringGravar  (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_INSTANCIA,   locInstancia);
      ArquivoIniStringGravar  (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_USUARIO,     locUsuario);
      ArquivoIniStringGravar  (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_SENHA,       locSenha);
      ArquivoIniStringGravar  (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_BANCO_DADOS, locBancoDados);
      ArquivoIniIntegerGravar (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_TIME_OUT,    locTimeOut);
      ArquivoIniDateTimeGravar(gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_INS_DT_HR,   Now);
      ArquivoIniStringGravar  (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_INS_USER,    UserNameRecuperar);
      ArquivoIniStringGravar  (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_INS_HOST,    HostNameRecuperar);
    except
      on locExcecao: Exception do
      begin
        locLogMensagem := 'Erro ao gravar as informa��es sobre as conex�es configuradas no arquivo de configura��o para as conex�es com o banco de dados!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
        Exit;
      end;
    end;
  end;

  //
  // Troca o cursor.
  //
  VCLCursorTrocar;

  //
  // Fecha formul�rio.
  //
  pubClicouSair := False;  
  Close;
end;

//
// Procedimento para testar uma configura��o de acesso ao banco de dados.
//
procedure TPlataformaERPVCLAcessoConexaoConfiguracao.FormularioTestar;
begin
  Exit;
end;

end.
