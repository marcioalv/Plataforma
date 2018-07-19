//
// Arquivo..: Plataforma_ERP_VCL_LogRegistroExibir.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com os detalhes de log de um registro.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
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
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  TPlataformaERPVCLLogRegistroExibir = class(TForm)
    imgFormulario: TImage;
    btnFechar: TButton;
    pagFormulario: TPageControl;
    tabRegistro: TTabSheet;
    tabDados: TTabSheet;
    lblSequencial: TLabel;
    lblLogLocalDtHr: TLabel;
    lblLogServerDtHr: TLabel;
    lblRegistroAcaoTitulo: TLabel;
    lblHostName: TLabel;
    lblUserName: TLabel;
    lblUsuarioNome: TLabel;
    lblMensagem: TLabel;
    lblBase: TLabel;
    edtSequencial: TEdit;
    edtLogLocalDtHr: TEdit;
    edtLogServerDtHr: TEdit;
    edtRegistroAcaoTitulo: TEdit;
    edtHostName: TEdit;
    edtUserName: TEdit;
    edtUsuarioNome: TEdit;
    memMensagem: TMemo;
    edtBaseTitulo: TEdit;
    memDados: TMemo;
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
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLLogRegistroExibir.FormCreate(Sender: TObject);
begin
  pagFormulario.ActivePageIndex := 0;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLLogRegistroExibir.FormShow(Sender: TObject);
begin
  //
  // Limpa os componentes do formulário.
  //
  FormularioLimpar;

  //
  // Carrega componentes.
  //
  edtSequencial.Text         := IntegerStringConverter(pubLogRegistro.Sequencial, True);
  edtLogLocalDtHr.Text       := DateTimeStringConverter(pubLogRegistro.LogLocalDtHr,  'dd/mm/yyyy hh:nn:ss.zzz');
  edtLogServerDtHr.Text      := DateTimeStringConverter(pubLogRegistro.LogServerDtHr, 'dd/mm/yyyy hh:nn:ss.zzz');
  edtBaseTitulo.Text         := pubLogRegistro.LogBaseTitulo;
  edtRegistroAcaoTitulo.Text := pubLogRegistro.RegistroAcaoTitulo;
  edtHostName.Text           := pubLogRegistro.HostName;
  edtUserName.Text           := pubLogRegistro.UserName;
  edtUsuarioNome.Text        := pubLogRegistro.UsuarioNome;
  memMensagem.Text           := pubLogRegistro.Mensagem;
  memDados.Text              := StringLogDadosDescreverEnter(pubLogRegistro.Dados);
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLLogRegistroExibir.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click no botão "Fechar".
//
procedure TPlataformaERPVCLLogRegistroExibir.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLLogRegistroExibir.FormularioLimpar;
begin
  VCLEditLimpar(edtSequencial);
  VCLEditLimpar(edtLogLocalDtHr);
  VCLEditLimpar(edtLogServerDtHr);
  VCLEditLimpar(edtBaseTitulo);
  VCLEditLimpar(edtRegistroAcaoTitulo);
  VCLEditLimpar(edtHostName);
  VCLEditLimpar(edtUserName);
  VCLEditLimpar(edtUsuarioNome);
  VCLMemoLimpar(memMensagem);
  VCLMemoLimpar(memDados);
end;

end.
