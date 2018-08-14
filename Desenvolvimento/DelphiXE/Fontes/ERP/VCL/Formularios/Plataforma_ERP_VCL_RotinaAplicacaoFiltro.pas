//
// Arquivo..: Plataforma_ERP_VCL_RotinaAplicacaoFiltro.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 14/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com os parâmetros de filtro para a listagem de rotinas da aplicação.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_RotinaAplicacaoFiltro;

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
  TPlataformaERPVCLRotinaAplicacaoFiltro = class(TForm)
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
    lblRotinaAplicacaoID: TLabel;
    lblRotinaAplicacaoIDAte: TLabel;
    edtRotinaAplicacaoIDInicial: TEdit;
    edtRotinaAplicacaoIDFinal: TEdit;
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
    lblChave: TLabel;
    edtChave: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtRotinaAplicacaoIDInicialEnter(Sender: TObject);
    procedure edtRotinaAplicacaoIDInicialExit(Sender: TObject);
    procedure edtRotinaAplicacaoIDInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtRotinaAplicacaoIDFinalEnter(Sender: TObject);
    procedure edtRotinaAplicacaoIDFinalExit(Sender: TObject);
    procedure edtRotinaAplicacaoIDFinalKeyPress(Sender: TObject; var Key: Char);
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
    procedure edtChaveEnter(Sender: TObject);
    procedure edtChaveExit(Sender: TObject);
    procedure edtChaveKeyPress(Sender: TObject; var Key: Char);
  private
    procedure FormularioInicializar;
    procedure FormularioLimpar;
    procedure FormularioLocalizar;
  public
    pubClicouFechar            : Boolean;
    pubCodigoInicial           : string;
    pubCodigoFinal             : string;
    pubDescricao               : string;
    pubChave                   : string;
    pubBloqueado               : string;
    pubAtivo                   : string;
    pubRotinaAplicacaoIDInicial: Integer;
    pubRotinaAplicacaoIDFinal  : Integer;
    pubInsDtHrInicial          : TDateTime;
    pubInsDtHrFinal            : TDateTime;
    pubUpdDtHrInicial          : TDateTime;
    pubUpdDtHrFinal            : TDateTime;    
  end;

var
  PlataformaERPVCLRotinaAplicacaoFiltro: TPlataformaERPVCLRotinaAplicacaoFiltro;

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

  FONTE_NOME: string = 'Plataforma_ERP_VCL_RotinaAplicacaoFiltro';

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas.
  //
  pubClicouFechar             := True;
  pubRotinaAplicacaoIDInicial := 0;
  pubRotinaAplicacaoIDFinal   := 0;
  pubCodigoInicial            := '';
  pubCodigoFinal              := '';
  pubDescricao                := '';
  pubChave                    := '';
  pubBloqueado                := '';
  pubAtivo                    := '';
  pubInsDtHrInicial           := 0;
  pubInsDtHrFinal             := 0;
  pubUpdDtHrInicial           := 0;
  pubUpdDtHrFinal             := 0;

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
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.FormShow(Sender: TObject);
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
  edtChave.Text         := pubChave;
  VCLComboBoxPopular(cbxBloqueado, pubBloqueado);
  VCLComboBoxPopular(cbxAtivo,     pubAtivo);

  edtRotinaAplicacaoIDInicial.Text := IntegerStringConverter(pubRotinaAplicacaoIDInicial, True);
  edtRotinaAplicacaoIDFinal.Text   := IntegerStringConverter(pubRotinaAplicacaoIDFinal,   True);
  medInsDtHrInicial.Text           := DateTimeStringConverter(pubInsDtHrInicial, 'dd/mm/yyyy hh:nn');
  medInsDtHrFinal.Text             := DateTimeStringConverter(pubInsDtHrFinal,   'dd/mm/yyyy hh:nn');
  medUpdDtHrInicial.Text           := DateTimeStringConverter(pubUpdDtHrInicial, 'dd/mm/yyyy hh:nn');
  medUpdDtHrFinal.Text             := DateTimeStringConverter(pubUpdDtHrFinal,   'dd/mm/yyyy hh:nn');
  

  //
  // Foco no componente desejado.
  //
  if pagFormulario.ActivePageIndex = TAB_CADASTRO  then edtCodigoInicial.SetFocus;
  if pagFormulario.ActivePageIndex = TAB_AUDITORIA then edtRotinaAplicacaoIDInicial.SetFocus;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.mniLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.mniLimparClick(Sender: TObject);
begin
  FormularioLimpar;
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "ID inicial" da rotina da aplicação.
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.edtRotinaAplicacaoIDInicialEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtRotinaAplicacaoIDInicial) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.edtRotinaAplicacaoIDInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.edtRotinaAplicacaoIDInicialExit(Sender: TObject);
begin
  if not VCLEditSair(edtRotinaAplicacaoIDInicial) then Exit;
end;

//
// Eventos do componente "ID final" da rotina da aplicação.
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.edtRotinaAplicacaoIDFinalEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtRotinaAplicacaoIDFinal) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.edtRotinaAplicacaoIDFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.edtRotinaAplicacaoIDFinalExit(Sender: TObject);
begin
  if not VCLEditSair(edtRotinaAplicacaoIDFinal) then Exit;
end;

//
// Eventos do componente "código inicial".
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.edtCodigoInicialEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigoInicial) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.edtCodigoInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.edtCodigoInicialExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigoInicial) then Exit;
end;

//
// Eventos do componente "código final".
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.edtCodigoFinalEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigoFinal) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.edtCodigoFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.edtCodigoFinalExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigoFinal) then Exit;
end;

//
// Eventos do componente "descrição".
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.edtDescricaoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtDescricao) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.edtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.edtDescricaoExit(Sender: TObject);
begin
  if not VCLEditSair(edtDescricao) then Exit;
end;

//
// Eventos do componente "chave".
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.edtChaveEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtChave) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.edtChaveKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.edtChaveExit(Sender: TObject);
begin
  if not VCLEditSair(edtChave) then Exit;
end;

//
// Eventos do componente "bloqueado".
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.cbxBloqueadoEnter(Sender: TObject);
begin
  if not VCLComboBoxEntrar(cbxBloqueado) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.cbxBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.cbxBloqueadoExit(Sender: TObject);
begin
  if not VCLComboBoxSair(cbxBloqueado) then Exit;
  if not VCLComboBoxValidar(cbxBloqueado) then Exit;
end;

//
// Eventos do componente "ativo".
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.cbxAtivoEnter(Sender: TObject);
begin
  if not VCLComboBoxEntrar(cbxAtivo) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.cbxAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.cbxAtivoExit(Sender: TObject);
begin
  if not VCLComboBoxSair(cbxAtivo) then Exit;
  if not VCLComboBoxValidar(cbxAtivo) then Exit;
end;

//
// Eventos do componente "data de criação inicial".
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.medInsDtHrInicialEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medInsDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.medInsDtHrInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.medInsDtHrInicialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medInsDtHrInicial);
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.medInsDtHrInicialExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medInsDtHrInicial) then Exit;
  if not VCLMaskEditDataValidar(medInsDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.imgInsDtHrInicialClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medInsDtHrInicial);
end;

//
// Eventos do componente "data de criação final".
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.medInsDtHrFinalEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medInsDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.medInsDtHrFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.medInsDtHrFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medInsDtHrFinal);
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.medInsDtHrFinalExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medInsDtHrFinal) then Exit;
  if not VCLMaskEditDataValidar(medInsDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.imgInsDtHrFinalClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medInsDtHrFinal);
end;

//
// Eventos do componente "data de alteração inicial".
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.medUpdDtHrInicialEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medUpdDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.medUpdDtHrInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.medUpdDtHrInicialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrInicial);
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.medUpdDtHrInicialExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medUpdDtHrInicial) then Exit;
  if not VCLMaskEditDataValidar(medUpdDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.imgUpdDtHrInicialClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrInicial);
end;

//
// Eventos do componente "data de alteração final".
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.medUpdDtHrFinalEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medUpdDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.medUpdDtHrFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.medUpdDtHrFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrFinal);
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.medUpdDtHrFinalExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medUpdDtHrFinal) then Exit;
  if not VCLMaskEditDataValidar(medUpdDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoFiltro.imgUpdDtHrFinalClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrFinal);
end;

//
// Evento de click no botão "localizar".
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no botão "limpar".
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.btnLimparClick(Sender: TObject);
begin
  FormularioLimpar;

  if pagFormulario.ActivePageIndex = TAB_CADASTRO  then edtCodigoInicial.SetFocus;
  if pagFormulario.ActivePageIndex = TAB_AUDITORIA then edtRotinaAplicacaoIDInicial.SetFocus;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para inicializar os componentes do formulário.
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.FormularioInicializar;
begin
  //
  // Controla os componentes conforme permissão de acesso.
  //
  pagFormulario.Pages[TAB_CADASTRO].TabVisible  := Plataforma_ERP_UsuarioRotina('ERP_ROTINA_APLICACAO_FILTRO_CADASTRO');
  pagFormulario.Pages[TAB_AUDITORIA].TabVisible := Plataforma_ERP_UsuarioRotina('ERP_ROTINA_APLICACAO_FILTRO_AUDITORIA');

  //
  // Componentes pré-carregados.
  //
  VCLComboBoxSimNaoPopular(cbxBloqueado, True);
  VCLComboBoxSimNaoPopular(cbxAtivo,     True);
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.FormularioLimpar;
begin
  VCLEditLimpar    (edtCodigoInicial);
  VCLEditLimpar    (edtCodigoFinal);
  VCLEditLimpar    (edtDescricao);
  VCLEditLimpar    (edtChave);
  VCLComboBoxLimpar(cbxBloqueado);
  VCLComboBoxLimpar(cbxAtivo);

  VCLEditLimpar    (edtRotinaAplicacaoIDInicial);
  VCLEditLimpar    (edtRotinaAplicacaoIDFinal);
  VCLMaskEditLimpar(medInsDtHrInicial);
  VCLMaskEditLimpar(medInsDtHrFinal);
  VCLMaskEditLimpar(medUpdDtHrInicial);
  VCLMaskEditLimpar(medUpdDtHrFinal) ;
end;

//
// Procedimento para localizar os dados do filtro.
//
procedure TPlataformaERPVCLRotinaAplicacaoFiltro.FormularioLocalizar;
begin
  pubClicouFechar             := False;
  pubCodigoInicial            := StringTrim(edtCodigoInicial.Text);
  pubCodigoFinal              := StringTrim(edtCodigoFinal.Text);
  pubDescricao                := StringTrim(edtDescricao.Text);
  pubChave                    := StringTrim(edtChave.Text);
  pubBloqueado                := Copy(cbxBloqueado.Text, 1, 1);
  pubAtivo                    := Copy(cbxAtivo.Text, 1, 1);
  pubRotinaAplicacaoIDInicial := StringIntegerConverter(edtRotinaAplicacaoIDInicial.Text);
  pubRotinaAplicacaoIDFinal   := StringIntegerConverter(edtRotinaAplicacaoIDFinal.Text);
  pubInsDtHrInicial           := StringDateTimeConverter(medInsDtHrInicial.Text);
  pubInsDtHrFinal             := StringDateTimeConverter(medInsDtHrFinal.Text);
  pubUpdDtHrInicial           := StringDateTimeConverter(medUpdDtHrInicial.Text);
  pubUpdDtHrFinal             := StringDateTimeConverter(medUpdDtHrFinal.Text);
  Close;
end;

end.

