//
// Arquivo..: Plataforma_ERP_VCL_BairroSelecaoFiltro.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 17/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com os par�metros de filtro para a listagem de bairros.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_BairroSelecaoFiltro;

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
  TPlataformaERPVCLBairroSelecaoFiltro = class(TForm)
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
    lblNome: TLabel;
    edtNome: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeEnter(Sender: TObject);
    procedure edtNomeExit(Sender: TObject);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
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
    pubNome        : string;
  end;

var
  PlataformaERPVCLBairroSelecaoFiltro: TPlataformaERPVCLBairroSelecaoFiltro;

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

  FONTE_NOME: string = 'Plataforma_ERP_VCL_BairroSelecaoFiltro';

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLBairroSelecaoFiltro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas.
  //
  pubClicouFechar := True;
  pubNome         := '';

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
procedure TPlataformaERPVCLBairroSelecaoFiltro.FormShow(Sender: TObject);
begin
  //
  // Background do formul�rio.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Filtros memorizados.
  //
  edtNome.Text := pubNome;

  //
  // Foco no componente desejado.
  //
  edtNome.SetFocus;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLBairroSelecaoFiltro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas op��es do menu.
//
procedure TPlataformaERPVCLBairroSelecaoFiltro.mniLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

procedure TPlataformaERPVCLBairroSelecaoFiltro.mniLimparClick(Sender: TObject);
begin
  FormularioLimpar;
end;

procedure TPlataformaERPVCLBairroSelecaoFiltro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLBairroSelecaoFiltro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "nome".
//
procedure TPlataformaERPVCLBairroSelecaoFiltro.edtNomeEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtNome) then Exit;
end;

procedure TPlataformaERPVCLBairroSelecaoFiltro.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLBairroSelecaoFiltro.edtNomeExit(Sender: TObject);
begin
  if not VCLEditSair(edtNome) then Exit;
end;

//
// Evento de click no bot�o "localizar".
//
procedure TPlataformaERPVCLBairroSelecaoFiltro.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no bot�o "limpar".
//
procedure TPlataformaERPVCLBairroSelecaoFiltro.btnLimparClick(Sender: TObject);
begin
  FormularioLimpar;

  edtNome.SetFocus;
end;

//
// Evento de click no bot�o "minimizar".
//
procedure TPlataformaERPVCLBairroSelecaoFiltro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLBairroSelecaoFiltro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para inicializar os componentes do formul�rio.
//
procedure TPlataformaERPVCLBairroSelecaoFiltro.FormularioInicializar;
begin
  Exit;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLBairroSelecaoFiltro.FormularioLimpar;
begin
  VCLEditLimpar(edtNome);
end;

//
// Procedimento para localizar os dados do filtro.
//
procedure TPlataformaERPVCLBairroSelecaoFiltro.FormularioLocalizar;
begin
  pubClicouFechar := False;
  pubNome         := StringTrim(edtNome.Text);
  Close;
end;

end.

