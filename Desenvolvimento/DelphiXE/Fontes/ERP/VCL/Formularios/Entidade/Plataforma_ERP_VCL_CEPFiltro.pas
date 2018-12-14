//
// Arquivo..: Plataforma_ERP_VCL_CEPFiltro.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 17/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com os parâmetros de filtro para a listagem de CEP's.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_CEPFiltro;

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
  TPlataformaERPVCLCEPFiltro = class(TForm)
    imgFormulario: TImage;
    btnLocalizar: TBitBtn;
    btnFechar: TBitBtn;
    btnLimpar: TBitBtn;
    btnMinimizar: TBitBtn;
    pagFormulario: TPageControl;
    tabCadastro: TTabSheet;
    tabAuditoria: TTabSheet;
    lblCEP: TLabel;
    lblCEPAte: TLabel;
    lblEndereco: TLabel;
    edtCEPInicial: TEdit;
    edtCEPFinal: TEdit;
    edtEndereco: TEdit;
    lblCEPID: TLabel;
    lblCEPIDAte: TLabel;
    edtCEPIDInicial: TEdit;
    edtCEPIDFinal: TEdit;
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
    procedure edtCEPIDInicialEnter(Sender: TObject);
    procedure edtCEPIDInicialExit(Sender: TObject);
    procedure edtCEPIDInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtCEPIDFinalEnter(Sender: TObject);
    procedure edtCEPIDFinalExit(Sender: TObject);
    procedure edtCEPIDFinalKeyPress(Sender: TObject; var Key: Char);
    procedure edtCEPInicialEnter(Sender: TObject);
    procedure edtCEPInicialExit(Sender: TObject);
    procedure edtCEPInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtCEPFinalEnter(Sender: TObject);
    procedure edtCEPFinalExit(Sender: TObject);
    procedure edtCEPFinalKeyPress(Sender: TObject; var Key: Char);
    procedure edtEnderecoEnter(Sender: TObject);
    procedure edtEnderecoExit(Sender: TObject);
    procedure edtEnderecoKeyPress(Sender: TObject; var Key: Char);
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
    pubClicouFechar  : Boolean;
    pubCEPInicial    : string;
    pubCEPFinal      : string;
    pubEndereco      : string;
    pubBloqueado     : string;
    pubAtivo         : string;
    pubCEPIDInicial  : Integer;
    pubCEPIDFinal    : Integer;
    pubInsDtHrInicial: TDateTime;
    pubInsDtHrFinal  : TDateTime;
    pubUpdDtHrInicial: TDateTime;
    pubUpdDtHrFinal  : TDateTime;    
  end;

var
  PlataformaERPVCLCEPFiltro: TPlataformaERPVCLCEPFiltro;

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

  FONTE_NOME: string = 'Plataforma_ERP_VCL_CEPFiltro';

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLCEPFiltro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas.
  //
  pubClicouFechar   := True;
  pubCEPIDInicial   := 0;
  pubCEPIDFinal     := 0;
  pubCEPInicial     := '';
  pubCEPFinal       := '';
  pubEndereco       := '';
  pubBloqueado      := '';
  pubAtivo          := '';
  pubInsDtHrInicial := 0;
  pubInsDtHrFinal   := 0;
  pubUpdDtHrInicial := 0;
  pubUpdDtHrFinal   := 0;

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
procedure TPlataformaERPVCLCEPFiltro.FormShow(Sender: TObject);
begin
  //
  // Background do formulário.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Filtros memorizados.
  //
  edtCEPInicial.Text := pubCEPInicial;
  edtCEPFinal.Text   := pubCEPFinal;
  edtEndereco.Text   := pubEndereco;
  VCLComboBoxPopular(cbxBloqueado, pubBloqueado);
  VCLComboBoxPopular(cbxAtivo,     pubAtivo);

  edtCEPIDInicial.Text   := IntegerStringConverter(pubCEPIDInicial, True);
  edtCEPIDFinal.Text     := IntegerStringConverter(pubCEPIDFinal,   True);
  medInsDtHrInicial.Text := DateTimeStringConverter(pubInsDtHrInicial, 'dd/mm/yyyy hh:nn');
  medInsDtHrFinal.Text   := DateTimeStringConverter(pubInsDtHrFinal,   'dd/mm/yyyy hh:nn');
  medUpdDtHrInicial.Text := DateTimeStringConverter(pubUpdDtHrInicial, 'dd/mm/yyyy hh:nn');
  medUpdDtHrFinal.Text   := DateTimeStringConverter(pubUpdDtHrFinal,   'dd/mm/yyyy hh:nn');
  

  //
  // Foco no componente desejado.
  //
  if pagFormulario.ActivePageIndex = TAB_CADASTRO  then edtCEPInicial.SetFocus;
  if pagFormulario.ActivePageIndex = TAB_AUDITORIA then edtCEPIDInicial.SetFocus;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLCEPFiltro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLCEPFiltro.mniLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

procedure TPlataformaERPVCLCEPFiltro.mniLimparClick(Sender: TObject);
begin
  FormularioLimpar;
end;

procedure TPlataformaERPVCLCEPFiltro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLCEPFiltro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "ID inicial" do CEP.
//
procedure TPlataformaERPVCLCEPFiltro.edtCEPIDInicialEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCEPIDInicial) then Exit;
end;

procedure TPlataformaERPVCLCEPFiltro.edtCEPIDInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLCEPFiltro.edtCEPIDInicialExit(Sender: TObject);
begin
  if not VCLEditSair(edtCEPIDInicial) then Exit;
end;

//
// Eventos do componente "ID final" do CEP.
//
procedure TPlataformaERPVCLCEPFiltro.edtCEPIDFinalEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCEPIDFinal) then Exit;
end;

procedure TPlataformaERPVCLCEPFiltro.edtCEPIDFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLCEPFiltro.edtCEPIDFinalExit(Sender: TObject);
begin
  if not VCLEditSair(edtCEPIDFinal) then Exit;
end;

//
// Eventos do componente "CEP inicial".
//
procedure TPlataformaERPVCLCEPFiltro.edtCEPInicialEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCEPInicial) then Exit;
end;

procedure TPlataformaERPVCLCEPFiltro.edtCEPInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLCEPFiltro.edtCEPInicialExit(Sender: TObject);
begin
  if not VCLEditSair(edtCEPInicial) then Exit;
end;

//
// Eventos do componente "CEP final".
//
procedure TPlataformaERPVCLCEPFiltro.edtCEPFinalEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCEPFinal) then Exit;
end;

procedure TPlataformaERPVCLCEPFiltro.edtCEPFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLCEPFiltro.edtCEPFinalExit(Sender: TObject);
begin
  if not VCLEditSair(edtCEPFinal) then Exit;
end;

//
// Eventos do componente "endereço".
//
procedure TPlataformaERPVCLCEPFiltro.edtEnderecoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtEndereco) then Exit;
end;

procedure TPlataformaERPVCLCEPFiltro.edtEnderecoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLCEPFiltro.edtEnderecoExit(Sender: TObject);
begin
  if not VCLEditSair(edtEndereco) then Exit;
end;

//
// Eventos do componente "bloqueado".
//
procedure TPlataformaERPVCLCEPFiltro.cbxBloqueadoEnter(Sender: TObject);
begin
  if not VCLComboBoxEntrar(cbxBloqueado) then Exit;
end;

procedure TPlataformaERPVCLCEPFiltro.cbxBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLCEPFiltro.cbxBloqueadoExit(Sender: TObject);
begin
  if not VCLComboBoxSair(cbxBloqueado) then Exit;
  if not VCLComboBoxValidar(cbxBloqueado) then Exit;
end;

//
// Eventos do componente "ativo".
//
procedure TPlataformaERPVCLCEPFiltro.cbxAtivoEnter(Sender: TObject);
begin
  if not VCLComboBoxEntrar(cbxAtivo) then Exit;
end;

procedure TPlataformaERPVCLCEPFiltro.cbxAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLCEPFiltro.cbxAtivoExit(Sender: TObject);
begin
  if not VCLComboBoxSair(cbxAtivo) then Exit;
  if not VCLComboBoxValidar(cbxAtivo) then Exit;
end;

//
// Eventos do componente "data de criação inicial".
//
procedure TPlataformaERPVCLCEPFiltro.medInsDtHrInicialEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medInsDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLCEPFiltro.medInsDtHrInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLCEPFiltro.medInsDtHrInicialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medInsDtHrInicial);
end;

procedure TPlataformaERPVCLCEPFiltro.medInsDtHrInicialExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medInsDtHrInicial) then Exit;
  if not VCLMaskEditDataValidar(medInsDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLCEPFiltro.imgInsDtHrInicialClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medInsDtHrInicial);
end;

//
// Eventos do componente "data de criação final".
//
procedure TPlataformaERPVCLCEPFiltro.medInsDtHrFinalEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medInsDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLCEPFiltro.medInsDtHrFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLCEPFiltro.medInsDtHrFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medInsDtHrFinal);
end;

procedure TPlataformaERPVCLCEPFiltro.medInsDtHrFinalExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medInsDtHrFinal) then Exit;
  if not VCLMaskEditDataValidar(medInsDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLCEPFiltro.imgInsDtHrFinalClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medInsDtHrFinal);
end;

//
// Eventos do componente "data de alteração inicial".
//
procedure TPlataformaERPVCLCEPFiltro.medUpdDtHrInicialEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medUpdDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLCEPFiltro.medUpdDtHrInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLCEPFiltro.medUpdDtHrInicialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrInicial);
end;

procedure TPlataformaERPVCLCEPFiltro.medUpdDtHrInicialExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medUpdDtHrInicial) then Exit;
  if not VCLMaskEditDataValidar(medUpdDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLCEPFiltro.imgUpdDtHrInicialClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrInicial);
end;

//
// Eventos do componente "data de alteração final".
//
procedure TPlataformaERPVCLCEPFiltro.medUpdDtHrFinalEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medUpdDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLCEPFiltro.medUpdDtHrFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLCEPFiltro.medUpdDtHrFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrFinal);
end;

procedure TPlataformaERPVCLCEPFiltro.medUpdDtHrFinalExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medUpdDtHrFinal) then Exit;
  if not VCLMaskEditDataValidar(medUpdDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLCEPFiltro.imgUpdDtHrFinalClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrFinal);
end;

//
// Evento de click no botão "localizar".
//
procedure TPlataformaERPVCLCEPFiltro.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no botão "limpar".
//
procedure TPlataformaERPVCLCEPFiltro.btnLimparClick(Sender: TObject);
begin
  FormularioLimpar;

  if pagFormulario.ActivePageIndex = TAB_CADASTRO  then edtCEPInicial.SetFocus;
  if pagFormulario.ActivePageIndex = TAB_AUDITORIA then edtCEPIDInicial.SetFocus;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLCEPFiltro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLCEPFiltro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para inicializar os componentes do formulário.
//
procedure TPlataformaERPVCLCEPFiltro.FormularioInicializar;
begin
  //
  // Controla os componentes conforme permissão de acesso.
  //
  pagFormulario.Pages[TAB_CADASTRO].TabVisible  := Plataforma_ERP_UsuarioRotina('ERP_CEP_FILTRO_CADASTRO');
  pagFormulario.Pages[TAB_AUDITORIA].TabVisible := Plataforma_ERP_UsuarioRotina('ERP_CEP_FILTRO_AUDITORIA');

  //
  // Componentes pré-carregados.
  //
  VCLComboBoxSimNaoPopular(cbxBloqueado, True);
  VCLComboBoxSimNaoPopular(cbxAtivo,     True);
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLCEPFiltro.FormularioLimpar;
begin
  VCLEditLimpar    (edtCEPInicial);
  VCLEditLimpar    (edtCEPFinal);
  VCLEditLimpar    (edtEndereco);
  VCLComboBoxLimpar(cbxBloqueado);
  VCLComboBoxLimpar(cbxAtivo);

  VCLEditLimpar    (edtCEPIDInicial);
  VCLEditLimpar    (edtCEPIDFinal);
  VCLMaskEditLimpar(medInsDtHrInicial);
  VCLMaskEditLimpar(medInsDtHrFinal);
  VCLMaskEditLimpar(medUpdDtHrInicial);
  VCLMaskEditLimpar(medUpdDtHrFinal) ;
end;

//
// Procedimento para localizar os dados do filtro.
//
procedure TPlataformaERPVCLCEPFiltro.FormularioLocalizar;
begin
  pubClicouFechar   := False;
  pubCEPInicial     := StringTrim(edtCEPInicial.Text);
  pubCEPFinal       := StringTrim(edtCEPFinal.Text);
  pubEndereco       := StringTrim(edtEndereco.Text);
  pubBloqueado      := Copy(cbxBloqueado.Text, 1, 1);
  pubAtivo          := Copy(cbxAtivo.Text, 1, 1);
  pubCEPIDInicial   := StringIntegerConverter(edtCEPIDInicial.Text);
  pubCEPIDFinal     := StringIntegerConverter(edtCEPIDFinal.Text);
  pubInsDtHrInicial := StringDateTimeConverter(medInsDtHrInicial.Text);
  pubInsDtHrFinal   := StringDateTimeConverter(medInsDtHrFinal.Text);
  pubUpdDtHrInicial := StringDateTimeConverter(medUpdDtHrInicial.Text);
  pubUpdDtHrFinal   := StringDateTimeConverter(medUpdDtHrFinal.Text);
  Close;
end;

end.

