//
// Arquivo..: Plataforma_ERP_VCL_TiposUsuariosFiltro.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com os parâmetros de filtro para a listagem de tipos de usuários.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
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
  Vcl.Imaging.pngimage;

type
  TPlataformaERPVCLTiposUsuariosFiltro = class(TForm)
    imgFormulario: TImage;
    btnConfirmar: TBitBtn;
    btnFechar: TBitBtn;
    panFormulario: TPanel;
    lblCodigo: TLabel;
    edtCodigoInicial: TEdit;
    lblCodigoAte: TLabel;
    edtCodigoFinal: TEdit;
    lblDescricao: TLabel;
    edtDescricao: TEdit;
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
  FONTE_NOME: string = 'Plataforma_ERP_VCL_TiposUsuariosFiltro';

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas.
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
procedure TPlataformaERPVCLTiposUsuariosFiltro.FormShow(Sender: TObject);
begin
  edtTipoUsuarioIDInicial.Text := IntegerStringConverter(pubTipoUsuarioIDInicial, True);
  edtTipoUsuarioIDFinal.Text   := IntegerStringConverter(pubTipoUsuarioIDFinal, True);
  edtCodigoInicial.Text        := pubCodigoInicial;
  edtCodigoFinal.Text          := pubCodigoFinal;
  edtDescricao.Text            := pubDescricao;
  VCLComboBoxPopular(cbxBloqueado, pubBloqueado);
  VCLComboBoxPopular(cbxAtivo,     pubAtivo);
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
// Eventos do componente "descrição".
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
// Evento de click no botão "Limpar".
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.btnLimparClick(Sender: TObject);
begin
  FormularioLimpar;
  edtTipoUsuarioIDInicial.SetFocus;
end;

//
// Evento de click no botão "Confirmar".
//
procedure TPlataformaERPVCLTiposUsuariosFiltro.btnConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
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
