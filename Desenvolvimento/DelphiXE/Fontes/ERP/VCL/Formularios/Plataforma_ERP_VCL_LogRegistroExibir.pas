//
// Arquivo..: Plataforma_ERP_VCL_LogRegistroExibir.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com os detalhes de log de um registro.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_LogRegistroExibir;

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
    lblLogBase: TLabel;
    edtSequencial: TEdit;
    edtLogLocalDtHr: TEdit;
    edtLogServerDtHr: TEdit;
    edtRegistroAcaoDescricao: TEdit;
    edtHostName: TEdit;
    edtUserName: TEdit;
    edtUsuarioNome: TEdit;
    memMensagem: TMemo;
    edtLogBaseDescricao: TEdit;
    memDados: TMemo;
    edtLogBaseID: TEdit;
    edtRegistroAcaoID: TEdit;
    edtUsuarioID: TEdit;
    edtUsuarioBaseID: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure edtLogLocalDtHrClick(Sender: TObject);
    procedure edtLogServerDtHrClick(Sender: TObject);
    procedure edtLogBaseDescricaoClick(Sender: TObject);
  private
    procedure FormularioLimpar;
  public
    pubSequencial           : Integer;
    pubLogLocalDtHr         : TDateTime;
    pubLogServerDtHr        : TDateTime;
    pubLogBaseID            : Integer;
    pubLogBaseDescricao     : string;
    pubRegistroAcaoID       : Integer;
    pubRegistroAcaoDescricao: string;
    pubHostName             : string;
    pubUserName             : string;
    pubUsuarioBaseID        : Integer;
    pubUsuarioID            : Integer;
    pubUsuarioNome          : string;
    pubMensagem             : string;
    pubDados                : string;
  end;

var
  PlataformaERPVCLLogRegistroExibir: TPlataformaERPVCLLogRegistroExibir;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_VCL_Generico;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLLogRegistroExibir.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas.
  //
  pubSequencial            := 0;
  pubLogLocalDtHr          := 0;
  pubLogServerDtHr         := 0;
  pubLogBaseID             := 0;
  pubLogBaseDescricao      := '';
  pubRegistroAcaoID        := 0;
  pubRegistroAcaoDescricao := '';
  pubHostName              := '';
  pubUserName              := '';
  pubUsuarioBaseID         := 0;
  pubUsuarioID             := 0;
  pubUsuarioNome           := '';
  pubMensagem              := '';
  pubDados                 := '';

  //
  // Exibe a aba apropriada.
  //
  pagFormulario.ActivePageIndex := 0;
end;

//
// Evento de click no componente "base".
//
procedure TPlataformaERPVCLLogRegistroExibir.edtLogBaseDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_BaseCadastroExibir(StringIntegerConverter(edtLogBaseID.Text));
end;

//
// Evento de click no componente "data e hora local".
//
procedure TPlataformaERPVCLLogRegistroExibir.edtLogLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtLogLocalDtHr.Text));
end;

//
// Evento de click no componente "data e hora no servidor".
//
procedure TPlataformaERPVCLLogRegistroExibir.edtLogServerDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtLogServerDtHr.Text));
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
  edtSequencial.Text            := IntegerStringConverter(pubSequencial, True);
  edtLogLocalDtHr.Text          := DateTimeStringConverter(pubLogLocalDtHr,  'dd/mm/yyyy hh:nn:ss.zzz');
  edtLogServerDtHr.Text         := DateTimeStringConverter(pubLogServerDtHr, 'dd/mm/yyyy hh:nn:ss.zzz');
  edtLogBaseID.Text             := IntegerStringConverter(pubLogBaseID, True);
  edtLogBaseDescricao.Text      := pubLogBaseDescricao;
  edtRegistroAcaoID.Text        := IntegerStringConverter(pubRegistroAcaoID, True);
  edtRegistroAcaoDescricao.Text := pubRegistroAcaoDescricao;
  edtHostName.Text              := pubHostName;
  edtUserName.Text              := pubUserName;
  edtUsuarioBaseID.Text         := IntegerStringConverter(pubUsuarioBaseID);
  edtUsuarioID.Text             := IntegerStringConverter(pubUsuarioID);
  edtUsuarioNome.Text           := pubUsuarioNome;
  memMensagem.Text              := pubMensagem;
  memDados.Text                 := StringLogDadosDescreverEnter(pubDados);

  //
  // Controle de click para a exibi��o dos cadastros.
  //
  VCLEditClickControlar(edtLogBaseDescricao, True);
  VCLEditClickControlar(edtLogLocalDtHr,     True);
  VCLEditClickControlar(edtLogServerDtHr,    True);    
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

  VCLEditLimpar(edtLogBaseID);
  VCLEditLimpar(edtLogBaseDescricao);

  VCLEditLimpar(edtRegistroAcaoID);
  VCLEditLimpar(edtRegistroAcaoDescricao);
  
  VCLEditLimpar(edtHostName);
  VCLEditLimpar(edtUserName);

  VCLEditLimpar(edtUsuarioBaseID);
  VCLEditLimpar(edtUsuarioID);
  VCLEditLimpar(edtUsuarioNome);

  VCLMemoLimpar(memMensagem);
  VCLMemoLimpar(memDados);

  VCLEditClickControlar(edtLogBaseDescricao, False);
  VCLEditClickControlar(edtLogLocalDtHr,     False);
  VCLEditClickControlar(edtLogServerDtHr,    False);  
end;

end.
