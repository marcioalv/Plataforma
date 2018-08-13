//
// Arquivo..: Plataforma_ERP_VCL_PerfilUsuarioFiltro.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com os parâmetros de filtro para a listagem de perfis de usuários.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_PerfilUsuarioFiltro;

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
  Vcl.Mask, Vcl.Menus;

type
  TPlataformaERPVCLPerfilUsuarioFiltro = class(TForm)
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
    lblPerfilUsuarioID: TLabel;
    lblPerfilUsuarioIDAte: TLabel;
    edtPerfilUsuarioIDInicial: TEdit;
    edtPerfilUsuarioIDFinal: TEdit;
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
    procedure edtPerfilUsuarioIDInicialEnter(Sender: TObject);
    procedure edtPerfilUsuarioIDInicialExit(Sender: TObject);
    procedure edtPerfilUsuarioIDInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtPerfilUsuarioIDFinalEnter(Sender: TObject);
    procedure edtPerfilUsuarioIDFinalExit(Sender: TObject);
    procedure edtPerfilUsuarioIDFinalKeyPress(Sender: TObject; var Key: Char);
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
    pubClicouFechar          : Boolean;
    pubCodigoInicial         : string;
    pubCodigoFinal           : string;
    pubDescricao             : string;
    pubBloqueado             : string;
    pubAtivo                 : string;
    pubPerfilUsuarioIDInicial: Integer;
    pubPerfilUsuarioIDFinal  : Integer;
    pubInsDtHrInicial        : TDateTime;
    pubInsDtHrFinal          : TDateTime;
    pubUpdDtHrInicial        : TDateTime;
    pubUpdDtHrFinal          : TDateTime;    
  end;

var
  PlataformaERPVCLPerfilUsuarioFiltro: TPlataformaERPVCLPerfilUsuarioFiltro;

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

  FONTE_NOME: string = 'Plataforma_ERP_VCL_PerfilUsuarioFiltro';

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas.
  //
  pubClicouFechar           := True;
  pubPerfilUsuarioIDInicial := 0;
  pubPerfilUsuarioIDFinal   := 0;
  pubCodigoInicial          := '';
  pubCodigoFinal            := '';
  pubDescricao              := '';
  pubBloqueado              := '';
  pubAtivo                  := '';
  pubInsDtHrInicial         := 0;
  pubInsDtHrFinal           := 0;
  pubUpdDtHrInicial         := 0;
  pubUpdDtHrFinal           := 0;

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
procedure TPlataformaERPVCLPerfilUsuarioFiltro.FormShow(Sender: TObject);
begin
  //
  // Background do formulário.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Filtros memorizados.
  //
  edtCodigoInicial.Text        := pubCodigoInicial;
  edtCodigoFinal.Text          := pubCodigoFinal;
  edtDescricao.Text            := pubDescricao;
  VCLComboBoxPopular(cbxBloqueado, pubBloqueado);
  VCLComboBoxPopular(cbxAtivo,     pubAtivo);
  edtPerfilUsuarioIDInicial.Text := IntegerStringConverter(pubPerfilUsuarioIDInicial, True);
  edtPerfilUsuarioIDFinal.Text   := IntegerStringConverter(pubPerfilUsuarioIDFinal,   True);
  medInsDtHrInicial.Text         := DateTimeStringConverter(pubInsDtHrInicial, 'dd/mm/yyyy hh:nn');
  medInsDtHrFinal.Text           := DateTimeStringConverter(pubInsDtHrFinal,   'dd/mm/yyyy hh:nn');
  medUpdDtHrInicial.Text         := DateTimeStringConverter(pubUpdDtHrInicial, 'dd/mm/yyyy hh:nn');
  medUpdDtHrFinal.Text           := DateTimeStringConverter(pubUpdDtHrFinal,   'dd/mm/yyyy hh:nn');
  

  //
  // Foco no componente desejado.
  //
  if pagFormulario.ActivePageIndex = TAB_CADASTRO  then edtCodigoInicial.SetFocus;
  if pagFormulario.ActivePageIndex = TAB_AUDITORIA then edtPerfilUsuarioIDInicial.SetFocus;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.mniLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.mniLimparClick(Sender: TObject);
begin
  FormularioLimpar;
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "ID inicial" do perfil do usuário.
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.edtPerfilUsuarioIDInicialEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtPerfilUsuarioIDInicial) then Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.edtPerfilUsuarioIDInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.edtPerfilUsuarioIDInicialExit(Sender: TObject);
begin
  if not VCLEditSair(edtPerfilUsuarioIDInicial) then Exit;
end;

//
// Eventos do componente "ID final" do perfil do usuário.
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.edtPerfilUsuarioIDFinalEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtPerfilUsuarioIDFinal) then Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.edtPerfilUsuarioIDFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.edtPerfilUsuarioIDFinalExit(Sender: TObject);
begin
  if not VCLEditSair(edtPerfilUsuarioIDFinal) then Exit;
end;

//
// Eventos do componente "código inicial".
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.edtCodigoInicialEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigoInicial) then Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.edtCodigoInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.edtCodigoInicialExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigoInicial) then Exit;
end;

//
// Eventos do componente "código final".
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.edtCodigoFinalEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigoFinal) then Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.edtCodigoFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.edtCodigoFinalExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigoFinal) then Exit;
end;

//
// Eventos do componente "descrição".
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.edtDescricaoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtDescricao) then Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.edtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.edtDescricaoExit(Sender: TObject);
begin
  if not VCLEditSair(edtDescricao) then Exit;
end;

//
// Eventos do componente "bloqueado".
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.cbxBloqueadoEnter(Sender: TObject);
begin
  if not VCLComboBoxEntrar(cbxBloqueado) then Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.cbxBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.cbxBloqueadoExit(Sender: TObject);
begin
  if not VCLComboBoxSair(cbxBloqueado) then Exit;
  if not VCLComboBoxValidar(cbxBloqueado) then Exit;
end;

//
// Eventos do componente "ativo".
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.cbxAtivoEnter(Sender: TObject);
begin
  if not VCLComboBoxEntrar(cbxAtivo) then Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.cbxAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.cbxAtivoExit(Sender: TObject);
begin
  if not VCLComboBoxSair(cbxAtivo) then Exit;
  if not VCLComboBoxValidar(cbxAtivo) then Exit;
end;

//
// Eventos do componente "data de criação inicial".
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.medInsDtHrInicialEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medInsDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.medInsDtHrInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.medInsDtHrInicialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medInsDtHrInicial);
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.medInsDtHrInicialExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medInsDtHrInicial) then Exit;
  if not VCLMaskEditDataValidar(medInsDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.imgInsDtHrInicialClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medInsDtHrInicial);
end;

//
// Eventos do componente "data de criação final".
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.medInsDtHrFinalEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medInsDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.medInsDtHrFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.medInsDtHrFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medInsDtHrFinal);
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.medInsDtHrFinalExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medInsDtHrFinal) then Exit;
  if not VCLMaskEditDataValidar(medInsDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.imgInsDtHrFinalClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medInsDtHrFinal);
end;

//
// Eventos do componente "data de alteração inicial".
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.medUpdDtHrInicialEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medUpdDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.medUpdDtHrInicialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.medUpdDtHrInicialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrInicial);
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.medUpdDtHrInicialExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medUpdDtHrInicial) then Exit;
  if not VCLMaskEditDataValidar(medUpdDtHrInicial) then Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.imgUpdDtHrInicialClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrInicial);
end;

//
// Eventos do componente "data de alteração final".
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.medUpdDtHrFinalEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medUpdDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.medUpdDtHrFinalKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.medUpdDtHrFinalKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrFinal);
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.medUpdDtHrFinalExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medUpdDtHrFinal) then Exit;
  if not VCLMaskEditDataValidar(medUpdDtHrFinal) then Exit;
end;

procedure TPlataformaERPVCLPerfilUsuarioFiltro.imgUpdDtHrFinalClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medUpdDtHrFinal);
end;

//
// Evento de click no botão "localizar".
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no botão "limpar".
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.btnLimparClick(Sender: TObject);
begin
  FormularioLimpar;

  if pagFormulario.ActivePageIndex = TAB_CADASTRO  then edtCodigoInicial.SetFocus;
  if pagFormulario.ActivePageIndex = TAB_AUDITORIA then edtPerfilUsuarioIDInicial.SetFocus;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para inicializar os componentes do formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.FormularioInicializar;
begin
  //
  // Controla os componentes conforme permissão de acesso.
  //
  pagFormulario.Pages[TAB_CADASTRO].TabVisible  := Plataforma_ERP_UsuarioRotina('ERP_PERFIL_USUARIO_FILTRO_CADASTRO');
  pagFormulario.Pages[TAB_AUDITORIA].TabVisible := Plataforma_ERP_UsuarioRotina('ERP_PERFIL_USUARIO_FILTRO_AUDITORIA');

  //
  // Componentes pré-carregados.
  //
  VCLComboBoxSimNaoPopular(cbxBloqueado, True);
  VCLComboBoxSimNaoPopular(cbxAtivo,     True);
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.FormularioLimpar;
begin
  VCLEditLimpar    (edtCodigoInicial);
  VCLEditLimpar    (edtCodigoFinal);
  VCLEditLimpar    (edtDescricao);
  VCLComboBoxLimpar(cbxBloqueado);
  VCLComboBoxLimpar(cbxAtivo);

  VCLEditLimpar    (edtPerfilUsuarioIDInicial);
  VCLEditLimpar    (edtPerfilUsuarioIDFinal);
  VCLMaskEditLimpar(medInsDtHrInicial);
  VCLMaskEditLimpar(medInsDtHrFinal);
  VCLMaskEditLimpar(medUpdDtHrInicial);
  VCLMaskEditLimpar(medUpdDtHrFinal) ;
end;

//
// Procedimento para localizar os dados do filtro.
//
procedure TPlataformaERPVCLPerfilUsuarioFiltro.FormularioLocalizar;
begin
  pubClicouFechar           := False;
  pubCodigoInicial          := StringTrim(edtCodigoInicial.Text);
  pubCodigoFinal            := StringTrim(edtCodigoFinal.Text);
  pubDescricao              := StringTrim(edtDescricao.Text);
  pubBloqueado              := Copy(cbxBloqueado.Text, 1, 1);
  pubAtivo                  := Copy(cbxAtivo.Text, 1, 1);
  pubPerfilUsuarioIDInicial := StringIntegerConverter(edtPerfilUsuarioIDInicial.Text);
  pubPerfilUsuarioIDFinal   := StringIntegerConverter(edtPerfilUsuarioIDFinal.Text);
  pubInsDtHrInicial         := StringDateTimeConverter(medInsDtHrInicial.Text);
  pubInsDtHrFinal           := StringDateTimeConverter(medInsDtHrFinal.Text);
  pubUpdDtHrInicial         := StringDateTimeConverter(medUpdDtHrInicial.Text);
  pubUpdDtHrFinal           := StringDateTimeConverter(medUpdDtHrFinal.Text);
  Close;
end;

end.

