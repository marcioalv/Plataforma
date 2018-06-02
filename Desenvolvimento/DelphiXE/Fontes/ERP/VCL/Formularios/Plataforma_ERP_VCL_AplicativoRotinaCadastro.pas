//
// Arquivo..: Plataforma_ERP_VCL_AplicativoRotinaCadastro.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio VCL com o cadastro de rotinas da aplica��o ERP.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_AplicativoRotinaCadastro;

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
  TPlataformaERPVCLAplicativoRotinaCadastro = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure FormularioTituloDeterminar;
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLAplicativoRotinaCadastro: TPlataformaERPVCLAplicativoRotinaCadastro;

implementation

{$R *.dfm}

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLAplicativoRotinaCadastro.FormCreate(Sender: TObject);
begin
  Exit;
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLAplicativoRotinaCadastro.FormShow(Sender: TObject);
begin
  FormularioTituloDeterminar;
end;

//
// Procedimento para determinar o t�tulo apropriado do formul�rio.
//
procedure TPlataformaERPVCLAplicativoRotinaCadastro.FormularioTituloDeterminar;
begin
  Caption := 'Cadastro de rotinas da aplica��o ERP';
end;

end.
