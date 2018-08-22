//
// Arquivo..: Plataforma_ERP_VCL_PerfilUsuarioCadastro.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com o cadastro do perfil de usu�rio.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_PerfilUsuarioCadastro;

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
  TPlataformaERPVCLPerfilUsuarioCadastro = class(TForm)
    imgFormulario: TImage;
    pagFormulario: TPageControl;
    tabCadastro: TTabSheet;
    tabAuditoria: TTabSheet;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    lblDescricao: TLabel;
    edtDescricao: TEdit;
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
    lblPerfilUsuarioID: TLabel;
    edtPerfilUsuarioID: TEdit;
    lblPerfilUsuarioBase: TLabel;
    edtPerfilUsuarioBaseDescricao: TEdit;
    edtPerfilUsuarioBaseID: TEdit;
    lblLicenca: TLabel;
    edtLicencaDescricao: TEdit;
    edtLicencaID: TEdit;
    lblCodigoCadastrado: TLabel;
    edtCodigoCadastrado: TEdit;
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
    btnLog: TBitBtn;
    gbxOpcoes: TGroupBox;
    chkBloqueado: TCheckBox;
    chkAtivo: TCheckBox;
    mniLog: TMenuItem;
    edtCodigoCadastradoBaseID: TEdit;
    edtCodigoCadastradoID: TEdit;
    btnRotinas: TBitBtn;
    mniRotinas: TMenuItem;
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
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
    procedure edtPerfilUsuarioBaseDescricaoClick(Sender: TObject);
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
    procedure mniRotinasClick(Sender: TObject);
    procedure btnRotinasClick(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioControlar(argEditar: Boolean);
    procedure FormularioRotinas;
    procedure FormularioLogExibir;
    procedure FormularioAtualizar;
    procedure FormularioNovo;

    procedure FormularioPopular(argLicencaID          : Integer;
                                argPerfilUsuarioBaseID: Integer;
                                argPerfilUsuarioID    : Integer);

    procedure FormularioAlterar;
    procedure FormularioGravar;
    procedure FormularioCancelar;
    procedure FormularioExcluir;
    procedure FormularioCodigoSugerir;
    function  LogDadosGerar(argPerfilUsuarioID: Integer = 0): string;
  public
    pubDadosAtualizados   : Boolean;
    pubLicencaID          : Integer;
    pubPerfilUsuarioBaseID: Integer;
    pubPerfilUsuarioID    : Integer;
  end;

var
  PlataformaERPVCLPerfilUsuarioCadastro: TPlataformaERPVCLPerfilUsuarioCadastro;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico,
  Plataforma_ERP_VCL_PerfilUsuarioRotinaAplicacao;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_PerfilUsuarioCadastro.pas';

  TAB_CADASTRO : Byte = 0;
  TAB_AUDITORIA: Byte = 2;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas.
  //
  pubDadosAtualizados    := False;
  pubLicencaID           := 0;
  pubPerfilUsuarioBaseID := 0;
  pubPerfilUsuarioID     := 0;
 
  //
  // Limpa os componentes do formul�rio.
  //
  FormularioLimpar;

  //
  // Componentes desligados para edi��o.
  //
  FormularioControlar(False);
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.FormShow(Sender: TObject);
begin
  //
  // Background do formul�rio.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Controla os componentes de exibi��o de cadastro.
  //
  VCLEditClickControlar(edtCodigoCadastrado,           False);
  VCLEditClickControlar(edtLicencaDescricao,           False);
  VCLEditClickControlar(edtPerfilUsuarioBaseDescricao, False);
  VCLEditClickControlar(edtInsLocalDtHr,               False);
  VCLEditClickControlar(edtUpdLocalDtHr,               False);
  
  //
  // Se nenhuma chave foi passada ent�o � um novo cadastro.
  //
  if (pubLicencaID = 0) and (pubPerfilUsuarioBaseID = 0) and (pubPerfilUsuarioID = 0) then
  begin
    FormularioNovo;
    Exit;
  end;

  //
  // Se foi passada uma chave ent�o popula formul�rio.
  //
  if (pubLicencaID > 0) and (pubPerfilUsuarioBaseID > 0) and (pubPerfilUsuarioID > 0) then
  begin
    FormularioPopular(pubLicencaID, pubPerfilUsuarioBaseID, pubPerfilUsuarioID);
    FormularioControlar(False);
    Exit;
  end;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas op��es do menu.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.mniRotinasClick(Sender: TObject);
begin
  FormularioRotinas;
end;

procedure TPlataformaERPVCLPerfilUsuarioCadastro.mniLogClick(Sender: TObject);
begin
  FormularioLogExibir;
end;

procedure TPlataformaERPVCLPerfilUsuarioCadastro.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

procedure TPlataformaERPVCLPerfilUsuarioCadastro.mniNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

procedure TPlataformaERPVCLPerfilUsuarioCadastro.mniExcluirClick(Sender: TObject);
begin
  FormularioExcluir;
end;

procedure TPlataformaERPVCLPerfilUsuarioCadastro.mniAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

procedure TPlataformaERPVCLPerfilUsuarioCadastro.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

procedure TPlataformaERPVCLPerfilUsuarioCadastro.mniCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

procedure TPlataformaERPVCLPerfilUsuarioCadastro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLPerfilUsuarioCadastro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "c�digo".
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.edtCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigo) then Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioCadastro.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLPerfilUsuarioCadastro.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioCadastro.edtCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigo) then Exit;
end;

//
// Evento de click no c�digo sugerido.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.edtCodigoCadastradoClick(Sender: TObject);
var
  locFormulario      : TPlataformaERPVCLPerfilUsuarioCadastro;
  locDadosAtualizados: Boolean;
begin
  locFormulario := TPlataformaERPVCLPerfilUsuarioCadastro.Create(Self);

  locFormulario.pubLicencaID           := StringIntegerConverter(edtLicencaID.Text);
  locFormulario.pubPerfilUsuarioBaseID := StringIntegerConverter(edtCodigoCadastradoBaseID.Text);
  locFormulario.pubPerfilUsuarioID     := StringIntegerConverter(edtCodigoCadastradoID.Text);

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
// Eventos do componente "descri��o".
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.edtDescricaoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtDescricao) then Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioCadastro.edtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLPerfilUsuarioCadastro.edtDescricaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioCadastro.edtDescricaoExit(Sender: TObject);
begin
  if not VCLEditSair(edtDescricao) then Exit;
end;

//
// Eventos do componente "bloqueado".
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.chkBloqueadoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkBloqueado) then Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioCadastro.chkBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLPerfilUsuarioCadastro.chkBloqueadoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkBloqueado) then Exit;
end;

//
// Ativo.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.chkAtivoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkAtivo) then Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioCadastro.chkAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLPerfilUsuarioCadastro.chkAtivoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkAtivo) then Exit;
end;

//
// Evento de click no t�tulo da licen�a.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.edtLicencaDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_LicencaCadastroExibir(StringIntegerConverter(edtLicencaID.Text));
end;

//
// Evento de click no t�tulo da base.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.edtPerfilUsuarioBaseDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_BaseCadastroExibir(StringIntegerConverter(edtPerfilUsuarioBaseID.Text));
end;

//
// Evento de click na data de cria��o.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.edtInsLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtInsLocalDtHr.Text));
end;

//
// Evento de click na data da �ltima altera��o.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.edtUpdLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtUpdLocalDtHr.Text));
end;

//
// Evento de click no botao "rotinas".
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.btnRotinasClick(Sender: TObject);
begin
  FormularioRotinas;
end;

//
// Evento de click no bot�o "log altera��es".
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.btnLogClick(Sender: TObject);
begin
  FormularioLogExibir;
end;

//
// Evento de click no bot�o "novo".
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.btnNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

//
// Evento de click no bot�o "alterar".
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.btnAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

//
// Evento de click no bot�o "gravar".
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no bot�o "minimizar".
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "cancelar".
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.btnCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.FormularioLimpar;
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
  VCLEditLimpar(edtPerfilUsuarioBaseID);
  VCLEditLimpar(edtPerfilUsuarioBaseDescricao);
  VCLEditLimpar(edtPerfilUsuarioID);
  VCLEditLimpar(edtInsLocalDtHr);
  VCLEditLimpar(edtUpdLocalDtHr);
  VCLEditLimpar(edtUpdContador);
end;

//
// Procedimento para controlar os componentes do formul�rio.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.FormularioControlar(argEditar: Boolean);
var
  locDadosPopulados: Boolean;
  locIdentificador : string;
begin
  //
  // Determina se existem dados populados no formul�rio.
  //
  locDadosPopulados := (StringIntegerConverter(edtPerfilUsuarioID.Text) > 0);

  //
  // Controla os componentes do formul�rio.
  //
  VCLEditControlar(edtCodigo,    argEditar);
  VCLEditControlar(edtDescricao, argEditar);
  gbxOpcoes.Enabled := argEditar;

  //
  // Exibe o �ltimo c�digo cadastrado somente se for um novo cadastro.
  //
  lblCodigoCadastrado.Visible := (argEditar) and (not locDadosPopulados);
  edtCodigoCadastrado.Visible := (argEditar) and (not locDadosPopulados);

  //
  // Controla os componentes de exibi��o de cadastro.
  //
  VCLEditClickControlar(edtLicencaDescricao,           True);
  VCLEditClickControlar(edtPerfilUsuarioBaseDescricao, True);
  VCLEditClickControlar(edtInsLocalDtHr,               True);
  VCLEditClickControlar(edtUpdLocalDtHr,               True);

  //
  // Controla os itens de menu do formul�rio.
  //
  mniRotinas.Visible   := (not argEditar) and (locDadosPopulados);
  mniLog.Visible       := (not argEditar) and (locDadosPopulados);
  mniAtualizar.Visible := (not argEditar) and (locDadosPopulados);
  mniNovo.Visible      := (not argEditar);
  mniExcluir.Visible   := (not argEditar) and (locDadosPopulados);
  mniAlterar.Visible   := (not argEditar) and (locDadosPopulados);
  mniGravar.Visible    := (argEditar);
  mniCancelar.Visible  := (argEditar);
  mniMinimizar.Visible := True;
  mniFechar.Visible    := (not argEditar);

  //
  // Permiss�es de acesso por usu�rio.
  //
  tabCadastro.TabVisible  := Plataforma_ERP_UsuarioRotina('ERP_PERFIL_USUARIO_CADASTRO_ABA_CADASTRO');
  tabAuditoria.TabVisible := Plataforma_ERP_UsuarioRotina('ERP_PERFIL_USUARIO_CADASTRO_ABA_AUDITORIA');

  mniRotinas.Visible   := (mniRotinas.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_PERFIL_USUARIO_CADASTRO_ROTINAS'));
  mniLog.Visible       := (mniLog.Visible)       and (Plataforma_ERP_UsuarioRotina('ERP_PERFIL_USUARIO_CADASTRO_LOG'));
  mniAtualizar.Visible := (mniAtualizar.Visible) and (Plataforma_ERP_UsuarioRotina('ERP_PERFIL_USUARIO_CADASTRO_ATUALIZAR'));
  mniNovo.Visible      := (mniNovo.Visible)      and (Plataforma_ERP_UsuarioRotina('ERP_PERFIL_USUARIO_CADASTRO_NOVO'));
  mniExcluir.Visible   := (mniExcluir.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_PERFIL_USUARIO_CADASTRO_EXCLUIR'));
  mniAlterar.Visible   := (mniAlterar.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_PERFIL_USUARIO_CADASTRO_ALTERAR'));

  //
  // Bot�es.
  //
  btnRotinas.Visible   := mniRotinas.Visible;
  btnLog.Visible       := mniLog.Visible;
  btnNovo.Visible      := mniNovo.Visible;
  btnAlterar.Visible   := mniAlterar.Visible;
  btnGravar.Visible    := mniGravar.Visible;
  btnMinimizar.Visible := mniMinimizar.Visible;
  btnCancelar.Visible  := mniCancelar.Visible;
  btnFechar.Visible    := mniFechar.Visible;

  //
  // Ajusta o t�tulo do formul�rio.
  //
  Self.Caption     := 'Perfil de usu�rio';
  locIdentificador := ': ' + edtDescricao.Text;

  if (not locDadosPopulados) and (argEditar) then Self.Caption := Self.Caption + ' - novo cadastro';
  if locDadosPopulados and argEditar         then Self.Caption := Self.Caption + ' - alterando cadastro' + locIdentificador;
  if locDadosPopulados and (not argEditar)   then Self.Caption := Self.Caption + ' - consultando cadastro' + locIdentificador;
end;

//
// Procedimento para cadastrar as rotinas de acesso desse perfil.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.FormularioRotinas;
var
  locFormulario: TPlataformaERPVCLPerfilUsuarioRotinaAplicacao;
begin
  locFormulario := TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para carregar e exibir o log de altera��es do registro.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.FormularioLogExibir;
const
  PROCEDIMENTO_NOME: string = 'FormularioLogExibir';
  ERRO_MENSAGEM    : string = 'Imposs�vel consultar dados sobre os logs do registro!';
var
  locADOConnection      : TADOConnection;
  locADOQuery           : TADOQuery;
  locLogMensagem        : string;
  locLicencaID          : Integer;
  locPerfilUsuarioBaseID: Integer;
  locPerfilUsuarioID    : Integer;
begin
  //
  // Carrega chave do registro.
  //
  locLicencaID           := StringIntegerConverter(edtLicencaID.Text);
  locPerfilUsuarioBaseID := StringIntegerConverter(edtPerfilUsuarioBaseID.Text);
  locPerfilUsuarioID     := StringIntegerConverter(edtPerfilUsuarioID.Text);

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Conex�o ao banco de dados.
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
  // Consulta dados do perfil de usu�rio.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                              ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[perfil_usuario_log_sq] AS [sequencial],                     ');  
  locADOQuery.SQL.Add('  [base].[base_id]                             AS [log_base_id],                    ');
  locADOQuery.SQL.Add('  [base].[descricao]                           AS [log_base_descricao],             ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[log_local_dt_hr]       AS [log_local_dt_hr],                ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[log_server_dt_hr]      AS [log_server_dt_hr],               ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_id]           AS [registro_acao_id],               ');
  locADOQuery.SQL.Add('  [registro_acao].[descricao]                  AS [registro_acao_descricao],        ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[host_name]             AS [host_name],                      ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[user_name]             AS [user_name],                      ');
  locADOQuery.SQL.Add('  [usuario].[usuario_base_id]                  AS [usuario_base_id],                ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id]                       AS [usuario_id],                     ');
  locADOQuery.SQL.Add('  [usuario].[nome]                             AS [usuario_nome],                   ');  
  locADOQuery.SQL.Add('  [perfil_usuario_log].[mensagem]              AS [mensagem],                       ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[dados]                 AS [dados]                           ');
  locADOQuery.SQL.Add('FROM                                                                                ');  
  locADOQuery.SQL.Add('  [perfil_usuario_log] WITH (NOLOCK)                                                ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                                                   ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [perfil_usuario_log].[log_base_id]                        ');
  locADOQuery.SQL.Add('  INNER JOIN [registro_acao] WITH (NOLOCK)                                          ');
  locADOQuery.SQL.Add('    ON [registro_acao].[registro_acao_id] = [perfil_usuario_log].[registro_acao_id] ');
  locADOQuery.SQL.Add('  INNER JOIN [usuario] WITH (NOLOCK)                                                ');
  locADOQuery.SQL.Add('    ON [usuario].[licenca_id]      = [perfil_usuario_log].[licenca_id]          AND ');
  locADOQuery.SQL.Add('       [usuario].[usuario_base_id] = [perfil_usuario_log].[log_usuario_base_id] AND ');
  locADOQuery.SQL.Add('       [usuario].[usuario_id]      = [perfil_usuario_log].[log_usuario_id]          ');
  locADOQuery.SQL.Add('WHERE                                                                               ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[licenca_id]             = :licenca_id             AND       ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[perfil_usuario_base_id] = :perfil_usuario_base_id AND       ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[perfil_usuario_id]      = :perfil_usuario_id                ');
  locADOQuery.SQL.Add('ORDER BY                                                                            ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[perfil_usuario_log_sq] ASC                                  ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar registros da tabela [perfil_usuario_log]!';
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
  // Exibe formul�rio.
  //
  if locADOQuery.RecordCount > 0 then
  begin
    Plataforma_ERP_VCL_LogRegistroExibir('perfil de usu�rio: ' + edtDescricao.Text, locADOQuery);
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
// Procedimento para atualizar os dados populados nos componentes do formul�rio.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.FormularioAtualizar;
begin
  //
  // Popula componentes com as informa��es do cadastro.
  //
  FormularioPopular(StringIntegerConverter(edtLicencaID.Text),
                    StringIntegerConverter(edtPerfilUsuarioBaseID.Text),
                    StringIntegerConverter(edtPerfilUsuarioID.Text));

  //
  // Controla a exibi��o dos componentes.
  //
  FormularioControlar(False);
end;

//
// Procedimento para iniciar a digita��o de dados de um novo cadastro.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.FormularioNovo;
begin
  //
  // Limpa os componentes do formul�rio.
  //
  FormularioLimpar;

  //
  // Carrega conte�do dos campos necess�rios.
  //
  edtLicencaID.Text                  := IntegerStringConverter(gloLicencaID, True);
  edtLicencaDescricao.Text           := gloLicencaDescricao;
  edtPerfilUsuarioBaseID.Text        := IntegerStringConverter(gloBaseID,    True);
  edtPerfilUsuarioBaseDescricao.Text := gloBaseDescricao;
  edtPerfilUsuarioID.Text            := STR_NOVO;
  chkAtivo.Checked                   := True;

  //
  // Exibe o �ltimo c�digo cadastrado.
  //
  FormularioCodigoSugerir;

  //
  // Componentes ligados para edi��o.
  //
  FormularioControlar(True);
  
  //
  // Coloca o foco no c�digo.
  //
  VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
end;

//
// Procedimento para popular os componentes com os dados de um cadastro.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.FormularioPopular(argLicencaID          : Integer;
                                                                   argPerfilUsuarioBaseID: Integer;
                                                                   argPerfilUsuarioID    : Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
  ERRO_MENSAGEM    : string = 'Imposs�vel consultar dados do perfil de usu�rio!';
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
  // Limpa os componentes do formul�rio.
  //
  FormularioLimpar;

  //
  // Conex�o ao banco de dados.
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
  // Consulta dados do perfil de usu�rio.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                    ');
  locADOQuery.SQL.Add('  [licenca].[licenca_id] AS [licenca_id],                                 ');
  locADOQuery.SQL.Add('  [licenca].[descricao]  AS [licenca_descricao],                          ');
  locADOQuery.SQL.Add('  [base].[base_id]       AS [perfil_usuario_base_id],                     ');
  locADOQuery.SQL.Add('  [base].[descricao]     AS [perfil_usuario_base_descricao],              ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_id],                                   ');  
  locADOQuery.SQL.Add('  [perfil_usuario].[codigo],                                              ');
  locADOQuery.SQL.Add('  [perfil_usuario].[descricao],                                           ');
  locADOQuery.SQL.Add('  [perfil_usuario].[bloqueado],                                           ');
  locADOQuery.SQL.Add('  [perfil_usuario].[ativo],                                               ');
  locADOQuery.SQL.Add('  [perfil_usuario].[ins_local_dt_hr],                                     ');
  locADOQuery.SQL.Add('  [perfil_usuario].[upd_local_dt_hr],                                     ');
  locADOQuery.SQL.Add('  [perfil_usuario].[upd_contador]                                         ');  
  locADOQuery.SQL.Add('FROM                                                                      ');
  locADOQuery.SQL.Add('  [perfil_usuario] WITH (NOLOCK)                                          ');
  locADOQuery.SQL.Add('  INNER JOIN [licenca] WITH (NOLOCK)                                      ');
  locADOQuery.SQL.Add('    ON [licenca].[licenca_id] = [perfil_usuario].[licenca_id]             ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                                         ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [perfil_usuario].[perfil_usuario_base_id]       ');
  locADOQuery.SQL.Add('WHERE                                                                     ');
  locADOQuery.SQL.Add('  [perfil_usuario].[licenca_id]             = :licenca_id             AND ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_base_id] = :perfil_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_id]      = :perfil_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value             := argLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := argPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := argPerfilUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [perfil_usuario]!';
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

    edtLicencaID.Text                  := locADOQuery.FieldByName('licenca_id').AsString;
    edtLicencaDescricao.Text           := locADOQuery.FieldByName('licenca_descricao').AsString;
    edtPerfilUsuarioBaseID.Text        := locADOQuery.FieldByName('perfil_usuario_base_id').AsString;
    edtPerfilUsuarioBaseDescricao.Text := locADOQuery.FieldByName('perfil_usuario_base_descricao').AsString;
    edtPerfilUsuarioID.Text            := IntegerStringConverter(locADOQuery.FieldByName('perfil_usuario_id').AsInteger, True);
    edtInsLocalDtHr.Text               := DateTimeStringConverter(locADOQuery.FieldByName('ins_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn');
    edtUpdLocalDtHr.Text               := DateTimeStringConverter(locADOQuery.FieldByName('upd_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn');
    edtUpdContador.Text                := IntegerStringConverter(locADOQuery.FieldByName('upd_contador').AsInteger);
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
// Procedimento para alterar os dados do formul�rio.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.FormularioAlterar;
begin
  //
  // Componentes ligados para edi��o.
  //
  FormularioControlar(True);

  //
  // Coloca o foco no c�digo.
  //
  VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
end;

//
// Procedimento para gravar os dados do formul�rio.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioGravar';
  ERRO_MENSAGEM    : string = 'Imposs�vel gravar dados do perfil de usu�rio!';
var
  locADOConnection        : TADOConnection;
  locADOQuery             : TADOQuery;
  locLogMensagem          : string;

  locInsert               : Boolean;
  locRegistroAcao         : Byte;
  locRegistroAcaoID       : Integer;
  locPerfilUsuarioLogSq   : Integer;
  locPerfilUsuarioLogMsg  : string;
  locPerfilUsuarioLogDados: string;

  locLicencaID            : Integer;
  locPerfilUsuarioBaseID  : Integer;
  locPerfilUsuarioID      : Integer;
  locCodigo               : string;
  locDescricao            : string;
  locBloqueado            : Boolean;
  locAtivo                : Boolean;
  locInsLocalDtHr         : TDateTime;
  locUpdLocalDtHr         : TDateTime;
  locUsuarioBaseID        : Integer;
  locUsuarioID            : Integer;
  locUpdContador          : Integer;
  locHostName             : string;
  locUserName             : string;
begin
  //
  // Determina se ser� um insert ou update.
  //
  if edtPerfilUsuarioID.Text = STR_NOVO then
    locInsert := True
  else
    locInsert := False;

  //
  // Carrega vari�veis com o conte�do dos componentes.
  //
  locLicencaID           := StringIntegerConverter(edtLicencaID.Text);
  locPerfilUsuarioBaseID := StringIntegerConverter(edtPerfilUsuarioBaseID.Text);
  locPerfilUsuarioID     := StringIntegerConverter(edtPerfilUsuarioID.Text);
  locCodigo              := StringTrim(edtCodigo.Text);
  locDescricao           := StringTrim(edtDescricao.Text);
  locBloqueado           := chkBloqueado.Checked;
  locAtivo               := chkAtivo.Checked;
  locUsuarioBaseID       := gloUsuarioBaseID;
  locUsuarioID           := gloUsuarioID;
  locHostName            := HostNameRecuperar;
  locUserName            := UserNameRecuperar;
  locUpdContador         := StringIntegerConverter(edtUpdContador.Text);

  //
  // Consiste as informa��es.
  //
  if locCodigo = '' then
  begin
    VCLConsistenciaExibir('O c�digo do perfil de usu�rio deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
    Exit;
  end;

  if locDescricao = '' then
  begin
    VCLConsistenciaExibir('A descri��o do perfil de usu�rio deve ser informada!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtDescricao);
    Exit;
  end;

  //
  // Confirma grava��o com o usu�rio.
  //
  if not VCLQuestionamentoExibir('Deseja realmente gravar estes dados?') then Exit;

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Conex�o ao banco de dados.
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
  // Determina se o c�digo do perfil do usu�rio j� existe no banco de dados para um outro registro.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                                                              ');
  locADOQuery.SQL.Add('  1                                                                       ');
  locADOQuery.SQL.Add('FROM                                                                      ');
  locADOQuery.SQL.Add('  [perfil_usuario] WITH (NOLOCK)                                          ');
  locADOQuery.SQL.Add('WHERE                                                                     ');
  locADOQuery.SQL.Add('  [perfil_usuario].[licenca_id]             = :licenca_id             AND ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_base_id] = :perfil_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [perfil_usuario].[codigo]                 = :codigo                 AND ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_id]     <> :perfil_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('codigo').Value                 := locCodigo;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar o mesmo c�digo de perfil de usu�rio em um outro registro!';
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
    locLogMensagem := 'O c�digo "' + locCodigo + '" informado para o perfil de usu�rio j� existe em algum outro cadastro!';
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
    locADOQuery.SQL.Add('SELECT                                                                    ');
    locADOQuery.SQL.Add('  [perfil_usuario].[upd_contador]                                         ');
    locADOQuery.SQL.Add('FROM                                                                      ');
    locADOQuery.SQL.Add('  [perfil_usuario] WITH (NOLOCK)                                          ');
    locADOQuery.SQL.Add('WHERE                                                                     ');
    locADOQuery.SQL.Add('  [perfil_usuario].[licenca_id]             = :licenca_id             AND ');
    locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_base_id] = :perfil_usuario_base_id AND ');
    locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_id]      = :perfil_usuario_id          ');

    locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
    locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
    locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;

    try
      locADOQuery.Open;
    except
      on locExcecao: Exception do
      begin
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualiza��es confere na tabela [perfil_usuario]!';
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
        locLogMensagem := 'Esse registro sofreu alguma outra altera��o entre a sua consulta e essa grava��o!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE);
        Exit
      end;
    end;
  end;

  //
  // Determina o ID da a��o e a mensagem para o log do registro.
  //
  if locInsert then
  begin
    locRegistroAcao        := REGISTRO_ACAO_CRIACAO;
    locPerfilUsuarioLogMsg := MENSAGEM_REGISTRO_ACAO_CRIADO;
  end
  else
  begin
    locRegistroAcao        := REGISTRO_ACAO_ALTERACAO;
    locPerfilUsuarioLogMsg := MENSAGEM_REGISTRO_ACAO_ALTERADO;
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
  // Inicia transa��o com o banco de dados.
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
  // Determina o pr�ximo ID do perfil de usu�rio.
  //
  if locInsert then
  begin
    try
      locPerfilUsuarioID := Plataforma_ERP_ADO_NumeradorLicencaDeterminar(locADOConnection,
                                                                          locLicencaID,
                                                                          locPerfilUsuarioBaseID,
                                                                          NUMERADOR_PERFIL_USUARIO_ID,
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
        locLogMensagem := 'Imposs�vel determinar o pr�ximo numerador para o perfil de usu�rio!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
        Exit
      end;
    end;
  end;

  //
  // Grava dados na tabela perfil_usuario.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;

  if locInsert then
  begin
    //
    // Insere dados.
    //
    locADOQuery.SQL.Add('INSERT INTO [perfil_usuario] (');
    locADOQuery.SQL.Add('  [licenca_id],               ');
    locADOQuery.SQL.Add('  [perfil_usuario_base_id],   ');
    locADOQuery.SQL.Add('  [perfil_usuario_id],        ');
    locADOQuery.SQL.Add('  [codigo],                   ');
    locADOQuery.SQL.Add('  [descricao],                ');
    locADOQuery.SQL.Add('  [bloqueado],                ');
    locADOQuery.SQL.Add('  [ativo],                    ');
    locADOQuery.SQL.Add('  [ins_local_dt_hr],          ');
    locADOQuery.SQL.Add('  [ins_server_dt_hr],         ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr],          ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr],         ');
    locADOQuery.SQL.Add('  [upd_contador]              ');  
    locADOQuery.SQL.Add(')                             ');
    locADOQuery.SQL.Add('VALUES (                      ');
    locADOQuery.SQL.Add('  :licenca_id,                '); // [licenca_id].
    locADOQuery.SQL.Add('  :perfil_usuario_base_id,    '); // [perfil_usuario_base_id].
    locADOQuery.SQL.Add('  :perfil_usuario_id,         '); // [perfil_usuario_id].
    locADOQuery.SQL.Add('  :codigo,                    '); // [codigo].
    locADOQuery.SQL.Add('  :descricao,                 '); // [descricao].
    locADOQuery.SQL.Add('  :bloqueado,                 '); // [bloqueado].
    locADOQuery.SQL.Add('  :ativo,                     '); // [ativo].
    locADOQuery.SQL.Add('  :local_dt_hr,               '); // [ins_local_dt_hr].
    locADOQuery.SQL.Add('  GETDATE(),                  '); // [ins_server_dt_hr].
    locADOQuery.SQL.Add('  NULL,                       '); // [upd_local_dt_hr].
    locADOQuery.SQL.Add('  NULL,                       '); // [upd_server_dt_hr].
    locADOQuery.SQL.Add('  0                           '); // [upd_contador].
    locADOQuery.SQL.Add(')                             ');
  end
  else
  begin
    //
    // Atualiza dados.
    //
    locADOQuery.SQL.Add('UPDATE                                                   ');
    locADOQuery.SQL.Add('  [perfil_usuario]                                       ');
    locADOQuery.SQL.Add('SET                                                      ');
    locADOQuery.SQL.Add('  [codigo]           = :codigo,                          ');
    locADOQuery.SQL.Add('  [descricao]        = :descricao,                       ');
    locADOQuery.SQL.Add('  [bloqueado]        = :bloqueado,                       ');
    locADOQuery.SQL.Add('  [ativo]            = :ativo,                           ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr]  = :local_dt_hr,                     ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr] = GETDATE(),                        ');
    locADOQuery.SQL.Add('  [upd_contador]     = [upd_contador] + 1                ');
    locADOQuery.SQL.Add('WHERE                                                    ');
    locADOQuery.SQL.Add('  [licenca_id]             = :licenca_id             AND ');
    locADOQuery.SQL.Add('  [perfil_usuario_base_id] = :perfil_usuario_base_id AND ');
    locADOQuery.SQL.Add('  [perfil_usuario_id]      = :perfil_usuario_id          ');
  end;

  //
  // Par�metros.
  //
  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;
  locADOQuery.Parameters.ParamByName('codigo').Value                 := locCodigo;
  locADOQuery.Parameters.ParamByName('descricao').Value              := locDescricao;
  locADOQuery.Parameters.ParamByName('bloqueado').Value              := BooleanStringConverter(locBloqueado);
  locADOQuery.Parameters.ParamByName('ativo').Value                  := BooleanStringConverter(locAtivo);
  locADOQuery.Parameters.ParamByName('local_dt_hr').Value            := Now;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [perfil_usuario]!';
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
  locADOQuery.SQL.Add('SELECT                                                                    ');
  locADOQuery.SQL.Add('  [perfil_usuario].[ins_local_dt_hr],                                     ');
  locADOQuery.SQL.Add('  [perfil_usuario].[upd_local_dt_hr],                                     ');
  locADOQuery.SQL.Add('  [perfil_usuario].[upd_contador]                                         ');
  locADOQuery.SQL.Add('FROM                                                                      ');
  locADOQuery.SQL.Add('  [perfil_usuario]                                                        ');
  locADOQuery.SQL.Add('WHERE                                                                     ');
  locADOQuery.SQL.Add('  [perfil_usuario].[licenca_id]             = :licenca_id             AND ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_base_id] = :perfil_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_id]      = :perfil_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o novo contador de updates do registro na tabela [perfil_usuario]!';
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
  locPerfilUsuarioLogDados := LogDadosGerar(locPerfilUsuarioID);

  //
  // Determina o pr�ximo sequencial da tabela perfil_usuario_log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                        ');
  locADOQuery.SQL.Add('  MAX([perfil_usuario_log].[perfil_usuario_log_sq]) AS Sequencial             ');
  locADOQuery.SQL.Add('FROM                                                                          ');
  locADOQuery.SQL.Add('  [perfil_usuario_log]                                                        ');
  locADOQuery.SQL.Add('WHERE                                                                         ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[licenca_id]             = :licenca_id             AND ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[perfil_usuario_base_id] = :perfil_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[perfil_usuario_id]      = :perfil_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o pr�ximo sequencial para o registro na tabela [perfil_usuario_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  if locADOQuery.RecordCount <= 0 then
  begin
    locPerfilUsuarioLogSq := 1;
  end
  else  
  begin
    locPerfilUsuarioLogSq := locADOQuery.FieldByName('Sequencial').AsInteger + 1;
  end; 

  //
  // Monta SQL para inserir dados na tabela de log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('INSERT INTO [perfil_usuario_log] (');
  locADOQuery.SQL.Add('  [licenca_id],                   ');
  locADOQuery.SQL.Add('  [perfil_usuario_base_id],       ');
  locADOQuery.SQL.Add('  [perfil_usuario_id],            ');
  locADOQuery.SQL.Add('  [perfil_usuario_log_sq],        ');
  locADOQuery.SQL.Add('  [log_base_id],                  ');
  locADOQuery.SQL.Add('  [log_local_dt_hr],              ');
  locADOQuery.SQL.Add('  [log_server_dt_hr],             ');
  locADOQuery.SQL.Add('  [registro_acao_id],             ');
  locADOQuery.SQL.Add('  [host_name],                    ');
  locADOQuery.SQL.Add('  [user_name],                    ');
  locADOQuery.SQL.Add('  [log_usuario_base_id],          ');
  locADOQuery.SQL.Add('  [log_usuario_id],               ');
  locADOQuery.SQL.Add('  [mensagem],                     ');  
  locADOQuery.SQL.Add('  [dados]                         ');
  locADOQuery.SQL.Add(')                                 ');
  locADOQuery.SQL.Add('VALUES (                          ');
  locADOQuery.SQL.Add('  :licenca_id,                    '); // [licenca_id].
  locADOQuery.SQL.Add('  :perfil_usuario_base_id,        '); // [perfil_usuario_base_id].
  locADOQuery.SQL.Add('  :perfil_usuario_id,             '); // [perfil_usuario_id].
  locADOQuery.SQL.Add('  :perfil_usuario_log_sq,         '); // [perfil_usuario_log_sq].
  locADOQuery.SQL.Add('  :log_base_id,                   '); // [log_base_id].
  locADOQuery.SQL.Add('  :log_local_dt_hr,               '); // [log_local_dt_hr].
  locADOQuery.SQL.Add('  GETDATE(),                      '); // [log_server_dt_hr].
  locADOQuery.SQL.Add('  :registro_acao_id,              '); // [registro_acao_id].
  locADOQuery.SQL.Add('  :host_name,                     '); // [host_name].
  locADOQuery.SQL.Add('  :user_name,                     '); // [user_name].
  locADOQuery.SQL.Add('  :log_usuario_base_id,           '); // [log_usuario_base_id].
  locADOQuery.SQL.Add('  :log_usuario_id,                '); // [log_usuario_id].
  locADOQuery.SQL.Add('  :mensagem,                      '); // [mensagem].
  locADOQuery.SQL.Add('  :dados                          '); // [dados].
  locADOQuery.SQL.Add(')                                 ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_log_sq').Value  := locPerfilUsuarioLogSq;
  locADOQuery.Parameters.ParamByName('log_base_id').Value            := gloBaseID;
  locADOQuery.Parameters.ParamByName('log_local_dt_hr').Value        := Now;
  locADOQuery.Parameters.ParamByName('registro_acao_id').Value       := locRegistroAcaoID;
  locADOQuery.Parameters.ParamByName('host_name').Value              := locHostName;
  locADOQuery.Parameters.ParamByName('user_name').Value              := locUserName;
  locADOQuery.Parameters.ParamByName('log_usuario_base_id').Value    := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('log_usuario_id').Value         := locUsuarioID;
  locADOQuery.Parameters.ParamByName('mensagem').Value               := locPerfilUsuarioLogMsg;
  locADOQuery.Parameters.ParamByName('dados').Value                  := locPerfilUsuarioLogDados;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir/atualizar o registro na tabela [perfil_usuario_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  //
  // Finaliza transa��o com o banco de dados.
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
  // Atualiza componentes que sofreram altera��o com a grava��o.
  //
  edtPerfilUsuarioID.Text := IntegerStringConverter(locPerfilUsuarioID);
  edtInsLocalDtHr.Text    := DateTimeStringConverter(locInsLocalDtHr, 'dd/mm/yyyy hh:nn');
  edtUpdLocalDtHr.Text    := DateTimeStringConverter(locUpdLocalDtHr, 'dd/mm/yyyy hh:nn');
  edtUpdContador.Text     := IntegerStringConverter(locUpdContador);

  //
  // Componentes desligados para edi��o.
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
  // Grava log de ocorr�ncia.
  //  
  try
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, locPerfilUsuarioID, locCodigo, 'perfil_usuario', locPerfilUsuarioLogMsg, locPerfilUsuarioLogDados);
  except
    on locExcecao: Exception do
    begin
      VCLErroExibir(locExcecao.Message);
    end;
  end;

  //
  // Perfil de usu�rio gravado!
  //
  VCLInformacaoExibir('Perfil de usu�rio gravado com sucesso!');
end;

//
// Procedimento para excluir os dados deste cadastro.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.FormularioExcluir;
const
  PROCEDIMENTO_NOME: string = 'FormularioExcluir';
  ERRO_MENSAGEM    : string = 'Imposs�vel excluir dados do perfil de usu�rio!';
var
  locADOConnection        : TADOConnection;
  locADOQuery             : TADOQuery;
  locLogMensagem          : string;
  locLicencaID            : Integer;
  locPerfilUsuarioBaseID  : Integer;
  locPerfilUsuarioID      : Integer;
  locPerfilUsuarioLogDados: string;
begin
  //
  // Carrega vari�veis com o conte�do dos componentes.
  //
  locLicencaID           := StringIntegerConverter(edtLicencaID.Text);
  locPerfilUsuarioBaseID := StringIntegerConverter(edtPerfilUsuarioBaseID.Text);
  locPerfilUsuarioID     := StringIntegerConverter(edtPerfilUsuarioID.Text);

  //
  // Log dados.
  //
  locPerfilUsuarioLogDados := LogDadosGerar;

  //
  // Confirma grava��o com o usu�rio.
  //
  if not VCLQuestionamentoExibir('Deseja realmente excluir estes dados?') then Exit;
  if not VCLQuestionamentoExibir('Tem certeza?') then Exit;

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Conex�o ao banco de dados.
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

{
  //
  // Verifica se existem registros na tabela de usu�rio que impediriam a exclus�o.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                                                              ');
  locADOQuery.SQL.Add('  [usuario_perfil].[nome]                                                 ');
  locADOQuery.SQL.Add('FROM                                                                      ');
  locADOQuery.SQL.Add('  [usuario_perfil] WITH (NOLOCK)                                          ');
  locADOQuery.SQL.Add('WHERE                                                                     ');
  locADOQuery.SQL.Add('  [usuario_perfil].[licenca_id]             = :licenca_id             AND ');
  locADOQuery.SQL.Add('  [usuario_perfil].[perfil_usuario_base_id] = :perfil_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [usuario_perfil].[perfil_usuario_id]      = :perfil_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar a query para verificar se o perfil de usu�rio existe para algum outro cadastro!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE, locExcecao.Message);
      Exit
    end;
  end;

  if locADOQuery.RecordCount > 0 then
  begin
    locLogMensagem := 'Esse perfil de usu�rio existe no cadastro de usu�rio de "' + locADOQuery.FieldByName('nome').AsString + '"!';
    
    locADOQuery.Close;
    FreeAndNil(locADOQuery);
    locADOConnection.Close;
    FreeAndNil(locADOConnection);

    VCLConsistenciaExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_CONSISTENCIA_EXCLUSAO);
    Exit;
  end;
}

  //
  // Inicia transa��o com o banco de dados.
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
  // Deleta registro da tabela perfil_usuario_log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                                                                   ');
  locADOQuery.SQL.Add('  [perfil_usuario_log]                                                        ');
  locADOQuery.SQL.Add('WHERE                                                                         ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[licenca_id]             = :licenca_id             AND ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[perfil_usuario_base_id] = :perfil_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[perfil_usuario_id]      = :perfil_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;

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
      locLogMensagem := 'Ocorreu algum problema ao executar query para deletar os registros na tabela [perfil_usuario_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Comando SQL para excluir um registro da tabela perfil_usuario.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                                                               ');
  locADOQuery.SQL.Add('  [perfil_usuario]                                                        ');
  locADOQuery.SQL.Add('WHERE                                                                     ');
  locADOQuery.SQL.Add('  [perfil_usuario].[licenca_id]             = :licenca_id             AND ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_base_id] = :perfil_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_id]      = :perfil_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;

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
      locLogMensagem := 'Ocorreu algum problema ao executar query para deletar os registros na tabela [perfil_usuario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Finaliza transa��o com o banco de dados.
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
  // Limpa os componentes do formul�rio.
  //
  FormularioLimpar;

  //
  // Desliga os componentes para edi��o e ajusta a visibilidade dos bot�es.
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
  // Log de ocorr�ncia.
  //
  try
    Plataforma_ERP_ADO_LogOcorrenciaInserir(REGISTRO_ACAO_EXCLUSAO, locPerfilUsuarioID, edtCodigo.Text, 'perfil_usuario', 'Registro exclu�do com sucesso!', locPerfilUsuarioLogDados);
  except
  end;
  VCLInformacaoExibir('Perfil de usu�rio exclu�do com sucesso!');
end;

//
// Procedimento para cancelar a edi��o dos dados do formul�rio.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.FormularioCancelar;
var
  locLicencaID          : Integer;
  locPerfilUsuarioBaseID: Integer;
  locPerfilUsuarioID    : Integer;
begin
  //
  // Carrega chave do registro que estava sendo editado.
  //
  locLicencaID           := StringIntegerConverter(edtLicencaID.Text);
  locPerfilUsuarioBaseID := StringIntegerConverter(edtPerfilUsuarioBaseID.Text);
  locPerfilUsuarioID     := StringIntegerConverter(edtPerfilUsuarioID.Text);

  //
  // Confirma com o usu�rio.
  //
  if locPerfilUsuarioID = 0 then
  begin
    if not VCLQuestionamentoExibir('Deseja realmente cancelar a digita��o destes dados?') then Exit;
  end
  else
  begin
    if not VCLQuestionamentoExibir('Deseja realmente cancelar a altera��o destes dados?') then Exit;
  end;

  //
  // Popula somente os dados.
  //
  FormularioPopular(locLicencaID, locPerfilUsuarioBaseID, locPerfilUsuarioID);

  //
  // Componentes desligados para edi��o.
  //
  FormularioControlar(False);
end;

//
// Procedimento par sugerir o pr�ximo c�digo.
//
procedure TPlataformaERPVCLPerfilUsuarioCadastro.FormularioCodigoSugerir;
const
  PROCEDIMENTO_NOME: string = 'FormularioCodigoSugerir';
  ERRO_MENSAGEM    : string = 'Imposs�vel sugerir informa��es sobre o pr�ximo c�digo do perfil de usu�rio!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
  locLicencaID    : Integer;
begin
  //
  // ID da licen�a.
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
  // Conex�o ao banco de dados.
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
  // Consulta dados do c�digo do perfil de usu�rio.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                                  ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_base_id],  ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_id],       ');
  locADOQuery.SQL.Add('  [perfil_usuario].[codigo]                   ');
  locADOQuery.SQL.Add('FROM                                          ');
  locADOQuery.SQL.Add('  [perfil_usuario] WITH (NOLOCK)              ');
  locADOQuery.SQL.Add('WHERE                                         ');
  locADOQuery.SQL.Add('  [perfil_usuario].[licenca_id] = :licenca_id ');
  locADOQuery.SQL.Add('ORDER BY                                      ');
  locADOQuery.SQL.Add('  [perfil_usuario].[ins_server_dt_hr] DESC,   ');
  locADOQuery.SQL.Add('  [perfil_usuario].[codigo] DESC              ');

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar �ltimo cadastro na tabela [perfil_usuario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Registro encontrado ent�o carrega componentes.
  //
  if locADOQuery.RecordCount >= 0 then
  begin
    edtCodigoCadastrado.Text       := locADOQuery.FieldByName('codigo').AsString;
    edtCodigoCadastradoBaseID.Text := IntegerStringConverter(locADOQuery.FieldByName('perfil_usuario_base_id').AsInteger);
    edtCodigoCadastradoID.Text     := IntegerStringConverter(locADOQuery.FieldByName('perfil_usuario_id').AsInteger);

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
// Fun��o para gerar a string de log dos dados.
//
function TPlataformaERPVCLPerfilUsuarioCadastro.LogDadosGerar(argPerfilUsuarioID: Integer = 0): string;
var
  locPerfilUsuarioID: Integer;
begin
  if argPerfilUsuarioID <= 0 then
    locPerfilUsuarioID := StringIntegerConverter(edtPerfilUsuarioID.Text)
  else
    locPerfilUsuarioID := argPerfilUsuarioID;

  Result := '';
  LogDadosStringDescrever ('Licen�a',                   edtLicencaID.Text,           Result);
  LogDadosStringDescrever ('Base do perfil de usu�rio', edtPerfilUsuarioBaseID.Text, Result);
  LogDadosIntegerDescrever('ID do perfil de usu�rio',   locPerfilUsuarioID,          Result);
  LogDadosStringDescrever ('C�digo',                    edtCodigo.Text,              Result);
  LogDadosStringDescrever ('Descri��o',                 edtDescricao.Text,           Result);
  LogDadosBooleanDescrever('Bloqueado',                 chkBloqueado.Checked,        Result);
  LogDadosBooleanDescrever('Ativo',                     chkAtivo.Checked,            Result);
end;

end.
