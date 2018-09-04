//
// Arquivo..: Plataforma_ERP_VCL_MenuPrincipal.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário VCL contendo o menu principal de opções da aplicação de ERP.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
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
    mniLogs: TMenuItem;
    mniLogLocal: TMenuItem;
    mniControleAcesso: TMenuItem;
    mniTiposUsuarios: TMenuItem;
    Image1: TImage;
    mniUsuarios: TMenuItem;
    mniConfiguracoes: TMenuItem;
    mniResolucaoTela1250x700: TMenuItem;
    timInicializacao: TTimer;
    mniPerfisUsuario: TMenuItem;
    mniRotinasAplicacao: TMenuItem;
    mniInstalacao: TMenuItem;
    mniInstalacaoNumeradores: TMenuItem;
    mniNumeradorBase: TMenuItem;
    mniNumeradorLicenca: TMenuItem;
    panStatusBar: TPanel;
    lblHostName: TLabel;
    mniRegistroAcao: TMenuItem;
    mniTrocarUsuario: TMenuItem;
    mniAplicacaoSeparador1: TMenuItem;
    mniTrocarSenhaUsuario: TMenuItem;
    lblAppUserName: TLabel;
    mniBases: TMenuItem;
    mniLicencas: TMenuItem;
    mniConfiguracaoBaseDados: TMenuItem;
    mniInstalacaoCadastros: TMenuItem;
    lblCalendario: TLabel;
    lblHorario: TLabel;
    timStatusBar: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mniLogLocalClick(Sender: TObject);
    procedure mniTiposUsuariosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mniUsuariosClick(Sender: TObject);
    procedure mniResolucaoTela1250x700Click(Sender: TObject);
    procedure timInicializacaoTimer(Sender: TObject);
    procedure mniPerfisUsuarioClick(Sender: TObject);
    procedure mniRotinasAplicacaoClick(Sender: TObject);
    procedure mniNumeradorBaseClick(Sender: TObject);
    procedure mniNumeradorLicencaClick(Sender: TObject);
    procedure mniRegistroAcaoClick(Sender: TObject);
    procedure mniTrocarUsuarioClick(Sender: TObject);
    procedure mniTrocarSenhaUsuarioClick(Sender: TObject);
    procedure mniBasesClick(Sender: TObject);
    procedure mniLicencasClick(Sender: TObject);
    procedure mniConfiguracaoBaseDadosClick(Sender: TObject);
    procedure timStatusBarTimer(Sender: TObject);
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
  Plataforma_ERP_VCL_BaseConfiguracao,
  Plataforma_ERP_VCL_RotinaAplicacaoLista,
  Plataforma_ERP_VCL_RegistroAcaoLista,
  Plataforma_ERP_VCL_BaseLista,
  Plataforma_ERP_VCL_LicencaLista,
  Plataforma_ERP_VCL_NumeradorLicencaLista,
  Plataforma_ERP_VCL_NumeradorBaseLista;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLMenuPrincipal.FormCreate(Sender: TObject);
begin
  //
  // Desliga o timer de inicialização para ele ser ligado somente depois do FormShow.
  //
  timInicializacao.Enabled := False;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLMenuPrincipal.FormShow(Sender: TObject);
begin
  //
  // Ajusta formulário com perfil de visualização antes da inicialização.
  //
  FormularioInformacoesDeterminar;
  FormularioMenuConstruir;

  //
  // Liga timer de inicialização.
  //
  timInicializacao.Enabled := True;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLMenuPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de timer para a inicialização da aplicação.
//
procedure TPlataformaERPVCLMenuPrincipal.timInicializacaoTimer(Sender: TObject);
begin
  timInicializacao.Enabled := False;
  FormularioInicializar;
end;

//
// Evento de timer para a atualização do statusbar.
//
procedure TPlataformaERPVCLMenuPrincipal.timStatusBarTimer(Sender: TObject);
begin
  FormularioInformacoesDeterminar;
end;

{--------------------------------------------------------------------------------------------------}
{ ITENS DE MENU                                                                                    }
{--------------------------------------------------------------------------------------------------}

//
// Evento de click na opção "senha usuário".
//
procedure TPlataformaERPVCLMenuPrincipal.mniTrocarUsuarioClick(Sender: TObject);
begin
  Plataforma_ERP_UsuarioTrocar;
  FormularioInformacoesDeterminar;
  FormularioMenuConstruir;
end;

//
// Evento de click na opção "trocar senha usuário".
//
procedure TPlataformaERPVCLMenuPrincipal.mniTrocarSenhaUsuarioClick(Sender: TObject);
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
// Evento de click na opção de menu "resolução 1.024 x 768".
//
procedure TPlataformaERPVCLMenuPrincipal.mniResolucaoTela1250x700Click(Sender: TObject);
begin
  Self.WindowState := wsNormal;
  Self.Width       := 1250;
  Self.Height      :=  700;
  Self.Top         :=   10;
end;

//
// Evento de click na opção "Log detalhado local do computador".
//
procedure TPlataformaERPVCLMenuPrincipal.mniLogLocalClick(Sender: TObject);
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
// Evento de click na opção "usuários".
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
// Evento de click na opção "perfis usuários".
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
// Evento de click na opção "tipos usuários".
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
// Evento de click na opção "rotinas aplicação".
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
// Evento de click na opção "ações com registros".
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
{ INSTALAÇÃO                                                                                      }
{-------------------------------------------------------------------------------------------------}

procedure TPlataformaERPVCLMenuPrincipal.mniConfiguracaoBaseDadosClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLBaseConfiguracao;
begin
  locFormulario := TPlataformaERPVCLBaseConfiguracao.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

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
{ PROCEDIMENTOS E FUNÇÕES                                                                          }
{--------------------------------------------------------------------------------------------------}

//
// Procedimento para determinar as informações do formulário.
//
procedure TPlataformaERPVCLMenuPrincipal.FormularioInformacoesDeterminar;
begin
  //
  // Caption do formulário.
  //
  Caption := 'Plataforma ERP';

  //
  // Calendário.
  //
  lblCalendario.Left    := 16;
  lblCalendario.Caption := DiaSemanaDeterminar(Now) + ', ' + FormatDateTime('dd', Now) + ' de ' + NomeMesDeterminar(Now) + ' de ' + FormatDateTime('yyyy', Now);

  //
  // Horário.
  //
  lblHorario.Left    := lblCalendario.Left + lblCalendario.Width + 32;
  lblHorario.Caption := FormatDateTime('hh:mm', Now) + ' ' + AmPmDeterminar(Now);


  //
  // Nome do computador e usuário de rede.
  //
  lblHostName.Left    := lblHorario.Left + lblHorario.Width + 32;
  lblHostName.Caption := 'Computador: ' + HostNameRecuperar + '\' + UserNameRecuperar;


  //
  // Usuário da aplicação.
  //
  if gloUsuarioID = 0 then
  begin
    lblAppUserName.Visible := False;
    lblAppUserName.Caption := '';
  end
  else
  begin
    lblAppUserName.Visible := True;
    lblAppUserName.Left    := lblHostName.Left + lblHostName.Width + 32;
    lblAppUserName.Caption := 'Usuário: ' + gloUsuarioNome;    
  end;
end;

//
// Procedimento para construir o menu e seus itens.
//
procedure TPlataformaERPVCLMenuPrincipal.FormularioMenuConstruir;
var
  locAplicacao_TrocarUsuario                        : Boolean;
  locAplicacao_TrocarSenhaUsuario                   : Boolean;
  locAplicacao_Configuracoes_ResolucaoTela1250x700  : Boolean;
  locAplicacao_ControleAcesso_Usuarios              : Boolean;
  locAplicacao_ControleAcesso_Perfis                : Boolean;
  locAplicacao_ControleAcesso_TiposUsuarios         : Boolean;
  locAplicacao_Instalacao_ConfiguracaoBaseDados     : Boolean;
  locAplicacao_Instalacao_Cadastros_Licencas        : Boolean;
  locAplicacao_Instalacao_Cadastros_BasesDados      : Boolean;
  locAplicacao_Instalacao_Cadastros_RotinasAplicacao: Boolean;
  locAplicacao_Instalacao_Cadastros_AcaoRegistros   : Boolean;
  locAplicacao_Instalacao_Numeradores_Base          : Boolean;
  locAplicacao_Instalacao_Numeradores_Licenca       : Boolean;
  locAplicacao_Logs_LogLocal                        : Boolean;  
begin
  {-----------------------------------------------------------------------------------------------}
  { Aplicação                                                                                     }
  {-----------------------------------------------------------------------------------------------}

  //
  // Itens de menu acessíveis.
  //
  locAplicacao_TrocarUsuario                         := True;
  locAplicacao_TrocarSenhaUsuario                    := True;
  locAplicacao_Configuracoes_ResolucaoTela1250x700   := True;
  locAplicacao_ControleAcesso_Usuarios               := Plataforma_ERP_UsuarioRotina('ERP_USUARIO_LISTA');
  locAplicacao_ControleAcesso_Perfis                 := Plataforma_ERP_UsuarioRotina('ERP_PERFIL_USUARIO_LISTA');
  locAplicacao_ControleAcesso_TiposUsuarios          := Plataforma_ERP_UsuarioRotina('ERP_TIPO_USUARIO_LISTA');
  locAplicacao_Instalacao_ConfiguracaoBaseDados      := True;
  locAplicacao_Instalacao_Cadastros_Licencas         := Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_LICENCA_LISTA');
  locAplicacao_Instalacao_Cadastros_BasesDados       := Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_BASE_LISTA');
  locAplicacao_Instalacao_Cadastros_RotinasAplicacao := Plataforma_ERP_UsuarioRotina('ERP_ROTINA_APLICACAO_LISTA');
  locAplicacao_Instalacao_Cadastros_AcaoRegistros    := Plataforma_ERP_UsuarioRotina('ERP_REGISTRO_ACAO_LISTA');
  locAplicacao_Instalacao_Numeradores_Base           := Plataforma_ERP_UsuarioRotina('ERP_BASE_LISTA');
  locAplicacao_Instalacao_Numeradores_Licenca        := Plataforma_ERP_UsuarioRotina('ERP_LICENCA_LISTA');
  locAplicacao_Logs_LogLocal                         := True;

  //
  // Configurações.
  //
  mniConfiguracoes.Visible := locAplicacao_Configuracoes_ResolucaoTela1250x700;
    mniResolucaoTela1250x700.Visible := locAplicacao_Configuracoes_ResolucaoTela1250x700;

  //
  // Controle de acesso.
  //
  mniControleAcesso.Visible := locAplicacao_ControleAcesso_Usuarios or
                               locAplicacao_ControleAcesso_Perfis   or
                               locAplicacao_ControleAcesso_TiposUsuarios;

    mniUsuarios.Visible      := locAplicacao_ControleAcesso_Usuarios;
    mniPerfisUsuario.Visible := locAplicacao_ControleAcesso_Perfis;
    mniTiposUsuarios.Visible := locAplicacao_ControleAcesso_TiposUsuarios;

  //
  // Instalação.
  //
  mniInstalacao.Visible := locAplicacao_Instalacao_ConfiguracaoBaseDados      or

                           locAplicacao_Instalacao_Cadastros_Licencas         or
                           locAplicacao_Instalacao_Cadastros_BasesDados       or
                           locAplicacao_Instalacao_Cadastros_RotinasAplicacao or
                           locAplicacao_Instalacao_Cadastros_AcaoRegistros    or

                           locAplicacao_Instalacao_Numeradores_Base           or
                           locAplicacao_Instalacao_Numeradores_Licenca;

    mniConfiguracaoBaseDados.Visible := locAplicacao_Instalacao_ConfiguracaoBaseDados;
    
    mniInstalacaoCadastros.Visible := locAplicacao_Instalacao_Cadastros_Licencas         or
                                      locAplicacao_Instalacao_Cadastros_BasesDados       or
                                      locAplicacao_Instalacao_Cadastros_RotinasAplicacao or
                                      locAplicacao_Instalacao_Cadastros_AcaoRegistros;

      mniLicencas.Visible         := locAplicacao_Instalacao_Cadastros_Licencas;
      mniBases.Visible            := locAplicacao_Instalacao_Cadastros_BasesDados;
      mniRotinasAplicacao.Visible := locAplicacao_Instalacao_Cadastros_RotinasAplicacao;
      mniRegistroAcao.Visible     := locAplicacao_Instalacao_Cadastros_AcaoRegistros;

    mniInstalacaoNumeradores.Visible := locAplicacao_Instalacao_Numeradores_Base or
                                        locAplicacao_Instalacao_Numeradores_Licenca;

      mniNumeradorBase.Visible    := locAplicacao_Instalacao_Numeradores_Base;
      mniNumeradorLicenca.Visible := locAplicacao_Instalacao_Numeradores_Licenca;

  //
  // Logs.
  //
  mniLogs.Visible := locAplicacao_Logs_LogLocal;
    mniLogLocal.Visible := locAplicacao_Logs_LogLocal;

  //
  // Aplicacao.
  //
  mniAplicacao.Visible := locAplicacao_TrocarUsuario      or
                          locAplicacao_TrocarSenhaUsuario or
                          mniConfiguracoes.Visible        or
                          mniControleAcesso.Visible       or
                          mniInstalacao.Visible           or
                          mniLogs.Visible;
  
  mniTrocarUsuario.Visible      := locAplicacao_TrocarUsuario;
  mniTrocarSenhaUsuario.Visible := locAplicacao_TrocarSenhaUsuario;    
end;

//
// Procedimento para inicializar a aplicação de ERP.
//
procedure TPlataformaERPVCLMenuPrincipal.FormularioInicializar;
begin
  //
  // Determina o path onde a aplicação está rodando.
  //
  gloAppPath := PathExtrair(Application.ExeName);

  //
  // Gera o hashcode de execução da aplicação.
  //
  Plataforma_ERP_HashCodInicializar;

  //
  // Inicializa o log local da aplicação.
  //
  Plataforma_ERP_LogInicializar;

  //
  // Inicializa o arquivo de configuração da aplicação.
  //
  Plataforma_ERP_ArquivoConfiguracaoInicializar;

  //
  // Define os parâmetros de conexão ao banco de dados.
  //
  gloConexaoADOString := 'Provider=SQLOLEDB.1;Persist Security Info=True;Trusted_Connection=True;Data Source=LocalHost\SQLExpress;User ID=sa;Password=abc123;Initial Catalog=PlataformaERP;Connection Timeout=10;';
  gloConexaoTimeOut   := 10;

  //
  // Define os timeouts de execução de querys.
  //
  Plataforma_ERP_TimeOutsInicializar;

  // Define a base.
  gloBaseID        := 1;
  gloBaseCodigo    := '01';
  gloBaseDescricao := 'Base central';

  // Define a licença.
  gloLicencaID        := 1;
  gloLicencaCodigo    := 'ABC.123.DEF.456';
  gloLicencaDescricao := 'Licença central';

  //
  // Logon do usuário.
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
