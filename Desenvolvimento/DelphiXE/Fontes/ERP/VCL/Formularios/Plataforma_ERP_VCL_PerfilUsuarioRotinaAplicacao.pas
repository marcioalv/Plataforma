unit Plataforma_ERP_VCL_PerfilUsuarioRotinaAplicacao;

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
  Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TPlataformaERPVCLPerfilUsuarioRotinaAplicacao = class(TForm)
    imgFormulario: TImage;
    imgBackground: TImage;
    btnFechar: TBitBtn;
    btnMinimizar: TBitBtn;
    panFormulario: TPanel;
    btnGravar: TBitBtn;
    mnuFormulario: TMainMenu;
    mniGravar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniFechar: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mniGravarClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    procedure FormularioGravar;
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLPerfilUsuarioRotinaAplicacao: TPlataformaERPVCLPerfilUsuarioRotinaAplicacao;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.FormCreate(Sender: TObject);
begin
  Exit;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Evento de click no botão "gravar".
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para gravar os dados do formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.FormularioGravar;
begin
  Exit;
end;

end.
