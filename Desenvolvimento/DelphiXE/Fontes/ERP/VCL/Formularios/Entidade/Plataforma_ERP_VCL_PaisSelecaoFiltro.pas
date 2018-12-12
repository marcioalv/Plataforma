//
// Arquivo..: Plataforma_ERP_VCL_PaisSelecaoFiltro.pas
// Projeto..: ERP
// Fonte....: Formulário VCL

// Criação..: 17/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com os parâmetros de filtro para a listagem de países.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_PaisSelecaoFiltro;

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
  TPlataformaERPVCLPaisSelecaoFiltro = class(TForm)
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
  PlataformaERPVCLPaisSelecaoFiltro: TPlataformaERPVCLPaisSelecaoFiltro;

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

  FONTE_NOME: string = 'Plataforma_ERP_VCL_PaisSelecaoFiltro';

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLPaisSelecaoFiltro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas.
  //
  pubClicouFechar := True;
  pubNome         := '';

  //
  // Inicializa componentes do formulário.
  //
  FormularioInicializar;

  //
  // Limpa componentes do formulário.
  //
  FormularioLimpar;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLPaisSelecaoFiltro.FormShow(Sender: TObject);
begin
  //
  // Background do formulário.
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
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLPaisSelecaoFiltro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLPaisSelecaoFiltro.mniLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

procedure TPlataformaERPVCLPaisSelecaoFiltro.mniLimparClick(Sender: TObject);
begin
  FormularioLimpar;
end;

procedure TPlataformaERPVCLPaisSelecaoFiltro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLPaisSelecaoFiltro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "nome".
//
procedure TPlataformaERPVCLPaisSelecaoFiltro.edtNomeEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtNome) then Exit;
end;

procedure TPlataformaERPVCLPaisSelecaoFiltro.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLPaisSelecaoFiltro.edtNomeExit(Sender: TObject);
begin
  if not VCLEditSair(edtNome) then Exit;
end;

//
// Evento de click no botão "localizar".
//
procedure TPlataformaERPVCLPaisSelecaoFiltro.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no botão "limpar".
//
procedure TPlataformaERPVCLPaisSelecaoFiltro.btnLimparClick(Sender: TObject);
begin
  FormularioLimpar;
  edtNome.SetFocus;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLPaisSelecaoFiltro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLPaisSelecaoFiltro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para inicializar os componentes do formulário.
//
procedure TPlataformaERPVCLPaisSelecaoFiltro.FormularioInicializar;
begin
  Exit;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLPaisSelecaoFiltro.FormularioLimpar;
begin
  VCLEditLimpar(edtNome);
end;

//
// Procedimento para localizar os dados do filtro.
//
procedure TPlataformaERPVCLPaisSelecaoFiltro.FormularioLocalizar;
begin
  pubClicouFechar := False;
  pubNome         := StringTrim(edtNome.Text);
  Close;
end;

end.

