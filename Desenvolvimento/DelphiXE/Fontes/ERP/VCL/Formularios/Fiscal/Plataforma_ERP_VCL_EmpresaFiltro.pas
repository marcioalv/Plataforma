//
// Arquivo..: Plataforma_ERP_VCL_EmpresaFiltro.pas
// Projeto..: ERP                                                         
// Fonte....: Formul�rio VCL
// Cria��o..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com os par�metros de filtro para a listagem de empresas.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_EmpresaFiltro;

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
  TPlataformaERPVCLEmpresaFiltro = class(TForm)
    imgFormulario: TImage;
    pagFormulario: TPageControl;
    tabCadastro: TTabSheet;
    tabAuditoria: TTabSheet;
    lblCodigo: TLabel;
    lblCodigoAte: TLabel;
    lblDescricao: TLabel;
    edtCodigoInicial: TEdit;
    edtCodigoFinal: TEdit;
    edtNome: TEdit;
    lblEmpresaID: TLabel;
    lblEmpresaIDAte: TLabel;
    edtEmpresaIDInicial: TEdit;
    edtEmpresaIDFinal: TEdit;
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
    btnLocalizar: TBitBtn;
    btnFechar: TBitBtn;
    btnLimpar: TBitBtn;
    btnMinimizar: TBitBtn;
    mniFormulario: TMainMenu;
    mniFechar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniLimpar: TMenuItem;
    mniLocalizar: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtEmpresaIDInicialEnter(Sender: TObject);
    procedure edtEmpresaIDInicialExit(Sender: TObject);
    procedure edtEmpresaIDInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtEmpresaIDFinalEnter(Sender: TObject);
    procedure edtEmpresaIDFinalExit(Sender: TObject);
    procedure edtEmpresaIDFinalKeyPress(Sender: TObject; var Key: Char);
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
  private
    procedure FormularioInicializar;
    procedure FormularioLimpar;
    procedure FormularioLocalizar;
  public
    pubClicouFechar    : Boolean;
    pubCodigoInicial   : string;
    pubCodigoFinal     : string;
    pubNome            : string;
    pubBloqueado       : string;
    pubAtivo           : string;
    pubEmpresaIDInicial: Integer;
    pubEmpresaIDFinal  : Integer;
    pubInsDtHrInicial  : TDateTime;
    pubInsDtHrFinal    : TDateTime;
    pubUpdDtHrInicial  : TDateTime;
    pubUpdDtHrFinal    : TDateTime;    
  end;

var
  PlataformaERPVCLEmpresaFiltro: TPlataformaERPVCLEmpresaFiltro;

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

  FONTE_NOME: string = 'Plataforma_ERP_VCL_EmpresaFiltro';

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLEmpresaFiltro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas.
  //
  pubClicouFechar     := True;
  pubEmpresaIDInicial := 0;
  pubEmpresaIDFinal   := 0;
  pubCodigoInicial    := '';
  pubCodigoFinal      := '';
  pubNome             := '';
  pubBloqueado        := '';
  pubAtivo            := '';
  pubInsDtHrInicial   := 0;
  pubInsDtHrFinal     := 0;
  pubUpdDtHrInicial   := 0;
  pubUpdDtHrFinal     := 0;

  //
  // Posiciona o tab padr�o.
  //
  VCLPageControlInicializar(pagFormulario);

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
procedure TPlataformaERPVCLEmpresaFiltro.FormShow(Sender: TObject);
begin
  //
  // Background do formul�rio.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Filtros memorizados.
  //
  edtCodigoInicial.Text    := pubCodigoInicial;
  edtCodigoFinal.Text      := pubCodigoFinal;
  edtNome.Text             := pubNome;
  VCLComboBoxPopular(cbxBloqueado, pubBloqueado);
  VCLComboBoxPopular(cbxAtivo,     pubAtivo);
  edtEmpresaIDInicial.Text := IntegerStringConverter(pubEmpresaIDInicial, True);
  edtEmpresaIDFinal.Text   := IntegerStringConverter(pubEmpresaIDFinal,   True);
  medInsDtHrInicial.Text   := DateTimeStringConverter(pubInsDtHrInicial, 'dd/mm/yyyy hh:nn');
  medInsDtHrFinal.Text     := DateTimeStringConverter(pubInsDtHrFinal,   'dd/mm/yyyy hh:nn');
  medUpdDtHrInicial.Text   := DateTimeStringConverter(pubUpdDtHrInicial, 'dd/mm/yyyy hh:nn');
  medUpdDtHrFinal.Text     := DateTimeStringConverter(pubUpdDtHrFinal,   'dd/mm/yyyy hh:nn');
  

  //
  // Foco no componente desejado.
  //
  if pagFormulario.ActivePageIndex = TAB_CADASTRO  then edtCodigoInicial.SetFocus;
  if pagFormulario.ActivePageIndex = TAB_AUDITORIA then edtEmpresaIDInicial.SetFocus;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLEmpresaFiltro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLEmpresaFiltro.mniLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

procedure TPlataformaERPVCLEmpresaFiltro.mniLimparClick(Sender: TObject);
begin
  FormularioLimpar;
end;

procedure TPlataformaERPVCLEmpresaFiltro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLEmpresaFiltro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "ID inicial" da empresa.
//
procedure TPlataformaERPVCLEmpresaFiltro.edtEmpresaIDInicialEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtEmpresaIDInicial) then Exit;
end;

procedure TPlataformaERPVCLEmpresaFiltro.edtEmpresaIDInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLEmpresaFiltro.edtEmpresaIDInicialExit(Sender: TObject);
begin
  if not VCLEditSair(edtEmpresaIDInicial) then Exit;
end;

//
// Eventos do componente "ID final" da empresa.
//
procedure TPlataformaERPVCLEmpresaFiltro.edtEmpresaIDFinalEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtEmpresaIDFinal) then Exit;
end;

procedure TPlataformaERPVCLEmpresaFiltro.edtEmpresaIDFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLEmpresaFiltro.edtEmpresaIDFinalExit(Sender: TObject);
begin
  if not VCLEditSair(edtEmpresaIDFinal) then Exit;
end;

//
// Eventos do componente "c�digo inicial".
//
procedure TPlataformaERPVCLEmpresaFiltro.edtCodigoInicialEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigoInicial) then Exit;
end;

procedure TPlataformaERPVCLEmpresaFiltro.edtCodigoInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLEmpresaFiltro.edtCodigoInicialExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigoInicial) then Exit;
end;

//
// Eventos do componente "c�digo final".
//
procedure TPlataformaERPVCLEmpresaFiltro.edtCodigoFinalEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigoFinal) then Exit;
end;

procedure TPlataformaERPVCLEmpresaFiltro.edtCodigoFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLEmpresaFiltro.edtCodigoFinalExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigoFinal) then Exit;
end;

//
// Eventos do componente "nome".
//
procedure TPlataformaERPVCLEmpresaFiltro.edtNomeEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtNome) then Exit;
end;

procedure TPlataformaERPVCLEmpresaFiltro.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLEmpresaFiltro.edtNomeExit(Sender: TObject);
begin
  if not VCLEditSair(edtNome) then Exit;
end;

//
// Eventos do componente "bloqueado".
//
procedure TPlataformaERPVCLEmpresaFiltro.cbxBloqueadoEnter(Sender: TObject);
begin
  if not VCLComboBoxEntrar(cbxBloqueado) then Exit;
end;

procedure TPlataformaERPVCLEmpresaFiltro.cbxBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLEmpresaFiltro.cbxBloqueadoExit(Sender: TObject);
begin
  if not VCLComboBoxSair(cbxBloqueado) then Exit;
  if not VCLComboBoxValidar(cbxBloqueado) then Exit;
end;

//
// Eventos do componente "ativo".
//
procedure TPlataformaERPVCLEmpresaFiltro.cbxAtivoEnter(Sender: TObject);
begin
  if not VCLComboBoxEntrar(cbxAtivo) then Exit;
end;

procedure TPlataformaERPVCLEmpresaFiltro.cbxAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLEmpresaFiltro.cbxAtivoExit(Sender: TObject);
begin
  if not VCLComboBoxSair(cbxAtivo) then Exit;
  if not VCLComboBoxValidar(cbxAtivo) then Exit;
end;

//
// Eventos do componente "data de cria��o inicial".
//
procedure TPlataformaERPVCLEmpresaFiltro.medInsDtHrInicialEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medInsDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLEmpresaFiltro.medInsDtHrInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLEmpresaFiltro.medInsDtHrInicialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medInsDtHrInicial);
end;

procedure TPlataformaERPVCLEmpresaFiltro.medInsDtHrInicialExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medInsDtHrInicial) then Exit;
  if not VCLMaskEditDataValidar(medInsDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLEmpresaFiltro.imgInsDtHrInicialClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medInsDtHrInicial);
end;

//
// Eventos do componente "data de cria��o final".
//
procedure TPlataformaERPVCLEmpresaFiltro.medInsDtHrFinalEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medInsDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLEmpresaFiltro.medInsDtHrFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLEmpresaFiltro.medInsDtHrFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medInsDtHrFinal);
end;

procedure TPlataformaERPVCLEmpresaFiltro.medInsDtHrFinalExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medInsDtHrFinal) then Exit;
  if not VCLMaskEditDataValidar(medInsDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLEmpresaFiltro.imgInsDtHrFinalClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medInsDtHrFinal);
end;

//
// Eventos do componente "data de altera��o inicial".
//
procedure TPlataformaERPVCLEmpresaFiltro.medUpdDtHrInicialEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medUpdDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLEmpresaFiltro.medUpdDtHrInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLEmpresaFiltro.medUpdDtHrInicialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrInicial);
end;

procedure TPlataformaERPVCLEmpresaFiltro.medUpdDtHrInicialExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medUpdDtHrInicial) then Exit;
  if not VCLMaskEditDataValidar(medUpdDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLEmpresaFiltro.imgUpdDtHrInicialClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrInicial);
end;

//
// Eventos do componente "data de altera��o final".
//
procedure TPlataformaERPVCLEmpresaFiltro.medUpdDtHrFinalEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medUpdDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLEmpresaFiltro.medUpdDtHrFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLEmpresaFiltro.medUpdDtHrFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrFinal);
end;

procedure TPlataformaERPVCLEmpresaFiltro.medUpdDtHrFinalExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medUpdDtHrFinal) then Exit;
  if not VCLMaskEditDataValidar(medUpdDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLEmpresaFiltro.imgUpdDtHrFinalClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrFinal);
end;

//
// Evento de click no bot�o "localizar".
//
procedure TPlataformaERPVCLEmpresaFiltro.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no bot�o "limpar".
//
procedure TPlataformaERPVCLEmpresaFiltro.btnLimparClick(Sender: TObject);
begin
  FormularioLimpar;

  if pagFormulario.ActivePageIndex = TAB_CADASTRO  then edtCodigoInicial.SetFocus;
  if pagFormulario.ActivePageIndex = TAB_AUDITORIA then edtEmpresaIDInicial.SetFocus;
end;

//
// Evento de click no bot�o "minimizar".
//
procedure TPlataformaERPVCLEmpresaFiltro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLEmpresaFiltro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para inicializar os componentes do formul�rio.
//
procedure TPlataformaERPVCLEmpresaFiltro.FormularioInicializar;
begin
  //
  // Controla os componentes conforme permiss�o de acesso.
  //
  pagFormulario.Pages[TAB_CADASTRO].TabVisible  := Plataforma_ERP_UsuarioRotina('ERP_EMPRESA_FILTRO_CADASTRO');
  pagFormulario.Pages[TAB_AUDITORIA].TabVisible := Plataforma_ERP_UsuarioRotina('ERP_EMPRESA_FILTRO_AUDITORIA');

  //
  // Componentes pr�-carregados.
  //
  VCLComboBoxSimNaoPopular(cbxBloqueado, True);
  VCLComboBoxSimNaoPopular(cbxAtivo,     True);
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLEmpresaFiltro.FormularioLimpar;
begin
  VCLEditLimpar    (edtCodigoInicial);
  VCLEditLimpar    (edtCodigoFinal);
  VCLEditLimpar    (edtNome);
  VCLComboBoxLimpar(cbxBloqueado);
  VCLComboBoxLimpar(cbxAtivo);

  VCLEditLimpar    (edtEmpresaIDInicial);
  VCLEditLimpar    (edtEmpresaIDFinal);
  VCLMaskEditLimpar(medInsDtHrInicial);
  VCLMaskEditLimpar(medInsDtHrFinal);
  VCLMaskEditLimpar(medUpdDtHrInicial);
  VCLMaskEditLimpar(medUpdDtHrFinal) ;
end;

//
// Procedimento para localizar os dados do filtro.
//
procedure TPlataformaERPVCLEmpresaFiltro.FormularioLocalizar;
begin
  pubClicouFechar     := False;
  pubCodigoInicial    := StringTrim(edtCodigoInicial.Text);
  pubCodigoFinal      := StringTrim(edtCodigoFinal.Text);
  pubNome             := StringTrim(edtNome.Text);
  pubBloqueado        := Copy(cbxBloqueado.Text, 1, 1);
  pubAtivo            := Copy(cbxAtivo.Text, 1, 1);
  pubEmpresaIDInicial := StringIntegerConverter(edtEmpresaIDInicial.Text);
  pubEmpresaIDFinal   := StringIntegerConverter(edtEmpresaIDFinal.Text);
  pubInsDtHrInicial   := StringDateTimeConverter(medInsDtHrInicial.Text);
  pubInsDtHrFinal     := StringDateTimeConverter(medInsDtHrFinal.Text);
  pubUpdDtHrInicial   := StringDateTimeConverter(medUpdDtHrInicial.Text);
  pubUpdDtHrFinal     := StringDateTimeConverter(medUpdDtHrFinal.Text);
  Close;
end;

end.

