//
// Arquivo..: Plataforma_ERP_VCL_LogLocalFiltro.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio para exibir os filtros do log local da aplica��o.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_LogLocalFiltro;

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
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.Mask;                             

type
  TPlataformaERPVCLLogLocalFiltro = class(TForm)
    btnFechar: TBitBtn;
    panFormulario: TPanel;
    lblPeriodo: TLabel;
    lblPeriodoAte: TLabel;
    lblMensagem: TLabel;
    txtMensagem: TEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
  private
    procedure FormularioLimpar;
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLLogLocalFiltro: TPlataformaERPVCLLogLocalFiltro;

implementation

{$R *.dfm}

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLLogLocalFiltro.FormCreate(Sender: TObject);
begin
  Exit;
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLLogLocalFiltro.FormShow(Sender: TObject);
begin
  FormularioLimpar;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLLogLocalFiltro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click no bot�o "Fechar".
//
procedure TPlataformaERPVCLLogLocalFiltro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLLogLocalFiltro.FormularioLimpar;
begin
  //txtDtPeriodoIni.Text := '';
//  txtHrPeriodoIni.Text := '';

//  txtDtPeriodoFim.Text := '';
//  txtHrPeriodoFim.Text := '';

  txtMensagem.Text     := '';
end;

end.
