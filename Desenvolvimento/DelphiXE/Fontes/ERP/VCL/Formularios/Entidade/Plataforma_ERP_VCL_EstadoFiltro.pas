//
// Arquivo..: Plataforma_ERP_VCL_EstadoFiltro.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 17/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com os parâmetros de filtro para a listagem de estados.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_EstadoFiltro;

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
  TPlataformaERPVCLEstadoFiltro = class(TForm)
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
    lblNome: TLabel;
    edtCodigoInicial: TEdit;
    edtCodigoFinal: TEdit;
    edtNome: TEdit;
    lblEstadoID: TLabel;
    lblEstadoIDAte: TLabel;
    edtEstadoIDInicial: TEdit;
    edtEstadoIDFinal: TEdit;
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
    lblPais: TLabel;
    imgPaisSelecionar: TImage;
    edtPaisCodigo: TEdit;
    edtPaisNome: TEdit;
    edtPaisID: TEdit;
    lblSigla: TLabel;
    edtSigla: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtEstadoIDInicialEnter(Sender: TObject);
    procedure edtEstadoIDInicialExit(Sender: TObject);
    procedure edtEstadoIDInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtEstadoIDFinalEnter(Sender: TObject);
    procedure edtEstadoIDFinalExit(Sender: TObject);
    procedure edtEstadoIDFinalKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoInicialEnter(Sender: TObject);
    procedure edtCodigoInicialExit(Sender: TObject);
    procedure edtCodigoInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoFinalEnter(Sender: TObject);
    procedure edtCodigoFinalExit(Sender: TObject);
    procedure edtCodigoFinalKeyPress(Sender: TObject; var Key: Char);
    procedure edtNomeEnter(Sender: TObject);
    procedure edtNomeExit(Sender: TObject);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
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
    procedure edtPaisCodigoEnter(Sender: TObject);
    procedure edtPaisCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtPaisCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure imgPaisSelecionarClick(Sender: TObject);
    procedure edtPaisCodigoExit(Sender: TObject);
    procedure edtPaisNomeClick(Sender: TObject);
    procedure edtSiglaEnter(Sender: TObject);
    procedure edtSiglaExit(Sender: TObject);
    procedure edtSiglaKeyPress(Sender: TObject; var Key: Char);
  private
    procedure FormularioInicializar;
    procedure FormularioLimpar;
    procedure FormularioLocalizar;
  public
    pubClicouFechar   : Boolean;
    pubCodigoInicial  : string;
    pubCodigoFinal    : string;
    pubNome           : string;
    pubSigla          : string;
    pubPaisID         : Integer;
    pubPaisCodigo     : string;
    pubPaisNome       : string;
    pubBloqueado      : string;
    pubAtivo          : string;
    pubEstadoIDInicial: Integer;
    pubEstadoIDFinal  : Integer;
    pubInsDtHrInicial : TDateTime;
    pubInsDtHrFinal   : TDateTime;
    pubUpdDtHrInicial : TDateTime;
    pubUpdDtHrFinal   : TDateTime;    
  end;

var
  PlataformaERPVCLEstadoFiltro: TPlataformaERPVCLEstadoFiltro;

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

  FONTE_NOME: string = 'Plataforma_ERP_VCL_EstadoFiltro';

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLEstadoFiltro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas.
  //
  pubClicouFechar    := True;
  pubEstadoIDInicial := 0;
  pubEstadoIDFinal   := 0;
  pubCodigoInicial   := '';
  pubCodigoFinal     := '';
  pubNome            := '';
  pubSigla           := '';
  pubPaisID          := 0;
  pubPaisCodigo      := '';
  pubPaisNome        := '';
  pubBloqueado       := '';
  pubAtivo           := '';
  pubInsDtHrInicial  := 0;
  pubInsDtHrFinal    := 0;
  pubUpdDtHrInicial  := 0;
  pubUpdDtHrFinal    := 0;

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
procedure TPlataformaERPVCLEstadoFiltro.FormShow(Sender: TObject);
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
  edtNome.Text          := pubNome;
  edtSigla.Text         := pubSigla;

  edtPaisID.Text     := IntegerStringConverter(pubPaisID);
  edtPaisCodigo.Text := pubPaisCodigo;
  edtPaisNome.Text   := pubPaisNome;
  
  VCLComboBoxPopular(cbxBloqueado, pubBloqueado);
  VCLComboBoxPopular(cbxAtivo,     pubAtivo);

  edtEstadoIDInicial.Text := IntegerStringConverter(pubEstadoIDInicial, True);
  edtEstadoIDFinal.Text   := IntegerStringConverter(pubEstadoIDFinal,   True);
  medInsDtHrInicial.Text  := DateTimeStringConverter(pubInsDtHrInicial, 'dd/mm/yyyy hh:nn');
  medInsDtHrFinal.Text    := DateTimeStringConverter(pubInsDtHrFinal,   'dd/mm/yyyy hh:nn');
  medUpdDtHrInicial.Text  := DateTimeStringConverter(pubUpdDtHrInicial, 'dd/mm/yyyy hh:nn');
  medUpdDtHrFinal.Text    := DateTimeStringConverter(pubUpdDtHrFinal,   'dd/mm/yyyy hh:nn');

  //
  // Controla os componentes de exibição de cadastro.
  //
  VCLEditClickControlar(edtPaisNome, True);  
  
  //
  // Foco no componente desejado.
  //
  if pagFormulario.ActivePageIndex = TAB_CADASTRO  then edtCodigoInicial.SetFocus;
  if pagFormulario.ActivePageIndex = TAB_AUDITORIA then edtEstadoIDInicial.SetFocus;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLEstadoFiltro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLEstadoFiltro.mniLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

procedure TPlataformaERPVCLEstadoFiltro.mniLimparClick(Sender: TObject);
begin
  FormularioLimpar;
end;

procedure TPlataformaERPVCLEstadoFiltro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLEstadoFiltro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "ID inicial" do estado.
//
procedure TPlataformaERPVCLEstadoFiltro.edtEstadoIDInicialEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtEstadoIDInicial) then Exit;
end;

procedure TPlataformaERPVCLEstadoFiltro.edtEstadoIDInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLEstadoFiltro.edtEstadoIDInicialExit(Sender: TObject);
begin
  if not VCLEditSair(edtEstadoIDInicial) then Exit;
end;

//
// Eventos do componente "ID final" do estado.
//
procedure TPlataformaERPVCLEstadoFiltro.edtEstadoIDFinalEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtEstadoIDFinal) then Exit;
end;

procedure TPlataformaERPVCLEstadoFiltro.edtEstadoIDFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLEstadoFiltro.edtEstadoIDFinalExit(Sender: TObject);
begin
  if not VCLEditSair(edtEstadoIDFinal) then Exit;
end;

//
// Eventos do componente "código inicial".
//
procedure TPlataformaERPVCLEstadoFiltro.edtCodigoInicialEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigoInicial) then Exit;
end;

procedure TPlataformaERPVCLEstadoFiltro.edtCodigoInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLEstadoFiltro.edtCodigoInicialExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigoInicial) then Exit;
end;

//
// Eventos do componente "código final".
//
procedure TPlataformaERPVCLEstadoFiltro.edtCodigoFinalEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigoFinal) then Exit;
end;

procedure TPlataformaERPVCLEstadoFiltro.edtCodigoFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLEstadoFiltro.edtCodigoFinalExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigoFinal) then Exit;
end;

//
// Eventos do componente "nome".
//
procedure TPlataformaERPVCLEstadoFiltro.edtNomeEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtNome) then Exit;
end;

procedure TPlataformaERPVCLEstadoFiltro.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLEstadoFiltro.edtNomeExit(Sender: TObject);
begin
  if not VCLEditSair(edtNome) then Exit;
end;

//
// Eventos do componente "sigla".
//
procedure TPlataformaERPVCLEstadoFiltro.edtSiglaEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtSigla) then Exit;
end;

procedure TPlataformaERPVCLEstadoFiltro.edtSiglaKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLEstadoFiltro.edtSiglaExit(Sender: TObject);
begin
  if not VCLEditSair(edtSigla) then Exit;
end;

//
// Eventos do componente "país".
//
procedure TPlataformaERPVCLEstadoFiltro.edtPaisCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtPaisCodigo) then Exit;
end;

procedure TPlataformaERPVCLEstadoFiltro.edtPaisCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLEstadoFiltro.edtPaisCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then imgPaisSelecionarClick(Sender);
end;

procedure TPlataformaERPVCLEstadoFiltro.edtPaisCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtPaisCodigo) then Exit;

  if not Plataforma_ERP_VCL_PaisValidar(False,
                                        edtPaisID,
                                        edtPaisCodigo,
                                        edtPaisNome) then Exit;
end;

procedure TPlataformaERPVCLEstadoFiltro.imgPaisSelecionarClick(Sender: TObject);
begin
  if not Plataforma_ERP_VCL_PaisSelecionar(edtPaisID, edtPaisCodigo, edtPaisNome) then Exit;
end;

procedure TPlataformaERPVCLEstadoFiltro.edtPaisNomeClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_PaisExibir(StringIntegerConverter(edtPaisID.Text));
end;

//
// Eventos do componente "bloqueado".
//
procedure TPlataformaERPVCLEstadoFiltro.cbxBloqueadoEnter(Sender: TObject);
begin
  if not VCLComboBoxEntrar(cbxBloqueado) then Exit;
end;

procedure TPlataformaERPVCLEstadoFiltro.cbxBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLEstadoFiltro.cbxBloqueadoExit(Sender: TObject);
begin
  if not VCLComboBoxSair(cbxBloqueado) then Exit;
  if not VCLComboBoxValidar(cbxBloqueado) then Exit;
end;

//
// Eventos do componente "ativo".
//
procedure TPlataformaERPVCLEstadoFiltro.cbxAtivoEnter(Sender: TObject);
begin
  if not VCLComboBoxEntrar(cbxAtivo) then Exit;
end;

procedure TPlataformaERPVCLEstadoFiltro.cbxAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLEstadoFiltro.cbxAtivoExit(Sender: TObject);
begin
  if not VCLComboBoxSair(cbxAtivo) then Exit;
  if not VCLComboBoxValidar(cbxAtivo) then Exit;
end;

//
// Eventos do componente "data de criação inicial".
//
procedure TPlataformaERPVCLEstadoFiltro.medInsDtHrInicialEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medInsDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLEstadoFiltro.medInsDtHrInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLEstadoFiltro.medInsDtHrInicialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medInsDtHrInicial);
end;

procedure TPlataformaERPVCLEstadoFiltro.medInsDtHrInicialExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medInsDtHrInicial) then Exit;
  if not VCLMaskEditDataValidar(medInsDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLEstadoFiltro.imgInsDtHrInicialClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medInsDtHrInicial);
end;

//
// Eventos do componente "data de criação final".
//
procedure TPlataformaERPVCLEstadoFiltro.medInsDtHrFinalEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medInsDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLEstadoFiltro.medInsDtHrFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLEstadoFiltro.medInsDtHrFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medInsDtHrFinal);
end;

procedure TPlataformaERPVCLEstadoFiltro.medInsDtHrFinalExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medInsDtHrFinal) then Exit;
  if not VCLMaskEditDataValidar(medInsDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLEstadoFiltro.imgInsDtHrFinalClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medInsDtHrFinal);
end;

//
// Eventos do componente "data de alteração inicial".
//
procedure TPlataformaERPVCLEstadoFiltro.medUpdDtHrInicialEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medUpdDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLEstadoFiltro.medUpdDtHrInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLEstadoFiltro.medUpdDtHrInicialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrInicial);
end;

procedure TPlataformaERPVCLEstadoFiltro.medUpdDtHrInicialExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medUpdDtHrInicial) then Exit;
  if not VCLMaskEditDataValidar(medUpdDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLEstadoFiltro.imgUpdDtHrInicialClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrInicial);
end;

//
// Eventos do componente "data de alteração final".
//
procedure TPlataformaERPVCLEstadoFiltro.medUpdDtHrFinalEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medUpdDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLEstadoFiltro.medUpdDtHrFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLEstadoFiltro.medUpdDtHrFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrFinal);
end;

procedure TPlataformaERPVCLEstadoFiltro.medUpdDtHrFinalExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medUpdDtHrFinal) then Exit;
  if not VCLMaskEditDataValidar(medUpdDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLEstadoFiltro.imgUpdDtHrFinalClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrFinal);
end;

//
// Evento de click no botão "localizar".
//
procedure TPlataformaERPVCLEstadoFiltro.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no botão "limpar".
//
procedure TPlataformaERPVCLEstadoFiltro.btnLimparClick(Sender: TObject);
begin
  FormularioLimpar;

  if pagFormulario.ActivePageIndex = TAB_CADASTRO  then edtCodigoInicial.SetFocus;
  if pagFormulario.ActivePageIndex = TAB_AUDITORIA then edtEstadoIDInicial.SetFocus;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLEstadoFiltro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLEstadoFiltro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para inicializar os componentes do formulário.
//
procedure TPlataformaERPVCLEstadoFiltro.FormularioInicializar;
begin
  //
  // Controla os componentes conforme permissão de acesso.
  //
  pagFormulario.Pages[TAB_CADASTRO].TabVisible  := Plataforma_ERP_UsuarioRotina('ERP_ESTADO_FILTRO_CADASTRO');
  pagFormulario.Pages[TAB_AUDITORIA].TabVisible := Plataforma_ERP_UsuarioRotina('ERP_ESTADO_FILTRO_AUDITORIA');

  //
  // Componentes pré-carregados.
  //
  VCLComboBoxSimNaoPopular(cbxBloqueado, True);
  VCLComboBoxSimNaoPopular(cbxAtivo,     True);
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLEstadoFiltro.FormularioLimpar;
begin
  VCLEditLimpar(edtCodigoInicial);
  VCLEditLimpar(edtCodigoFinal);
  VCLEditLimpar(edtNome);
  VCLEditLimpar(edtSigla);

  VCLEditLimpar(edtPaisID);
  VCLEditLimpar(edtPaisCodigo);
  VCLEditLimpar(edtPaisNome);
  
  VCLComboBoxLimpar(cbxBloqueado);
  VCLComboBoxLimpar(cbxAtivo);

  VCLEditLimpar    (edtEstadoIDInicial);
  VCLEditLimpar    (edtEstadoIDFinal);
  VCLMaskEditLimpar(medInsDtHrInicial);
  VCLMaskEditLimpar(medInsDtHrFinal);
  VCLMaskEditLimpar(medUpdDtHrInicial);
  VCLMaskEditLimpar(medUpdDtHrFinal);
end;

//
// Procedimento para localizar os dados do filtro.
//
procedure TPlataformaERPVCLEstadoFiltro.FormularioLocalizar;
begin
  pubClicouFechar    := False;
  pubCodigoInicial   := StringTrim(edtCodigoInicial.Text);
  pubCodigoFinal     := StringTrim(edtCodigoFinal.Text);
  pubNome            := StringTrim(edtNome.Text);
  pubSigla           := StringTrim(edtSigla.Text);
  pubPaisID          := StringIntegerConverter(edtPaisID.Text);
  pubPaisCodigo      := StringTrim(edtPaisCodigo.Text);
  pubPaisNome        := StringTrim(edtPaisNome.Text);
  pubBloqueado       := Copy(cbxBloqueado.Text, 1, 1);
  pubAtivo           := Copy(cbxAtivo.Text, 1, 1);
  pubEstadoIDInicial := StringIntegerConverter(edtEstadoIDInicial.Text);
  pubEstadoIDFinal   := StringIntegerConverter(edtEstadoIDFinal.Text);
  pubInsDtHrInicial  := StringDateTimeConverter(medInsDtHrInicial.Text);
  pubInsDtHrFinal    := StringDateTimeConverter(medInsDtHrFinal.Text);
  pubUpdDtHrInicial  := StringDateTimeConverter(medUpdDtHrInicial.Text);
  pubUpdDtHrFinal    := StringDateTimeConverter(medUpdDtHrFinal.Text);
  Close;
end;

end.

