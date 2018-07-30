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

unit Plataforma_ERP_VCL_TiposUsuariosSelecao;

interface

uses
  Data.Win.ADODB,
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
  Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TPlataformaERPVCLTiposUsuariosSelecao = class(TForm)
    imgFormulario: TImage;
    btnConfirmar: TBitBtn;
    btnFechar: TBitBtn;
    panFormulario: TPanel;
    btnMinimizar: TBitBtn;
    imgBackground: TImage;
    lvwLista: TListView;
    btnAtualizar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
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
  PlataformaERPVCLTiposUsuariosSelecao: TPlataformaERPVCLTiposUsuariosSelecao;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_TiposUsuariosCodigo;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_TiposUsuariosLocalizar';

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosSelecao.FormCreate(Sender: TObject);
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
procedure TPlataformaERPVCLTiposUsuariosSelecao.FormShow(Sender: TObject);
begin
  Exit;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLTiposUsuariosSelecao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click no botão "Confirmar".
//
procedure TPlataformaERPVCLTiposUsuariosSelecao.btnConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

//
// Evento de click no botão "Fechar".
//
procedure TPlataformaERPVCLTiposUsuariosSelecao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TPlataformaERPVCLTiposUsuariosSelecao.btnLimparClick(Sender: TObject);
begin

end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosSelecao.FormularioLimpar;
begin
end;

//
// Procedimento para confirmar os parâmetros do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosSelecao.FormularioConfirmar;
begin
  pubClicouFechar  := False;
  Close; 
end;


end.
