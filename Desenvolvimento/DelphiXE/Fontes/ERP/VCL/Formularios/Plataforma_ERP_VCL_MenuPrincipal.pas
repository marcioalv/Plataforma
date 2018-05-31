//
// Arquivo..: Plataforma_ERP_VCL_MenuPrincipal.pas
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
  Vcl.Dialogs;

type
  TPlataformaERPVCLMenuPrincipal = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure FormularioTituloDeterminar;
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
  Exit;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLMenuPrincipal.FormShow(Sender: TObject);
begin
  FormularioTituloDeterminar;
end;

//
// Procedimento para determinar o título apropriado do formulário.
//
procedure TPlataformaERPVCLMenuPrincipal.FormularioTituloDeterminar;
begin
  Caption := 'Plataforma ERP';
end;

end.
