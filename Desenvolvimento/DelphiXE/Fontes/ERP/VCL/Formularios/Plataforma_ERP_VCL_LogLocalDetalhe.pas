//
// Arquivo..: Plataforma_ERP_VCL_LogLocalDetalhe.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário para exibir os detalhes de um log da aplicação ERP.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
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
  Vcl.ExtCtrls, Vcl.Imaging.pngimage;

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
    btnMinimizar: TBitBtn;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    imgFormulario: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioAvancar(argAnterior: Boolean; argProximo: Boolean);
  public
    pubSequencial    : Integer;
    pubClicouAnterior: Boolean;
    pubClicouProximo : Boolean;
    
    procedure FormularioPopular(argSequencial : Integer;
                                argAplicativo : string;
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
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLLogLocalDetalhe.FormCreate(Sender: TObject);
begin
  pubSequencial     := 0;
  pubClicouAnterior := False;
  pubClicouProximo  := False;

  FormularioLimpar;  
end;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLLogLocalDetalhe.FormShow(Sender: TObject);
begin
  Exit;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLLogLocalDetalhe.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click no botão "Anterior".
//
procedure TPlataformaERPVCLLogLocalDetalhe.btnAnteriorClick(Sender: TObject);
begin
  FormularioAvancar(True, False);
end;

//
// Evento de click no botão "Próximo".
//
procedure TPlataformaERPVCLLogLocalDetalhe.btnProximoClick(Sender: TObject);
begin
  FormularioAvancar(False, True);
end;

//
// Evento de click no botão "Minimizar".
//
procedure TPlataformaERPVCLLogLocalDetalhe.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "Fechar".
//
procedure TPlataformaERPVCLLogLocalDetalhe.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formulário.
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
// Procedimento para retroceder ou avançar na lista de mensagens de log.
//
procedure TPlataformaERPVCLLogLocalDetalhe.FormularioAvancar(argAnterior: Boolean; argProximo: Boolean);
begin
  pubClicouAnterior := argAnterior;
  pubClicouProximo  := argProximo;
  Close;
end;

//
// Procedimento para popular o formulário com informações transferidas de outro formulário.
//
procedure TPlataformaERPVCLLogLocalDetalhe.FormularioPopular(argSequencial : Integer;
                                                             argAplicativo : string;
                                                             argHashCode   : string;
                                                             argHostName   : string;
                                                             argUserName   : string;
                                                             argUsuarioID  : Integer;
                                                             argUsuarioNome: string;
                                                             argCritico    : Boolean;
                                                             argDataHora   : TDateTime;
                                                             argMensagem   : string);
begin
  pubSequencial       := argSequencial;
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
