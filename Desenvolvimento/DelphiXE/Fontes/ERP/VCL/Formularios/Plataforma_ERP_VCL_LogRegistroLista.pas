//
// Arquivo..: Plataforma_ERP_VCL_LogRegistroLista.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário VCL com a lista de logs ocorrido em um registro.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_LogRegistroLista;

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
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls;

type
  TPlataformaERPVCLLogRegistroLista = class(TForm)
    imgFormulario: TImage;
    panFormulario: TPanel;
    btnFechar: TButton;
    lvwLista: TListView;
    btnSelecionar: TButton;
    btnMinimizar: TButton;
    btnAtualizar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
  private
    procedure FormularioSelecionar;
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLLogRegistroLista: TPlataformaERPVCLLogRegistroLista;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_VCL_LogRegistroExibir;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLLogRegistroLista.FormCreate(Sender: TObject);
begin
  Exit;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLLogRegistroLista.FormShow(Sender: TObject);
begin
  Exit;
end;

//
// Evento de ativação do formulário.
//
procedure TPlataformaERPVCLLogRegistroLista.FormActivate(Sender: TObject);
begin
  VCLSDIMaximizar(Self);
end;

//
// Evento de click no botão "Atualizar".
//
procedure TPlataformaERPVCLLogRegistroLista.btnAtualizarClick(Sender: TObject);
begin
  Exit;
end;

//
// Evento de click no botão "Selecionar".
//
procedure TPlataformaERPVCLLogRegistroLista.btnSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

//
// Evento de click no botão "Minimizar".
//
procedure TPlataformaERPVCLLogRegistroLista.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "Fechar".
//
procedure TPlataformaERPVCLLogRegistroLista.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLLogRegistroLista.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
//
//
procedure TPlataformaERPVCLLogRegistroLista.FormularioSelecionar;
var
  locFormulario: TPlataformaERPVCLLogRegistroExibir;
begin
  locFormulario := TPlataformaERPVCLLogRegistroExibir.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;


end.
