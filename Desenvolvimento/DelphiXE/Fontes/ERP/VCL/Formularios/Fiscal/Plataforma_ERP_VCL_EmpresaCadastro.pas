//
// Arquivo..: Plataforma_ERP_VCL_EmpresaCadastro.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com o cadastro de empresa.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_EmpresaCadastro;

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
  TPlataformaERPVCLEmpresaCadastro = class(TForm)
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
    lblEmpresaID: TLabel;
    edtEmpresaID: TEdit;
    lblEmpresaBase: TLabel;
    edtEmpresaBaseDescricao: TEdit;
    edtEmpresaBaseID: TEdit;
    lblLicenca: TLabel;
    edtLicencaDescricao: TEdit;
    edtLicencaID: TEdit;
    lblCodigoCadastrado: TLabel;
    edtCodigoCadastrado: TEdit;
    imgBackground: TImage;
    lblRegimeTributario: TLabel;
    edtRegimeTributarioCodigo: TEdit;
    edtRegimeTributarioDescricao: TEdit;
    edtRegimeTributarioID: TEdit;
    imgRegimeTributarioSelecionar: TImage;
    edtRegimeTributarioBaseID: TEdit;
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
    btnSenha: TBitBtn;
    mniCadastroRegimeTributario: TMenuItem;
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
    procedure edtEmpresaBaseDescricaoClick(Sender: TObject);
    procedure edtInsLocalDtHrClick(Sender: TObject);
    procedure edtUpdLocalDtHrClick(Sender: TObject);
    procedure edtRegimeTributarioCodigoEnter(Sender: TObject);
    procedure edtRegimeTributarioCodigoExit(Sender: TObject);
    procedure edtRegimeTributarioCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtRegimeTributarioCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure imgRegimeTributarioSelecionarClick(Sender: TObject);
    procedure edtRegimeTributarioDescricaoClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure mniCancelarClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
    procedure mniGravarClick(Sender: TObject);
    procedure mniAlterarClick(Sender: TObject);
    procedure mniExcluirClick(Sender: TObject);
    procedure mniNovoClick(Sender: TObject);
    procedure mniAtualizarClick(Sender: TObject);
    procedure edtLogonEnter(Sender: TObject);
    procedure edtLogonExit(Sender: TObject);
    procedure edtLogonKeyPress(Sender: TObject; var Key: Char);
    procedure btnSenhaClick(Sender: TObject);
    procedure mniLogClick(Sender: TObject);
    procedure edtCodigoCadastradoClick(Sender: TObject);
    procedure lvwPerfilCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwPerfilCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwPerfilDblClick(Sender: TObject);
    procedure lvwPerfilKeyPress(Sender: TObject; var Key: Char);
    procedure btnPerfisClick(Sender: TObject);
    procedure imgAdministradorOnClick(Sender: TObject);
    procedure medVigenciaIniDtHrEnter(Sender: TObject);
    procedure medVigenciaIniDtHrExit(Sender: TObject);
    procedure medVigenciaIniDtHrKeyPress(Sender: TObject; var Key: Char);
    procedure medVigenciaIniDtHrKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure medVigenciaFimDtHrEnter(Sender: TObject);
    procedure medVigenciaFimDtHrExit(Sender: TObject);
    procedure medVigenciaFimDtHrKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure medVigenciaFimDtHrKeyPress(Sender: TObject; var Key: Char);
    procedure imgVigenciaIniDtHrClick(Sender: TObject);
    procedure imgVigenciaFimDtHrClick(Sender: TObject);
    procedure chkVigenciaClick(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioControlar(argEditar: Boolean);
    procedure FormularioLogExibir;

    procedure FormularioAtualizar;
    procedure FormularioNovo;

    procedure FormularioPopular(argLicencaID    : Integer;
                                argEmpresaBaseID: Integer;
                                argEmpresaID    : Integer);

    procedure FormularioAlterar;
    procedure FormularioGravar;
    procedure FormularioCancelar;
    procedure FormularioExcluir;
    procedure FormularioCodigoSugerir;

    function LogDadosGerar(argEmpresaID: Integer = 0): string;
  public
    pubDadosAtualizados: Boolean;
    pubLicencaID       : Integer;
    pubEmpresaBaseID   : Integer;
    pubEmpresaID       : Integer;
  end;

var
  PlataformaERPVCLEmpresaCadastro: TPlataformaERPVCLEmpresaCadastro;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_EmpresaCadastro.pas';

  TAB_CADASTRO : Byte = 0;
  TAB_AUDITORIA: Byte = 1;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLEmpresaCadastro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas.
  //
  pubDadosAtualizados := False;
  pubLicencaID        := 0;
  pubEmpresaBaseID    := 0;
  pubEmpresaID        := 0;
 
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
procedure TPlataformaERPVCLEmpresaCadastro.FormShow(Sender: TObject);
begin
  //
  // Background do formul�rio.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Controla os componentes de exibi��o de cadastro.
  //
  VCLEditClickControlar(edtCodigoCadastrado,          False);
  VCLEditClickControlar(edtRegimeTributarioDescricao, False);
  VCLEditClickControlar(edtLicencaDescricao,          False);
  VCLEditClickControlar(edtUsuarioBaseDescricao,      False);
  VCLEditClickControlar(edtInsLocalDtHr,              False);
  VCLEditClickControlar(edtUpdLocalDtHr,              False);

  //
  // Se nenhuma chave foi passada ent�o � um novo cadastro.
  //
  if (pubLicencaID = 0) and (pubEmpresaBaseID = 0) and (pubEmpresaID = 0) then
  begin
    FormularioNovo;
    Exit;
  end;

  //
  // Se foi passada uma chave ent�o popula formul�rio.
  //
  if (pubLicencaID > 0) and (pubEmpresaBaseID > 0) and (pubEmpresaID > 0) then
  begin
    FormularioPopular(pubLicencaID, pubEmpresaBaseID, pubEmpresaID);
    FormularioControlar(False);
    Exit;
  end;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLEmpresaCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click nas op��es do menu.
//
procedure TPlataformaERPVCLEmpresaCadastro.mniLogClick(Sender: TObject);
begin
  FormularioLogExibir;
end;

procedure TPlataformaERPVCLEmpresaCadastro.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

procedure TPlataformaERPVCLEmpresaCadastro.mniNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

procedure TPlataformaERPVCLEmpresaCadastro.mniExcluirClick(Sender: TObject);
begin
  FormularioExcluir;
end;

procedure TPlataformaERPVCLEmpresaCadastro.mniAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

procedure TPlataformaERPVCLEmpresaCadastro.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

procedure TPlataformaERPVCLEmpresaCadastro.mniCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

procedure TPlataformaERPVCLEmpresaCadastro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLEmpresaCadastro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "c�digo".
//
procedure TPlataformaERPVCLEmpresaCadastro.edtCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigo) then Exit;
end;

procedure TPlataformaERPVCLEmpresaCadastro.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLEmpresaCadastro.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLEmpresaCadastro.edtCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigo) then Exit;
end;

//
// Evento de click no c�digo sugerido.
//
procedure TPlataformaERPVCLEmpresaCadastro.edtCodigoCadastradoClick(Sender: TObject);
var
  locFormulario      : TPlataformaERPVCLEmpresaCadastro;
  locDadosAtualizados: Boolean;
begin
  locFormulario := TPlataformaERPVCLEmpresaCadastro.Create(Self);

  locFormulario.pubLicencaID     := StringIntegerConverter(edtLicencaID.Text);
  locFormulario.pubEmpresaBaseID := StringIntegerConverter(edtCodigoCadastradoBaseID.Text);
  locFormulario.pubEmpresaID     := StringIntegerConverter(edtCodigoCadastradoID.Text);

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
procedure TPlataformaERPVCLEmpresaCadastro.edtDescricaoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtDescricao) then Exit;
end;

procedure TPlataformaERPVCLEmpresaCadastro.edtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLEmpresaCadastro.edtDescricaoExit(Sender: TObject);
begin
  if not VCLEditSair(edtDescricao) then Exit;
end;

//
// Eventos do componente "regime tribut�rio".
//
procedure TPlataformaERPVCLEmpresaCadastro.edtRegimeTributarioCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtRegimeTributarioCodigo) then Exit;
end;

procedure TPlataformaERPVCLEmpresaCadastro.edtRegimeTributarioCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLEmpresaCadastro.edtRegimeTributarioCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then imgRegimeTributarioSelecionarClick(Sender);
end;

procedure TPlataformaERPVCLEmpresaCadastro.edtRegimeTributarioCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtRegimeTributarioCodigo) then Exit;
  
  if not Plataforma_ERP_VCL_RegimeTributarioValidar((edtEmpresaID.Text = STR_NOVO),
                                                     edtRegimeTributarioID,
                                                     edtRegimeTributarioCodigo,
                                                     edtRegimeTributarioDescricao) then Exit;
end;

procedure TPlataformaERPVCLEmpresaCadastro.imgRegimeTributarioSelecionarClick(Sender: TObject);
begin
  if not Plataforma_ERP_VCL_RegimeTributarioSelecionar(edtRegimeTributarioID, edtRegimeTributarioCodigo, edtRegimeTributarioDescricao) then Exit;
end;

procedure TPlataformaERPVCLEmpresaCadastro.edtRegimeTributarioDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_RegimeTributarioExibir(StringIntegerConverter(edtRegimeTributarioID.Text));
end;

//
// Eventos do componente "bloqueado".
//
procedure TPlataformaERPVCLEmpresaCadastro.chkBloqueadoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkBloqueado) then Exit;
end;

procedure TPlataformaERPVCLEmpresaCadastro.chkBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLEmpresaCadastro.chkBloqueadoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkBloqueado) then Exit;
end;

//
// Ativo.
//
procedure TPlataformaERPVCLEmpresaCadastro.chkAtivoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkAtivo) then Exit;
end;

procedure TPlataformaERPVCLEmpresaCadastro.chkAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLEmpresaCadastro.chkAtivoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkAtivo) then Exit;
end;

//
// Evento de click no t�tulo da licen�a.
//
procedure TPlataformaERPVCLEmpresaCadastro.edtLicencaDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_LicencaCadastroExibir(StringIntegerConverter(edtLicencaID.Text));
end;

//
// Evento de click no t�tulo da base.
//
procedure TPlataformaERPVCLEmpresaCadastro.edtEmpresaBaseDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_BaseCadastroExibir(StringIntegerConverter(edtUsuarioBaseID.Text));
end;

//
// Evento de click na data de cria��o.
//
procedure TPlataformaERPVCLEmpresaCadastro.edtInsLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtInsLocalDtHr.Text));
end;

//
// Evento de click na data da �ltima altera��o.
//
procedure TPlataformaERPVCLEmpresaCadastro.edtUpdLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtUpdLocalDtHr.Text));
end;

//
// Evento de click no bot�o "log altera��es".
//
procedure TPlataformaERPVCLEmpresaCadastro.btnLogClick(Sender: TObject);
begin
  FormularioLogExibir;
end;

//
// Evento de click no bot�o "novo".
//
procedure TPlataformaERPVCLEmpresaCadastro.btnNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

//
// Evento de click no bot�o "alterar".
//
procedure TPlataformaERPVCLEmpresaCadastro.btnAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

//
// Evento de click no bot�o "gravar".
//
procedure TPlataformaERPVCLEmpresaCadastro.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no bot�o "minimizar".
//
procedure TPlataformaERPVCLEmpresaCadastro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "cancelar".
//
procedure TPlataformaERPVCLEmpresaCadastro.btnCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLEmpresaCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLEmpresaCadastro.FormularioLimpar;
begin 
  //
  // Posiciona pagecontrole na primeira aba.
  //
  VCLPageControlInicializar(pagFormulario);

  // Limpa componentes da aba "cadastro".
  VCLEditLimpar    (edtCodigo);
  VCLEditLimpar    (edtDescricao);
  VCLEditLimpar    (edtRegimeTributarioID);
  VCLEditLimpar    (edtRegimeTributarioCodigo);
  VCLEditLimpar    (edtRegimeTributarioDescricao);
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
  VCLEditLimpar(edtEmpresaBaseID);
  VCLEditLimpar(edtEmpresaBaseDescricao);
  VCLEditLimpar(edtEmpresaID);
  VCLEditLimpar(edtInsLocalDtHr);
  VCLEditLimpar(edtUpdLocalDtHr);
  VCLEditLimpar(edtUpdContador);
end;

//
// Procedimento para controlar os componentes do formul�rio.
//
procedure TPlataformaERPVCLEmpresaCadastro.FormularioControlar(argEditar: Boolean);
var
  locDadosPopulados: Boolean;
  locIdentificador : string;
begin
  //
  // Determina se existem dados populados no formul�rio.
  //
  locDadosPopulados := (StringIntegerConverter(edtEmpresaID.Text) > 0);

  //
  // Controla os componentes do formul�rio.
  //
  VCLEditControlar(edtCodigo,                 argEditar);
  VCLEditControlar(edtDescricao,              argEditar);
  VCLEditControlar(edtRegimeTributarioCodigo, argEditar);
  gbxOpcoes.Enabled := argEditar;

  //
  // Exibe o �ltimo c�digo cadastrado somente se for um novo cadastro.
  //
  lblCodigoCadastrado.Visible := (argEditar) and (not locDadosPopulados);
  edtCodigoCadastrado.Visible := (argEditar) and (not locDadosPopulados);

  //
  // Controla os componentes de exibi��o de cadastro.
  //
  VCLEditClickControlar(edtRegimeTributarioDescricao, True);
  VCLEditClickControlar(edtLicencaDescricao,          True);
  VCLEditClickControlar(edtEmpresaBaseDescricao,      True);
  VCLEditClickControlar(edtInsLocalDtHr,              True);
  VCLEditClickControlar(edtUpdLocalDtHr,              True);

  //
  // Controle os componentes com sele��o de dados.
  //
  VCLEditSelecaoControlar(edtRegimeTributarioDescricao, imgRegimeTributarioSelecionar, argEditar);

  //
  // Controla os itens de menu do formul�rio.
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
  // Permiss�es de acesso por usu�rio.
  //
  tabCadastro.TabVisible  := Plataforma_ERP_UsuarioRotina('ERP_EMPRESA_CADASTRO_ABA_CADASTRO');
  tabAuditoria.TabVisible := Plataforma_ERP_UsuarioRotina('ERP_EMPRESA_CADASTRO_ABA_AUDITORIA');

  mniAtualizar.Visible := (mniAtualizar.Visible) and (Plataforma_ERP_UsuarioRotina('ERP_EMPRESA_CADASTRO_ATUALIZAR'));
  mniNovo.Visible      := (mniNovo.Visible)      and (Plataforma_ERP_UsuarioRotina('ERP_EMPRESA_CADASTRO_NOVO'));
  mniExcluir.Visible   := (mniExcluir.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_EMPRESA_CADASTRO_EXCLUIR'));
  mniAlterar.Visible   := (mniAlterar.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_EMPRESA_CADASTRO_ALTERAR'));

  //
  // Itens do menu adicional.
  //
  mniLog.Visible := (mniLog.Visible) and (Plataforma_ERP_UsuarioRotina('ERP_EMPRESA_CADASTRO_LOG'));

  mniCadastroRegimeTributario.Visible := Plataforma_ERP_UsuarioRotina('ERP_REGIME_TRIBUTARIO_LISTA');

  mniAdicional.Visible := (mniLog.Visible) or
                          (mniCadastroRegimeTributario.Visible);
                          
  //
  // Bot�es.
  //
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
  Self.Caption     := 'Empresa';
  locIdentificador := ': ' + edtDescricao.Text;

  if (not locDadosPopulados) and (argEditar) then Self.Caption := Self.Caption + ' - novo cadastro';
  if locDadosPopulados and argEditar         then Self.Caption := Self.Caption + ' - alterando cadastro'   + locIdentificador;
  if locDadosPopulados and (not argEditar)   then Self.Caption := Self.Caption + ' - consultando cadastro' + locIdentificador;
end;

//
// Procedimento para carregar e exibir o log de altera��es do registro.
//
procedure TPlataformaERPVCLEmpresaCadastro.FormularioLogExibir;
const
  PROCEDIMENTO_NOME: string = 'FormularioLogExibir';
  ERRO_MENSAGEM    : string = 'Imposs�vel consultar dados sobre os logs do registro!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
  locLicencaID    : Integer;
  locEmpresaBaseID: Integer;
  locEmpresaID    : Integer;
begin
  //
  // Carrega chave do registro.
  //
  locLicencaID     := StringIntegerConverter(edtLicencaID.Text);
  locEmpresaBaseID := StringIntegerConverter(edtEmpresaBaseID.Text);
  locEmpresaID     := StringIntegerConverter(edtEmpresaID.Text);

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
  // Consulta dados do usu�rio.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                       ');
  locADOQuery.SQL.Add('  [empresa_log].[empresa_log_sq]     AS [sequencial],                        ');
  locADOQuery.SQL.Add('  [base].[base_id]                   AS [log_base_id],                       ');
  locADOQuery.SQL.Add('  [base].[descricao]                 AS [log_base_descricao],                ');
  locADOQuery.SQL.Add('  [empresa_log].[log_local_dt_hr]    AS [log_local_dt_hr],                   ');
  locADOQuery.SQL.Add('  [empresa_log].[log_server_dt_hr]   AS [log_server_dt_hr],                  ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_id] AS [registro_acao_id],                  ');
  locADOQuery.SQL.Add('  [registro_acao].[descricao]        AS [registro_acao_descricao],           ');
  locADOQuery.SQL.Add('  [empresa_log].[host_name]          AS [host_name],                         ');
  locADOQuery.SQL.Add('  [empresa_log].[user_name]          AS [user_name],                         ');
  locADOQuery.SQL.Add('  [usuario].[usuario_base_id]        AS [usuario_base_id],                   ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id]             AS [usuario_id],                        ');
  locADOQuery.SQL.Add('  [usuario].[nome]                   AS [usuario_nome],                      ');  
  locADOQuery.SQL.Add('  [empresa_log].[mensagem]           AS [mensagem],                          ');
  locADOQuery.SQL.Add('  [empresa_log].[dados]              AS [dados]                              ');
  locADOQuery.SQL.Add('FROM                                                                         ');  
  locADOQuery.SQL.Add('  [empresa_log] WITH (NOLOCK)                                                ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                                            ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [empresa_log].[log_base_id]                        ');
  locADOQuery.SQL.Add('  INNER JOIN [registro_acao] WITH (NOLOCK)                                   ');
  locADOQuery.SQL.Add('    ON [registro_acao].[registro_acao_id] = [empresa_log].[registro_acao_id] ');
  locADOQuery.SQL.Add('  INNER JOIN [usuario] WITH (NOLOCK)                                         ');
  locADOQuery.SQL.Add('    ON [usuario].[licenca_id]      = [usuario_log].[licenca_id]          AND ');
  locADOQuery.SQL.Add('       [usuario].[usuario_base_id] = [usuario_log].[log_usuario_base_id] AND ');
  locADOQuery.SQL.Add('       [usuario].[usuario_id]      = [usuario_log].[log_usuario_id]          ');
  locADOQuery.SQL.Add('WHERE                                                                        ');
  locADOQuery.SQL.Add('  [empresa_log].[licenca_id]      = :licenca_id      AND                     ');
  locADOQuery.SQL.Add('  [empresa_log].[empresa_base_id] = :empresa_base_id AND                     ');
  locADOQuery.SQL.Add('  [empresa_log].[empresa_id]      = :empresa_id                              ');
  locADOQuery.SQL.Add('ORDER BY                                                                     ');
  locADOQuery.SQL.Add('  [empresa_log].[empresa_log_sq] ASC                                         ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('empresa_base_id').Value := locEmpresaBaseID;
  locADOQuery.Parameters.ParamByName('empresa_id').Value      := locEmpresaID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar registros da tabela [empresa_log]!';
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
    Plataforma_ERP_VCL_LogRegistroExibir('Empresa: ' + edtDescricao.Text, locADOQuery);
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
procedure TPlataformaERPVCLEmpresaCadastro.FormularioAtualizar;
begin
  //
  // Popula componentes com as informa��es do cadastro.
  //
  FormularioPopular(StringIntegerConverter(edtLicencaID.Text),
                    StringIntegerConverter(edtEmpresaBaseID.Text),
                    StringIntegerConverter(edtEmpresaID.Text));

  //
  // Controla a exibi��o dos componentes.
  //
  FormularioControlar(False);
end;

//
// Procedimento para iniciar a digita��o de dados de um novo cadastro.
//
procedure TPlataformaERPVCLEmpresaCadastro.FormularioNovo;
begin
  //
  // Limpa os componentes do formul�rio.
  //
  FormularioLimpar;

  //
  // Carrega conte�do dos campos necess�rios.
  //
  edtLicencaID.Text            := IntegerStringConverter(gloLicencaID, True);
  edtLicencaDescricao.Text     := gloLicencaDescricao;
  edtEmpresaBaseID.Text        := IntegerStringConverter(gloBaseID,    True);
  edtEmpresaBaseDescricao.Text := gloBaseDescricao;
  edtEmpresaID.Text            := STR_NOVO;
  chkAtivo.Checked             := True;

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
procedure TPlataformaERPVCLEmpresaCadastro.FormularioPopular(argLicencaID    : Integer;
                                                             argEmpresaBaseID: Integer;
                                                             argEmpresaID    : Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
  ERRO_MENSAGEM    : string = 'Imposs�vel consultar dados da empresa!';
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
  // Consulta dados do usu�rio.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                               ');
  locADOQuery.SQL.Add('  [licenca].[licenca_id],                                                            ');
  locADOQuery.SQL.Add('  [licenca].[descricao] AS [licenca_descricao],                                      ');
  locADOQuery.SQL.Add('  [base].[base_id]      AS [empresa_base_id],                                        ');
  locADOQuery.SQL.Add('  [base].[descricao]    AS [empresa_base_descricao],                                 ');
  locADOQuery.SQL.Add('  [empresa].[usuario_id],                                                            ');  
  locADOQuery.SQL.Add('  [empresa].[codigo],                                                                ');
  locADOQuery.SQL.Add('  [empresa].[descricao],                                                             ');
  locADOQuery.SQL.Add('  [regime_tributario].[regime_tributario_id] AS [regime_tributario_id],              ');
  locADOQuery.SQL.Add('  [regime_tributario].[codigo]               AS [regime_tributario_codigo],          ');
  locADOQuery.SQL.Add('  [regime_tributario].[descricao]            AS [regime_tributario_descricao],       ');
  locADOQuery.SQL.Add('  [empresa].[bloqueado],                                                             ');
  locADOQuery.SQL.Add('  [empresa].[ativo],                                                                 ');
  locADOQuery.SQL.Add('  [empresa].[ins_local_dt_hr],                                                       ');
  locADOQuery.SQL.Add('  [empresa].[upd_local_dt_hr],                                                       ');
  locADOQuery.SQL.Add('  [empresa].[upd_contador]                                                           ');  
  locADOQuery.SQL.Add('FROM                                                                                 ');
  locADOQuery.SQL.Add('  [empresa] WITH (NOLOCK)                                                            ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                                                    ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [empresa].[empresa_base_id]                                ');
  locADOQuery.SQL.Add('  INNER JOIN [licenca] WITH (NOLOCK)                                                 ');
  locADOQuery.SQL.Add('    ON [licenca].[licenca_id] = [empresa].[licenca_id]                               ');
  locADOQuery.SQL.Add('  INNER JOIN [regime_tributario] WITH (NOLOCK)                                       ');
  locADOQuery.SQL.Add('    ON [regime_tributario].[regime_tributario_id]= [emnpresa].[regime_tributario_id] ');
  locADOQuery.SQL.Add('WHERE                                                                                ');
  locADOQuery.SQL.Add('  [empresa].[licenca_id]      = :licenca_id      AND                                 ');
  locADOQuery.SQL.Add('  [empresa].[empresa_base_id] = :empresa_base_id AND                                 ');
  locADOQuery.SQL.Add('  [empresa].[empresa_id]      = :empresa_id                                          ');
                                                              
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := argLicencaID;
  locADOQuery.Parameters.ParamByName('empresa_base_id').Value := argEmpresaBaseID;
  locADOQuery.Parameters.ParamByName('empresa_id').Value      := argEmpresaID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [empresa]!';
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
    edtCodigo.Text    := locADOQuery.FieldByName('codigo').AsString;
    edtDescricao.Text := locADOQuery.FieldByName('descricao').AsString;

    edtRegimeTributarioID.Text        := locADOQuery.FieldByName('regime_tributario_id').AsString;
    edtRegimeTributarioCodigo.Text    := locADOQuery.FieldByName('regime_tributario_codigo').AsString;
    edtRegimeTributarioDescricao.Text := locADOQuery.FieldByName('regime_tributario_descricao').AsString;

    chkBloqueado.Checked     := StringBooleanConverter(locADOQuery.FieldByName('bloqueado').AsString);
    chkAtivo.Checked         := StringBooleanConverter(locADOQuery.FieldByName('ativo').AsString);

    edtLicencaID.Text            := locADOQuery.FieldByName('licenca_id').AsString;
    edtLicencaDescricao.Text     := locADOQuery.FieldByName('licenca_descricao').AsString;
    edtEmpresaBaseID.Text        := locADOQuery.FieldByName('empresa_base_id').AsString;
    edtEmpresaBaseDescricao.Text := locADOQuery.FieldByName('empresa_base_descricao').AsString;
    edtEmpresaID.Text            := IntegerStringConverter(locADOQuery.FieldByName('empresa_id').AsInteger, True);
    edtInsLocalDtHr.Text         := DateTimeStringConverter(locADOQuery.FieldByName('ins_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn');
    edtUpdLocalDtHr.Text         := DateTimeStringConverter(locADOQuery.FieldByName('upd_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn');
    edtUpdContador.Text          := IntegerStringConverter(locADOQuery.FieldByName('upd_contador').AsInteger);
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
procedure TPlataformaERPVCLEmpresaCadastro.FormularioAlterar;
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
procedure TPlataformaERPVCLEmpresaCadastro.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioGravar';
  ERRO_MENSAGEM    : string = 'Imposs�vel gravar dados da empresa!';
var                    
  locADOConnection     : TADOConnection;
  locADOQuery          : TADOQuery;
  locLogMensagem       : string;

  locInsert            : Boolean;
  locRegistroAcao      : Byte;
  locRegistroAcaoID    : Integer;
  locEmpresaLogSq      : Integer;
  locEmpresaLogMsg     : string;
  locEmpresaLogDados   : string;

  locLicencaID         : Integer;
  locEmpresaBaseID     : Integer;
  locEmpresaID         : Integer;
  locCodigo            : string;
  locDescricao         : string;
  locRegimeTributarioID: Integer;
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
  // Determina se ser� um insert ou update.
  //
  if edtEmpresaID.Text = STR_NOVO then
    locInsert := True
  else
    locInsert := False;

  //
  // Carrega vari�veis com o conte�do dos componentes.
  //
  locLicencaID          := StringIntegerConverter(edtLicencaID.Text);
  locEmpresaBaseID      := StringIntegerConverter(edtEmpresaBaseID.Text);
  locEmpresaID          := StringIntegerConverter(edtEmpresaID.Text);
  locCodigo             := StringTrim(edtCodigo.Text);
  locDescricao          := StringTrim(edtDescricao.Text);
  locRegimeTributarioID := StringIntegerConverter(edtRegimeTributarioID.Text);
  locBloqueado          := chkBloqueado.Checked;
  locAtivo              := chkAtivo.Checked;
  locUsuarioBaseID      := gloUsuarioBaseID;
  locUsuarioID          := gloUsuarioID;
  locHostName           := HostNameRecuperar;
  locUserName           := UserNameRecuperar;
  locUpdContador        := StringIntegerConverter(edtUpdContador.Text);

  //
  // Consiste as informa��es.
  //
  if locCodigo = '' then
  begin
    VCLConsistenciaExibir('O c�digo da empresa deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
    Exit;
  end;

  if locDescricao = '' then
  begin
    VCLConsistenciaExibir('A descri��o da empresa deve ser informada!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtDescricao);
    Exit;
  end;

  if locRegimeTributarioID = 0 then
  begin
    VCLConsistenciaExibir('O regime tribut�rio da empresa deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtRegimeTributarioCodigo);
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
  // Determina se o c�digo da empresa j� existe no banco de dados para um outro registro.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                                           ');
  locADOQuery.SQL.Add('  1                                                    ');
  locADOQuery.SQL.Add('FROM                                                   ');
  locADOQuery.SQL.Add('  [empresa] WITH (NOLOCK)                              ');
  locADOQuery.SQL.Add('WHERE                                                  ');
  locADOQuery.SQL.Add('  [empresa].[licenca_id]       = :licenca_id       AND ');
  locADOQuery.SQL.Add('  [empresa].[emnpresa_base_id] = :emnpresa_base_id AND ');
  locADOQuery.SQL.Add('  [empresa].[codigo]           = :codigo           AND ');
  locADOQuery.SQL.Add('  [empresa].[empresa_id]      <> :empresa_id           ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('empresa_base_id').Value := locEmpresaBaseID;
  locADOQuery.Parameters.ParamByName('codigo').Value          := locCodigo;
  locADOQuery.Parameters.ParamByName('empresa_id').Value      := locEmpresaID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar o mesmo c�digo da empresa em um outro registro!';
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
    locLogMensagem := 'O c�digo "' + locCodigo + '" informado para a empresa j� existe em algum outro cadastro!';
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
    locADOQuery.SQL.Add('SELECT                                               ');
    locADOQuery.SQL.Add('  [empresa].[upd_contador]                           ');
    locADOQuery.SQL.Add('FROM                                                 ');
    locADOQuery.SQL.Add('  [empresa] WITH (NOLOCK)                            ');
    locADOQuery.SQL.Add('WHERE                                                ');
    locADOQuery.SQL.Add('  [empresa].[licenca_id]      = :licenca_id      AND ');
    locADOQuery.SQL.Add('  [empresa].[empresa_base_id] = :empresa_base_id AND ');
    locADOQuery.SQL.Add('  [empresa].[empresa_id]      = :empresa_id          ');

    locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
    locADOQuery.Parameters.ParamByName('empresa_base_id').Value := locEmpresaBaseID;
    locADOQuery.Parameters.ParamByName('empresa_id').Value      := locEmpresaID;

    try
      locADOQuery.Open;
    except
      on locExcecao: Exception do
      begin
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualiza��es confere na tabela [empresa]!';
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
    locRegistroAcao  := REGISTRO_ACAO_CRIACAO;
    locEmpresaLogMsg := MENSAGEM_REGISTRO_ACAO_CRIADO;
  end
  else
  begin
    locRegistroAcao  := REGISTRO_ACAO_ALTERACAO;
    locEmpresaLogMsg := MENSAGEM_REGISTRO_ACAO_ALTERADO;
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
  // Determina o pr�ximo ID do usu�rio.
  //
  if locInsert then
  begin
    try
      locEmpresaID := Plataforma_ERP_ADO_NumeradorLicencaDeterminar(locADOConnection,
                                                                    locLicencaID,
                                                                    locEmpresaBaseID,
                                                                    NUMERADOR_EMPRESA_ID,
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
        locLogMensagem := 'Imposs�vel determinar o pr�ximo numerador para a empresa!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
        Exit
      end;
    end;
  end;

  //
  // Grava dados na tabela empresa.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;

  if locInsert then
  begin
    //
    // Insere dados.
    //
    locADOQuery.SQL.Add('INSERT INTO [empresa] (   ');
    locADOQuery.SQL.Add('  [licenca_id],           ');
    locADOQuery.SQL.Add('  [empresa_base_id],      ');
    locADOQuery.SQL.Add('  [empresa_id],           ');
    locADOQuery.SQL.Add('  [codigo],               ');
    locADOQuery.SQL.Add('  [descricao],            ');
    locADOQuery.SQL.Add('  [regime_tributario_id], ');
    locADOQuery.SQL.Add('  [bloqueado],            ');
    locADOQuery.SQL.Add('  [ativo],                ');
    locADOQuery.SQL.Add('  [ins_local_dt_hr],      ');
    locADOQuery.SQL.Add('  [ins_server_dt_hr],     ');
    locADOQuery.SQL.Add('  [ins_usuario_base_id],  ');
    locADOQuery.SQL.Add('  [ins_usuario_id],       ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr],      ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr],     ');
    locADOQuery.SQL.Add('  [upd_usuario_base_id],  ');
    locADOQuery.SQL.Add('  [upd_usuario_id],       ');
    locADOQuery.SQL.Add('  [upd_contador]          ');  
    locADOQuery.SQL.Add(')                         ');
    locADOQuery.SQL.Add('VALUES (                  ');
    locADOQuery.SQL.Add('  :licenca_id,            '); // [licenca_id].
    locADOQuery.SQL.Add('  :empresa_base_id,       '); // [empresa_base_id].
    locADOQuery.SQL.Add('  :empresa_id,            '); // [empresa_id].
    locADOQuery.SQL.Add('  :codigo,                '); // [codigo].
    locADOQuery.SQL.Add('  :descricao,             '); // [descricao].
    locADOQuery.SQL.Add('  :regime_tributario_id,  '); // [regime_tributario_id].
    locADOQuery.SQL.Add('  :bloqueado,             '); // [bloqueado].
    locADOQuery.SQL.Add('  :ativo,                 '); // [ativo].
    locADOQuery.SQL.Add('  :local_dt_hr,           '); // [ins_local_dt_hr].
    locADOQuery.SQL.Add('  GETDATE(),              '); // [ins_server_dt_hr].
    locADOQuery.SQL.Add('  :usuario_base_id,       '); // [ins_usuario_base_id].
    locADOQuery.SQL.Add('  :usuario_id,            '); // [ins_usuario_id].
    locADOQuery.SQL.Add('  NULL,                   '); // [upd_local_dt_hr].
    locADOQuery.SQL.Add('  NULL,                   '); // [upd_server_dt_hr].
    locADOQuery.SQL.Add('  NULL,                   '); // [upd_usuario_base_id].
    locADOQuery.SQL.Add('  NULL,                   '); // [upd_usuario_id].
    locADOQuery.SQL.Add('  0                       '); // [upd_contador].
    locADOQuery.SQL.Add(')                         ');
  end
  else
  begin
    //
    // Atualiza dados.
    //
    locADOQuery.SQL.Add('UPDATE                                            ');
    locADOQuery.SQL.Add('  [empresa]                                       ');
    locADOQuery.SQL.Add('SET                                               ');
    locADOQuery.SQL.Add('  [codigo]               = :codigo,               ');
    locADOQuery.SQL.Add('  [descricao]            = :descricao,            ');
    locADOQuery.SQL.Add('  [regime_tributario_id] = :regime_tributario_id, ');
    locADOQuery.SQL.Add('  [bloqueado]            = :bloqueado,            ');
    locADOQuery.SQL.Add('  [ativo]                = :ativo,                ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr]      = :local_dt_hr,          ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr]     = GETDATE(),             ');
    locADOQuery.SQL.Add('  [upd_usuario_base_id]  = :upd_usuario_base_id,  ');
    locADOQuery.SQL.Add('  [upd_usuario_id]       = :upd_usuario_id,       ');
    locADOQuery.SQL.Add('  [upd_contador]         = [upd_contador] + 1     ');
    locADOQuery.SQL.Add('WHERE                                             ');
    locADOQuery.SQL.Add('  [licenca_id]      = :licenca_id      AND        ');
    locADOQuery.SQL.Add('  [empresa_base_id] = :empresa_base_id AND        ');
    locADOQuery.SQL.Add('  [empresa_id]      = :empresa_id                 ');
  end;

  //
  // Par�metros.
  //
  locADOQuery.Parameters.ParamByName('licenca_id').Value           := locLicencaID;
  locADOQuery.Parameters.ParamByName('empresa_base_id').Value      := locEmpresaBaseID;
  locADOQuery.Parameters.ParamByName('empresa_id').Value           := locEmpresaID;
  locADOQuery.Parameters.ParamByName('codigo').Value               := locCodigo;
  locADOQuery.Parameters.ParamByName('descricao').Value            := locDescricao;
  locADOQuery.Parameters.ParamByName('regime_tributario_id').Value := locRegimeTributarioID;
  locADOQuery.Parameters.ParamByName('bloqueado').Value            := BooleanStringConverter(locBloqueado);
  locADOQuery.Parameters.ParamByName('ativo').Value                := BooleanStringConverter(locAtivo);
  locADOQuery.Parameters.ParamByName('local_dt_hr').Value          := Now;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value      := 
  locADOQuery.Parameters.ParamByName('usuario_id').Value           :=

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [usuario]!';
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
  locADOQuery.SQL.Add('SELECT                                               ');
  locADOQuery.SQL.Add('  [usuario].[ins_local_dt_hr],                       ');
  locADOQuery.SQL.Add('  [usuario].[upd_local_dt_hr],                       ');
  locADOQuery.SQL.Add('  [usuario].[upd_contador]                           ');
  locADOQuery.SQL.Add('FROM                                                 ');
  locADOQuery.SQL.Add('  [usuario]                                          ');
  locADOQuery.SQL.Add('WHERE                                                ');
  locADOQuery.SQL.Add('  [usuario].[licenca_id]      = :licenca_id      AND ');
  locADOQuery.SQL.Add('  [usuario].[usuario_base_id] = :usuario_base_id AND ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id]      = :usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value      := locUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o novo contador de updates do registro na tabela [usuario]!';
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
  locUsuarioLogDados := LogDadosGerar(locUsuarioID);
  
  //
  // Determina o pr�ximo sequencial da tabela usuario_log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                   ');
  locADOQuery.SQL.Add('  MAX([usuario_log].[usuario_log_sq]) AS [sequencial]    ');
  locADOQuery.SQL.Add('FROM                                                     ');
  locADOQuery.SQL.Add('  [usuario_log]                                          ');
  locADOQuery.SQL.Add('WHERE                                                    ');
  locADOQuery.SQL.Add('  [usuario_log].[licenca_id]      = :licenca_id      AND ');
  locADOQuery.SQL.Add('  [usuario_log].[usuario_base_id] = :usuario_base_id AND ');
  locADOQuery.SQL.Add('  [usuario_log].[usuario_id]      = :usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value      := locUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o pr�ximo sequencial para o registro na tabela [usuario_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  if locADOQuery.RecordCount <= 0 then
  begin
    locUsuarioLogSq := 1;
  end
  else  
  begin
    locUsuarioLogSq := locADOQuery.FieldByName('sequencial').AsInteger + 1;
  end; 

  //
  // Monta SQL para inserir dados na tabela de log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('INSERT INTO [usuario_log] (');
  locADOQuery.SQL.Add('  [licenca_id],            ');
  locADOQuery.SQL.Add('  [usuario_base_id],       ');
  locADOQuery.SQL.Add('  [usuario_id],            ');
  locADOQuery.SQL.Add('  [usuario_log_sq],        ');
  locADOQuery.SQL.Add('  [log_base_id],           ');
  locADOQuery.SQL.Add('  [log_local_dt_hr],       ');
  locADOQuery.SQL.Add('  [log_server_dt_hr],      ');
  locADOQuery.SQL.Add('  [registro_acao_id],      ');
  locADOQuery.SQL.Add('  [host_name],             ');
  locADOQuery.SQL.Add('  [user_name],             ');
  locADOQuery.SQL.Add('  [log_usuario_base_id],   ');
  locADOQuery.SQL.Add('  [log_usuario_id],        ');
  locADOQuery.SQL.Add('  [mensagem],              ');  
  locADOQuery.SQL.Add('  [dados]                  ');
  locADOQuery.SQL.Add(')                          ');
  locADOQuery.SQL.Add('VALUES (                   ');
  locADOQuery.SQL.Add('  :licenca_id,             '); // [licenca_id].
  locADOQuery.SQL.Add('  :usuario_base_id,        '); // [usuario_base_id].
  locADOQuery.SQL.Add('  :usuario_id,             '); // [usuario_id].
  locADOQuery.SQL.Add('  :usuario_log_sq,         '); // [usuario_log_sq].
  locADOQuery.SQL.Add('  :log_base_id,            '); // [log_base_id].
  locADOQuery.SQL.Add('  :log_local_dt_hr,        '); // [log_local_dt_hr].
  locADOQuery.SQL.Add('  GETDATE(),               '); // [log_server_dt_hr].
  locADOQuery.SQL.Add('  :registro_acao_id,       '); // [registro_acao_id].
  locADOQuery.SQL.Add('  :host_name,              '); // [host_name].
  locADOQuery.SQL.Add('  :user_name,              '); // [user_name].
  locADOQuery.SQL.Add('  :log_usuario_base_id,    '); // [log_usuario_base_id].
  locADOQuery.SQL.Add('  :log_usuario_id,         '); // [log_usuario_id].
  locADOQuery.SQL.Add('  :mensagem,               '); // [mensagem].
  locADOQuery.SQL.Add('  :dados                   '); // [dados].
  locADOQuery.SQL.Add(')                          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value          := locLicencaID;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value     := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value          := locUsuarioID;
  locADOQuery.Parameters.ParamByName('usuario_log_sq').Value      := locUsuarioLogSq;
  locADOQuery.Parameters.ParamByName('log_base_id').Value         := gloBaseID;
  locADOQuery.Parameters.ParamByName('log_local_dt_hr').Value     := Now;
  locADOQuery.Parameters.ParamByName('registro_acao_id').Value    := locRegistroAcaoID;
  locADOQuery.Parameters.ParamByName('host_name').Value           := locHostName;
  locADOQuery.Parameters.ParamByName('user_name').Value           := locUserName;
  locADOQuery.Parameters.ParamByName('log_usuario_base_id').Value := locLogUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('log_usuario_id').Value      := locLogUsuarioID;
  locADOQuery.Parameters.ParamByName('mensagem').Value            := locUsuarioLogMsg;
  locADOQuery.Parameters.ParamByName('dados').Value               := locUsuarioLogDados;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir/atualizar o registro na tabela [usuario_log]!';
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
  edtUsuarioID.Text    := IntegerStringConverter(locUsuarioID);
  edtInsLocalDtHr.Text := DateTimeStringConverter(locInsLocalDtHr, 'dd/mm/yyyy hh:nn');
  edtUpdLocalDtHr.Text := DateTimeStringConverter(locUpdLocalDtHr, 'dd/mm/yyyy hh:nn');
  edtUpdContador.Text  := IntegerStringConverter(locUpdContador);

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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, locUsuarioID, locCodigo, 'usuario', locUsuarioLogMsg, locUsuarioLogDados);
  except
    on locExcecao: Exception do
    begin
      VCLErroExibir(locExcecao.Message);
    end;
  end;

  //
  // Usu�rio gravado!
  //
  VCLInformacaoExibir('Usu�rio gravado com sucesso!');
end;

//
// Procedimento para excluir os dados deste cadastro.
//
procedure TPlataformaERPVCLEmpresaCadastro.FormularioExcluir;
const
  PROCEDIMENTO_NOME: string = 'FormularioExcluir';
  ERRO_MENSAGEM    : string = 'Imposs�vel excluir dados do usu�rio!';
var
  locADOConnection  : TADOConnection;
  locADOQuery       : TADOQuery;
  locLogMensagem    : string;
  locLicencaID      : Integer;
  locUsuarioBaseID  : Integer;
  locUsuarioID      : Integer;
  locUsuarioLogDados: string;
begin
  //
  // Carrega vari�veis com o conte�do dos componentes.
  //
  locLicencaID     := StringIntegerConverter(edtLicencaID.Text);
  locUsuarioBaseID := StringIntegerConverter(edtUsuarioBaseID.Text);
  locUsuarioID     := StringIntegerConverter(edtUsuarioID.Text);

  //
  // Voc� n�o pode excluir voc� mesmo como usu�rio.
  //
  if (locUsuarioBaseID = gloUsuarioBaseID) and (locUsuarioID = gloUsuarioID) then
  begin
    VCLConsistenciaExibir('Voc� n�o pode se excluir como usu�rio!');
    Exit;
  end;

  //
  // Log dados.
  //
  locUsuarioLogDados := LogDadosGerar;

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
  // Query.
  //
  locADOQuery                := TADOQuery.Create(Self);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Deleta registro da tabela usuario_log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                                             ');
  locADOQuery.SQL.Add('  [usuario_log]                                          ');
  locADOQuery.SQL.Add('WHERE                                                    ');
  locADOQuery.SQL.Add('  [usuario_log].[licenca_id]      = :licenca_id      AND ');
  locADOQuery.SQL.Add('  [usuario_log].[usuario_base_id] = :usuario_base_id AND ');
  locADOQuery.SQL.Add('  [usuario_log].[usuario_id]      = :usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value      := locUsuarioID;

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
      locLogMensagem := 'Ocorreu algum problema ao executar query para deletar os registros na tabela [usuario_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Comando SQL para excluir um registro da tabela usuario.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                                           ');
  locADOQuery.SQL.Add('  [usuario]                                           ');
  locADOQuery.SQL.Add('WHERE                                                 ');
  locADOQuery.SQL.Add('  [usuario].[licenca_id]      = :licenca_id      AND  ');
  locADOQuery.SQL.Add('  [usuario].[usuario_base_id] = :usuario_base_id AND  ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id]      = :usuario_id           ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value      := locUsuarioID;

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
      locLogMensagem := 'Ocorreu algum problema ao executar query para deletar os registros na tabela [usuario]!';
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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(REGISTRO_ACAO_EXCLUSAO, locUsuarioID, edtCodigo.Text, 'usuario', 'Registro exclu�do com sucesso!', locUsuarioLogDados);
  except
  end;
  VCLInformacaoExibir('Usu�rio exclu�do com sucesso!');
end;

//
// Procedimento para cancelar a edi��o dos dados do formul�rio.
//
procedure TPlataformaERPVCLEmpresaCadastro.FormularioCancelar;
var
  locLicencaID    : Integer;
  locUsuarioBaseID: Integer;
  locUsuarioID    : Integer;
begin
  //
  // Carrega chave do registro que estava sendo editado.
  //
  locLicencaID     := StringIntegerConverter(edtLicencaID.Text);
  locUsuarioBaseID := StringIntegerConverter(edtUsuarioBaseID.Text);
  locUsuarioID     := StringIntegerConverter(edtUsuarioID.Text);

  //
  // Confirma com o usu�rio.
  //
  if locUsuarioID = 0 then
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
  FormularioPopular(locLicencaID, locUsuarioBaseID, locUsuarioID);

  //
  // Componentes desligados para edi��o.
  //
  FormularioControlar(False);
end;

//
// Procedimento par sugerir o pr�ximo c�digo.
//
procedure TPlataformaERPVCLEmpresaCadastro.FormularioCodigoSugerir;
const
  PROCEDIMENTO_NOME: string = 'FormularioCodigoSugerir';
  ERRO_MENSAGEM    : string = 'Imposs�vel sugerir informa��es sobre o pr�ximo c�digo do usu�rio!';
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
  // Consulta dados do c�digo do usu�rio.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                           ');
  locADOQuery.SQL.Add('  [usuario].[usuario_base_id],         ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id],              ');
  locADOQuery.SQL.Add('  [usuario].[codigo]                   ');
  locADOQuery.SQL.Add('FROM                                   ');
  locADOQuery.SQL.Add('  [usuario] WITH (NOLOCK)              ');
  locADOQuery.SQL.Add('WHERE                                  ');
  locADOQuery.SQL.Add('  [usuario].[licenca_id] = :licenca_id ');
  locADOQuery.SQL.Add('ORDER BY                               ');
  locADOQuery.SQL.Add('  [usuario].[ins_server_dt_hr] DESC,   ');
  locADOQuery.SQL.Add('  [usuario].[codigo] DESC              ');

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar �ltimo cadastro na tabela [usuario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Registro encontrado ent�o carrega componentes.
  //
  if locADOQuery.RecordCount > 0 then
  begin
    edtCodigoCadastrado.Text       := locADOQuery.FieldByName('codigo').AsString;
    edtCodigoCadastradoBaseID.Text := IntegerStringConverter(locADOQuery.FieldByName('usuario_base_id').AsInteger);
    edtCodigoCadastradoID.Text     := IntegerStringConverter(locADOQuery.FieldByName('usuario_id').AsInteger);

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
function TPlataformaERPVCLEmpresaCadastro.LogDadosGerar(argUsuarioID: Integer = 0): string;
var
  locUsuarioID: Integer;
begin
  if argUsuarioID <= 0 then
    locUsuarioID := StringIntegerConverter(edtUsuarioID.Text)
  else
    locUsuarioID := argUsuarioID;

  Result := '';
  LogDadosStringDescrever ('Licen�a',                edtLicencaID.Text,            Result);
  LogDadosStringDescrever ('Base do usu�rio',        edtUsuarioBaseID.Text,        Result);
  LogDadosIntegerDescrever('ID do usu�rio',          locUsuarioID,                 Result);
  LogDadosStringDescrever ('C�digo',                 edtCodigo.Text,               Result);
  LogDadosStringDescrever ('Nome',                   edtNome.Text,                 Result);
  LogDadosStringDescrever ('Tipo usu�rio base',      edtTipoUsuarioBaseID.Text,    Result);
  LogDadosStringDescrever ('Tipo usu�rio ID',        edtTipoUsuarioID.Text,        Result);
  LogDadosStringDescrever ('Tipo usu�rio c�digo',    edtTipoUsuarioCodigo.Text,    Result);
  LogDadosStringDescrever ('Tipo usu�rio descri��o', edtTipoUsuarioDescricao.Text, Result);
  LogDadosStringDescrever ('Logon',                  edtLogon.Text,                Result);
  LogDadosBooleanDescrever ('Vig�ncia',              chkVigencia.Checked,          Result);
  LogDadosStringDescrever ('Vig�ncia inicial',       medVigenciaIniDtHr.Text,      Result);
  LogDadosStringDescrever ('Vig�ncia final',         medVigenciaFimDtHr.Text,      Result);
  LogDadosBooleanDescrever('Administrador',          imgAdministradorOn.Visible,   Result);
  LogDadosBooleanDescrever('Bloqueado',              chkBloqueado.Checked,         Result);
  LogDadosBooleanDescrever('Ativo',                  chkAtivo.Checked,             Result);
end;

end.
