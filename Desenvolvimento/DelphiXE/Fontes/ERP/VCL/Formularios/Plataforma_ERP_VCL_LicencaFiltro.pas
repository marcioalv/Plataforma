//
// Arquivo..: Plataforma_ERP_VCL_LicencaFiltro.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 17/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com os parâmetros de filtro para a listagem de licenças.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_LicencaFiltro;

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
  TPlataformaERPVCLLicencaFiltro = class(TForm)
    imgFormulario: TImage;
    btnLocalizar: TBitBtn;
    btnFechar: TBitBtn;
    btnLimpar: TBitBtn;
    btnMinimizar: TBitBtn;
    pagFormulario: TPageControl;
    tabCadastro: TTabSheet;
    tabAuditoria: TTabSheet;
    lblCodigo: TLabel;
    lblCodigoAte: TLabel;
    lblDescricao: TLabel;
    edtCodigoInicial: TEdit;
    edtCodigoFinal: TEdit;
    edtDescricao: TEdit;
    lblLicencaID: TLabel;
    lblLicencaIDAte: TLabel;
    edtLicencaIDInicial: TEdit;
    edtLicencaIDFinal: TEdit;
    lblBloqueado: TLabel;
    lblAtivo: TLabel;
    cbxBloqueado: TComboBox;
    cbxAtivo: TComboBox;
    lblInsDtHr: TLabel;
    lblInsDtHrAte: TLabel;
    medInsDtHrInicial: TMaskEdit;
    medInsDtHrFinal: TMaskEdit;
    lblUpdDtHr: TLabel;
    medUpdDtHrInicial: TMaskEdit;
    lblUpdDtHrAte: TLabel;
    medUpdDtHrFinal: TMaskEdit;
    imgInsDtHrInicial: TImage;
    imgUpdDtHrInicial: TImage;
    imgInsDtHrFinal: TImage;
    imgUpdDtHrFinal: TImage;
    imgBackground: TImage;
    mniFormulario: TMainMenu;
    mniFechar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniLimpar: TMenuItem;
    mniLocalizar: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtLicencaIDInicialEnter(Sender: TObject);
    procedure edtLicencaIDInicialExit(Sender: TObject);
    procedure edtLicencaIDInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtLicencaIDFinalEnter(Sender: TObject);
    procedure edtLicencaIDFinalExit(Sender: TObject);
    procedure edtLicencaIDFinalKeyPress(Sender: TObject; var Key: Char);
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
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure medInsDtHrInicialEnter(Sender: TObject);
    procedure medInsDtHrInicialKeyPress(Sender: TObject; var Key: Char);
    procedure medInsDtHrInicialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure medInsDtHrInicialExit(Sender: TObject);
    procedure medInsDtHrFinalEnter(Sender: TObject);
    procedure medInsDtHrFinalExit(Sender: TObject);
    procedure medInsDtHrFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure medInsDtHrFinalKeyPress(Sender: TObject; var Key: Char);
    procedure medUpdDtHrInicialExit(Sender: TObject);
    procedure medUpdDtHrInicialEnter(Sender: TObject);
    procedure medUpdDtHrInicialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure medUpdDtHrInicialKeyPress(Sender: TObject; var Key: Char);
    procedure medUpdDtHrFinalEnter(Sender: TObject);
    procedure medUpdDtHrFinalExit(Sender: TObject);
    procedure medUpdDtHrFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure medUpdDtHrFinalKeyPress(Sender: TObject; var Key: Char);
    procedure imgInsDtHrInicialClick(Sender: TObject);
    procedure imgInsDtHrFinalClick(Sender: TObject);
    procedure imgUpdDtHrInicialClick(Sender: TObject);
    procedure imgUpdDtHrFinalClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
    procedure mniLimparClick(Sender: TObject);
    procedure mniLocalizarClick(Sender: TObject);
  private
    procedure FormularioInicializar;
    procedure FormularioLimpar;
    procedure FormularioLocalizar;
  public
    pubClicouFechar    : Boolean;
    pubCodigoInicial   : string;
    pubCodigoFinal     : string;
    pubDescricao       : string;
    pubBloqueado       : string;
    pubAtivo           : string;
    pubLicencaIDInicial: Integer;
    pubLicencaIDFinal  : Integer;
    pubInsDtHrInicial  : TDateTime;
    pubInsDtHrFinal    : TDateTime;
    pubUpdDtHrInicial  : TDateTime;
    pubUpdDtHrFinal    : TDateTime;    
  end;

var
  PlataformaERPVCLLicencaFiltro: TPlataformaERPVCLLicencaFiltro;

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

  FONTE_NOME: string = 'Plataforma_ERP_VCL_LicencaFiltro';

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLLicencaFiltro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas.
  //
  pubClicouFechar     := True;
  pubLicencaIDInicial := 0;
  pubLicencaIDFinal   := 0;
  pubCodigoInicial    := '';
  pubCodigoFinal      := '';
  pubDescricao        := '';
  pubBloqueado        := '';
  pubAtivo            := '';
  pubInsDtHrInicial   := 0;
  pubInsDtHrFinal     := 0;
  pubUpdDtHrInicial   := 0;
  pubUpdDtHrFinal     := 0;

  //
  // Posiciona o tab padrão.
  //
  VCLPageControlInicializar(pagFormulario);

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
procedure TPlataformaERPVCLLicencaFiltro.FormShow(Sender: TObject);
begin
  //
  // Background do formulário.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Filtros memorizados.
  //
  edtCodigoInicial.Text := pubCodigoInicial;
  edtCodigoFinal.Text   := pubCodigoFinal;
  edtDescricao.Text     := pubDescricao;
  VCLComboBoxPopular(cbxBloqueado, pubBloqueado);
  VCLComboBoxPopular(cbxAtivo,     pubAtivo);

  edtLicencaIDInicial.Text := IntegerStringConverter(pubLicencaIDInicial, True);
  edtLicencaIDFinal.Text   := IntegerStringConverter(pubLicencaIDFinal,   True);
  medInsDtHrInicial.Text   := DateTimeStringConverter(pubInsDtHrInicial, 'dd/mm/yyyy hh:nn');
  medInsDtHrFinal.Text     := DateTimeStringConverter(pubInsDtHrFinal,   'dd/mm/yyyy hh:nn');
  medUpdDtHrInicial.Text   := DateTimeStringConverter(pubUpdDtHrInicial, 'dd/mm/yyyy hh:nn');
  medUpdDtHrFinal.Text     := DateTimeStringConverter(pubUpdDtHrFinal,   'dd/mm/yyyy hh:nn');
  

  //
  // Foco no componente desejado.
  //
  if pagFormulario.ActivePageIndex = TAB_CADASTRO  then edtCodigoInicial.SetFocus;
  if pagFormulario.ActivePageIndex = TAB_AUDITORIA then edtLicencaIDInicial.SetFocus;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLLicencaFiltro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLLicencaFiltro.mniLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

procedure TPlataformaERPVCLLicencaFiltro.mniLimparClick(Sender: TObject);
begin
  FormularioLimpar;
end;

procedure TPlataformaERPVCLLicencaFiltro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLLicencaFiltro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "ID inicial" da licença.
//
procedure TPlataformaERPVCLLicencaFiltro.edtLicencaIDInicialEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtLicencaIDInicial) then Exit;
end;

procedure TPlataformaERPVCLLicencaFiltro.edtLicencaIDInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLLicencaFiltro.edtLicencaIDInicialExit(Sender: TObject);
begin
  if not VCLEditSair(edtLicencaIDInicial) then Exit;
end;

//
// Eventos do componente "ID final" da licença.
//
procedure TPlataformaERPVCLLicencaFiltro.edtLicencaIDFinalEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtLicencaIDFinal) then Exit;
end;

procedure TPlataformaERPVCLLicencaFiltro.edtLicencaIDFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLLicencaFiltro.edtLicencaIDFinalExit(Sender: TObject);
begin
  if not VCLEditSair(edtLicencaIDFinal) then Exit;
end;

//
// Eventos do componente "código inicial".
//
procedure TPlataformaERPVCLLicencaFiltro.edtCodigoInicialEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigoInicial) then Exit;
end;

procedure TPlataformaERPVCLLicencaFiltro.edtCodigoInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLLicencaFiltro.edtCodigoInicialExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigoInicial) then Exit;
end;

//
// Eventos do componente "código final".
//
procedure TPlataformaERPVCLLicencaFiltro.edtCodigoFinalEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigoFinal) then Exit;
end;

procedure TPlataformaERPVCLLicencaFiltro.edtCodigoFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLLicencaFiltro.edtCodigoFinalExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigoFinal) then Exit;
end;

//
// Eventos do componente "descrição".
//
procedure TPlataformaERPVCLLicencaFiltro.edtDescricaoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtDescricao) then Exit;
end;

procedure TPlataformaERPVCLLicencaFiltro.edtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLLicencaFiltro.edtDescricaoExit(Sender: TObject);
begin
  if not VCLEditSair(edtDescricao) then Exit;
end;

//
// Eventos do componente "bloqueado".
//
procedure TPlataformaERPVCLLicencaFiltro.cbxBloqueadoEnter(Sender: TObject);
begin
  if not VCLComboBoxEntrar(cbxBloqueado) then Exit;
end;

procedure TPlataformaERPVCLLicencaFiltro.cbxBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLLicencaFiltro.cbxBloqueadoExit(Sender: TObject);
begin
  if not VCLComboBoxSair(cbxBloqueado) then Exit;
  if not VCLComboBoxValidar(cbxBloqueado) then Exit;
end;

//
// Eventos do componente "ativo".
//
procedure TPlataformaERPVCLLicencaFiltro.cbxAtivoEnter(Sender: TObject);
begin
  if not VCLComboBoxEntrar(cbxAtivo) then Exit;
end;

procedure TPlataformaERPVCLLicencaFiltro.cbxAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLLicencaFiltro.cbxAtivoExit(Sender: TObject);
begin
  if not VCLComboBoxSair(cbxAtivo) then Exit;
  if not VCLComboBoxValidar(cbxAtivo) then Exit;
end;

//
// Eventos do componente "data de criação inicial".
//
procedure TPlataformaERPVCLLicencaFiltro.medInsDtHrInicialEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medInsDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLLicencaFiltro.medInsDtHrInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLLicencaFiltro.medInsDtHrInicialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medInsDtHrInicial);
end;

procedure TPlataformaERPVCLLicencaFiltro.medInsDtHrInicialExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medInsDtHrInicial) then Exit;
  if not VCLMaskEditDataValidar(medInsDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLLicencaFiltro.imgInsDtHrInicialClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medInsDtHrInicial);
end;

//
// Eventos do componente "data de criação final".
//
procedure TPlataformaERPVCLLicencaFiltro.medInsDtHrFinalEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medInsDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLLicencaFiltro.medInsDtHrFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLLicencaFiltro.medInsDtHrFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medInsDtHrFinal);
end;

procedure TPlataformaERPVCLLicencaFiltro.medInsDtHrFinalExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medInsDtHrFinal) then Exit;
  if not VCLMaskEditDataValidar(medInsDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLLicencaFiltro.imgInsDtHrFinalClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medInsDtHrFinal);
end;

//
// Eventos do componente "data de alteração inicial".
//
procedure TPlataformaERPVCLLicencaFiltro.medUpdDtHrInicialEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medUpdDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLLicencaFiltro.medUpdDtHrInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLLicencaFiltro.medUpdDtHrInicialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrInicial);
end;

procedure TPlataformaERPVCLLicencaFiltro.medUpdDtHrInicialExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medUpdDtHrInicial) then Exit;
  if not VCLMaskEditDataValidar(medUpdDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLLicencaFiltro.imgUpdDtHrInicialClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrInicial);
end;

//
// Eventos do componente "data de alteração final".
//
procedure TPlataformaERPVCLLicencaFiltro.medUpdDtHrFinalEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medUpdDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLLicencaFiltro.medUpdDtHrFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLLicencaFiltro.medUpdDtHrFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrFinal);
end;

procedure TPlataformaERPVCLLicencaFiltro.medUpdDtHrFinalExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medUpdDtHrFinal) then Exit;
  if not VCLMaskEditDataValidar(medUpdDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLLicencaFiltro.imgUpdDtHrFinalClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrFinal);
end;

//
// Evento de click no botão "localizar".
//
procedure TPlataformaERPVCLLicencaFiltro.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no botão "limpar".
//
procedure TPlataformaERPVCLLicencaFiltro.btnLimparClick(Sender: TObject);
begin
  FormularioLimpar;

  if pagFormulario.ActivePageIndex = TAB_CADASTRO  then edtCodigoInicial.SetFocus;
  if pagFormulario.ActivePageIndex = TAB_AUDITORIA then edtLicencaIDInicial.SetFocus;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLLicencaFiltro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLLicencaFiltro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para inicializar os componentes do formulário.
//
procedure TPlataformaERPVCLLicencaFiltro.FormularioInicializar;
begin
  //
  // Controla os componentes conforme permissão de acesso.
  //
  pagFormulario.Pages[TAB_CADASTRO].TabVisible  := Plataforma_ERP_UsuarioRotina('ERP_LICENCA_FILTRO_CADASTRO');
  pagFormulario.Pages[TAB_AUDITORIA].TabVisible := Plataforma_ERP_UsuarioRotina('ERP_LICENCA_FILTRO_AUDITORIA');

  //
  // Componentes pré-carregados.
  //
  VCLComboBoxSimNaoPopular(cbxBloqueado, True);
  VCLComboBoxSimNaoPopular(cbxAtivo,     True);
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLLicencaFiltro.FormularioLimpar;
begin
  VCLEditLimpar    (edtCodigoInicial);
  VCLEditLimpar    (edtCodigoFinal);
  VCLEditLimpar    (edtDescricao);
  VCLComboBoxLimpar(cbxBloqueado);
  VCLComboBoxLimpar(cbxAtivo);

  VCLEditLimpar    (edtLicencaIDInicial);
  VCLEditLimpar    (edtLicencaIDFinal);
  VCLMaskEditLimpar(medInsDtHrInicial);
  VCLMaskEditLimpar(medInsDtHrFinal);
  VCLMaskEditLimpar(medUpdDtHrInicial);
  VCLMaskEditLimpar(medUpdDtHrFinal) ;
end;

//
// Procedimento para localizar os dados do filtro.
//
procedure TPlataformaERPVCLLicencaFiltro.FormularioLocalizar;
begin
  pubClicouFechar     := False;
  pubCodigoInicial    := StringTrim(edtCodigoInicial.Text);
  pubCodigoFinal      := StringTrim(edtCodigoFinal.Text);
  pubDescricao        := StringTrim(edtDescricao.Text);
  pubBloqueado        := Copy(cbxBloqueado.Text, 1, 1);
  pubAtivo            := Copy(cbxAtivo.Text, 1, 1);
  pubLicencaIDInicial := StringIntegerConverter(edtLicencaIDInicial.Text);
  pubLicencaIDFinal   := StringIntegerConverter(edtLicencaIDFinal.Text);
  pubInsDtHrInicial   := StringDateTimeConverter(medInsDtHrInicial.Text);
  pubInsDtHrFinal     := StringDateTimeConverter(medInsDtHrFinal.Text);
  pubUpdDtHrInicial   := StringDateTimeConverter(medUpdDtHrInicial.Text);
  pubUpdDtHrFinal     := StringDateTimeConverter(medUpdDtHrFinal.Text);
  Close;
end;

end.

