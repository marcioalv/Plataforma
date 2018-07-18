//
// Arquivo..: Plataforma_ERP_VCL_LogRegistroExibir.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio VCL com os dados detalhados de um log de registro.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_LogRegistroExibir;

interface

uses
  Plataforma_ERP_Generico,
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
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TPlataformaERPVCLLogRegistroExibir = class(TForm)
    imgFormulario: TImage;
    panFormulario: TPanel;
    btnFechar: TButton;
    lblSequencial: TLabel;
    edtSequencial: TEdit;
    lblLogLocalDtHr: TLabel;
    edtLogLocalDtHr: TEdit;
    lblLogServerDtHr: TLabel;
    edtLogServerDtHr: TEdit;
    lblRegistroAcaoTitulo: TLabel;
    edtRegistroAcaoTitulo: TEdit;
    lblHostName: TLabel;
    edtHostName: TEdit;
    lblUserName: TLabel;
    edtUserName: TEdit;
    lblUsuarioNome: TLabel;
    edtUsuarioNome: TEdit;
    lblMensagem: TLabel;
    memMensagem: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
  private
    procedure FormularioLimpar;
  public
    pubLogRegistro: TPlataforma_ERP_LogRegistro;
  end;

var
  PlataformaERPVCLLogRegistroExibir: TPlataformaERPVCLLogRegistroExibir;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLLogRegistroExibir.FormCreate(Sender: TObject);
begin
  Exit;
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLLogRegistroExibir.FormShow(Sender: TObject);
begin
  //
  // Limpa os componentes do formul�rio.
  //
  FormularioLimpar;

  //
  // Carrega componentes.
  //
  edtSequencial.Text         := IntegerStringConverter(pubLogRegistro.Sequencial, True);
  edtLogLocalDtHr.Text       := DateTimeStringConverter(pubLogRegistro.LogLocalDtHr,  'dd/mm/yyyy hh:nn:ss.zzz');
  edtLogServerDtHr.Text      := DateTimeStringConverter(pubLogRegistro.LogServerDtHr, 'dd/mm/yyyy hh:nn:ss.zzz');
  edtRegistroAcaoTitulo.Text := pubLogRegistro.RegistroAcaoTitulo;
  edtHostName.Text           := pubLogRegistro.HostName;
  edtUserName.Text           := pubLogRegistro.UserName;
  edtUsuarioNome.Text        := pubLogRegistro.UsuarioNome;
  memMensagem.Text           := pubLogRegistro.Mensagem;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLLogRegistroExibir.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click no bot�o "Fechar".
//
procedure TPlataformaERPVCLLogRegistroExibir.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLLogRegistroExibir.FormularioLimpar;
begin
  VCLEditLimpar(edtSequencial);
  VCLEditLimpar(edtLogLocalDtHr);
  VCLEditLimpar(edtLogServerDtHr);
  VCLEditLimpar(edtRegistroAcaoTitulo);
  VCLEditLimpar(edtHostName);
  VCLEditLimpar(edtUserName);
  VCLEditLimpar(edtUsuarioNome);
  VCLMemoLimpar(memMensagem);
end;

end.
