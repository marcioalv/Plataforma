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
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_Inicializacao,
  Plataforma_ERP_VCL_LogLocalLista,
  Plataforma_ERP_VCL_UsuarioLista,
  Plataforma_ERP_VCL_TiposUsuariosLista,
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
  Vcl.ExtCtrls;

type
  TPlataformaERPVCLMenuPrincipal = class(TForm)
    mnuFormulario: TMainMenu;
    mniAplicacao: TMenuItem;
    mniLogUsoAplicacao: TMenuItem;
    mniLogUsoLocal: TMenuItem;
    Controledeacesso1: TMenuItem;
    mniTiposUsuarios: TMenuItem;
    Image1: TImage;
    mniUsuarios: TMenuItem;
    mnuConfiguracoes: TMenuItem;
    mniResolucaoTela: TMenuItem;
    mni1250x700: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mniLogUsoLocalClick(Sender: TObject);
    procedure mniTiposUsuariosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mniUsuariosClick(Sender: TObject);
    procedure mni1250x700Click(Sender: TObject);
  private
    procedure Inicializar;
    procedure FormularioTituloDeterminar;
    procedure FormularioMenuConstruir;
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLMenuPrincipal: TPlataformaERPVCLMenuPrincipal;

implementation

{$R *.dfm}

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLMenuPrincipal.FormCreate(Sender: TObject);
begin
  Inicializar;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLMenuPrincipal.FormShow(Sender: TObject);
begin
  FormularioTituloDeterminar;
  FormularioMenuConstruir;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLMenuPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click na opção de menu "resolução 1.024 x 768".
//
procedure TPlataformaERPVCLMenuPrincipal.mni1250x700Click(Sender: TObject);
begin
  Self.WindowState := wsNormal;
  Self.Width       := 1250;
  Self.Height      :=  700;
  Self.Top         :=   10;
end;

//
// Evento de click na opção "Log detalhado local do computador".
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
// Evento de click na opção "tipos de usuários".
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
// Procedimento para inicializar a aplicação de ERP.
//
procedure TPlataformaERPVCLMenuPrincipal.Inicializar;
begin
  // Determina o path onde a aplicação está rodando.
  gloAppPath := PathExtrair(Application.ExeName);

  // Gera o hashcode de execução da aplicação.
  PlataformaERPHashCodInicializar;
 
  // Inicializa o log local da aplicação.
  PlataformaERPLogInicializar;

  // Define os parâmetros de conexão ao banco de dados.
  gloConexaoADOString := 'Provider=SQLOLEDB.1;Persist Security Info=True;Trusted_Connection=True;Data Source=LocalHost\SQLExpress;User ID=sa;Password=abc123;Initial Catalog=PlataformaERP;Connection Timeout=10;';
  gloConexaoTimeOut   := 10;

  // Define os timeouts.
  gloTimeOutNormal := 60;

  // Define a base.
  gloBaseID        := 1;
  gloBaseCodigo    := '01';
  gloBaseDescricao := 'Base central';

  // Define a licença.
  gloLicencaID        := 1;
  gloLicencaCodigo    := 'ABC.123.DEF.456';
  gloLicencaDescricao := 'Licença central';

  // Autentica usuário.
  PlataformaERPUsuarioInicializar;
end;

//
// Procedimento para determinar o título apropriado do formulário.
//
procedure TPlataformaERPVCLMenuPrincipal.FormularioTituloDeterminar;
begin
  Caption := 'Plataforma ERP';
end;

//
// FormularioMenuConstruir.
//
procedure TPlataformaERPVCLMenuPrincipal.FormularioMenuConstruir;
begin
  mniTiposUsuarios.Visible := Plataforma_ERP_UsuarioRotina('ERP_TIPO_USUARIO_LISTA');
end;

end.
