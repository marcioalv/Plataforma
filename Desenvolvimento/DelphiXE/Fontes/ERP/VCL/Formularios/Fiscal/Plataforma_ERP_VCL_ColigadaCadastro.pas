//
// Arquivo..: Plataforma_ERP_VCL_ColigadaCadastro.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com o cadastro de coligada.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_ColigadaCadastro;

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
  TPlataformaERPVCLColigadaCadastro = class(TForm)
    imgFormulario: TImage;
    pagFormulario: TPageControl;
    tabCadastro: TTabSheet;
    tabAuditoria: TTabSheet;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    lblNome: TLabel;
    edtDescricao: TEdit;
    lblInsDtHt: TLabel;
    edtInsLocalDtHr: TEdit;
    lblUpdDtHr: TLabel;
    edtUpdLocalDtHr: TEdit;
    lblUpdContador: TLabel;
    edtUpdContador: TEdit;
    lblColigadaID: TLabel;
    edtColigadaID: TEdit;
    lblColigadaBase: TLabel;
    edtColigadaBaseDescricao: TEdit;
    edtColigadaBaseID: TEdit;
    lblLicenca: TLabel;
    edtLicencaDescricao: TEdit;
    edtLicencaID: TEdit;
    lblCodigoCadastrado: TLabel;
    edtCodigoCadastrado: TEdit;
    imgBackground: TImage;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnMinimizar: TBitBtn;
    btnAlterar: TBitBtn;
    btnFechar: TBitBtn;
    btnNovo: TBitBtn;
    btnLog: TBitBtn;
    mnuFormulario: TMainMenu;
    mniFechar: TMenuItem;
    mniCancelar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniGravar: TMenuItem;
    mniAlterar: TMenuItem;
    mniExcluir: TMenuItem;
    mniNovo: TMenuItem;
    mniAtualizar: TMenuItem;
    mniAdicional: TMenuItem;
    gbxOpcoes: TGroupBox;
    chkBloqueado: TCheckBox;
    chkAtivo: TCheckBox;
    edtCodigoCadastradoBaseID: TEdit;
    edtCodigoCadastradoID: TEdit;
    mniLog: TMenuItem;
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
    procedure edtDescricaoEnter(Sender: TObject);
    procedure edtDescricaoExit(Sender: TObject);
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
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
    procedure edtColigadaBaseDescricaoClick(Sender: TObject);
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
    procedure edtCodigoCadastradoClick(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioControlar(argEditar: Boolean);
    procedure FormularioLogExibir;

    procedure FormularioAtualizar;
    procedure FormularioNovo;

    procedure FormularioPopular(argLicencaID     : Integer;
                                argColigadaBaseID: Integer;
                                argColigadaID    : Integer);

    procedure FormularioAlterar;
    procedure FormularioGravar;
    procedure FormularioCancelar;
    procedure FormularioExcluir;
    procedure FormularioCodigoSugerir;

    function LogDadosGerar(argColigadaID: Integer = 0): string;
  public
    pubDadosAtualizados: Boolean;
    pubLicencaID       : Integer;
    pubColigadaBaseID  : Integer;
    pubColigadaID      : Integer;
  end;

var
  PlataformaERPVCLColigadaCadastro: TPlataformaERPVCLColigadaCadastro;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_ColigadaCadastro.pas';

  TAB_CADASTRO : Byte = 0;
  TAB_AUDITORIA: Byte = 1;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLColigadaCadastro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas.
  //
  pubDadosAtualizados := False;
  pubLicencaID        := 0;
  pubColigadaBaseID   := 0;
  pubColigadaID       := 0;
 
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
procedure TPlataformaERPVCLColigadaCadastro.FormShow(Sender: TObject);
begin
  //
  // Background do formulário.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Controla os componentes de exibição de cadastro.
  //
  VCLEditClickControlar(edtCodigoCadastrado,      False);
  VCLEditClickControlar(edtLicencaDescricao,      False);
  VCLEditClickControlar(edtColigadaBaseDescricao, False);
  VCLEditClickControlar(edtInsLocalDtHr,          False);
  VCLEditClickControlar(edtUpdLocalDtHr,          False);

  //
  // Se nenhuma chave foi passada então é um novo cadastro.
  //
  if (pubLicencaID = 0) and (pubColigadaBaseID = 0) and (pubColigadaID = 0) then
  begin
    FormularioNovo;
    Exit;
  end;

  //
  // Se foi passada uma chave então popula formulário.
  //
  if (pubLicencaID > 0) and (pubColigadaBaseID > 0) and (pubColigadaID > 0) then
  begin
    FormularioPopular(pubLicencaID, pubColigadaBaseID, pubColigadaID);
    FormularioControlar(False);
    Exit;
  end;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLColigadaCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click nas opções do menu.
//
procedure TPlataformaERPVCLColigadaCadastro.mniLogClick(Sender: TObject);
begin
  FormularioLogExibir;
end;

procedure TPlataformaERPVCLColigadaCadastro.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

procedure TPlataformaERPVCLColigadaCadastro.mniNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

procedure TPlataformaERPVCLColigadaCadastro.mniExcluirClick(Sender: TObject);
begin
  FormularioExcluir;
end;

procedure TPlataformaERPVCLColigadaCadastro.mniAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

procedure TPlataformaERPVCLColigadaCadastro.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

procedure TPlataformaERPVCLColigadaCadastro.mniCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

procedure TPlataformaERPVCLColigadaCadastro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLColigadaCadastro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "código".
//
procedure TPlataformaERPVCLColigadaCadastro.edtCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigo) then Exit;
end;

procedure TPlataformaERPVCLColigadaCadastro.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLColigadaCadastro.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLColigadaCadastro.edtCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigo) then Exit;
end;

//
// Evento de click no código sugerido.
//
procedure TPlataformaERPVCLColigadaCadastro.edtCodigoCadastradoClick(Sender: TObject);
var
  locFormulario      : TPlataformaERPVCLColigadaCadastro;
  locDadosAtualizados: Boolean;
begin
  locFormulario := TPlataformaERPVCLColigadaCadastro.Create(Self);

  locFormulario.pubLicencaID      := StringIntegerConverter(edtLicencaID.Text);
  locFormulario.pubColigadaBaseID := StringIntegerConverter(edtCodigoCadastradoBaseID.Text);
  locFormulario.pubColigadaID     := StringIntegerConverter(edtCodigoCadastradoID.Text);

  locFormulario.ShowModal;

  locDadosAtualizados := locFormulario.pubDadosAtualizados;

  locFormulario.Release;
  FreeAndNil(locFormulario);

  if locDadosAtualizados then
  begin
    FormularioCodigoSugerir;
  end;
end;

//
// Eventos do componente "descrição".
//
procedure TPlataformaERPVCLColigadaCadastro.edtDescricaoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtDescricao) then Exit;
end;

procedure TPlataformaERPVCLColigadaCadastro.edtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLColigadaCadastro.edtDescricaoExit(Sender: TObject);
begin
  if not VCLEditSair(edtDescricao) then Exit;
end;

//
// Eventos do componente "bloqueado".
//
procedure TPlataformaERPVCLColigadaCadastro.chkBloqueadoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkBloqueado) then Exit;
end;

procedure TPlataformaERPVCLColigadaCadastro.chkBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLColigadaCadastro.chkBloqueadoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkBloqueado) then Exit;
end;

//
// Ativo.
//
procedure TPlataformaERPVCLColigadaCadastro.chkAtivoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkAtivo) then Exit;
end;

procedure TPlataformaERPVCLColigadaCadastro.chkAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLColigadaCadastro.chkAtivoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkAtivo) then Exit;
end;

//
// Evento de click no título da licença.
//
procedure TPlataformaERPVCLColigadaCadastro.edtLicencaDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_LicencaCadastroExibir(StringIntegerConverter(edtLicencaID.Text));
end;

//
// Evento de click no título da base.
//
procedure TPlataformaERPVCLColigadaCadastro.edtColigadaBaseDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_BaseCadastroExibir(StringIntegerConverter(edtColigadaBaseID.Text));
end;

//
// Evento de click na data de criação.
//
procedure TPlataformaERPVCLColigadaCadastro.edtInsLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtInsLocalDtHr.Text));
end;

//
// Evento de click na data da última alteração.
//
procedure TPlataformaERPVCLColigadaCadastro.edtUpdLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtUpdLocalDtHr.Text));
end;

//
// Evento de click no botão "log alterações".
//
procedure TPlataformaERPVCLColigadaCadastro.btnLogClick(Sender: TObject);
begin
  FormularioLogExibir;
end;

//
// Evento de click no botão "novo".
//
procedure TPlataformaERPVCLColigadaCadastro.btnNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

//
// Evento de click no botão "alterar".
//
procedure TPlataformaERPVCLColigadaCadastro.btnAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

//
// Evento de click no botão "gravar".
//
procedure TPlataformaERPVCLColigadaCadastro.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLColigadaCadastro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "cancelar".
//
procedure TPlataformaERPVCLColigadaCadastro.btnCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLColigadaCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLColigadaCadastro.FormularioLimpar;
begin 
  //
  // Posiciona pagecontrole na primeira aba.
  //
  VCLPageControlInicializar(pagFormulario);

  // Limpa componentes da aba "cadastro".
  VCLEditLimpar    (edtCodigo);
  VCLEditLimpar    (edtDescricao);
  VCLCheckBoxLimpar(chkBloqueado);
  VCLCheckBoxLimpar(chkAtivo);

  VCLEditLimpar(edtCodigoCadastrado);
  VCLEditLimpar(edtCodigoCadastradoBaseID);
  VCLEditLimpar(edtCodigoCadastradoID);

  //
  // Limpa componentes da aba "auditoria".
  //
  VCLEditLimpar(edtLicencaID);
  VCLEditLimpar(edtLicencaDescricao);
  VCLEditLimpar(edtColigadaBaseID);
  VCLEditLimpar(edtColigadaBaseDescricao);
  VCLEditLimpar(edtColigadaID);
  VCLEditLimpar(edtInsLocalDtHr);
  VCLEditLimpar(edtUpdLocalDtHr);
  VCLEditLimpar(edtUpdContador);
end;

//
// Procedimento para controlar os componentes do formulário.
//
procedure TPlataformaERPVCLColigadaCadastro.FormularioControlar(argEditar: Boolean);
var
  locDadosPopulados: Boolean;
  locIdentificador : string;
begin
  //
  // Determina se existem dados populados no formulário.
  //
  locDadosPopulados := (StringIntegerConverter(edtColigadaID.Text) > 0);

  //
  // Controla os componentes do formulário.
  //
  VCLEditControlar(edtCodigo,    argEditar);
  VCLEditControlar(edtDescricao, argEditar);
  gbxOpcoes.Enabled := argEditar;

  //
  // Exibe o último código cadastrado somente se for um novo cadastro.
  //
  lblCodigoCadastrado.Visible := (argEditar) and (not locDadosPopulados);
  edtCodigoCadastrado.Visible := (argEditar) and (not locDadosPopulados);

  //
  // Controla os componentes de exibição de cadastro.
  //
  VCLEditClickControlar(edtLicencaDescricao,      True);
  VCLEditClickControlar(edtColigadaBaseDescricao, True);
  VCLEditClickControlar(edtInsLocalDtHr,          True);
  VCLEditClickControlar(edtUpdLocalDtHr,          True);

  //
  // Controla os itens de menu do formulário.
  //
  mniLog.Visible       := (not argEditar) and (locDadosPopulados);
  mniAtualizar.Visible := (not argEditar) and (locDadosPopulados);
  mniNovo.Visible      := (not argEditar);
  mniExcluir.Visible   := (not argEditar) and (locDadosPopulados);
  mniAlterar.Visible   := (not argEditar) and (locDadosPopulados);
  mniGravar.Visible    := argEditar;
  mniCancelar.Visible  := argEditar;
  mniMinimizar.Visible := True;
  mniFechar.Visible    := (not argEditar);

  //
  // Permissões de acesso por usuário.
  //
  tabCadastro.TabVisible  := Plataforma_ERP_UsuarioRotina('ERP_COLIGADA_CADASTRO_ABA_CADASTRO');
  tabAuditoria.TabVisible := Plataforma_ERP_UsuarioRotina('ERP_COLIGADA_CADASTRO_ABA_AUDITORIA');

  mniAtualizar.Visible := (mniAtualizar.Visible) and (Plataforma_ERP_UsuarioRotina('ERP_COLIGADA_CADASTRO_ATUALIZAR'));
  mniNovo.Visible      := (mniNovo.Visible)      and (Plataforma_ERP_UsuarioRotina('ERP_COLIGADA_CADASTRO_NOVO'));
  mniExcluir.Visible   := (mniExcluir.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_COLIGADA_CADASTRO_EXCLUIR'));
  mniAlterar.Visible   := (mniAlterar.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_COLIGADA_CADASTRO_ALTERAR'));

  //
  // Itens do menu adicional.
  //
  mniLog.Visible := (mniLog.Visible) and (Plataforma_ERP_UsuarioRotina('ERP_COLIGADA_CADASTRO_LOG'));

  mniAdicional.Visible := (mniLog.Visible);

  //
  // Botões.
  //
  btnLog.Visible       := mniLog.Visible;
  btnNovo.Visible      := mniNovo.Visible;
  btnAlterar.Visible   := mniAlterar.Visible;
  btnGravar.Visible    := mniGravar.Visible;
  btnMinimizar.Visible := mniMinimizar.Visible;
  btnCancelar.Visible  := mniCancelar.Visible;
  btnFechar.Visible    := mniFechar.Visible;

  //
  // Ajusta o título do formulário.
  //
  Self.Caption     := 'Coligada';
  locIdentificador := ': ' + edtDescricao.Text;

  if (not locDadosPopulados) and (argEditar) then Self.Caption := Self.Caption + ' - novo cadastro';
  if locDadosPopulados and argEditar         then Self.Caption := Self.Caption + ' - alterando cadastro'   + locIdentificador;
  if locDadosPopulados and (not argEditar)   then Self.Caption := Self.Caption + ' - consultando cadastro' + locIdentificador;
end;

//
// Procedimento para carregar e exibir o log de alterações do registro.
//
procedure TPlataformaERPVCLColigadaCadastro.FormularioLogExibir;
const
  PROCEDIMENTO_NOME: string = 'FormularioLogExibir';
  ERRO_MENSAGEM    : string = 'Impossível consultar dados sobre os logs do registro!';
var
  locADOConnection : TADOConnection;
  locADOQuery      : TADOQuery;
  locLogMensagem   : string;
  locLicencaID     : Integer;
  locColigadaBaseID: Integer;
  locColigadaID    : Integer;
begin
  //
  // Carrega chave do registro.
  //
  locLicencaID      := StringIntegerConverter(edtLicencaID.Text);
  locColigadaBaseID := StringIntegerConverter(edtColigadaBaseID.Text);
  locColigadaID     := StringIntegerConverter(edtColigadaID.Text);

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
  // Consulta dados da coligada.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                        ');
  locADOQuery.SQL.Add('  [coligada_log].[coligada_log_sq]   AS [sequencial],                         ');
  locADOQuery.SQL.Add('  [base].[base_id]                   AS [log_base_id],                        ');
  locADOQuery.SQL.Add('  [base].[descricao]                 AS [log_base_descricao],                 ');
  locADOQuery.SQL.Add('  [coligada_log].[log_local_dt_hr]   AS [log_local_dt_hr],                    ');
  locADOQuery.SQL.Add('  [coligada_log].[log_server_dt_hr]  AS [log_server_dt_hr],                   ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_id] AS [registro_acao_id],                   ');
  locADOQuery.SQL.Add('  [registro_acao].[descricao]        AS [registro_acao_descricao],            ');
  locADOQuery.SQL.Add('  [coligada_log].[host_name]         AS [host_name],                          ');
  locADOQuery.SQL.Add('  [coligada_log].[user_name]         AS [user_name],                          ');
  locADOQuery.SQL.Add('  [usuario].[usuario_base_id]        AS [usuario_base_id],                    ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id]             AS [usuario_id],                         ');
  locADOQuery.SQL.Add('  [usuario].[nome]                   AS [usuario_nome],                       ');
  locADOQuery.SQL.Add('  [coligada_log].[mensagem]          AS [mensagem],                           ');
  locADOQuery.SQL.Add('  [coligada_log].[dados]             AS [dados]                               ');
  locADOQuery.SQL.Add('FROM                                                                          ');
  locADOQuery.SQL.Add('  [coligada_log] WITH (NOLOCK)                                                ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                                             ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [coligada_log].[log_base_id]                        ');
  locADOQuery.SQL.Add('  INNER JOIN [registro_acao] WITH (NOLOCK)                                    ');
  locADOQuery.SQL.Add('    ON [registro_acao].[registro_acao_id] = [coligada_log].[registro_acao_id] ');
  locADOQuery.SQL.Add('  INNER JOIN [usuario] WITH (NOLOCK)                                          ');
  locADOQuery.SQL.Add('    ON [usuario].[licenca_id]      = [coligada_log].[licenca_id]          AND ');
  locADOQuery.SQL.Add('       [usuario].[usuario_base_id] = [coligada_log].[log_usuario_base_id] AND ');
  locADOQuery.SQL.Add('       [usuario].[usuario_id]      = [coligada_log].[log_usuario_id]          ');
  locADOQuery.SQL.Add('WHERE                                                                         ');
  locADOQuery.SQL.Add('  [coligada_log].[licenca_id]       = :licenca_id       AND                   ');
  locADOQuery.SQL.Add('  [coligada_log].[coligada_base_id] = :coligada_base_id AND                   ');
  locADOQuery.SQL.Add('  [coligada_log].[coligada_id]      = :coligada_id                            ');
  locADOQuery.SQL.Add('ORDER BY                                                                      ');
  locADOQuery.SQL.Add('  [coligada_log].[coligada_log_sq] ASC                                        ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('coligada_base_id').Value := locColigadaBaseID;
  locADOQuery.Parameters.ParamByName('coligada_id').Value      := locColigadaID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar registros da tabela [coligada_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Troca o cursor.
  //
  VCLCursorTrocar;  

  //
  // Exibe formulário.
  //
  if locADOQuery.RecordCount > 0 then
  begin
    Plataforma_ERP_VCL_LogRegistroExibir('Coligada: ' + edtDescricao.Text, locADOQuery);
  end;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);
end;

//
// Procedimento para atualizar os dados populados nos componentes do formulário.
//
procedure TPlataformaERPVCLColigadaCadastro.FormularioAtualizar;
begin
  //
  // Popula componentes com as informações do cadastro.
  //
  FormularioPopular(StringIntegerConverter(edtLicencaID.Text),
                    StringIntegerConverter(edtColigadaBaseID.Text),
                    StringIntegerConverter(edtColigadaID.Text));

  //
  // Controla a exibição dos componentes.
  //
  FormularioControlar(False);
end;

//
// Procedimento para iniciar a digitação de dados de um novo cadastro.
//
procedure TPlataformaERPVCLColigadaCadastro.FormularioNovo;
begin
  //
  // Limpa os componentes do formulário.
  //
  FormularioLimpar;

  //
  // Carrega conteúdo dos campos necessários.
  //
  edtLicencaID.Text             := IntegerStringConverter(gloLicencaID, True);
  edtLicencaDescricao.Text      := gloLicencaDescricao;
  edtColigadaBaseID.Text        := IntegerStringConverter(gloBaseID,    True);
  edtColigadaBaseDescricao.Text := gloBaseDescricao;
  edtColigadaID.Text            := STR_NOVO;
  chkAtivo.Checked              := True;

  //
  // Exibe o último código cadastrado.
  //
  FormularioCodigoSugerir;

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
procedure TPlataformaERPVCLColigadaCadastro.FormularioPopular(argLicencaID    : Integer;
                                                             argColigadaBaseID: Integer;
                                                             argColigadaID    : Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
  ERRO_MENSAGEM    : string = 'Impossível consultar dados da coligada!';
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
  // Consulta dados da coligada.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                  ');
  locADOQuery.SQL.Add('  [licenca].[licenca_id],                               ');
  locADOQuery.SQL.Add('  [licenca].[descricao] AS [licenca_descricao],         ');
  locADOQuery.SQL.Add('  [base].[base_id]      AS [coligada_base_id],          ');
  locADOQuery.SQL.Add('  [base].[descricao]    AS [coligada_base_descricao],   ');
  locADOQuery.SQL.Add('  [coligada].[coligada_id],                             ');
  locADOQuery.SQL.Add('  [coligada].[codigo],                                  ');
  locADOQuery.SQL.Add('  [coligada].[descricao],                               ');
  locADOQuery.SQL.Add('  [coligada].[bloqueado],                               ');
  locADOQuery.SQL.Add('  [coligada].[ativo],                                   ');
  locADOQuery.SQL.Add('  [coligada].[ins_local_dt_hr],                         ');
  locADOQuery.SQL.Add('  [coligada].[upd_local_dt_hr],                         ');
  locADOQuery.SQL.Add('  [coligada].[upd_contador]                             ');
  locADOQuery.SQL.Add('FROM                                                    ');
  locADOQuery.SQL.Add('  [coligada] WITH (NOLOCK)                              ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                       ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [coligada].[coligada_base_id] ');
  locADOQuery.SQL.Add('  INNER JOIN [licenca] WITH (NOLOCK)                    ');
  locADOQuery.SQL.Add('    ON [licenca].[licenca_id] = [coligada].[licenca_id] ');
  locADOQuery.SQL.Add('WHERE                                                   ');
  locADOQuery.SQL.Add('  [coligada].[licenca_id]       = :licenca_id       AND ');
  locADOQuery.SQL.Add('  [coligada].[coligada_base_id] = :coligada_base_id AND ');
  locADOQuery.SQL.Add('  [coligada].[coligada_id]      = :coligada_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value       := argLicencaID;
  locADOQuery.Parameters.ParamByName('coligada_base_id').Value := argColigadaBaseID;
  locADOQuery.Parameters.ParamByName('coligada_id').Value      := argColigadaID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [coligada]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Registro encontrado.
  //
  if locADOQuery.RecordCount > 0 then
  begin
    //
    // Carrega componentes.
    //
    edtCodigo.Text       := locADOQuery.FieldByName('codigo').AsString;
    edtDescricao.Text    := locADOQuery.FieldByName('descricao').AsString;
    chkBloqueado.Checked := StringBooleanConverter(locADOQuery.FieldByName('bloqueado').AsString);
    chkAtivo.Checked     := StringBooleanConverter(locADOQuery.FieldByName('ativo').AsString);

    edtLicencaID.Text             := locADOQuery.FieldByName('licenca_id').AsString;
    edtLicencaDescricao.Text      := locADOQuery.FieldByName('licenca_descricao').AsString;
    edtColigadaBaseID.Text        := locADOQuery.FieldByName('coligada_base_id').AsString;
    edtColigadaBaseDescricao.Text := locADOQuery.FieldByName('coligada_base_descricao').AsString;
    edtColigadaID.Text            := IntegerStringConverter(locADOQuery.FieldByName('coligada_id').AsInteger, True);
    edtInsLocalDtHr.Text          := DateTimeStringConverter(locADOQuery.FieldByName('ins_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn');
    edtUpdLocalDtHr.Text          := DateTimeStringConverter(locADOQuery.FieldByName('upd_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn');
    edtUpdContador.Text           := IntegerStringConverter(locADOQuery.FieldByName('upd_contador').AsInteger);
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
procedure TPlataformaERPVCLColigadaCadastro.FormularioAlterar;
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
procedure TPlataformaERPVCLColigadaCadastro.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioGravar';
  ERRO_MENSAGEM    : string = 'Impossível gravar dados da coligada!';
var                    
  locADOConnection     : TADOConnection;
  locADOQuery          : TADOQuery;
  locLogMensagem       : string;

  locInsert            : Boolean;
  locRegistroAcao      : Byte;
  locRegistroAcaoID    : Integer;
  locColigadaLogSq     : Integer;
  locColigadaLogMsg    : string;
  locColigadaLogDados  : string;

  locLicencaID         : Integer;
  locColigadaBaseID    : Integer;
  locColigadaID        : Integer;
  locCodigo            : string;
  locDescricao         : string;
  locBloqueado         : Boolean;
  locAtivo             : Boolean;
  locInsLocalDtHr      : TDateTime;
  locUpdLocalDtHr      : TDateTime;
  locUsuarioBaseID     : Integer;
  locUsuarioID         : Integer;
  locUpdContador       : Integer;
  locHostName          : string;
  locUserName          : string;
begin
  //
  // Determina se será um insert ou update.
  //
  if edtColigadaID.Text = STR_NOVO then
    locInsert := True
  else
    locInsert := False;

  //
  // Carrega variáveis com o conteúdo dos componentes.
  //
  locLicencaID      := StringIntegerConverter(edtLicencaID.Text);
  locColigadaBaseID := StringIntegerConverter(edtColigadaBaseID.Text);
  locColigadaID     := StringIntegerConverter(edtColigadaID.Text);
  locCodigo         := StringTrim(edtCodigo.Text);
  locDescricao      := StringTrim(edtDescricao.Text);
  locBloqueado      := chkBloqueado.Checked;
  locAtivo          := chkAtivo.Checked;
  locUsuarioBaseID  := gloUsuarioBaseID;
  locUsuarioID      := gloUsuarioID;
  locHostName       := HostNameRecuperar;
  locUserName       := UserNameRecuperar;
  locUpdContador    := StringIntegerConverter(edtUpdContador.Text);

  //
  // Consiste as informações.
  //
  if locCodigo = '' then
  begin
    VCLConsistenciaExibir('O código da coligada deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
    Exit;
  end;

  if locDescricao = '' then
  begin
    VCLConsistenciaExibir('A descrição da coligada deve ser informada!');
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
  // Determina se o código da coligada já existe no banco de dados para um outro registro.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                                            ');
  locADOQuery.SQL.Add('  1                                                     ');
  locADOQuery.SQL.Add('FROM                                                    ');
  locADOQuery.SQL.Add('  [coligada] WITH (NOLOCK)                              ');
  locADOQuery.SQL.Add('WHERE                                                   ');
  locADOQuery.SQL.Add('  [coligada].[licenca_id]       = :licenca_id       AND ');
  locADOQuery.SQL.Add('  [coligada].[coligada_base_id] = :coligada_base_id AND ');
  locADOQuery.SQL.Add('  [coligada].[codigo]           = :codigo           AND ');
  locADOQuery.SQL.Add('  [coligada].[coligada_id]     <> :coligada_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value       := locLicencaID;
  locADOQuery.Parameters.ParamByName('coligada_base_id').Value := locColigadaBaseID;
  locADOQuery.Parameters.ParamByName('codigo').Value           := locCodigo;
  locADOQuery.Parameters.ParamByName('coligada_id').Value      := locColigadaID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar o mesmo código da coligada em um outro registro!';
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
    locLogMensagem := 'O código "' + locCodigo + '" informado para a coligada já existe em algum outro cadastro!';
    Plataforma_ERP_Logar(False, ERRO_MENSAGEM, locLogMensagem, FONTE_NOME, PROCEDIMENTO_NOME);
    VCLConsistenciaExibir(ERRO_MENSAGEM, locLogMensagem);
    Exit;
  end;

  //
  // Consiste o contador do update.
  //
  if not locInsert then
  begin
    locADOQuery.Close;
    locADOQuery.SQL.Clear;
    locADOQuery.SQL.Add('SELECT                                                  ');
    locADOQuery.SQL.Add('  [coligada].[upd_contador]                             ');
    locADOQuery.SQL.Add('FROM                                                    ');
    locADOQuery.SQL.Add('  [coligada] WITH (NOLOCK)                              ');
    locADOQuery.SQL.Add('WHERE                                                   ');
    locADOQuery.SQL.Add('  [coligada].[licenca_id]       = :licenca_id       AND ');
    locADOQuery.SQL.Add('  [coligada].[coligada_base_id] = :coligada_base_id AND ');
    locADOQuery.SQL.Add('  [coligada].[coligada_id]      = :coligada_id          ');

    locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
    locADOQuery.Parameters.ParamByName('coligada_base_id').Value := locColigadaBaseID;
    locADOQuery.Parameters.ParamByName('coligada_id').Value      := locColigadaID;

    try
      locADOQuery.Open;
    except
      on locExcecao: Exception do
      begin
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualizações confere na tabela [coligada]!';
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
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE);
        Exit
      end;
    end;
  end;

  //
  // Determina o ID da ação e a mensagem para o log do registro.
  //
  if locInsert then
  begin
    locRegistroAcao   := REGISTRO_ACAO_CRIACAO;
    locColigadaLogMsg := MENSAGEM_REGISTRO_ACAO_CRIADO;
  end
  else
  begin
    locRegistroAcao   := REGISTRO_ACAO_ALTERACAO;
    locColigadaLogMsg := MENSAGEM_REGISTRO_ACAO_ALTERADO;
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
  // Determina o próximo ID da coligada.
  //
  if locInsert then
  begin
    try
      locColigadaID := Plataforma_ERP_ADO_NumeradorLicencaDeterminar(locADOConnection,
                                                                     locLicencaID,
                                                                     locColigadaBaseID,
                                                                     NUMERADOR_COLIGADA_ID,
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
        locLogMensagem := 'Impossível determinar o próximo numerador para a coligada!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
        Exit
      end;
    end;
  end;

  //
  // Grava dados na tabela coligada.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;

  if locInsert then
  begin
    //
    // Insere dados.
    //
    locADOQuery.SQL.Add('INSERT INTO [coligada] ( ');
    locADOQuery.SQL.Add('  [licenca_id],          ');
    locADOQuery.SQL.Add('  [coligada_base_id],    ');
    locADOQuery.SQL.Add('  [coligada_id],         ');
    locADOQuery.SQL.Add('  [codigo],              ');
    locADOQuery.SQL.Add('  [descricao],           ');
    locADOQuery.SQL.Add('  [bloqueado],           ');
    locADOQuery.SQL.Add('  [ativo],               ');
    locADOQuery.SQL.Add('  [ins_local_dt_hr],     ');
    locADOQuery.SQL.Add('  [ins_server_dt_hr],    ');
    locADOQuery.SQL.Add('  [ins_usuario_base_id], ');
    locADOQuery.SQL.Add('  [ins_usuario_id],      ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr],     ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr],    ');
    locADOQuery.SQL.Add('  [upd_usuario_base_id], ');
    locADOQuery.SQL.Add('  [upd_usuario_id],      ');
    locADOQuery.SQL.Add('  [upd_contador]         ');
    locADOQuery.SQL.Add(')                        ');
    locADOQuery.SQL.Add('VALUES (                 ');
    locADOQuery.SQL.Add('  :licenca_id,           '); // [licenca_id].
    locADOQuery.SQL.Add('  :coligada_base_id,     '); // [coligada_base_id].
    locADOQuery.SQL.Add('  :coligada_id,          '); // [coligada_id].
    locADOQuery.SQL.Add('  :codigo,               '); // [codigo].
    locADOQuery.SQL.Add('  :descricao,            '); // [descricao].
    locADOQuery.SQL.Add('  :bloqueado,            '); // [bloqueado].
    locADOQuery.SQL.Add('  :ativo,                '); // [ativo].
    locADOQuery.SQL.Add('  :local_dt_hr,          '); // [ins_local_dt_hr].
    locADOQuery.SQL.Add('  GETDATE(),             '); // [ins_server_dt_hr].
    locADOQuery.SQL.Add('  :usuario_base_id,      '); // [ins_usuario_base_id].
    locADOQuery.SQL.Add('  :usuario_id,           '); // [ins_usuario_id].
    locADOQuery.SQL.Add('  NULL,                  '); // [upd_local_dt_hr].
    locADOQuery.SQL.Add('  NULL,                  '); // [upd_server_dt_hr].
    locADOQuery.SQL.Add('  NULL,                  '); // [upd_usuario_base_id].
    locADOQuery.SQL.Add('  NULL,                  '); // [upd_usuario_id].
    locADOQuery.SQL.Add('  0                      '); // [upd_contador].
    locADOQuery.SQL.Add(')                        ');
  end
  else
  begin
    //
    // Atualiza dados.
    //
    locADOQuery.SQL.Add('UPDATE                                       ');
    locADOQuery.SQL.Add('  [coligada]                                 ');
    locADOQuery.SQL.Add('SET                                          ');
    locADOQuery.SQL.Add('  [codigo]              = :codigo,           ');
    locADOQuery.SQL.Add('  [descricao]           = :descricao,        ');
    locADOQuery.SQL.Add('  [bloqueado]           = :bloqueado,        ');
    locADOQuery.SQL.Add('  [ativo]               = :ativo,            ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr]     = :local_dt_hr,      ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr]    = GETDATE(),         ');
    locADOQuery.SQL.Add('  [upd_usuario_base_id] = :usuario_base_id,  ');
    locADOQuery.SQL.Add('  [upd_usuario_id]      = :usuario_id,       ');
    locADOQuery.SQL.Add('  [upd_contador]        = [upd_contador] + 1 ');
    locADOQuery.SQL.Add('WHERE                                        ');
    locADOQuery.SQL.Add('  [licenca_id]       = :licenca_id       AND ');
    locADOQuery.SQL.Add('  [coligada_base_id] = :coligada_base_id AND ');
    locADOQuery.SQL.Add('  [coligada_id]      = :coligada_id          ');
  end;

  //
  // Parâmetros.
  //
  locADOQuery.Parameters.ParamByName('licenca_id').Value       := locLicencaID;
  locADOQuery.Parameters.ParamByName('coligada_base_id').Value := locColigadaBaseID;
  locADOQuery.Parameters.ParamByName('coligada_id').Value      := locColigadaID;
  locADOQuery.Parameters.ParamByName('codigo').Value           := locCodigo;
  locADOQuery.Parameters.ParamByName('descricao').Value        := locDescricao;
  locADOQuery.Parameters.ParamByName('bloqueado').Value        := BooleanStringConverter(locBloqueado);
  locADOQuery.Parameters.ParamByName('ativo').Value            := BooleanStringConverter(locAtivo);
  locADOQuery.Parameters.ParamByName('local_dt_hr').Value      := Now;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value  := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value       := locUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [coligada]!';
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
  locADOQuery.SQL.Add('SELECT                                                  ');
  locADOQuery.SQL.Add('  [coligada].[ins_local_dt_hr],                         ');
  locADOQuery.SQL.Add('  [coligada].[upd_local_dt_hr],                         ');
  locADOQuery.SQL.Add('  [coligada].[upd_contador]                             ');
  locADOQuery.SQL.Add('FROM                                                    ');
  locADOQuery.SQL.Add('  [coligada]                                            ');
  locADOQuery.SQL.Add('WHERE                                                   ');
  locADOQuery.SQL.Add('  [coligada].[licenca_id]       = :licenca_id       AND ');
  locADOQuery.SQL.Add('  [coligada].[coligada_base_id] = :coligada_base_id AND ');
  locADOQuery.SQL.Add('  [coligada].[coligada_id]      = :coligada_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value       := locLicencaID;
  locADOQuery.Parameters.ParamByName('coligada_base_id').Value := locColigadaBaseID;
  locADOQuery.Parameters.ParamByName('coligada_id').Value      := locColigadaID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o novo contador de updates do registro na tabela [coligada]!';
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
  locColigadaLogDados := LogDadosGerar(locColigadaID);
  
  //
  // Determina o próximo sequencial da tabela coligada_log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                      ');
  locADOQuery.SQL.Add('  MAX([coligada_log].[coligada_log_sq]) AS [sequencial]     ');
  locADOQuery.SQL.Add('FROM                                                        ');
  locADOQuery.SQL.Add('  [coligada_log]                                            ');
  locADOQuery.SQL.Add('WHERE                                                       ');
  locADOQuery.SQL.Add('  [coligada_log].[licenca_id]       = :licenca_id       AND ');
  locADOQuery.SQL.Add('  [coligada_log].[coligada_base_id] = :coligada_base_id AND ');
  locADOQuery.SQL.Add('  [coligada_log].[coligada_id]      = :coligada_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value       := locLicencaID;
  locADOQuery.Parameters.ParamByName('coligada_base_id').Value := locColigadaBaseID;
  locADOQuery.Parameters.ParamByName('coligada_id').Value      := locColigadaID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o próximo sequencial para o registro na tabela [coligada_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  if locADOQuery.RecordCount <= 0 then
  begin
    locColigadaLogSq := 1;
  end
  else  
  begin
    locColigadaLogSq := locADOQuery.FieldByName('sequencial').AsInteger + 1;
  end; 

  //
  // Monta SQL para inserir dados na tabela de log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('INSERT INTO [coligada_log] (');
  locADOQuery.SQL.Add('  [licenca_id],             ');
  locADOQuery.SQL.Add('  [coligada_base_id],       ');
  locADOQuery.SQL.Add('  [coligada_id],            ');
  locADOQuery.SQL.Add('  [coligada_log_sq],        ');
  locADOQuery.SQL.Add('  [log_base_id],            ');
  locADOQuery.SQL.Add('  [log_local_dt_hr],        ');
  locADOQuery.SQL.Add('  [log_server_dt_hr],       ');
  locADOQuery.SQL.Add('  [registro_acao_id],       ');
  locADOQuery.SQL.Add('  [host_name],              ');
  locADOQuery.SQL.Add('  [user_name],              ');
  locADOQuery.SQL.Add('  [log_usuario_base_id],    ');
  locADOQuery.SQL.Add('  [log_usuario_id],         ');
  locADOQuery.SQL.Add('  [mensagem],               ');
  locADOQuery.SQL.Add('  [dados]                   ');
  locADOQuery.SQL.Add(')                           ');
  locADOQuery.SQL.Add('VALUES (                    ');
  locADOQuery.SQL.Add('  :licenca_id,              '); // [licenca_id].
  locADOQuery.SQL.Add('  :coligada_base_id,        '); // [coligada_base_id].
  locADOQuery.SQL.Add('  :coligada_id,             '); // [coligada_id].
  locADOQuery.SQL.Add('  :coligada_log_sq,         '); // [coligada_log_sq].
  locADOQuery.SQL.Add('  :log_base_id,             '); // [log_base_id].
  locADOQuery.SQL.Add('  :log_local_dt_hr,         '); // [log_local_dt_hr].
  locADOQuery.SQL.Add('  GETDATE(),                '); // [log_server_dt_hr].
  locADOQuery.SQL.Add('  :registro_acao_id,        '); // [registro_acao_id].
  locADOQuery.SQL.Add('  :host_name,               '); // [host_name].
  locADOQuery.SQL.Add('  :user_name,               '); // [user_name].
  locADOQuery.SQL.Add('  :log_usuario_base_id,     '); // [log_usuario_base_id].
  locADOQuery.SQL.Add('  :log_usuario_id,          '); // [log_usuario_id].
  locADOQuery.SQL.Add('  :mensagem,                '); // [mensagem].
  locADOQuery.SQL.Add('  :dados                    '); // [dados].
  locADOQuery.SQL.Add(')                           ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value          := locLicencaID;
  locADOQuery.Parameters.ParamByName('coligada_base_id').Value    := locColigadaBaseID;
  locADOQuery.Parameters.ParamByName('coligada_id').Value         := locColigadaID;
  locADOQuery.Parameters.ParamByName('coligada_log_sq').Value     := locColigadaLogSq;
  locADOQuery.Parameters.ParamByName('log_base_id').Value         := gloBaseID;
  locADOQuery.Parameters.ParamByName('log_local_dt_hr').Value     := Now;
  locADOQuery.Parameters.ParamByName('registro_acao_id').Value    := locRegistroAcaoID;
  locADOQuery.Parameters.ParamByName('host_name').Value           := locHostName;
  locADOQuery.Parameters.ParamByName('user_name').Value           := locUserName;
  locADOQuery.Parameters.ParamByName('log_usuario_base_id').Value := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('log_usuario_id').Value      := locUsuarioID;
  locADOQuery.Parameters.ParamByName('mensagem').Value            := locColigadaLogMsg;
  locADOQuery.Parameters.ParamByName('dados').Value               := locColigadaLogDados;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir/atualizar o registro na tabela [coligada_log]!';
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
  edtColigadaID.Text   := IntegerStringConverter(locColigadaID);
  edtInsLocalDtHr.Text := DateTimeStringConverter(locInsLocalDtHr, 'dd/mm/yyyy hh:nn');
  edtUpdLocalDtHr.Text := DateTimeStringConverter(locUpdLocalDtHr, 'dd/mm/yyyy hh:nn');
  edtUpdContador.Text  := IntegerStringConverter(locUpdContador);

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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, locColigadaID, locCodigo, 'coligada', locColigadaLogMsg, locColigadaLogDados);
  except
    on locExcecao: Exception do
    begin
      VCLErroExibir(locExcecao.Message);
    end;
  end;

  //
  // Coligada gravada!
  //
  VCLInformacaoExibir('Coligada gravada com sucesso!');
end;

//
// Procedimento para excluir os dados deste cadastro.
//
procedure TPlataformaERPVCLColigadaCadastro.FormularioExcluir;
const
  PROCEDIMENTO_NOME: string = 'FormularioExcluir';
  ERRO_MENSAGEM    : string = 'Impossível excluir dados da coligada!';
var
  locADOConnection   : TADOConnection;
  locADOQuery        : TADOQuery;
  locLogMensagem     : string;
  locLicencaID       : Integer;
  locColigadaBaseID  : Integer;
  locColigadaID      : Integer;
  locColigadaLogDados: string;
begin
  //
  // Carrega variáveis com o conteúdo dos componentes.
  //
  locLicencaID      := StringIntegerConverter(edtLicencaID.Text);
  locColigadaBaseID := StringIntegerConverter(edtColigadaBaseID.Text);
  locColigadaID     := StringIntegerConverter(edtColigadaID.Text);

  //
  // Log dados.
  //
  locColigadaLogDados := LogDadosGerar;

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
  // Query.
  //
  locADOQuery                := TADOQuery.Create(Self);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Deleta registro da tabela coligada_log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                                                 ');
  locADOQuery.SQL.Add('  [coligada_log]                                            ');
  locADOQuery.SQL.Add('WHERE                                                       ');
  locADOQuery.SQL.Add('  [coligada_log].[licenca_id]       = :licenca_id       AND ');
  locADOQuery.SQL.Add('  [coligada_log].[coligada_base_id] = :coligada_base_id AND ');
  locADOQuery.SQL.Add('  [coligada_log].[coligada_id]      = :coligada_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value       := locLicencaID;
  locADOQuery.Parameters.ParamByName('coligada_base_id').Value := locColigadaBaseID;
  locADOQuery.Parameters.ParamByName('coligada_id').Value      := locColigadaID;

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
      locLogMensagem := 'Ocorreu algum problema ao executar query para deletar os registros na tabela [coligada_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Comando SQL para excluir um registro da tabela coligada.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                                              ');
  locADOQuery.SQL.Add('  [coligada]                                             ');
  locADOQuery.SQL.Add('WHERE                                                    ');
  locADOQuery.SQL.Add('  [coligada].[licenca_id]       = :licenca_id       AND  ');
  locADOQuery.SQL.Add('  [coligada].[coligada_base_id] = :coligada_base_id AND  ');
  locADOQuery.SQL.Add('  [coligada].[coligada_id]      = :coligada_id           ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value       := locLicencaID;
  locADOQuery.Parameters.ParamByName('coligada_base_id').Value := locColigadaBaseID;
  locADOQuery.Parameters.ParamByName('coligada_id').Value      := locColigadaID;

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
      locLogMensagem := 'Ocorreu algum problema ao executar query para deletar os registros na tabela [coligada]!';
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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(REGISTRO_ACAO_EXCLUSAO, locColigadaID, edtCodigo.Text, 'coligada', 'Registro excluído com sucesso!', locColigadaLogDados);
  except
  end;
  VCLInformacaoExibir('Coligada excluída com sucesso!');
end;

//
// Procedimento para cancelar a edição dos dados do formulário.
//
procedure TPlataformaERPVCLColigadaCadastro.FormularioCancelar;
var
  locLicencaID    : Integer;
  locColigadaBaseID: Integer;
  locColigadaID    : Integer;
begin
  //
  // Carrega chave do registro que estava sendo editado.
  //
  locLicencaID      := StringIntegerConverter(edtLicencaID.Text);
  locColigadaBaseID := StringIntegerConverter(edtColigadaBaseID.Text);
  locColigadaID     := StringIntegerConverter(edtColigadaID.Text);

  //
  // Confirma com o usuário.
  //
  if locColigadaID = 0 then
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
  FormularioPopular(locLicencaID, locColigadaBaseID, locColigadaID);

  //
  // Componentes desligados para edição.
  //
  FormularioControlar(False);
end;

//
// Procedimento par sugerir o próximo código.
//
procedure TPlataformaERPVCLColigadaCadastro.FormularioCodigoSugerir;
const
  PROCEDIMENTO_NOME: string = 'FormularioCodigoSugerir';
  ERRO_MENSAGEM    : string = 'Impossível sugerir informações sobre o próximo código da coligada!';
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
  VCLEditLimpar(edtCodigoCadastradoBaseID);
  VCLEditLimpar(edtCodigoCadastradoID);

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
  // Consulta dados do código da coligada.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                            ');
  locADOQuery.SQL.Add('  [coligada].[coligada_base_id],        ');
  locADOQuery.SQL.Add('  [coligada].[coligada_id],             ');
  locADOQuery.SQL.Add('  [coligada].[codigo]                   ');
  locADOQuery.SQL.Add('FROM                                    ');
  locADOQuery.SQL.Add('  [coligada] WITH (NOLOCK)              ');
  locADOQuery.SQL.Add('WHERE                                   ');
  locADOQuery.SQL.Add('  [coligada].[licenca_id] = :licenca_id ');
  locADOQuery.SQL.Add('ORDER BY                                ');
  locADOQuery.SQL.Add('  [coligada].[ins_server_dt_hr] DESC,   ');
  locADOQuery.SQL.Add('  [coligada].[codigo] DESC              ');

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar último cadastro na tabela [coligada]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Registro encontrado então carrega componentes.
  //
  if locADOQuery.RecordCount > 0 then
  begin
    edtCodigoCadastrado.Text       := locADOQuery.FieldByName('codigo').AsString;
    edtCodigoCadastradoBaseID.Text := IntegerStringConverter(locADOQuery.FieldByName('coligada_base_id').AsInteger);
    edtCodigoCadastradoID.Text     := IntegerStringConverter(locADOQuery.FieldByName('coligada_id').AsInteger);

    VCLEditClickControlar(edtCodigoCadastrado, True);    
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
function TPlataformaERPVCLColigadaCadastro.LogDadosGerar(argColigadaID: Integer = 0): string;
var
  locColigadaID: Integer;
begin
  if argColigadaID <= 0 then
    locColigadaID := StringIntegerConverter(edtColigadaID.Text)
  else
    locColigadaID := argColigadaID;

  Result := '';
  LogDadosStringDescrever ('Licença',          edtLicencaID.Text,                 Result);
  LogDadosStringDescrever ('Base da coligada', edtColigadaBaseID.Text,            Result);
  LogDadosIntegerDescrever('ID da coligada',   locColigadaID,                     Result);
  LogDadosStringDescrever ('Código',           edtCodigo.Text,                    Result);
  LogDadosStringDescrever ('Descrição',        edtDescricao.Text,                 Result);
  LogDadosBooleanDescrever('Bloqueado',        chkBloqueado.Checked,              Result);
  LogDadosBooleanDescrever('Ativo',            chkAtivo.Checked,                  Result);
end;

end.
