//
// Arquivo..: Plataforma_ERP_VCL_LogRegistroLista.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio VCL com a lista de logs ocorrido em um registro.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
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
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLLogRegistroLista.FormCreate(Sender: TObject);
begin
  Exit;
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLLogRegistroLista.FormShow(Sender: TObject);
begin
  Exit;
end;

//
// Evento de ativa��o do formul�rio.
//
procedure TPlataformaERPVCLLogRegistroLista.FormActivate(Sender: TObject);
begin
  VCLSDIMaximizar(Self);
end;

//
// Evento de click no bot�o "Atualizar".
//
procedure TPlataformaERPVCLLogRegistroLista.btnAtualizarClick(Sender: TObject);
begin
  Exit;
end;

//
// Evento de click no bot�o "Selecionar".
//
procedure TPlataformaERPVCLLogRegistroLista.btnSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

//
// Evento de click no bot�o "Minimizar".
//
procedure TPlataformaERPVCLLogRegistroLista.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "Fechar".
//
procedure TPlataformaERPVCLLogRegistroLista.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Evento de pressionamento de teclas no formul�rio.
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
