//
// Arquivo..: Plataforma_ERP_VCL_TiposUsuariosLocalizar.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com os par�metros de localiza��o de cadastro de tipo de usu�rio.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
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
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosSelecao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas.
  //
  pubClicouFechar  := True;
  pubBaseID        := 1;
  pubLicencaID     := 1;
  pubTipoUsuarioID := 1;

  //
  // Limpa componentes do formul�rio.
  //
  FormularioLimpar;
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosSelecao.FormShow(Sender: TObject);
begin
  Exit;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosSelecao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click no bot�o "Confirmar".
//
procedure TPlataformaERPVCLTiposUsuariosSelecao.btnConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

//
// Evento de click no bot�o "Fechar".
//
procedure TPlataformaERPVCLTiposUsuariosSelecao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TPlataformaERPVCLTiposUsuariosSelecao.btnLimparClick(Sender: TObject);
begin

end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosSelecao.FormularioLimpar;
begin
end;

//
// Procedimento para confirmar os par�metros do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosSelecao.FormularioConfirmar;
begin
  pubClicouFechar  := False;
  Close; 
end;


end.
