unit Plataforma_ERP_VCL_TiposUsuariosFiltro;

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
  Vcl.Imaging.pngimage;

type
  TPlataformaERPVCLTiposUsuariosFiltro = class(TForm)
    imgFormulario: TImage;
    btnFiltrar: TBitBtn;
    btnFechar: TBitBtn;
    panFormulario: TPanel;
    lblCodigo: TLabel;
    edtCodigoInicial: TEdit;
    lblCodigoAte: TLabel;
    edtCodigoFinal: TEdit;
    lblTitulo: TLabel;
    edtTitulo: TEdit;
    lblTipoUsuarioID: TLabel;
    edtTipoUsuarioIDInicial: TEdit;
    lblTipoUsuarioIDAte: TLabel;
    edtTipoUsuarioIDFinal: TEdit;
    lblBloqueado: TLabel;
    cbxBloqueado: TComboBox;
    lblAtivo: TLabel;
    cbxAtivo: TComboBox;
    btnLimpar: TBitBtn;
    btnMinimizar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtTipoUsuarioIDInicialEnter(Sender: TObject);
    procedure edtTipoUsuarioIDInicialExit(Sender: TObject);
    procedure edtTipoUsuarioIDInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtTipoUsuarioIDFinalEnter(Sender: TObject);
    procedure edtTipoUsuarioIDFinalExit(Sender: TObject);
    procedure edtTipoUsuarioIDFinalKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoInicialEnter(Sender: TObject);
    procedure edtCodigoInicialExit(Sender: TObject);
    procedure edtCodigoInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoFinalEnter(Sender: TObject);
    procedure edtCodigoFinalExit(Sender: TObject);
    procedure edtCodigoFinalKeyPress(Sender: TObject; var Key: Char);
    procedure edtTituloEnter(Sender: TObject);
    procedure edtTituloExit(Sender: TObject);
    procedure edtTituloKeyPress(Sender: TObject; var Key: Char);
    procedure cbxBloqueadoEnter(Sender: TObject);
    procedure cbxBloqueadoExit(Sender: TObject);
    procedure cbxBloqueadoKeyPress(Sender: TObject; var Key: Char);
    procedure cbxAtivoEnter(Sender: TObject);
    procedure cbxAtivoExit(Sender: TObject);
    procedure cbxAtivoKeyPress(Sender: TObject; var Key: Char);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    procedure FormularioInicializar;
    procedure FormularioLimpar;
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLTiposUsuariosFiltro: TPlataformaERPVCLTiposUsuariosFiltro;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_TiposUsuariosFiltro';

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.FormCreate(Sender: TObject);
begin
  FormularioInicializar;
  FormularioLimpar;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.FormShow(Sender: TObject);
begin
  Exit;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos do componente "ID inicial" do tipo do usuário.
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.edtTipoUsuarioIDInicialEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtTipoUsuarioIDInicial) then Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosFiltro.edtTipoUsuarioIDInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLTiposUsuariosFiltro.edtTipoUsuarioIDInicialExit(Sender: TObject);
begin
  if not VCLEditSair(edtTipoUsuarioIDInicial) then Exit;
end;

//
// Eventos do componente "ID final" do tipo do usuário.
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.edtTipoUsuarioIDFinalEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtTipoUsuarioIDFinal) then Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosFiltro.edtTipoUsuarioIDFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLTiposUsuariosFiltro.edtTipoUsuarioIDFinalExit(Sender: TObject);
begin
  if not VCLEditSair(edtTipoUsuarioIDFinal) then Exit;
end;

//
// Eventos do componente "código inicial".
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.edtCodigoInicialEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigoInicial) then Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosFiltro.edtCodigoInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLTiposUsuariosFiltro.edtCodigoInicialExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigoInicial) then Exit;
end;

//
// Eventos do componente "código final".
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.edtCodigoFinalEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigoFinal) then Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosFiltro.edtCodigoFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLTiposUsuariosFiltro.edtCodigoFinalExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigoFinal) then Exit;
end;

//
// Eventos do componente "título".
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.edtTituloEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtTitulo) then Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosFiltro.edtTituloKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLTiposUsuariosFiltro.edtTituloExit(Sender: TObject);
begin
  if not VCLEditSair(edtTitulo) then Exit;
end;

//
// Eventos do componente "bloqueado".
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.cbxBloqueadoEnter(Sender: TObject);
begin
  if not VCLComboBoxEntrar(cbxBloqueado) then Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosFiltro.cbxBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLTiposUsuariosFiltro.cbxBloqueadoExit(Sender: TObject);
begin
  if not VCLComboBoxSair(cbxBloqueado) then Exit;
end;

//
// Eventos do componente "ativo".
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.cbxAtivoEnter(Sender: TObject);
begin
  if not VCLComboBoxEntrar(cbxAtivo) then Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosFiltro.cbxAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLTiposUsuariosFiltro.cbxAtivoExit(Sender: TObject);
begin
  if not VCLComboBoxSair(cbxAtivo) then Exit;
end;

//
// Evento de click no botão "Limpar".
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.btnLimparClick(Sender: TObject);
begin
  FormularioLimpar;
  edtTipoUsuarioIDInicial.SetFocus;
end;

//
// Evento de click no botão "Filtrar".
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.btnFiltrarClick(Sender: TObject);
begin
  Close;
end;

//
// Evento de click no botão "Fechar".
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para inicializar os componentes do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.FormularioInicializar;
begin
  VCLComboBoxSimNaoPopular(cbxBloqueado, True);
  VCLComboBoxSimNaoPopular(cbxAtivo,     True);
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.FormularioLimpar;
begin
  VCLEditLimpar    (edtTipoUsuarioIDInicial);
  VCLEditLimpar    (edtTipoUsuarioIDFinal);
  VCLEditLimpar    (edtCodigoInicial);
  VCLEditLimpar    (edtCodigoFinal);
  VCLEditLimpar    (edtTitulo);
  VCLComboBoxLimpar(cbxBloqueado);
  VCLComboBoxLimpar(cbxAtivo);
end;

end.
