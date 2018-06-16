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
  Plataforma_ERP_Inicializacao,
  Plataforma_ERP_VCL_LogLocalLista,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus;

type
  TPlataformaERPVCLMenuPrincipal = class(TForm)
    mnuFormulario: TMainMenu;
    mniAplicacao: TMenuItem;
    mniLogUsoAplicacao: TMenuItem;
    mniLogUsoLocal: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mniLogUsoLocalClick(Sender: TObject);
  private
    procedure Inicializar;
    procedure FormularioTituloDeterminar;
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
// Procedimento para inicializar a aplica��o de ERP.
//
procedure TPlataformaERPVCLMenuPrincipal.Inicializar;
begin
  // Determina o path onde a aplica��o est� rodando.
  gloAppPath := ExtractFilePath(Application.ExeName);

  // Inicializa o log local da aplica��o.
  PlataformaERPLogInicializar;
end;

//
// Procedimento para determinar o t�tulo apropriado do formul�rio.
//
procedure TPlataformaERPVCLMenuPrincipal.FormularioTituloDeterminar;
begin
  Caption := 'Plataforma ERP';
end;

end.
