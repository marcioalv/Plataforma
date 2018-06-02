//
// Arquivo..: Plataforma_ERP_VCL_AplicativoRotinaCadastro.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário VCL com o cadastro de rotinas da aplicação ERP.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
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
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLAplicativoRotinaCadastro.FormCreate(Sender: TObject);
begin
  Exit;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLAplicativoRotinaCadastro.FormShow(Sender: TObject);
begin
  FormularioTituloDeterminar;
end;

//
// Procedimento para determinar o título apropriado do formulário.
//
procedure TPlataformaERPVCLAplicativoRotinaCadastro.FormularioTituloDeterminar;
begin
  Caption := 'Cadastro de rotinas da aplicação ERP';
end;

end.
