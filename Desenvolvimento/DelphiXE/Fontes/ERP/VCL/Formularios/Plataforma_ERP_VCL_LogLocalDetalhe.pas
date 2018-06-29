//
// Arquivo..: Plataforma_ERP_VCL_LogLocalDetalhe.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio para exibir os detalhes de um log da aplica��o ERP.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_LogLocalDetalhe;

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
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TPlataformaERPVCLLogLocalDetalhe = class(TForm)
    panFormulario: TPanel;
    lblAplicativo: TLabel;
    txtAplicativo: TEdit;
    lblHashCode: TLabel;
    txtHashCode: TEdit;
    lblHostName: TLabel;
    txtHostName: TEdit;
    lblUserName: TLabel;
    txtUserName: TEdit;
    lblUsuario: TLabel;
    txtUsuarioID: TEdit;
    txtUsuarioNome: TEdit;
    lblDataHora: TLabel;
    txtDataHora: TEdit;
    lblCritico: TLabel;
    txtCritico: TEdit;
    lblMensagem: TLabel;
    txtMensagem: TMemo;
    btnFechar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure FormularioLimpar;
  public
    procedure FormularioPopular(argAplicativo : string;
                                argHashCode   : string;
                                argHostName   : string;
                                argUserName   : string;
                                argUsuarioID  : Integer;
                                argUsuarioNome: string;
                                argCritico    : Boolean;
                                argDataHora   : TDateTime;
                                argMensagem   : string);
  end;

var
  PlataformaERPVCLLogLocalDetalhe: TPlataformaERPVCLLogLocalDetalhe;

implementation

{$R *.dfm}

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLLogLocalDetalhe.FormCreate(Sender: TObject);
begin
  FormularioLimpar;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLLogLocalDetalhe.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click no bot�o "Fechar".
//
procedure TPlataformaERPVCLLogLocalDetalhe.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLLogLocalDetalhe.FormularioLimpar;
begin
  VCLEditLimpar(txtAplicativo);
  VCLEditLimpar(txtHashCode);
  VCLEditLimpar(txtHostName);
  VCLEditLimpar(txtUserName);
  VCLEditLimpar(txtUsuarioID);
  VCLEditLimpar(txtUsuarioNome);
  VCLEditLimpar(txtCritico);
  VCLEditLimpar(txtDataHora);
  VCLMemoLimpar(txtMensagem);
end;

//
// Procedimento para popular o formul�rio com informa��es transferidas de outro formul�rio.
//
procedure TPlataformaERPVCLLogLocalDetalhe.FormularioPopular(argAplicativo : string;
                                                             argHashCode   : string;
                                                             argHostName   : string;
                                                             argUserName   : string;
                                                             argUsuarioID  : Integer;
                                                             argUsuarioNome: string;
                                                             argCritico    : Boolean;
                                                             argDataHora   : TDateTime;
                                                             argMensagem   : string);
begin
  txtAplicativo.Text  := argAplicativo;
  txtHashCode.Text    := argHashCode;
  txtHostName.Text    := argHostName;
  txtUserName.Text    := argUserName;
  txtUsuarioID.Text   := IntegerStringConverter(argUsuarioID, True);
  txtUsuarioNome.Text := argUsuarioNome;
  txtCritico.Text     := BooleanStringConverter(argCritico, False);
  txtDataHora.Text    := DateTimeStringConverter(argDataHora, 'dd/mm/yyyy hh:nn:ss.zzz');
  txtMensagem.Text    := argMensagem;
end;

end.
