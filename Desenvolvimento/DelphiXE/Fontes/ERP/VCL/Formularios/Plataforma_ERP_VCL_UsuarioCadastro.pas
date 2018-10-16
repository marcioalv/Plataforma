//
// Arquivo..: Plataforma_ERP_VCL_UsuarioCadastro.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com o cadastro de usu�rio.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_UsuarioCadastro;

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
  Vcl.Menus, Vcl.Mask, Vcl.WinXCtrls;

type
  TPlataformaERPVCLUsuarioCadastro = class(TForm)
    imgFormulario: TImage;
    pagFormulario: TPageControl;
    tabCadastro: TTabSheet;
    tabAuditoria: TTabSheet;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    lblNome: TLabel;
    edtNome: TEdit;
    lblInsDtHt: TLabel;
    edtInsLocalDtHr: TEdit;
    lblUpdDtHr: TLabel;
    edtUpdLocalDtHr: TEdit;
    lblUpdContador: TLabel;
    edtUpdContador: TEdit;
    lblUsuarioID: TLabel;
    edtUsuarioID: TEdit;
    lblUsuarioBase: TLabel;
    edtUsuarioBaseDescricao: TEdit;
    edtUsuarioBaseID: TEdit;
    lblLicenca: TLabel;
    edtLicencaDescricao: TEdit;
    edtLicencaID: TEdit;
    lblCodigoCadastrado: TLabel;
    edtCodigoCadastrado: TEdit;
    imgBackground: TImage;
    lblTipoUsuario: TLabel;
    edtTipoUsuarioCodigo: TEdit;
    edtTipoUsuarioDescricao: TEdit;
    edtTipoUsuarioID: TEdit;
    imgTipoUsuarioSelecionar: TImage;
    edtTipoUsuarioBaseID: TEdit;
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
    mniCadastroTipoUsuario: TMenuItem;
    gbxOpcoes: TGroupBox;
    chkBloqueado: TCheckBox;
    chkAtivo: TCheckBox;
    lblLogon: TLabel;
    edtLogon: TEdit;
    btnSenha: TBitBtn;
    mniSenha: TMenuItem;
    mniCadastroPerfilUsuario: TMenuItem;
    edtCodigoCadastradoBaseID: TEdit;
    edtCodigoCadastradoID: TEdit;
    tabPerfil: TTabSheet;
    lvwPerfil: TListView;
    btnPerfis: TBitBtn;
    mniLog: TMenuItem;
    mniPerfis: TMenuItem;
    mniCadastros: TMenuItem;
    tabConfiguracao: TTabSheet;
    Label1: TLabel;
    imgAdministradorOff: TImage;
    imgAdministradorOn: TImage;
    chkVigencia: TCheckBox;
    lblVigenciaPeriodo: TLabel;
    medVigenciaIniDtHr: TMaskEdit;
    lblVigenciaAte: TLabel;
    medVigenciaFimDtHr: TMaskEdit;
    imgVigenciaIniDtHr: TImage;
    imgVigenciaFimDtHr: TImage;
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
    procedure edtNomeEnter(Sender: TObject);
    procedure edtNomeExit(Sender: TObject);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
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
    procedure edtUsuarioBaseDescricaoClick(Sender: TObject);
    procedure edtInsLocalDtHrClick(Sender: TObject);
    procedure edtUpdLocalDtHrClick(Sender: TObject);
    procedure edtTipoUsuarioCodigoEnter(Sender: TObject);
    procedure edtTipoUsuarioCodigoExit(Sender: TObject);
    procedure edtTipoUsuarioCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtTipoUsuarioCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure imgTipoUsuarioSelecionarClick(Sender: TObject);
    procedure edtTipoUsuarioDescricaoClick(Sender: TObject);
    procedure mniCadastroTipoUsuarioClick(Sender: TObject);
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
    procedure mniSenhaClick(Sender: TObject);
    procedure btnSenhaClick(Sender: TObject);
    procedure mniLogClick(Sender: TObject);
    procedure mniCadastroPerfilUsuarioClick(Sender: TObject);
    procedure edtCodigoCadastradoClick(Sender: TObject);
    procedure lvwPerfilCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwPerfilCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwPerfilDblClick(Sender: TObject);
    procedure lvwPerfilKeyPress(Sender: TObject; var Key: Char);
    procedure mniPerfisClick(Sender: TObject);
    procedure btnPerfisClick(Sender: TObject);
    procedure imgAdministradorOnClick(Sender: TObject);
    procedure imgAdministradorOffClick(Sender: TObject);
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
    procedure FormularioControlarVigencia;
    procedure FormularioPerfis;
    procedure FormularioLogExibir;

    procedure FormularioSenha;
    procedure FormularioAtualizar;
    procedure FormularioNovo;

    procedure FormularioPopular(argLicencaID    : Integer;
                                argUsuarioBaseID: Integer;
                                argUsuarioID    : Integer);

    procedure FormularioPerfilPopular(argLicencaID    : Integer;
                                      argUsuarioBaseID: Integer;
                                      argUsuarioID    : Integer);

    procedure FormularioAlterar;
    procedure FormularioGravar;
    procedure FormularioCancelar;
    procedure FormularioExcluir;
    procedure FormularioCodigoSugerir;

    function LogDadosGerar(argUsuarioID: Integer = 0): string;
  public
    pubDadosAtualizados: Boolean;
    pubLicencaID       : Integer;
    pubUsuarioBaseID   : Integer;
    pubUsuarioID       : Integer;
  end;

var
  PlataformaERPVCLUsuarioCadastro: TPlataformaERPVCLUsuarioCadastro;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico,
  Plataforma_ERP_VCL_PerfilUsuarioCadastro,
  Plataforma_ERP_VCL_UsuarioPerfil,
  Plataforma_ERP_VCL_UsuarioSenha;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_UsuarioCadastro.pas';

  TAB_CADASTRO    : Byte = 0;
  TAB_CONFIGURACAO: Byte = 1;
  TAB_PERFIL      : Byte = 2;
  TAB_AUDITORIA   : Byte = 3;

  LVW_PERFIL_USUARIO_LICENCA_ID: Integer = 0;
  LVW_PERFIL_USUARIO_BASE_ID   : Integer = 1;
  LVW_PERFIL_USUARIO_ID        : Integer = 2;
  LVW_PERFIL_USUARIO_SQ        : Integer = 3;
  LVW_PERFIL_USUARIO_CODIGO    : Integer = 4;
  LVW_PERFIL_USUARIO_DESCRICAO : Integer = 5;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLUsuarioCadastro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas.
  //
  pubDadosAtualizados := False;
  pubLicencaID        := 0;
  pubUsuarioBaseID    := 0;
  pubUsuarioID        := 0;
 
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
procedure TPlataformaERPVCLUsuarioCadastro.FormShow(Sender: TObject);
begin
  //
  // Background do formul�rio.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Controla os componentes de exibi��o de cadastro.
  //
  VCLEditClickControlar(edtCodigoCadastrado,     False);
  VCLEditClickControlar(edtTipoUsuarioDescricao, False);
  VCLEditClickControlar(edtLicencaDescricao,     False);
  VCLEditClickControlar(edtUsuarioBaseDescricao, False);
  VCLEditClickControlar(edtInsLocalDtHr,         False);
  VCLEditClickControlar(edtUpdLocalDtHr,         False);

  //
  // Se nenhuma chave foi passada ent�o � um novo cadastro.
  //
  if (pubLicencaID = 0) and (pubUsuarioBaseID = 0) and (pubUsuarioID = 0) then
  begin
    FormularioNovo;
    Exit;
  end;

  //
  // Se foi passada uma chave ent�o popula formul�rio.
  //
  if (pubLicencaID > 0) and (pubUsuarioBaseID > 0) and (pubUsuarioID > 0) then
  begin
    FormularioPopular(pubLicencaID, pubUsuarioBaseID, pubUsuarioID);
    FormularioControlar(False);
    Exit;
  end;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLUsuarioCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click nas op��es do menu.
//
procedure TPlataformaERPVCLUsuarioCadastro.mniPerfisClick(Sender: TObject);
begin
  FormularioPerfis;
end;

procedure TPlataformaERPVCLUsuarioCadastro.mniLogClick(Sender: TObject);
begin
  FormularioLogExibir;
end;

procedure TPlataformaERPVCLUsuarioCadastro.mniCadastroPerfilUsuarioClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_PerfilUsuarioListaExibir;
end;

procedure TPlataformaERPVCLUsuarioCadastro.mniCadastroTipoUsuarioClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_TipoUsuarioListaExibir;
end;

procedure TPlataformaERPVCLUsuarioCadastro.mniSenhaClick(Sender: TObject);
begin
  FormularioSenha;
end;

procedure TPlataformaERPVCLUsuarioCadastro.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

procedure TPlataformaERPVCLUsuarioCadastro.mniNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

procedure TPlataformaERPVCLUsuarioCadastro.mniExcluirClick(Sender: TObject);
begin
  FormularioExcluir;
end;

procedure TPlataformaERPVCLUsuarioCadastro.mniAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

procedure TPlataformaERPVCLUsuarioCadastro.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

procedure TPlataformaERPVCLUsuarioCadastro.mniCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

procedure TPlataformaERPVCLUsuarioCadastro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLUsuarioCadastro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "c�digo".
//
procedure TPlataformaERPVCLUsuarioCadastro.edtCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigo) then Exit;
end;

procedure TPlataformaERPVCLUsuarioCadastro.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLUsuarioCadastro.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLUsuarioCadastro.edtCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigo) then Exit;
end;

//
// Evento de click no c�digo sugerido.
//
procedure TPlataformaERPVCLUsuarioCadastro.edtCodigoCadastradoClick(Sender: TObject);
var
  locFormulario      : TPlataformaERPVCLUsuarioCadastro;
  locDadosAtualizados: Boolean;
begin
  locFormulario := TPlataformaERPVCLUsuarioCadastro.Create(Self);

  locFormulario.pubLicencaID     := StringIntegerConverter(edtLicencaID.Text);
  locFormulario.pubUsuarioBaseID := StringIntegerConverter(edtCodigoCadastradoBaseID.Text);
  locFormulario.pubUsuarioID     := StringIntegerConverter(edtCodigoCadastradoID.Text);

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
// Eventos do componente "nome".
//
procedure TPlataformaERPVCLUsuarioCadastro.edtNomeEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtNome) then Exit;
end;

procedure TPlataformaERPVCLUsuarioCadastro.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLUsuarioCadastro.edtNomeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLUsuarioCadastro.edtNomeExit(Sender: TObject);
begin
  if not VCLEditSair(edtNome) then Exit;
end;

//
// Eventos do componente "tipo".
//
procedure TPlataformaERPVCLUsuarioCadastro.edtTipoUsuarioCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtTipoUsuarioCodigo) then Exit;
end;

procedure TPlataformaERPVCLUsuarioCadastro.edtTipoUsuarioCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLUsuarioCadastro.edtTipoUsuarioCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then imgTipoUsuarioSelecionarClick(Sender);
end;

procedure TPlataformaERPVCLUsuarioCadastro.edtTipoUsuarioCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtTipoUsuarioCodigo) then Exit;
  
  if not Plataforma_ERP_VCL_TipoUsuarioValidar((edtUsuarioID.Text = STR_NOVO),
                                                edtLicencaID,
                                                edtTipoUsuarioBaseID,
                                                edtTipoUsuarioID,
                                                edtTipoUsuarioCodigo,
                                                edtTipoUsuarioDescricao) then Exit;
end;

procedure TPlataformaERPVCLUsuarioCadastro.imgTipoUsuarioSelecionarClick(Sender: TObject);
begin
  if not Plataforma_ERP_VCL_TipoUsuarioSelecionar(edtLicencaID, edtTipoUsuarioBaseID, edtTipoUsuarioID, edtTipoUsuarioCodigo, edtTipoUsuarioDescricao) then Exit;
end;

procedure TPlataformaERPVCLUsuarioCadastro.edtTipoUsuarioDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_TipoUsuarioExibir(StringIntegerConverter(edtUsuarioBaseID.Text),
                                       StringIntegerConverter(edtTipoUsuarioBaseID.Text),
                                       StringIntegerConverter(edtTipoUsuarioID.Text));
end;

//
// Eventos do componente "logon".
//
procedure TPlataformaERPVCLUsuarioCadastro.edtLogonEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtLogon) then Exit;
end;

procedure TPlataformaERPVCLUsuarioCadastro.edtLogonKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLUsuarioCadastro.edtLogonExit(Sender: TObject);
begin
  if not VCLEditSair(edtLogon) then Exit;
end;

//
// Eventos do componente "administrador".
//
procedure TPlataformaERPVCLUsuarioCadastro.imgAdministradorOffClick(Sender: TObject);
begin
  if not chkVigencia.Enabled then Exit;
  imgAdministradorOff.Visible := False;
  imgAdministradorOn.Visible  := True;
end;

procedure TPlataformaERPVCLUsuarioCadastro.imgAdministradorOnClick(Sender: TObject);
begin
  if not chkVigencia.Enabled then Exit;
  imgAdministradorOff.Visible := True;
  imgAdministradorOn.Visible  := False;
end;


//
// Eventos do componente "bloqueado".
//
procedure TPlataformaERPVCLUsuarioCadastro.chkBloqueadoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkBloqueado) then Exit;
end;

procedure TPlataformaERPVCLUsuarioCadastro.chkBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLUsuarioCadastro.chkBloqueadoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkBloqueado) then Exit;
end;

//
// Ativo.
//
procedure TPlataformaERPVCLUsuarioCadastro.chkAtivoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkAtivo) then Exit;
end;

procedure TPlataformaERPVCLUsuarioCadastro.chkAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLUsuarioCadastro.chkAtivoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkAtivo) then Exit;
end;

//
// Vig�ncia.
//
procedure TPlataformaERPVCLUsuarioCadastro.chkVigenciaClick(Sender: TObject);
begin
  FormularioControlarVigencia;
end;

//
// Data inicial de vig�ncia.
//
procedure TPlataformaERPVCLUsuarioCadastro.medVigenciaIniDtHrEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medVigenciaIniDtHr) then Exit;
end;

procedure TPlataformaERPVCLUsuarioCadastro.medVigenciaIniDtHrKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLUsuarioCadastro.medVigenciaIniDtHrKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medVigenciaIniDtHr);
end;

procedure TPlataformaERPVCLUsuarioCadastro.medVigenciaIniDtHrExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medVigenciaIniDtHr) then Exit;
  if not VCLMaskEditDataValidar(medVigenciaIniDtHr) then Exit;
end;

procedure TPlataformaERPVCLUsuarioCadastro.imgVigenciaIniDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medVigenciaIniDtHr);
end;

//
// Data final de vig�ncia.
//
procedure TPlataformaERPVCLUsuarioCadastro.medVigenciaFimDtHrEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medVigenciaFimDtHr) then Exit;
end;

procedure TPlataformaERPVCLUsuarioCadastro.medVigenciaFimDtHrKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLUsuarioCadastro.medVigenciaFimDtHrKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medVigenciaFimDtHr); 
end;

procedure TPlataformaERPVCLUsuarioCadastro.medVigenciaFimDtHrExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medVigenciaFimDtHr) then Exit;
  if not VCLMaskEditDataValidar(medVigenciaFimDtHr) then Exit;
end;

procedure TPlataformaERPVCLUsuarioCadastro.imgVigenciaFimDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medVigenciaFimDtHr);
end;

//
// Eventos do componente "lista de perfis".
//
procedure TPlataformaERPVCLUsuarioCadastro.lvwPerfilCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLUsuarioCadastro.lvwPerfilCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLUsuarioCadastro.lvwPerfilDblClick(Sender: TObject);
var
  locIndice             : Integer;
  locLicencaID          : Integer;
  locPerfilUsuarioBaseID: Integer;
  locPerfilUsuarioID    : Integer;
  locFormulario         : TPlataformaERPVCLPerfilUsuarioCadastro;
  locDadosAtualizados   : Boolean;
begin
  if not edtCodigo.ReadOnly then Exit;

  locIndice := VCLListViewIndiceItemRetornar(lvwPerfil);
  if locIndice <= VCL_NENHUM_INDICE then Exit;

  locLicencaID           := StringIntegerConverter(lvwPerfil.Items.Item[locIndice].SubItems.Strings[LVW_PERFIL_USUARIO_LICENCA_ID]);
  locPerfilUsuarioBaseID := StringIntegerConverter(lvwPerfil.Items.Item[locIndice].SubItems.Strings[LVW_PERFIL_USUARIO_BASE_ID]);
  locPerfilUsuarioID     := StringIntegerConverter(lvwPerfil.Items.Item[locIndice].SubItems.Strings[LVW_PERFIL_USUARIO_ID]);

  locFormulario := TPlataformaERPVCLPerfilUsuarioCadastro.Create(Self);
  
  locFormulario.pubLicencaID           := locLicencaID;
  locFormulario.pubPerfilUsuarioBaseID := locPerfilUsuarioBaseID;
  locFormulario.pubPerfilUsuarioID     := locPerfilUsuarioID;
  
  locFormulario.ShowModal;

  locDadosAtualizados := locFormulario.pubDadosAtualizados;

  locFormulario.Release;
  FreeAndNil(locFormulario);

  if locDadosAtualizados then
  begin
    FormularioPerfilPopular(locLicencaID, StringIntegerConverter(edtUsuarioBaseID.Text), StringIntegerConverter(edtUsuarioID.Text));
  end;
end;

procedure TPlataformaERPVCLUsuarioCadastro.lvwPerfilKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwPerfilDblClick(Sender);
end;

//
// Evento de click no t�tulo da licen�a.
//
procedure TPlataformaERPVCLUsuarioCadastro.edtLicencaDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_LicencaCadastroExibir(StringIntegerConverter(edtLicencaID.Text));
end;

//
// Evento de click no t�tulo da base.
//
procedure TPlataformaERPVCLUsuarioCadastro.edtUsuarioBaseDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_BaseCadastroExibir(StringIntegerConverter(edtUsuarioBaseID.Text));
end;

//
// Evento de click na data de cria��o.
//
procedure TPlataformaERPVCLUsuarioCadastro.edtInsLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtInsLocalDtHr.Text));
end;

//
// Evento de click na data da �ltima altera��o.
//
procedure TPlataformaERPVCLUsuarioCadastro.edtUpdLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtUpdLocalDtHr.Text));
end;

//
// Evento de click no bot�o "perfis".
//
procedure TPlataformaERPVCLUsuarioCadastro.btnPerfisClick(Sender: TObject);
begin
  FormularioPerfis;
end;

//
// Evento de click no bot�o "log altera��es".
//
procedure TPlataformaERPVCLUsuarioCadastro.btnLogClick(Sender: TObject);
begin
  FormularioLogExibir;
end;

//
// Evento de click no bot�o "senha".
//
procedure TPlataformaERPVCLUsuarioCadastro.btnSenhaClick(Sender: TObject);
begin
  FormularioSenha;
end;

//
// Evento de click no bot�o "novo".
//
procedure TPlataformaERPVCLUsuarioCadastro.btnNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

//
// Evento de click no bot�o "alterar".
//
procedure TPlataformaERPVCLUsuarioCadastro.btnAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

//
// Evento de click no bot�o "gravar".
//
procedure TPlataformaERPVCLUsuarioCadastro.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no bot�o "minimizar".
//
procedure TPlataformaERPVCLUsuarioCadastro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "cancelar".
//
procedure TPlataformaERPVCLUsuarioCadastro.btnCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLUsuarioCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLUsuarioCadastro.FormularioLimpar;
begin 
  //
  // Posiciona pagecontrole na primeira aba.
  //
  VCLPageControlInicializar(pagFormulario);

  // Limpa componentes da aba "cadastro".
  VCLEditLimpar    (edtCodigo);
  VCLEditLimpar    (edtNome);
  VCLEditLimpar    (edtTipoUsuarioBaseID);
  VCLEditLimpar    (edtTipoUsuarioID);
  VCLEditLimpar    (edtTipoUsuarioCodigo);
  VCLEditLimpar    (edtTipoUsuarioDescricao);
  VCLEditLimpar    (edtLogon);
  VCLCheckBoxLimpar(chkBloqueado);
  VCLCheckBoxLimpar(chkAtivo);

  VCLCheckBoxLimpar(chkVigencia);
  VCLMaskEditLimpar(medVigenciaIniDtHr);
  VCLMaskEditLimpar(medVigenciaFimDtHr);
  FormularioControlarVigencia;

  imgAdministradorOff.Visible := True;
  imgAdministradorOn.Visible  := False;

  VCLEditLimpar(edtCodigoCadastrado);
  VCLEditLimpar(edtCodigoCadastradoBaseID);
  VCLEditLimpar(edtCodigoCadastradoID);

  //
  // Limpa componentes da aba "perfil".
  //
  VCLListViewLimpar(lvwPerfil);

  //
  // Limpa componentes da aba "auditoria".
  //
  VCLEditLimpar(edtLicencaID);
  VCLEditLimpar(edtLicencaDescricao);
  VCLEditLimpar(edtUsuarioBaseID);
  VCLEditLimpar(edtUsuarioBaseDescricao);
  VCLEditLimpar(edtUsuarioID);
  VCLEditLimpar(edtInsLocalDtHr);
  VCLEditLimpar(edtUpdLocalDtHr);
  VCLEditLimpar(edtUpdContador);
end;

//
// Procedimento para controlar os componentes do formul�rio.
//
procedure TPlataformaERPVCLUsuarioCadastro.FormularioControlar(argEditar: Boolean);
var
  locDadosPopulados: Boolean;
  locIdentificador : string;
begin
  //
  // Determina se existem dados populados no formul�rio.
  //
  locDadosPopulados := (StringIntegerConverter(edtUsuarioID.Text) > 0);

  //
  // Controla os componentes do formul�rio.
  //
  VCLEditControlar(edtCodigo,            argEditar);
  VCLEditControlar(edtNome,              argEditar);
  VCLEditControlar(edtTipoUsuarioCodigo, argEditar);
  VCLEditControlar(edtLogon,             argEditar);
  gbxOpcoes.Enabled := argEditar;

  chkVigencia.Enabled := argEditar;
  VCLMaskEditControlar(medVigenciaIniDtHr, argEditar);
  VCLMaskEditControlar(medVigenciaFimDtHr, argEditar);  

  if not argEditar then
  begin
    imgAdministradorOff.Cursor := crDefault;
    imgAdministradorOn.Cursor  := crDefault;
  end
  else
  begin
    imgAdministradorOff.Cursor := crHandPoint;
    imgAdministradorOn.Cursor  := crHandPoint;
  end;

  //
  // Exibe o �ltimo c�digo cadastrado somente se for um novo cadastro.
  //
  lblCodigoCadastrado.Visible := (argEditar) and (not locDadosPopulados);
  edtCodigoCadastrado.Visible := (argEditar) and (not locDadosPopulados);

  //
  // Controla os componentes de exibi��o de cadastro.
  //
  VCLEditClickControlar(edtTipoUsuarioDescricao, True);
  VCLEditClickControlar(edtLicencaDescricao,     True);
  VCLEditClickControlar(edtUsuarioBaseDescricao, True);
  VCLEditClickControlar(edtInsLocalDtHr,         True);
  VCLEditClickControlar(edtUpdLocalDtHr,         True);

  //
  // Controle os componentes com sele��o de dados.
  //
  VCLEditSelecaoControlar(edtTipoUsuarioDescricao, imgTipoUsuarioSelecionar, argEditar);

  //
  // Controla os itens de menu do formul�rio.
  //
  mniPerfis.Visible    := (not argEditar) and (locDadosPopulados);
  mniLog.Visible       := (not argEditar) and (locDadosPopulados);
  mniSenha.Visible     := (not argEditar) and (locDadosPopulados);
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
  tabCadastro.TabVisible     := Plataforma_ERP_UsuarioRotina('ERP_USUARIO_CADASTRO_ABA_CADASTRO');
  tabConfiguracao.TabVisible := Plataforma_ERP_UsuarioRotina('ERP_USUARIO_CADASTRO_ABA_CONFIGURACAO');
  tabPerfil.TabVisible       := Plataforma_ERP_UsuarioRotina('ERP_USUARIO_CADASTRO_ABA_PERFIL');
  tabAuditoria.TabVisible    := Plataforma_ERP_UsuarioRotina('ERP_USUARIO_CADASTRO_ABA_AUDITORIA');

  mniSenha.Visible     := (mniSenha.Visible)     and (Plataforma_ERP_UsuarioRotina('ERP_USUARIO_CADASTRO_SENHA'));
  mniAtualizar.Visible := (mniAtualizar.Visible) and (Plataforma_ERP_UsuarioRotina('ERP_USUARIO_CADASTRO_ATUALIZAR'));
  mniNovo.Visible      := (mniNovo.Visible)      and (Plataforma_ERP_UsuarioRotina('ERP_USUARIO_CADASTRO_NOVO'));
  mniExcluir.Visible   := (mniExcluir.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_USUARIO_CADASTRO_EXCLUIR'));
  mniAlterar.Visible   := (mniAlterar.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_USUARIO_CADASTRO_ALTERAR'));

  //
  // Itens do menu cadastro.
  //
  mniCadastroPerfilUsuario.Visible := Plataforma_ERP_UsuarioRotina('ERP_PERFIL_USUARIO_LISTA');
  mniCadastroTipoUsuario.Visible   := Plataforma_ERP_UsuarioRotina('ERP_TIPO_USUARIO_LISTA');

  //
  // Itens do menu adicional.
  //
  mniPerfis.Visible    := (mniPerfis.Visible) and (Plataforma_ERP_UsuarioRotina('ERP_PERFIL_USUARIO_LISTA'));
  mniLog.Visible       := (mniLog.Visible)    and (Plataforma_ERP_UsuarioRotina('ERP_USUARIO_CADASTRO_LOG'));
  mniCadastros.Visible := (mniCadastroPerfilUsuario.Visible) or (mniCadastroTipoUsuario.Visible);

  mniAdicional.Visible := (mniPerfis.Visible) or
                          (mniLog.Visible)    or
                          (mniCadastros.Visible);
                          
  //
  // Bot�es.
  //
  btnPerfis.Visible    := mniPerfis.Visible;
  btnLog.Visible       := mniLog.Visible;
  btnSenha.Visible     := mniSenha.Visible;
  btnNovo.Visible      := mniNovo.Visible;
  btnAlterar.Visible   := mniAlterar.Visible;
  btnGravar.Visible    := mniGravar.Visible;
  btnMinimizar.Visible := mniMinimizar.Visible;
  btnCancelar.Visible  := mniCancelar.Visible;
  btnFechar.Visible    := mniFechar.Visible;

  //
  // Ajusta o t�tulo do formul�rio.
  //
  Self.Caption     := 'Usu�rio';
  locIdentificador := ': ' + edtNome.Text;

  if (not locDadosPopulados) and (argEditar) then Self.Caption := Self.Caption + ' - novo cadastro';
  if locDadosPopulados and argEditar         then Self.Caption := Self.Caption + ' - alterando cadastro'   + locIdentificador;
  if locDadosPopulados and (not argEditar)   then Self.Caption := Self.Caption + ' - consultando cadastro' + locIdentificador;
end;

//
// Procedimento para controlar a exibi��o dos componentes de acordo com a vig�ncia.
//
procedure TPlataformaERPVCLUsuarioCadastro.FormularioControlarVigencia;
var
  locVigencia: Boolean;
begin
  locVigencia := chkVigencia.Checked;

  VCLLabelHabilitar(lblVigenciaPeriodo,    locVigencia);
  VCLMaskEditHabilitar(medVigenciaIniDtHr, locVigencia);
  imgVigenciaIniDtHr.Visible := locVigencia;
  VCLLabelHabilitar(lblVigenciaAte,        locVigencia);
  VCLMaskEditHabilitar(medVigenciaFimDtHr, locVigencia);
  imgVigenciaFimDtHr.Visible := locVigencia;  
end;

//
// Procedimento para exibir a sele��o de perfis de usu�rio.
//
procedure TPlataformaERPVCLUsuarioCadastro.FormularioPerfis;
var
  locLicencaID    : Integer;
  locUsuarioBaseID: Integer;
  locUsuarioID    : Integer;
  locUpdContador  : Integer;
  locFormulario   : TPlataformaERPVCLUsuarioPerfil;
  locClicouFechar : Boolean;
begin
  locLicencaID     := StringIntegerConverter(edtLicencaID.Text);
  locUsuarioBaseID := StringIntegerConverter(edtUsuarioBaseID.Text);
  locUsuarioID     := StringIntegerConverter(edtUsuarioID.Text);
  locUpdContador   := StringIntegerConverter(edtUpdContador.Text);

  locFormulario := TPlataformaERPVCLUsuarioPerfil.Create(Self);

  locFormulario.pubLicencaID     := locLicencaID;
  locFormulario.pubUsuarioBaseID := locUsuarioBaseID;
  locFormulario.pubUsuarioID     := locUsuarioID;
  locFormulario.pubUpdContador   := locUpdContador;

  locFormulario.ShowModal;

  locClicouFechar := locFormulario.pubClicouFechar;

  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    FormularioPerfilPopular(locLicencaID, locUsuarioBaseID, locUsuarioID);
  end;
end;

//
// Procedimento para carregar e exibir o log de altera��es do registro.
//
procedure TPlataformaERPVCLUsuarioCadastro.FormularioLogExibir;
const
  PROCEDIMENTO_NOME: string = 'FormularioLogExibir';
  ERRO_MENSAGEM    : string = 'Imposs�vel consultar dados sobre os logs do registro!';
var
  locADOConnection : TADOConnection;
  locADOQuery      : TADOQuery;
  locLogMensagem   : string;
  locLicencaID     : Integer;
  locUsuarioBaseID : Integer;
  locUsuarioID     : Integer;
begin
  //
  // Carrega chave do registro.
  //
  locLicencaID     := StringIntegerConverter(edtLicencaID.Text);
  locUsuarioBaseID := StringIntegerConverter(edtUsuarioBaseID.Text);
  locUsuarioID     := StringIntegerConverter(edtUsuarioID.Text);

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
  locADOQuery.SQL.Add('  [usuario_log].[usuario_log_sq]     AS [sequencial],                        ');  
  locADOQuery.SQL.Add('  [base].[base_id]                   AS [log_base_id],                       ');
  locADOQuery.SQL.Add('  [base].[descricao]                 AS [log_base_descricao],                ');
  locADOQuery.SQL.Add('  [usuario_log].[log_local_dt_hr]    AS [log_local_dt_hr],                   ');
  locADOQuery.SQL.Add('  [usuario_log].[log_server_dt_hr]   AS [log_server_dt_hr],                  ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_id] AS [registro_acao_id],                  ');
  locADOQuery.SQL.Add('  [registro_acao].[descricao]        AS [registro_acao_descricao],           ');
  locADOQuery.SQL.Add('  [usuario_log].[host_name]          AS [host_name],                         ');
  locADOQuery.SQL.Add('  [usuario_log].[user_name]          AS [user_name],                         ');
  locADOQuery.SQL.Add('  [usuario].[usuario_base_id]        AS [usuario_base_id],                   ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id]             AS [usuario_id],                        ');
  locADOQuery.SQL.Add('  [usuario].[nome]                   AS [usuario_nome],                      ');  
  locADOQuery.SQL.Add('  [usuario_log].[mensagem]           AS [mensagem],                          ');
  locADOQuery.SQL.Add('  [usuario_log].[dados]              AS [dados]                              ');
  locADOQuery.SQL.Add('FROM                                                                         ');  
  locADOQuery.SQL.Add('  [usuario_log] WITH (NOLOCK)                                                ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                                            ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [usuario_log].[log_base_id]                        ');
  locADOQuery.SQL.Add('  INNER JOIN [registro_acao] WITH (NOLOCK)                                   ');
  locADOQuery.SQL.Add('    ON [registro_acao].[registro_acao_id] = [usuario_log].[registro_acao_id] ');
  locADOQuery.SQL.Add('  INNER JOIN [usuario] WITH (NOLOCK)                                         ');
  locADOQuery.SQL.Add('    ON [usuario].[licenca_id]      = [usuario_log].[licenca_id]          AND ');
  locADOQuery.SQL.Add('       [usuario].[usuario_base_id] = [usuario_log].[log_usuario_base_id] AND ');
  locADOQuery.SQL.Add('       [usuario].[usuario_id]      = [usuario_log].[log_usuario_id]          ');
  locADOQuery.SQL.Add('WHERE                                                                        ');
  locADOQuery.SQL.Add('  [usuario_log].[licenca_id]      = :licenca_id      AND                     ');
  locADOQuery.SQL.Add('  [usuario_log].[usuario_base_id] = :usuario_base_id AND                     ');
  locADOQuery.SQL.Add('  [usuario_log].[usuario_id]      = :usuario_id                              ');
  locADOQuery.SQL.Add('ORDER BY                                                                     ');
  locADOQuery.SQL.Add('  [usuario_log].[usuario_log_sq] ASC                                         ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value      := locUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar registros da tabela [usuario_log]!';
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
    Plataforma_ERP_VCL_LogRegistroExibir('Usu�rio: ' + edtNome.Text, locADOQuery);
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
// Procedimento para exibir o formul�rio de senha.
//
procedure TPlataformaERPVCLUsuarioCadastro.FormularioSenha;
var
  locFormulario   : TPlataformaERPVCLUsuarioSenha;
  locLicencaID    : Integer;
  locUsuarioBaseID: Integer;
  locUsuarioID    : Integer;
  locClicouFechar : Boolean;
begin
  locLicencaID     := StringIntegerConverter(edtLicencaID.Text);
  locUsuarioBaseID := StringIntegerConverter(edtUsuarioBaseID.Text);
  locUsuarioID     := StringIntegerConverter(edtUsuarioID.Text);

  locFormulario := TPlataformaERPVCLUsuarioSenha.Create(Self);
  locFormulario.pubLicencaID     := locLicencaID;
  locFormulario.pubUsuarioBaseID := locUsuarioBaseID;
  locFormulario.pubUsuarioID     := locUsuarioID;
  locFormulario.ShowModal;

  locClicouFechar := locFormulario.pubClicouFechar;

  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    FormularioPopular(locLicencaID, locUsuarioBaseID, locUsuarioID);
  end;
end;

//
// Procedimento para atualizar os dados populados nos componentes do formul�rio.
//
procedure TPlataformaERPVCLUsuarioCadastro.FormularioAtualizar;
begin
  //
  // Popula componentes com as informa��es do cadastro.
  //
  FormularioPopular(StringIntegerConverter(edtLicencaID.Text),
                    StringIntegerConverter(edtUsuarioBaseID.Text),
                    StringIntegerConverter(edtUsuarioID.Text));

  //
  // Controla a exibi��o dos componentes.
  //
  FormularioControlar(False);
end;

//
// Procedimento para iniciar a digita��o de dados de um novo cadastro.
//
procedure TPlataformaERPVCLUsuarioCadastro.FormularioNovo;
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
  edtUsuarioBaseID.Text        := IntegerStringConverter(gloBaseID,    True);
  edtUsuarioBaseDescricao.Text := gloBaseDescricao;
  edtUsuarioID.Text            := STR_NOVO;
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
procedure TPlataformaERPVCLUsuarioCadastro.FormularioPopular(argLicencaID    : Integer;
                                                             argUsuarioBaseID: Integer;
                                                             argUsuarioID    : Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
  ERRO_MENSAGEM    : string = 'Imposs�vel consultar dados do usu�rio!';
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
  locADOQuery.SQL.Add('SELECT                                                                              ');
  locADOQuery.SQL.Add('  [licenca].[licenca_id],                                                           ');
  locADOQuery.SQL.Add('  [licenca].[descricao] AS [licenca_descricao],                                     ');
  locADOQuery.SQL.Add('  [base].[base_id]      AS [usuario_base_id],                                       ');
  locADOQuery.SQL.Add('  [base].[descricao]    AS [usuario_base_descricao],                                ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id],                                                           ');  
  locADOQuery.SQL.Add('  [usuario].[codigo],                                                               ');
  locADOQuery.SQL.Add('  [usuario].[nome],                                                                 ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_base_id] AS [tipo_usuario_base_id],                  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_id]      AS [tipo_usuario_id],                       ');
  locADOQuery.SQL.Add('  [tipo_usuario].[codigo]               AS [tipo_usuario_codigo],                   ');
  locADOQuery.SQL.Add('  [tipo_usuario].[descricao]            AS [tipo_usuario_descricao],                ');
  locADOQuery.SQL.Add('  [usuario].[vigencia],                                                             ');
  locADOQuery.SQL.Add('  [usuario].[vigencia_ini_dt_hr],                                                   ');
  locADOQuery.SQL.Add('  [usuario].[vigencia_fim_dt_hr],                                                   '); 
  locADOQuery.SQL.Add('  [usuario].[logon],                                                                ');
  locADOQuery.SQL.Add('  [usuario].[administrador],                                                        ');
  locADOQuery.SQL.Add('  [usuario].[bloqueado],                                                            ');
  locADOQuery.SQL.Add('  [usuario].[ativo],                                                                ');
  locADOQuery.SQL.Add('  [usuario].[ins_local_dt_hr],                                                      ');
  locADOQuery.SQL.Add('  [usuario].[upd_local_dt_hr],                                                      ');
  locADOQuery.SQL.Add('  [usuario].[upd_contador]                                                          ');  
  locADOQuery.SQL.Add('FROM                                                                                ');
  locADOQuery.SQL.Add('  [usuario] WITH (NOLOCK)                                                           ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                                                   ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [usuario].[usuario_base_id]                               ');
  locADOQuery.SQL.Add('  INNER JOIN [licenca] WITH (NOLOCK)                                                ');
  locADOQuery.SQL.Add('    ON [licenca].[licenca_id] = [usuario].[licenca_id]                              ');
  locADOQuery.SQL.Add('  INNER JOIN [tipo_usuario] WITH (NOLOCK)                                           ');
  locADOQuery.SQL.Add('    ON [tipo_usuario].[licenca_id]           = [usuario].[licenca_id]           AND ');
  locADOQuery.SQL.Add('       [tipo_usuario].[tipo_usuario_base_id] = [usuario].[tipo_usuario_base_id] AND ');
  locADOQuery.SQL.Add('       [tipo_usuario].[tipo_usuario_id]      = [usuario].[tipo_usuario_id]          ');
  locADOQuery.SQL.Add('WHERE                                                                               ');
  locADOQuery.SQL.Add('  [usuario].[licenca_id]      = :licenca_id      AND                                ');
  locADOQuery.SQL.Add('  [usuario].[usuario_base_id] = :usuario_base_id AND                                ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id]      = :usuario_id                                         ');
                                                              
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := argLicencaID;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value := argUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value      := argUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [usuario]!';
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
    edtCodigo.Text := locADOQuery.FieldByName('codigo').AsString;
    edtNome.Text   := locADOQuery.FieldByName('nome').AsString;

    edtTipoUsuarioBaseID.Text    := locADOQuery.FieldByName('tipo_usuario_base_id').AsString;
    edtTipoUsuarioID.Text        := locADOQuery.FieldByName('tipo_usuario_id').AsString;
    edtTipoUsuarioCodigo.Text    := locADOQuery.FieldByName('tipo_usuario_codigo').AsString;
    edtTipoUsuarioDescricao.Text := locADOQuery.FieldByName('tipo_usuario_descricao').AsString;

    edtLogon.Text := locADOQuery.FieldByName('logon').AsString;
    
    chkBloqueado.Checked     := StringBooleanConverter(locADOQuery.FieldByName('bloqueado').AsString);
    chkAtivo.Checked         := StringBooleanConverter(locADOQuery.FieldByName('ativo').AsString);

    chkVigencia.Checked     := StringBooleanConverter(locADOQuery.FieldByName('vigencia').AsString);
    medVigenciaIniDtHr.Text := DateTimeStringConverter(locADOQuery.FieldByName('vigencia_ini_dt_hr').AsDateTime, 'dd/mm/yyyy');
    medVigenciaFimDtHr.Text := DateTimeStringConverter(locADOQuery.FieldByName('vigencia_fim_dt_hr').AsDateTime, 'dd/mm/yyyy');
    FormularioControlarVigencia;

    imgAdministradorOff.Visible := (not StringBooleanConverter(locADOQuery.FieldByName('administrador').AsString));
    imgAdministradorOn.Visible  := (not imgAdministradorOff.Visible);

    edtLicencaID.Text            := locADOQuery.FieldByName('licenca_id').AsString;
    edtLicencaDescricao.Text     := locADOQuery.FieldByName('licenca_descricao').AsString;
    edtUsuarioBaseID.Text        := locADOQuery.FieldByName('usuario_base_id').AsString;
    edtUsuarioBaseDescricao.Text := locADOQuery.FieldByName('usuario_base_descricao').AsString;
    edtUsuarioID.Text            := IntegerStringConverter(locADOQuery.FieldByName('usuario_id').AsInteger, True);
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

  //
  // Popula os componentes da aba perfil.
  //
  FormularioPerfilPopular(argLicencaID, argUsuarioBaseID, argUsuarioID);
end;

//
// Procedimento para popular a aba de informa��es sobre os perfis do usu�rio.
//
procedure TPlataformaERPVCLUsuarioCadastro.FormularioPerfilPopular(argLicencaID    : Integer;
                                                                   argUsuarioBaseID: Integer;
                                                                   argUsuarioID    : Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioPerfilPopular';
  ERRO_MENSAGEM    : string = 'Imposs�vel consultar dados do perfil do usu�rio!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
  locListItem     : TListItem;
begin
  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Limpa os componentes da aba perfil.
  //
  VCLListViewLimpar(lvwPerfil);

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
  locADOQuery.SQL.Add('SELECT                                                                                           ');
  locADOQuery.SQL.Add('  [usuario].[upd_local_dt_hr],                                                                   ');
  locADOQuery.SQL.Add('  [usuario].[upd_contador],                                                                      ');
  locADOQuery.SQL.Add('  [usuario_perfil].[licenca_id],                                                                 ');
  locADOQuery.SQL.Add('  [usuario_perfil].[usuario_perfil_sq],                                                          ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_base_id],                                                     ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_id],                                                          ');
  locADOQuery.SQL.Add('  [perfil_usuario].[codigo],                                                                     ');
  locADOQuery.SQL.Add('  [perfil_usuario].[descricao]                                                                   ');
  locADOQuery.SQL.Add('FROM                                                                                             ');
  locADOQuery.SQL.Add('  [usuario] WITH (NOLOCK)                                                                        ');  
  locADOQuery.SQL.Add('  INNER JOIN [usuario_perfil] WITH (NOLOCK)                                                      ');
  locADOQuery.SQL.Add('    ON [usuario_perfil].[licenca_id]      = [usuario].[licenca_id]      AND                      ');
  locADOQuery.SQL.Add('       [usuario_perfil].[usuario_base_id] = [usuario].[usuario_base_id] AND                      ');
  locADOQuery.SQL.Add('       [usuario_perfil].[usuario_id]      = [usuario].[usuario_id]                               ');
  locADOQuery.SQL.Add('  INNER JOIN [perfil_usuario] WITH (NOLOCK)                                                      ');
  locADOQuery.SQL.Add('    ON [perfil_usuario].[licenca_id]             = [usuario_perfil].[licenca_id]             AND ');
  locADOQuery.SQL.Add('       [perfil_usuario].[perfil_usuario_base_id] = [usuario_perfil].[perfil_usuario_base_id] AND ');
  locADOQuery.SQL.Add('       [perfil_usuario].[perfil_usuario_id]      = [usuario_perfil].[perfil_usuario_id]          ');
  locADOQuery.SQL.Add('WHERE                                                                                            ');
  locADOQuery.SQL.Add('  [usuario].[licenca_id]      = :licenca_id      AND                                             ');
  locADOQuery.SQL.Add('  [usuario].[usuario_base_id] = :usuario_base_id AND                                             ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id]      = :usuario_id                                                      ');
                                                              
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := argLicencaID;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value := argUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value      := argUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar os registros da tabela [usuario_perfil]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  locADOQuery.Last;
  locADOQuery.First;

  //
  // Registro encontrado.
  //
  if locADOQuery.RecordCount > 0 then
  begin
    edtUpdLocalDtHr.Text := DateTimeStringConverter(locADOQuery.FieldByName('upd_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn');
    edtUpdContador.Text  := IntegerStringConverter(locADOQuery.FieldByName('upd_contador').AsInteger);
  
    lvwPerfil.Items.BeginUpdate;
    while not locADOQuery.Eof do
    begin
      locListItem := lvwPerfil.Items.Add;
      locListItem.Caption := '';
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('licenca_id').AsInteger));
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('perfil_usuario_base_id').AsInteger));
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('perfil_usuario_id').AsInteger));
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('usuario_perfil_sq').AsInteger));
      locListItem.SubItems.Add(locADOQuery.FieldByName('codigo').AsString);
      locListItem.SubItems.Add(locADOQuery.FieldByName('descricao').AsString);
    
      locADOQuery.Next;
    end;
    lvwPerfil.Items.EndUpdate;
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
procedure TPlataformaERPVCLUsuarioCadastro.FormularioAlterar;
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
procedure TPlataformaERPVCLUsuarioCadastro.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioGravar';
  ERRO_MENSAGEM    : string = 'Imposs�vel gravar dados do usu�rio!';
var
  locADOConnection    : TADOConnection;
  locADOQuery         : TADOQuery;
  locLogMensagem      : string;

  locInsert           : Boolean;
  locRegistroAcao     : Byte;
  locRegistroAcaoID   : Integer;
  locUsuarioLogSq     : Integer;
  locUsuarioLogMsg    : string;
  locUsuarioLogDados  : string;

  locLicencaID        : Integer;
  locUsuarioBaseID    : Integer;
  locUsuarioID        : Integer;
  locCodigo           : string;
  locNome             : string;
  locTipoUsuarioBaseID: Integer;
  locTipoUsuarioID    : Integer;
  locLogon            : string;
  locVigencia         : Boolean;
  locVigenciaIniDtHr  : TDateTime;
  locVigenciaFimDtHr  : TDateTime;
  locAdministrador    : Boolean;
  locBloqueado        : Boolean;
  locAtivo            : Boolean;
  locInsLocalDtHr     : TDateTime;
  locUpdLocalDtHr     : TDateTime;
  locLogUsuarioBaseID : Integer;
  locLogUsuarioID     : Integer;
  locUpdContador      : Integer;
  locHostName         : string;
  locUserName         : string;
begin
  //
  // Determina se ser� um insert ou update.
  //
  if edtUsuarioID.Text = STR_NOVO then
    locInsert := True
  else
    locInsert := False;

  //
  // Carrega vari�veis com o conte�do dos componentes.
  //
  locLicencaID         := StringIntegerConverter(edtLicencaID.Text);
  locUsuarioBaseID     := StringIntegerConverter(edtUsuarioBaseID.Text);
  locUsuarioID         := StringIntegerConverter(edtUsuarioID.Text);
  locCodigo            := StringTrim(edtCodigo.Text);
  locNome              := StringTrim(edtNome.Text);
  locTipoUsuarioBaseID := StringIntegerConverter(edtTipoUsuarioBaseID.Text);
  locTipoUsuarioID     := StringIntegerConverter(edtTipoUsuarioID.Text);
  locVigencia          := chkVigencia.Checked;
  locVigenciaIniDtHr   := StringDateTimeConverter(medVigenciaIniDtHr.Text);
  locVigenciaFimDtHr   := StringDateTimeConverter(medVigenciaFimDtHr.Text);
  locAdministrador     := imgAdministradorOn.Visible;  
  locLogon             := StringTrim(edtLogon.Text);
  locBloqueado         := chkBloqueado.Checked;
  locAtivo             := chkAtivo.Checked;
  locLogUsuarioBaseID  := gloUsuarioBaseID;
  locLogUsuarioID      := gloUsuarioID;
  locHostName          := HostNameRecuperar;
  locUserName          := UserNameRecuperar;
  locUpdContador       := StringIntegerConverter(edtUpdContador.Text);

  //
  // Ajusta detelhe da vig�ncia.
  //
  if not locVigencia then
  begin
    locVigenciaIniDtHr := 0;
    locVigenciaFimDtHr := 0;
  end;

  //
  // Consiste as informa��es.
  //
  if locCodigo = '' then
  begin
    VCLConsistenciaExibir('O c�digo do usu�rio deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
    Exit;
  end;

  if locNome = '' then
  begin
    VCLConsistenciaExibir('O nome do usu�rio deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtNome);
    Exit;
  end;

  if (locTipoUsuarioBaseID = 0) or (locTipoUsuarioBaseID = 0) then
  begin
    VCLConsistenciaExibir('O tipo do usu�rio deve ser selecionado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtTipoUsuarioCodigo);
    Exit;
  end;

  if locVigencia then
  begin
    if locVigenciaIniDtHr <= 0 then
    begin
      VCLConsistenciaExibir('a data inicial da vig�ncia deve ser informada!');
      VCLPageControlFocar(pagFormulario, TAB_CONFIGURACAO, medVigenciaIniDtHr);
      Exit;
    end;

    if locVigenciaFimDtHr <= 0 then
    begin
      VCLConsistenciaExibir('a data final da vig�ncia deve ser informada!');
      VCLPageControlFocar(pagFormulario, TAB_CONFIGURACAO, medVigenciaFimDtHr);
      Exit;
    end;    

    if locVigenciaFimDtHr < locVigenciaIniDtHr then
    begin
      VCLConsistenciaExibir('a data final da vig�ncia n�o deve ser anterior a data inicial!');
      VCLPageControlFocar(pagFormulario, TAB_CONFIGURACAO, medVigenciaIniDtHr);
      Exit;
    end;        
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
  // Determina se o c�digo do usu�rio j� existe no banco de dados para um outro registro.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                                         ');
  locADOQuery.SQL.Add('  1                                                  ');
  locADOQuery.SQL.Add('FROM                                                 ');
  locADOQuery.SQL.Add('  [usuario] WITH (NOLOCK)                            ');
  locADOQuery.SQL.Add('WHERE                                                ');
  locADOQuery.SQL.Add('  [usuario].[licenca_id]      = :licenca_id      AND ');
  locADOQuery.SQL.Add('  [usuario].[usuario_base_id] = :usuario_base_id AND ');
  locADOQuery.SQL.Add('  [usuario].[codigo]          = :codigo          AND ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id]     <> :usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('codigo').Value          := locCodigo;
  locADOQuery.Parameters.ParamByName('usuario_id').Value      := locUsuarioID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar o mesmo c�digo de usu�rio em um outro registro!';
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
    locLogMensagem := 'O c�digo "' + locCodigo + '" informado para o usu�rio j� existe em algum outro cadastro!';
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
    locADOQuery.SQL.Add('  [usuario].[upd_contador]                           ');
    locADOQuery.SQL.Add('FROM                                                 ');
    locADOQuery.SQL.Add('  [usuario] WITH (NOLOCK)                            ');
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
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualiza��es confere na tabela [usuario]!';
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
    locUsuarioLogMsg := MENSAGEM_REGISTRO_ACAO_CRIADO;
  end
  else
  begin
    locRegistroAcao  := REGISTRO_ACAO_ALTERACAO;
    locUsuarioLogMsg := MENSAGEM_REGISTRO_ACAO_ALTERADO;
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
      locUsuarioID := Plataforma_ERP_ADO_NumeradorLicencaDeterminar(locADOConnection,
                                                                    locLicencaID,
                                                                    locUsuarioBaseID,
                                                                    NUMERADOR_USUARIO_ID,
                                                                    locLogUsuarioBaseID,
                                                                    locLogUsuarioID);
    except
      on locExcecao: Exception do
      begin
        locADOConnection.RollbackTrans;
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Imposs�vel determinar o pr�ximo numerador para o usu�rio!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
        Exit
      end;
    end;
  end;

  //
  // Grava dados na tabela usuario.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;

  if locInsert then
  begin
    //
    // Insere dados.
    //
    locADOQuery.SQL.Add('INSERT INTO [usuario] (   ');
    locADOQuery.SQL.Add('  [licenca_id],           ');
    locADOQuery.SQL.Add('  [usuario_base_id],      ');
    locADOQuery.SQL.Add('  [usuario_id],           ');
    locADOQuery.SQL.Add('  [codigo],               ');
    locADOQuery.SQL.Add('  [nome],                 ');
    locADOQuery.SQL.Add('  [logon],                ');
    locADOQuery.SQL.Add('  [tipo_usuario_base_id], ');
    locADOQuery.SQL.Add('  [tipo_usuario_id],      ');
    locADOQuery.SQL.Add('  [vigencia],             ');
    locADOQuery.SQL.Add('  [vigencia_ini_dt_hr],   ');
    locADOQuery.SQL.Add('  [vigencia_fim_dt_hr],   ');
    locADOQuery.SQL.Add('  [senha_exigir],         ');
    locADOQuery.SQL.Add('  [senha_trocar],         ');
    locADOQuery.SQL.Add('  [senha],                ');
    locADOQuery.SQL.Add('  [administrador],        ');
    locADOQuery.SQL.Add('  [bloqueado],            ');
    locADOQuery.SQL.Add('  [ativo],                ');
    locADOQuery.SQL.Add('  [ins_local_dt_hr],      ');
    locADOQuery.SQL.Add('  [ins_server_dt_hr],     ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr],      ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr],     ');
    locADOQuery.SQL.Add('  [upd_contador]          ');  
    locADOQuery.SQL.Add(')                         ');
    locADOQuery.SQL.Add('VALUES (                  ');
    locADOQuery.SQL.Add('  :licenca_id,            '); // [licenca_id].
    locADOQuery.SQL.Add('  :usuario_base_id,       '); // [usuario_base_id].
    locADOQuery.SQL.Add('  :usuario_id,            '); // [usuario_id].
    locADOQuery.SQL.Add('  :codigo,                '); // [codigo].
    locADOQuery.SQL.Add('  :nome,                  '); // [nome].
    locADOQuery.SQL.Add('  :logon,                 '); // [logon].
    locADOQuery.SQL.Add('  :tipo_usuario_base_id,  '); // [tipo_usuario_base_id].
    locADOQuery.SQL.Add('  :tipo_usuario_id,       '); // [tipo_usuario_id].
    locADOQuery.SQL.Add('  :vigencia,              '); // [vigencia].
    locADOQuery.SQL.Add('  :vigencia_ini_dt_hr,    '); // [vigencia_ini_dt_hr].
    locADOQuery.SQL.Add('  :vigencia_fim_dt_hr,    '); // [vigencia_fim_dt_hr].
    locADOQuery.SQL.Add('  ''S'',                  '); // [senha_exigir].
    locADOQuery.SQL.Add('  ''N'',                  '); // [senha_trocar].
    locADOQuery.SQL.Add('  '''',                   '); // [senha].
    locADOQuery.SQL.Add('  :administrador,         '); // [administrador].
    locADOQuery.SQL.Add('  :bloqueado,             '); // [bloqueado].
    locADOQuery.SQL.Add('  :ativo,                 '); // [ativo].
    locADOQuery.SQL.Add('  :local_dt_hr,           '); // [ins_local_dt_hr].
    locADOQuery.SQL.Add('  GETDATE(),              '); // [ins_server_dt_hr].
    locADOQuery.SQL.Add('  NULL,                   '); // [upd_local_dt_hr].
    locADOQuery.SQL.Add('  NULL,                   '); // [upd_server_dt_hr].
    locADOQuery.SQL.Add('  0                       '); // [upd_contador].
    locADOQuery.SQL.Add(')                         ');
  end
  else
  begin
    //
    // Atualiza dados.
    //
    locADOQuery.SQL.Add('UPDATE                                            ');
    locADOQuery.SQL.Add('  [usuario]                                       ');
    locADOQuery.SQL.Add('SET                                               ');
    locADOQuery.SQL.Add('  [codigo]               = :codigo,               ');
    locADOQuery.SQL.Add('  [nome]                 = :nome,                 ');
    locADOQuery.SQL.Add('  [logon]                = :logon,                ');
    locADOQuery.SQL.Add('  [tipo_usuario_base_id] = :tipo_usuario_base_id, ');
    locADOQuery.SQL.Add('  [tipo_usuario_id]      = :tipo_usuario_id,      ');
    locADOQuery.SQL.Add('  [vigencia]             = :vigencia,             ');
    locADOQuery.SQL.Add('  [vigencia_ini_dt_hr]   = :vigencia_ini_dt_hr,   ');
    locADOQuery.SQL.Add('  [vigencia_fim_dt_hr]   = :vigencia_fim_dt_hr,   ');
    locADOQuery.SQL.Add('  [administrador]        = :administrador,        ');
    locADOQuery.SQL.Add('  [bloqueado]            = :bloqueado,            ');
    locADOQuery.SQL.Add('  [ativo]                = :ativo,                ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr]      = :local_dt_hr,          ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr]     = GETDATE(),             ');
    locADOQuery.SQL.Add('  [upd_contador]         = [upd_contador] + 1     ');
    locADOQuery.SQL.Add('WHERE                                             ');
    locADOQuery.SQL.Add('  [licenca_id]      = :licenca_id      AND        ');
    locADOQuery.SQL.Add('  [usuario_base_id] = :usuario_base_id AND        ');
    locADOQuery.SQL.Add('  [usuario_id]      = :usuario_id                 ');
  end;

  //
  // Par�metros.
  //
  locADOQuery.Parameters.ParamByName('licenca_id').Value           := locLicencaID;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value      := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value           := locUsuarioID;
  locADOQuery.Parameters.ParamByName('codigo').Value               := locCodigo;
  locADOQuery.Parameters.ParamByName('nome').Value                 := locNome;
  locADOQuery.Parameters.ParamByName('logon').Value                := locLogon;
  locADOQuery.Parameters.ParamByName('tipo_usuario_base_id').Value := locTipoUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value      := locTipoUsuarioID;
  locADOQuery.Parameters.ParamByName('vigencia').Value             := BooleanStringConverter(locVigencia);
  locADOQuery.Parameters.ParamByName('vigencia_ini_dt_hr').Value   := locVigenciaIniDtHr;
  locADOQuery.Parameters.ParamByName('vigencia_fim_dt_hr').Value   := locVigenciaFimDtHr;
  locADOQuery.Parameters.ParamByName('administrador').Value        := BooleanStringConverter(locAdministrador);
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
procedure TPlataformaERPVCLUsuarioCadastro.FormularioExcluir;
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
procedure TPlataformaERPVCLUsuarioCadastro.FormularioCancelar;
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
procedure TPlataformaERPVCLUsuarioCadastro.FormularioCodigoSugerir;
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
function TPlataformaERPVCLUsuarioCadastro.LogDadosGerar(argUsuarioID: Integer = 0): string;
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
  LogDadosStringDescrever ('Vig�ncia',               '',                           Result); // ARRUMAR!
  LogDadosStringDescrever ('Vig�ncia inicial',       '',                           Result);
  LogDadosStringDescrever ('Vig�ncia final',         '',                           Result);
  LogDadosBooleanDescrever('Administrador',          False,                        Result);  
  LogDadosBooleanDescrever('Bloqueado',              chkBloqueado.Checked,         Result);
  LogDadosBooleanDescrever('Ativo',                  chkAtivo.Checked,             Result);
end;

end.
