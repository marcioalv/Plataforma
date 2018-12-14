//
// Arquivo..: Plataforma_ERP_VCL_LogradouroSelecaoFiltro.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 17/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com os par�metros de filtro para a listagem de logradouros.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_LogradouroSelecaoFiltro;

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
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls,
  Vcl.Mask,
  Vcl.Menus;

type
  TPlataformaERPVCLLogradouroSelecaoFiltro = class(TForm)
    imgFormulario: TImage;
    btnLocalizar: TBitBtn;
    btnFechar: TBitBtn;
    btnLimpar: TBitBtn;
    btnMinimizar: TBitBtn;
    imgBackground: TImage;
    mniFormulario: TMainMenu;
    mniFechar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniLimpar: TMenuItem;
    mniLocalizar: TMenuItem;
    Panel1: TPanel;
    lblDescricao: TLabel;
    edtDescricao: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescricaoEnter(Sender: TObject);
    procedure edtDescricaoExit(Sender: TObject);
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
    procedure mniLimparClick(Sender: TObject);
    procedure mniLocalizarClick(Sender: TObject);
  private
    procedure FormularioInicializar;
    procedure FormularioLimpar;
    procedure FormularioLocalizar;
  public
    pubClicouFechar: Boolean;
    pubDescricao   : string;
  end;

var
  PlataformaERPVCLLogradouroSelecaoFiltro: TPlataformaERPVCLLogradouroSelecaoFiltro;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico;

const
  TAB_CADASTRO : Byte = 0;
  TAB_AUDITORIA: Byte = 1;

  FONTE_NOME: string = 'Plataforma_ERP_VCL_LogradouroSelecaoFiltro';

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLLogradouroSelecaoFiltro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas.
  //
  pubClicouFechar := True;
  pubDescricao    := '';

  //
  // Inicializa componentes do formul�rio.
  //
  FormularioInicializar;

  //
  // Limpa componentes do formul�rio.
  //
  FormularioLimpar;
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLLogradouroSelecaoFiltro.FormShow(Sender: TObject);
begin
  //
  // Background do formul�rio.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Filtros memorizados.
  //
  edtDescricao.Text := pubDescricao;

  //
  // Foco no componente desejado.
  //
  edtDescricao.SetFocus;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLLogradouroSelecaoFiltro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas op��es do menu.
//
procedure TPlataformaERPVCLLogradouroSelecaoFiltro.mniLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

procedure TPlataformaERPVCLLogradouroSelecaoFiltro.mniLimparClick(Sender: TObject);
begin
  FormularioLimpar;
end;

procedure TPlataformaERPVCLLogradouroSelecaoFiltro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLLogradouroSelecaoFiltro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "descri��o".
//
procedure TPlataformaERPVCLLogradouroSelecaoFiltro.edtDescricaoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtDescricao) then Exit;
end;

procedure TPlataformaERPVCLLogradouroSelecaoFiltro.edtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLLogradouroSelecaoFiltro.edtDescricaoExit(Sender: TObject);
begin
  if not VCLEditSair(edtDescricao) then Exit;
end;

//
// Evento de click no bot�o "localizar".
//
procedure TPlataformaERPVCLLogradouroSelecaoFiltro.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no bot�o "limpar".
//
procedure TPlataformaERPVCLLogradouroSelecaoFiltro.btnLimparClick(Sender: TObject);
begin
  FormularioLimpar;

  edtDescricao.SetFocus;
end;

//
// Evento de click no bot�o "minimizar".
//
procedure TPlataformaERPVCLLogradouroSelecaoFiltro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLLogradouroSelecaoFiltro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para inicializar os componentes do formul�rio.
//
procedure TPlataformaERPVCLLogradouroSelecaoFiltro.FormularioInicializar;
begin
  Exit;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLLogradouroSelecaoFiltro.FormularioLimpar;
begin
  VCLEditLimpar(edtDescricao);
end;

//
// Procedimento para localizar os dados do filtro.
//
procedure TPlataformaERPVCLLogradouroSelecaoFiltro.FormularioLocalizar;
begin
  pubClicouFechar := False;
  pubDescricao    := StringTrim(edtDescricao.Text);
  Close;
end;

end.

