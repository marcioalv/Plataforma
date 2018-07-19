//
// Arquivo..: Plataforma_ERP_VCL_TiposUsuariosLocalizar.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com os parâmetros de localização de cadastro de tipo de usuário.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_TiposUsuariosLocalizar;

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
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TPlataformaERPVCLTiposUsuariosLocalizar = class(TForm)
    imgFormulario: TImage;
    btnConfirmar: TBitBtn;
    btnFechar: TBitBtn;
    panFormulario: TPanel;
    lblCodigo: TLabel;
    lblID: TLabel;
    edtCodigo: TEdit;
    edtTipoUsuarioID: TEdit;
    btnMinimizar: TBitBtn;
    btnLimpar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtTipoUsuarioIDEnter(Sender: TObject);
    procedure edtTipoUsuarioIDExit(Sender: TObject);
    procedure edtTipoUsuarioIDKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    procedure FormularioLimpar;    
    procedure FormularioConfirmar;
  public
    pubClicouFechar : Boolean;
    pubBaseID       : Integer;
    pubLicencaID    : Integer;
    pubTipoUsuarioID: Integer;
  end;

var
  PlataformaERPVCLTiposUsuariosLocalizar: TPlataformaERPVCLTiposUsuariosLocalizar;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_TiposUsuariosLocalizar';

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosLocalizar.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas.
  //
  pubClicouFechar  := True;
  pubBaseID        := 1;
  pubLicencaID     := 1;
  pubTipoUsuarioID := 1;

  //
  // Limpa componentes do formulário.
  //
  FormularioLimpar;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosLocalizar.FormShow(Sender: TObject);
begin
  Exit;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLTiposUsuariosLocalizar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos do componente "ID do tipo de usuário".
//
procedure TPlataformaERPVCLTiposUsuariosLocalizar.edtTipoUsuarioIDEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtTipoUsuarioID) then Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosLocalizar.edtTipoUsuarioIDKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLTiposUsuariosLocalizar.edtTipoUsuarioIDExit(Sender: TObject);
begin
  if not VCLEditSair(edtTipoUsuarioID) then Exit;
end;

//
// Eventos do componente "código".
//
procedure TPlataformaERPVCLTiposUsuariosLocalizar.edtCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigo) then Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosLocalizar.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLTiposUsuariosLocalizar.edtCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigo) then Exit;
end;

//
// Evento de click no botão "Confirmar".
//
procedure TPlataformaERPVCLTiposUsuariosLocalizar.btnConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

//
// Evento de click no botão "Fechar".
//
procedure TPlataformaERPVCLTiposUsuariosLocalizar.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosLocalizar.FormularioLimpar;
begin
  VCLEditLimpar(edtTipoUsuarioID);
  VCLEditLimpar(edtCodigo);
end;

//
// Procedimento para confirmar os parâmetros do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosLocalizar.FormularioConfirmar;
begin
  pubClicouFechar  := False;
  pubBaseID        := 1;
  pubLicencaID     := 1;
  pubTipoUsuarioID := 1;
  Close; 
end;

end.
