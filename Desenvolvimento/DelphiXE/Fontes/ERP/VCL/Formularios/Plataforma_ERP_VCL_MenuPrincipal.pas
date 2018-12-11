
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
  Vcl.StdCtrls,
  System.ImageList,
  Vcl.ImgList;

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
    mniAplicacaoSeparador2: TMenuItem;
    mniEncerrar: TMenuItem;
    mniLogoff: TMenuItem;
    mniCompras: TMenuItem;
    mniFornecedores: TMenuItem;
    mniPessoas: TMenuItem;
    mniRegimeTributario: TMenuItem;
    mniFiscal: TMenuItem;
    mniFiscalCadastros: TMenuItem;
    mniEmpresas: TMenuItem;
    mniFiliais: TMenuItem;
    mniColigadas: TMenuItem;
    mniLogradouros: TMenuItem;
    mniPaises: TMenuItem;
    mniEstados: TMenuItem;
    mniCidades: TMenuItem;
    mniBairros: TMenuItem;
    mniCEPs: TMenuItem;
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
    procedure mniEncerrarClick(Sender: TObject);
    procedure mniLogoffClick(Sender: TObject);
    procedure mniFornecedoresClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure mniPessoasClick(Sender: TObject);
    procedure mniRegimeTributarioClick(Sender: TObject);
    procedure mniEmpresasClick(Sender: TObject);
    procedure mniFiliaisClick(Sender: TObject);
    procedure mniColigadasClick(Sender: TObject);
    procedure mniLogradourosClick(Sender: TObject);
    procedure mniPaisesClick(Sender: TObject);
    procedure mniEstadosClick(Sender: TObject);
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
  Plataforma_ERP_VCL_PessoaLista,
  Plataforma_ERP_VCL_RegimeTributarioLista,
  Plataforma_ERP_VCL_BaseLista,
  Plataforma_ERP_VCL_LicencaLista,
  Plataforma_ERP_VCL_NumeradorLicencaLista,
  Plataforma_ERP_VCL_NumeradorBaseLista,
  Plataforma_ERP_VCL_EmpresaLista,
  Plataforma_ERP_VCL_FilialLista,
  Plataforma_ERP_VCL_ColigadaLista,
  Plataforma_ERP_VCL_LogradouroLista,
  Plataforma_ERP_VCL_PaisLista,
  Plataforma_ERP_VCL_EstadoLista;

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

//
// Evento de timer para a atualiza��o do statusbar.
//
procedure TPlataformaERPVCLMenuPrincipal.timStatusBarTimer(Sender: TObject);
begin
  FormularioInformacoesDeterminar;
end;

{--------------------------------------------------------------------------------------------------}
{ ITENS DE MENU                                                                                    }
{--------------------------------------------------------------------------------------------------}

//
// Evento de click na op��o "Fornecedores".
//
procedure TPlataformaERPVCLMenuPrincipal.mniFornecedoresClick(Sender: TObject);
begin
  Exit;
end;

//
// Evento de click na op��o "empresas".
//
procedure TPlataformaERPVCLMenuPrincipal.mniEmpresasClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLEmpresaLista;
begin
  locFormulario := TPlataformaERPVCLEmpresaLista.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Evento de click na op��o "filiais".
//
procedure TPlataformaERPVCLMenuPrincipal.mniFiliaisClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLFilialLista;
begin
  locFormulario := TPlataformaERPVCLFilialLista.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Evento de click na op��o "coligadas".
//
procedure TPlataformaERPVCLMenuPrincipal.mniColigadasClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLColigadaLista;
begin
  locFormulario := TPlataformaERPVCLColigadaLista.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Evento de click na op��o "logoff".
//
procedure TPlataformaERPVCLMenuPrincipal.mniLogoffClick(Sender: TObject);
begin
  if not Plataforma_ERP_UsuarioTrocar(True) then
  begin
    Close;
  end
  else
  begin
    FormularioInformacoesDeterminar;
    FormularioMenuConstruir;
  end;
end;

//
// Evento de click na op��o "senha usu�rio".
//
procedure TPlataformaERPVCLMenuPrincipal.mniTrocarUsuarioClick(Sender: TObject);
begin
  Plataforma_ERP_UsuarioTrocar(False);
  FormularioInformacoesDeterminar;
  FormularioMenuConstruir;
end;

//
// Evento de click na op��o "trocar senha usu�rio".
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
// Evento de click na op��o de menu "resolu��o 1.024 x 768".
//
procedure TPlataformaERPVCLMenuPrincipal.mniResolucaoTela1250x700Click(Sender: TObject);
begin
  Self.WindowState := wsNormal;
  Self.Width       := 1250;
  Self.Height      :=  700;
  Self.Top         :=   10;
end;

//
// Evento de click na op��o "Log detalhado local do computador".
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

//
// Evento de click na op��o "pessoas".
//
procedure TPlataformaERPVCLMenuPrincipal.mniPessoasClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLPessoaLista;
begin
  locFormulario := TPlataformaERPVCLPessoaLista.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Evento de click na op��o "regime tribut�rio".
//
procedure TPlataformaERPVCLMenuPrincipal.mniRegimeTributarioClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLRegimeTributarioLista;
begin
  locFormulario := TPlataformaERPVCLRegimeTributarioLista.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Evento de click na op��o "logradouros".
//
procedure TPlataformaERPVCLMenuPrincipal.mniLogradourosClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLLogradouroLista;
begin
  locFormulario := TPlataformaERPVCLLogradouroLista.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Evento de click na op��o "pa�ses".
//
procedure TPlataformaERPVCLMenuPrincipal.mniPaisesClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLPaisLista;
begin
  locFormulario := TPlataformaERPVCLPaisLista.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Evento de click na op��o "estados".
//
procedure TPlataformaERPVCLMenuPrincipal.mniEstadosClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLEstadoLista;
begin
  locFormulario := TPlataformaERPVCLEstadoLista.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

{-------------------------------------------------------------------------------------------------}
{ INSTALA��O                                                                                      }
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

procedure TPlataformaERPVCLMenuPrincipal.mniEncerrarClick(Sender: TObject);
begin
  Close;
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
  // Calend�rio.
  //
  lblCalendario.Left    := 16;
  lblCalendario.Caption := DiaSemanaDeterminar(Now) + ', ' + FormatDateTime('dd', Now) + ' de ' + NomeMesDeterminar(Now) + ' de ' + FormatDateTime('yyyy', Now);

  //
  // Hor�rio.
  //
  lblHorario.Left    := lblCalendario.Left + lblCalendario.Width + 32;
  lblHorario.Caption := FormatDateTime('hh:mm', Now) + ' ' + AmPmDeterminar(Now);


  //
  // Nome do computador e usu�rio de rede.
  //
  lblHostName.Left    := lblHorario.Left + lblHorario.Width + 32;
  lblHostName.Caption := 'Computador: ' + HostNameRecuperar + '\' + UserNameRecuperar;


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
    lblAppUserName.Left    := lblHostName.Left + lblHostName.Width + 32;
    lblAppUserName.Caption := 'Usu�rio: ' + gloUsuarioNome;    
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
  { Aplica��o                                                                                     }
  {-----------------------------------------------------------------------------------------------}

  //
  // Itens de menu acess�veis.
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
  // Configura��es.
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
  // Instala��o.
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

procedure TPlataformaERPVCLMenuPrincipal.Image1Click(Sender: TObject);
begin

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
  // Inicializa o arquivo de configura��o da aplica��o.
  //
  Plataforma_ERP_ArquivoConfiguracaoInicializar;

  //
  // Define os par�metros de conex�o ao banco de dados.
  //
  gloConexaoTitulo     := 'Plataforma Desenvolvimento';
  gloConexaoServidor   := 'LocalHost';
  gloConexaoPorta      := 0;
  gloConexaoInstancia  := 'SQLExpress';
  gloConexaoUsuario    := 'sa';
  gloConexaoSenha      := 'abc123';
  gloConexaoBancoDados := 'PlataformaERP';
  gloConexaoTimeOut    := 10;

  gloConexaoADOString := ADOConnectionStringGerar(gloConexaoServidor, gloConexaoInstancia, gloConexaoPorta, gloConexaoUsuario, gloConexaoSenha, gloConexaoBancoDados);

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
