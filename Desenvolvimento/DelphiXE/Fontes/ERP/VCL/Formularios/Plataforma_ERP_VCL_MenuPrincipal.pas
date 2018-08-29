//
// Arquivo..: Plataforma_ERP_VCL_MenuPrincipal.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio VCL contendo o menu principal de op��es da aplica��o de ERP.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_MenuPrincipal;

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
  Vcl.Menus,
  Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TPlataformaERPVCLMenuPrincipal = class(TForm)
    mnuFormulario: TMainMenu;
    mniAplicacao: TMenuItem;
    mniLogsAplicacao: TMenuItem;
    mniLogUsoLocal: TMenuItem;
    mniControleAcesso: TMenuItem;
    mniTiposUsuarios: TMenuItem;
    Image1: TImage;
    mniUsuarios: TMenuItem;
    mniConfiguracoes: TMenuItem;
    mniResolucaoTela: TMenuItem;
    mni1250x700: TMenuItem;
    timInicializacao: TTimer;
    mniPerfisUsuario: TMenuItem;
    mniRotinasAplicacao: TMenuItem;
    mniInstalacao: TMenuItem;
    mniNumeradores: TMenuItem;
    mniNumeradorBase: TMenuItem;
    mniNumeradorLicenca: TMenuItem;
    panStatusBar: TPanel;
    lblHostName: TLabel;
    mniRegistroAcao: TMenuItem;
    mniUsuarioTrocar: TMenuItem;
    mniAplicacaoSeparador1: TMenuItem;
    mniUsuarioSenhaTrocar: TMenuItem;
    lblAppUserName: TLabel;
    mniBases: TMenuItem;
    mniLicencas: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mniLogUsoLocalClick(Sender: TObject);
    procedure mniTiposUsuariosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mniUsuariosClick(Sender: TObject);
    procedure mni1250x700Click(Sender: TObject);
    procedure timInicializacaoTimer(Sender: TObject);
    procedure mniPerfisUsuarioClick(Sender: TObject);
    procedure mniRotinasAplicacaoClick(Sender: TObject);
    procedure mniNumeradorBaseClick(Sender: TObject);
    procedure mniNumeradorLicencaClick(Sender: TObject);
    procedure mniRegistroAcaoClick(Sender: TObject);
    procedure mniUsuarioTrocarClick(Sender: TObject);
    procedure mniUsuarioSenhaTrocarClick(Sender: TObject);
    procedure mniBasesClick(Sender: TObject);
    procedure mniLicencasClick(Sender: TObject);
  private
    procedure FormularioInicializar;
    procedure FormularioInformacoesDeterminar;
    procedure FormularioMenuConstruir;
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLMenuPrincipal: TPlataformaERPVCLMenuPrincipal;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_Inicializacao,
  Plataforma_ERP_VCL_UsuarioSenhaTrocar,
  Plataforma_ERP_VCL_LogLocalLista,
  Plataforma_ERP_VCL_UsuarioLista,
  Plataforma_ERP_VCL_PerfilUsuarioLista,
  Plataforma_ERP_VCL_TiposUsuariosLista,
  Plataforma_ERP_VCL_RotinaAplicacaoLista,
  Plataforma_ERP_VCL_RegistroAcaoLista,
  Plataforma_ERP_VCL_BaseLista,
  Plataforma_ERP_VCL_LicencaLista,
  Plataforma_ERP_VCL_NumeradorLicencaLista,
  Plataforma_ERP_VCL_NumeradorBaseLista;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLMenuPrincipal.FormCreate(Sender: TObject);
begin
  //
  // Desliga o timer de inicializa��o para ele ser ligado somente depois do FormShow.
  //
  timInicializacao.Enabled := False;
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLMenuPrincipal.FormShow(Sender: TObject);
begin
  //
  // Ajusta formul�rio com perfil de visualiza��o antes da inicializa��o.
  //
  FormularioInformacoesDeterminar;
  FormularioMenuConstruir;

  //
  // Liga timer de inicializa��o.
  //
  timInicializacao.Enabled := True;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLMenuPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de timer para a inicializa��o da aplica��o.
//
procedure TPlataformaERPVCLMenuPrincipal.timInicializacaoTimer(Sender: TObject);
begin
  timInicializacao.Enabled := False;
  FormularioInicializar;
end;

{--------------------------------------------------------------------------------------------------}
{ ITENS DE MENU                                                                                    }
{--------------------------------------------------------------------------------------------------}

//
// Evento de click na op��o "senha usu�rio".
//
procedure TPlataformaERPVCLMenuPrincipal.mniUsuarioTrocarClick(Sender: TObject);
begin
  Plataforma_ERP_UsuarioTrocar;
  FormularioInformacoesDeterminar;
  FormularioMenuConstruir;
end;

//
// Evento de click na op��o "trocar senha usu�rio".
//
procedure TPlataformaERPVCLMenuPrincipal.mniUsuarioSenhaTrocarClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLUsuarioSenhaTrocar;
begin
  locFormulario := TPlataformaERPVCLUsuarioSenhaTrocar.Create(Self);
  locFormulario.pubExigeSenhaAtual := True;
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Evento de click na op��o de menu "resolu��o 1.024 x 768".
//
procedure TPlataformaERPVCLMenuPrincipal.mni1250x700Click(Sender: TObject);
begin
  Self.WindowState := wsNormal;
  Self.Width       := 1250;
  Self.Height      :=  700;
  Self.Top         :=   10;
end;

//
// Evento de click na op��o "Log detalhado local do computador".
//
procedure TPlataformaERPVCLMenuPrincipal.mniLogUsoLocalClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLLogLocalLista;
begin
  locFormulario := TPlataformaERPVCLLogLocalLista.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

{-------------------------------------------------------------------------------------------------}
{ CONTROLE ACESSO                                                                                 }
{-------------------------------------------------------------------------------------------------}

//
// Evento de click na op��o "usu�rios".
//
procedure TPlataformaERPVCLMenuPrincipal.mniUsuariosClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLUsuarioLista;
begin
  locFormulario := TPlataformaERPVCLUsuarioLista.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Evento de click na op��o "perfis usu�rios".
//
procedure TPlataformaERPVCLMenuPrincipal.mniPerfisUsuarioClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLPerfilUsuarioLista;
begin
  locFormulario := TPlataformaERPVCLPerfilUsuarioLista.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Evento de click na op��o "tipos usu�rios".
//
procedure TPlataformaERPVCLMenuPrincipal.mniTiposUsuariosClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLTiposUsuariosLista;
begin
  locFormulario := TPlataformaERPVCLTiposUsuariosLista.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Evento de click na op��o "rotinas aplica��o".
//
procedure TPlataformaERPVCLMenuPrincipal.mniRotinasAplicacaoClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLRotinaAplicacaoLista;
begin
  locFormulario := TPlataformaERPVCLRotinaAplicacaoLista.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Evento de click na op��o "a��es com registros".
//
procedure TPlataformaERPVCLMenuPrincipal.mniRegistroAcaoClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLRegistroAcaoLista;
begin
  locFormulario := TPlataformaERPVCLRegistroAcaoLista.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

{-------------------------------------------------------------------------------------------------}
{ INSTALA��O                                                                                      }
{-------------------------------------------------------------------------------------------------}

procedure TPlataformaERPVCLMenuPrincipal.mniNumeradorBaseClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLNumeradorBaseLista;
begin
  locFormulario := TPlataformaERPVCLNumeradorBaseLista.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

procedure TPlataformaERPVCLMenuPrincipal.mniNumeradorLicencaClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLNumeradorLicencaLista;
begin
  locFormulario := TPlataformaERPVCLNumeradorLicencaLista.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

procedure TPlataformaERPVCLMenuPrincipal.mniLicencasClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLLicencaLista;
begin
  locFormulario := TPlataformaERPVCLLicencaLista.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

procedure TPlataformaERPVCLMenuPrincipal.mniBasesClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLBaseLista;
begin
  locFormulario := TPlataformaERPVCLBaseLista.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

{--------------------------------------------------------------------------------------------------}
{ PROCEDIMENTOS E FUN��ES                                                                          }
{--------------------------------------------------------------------------------------------------}

//
// Procedimento para determinar as informa��es do formul�rio.
//
procedure TPlataformaERPVCLMenuPrincipal.FormularioInformacoesDeterminar;
begin
  //
  // Caption do formul�rio.
  //
  Caption := 'Plataforma ERP';

  //
  // Usu�rio da aplica��o.
  //
  if gloUsuarioID = 0 then
  begin
    lblAppUserName.Visible := False;
    lblAppUserName.Caption := '';
  end
  else
  begin
    lblAppUserName.Visible := True;
    lblAppUserName.Left    := 16;
    lblAppUserName.Caption := 'Usu�rio: ' + gloUsuarioNome;    
  end;

  //
  // Computador e usu�rio de rede.
  //
  if gloUsuarioID = 0 then
    lblHostName.Left := 16
  else
    lblHostName.Left := lblAppUserName.Left + lblAppUserName.Width + 32;
  
  lblHostName.Caption := 'Computador: ' + HostNameRecuperar + '\' + UserNameRecuperar;
end;

//
// Procedimento para construir o menu e seus itens.
//
procedure TPlataformaERPVCLMenuPrincipal.FormularioMenuConstruir;
begin
  //
  // Controle de acesso.
  //
  mniUsuarios.Visible         := Plataforma_ERP_UsuarioRotina('ERP_USUARIO_LISTA');
  mniPerfisUsuario.Visible    := Plataforma_ERP_UsuarioRotina('ERP_PERFIL_USUARIO_LISTA');
  mniTiposUsuarios.Visible    := Plataforma_ERP_UsuarioRotina('ERP_TIPO_USUARIO_LISTA');

  mniControleAcesso.Visible := (mniUsuarios.Visible) or
                               (mniPerfisUsuario.Visible) or
                               (mniTiposUsuarios.Visible);

  //
  // Numeradores.
  //
  mniNumeradorBase.Visible    := Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_BASE_LISTA');
  mniNumeradorLicenca.Visible := Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_LICENCA_LISTA');

  mniNumeradores.Visible := (mniNumeradorBase.Visible) or
                            (mniNumeradorLicenca.Visible);


  //
  // Instala��o.
  //
  mniRotinasAplicacao.Visible := Plataforma_ERP_UsuarioRotina('ERP_ROTINA_APLICACAO_LISTA');
  mniRegistroAcao.Visible     := Plataforma_ERP_UsuarioRotina('ERP_REGISTRO_ACAO_LISTA');
  mniLicencas.Visible         := Plataforma_ERP_UsuarioRotina('ERP_LICENCA_LISTA');
  mniBases.Visible            := Plataforma_ERP_UsuarioRotina('ERP_BASE_LISTA');

  mniInstalacao.Visible := (mniNumeradores.Visible) or
                           (mniRotinasAplicacao.Visible) or
                           (mniRegistroAcao.Visible) or
                           (mniLicencas.Visible) or
                           (mniBases.Visible);
  

  //
  // Aplica��o.
  //
  mniAplicacao.Visible := (mniUsuarioTrocar.Visible)      or
                          (mniUsuarioSenhaTrocar.Visible) or 
                          (mniConfiguracoes.Visible)      or
                          (mniControleAcesso.Visible)     or
                          (mniInstalacao.Visible)         or
                          (mniLogsAplicacao.Visible);
end;

//
// Procedimento para inicializar a aplica��o de ERP.
//
procedure TPlataformaERPVCLMenuPrincipal.FormularioInicializar;
begin
  //
  // Determina o path onde a aplica��o est� rodando.
  //
  gloAppPath := PathExtrair(Application.ExeName);

  //
  // Gera o hashcode de execu��o da aplica��o.
  //
  Plataforma_ERP_HashCodInicializar;

  //
  // Inicializa o log local da aplica��o.
  //
  Plataforma_ERP_LogInicializar;

  //
  // Define os par�metros de conex�o ao banco de dados.
  //
  gloConexaoADOString := 'Provider=SQLOLEDB.1;Persist Security Info=True;Trusted_Connection=True;Data Source=LocalHost\SQLExpress;User ID=sa;Password=abc123;Initial Catalog=PlataformaERP;Connection Timeout=10;';
  gloConexaoTimeOut   := 10;

  //
  // Define os timeouts de execu��o de querys.
  //
  Plataforma_ERP_TimeOutsInicializar;

  // Define a base.
  gloBaseID        := 1;
  gloBaseCodigo    := '01';
  gloBaseDescricao := 'Base central';

  // Define a licen�a.
  gloLicencaID        := 1;
  gloLicencaCodigo    := 'ABC.123.DEF.456';
  gloLicencaDescricao := 'Licen�a central';

  //
  // Logon do usu�rio.
  //
  if not Plataforma_ERP_UsuarioInicializar then Close;

  //
  // Status bar.
  //
  FormularioInformacoesDeterminar;

  //
  // Ajusta itens de menu.
  //
  FormularioMenuConstruir;
end;

end.
