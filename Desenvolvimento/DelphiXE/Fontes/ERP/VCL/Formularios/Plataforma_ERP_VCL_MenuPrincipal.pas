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
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLMenuPrincipal.FormCreate(Sender: TObject);
begin
  Inicializar;
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLMenuPrincipal.FormShow(Sender: TObject);
begin
  FormularioTituloDeterminar;
  FormularioMenuConstruir;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLMenuPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
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
// Evento de click na op��o "tipos de usu�rios".
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
// Procedimento para inicializar a aplica��o de ERP.
//
procedure TPlataformaERPVCLMenuPrincipal.Inicializar;
begin
  // Determina o path onde a aplica��o est� rodando.
  gloAppPath := PathExtrair(Application.ExeName);

  // Gera o hashcode de execu��o da aplica��o.
  PlataformaERPHashCodInicializar;
 
  // Inicializa o log local da aplica��o.
  PlataformaERPLogInicializar;

  // Define os par�metros de conex�o ao banco de dados.
  gloConexaoADOString := 'Provider=SQLOLEDB.1;Persist Security Info=True;Trusted_Connection=True;Data Source=LocalHost\SQLExpress;User ID=sa;Password=abc123;Initial Catalog=PlataformaERP;Connection Timeout=10;';
  gloConexaoTimeOut   := 10;

  // Define os timeouts.
  gloTimeOutNormal := 60;

  // Define a base.
  gloBaseID        := 1;
  gloBaseCodigo    := '01';
  gloBaseDescricao := 'Base central';

  // Define a licen�a.
  gloLicencaID        := 1;
  gloLicencaCodigo    := 'ABC.123.DEF.456';
  gloLicencaDescricao := 'Licen�a central';

  // Autentica usu�rio.
  PlataformaERPUsuarioInicializar;
end;

//
// Procedimento para determinar o t�tulo apropriado do formul�rio.
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
