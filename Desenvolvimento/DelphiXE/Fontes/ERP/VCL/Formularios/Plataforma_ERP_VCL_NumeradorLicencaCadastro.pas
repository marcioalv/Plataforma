//
// Arquivo..: Plataforma_ERP_VCL_NumeradorLicencaCadastro.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 14/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com o cadastro de numeradores por licença.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_NumeradorLicencaCadastro;

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
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls,
  Vcl.Menus;

type
  TPlataformaERPVCLNumeradorLicencaCadastro = class(TForm)
    imgFormulario: TImage;
    pagFormulario: TPageControl;
    tabCadastro: TTabSheet;
    tabAuditoria: TTabSheet;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    lblAtualID: TLabel;
    edtAtualID: TEdit;
    lblInsDtHt: TLabel;
    edtInsLocalDtHr: TEdit;
    lblUpdDtHr: TLabel;
    edtUpdLocalDtHr: TEdit;
    lblUpdContador: TLabel;
    edtUpdContador: TEdit;
    btnGravar: TBitBtn;
    btnMinimizar: TBitBtn;
    btnFechar: TBitBtn;
    btnCancelar: TBitBtn;
    btnAlterar: TBitBtn;
    btnNovo: TBitBtn;
    lblTipoUsuarioID: TLabel;
    edtTipoUsuarioID: TEdit;
    lblBase: TLabel;
    edtBaseDescricao: TEdit;
    edtBaseID: TEdit;
    lblLicenca: TLabel;
    edtLicencaDescricao: TEdit;
    edtLicencaID: TEdit;
    imgBackground: TImage;
    mnuFormulario: TMainMenu;
    mniFechar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniAlterar: TMenuItem;
    mniExcluir: TMenuItem;
    mniNovo: TMenuItem;
    mniAtualizar: TMenuItem;
    mniCancelar: TMenuItem;
    mniGravar: TMenuItem;
    gbxOpcoes: TGroupBox;
    chkBloqueado: TCheckBox;
    chkAtivo: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtAtualIDEnter(Sender: TObject);
    procedure edtAtualIDExit(Sender: TObject);
    procedure edtAtualIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtAtualIDKeyPress(Sender: TObject; var Key: Char);
    procedure chkBloqueadoEnter(Sender: TObject);
    procedure chkBloqueadoExit(Sender: TObject);
    procedure chkBloqueadoKeyPress(Sender: TObject; var Key: Char);
    procedure chkAtivoEnter(Sender: TObject);
    procedure chkAtivoExit(Sender: TObject);
    procedure chkAtivoKeyPress(Sender: TObject; var Key: Char);
    procedure btnLogClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure edtLicencaDescricaoClick(Sender: TObject);
    procedure edtBaseDescricaoClick(Sender: TObject);
    procedure edtInsLocalDtHrClick(Sender: TObject);
    procedure edtUpdLocalDtHrClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure mniCancelarClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
    procedure mniGravarClick(Sender: TObject);
    procedure mniAlterarClick(Sender: TObject);
    procedure mniExcluirClick(Sender: TObject);
    procedure mniNovoClick(Sender: TObject);
    procedure mniAtualizarClick(Sender: TObject);
    procedure mniLogClick(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioControlar(argEditar: Boolean);
    procedure FormularioLogExibir;
    procedure FormularioAtualizar;
    procedure FormularioNovo;

    procedure FormularioPopular(argLicencaID: Integer;
                                argBaseID   : Integer;
                                argCodigo   : string);

    procedure FormularioAlterar;
    procedure FormularioGravar;
    procedure FormularioCancelar;
    procedure FormularioExcluir;
    procedure FormularioCodigoSugerir;
    function  LogDadosGerar: string;
  public
    pubDadosAtualizados: Boolean;
    pubLicencaID       : Integer;
    pubBaseID          : Integer;
    pubCodigo          : string;
  end;

var
  PlataformaERPVCLNumeradorLicencaCadastro: TPlataformaERPVCLNumeradorLicencaCadastro;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_TipoUsuariosCadastro.pas';

  TAB_CADASTRO : Byte = 0;
  TAB_AUDITORIA: Byte = 1;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas.
  //
  pubDadosAtualizados := False;
  pubLicencaID        := 0;
  pubBaseID           := 0;
  pubCodigo           := '';
 
  //
  // Limpa os componentes do formulário.
  //
  FormularioLimpar;

  //
  // Componentes desligados para edição.
  //
  FormularioControlar(False);
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormShow(Sender: TObject);
begin
  //
  // Background do formulário.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Controla os componentes de exibição de cadastro.
  //
  VCLEditClickControlar(edtLicencaDescricao, False);
  VCLEditClickControlar(edtBaseDescricao,    False);
  VCLEditClickControlar(edtInsLocalDtHr,     False);
  VCLEditClickControlar(edtUpdLocalDtHr,     False);
  
  //
  // Se nenhuma chave foi passada então é um novo cadastro.
  //
  if (pubLicencaID = 0) and (pubBaseID = 0) and (pubCodigo = '') then
  begin
    FormularioNovo;
    Exit;
  end;

  //
  // Se foi passada uma chave então popula formulário.
  //
  if (pubLicencaID > 0) and (pubBaseID > 0) and (pubCodigo <> '') then
  begin
    FormularioPopular(pubLicencaID, pubBaseID, pubCodigo);
    FormularioControlar(False);
    Exit;
  end;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.mniLogClick(Sender: TObject);
begin
  FormularioLogExibir;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.mniNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.mniExcluirClick(Sender: TObject);
begin
  FormularioExcluir;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.mniAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.mniCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "código".
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigo) then Exit;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigo) then Exit;
end;

//
// Eventos do componente "ID atual".
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtAtualIDEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtAtualID) then Exit;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtAtualIDKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtAtualIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtAtualIDExit(Sender: TObject);
begin
  if not VCLEditSair(edtAtualID) then Exit;
end;

//
// Eventos do componente "bloqueado".
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.chkBloqueadoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkBloqueado) then Exit;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.chkBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.chkBloqueadoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkBloqueado) then Exit;
end;

//
// Ativo.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.chkAtivoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkAtivo) then Exit;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.chkAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.chkAtivoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkAtivo) then Exit;
end;

//
// Evento de click no título da licença.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtLicencaDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_LicencaCadastroExibir(StringIntegerConverter(edtLicencaID.Text));
end;

//
// Evento de click no título da base.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtBaseDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_BaseCadastroExibir(StringIntegerConverter(edtBaseID.Text));
end;

//
// Evento de click na data de criação.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtInsLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtInsLocalDtHr.Text));
end;

//
// Evento de click na data da última alteração.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtUpdLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtUpdLocalDtHr.Text));
end;

//
// Evento de click no botão "novo".
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.btnNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

//
// Evento de click no botão "alterar".
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.btnAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

//
// Evento de click no botão "gravar".
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "cancelar".
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.btnCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormularioLimpar;
begin 
  //
  // Posiciona pagecontrole na primeira aba.
  //
  VCLPageControlInicializar(pagFormulario);

  // Limpa componentes da aba "cadastro".
  VCLEditLimpar    (edtCodigo);
  VCLEditLimpar    (edtAtualID);
  VCLCheckBoxLimpar(chkBloqueado);
  VCLCheckBoxLimpar(chkAtivo);

  //
  // Limpa componentes da aba "auditoria".
  //
  VCLEditLimpar(edtLicencaID);
  VCLEditLimpar(edtLicencaDescricao);
  VCLEditLimpar(edtBaseID);
  VCLEditLimpar(edtBaseDescricao);
  VCLEditLimpar(edtInsLocalDtHr);
  VCLEditLimpar(edtUpdLocalDtHr);
  VCLEditLimpar(edtUpdContador);
end;

//
// Procedimento para controlar os componentes do formulário.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormularioControlar(argEditar: Boolean);
var
  locDadosPopulados: Boolean;
  locIdentificador : string;
begin
  //
  // Determina se existem dados populados no formulário.
  //
  locDadosPopulados := (StringIntegerConverter(edtTipoUsuarioID.Text) > 0);

  //
  // Controla os componentes do formulário.
  //
  VCLEditControlar(edtCodigo,  argEditar);
  VCLEditControlar(edtAtualID, argEditar);
  gbxOpcoes.Enabled := argEditar;

  //
  // Controla os componentes de exibição de cadastro.
  //
  VCLEditClickControlar(edtLicencaDescricao, True);
  VCLEditClickControlar(edtBaseDescricao,    True);
  VCLEditClickControlar(edtInsLocalDtHr,     True);
  VCLEditClickControlar(edtUpdLocalDtHr,     True);

  //
  // Controla os itens de menu do formulário.
  //
  mniAtualizar.Visible := (mniAtualizar.Enabled) and (not argEditar) and (locDadosPopulados);
  mniNovo.Visible      := (mniNovo.Enabled)      and (not argEditar);
  mniExcluir.Visible   := (mniExcluir.Enabled)   and (not argEditar) and (locDadosPopulados);
  mniAlterar.Visible   := (mniAlterar.Enabled)   and (not argEditar) and (locDadosPopulados);
  mniGravar.Visible    := (mniGravar.Enabled)    and (argEditar);
  mniCancelar.Visible  := (mniCancelar.Enabled)  and (argEditar);
  mniMinimizar.Visible := (mniMinimizar.Enabled);
  mniFechar.Visible    := (mniFechar.Enabled)    and (not argEditar);

  //
  // Permissões de acesso por VCL_DIGITACAO_ALFANUMERICA.
  //
  tabCadastro.TabVisible  := Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_LICENCA_CADASTRO_ABA_CADASTRO');
  tabAuditoria.TabVisible := Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_LICENCA_CADASTRO_ABA_AUDITORIA');
      
  mniAtualizar.Visible := (mniAtualizar.Visible) and (Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_LICENCA_CADASTRO_ATUALIZAR'));
  mniNovo.Visible      := (mniNovo.Visible)      and (Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_LICENCA_CADASTRO_NOVO'));
  mniExcluir.Visible   := (mniExcluir.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_LICENCA_CADASTRO_EXCLUIR'));
  mniAlterar.Visible   := (mniAlterar.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_LICENCA_CADASTRO_ALTERAR'));

  //
  // Botões.
  //
  btnNovo.Visible      := (btnNovo.Enabled)      and (mniNovo.Visible);
  btnAlterar.Visible   := (btnAlterar.Enabled)   and (mniAlterar.Visible);
  btnGravar.Visible    := (btnGravar.Enabled)    and (mniGravar.Visible);
  btnMinimizar.Visible := (btnMinimizar.Enabled) and (mniMinimizar.Visible);
  btnCancelar.Visible  := (btnCancelar.Enabled)  and (mniCancelar.Visible);
  btnFechar.Visible    := (btnFechar.Enabled)    and (mniFechar.Visible);

  //
  // Ajusta o título do formulário.
  //
  Self.Caption     := 'Numerador por licença';
  locIdentificador := ': ' + edtCodigo.Text;

  if (not locDadosPopulados) and (argEditar) then Self.Caption := Self.Caption + ' - novo cadastro';
  if locDadosPopulados and argEditar         then Self.Caption := Self.Caption + ' - alterando cadastro' + locIdentificador;
  if locDadosPopulados and (not argEditar)   then Self.Caption := Self.Caption + ' - consultando cadastro' + locIdentificador;
end;

//
// Procedimento para atualizar os dados populados nos componentes do formulário.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormularioAtualizar;
begin
  //
  // Popula componentes com as informações do cadastro.
  //
  FormularioPopular(StringIntegerConverter(edtLicencaID.Text),
                    StringIntegerConverter(edtBaseID.Text),
                    edtCodigo.Text);

  //
  // Controla a exibição dos componentes.
  //
  FormularioControlar(False);
end;

//
// Procedimento para iniciar a digitação de dados de um novo cadastro.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormularioNovo;
begin
  //
  // Limpa os componentes do formulário.
  //
  FormularioLimpar;

  //
  // Carrega conteúdo dos campos necessários.
  //
  edtLicencaID.Text        := IntegerStringConverter(gloLicencaID, True);
  edtLicencaDescricao.Text := gloLicencaDescricao;
  edtBaseID.Text           := IntegerStringConverter(gloBaseID,    True);
  edtBaseDescricao.Text    := gloBaseDescricao;
  edtTipoUsuarioID.Text    := STR_NOVO;
  chkAtivo.Checked         := True;

  //
  // Componentes ligados para edição.
  //
  FormularioControlar(True);
  
  //
  // Coloca o foco no código.
  //
  VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
end;

//
// Procedimento para popular os componentes com os dados de um cadastro.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormularioPopular(argLicencaID: Integer;
                                                                      argBaseID   : Integer;
                                                                      argCodigo   : string);
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
  ERRO_MENSAGEM    : string = 'Impossível consultar dados do numerador por licença!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
begin
  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Limpa os componentes do formulário.
  //
  FormularioLimpar;

  //
  // Conexão ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(Self);

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
  // Consulta dados do tipo de usuário.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                              ');
  locADOQuery.SQL.Add('  [licenca].[licenca_id] AS [licenca_id],                           ');
  locADOQuery.SQL.Add('  [licenca].[descricao]  AS [licenca_descricao],                    ');
  locADOQuery.SQL.Add('  [base].[base_id]       AS [tipo_usuario_base_id],                 ');
  locADOQuery.SQL.Add('  [base].[descricao]     AS [tipo_usuario_base_descricao],          ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_id],                                 ');  
  locADOQuery.SQL.Add('  [tipo_usuario].[codigo],                                          ');
  locADOQuery.SQL.Add('  [tipo_usuario].[descricao],                                       ');
  locADOQuery.SQL.Add('  [tipo_usuario].[bloqueado],                                       ');
  locADOQuery.SQL.Add('  [tipo_usuario].[ativo],                                           ');
  locADOQuery.SQL.Add('  [tipo_usuario].[ins_local_dt_hr],                                 ');
  locADOQuery.SQL.Add('  [tipo_usuario].[upd_local_dt_hr],                                 ');
  locADOQuery.SQL.Add('  [tipo_usuario].[upd_contador]                                     ');  
  locADOQuery.SQL.Add('FROM                                                                ');
  locADOQuery.SQL.Add('  [tipo_usuario] WITH (NOLOCK)                                      ');
  locADOQuery.SQL.Add('  INNER JOIN [licenca] WITH (NOLOCK)                                ');
  locADOQuery.SQL.Add('    ON [licenca].[licenca_id] = [tipo_usuario].[licenca_id]         ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                                   ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [tipo_usuario].[tipo_usuario_base_id]     ');
  locADOQuery.SQL.Add('WHERE                                                               ');
  locADOQuery.SQL.Add('  [tipo_usuario].[licenca_id]           = :licenca_id           AND ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_base_id] = :tipo_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_id]      = :tipo_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value           := argLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_base_id').Value := argTipoUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value      := argTipoUsuarioID;

  //
  // Executa query.
  //
  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [tipo_usuario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Registro encontrado.
  //
  if locADOQuery.RecordCount >= 0 then
  begin
    //
    // Carrega componentes.
    //
    edtCodigo.Text       := locADOQuery.FieldByName('codigo').AsString;
    edtDescricao.Text    := locADOQuery.FieldByName('descricao').AsString;
    chkBloqueado.Checked := StringBooleanConverter(locADOQuery.FieldByName('bloqueado').AsString);
    chkAtivo.Checked     := StringBooleanConverter(locADOQuery.FieldByName('ativo').AsString);

    edtLicencaID.Text                := locADOQuery.FieldByName('licenca_id').AsString;
    edtLicencaDescricao.Text         := locADOQuery.FieldByName('licenca_descricao').AsString;
    edtTipoUsuarioBaseID.Text        := locADOQuery.FieldByName('tipo_usuario_base_id').AsString;
    edtTipoUsuarioBaseDescricao.Text := locADOQuery.FieldByName('tipo_usuario_base_descricao').AsString;
    edtTipoUsuarioID.Text            := IntegerStringConverter(locADOQuery.FieldByName('tipo_usuario_id').AsInteger, True);
    edtInsLocalDtHr.Text             := DateTimeStringConverter(locADOQuery.FieldByName('ins_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn');
    edtUpdLocalDtHr.Text             := DateTimeStringConverter(locADOQuery.FieldByName('upd_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn');
    edtUpdContador.Text              := IntegerStringConverter(locADOQuery.FieldByName('upd_contador').AsInteger);
  end; 

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);
  VCLCursorTrocar;
end;

//
// Procedimento para alterar os dados do formulário.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormularioAlterar;
begin
  //
  // Componentes ligados para edição.
  //
  FormularioControlar(True);

  //
  // Coloca o foco no código.
  //
  VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
end;

//
// Procedimento para gravar os dados do formulário.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioGravar';
  ERRO_MENSAGEM    : string = 'Impossível gravar dados do tipo de usuário!';
var
  locADOConnection      : TADOConnection;
  locADOQuery           : TADOQuery;
  locLogMensagem        : string;

  locInsert             : Boolean;
  locRegistroAcao       : Byte;
  locRegistroAcaoID     : Integer;
  locTipoUsuarioLogSq   : Integer;
  locTipoUsuarioLogMsg  : string;
  locTipoUsuarioLogDados: string;

  locLicencaID          : Integer;
  locTipoUsuarioBaseID  : Integer;
  locTipoUsuarioID      : Integer;
  locCodigo             : string;
  locDescricao          : string;
  locBloqueado          : Boolean;
  locAtivo              : Boolean;
  locInsLocalDtHr       : TDateTime;
  locUpdLocalDtHr       : TDateTime;
  locUsuarioBaseID      : Integer;
  locUsuarioID          : Integer;
  locUpdContador        : Integer;
  locHostName           : string;
  locUserName           : string;
begin
  //
  // Determina se será um insert ou update.
  //
  if edtTipoUsuarioID.Text = STR_NOVO then
    locInsert := True
  else
    locInsert := False;

  //
  // Carrega variáveis com o conteúdo dos componentes.
  //
  locLicencaID         := StringIntegerConverter(edtLicencaID.Text);
  locTipoUsuarioBaseID := StringIntegerConverter(edtTipoUsuarioBaseID.Text);
  locTipoUsuarioID     := StringIntegerConverter(edtTipoUsuarioID.Text);
  locCodigo            := StringTrim(edtCodigo.Text);
  locDescricao         := StringTrim(edtDescricao.Text);
  locBloqueado         := chkBloqueado.Checked;
  locAtivo             := chkAtivo.Checked;
  locUsuarioBaseID     := gloUsuarioBaseID;
  locUsuarioID         := gloUsuarioID;
  locHostName          := HostNameRecuperar;
  locUserName          := UserNameRecuperar;
  locUpdContador       := StringIntegerConverter(edtUpdContador.Text);

  //
  // Consiste as informações.
  //
  if locCodigo = '' then
  begin
    VCLConsistenciaExibir('O código do tipo de usuário deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
    Exit;
  end;

  if locDescricao = '' then
  begin
    VCLConsistenciaExibir('A descrição do tipo de usuário deve ser informada!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtDescricao);
    Exit;
  end;

  //
  // Confirma gravação com o usuário.
  //
  if not VCLQuestionamentoExibir('Deseja realmente gravar estes dados?') then Exit;

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Conexão ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(Self);

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
  // Determina se o código do tipo do usuário já existe no banco de dados para um outro registro.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                                                        ');
  locADOQuery.SQL.Add('  1                                                                 ');
  locADOQuery.SQL.Add('FROM                                                                ');
  locADOQuery.SQL.Add('  [tipo_usuario] WITH (NOLOCK)                                      ');
  locADOQuery.SQL.Add('WHERE                                                               ');
  locADOQuery.SQL.Add('  [tipo_usuario].[licenca_id]           = :licenca_id           AND ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_base_id] = :tipo_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [tipo_usuario].[codigo]               = :codigo               AND ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_id]     <> :tipo_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value           := locLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_base_id').Value := locTipoUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('codigo').Value               := locCodigo;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value      := locTipoUsuarioID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar o mesmo código de tipo de usuário em um outro registro!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  if locADOQuery.RecordCount > 0 then
  begin
    locADOQuery.Close;
    FreeAndNil(locADOQuery);
    locADOConnection.Close;
    FreeAndNil(locADOConnection);
    locLogMensagem := 'O código "' + locCodigo + '" informado para o tipo de usuário já existe em algum outro cadastro!';
    Plataforma_ERP_Logar(False, ERRO_MENSAGEM, locLogMensagem, FONTE_NOME, PROCEDIMENTO_NOME);
    VCLErroExibir(ERRO_MENSAGEM, locLogMensagem);
    Exit;
  end;

  //
  // Consiste o contador do update.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                              ');
  locADOQuery.SQL.Add('  [tipo_usuario].[upd_contador]                                     ');
  locADOQuery.SQL.Add('FROM                                                                ');
  locADOQuery.SQL.Add('  [tipo_usuario] WITH (NOLOCK)                                      ');
  locADOQuery.SQL.Add('WHERE                                                               ');
  locADOQuery.SQL.Add('  [tipo_usuario].[licenca_id]           = :licenca_id           AND ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_base_id] = :tipo_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_id]      = :tipo_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value           := locLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_base_id').Value := locTipoUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value      := locTipoUsuarioID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualizações confere na tabela [tipo_usuario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  if locADOQuery.RecordCount > 0 then
  begin
    if locADOQuery.FieldByName('upd_contador').AsInteger <> locUpdContador then
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Esse registro sofreu alguma outra alteração entre a sua consulta e essa gravação!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem);
      Exit
    end;
  end;

  //
  // Determina o ID da ação e a mensagem para o log do registro.
  //
  if locInsert then
  begin
    locRegistroAcao      := REGISTRO_ACAO_CRIACAO;
    locTipoUsuarioLogMsg := MENSAGEM_REGISTRO_ACAO_CRIADO;
  end
  else
  begin
    locRegistroAcao      := REGISTRO_ACAO_ALTERACAO;
    locTipoUsuarioLogMsg := MENSAGEM_REGISTRO_ACAO_ALTERADO;
  end;

  try
    locRegistroAcaoID := Plataforma_ERP_RegistroAcaoIDDeterminar(locADOConnection, locRegistroAcao);
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locExcecao.Message);
      Exit
    end;
  end;

  //
  // Inicia transação com o banco de dados.
  //
  try
    locADOConnection.BeginTrans;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := ERRO_MENSAGEM_BD_TRANSACAO_INICIAR;
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE, locExcecao.Message);
      Exit
    end;
  end;  

  // 
  // Determina o próximo ID do tipo de usuário.
  //
  if locInsert then
  begin
    try
      locTipoUsuarioID := Plataforma_ERP_ADO_NumeradorLicencaDeterminar(locADOConnection,
                                                                        locLicencaID,
                                                                        locTipoUsuarioBaseID,
                                                                        NUMERADOR_TIPO_USUARIO_ID,
                                                                        locUsuarioBaseID,
                                                                        locUsuarioID);
    except
      on locExcecao: Exception do
      begin
        locADOConnection.RollbackTrans;
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Impossível determinar o próximo numerador para o tipo de usuário!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
        Exit
      end;
    end;
  end;

  //
  // Grava dados na tabela tipo_usuario.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;

  if locInsert then
  begin
    //
    // Insere dados.
    //
    locADOQuery.SQL.Add('INSERT INTO [tipo_usuario] (');
    locADOQuery.SQL.Add('  [licenca_id],             ');
    locADOQuery.SQL.Add('  [tipo_usuario_base_id],   ');
    locADOQuery.SQL.Add('  [tipo_usuario_id],        ');
    locADOQuery.SQL.Add('  [codigo],                 ');
    locADOQuery.SQL.Add('  [descricao],              ');
    locADOQuery.SQL.Add('  [bloqueado],              ');
    locADOQuery.SQL.Add('  [ativo],                  ');
    locADOQuery.SQL.Add('  [ins_local_dt_hr],        ');
    locADOQuery.SQL.Add('  [ins_server_dt_hr],       ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr],        ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr],       ');
    locADOQuery.SQL.Add('  [upd_contador]            ');  
    locADOQuery.SQL.Add(')                           ');
    locADOQuery.SQL.Add('VALUES (                    ');
    locADOQuery.SQL.Add('  :licenca_id,              '); // licenca_id.
    locADOQuery.SQL.Add('  :tipo_usuario_base_id,    '); // tipo_usuario_base_id.
    locADOQuery.SQL.Add('  :tipo_usuario_id,         '); // tipo_usuario_id.
    locADOQuery.SQL.Add('  :codigo,                  '); // codigo.
    locADOQuery.SQL.Add('  :descricao,               '); // descricao.
    locADOQuery.SQL.Add('  :bloqueado,               '); // bloqueado.
    locADOQuery.SQL.Add('  :ativo,                   '); // ativo.
    locADOQuery.SQL.Add('  :local_dt_hr,             '); // ins_local_dt_hr.
    locADOQuery.SQL.Add('  GETDATE(),                '); // ins_server_dt_hr.
    locADOQuery.SQL.Add('  NULL,                     '); // upd_local_dt_hr.
    locADOQuery.SQL.Add('  NULL,                     '); // upd_server_dt_hr.
    locADOQuery.SQL.Add('  0                         '); // upd_contador.
    locADOQuery.SQL.Add(')                           ');
  end
  else
  begin
    //
    // Atualiza dados.
    //
    locADOQuery.SQL.Add('UPDATE                                               ');
    locADOQuery.SQL.Add('  [tipo_usuario]                                     ');
    locADOQuery.SQL.Add('SET                                                  ');
    locADOQuery.SQL.Add('  [codigo]           = :codigo,                      ');
    locADOQuery.SQL.Add('  [descricao]        = :descricao,                   ');
    locADOQuery.SQL.Add('  [bloqueado]        = :bloqueado,                   ');
    locADOQuery.SQL.Add('  [ativo]            = :ativo,                       ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr]  = :local_dt_hr,                 ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr] = GETDATE(),                    ');
    locADOQuery.SQL.Add('  [upd_contador]     = [upd_contador] + 1            ');
    locADOQuery.SQL.Add('WHERE                                                ');
    locADOQuery.SQL.Add('  [licenca_id]           = :licenca_id           AND ');
    locADOQuery.SQL.Add('  [tipo_usuario_base_id] = :tipo_usuario_base_id AND ');
    locADOQuery.SQL.Add('  [tipo_usuario_id]      = :tipo_usuario_id          ');
  end;

  //
  // Parâmetros.
  //
  locADOQuery.Parameters.ParamByName('licenca_id').Value           := locLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_base_id').Value := locTipoUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value      := locTipoUsuarioID;
  locADOQuery.Parameters.ParamByName('codigo').Value               := locCodigo;
  locADOQuery.Parameters.ParamByName('descricao').Value            := locDescricao;
  locADOQuery.Parameters.ParamByName('bloqueado').Value            := BooleanStringConverter(locBloqueado);
  locADOQuery.Parameters.ParamByName('ativo').Value                := BooleanStringConverter(locAtivo);
  locADOQuery.Parameters.ParamByName('local_dt_hr').Value          := Now;

  try
    locADOQuery.ExecSQL;
  except
    on locExcecao: Exception do
    begin
      locADOConnection.RollbackTrans;
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [tipo_usuario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  //
  // Determina o contador de updates atual.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                              ');
  locADOQuery.SQL.Add('  [tipo_usuario].[ins_local_dt_hr],                                 ');
  locADOQuery.SQL.Add('  [tipo_usuario].[upd_local_dt_hr],                                 ');
  locADOQuery.SQL.Add('  [tipo_usuario].[upd_contador]                                     ');
  locADOQuery.SQL.Add('FROM                                                                ');
  locADOQuery.SQL.Add('  [tipo_usuario]                                                    ');
  locADOQuery.SQL.Add('WHERE                                                               ');
  locADOQuery.SQL.Add('  [tipo_usuario].[licenca_id]           = :licenca_id           AND ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_base_id] = :tipo_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_id]      = :tipo_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value           := locLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_base_id').Value := locTipoUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value      := locTipoUsuarioID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOConnection.RollbackTrans;
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o novo contador de updates do registro na tabela [tipo_usuario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;   
  end;

  locInsLocalDtHr := locADOQuery.FieldByName('ins_local_dt_hr').AsDateTime;
  locUpdLocalDtHr := locADOQuery.FieldByName('upd_local_dt_hr').AsDateTime;
  locUpdContador  := locADOQuery.FieldByName('upd_contador').AsInteger;

  //
  // Log dados.
  //
  locTipoUsuarioLogDados := LogDadosGerar(locTipoUsuarioID);

  //
  // Determina o próximo sequencial da tabela tipo_usuario_log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                  ');
  locADOQuery.SQL.Add('  MAX([tipo_usuario_log].[tipo_usuario_log_sq]) AS Sequencial           ');
  locADOQuery.SQL.Add('FROM                                                                    ');
  locADOQuery.SQL.Add('  [tipo_usuario_log]                                                    ');
  locADOQuery.SQL.Add('WHERE                                                                   ');
  locADOQuery.SQL.Add('  [tipo_usuario_log].[licenca_id]           = :licenca_id           AND ');
  locADOQuery.SQL.Add('  [tipo_usuario_log].[tipo_usuario_base_id] = :tipo_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [tipo_usuario_log].[tipo_usuario_id]      = :tipo_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value           := locLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_base_id').Value := locTipoUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value      := locTipoUsuarioID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOConnection.RollbackTrans;
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o próximo sequencial para o registro na tabela [tipo_usuario_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  if locADOQuery.RecordCount <= 0 then
  begin
    locTipoUsuarioLogSq := 1;
  end
  else  
  begin
    locTipoUsuarioLogSq := locADOQuery.FieldByName('Sequencial').AsInteger + 1;
  end; 

  //
  // Monta SQL para inserir dados na tabela de log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('INSERT INTO [tipo_usuario_log] (');
  locADOQuery.SQL.Add('  [licenca_id],                 ');
  locADOQuery.SQL.Add('  [tipo_usuario_base_id],       ');
  locADOQuery.SQL.Add('  [tipo_usuario_id],            ');
  locADOQuery.SQL.Add('  [tipo_usuario_log_sq],        ');
  locADOQuery.SQL.Add('  [log_base_id],                ');
  locADOQuery.SQL.Add('  [log_local_dt_hr],            ');
  locADOQuery.SQL.Add('  [log_server_dt_hr],           ');
  locADOQuery.SQL.Add('  [registro_acao_id],           ');
  locADOQuery.SQL.Add('  [host_name],                  ');
  locADOQuery.SQL.Add('  [user_name],                  ');
  locADOQuery.SQL.Add('  [log_usuario_base_id],        ');
  locADOQuery.SQL.Add('  [log_usuario_id],             ');
  locADOQuery.SQL.Add('  [mensagem],                   ');  
  locADOQuery.SQL.Add('  [dados]                       ');
  locADOQuery.SQL.Add(')                               ');
  locADOQuery.SQL.Add('VALUES (                        ');
  locADOQuery.SQL.Add('  :licenca_id,                  '); // licenca_id.
  locADOQuery.SQL.Add('  :tipo_usuario_base_id,        '); // tipo_usuario_base_id.
  locADOQuery.SQL.Add('  :tipo_usuario_id,             '); // tipo_usuario_id.
  locADOQuery.SQL.Add('  :tipo_usuario_log_sq,         '); // tipo_usuario_log_sq.
  locADOQuery.SQL.Add('  :log_base_id,                 '); // log_base_id.
  locADOQuery.SQL.Add('  :log_local_dt_hr,             '); // log_local_dt_hr.
  locADOQuery.SQL.Add('  GETDATE(),                    '); // log_server_dt_hr.
  locADOQuery.SQL.Add('  :registro_acao_id,            '); // registro_acao_id.
  locADOQuery.SQL.Add('  :host_name,                   '); // host_name.
  locADOQuery.SQL.Add('  :user_name,                   '); // user_name.
  locADOQuery.SQL.Add('  :log_usuario_base_id,         '); // log_usuario_base_id.
  locADOQuery.SQL.Add('  :log_usuario_id,              '); // log_usuario_id.
  locADOQuery.SQL.Add('  :mensagem,                    '); // mensagem.
  locADOQuery.SQL.Add('  :dados                        '); // dados.
  locADOQuery.SQL.Add(')                               ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value           := locLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_base_id').Value := locTipoUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value      := locTipoUsuarioID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_log_sq').Value  := locTipoUsuarioLogSq;
  locADOQuery.Parameters.ParamByName('log_base_id').Value          := gloBaseID;
  locADOQuery.Parameters.ParamByName('log_local_dt_hr').Value      := Now;
  locADOQuery.Parameters.ParamByName('registro_acao_id').Value     := locRegistroAcaoID;
  locADOQuery.Parameters.ParamByName('host_name').Value            := locHostName;
  locADOQuery.Parameters.ParamByName('user_name').Value            := locUserName;
  locADOQuery.Parameters.ParamByName('log_usuario_base_id').Value  := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('log_usuario_id').Value       := locUsuarioID;
  locADOQuery.Parameters.ParamByName('mensagem').Value             := locTipoUsuarioLogMsg;
  locADOQuery.Parameters.ParamByName('dados').Value                := locTipoUsuarioLogDados;

  try
    locADOQuery.ExecSQL;
  except
    on locExcecao: Exception do
    begin
      locADOConnection.RollbackTrans;
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir/atualizar o registro na tabela [tipo_usuario_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  //
  // Finaliza transação com o banco de dados.
  //
  try
    locADOConnection.CommitTrans;
  except
    on locExcecao: Exception do
    begin
      locADOConnection.RollbackTrans;
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := ERRO_MENSAGEM_BD_TRANSACAO_CONFIRMAR;
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE, locExcecao.Message);
      Exit
    end;
  end;

  //
  // Atualiza componentes que sofreram alteração com a gravação.
  //
  edtTipoUsuarioID.Text := IntegerStringConverter(locTipoUsuarioID);
  edtInsLocalDtHr.Text  := DateTimeStringConverter(locInsLocalDtHr, 'dd/mm/yyyy hh:nn');
  edtUpdLocalDtHr.Text  := DateTimeStringConverter(locUpdLocalDtHr, 'dd/mm/yyyy hh:nn');
  edtUpdContador.Text   := IntegerStringConverter(locUpdContador);

  //
  // Componentes desligados para edição.
  //
  FormularioControlar(False);

  //
  // Indica que os dados foram atualizados.
  //
  pubDadosAtualizados := True;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);

  //
  // Grava log de ocorrência.
  //  
  try
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, locTipoUsuarioID, locTipoUsuarioLogMsg, locTipoUsuarioLogDados);
  except
    on locExcecao: Exception do
    begin
      VCLErroExibir(locExcecao.Message);
    end;
  end;

  //
  // Tipo de usuário gravado!
  //
  VCLInformacaoExibir('Tipo de usuário gravado com sucesso!');
end;

//
// Procedimento para excluir os dados deste cadastro.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormularioExcluir;
const
  PROCEDIMENTO_NOME: string = 'FormularioExcluir';
  ERRO_MENSAGEM    : string = 'Impossível excluir dados do tipo de usuário!';
var
  locADOConnection      : TADOConnection;
  locADOQuery           : TADOQuery;
  locLogMensagem        : string;
  locLicencaID          : Integer;
  locTipoUsuarioBaseID  : Integer;
  locTipoUsuarioID      : Integer;
  locTipoUsuarioLogDados: string;
begin
  //
  // Carrega variáveis com o conteúdo dos componentes.
  //
  locLicencaID         := StringIntegerConverter(edtLicencaID.Text);
  locTipoUsuarioBaseID := StringIntegerConverter(edtTipoUsuarioBaseID.Text);
  locTipoUsuarioID     := StringIntegerConverter(edtTipoUsuarioID.Text);

  //
  // Log dados.
  //
  locTipoUsuarioLogDados := LogDadosGerar;

  //
  // Confirma gravação com o usuário.
  //
  if not VCLQuestionamentoExibir('Deseja realmente excluir estes dados?') then Exit;
  if not VCLQuestionamentoExibir('Tem certeza?') then Exit;

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Conexão ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(Self);

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
  // Verifica se existem registros na tabela de usuário que impediriam a exclusão.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                                                   ');
  locADOQuery.SQL.Add('  [usuario].[nome]                                             ');
  locADOQuery.SQL.Add('FROM                                                           ');
  locADOQuery.SQL.Add('  [usuario] WITH (NOLOCK)                                      ');
  locADOQuery.SQL.Add('WHERE                                                          ');
  locADOQuery.SQL.Add('  [usuario].[licenca_id]           = :licenca_id           AND ');
  locADOQuery.SQL.Add('  [usuario].[tipo_usuario_base_id] = :tipo_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [usuario].[tipo_usuario_id]      = :tipo_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value           := locLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_base_id').Value := locTipoUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value      := locTipoUsuarioID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar a query para verificar se o tipo de usuário existe para algum outro cadastro!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE, locExcecao.Message);
      Exit
    end;
  end;

  if locADOQuery.RecordCount > 0 then
  begin
    locLogMensagem := 'Esse tipo de usuário existe no cadastro de usuário de "' + locADOQuery.FieldByName('nome').AsString + '"!';
    
    locADOQuery.Close;
    FreeAndNil(locADOQuery);
    locADOConnection.Close;
    FreeAndNil(locADOConnection);

    VCLConsistenciaExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_CONSISTENCIA_EXCLUSAO);
    Exit;
  end;

  //
  // Inicia transação com o banco de dados.
  //
  try
    locADOConnection.BeginTrans;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := ERRO_MENSAGEM_BD_TRANSACAO_INICIAR;
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE, locExcecao.Message);
      Exit
    end;
  end;  

  //
  // Deleta registro da tabela tipo_usuario_log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                                                             ');
  locADOQuery.SQL.Add('  [tipo_usuario_log]                                                    ');
  locADOQuery.SQL.Add('WHERE                                                                   ');
  locADOQuery.SQL.Add('  [tipo_usuario_log].[licenca_id]           = :licenca_id           AND ');
  locADOQuery.SQL.Add('  [tipo_usuario_log].[tipo_usuario_base_id] = :tipo_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [tipo_usuario_log].[tipo_usuario_id]      = :tipo_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value           := locLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_base_id').Value := locTipoUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value      := locTipoUsuarioID;

  try
    locADOQuery.ExecSQL;
  except
    on locExcecao: Exception do
    begin
      locADOConnection.RollbackTrans;
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para deletar os registros na tabela [tipo_usuario_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Comando SQL para excluir um registro da tabela tipo_usuario.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                                                         ');
  locADOQuery.SQL.Add('  [tipo_usuario]                                                    ');
  locADOQuery.SQL.Add('WHERE                                                               ');
  locADOQuery.SQL.Add('  [tipo_usuario].[licenca_id]           = :licenca_id           AND ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_base_id] = :tipo_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_id]      = :tipo_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value           := locLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_base_id').Value := locTipoUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value      := locTipoUsuarioID;

  try
    locADOQuery.ExecSQL;
  except
    on locExcecao: Exception do
    begin
      locADOConnection.RollbackTrans;
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para deletar os registros na tabela [tipo_usuario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Finaliza transação com o banco de dados.
  //
  try
    locADOConnection.CommitTrans;
  except
    on locExcecao: Exception do
    begin
      locADOConnection.RollbackTrans;
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := ERRO_MENSAGEM_BD_TRANSACAO_CONFIRMAR;
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE, locExcecao.Message);
      Exit
    end;
  end;  

  //
  // Limpa os componentes do formulário.
  //
  FormularioLimpar;

  //
  // Desliga os componentes para edição e ajusta a visibilidade dos botões.
  //
  FormularioControlar(False);

  //
  // Indica que os dados foram atualizados.
  //
  pubDadosAtualizados := True;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);

  //
  // Log de ocorrência.
  //
  try
    Plataforma_ERP_ADO_LogOcorrenciaInserir(REGISTRO_ACAO_EXCLUSAO, locTipoUsuarioID, 'Registro excluído com sucesso!', locTipoUsuarioLogDados);
  except
  end;
  VCLInformacaoExibir('Tipo de usuário excluído com sucesso!');
end;

//
// Procedimento para cancelar a edição dos dados do formulário.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormularioCancelar;
var
  locLicencaID        : Integer;
  locTipoUsuarioBaseID: Integer;
  locTipoUsuarioID    : Integer;
begin
  //
  // Carrega chave do registro que estava sendo editado.
  //
  locLicencaID         := StringIntegerConverter(edtLicencaID.Text);
  locTipoUsuarioBaseID := StringIntegerConverter(edtTipoUsuarioBaseID.Text);
  locTipoUsuarioID     := StringIntegerConverter(edtTipoUsuarioID.Text);

  //
  // Confirma com o usuário.
  //
  if locTipoUsuarioID = 0 then
  begin
    if not VCLQuestionamentoExibir('Deseja realmente cancelar a digitação destes dados?') then Exit;
  end
  else
  begin
    if not VCLQuestionamentoExibir('Deseja realmente cancelar a alteração destes dados?') then Exit;
  end;

  //
  // Popula somente os dados.
  //
  FormularioPopular(locLicencaID, locTipoUsuarioBaseID, locTipoUsuarioID);

  //
  // Componentes desligados para edição.
  //
  FormularioControlar(False);
end;

//
// Procedimento par sugerir o próximo código.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormularioCodigoSugerir;
const
  PROCEDIMENTO_NOME: string = 'FormularioCodigoSugerir';
  ERRO_MENSAGEM    : string = 'Impossível sugerir informações sobre o próximo código do tipo de usuário!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
  locLicencaID    : Integer;
begin
  //
  // ID da licença.
  //
  locLicencaID := gloLicencaID;

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Limpa componente.
  //
  VCLEditLimpar(edtCodigoCadastrado);

  //
  // Conexão ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(Self);

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
  // Consulta dados do código do tipo de usuário.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                                ');
  locADOQuery.SQL.Add('  [tipo_usuario].[codigo],                  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[descricao]                ');
  locADOQuery.SQL.Add('FROM                                        ');
  locADOQuery.SQL.Add('  [tipo_usuario] WITH (NOLOCK)              ');
  locADOQuery.SQL.Add('WHERE                                       ');
  locADOQuery.SQL.Add('  [tipo_usuario].[licenca_id] = :licenca_id ');
  locADOQuery.SQL.Add('ORDER BY                                    ');
  locADOQuery.SQL.Add('  [tipo_usuario].[ins_server_dt_hr] DESC,   ');
  locADOQuery.SQL.Add('  [tipo_usuario].[codigo] DESC              ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value := locLicencaID;

  //
  // Executa query.
  //
  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar último cadastro na tabela [tipo_usuario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Registro encontrado então carrega componentes.
  //
  if locADOQuery.RecordCount >= 0 then
  begin
    edtCodigoCadastrado.Text := locADOQuery.FieldByName('codigo').AsString;
  end;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);

  VCLCursorTrocar;
end;

//
// Função para gerar a string de log dos dados.
//
function TPlataformaERPVCLNumeradorLicencaCadastro.LogDadosGerar(argTipoUsuarioID: Integer = 0): string;
var
  locTipoUsuarioID: Integer;
begin
  if argTipoUsuarioID <= 0 then
    locTipoUsuarioID := StringIntegerConverter(edtTipoUsuarioID.Text)
  else
    locTipoUsuarioID := argTipoUsuarioID;

  Result := '';
  LogDadosStringDescrever ('Licença',                 edtLicencaID.Text,         Result);
  LogDadosStringDescrever ('Base do tipo de usuário', edtTipoUsuarioBaseID.Text, Result);
  LogDadosIntegerDescrever('ID do tipo de usuário',   locTipoUsuarioID,          Result);
  LogDadosStringDescrever ('Código',                  edtCodigo.Text,            Result);
  LogDadosStringDescrever ('Descrição',               edtDescricao.Text,         Result);
  LogDadosBooleanDescrever('Bloqueado',               chkBloqueado.Checked,      Result);
  LogDadosBooleanDescrever('Ativo',                   chkAtivo.Checked,          Result);
end;

end.
