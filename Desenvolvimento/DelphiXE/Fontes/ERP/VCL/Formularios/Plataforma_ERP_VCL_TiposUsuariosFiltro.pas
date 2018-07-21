//
// Arquivo..: Plataforma_ERP_VCL_TiposUsuariosFiltro.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com os par�metros de filtro para a listagem de tipos de usu�rios.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

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
  Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TPlataformaERPVCLTiposUsuariosFiltro = class(TForm)
    imgFormulario: TImage;
    btnConfirmar: TBitBtn;
    btnFechar: TBitBtn;
    btnLimpar: TBitBtn;
    btnMinimizar: TBitBtn;
    pagFormulario: TPageControl;
    tabPadrao: TTabSheet;
    tabAdicional: TTabSheet;
    lblCodigo: TLabel;
    lblCodigoAte: TLabel;
    lblDescricao: TLabel;
    edtCodigoInicial: TEdit;
    edtCodigoFinal: TEdit;
    edtDescricao: TEdit;
    lblTipoUsuarioID: TLabel;
    lblTipoUsuarioIDAte: TLabel;
    lblBloqueado: TLabel;
    lblAtivo: TLabel;
    edtTipoUsuarioIDInicial: TEdit;
    edtTipoUsuarioIDFinal: TEdit;
    cbxBloqueado: TComboBox;
    cbxAtivo: TComboBox;
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
    procedure edtDescricaoEnter(Sender: TObject);
    procedure edtDescricaoExit(Sender: TObject);
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure cbxBloqueadoEnter(Sender: TObject);
    procedure cbxBloqueadoExit(Sender: TObject);
    procedure cbxBloqueadoKeyPress(Sender: TObject; var Key: Char);
    procedure cbxAtivoEnter(Sender: TObject);
    procedure cbxAtivoExit(Sender: TObject);
    procedure cbxAtivoKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
  private
    procedure FormularioInicializar;
    procedure FormularioLimpar;
    procedure FormularioConfirmar;
  public
    pubClicouFechar        : Boolean;
    pubTipoUsuarioIDInicial: Integer;
    pubTipoUsuarioIDFinal  : Integer;
    pubCodigoInicial       : string;
    pubCodigoFinal         : string;
    pubDescricao           : string;
    pubBloqueado           : string;
    pubAtivo               : string;
  end;

var
  PlataformaERPVCLTiposUsuariosFiltro: TPlataformaERPVCLTiposUsuariosFiltro;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL;

const
  TAB_PADRAO   : Byte = 0;
  TAB_ADICIONAL: Byte = 1;

  FONTE_NOME: string = 'Plataforma_ERP_VCL_TiposUsuariosFiltro';

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas.
  //
  pubClicouFechar         := True;
  pubTipoUsuarioIDInicial := 0;
  pubTipoUsuarioIDFinal   := 0;
  pubCodigoInicial        := '';
  pubCodigoFinal          := '';
  pubDescricao            := '';
  pubBloqueado            := '';
  pubAtivo                := '';

  //
  // Posiciona o tab padr�o.
  //
  pagFormulario.ActivePageIndex := TAB_PADRAO;

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
procedure TPlataformaERPVCLTiposUsuariosFiltro.FormShow(Sender: TObject);
begin
  //
  // Filtros memorizados.
  //
  edtTipoUsuarioIDInicial.Text := IntegerStringConverter(pubTipoUsuarioIDInicial, True);
  edtTipoUsuarioIDFinal.Text   := IntegerStringConverter(pubTipoUsuarioIDFinal, True);
  edtCodigoInicial.Text        := pubCodigoInicial;
  edtCodigoFinal.Text          := pubCodigoFinal;
  edtDescricao.Text            := pubDescricao;
  VCLComboBoxPopular(cbxBloqueado, pubBloqueado);
  VCLComboBoxPopular(cbxAtivo,     pubAtivo);

  //
  // Foco no componente desejado.
  //
  edtCodigoInicial.SetFocus;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos do componente "ID inicial" do tipo do usu�rio.
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
// Eventos do componente "ID final" do tipo do usu�rio.
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
// Eventos do componente "c�digo inicial".
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
// Eventos do componente "c�digo final".
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
// Eventos do componente "descri��o".
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.edtDescricaoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtDescricao) then Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosFiltro.edtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLTiposUsuariosFiltro.edtDescricaoExit(Sender: TObject);
begin
  if not VCLEditSair(edtDescricao) then Exit;
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
  if not VCLComboBoxValidar(cbxBloqueado) then Exit;
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
  if not VCLComboBoxValidar(cbxAtivo) then Exit;
end;

//
// Evento de click no bot�o "confirmar".
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.btnConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

//
// Evento de click no bot�o "limpar".
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.btnLimparClick(Sender: TObject);
begin
  FormularioLimpar;

  if pagFormulario.ActivePageIndex = TAB_PADRAO then
    edtCodigoInicial.SetFocus
  else
    edtTipoUsuarioIDInicial.SetFocus;
end;

//
// Evento de click no bot�o "minimizar".
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para inicializar os componentes do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.FormularioInicializar;
begin
  VCLComboBoxSimNaoPopular(cbxBloqueado, True);
  VCLComboBoxSimNaoPopular(cbxAtivo,     True);
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.FormularioLimpar;
begin
  VCLEditLimpar    (edtTipoUsuarioIDInicial);
  VCLEditLimpar    (edtTipoUsuarioIDFinal);
  VCLEditLimpar    (edtCodigoInicial);
  VCLEditLimpar    (edtCodigoFinal);
  VCLEditLimpar    (edtDescricao);
  VCLComboBoxLimpar(cbxBloqueado);
  VCLComboBoxLimpar(cbxAtivo);
end;

//
// Procedimento para confirmar os dados do filtro.
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.FormularioConfirmar;
begin
  pubClicouFechar         := False;
  pubTipoUsuarioIDInicial := StringIntegerConverter(edtTipoUsuarioIDInicial.Text);
  pubTipoUsuarioIDFinal   := StringIntegerConverter(edtTipoUsuarioIDFinal.Text);
  pubCodigoInicial        := StringTrim(edtCodigoInicial.Text);
  pubCodigoFinal          := StringTrim(edtCodigoFinal.Text);
  pubDescricao            := StringTrim(edtDescricao.Text);
  pubBloqueado            := Copy(cbxBloqueado.Text, 1, 1);
  pubAtivo                := Copy(cbxAtivo.Text, 1, 1);
  Close;
end;

end.
