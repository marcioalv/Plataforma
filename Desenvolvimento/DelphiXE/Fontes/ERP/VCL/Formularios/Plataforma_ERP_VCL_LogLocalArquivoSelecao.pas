//
// Arquivo..: Plataforma_ERP_VCL_LogLocalArquivoSelecao.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio para exibir as op��es de sele��o do arquivo de log local da aplica��o.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_LogLocalArquivoSelecao;

interface

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TPlataformaERPVCLLogLocalArquivoSelecao = class(TForm)
    panFormulario: TPanel;
    btnFechar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLLogLocalArquivoSelecao: TPlataformaERPVCLLogLocalArquivoSelecao;

implementation

{$R *.dfm}

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.FormCreate(Sender: TObject);
begin
  Exit;
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.FormShow(Sender: TObject);
begin
  Exit;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click no bot�o "Fechar".
//
procedure TPlataformaERPVCLLogLocalArquivoSelecao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.
