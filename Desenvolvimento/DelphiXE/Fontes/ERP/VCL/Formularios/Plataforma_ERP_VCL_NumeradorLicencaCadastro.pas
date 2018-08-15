//
// Arquivo..: Plataforma_ERP_VCL_NumeradorLicencaCadastro.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 14/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com o cadastro de numeradores por licen�a.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_NumeradorLicencaCadastro;

interface

uses
  Data.Win.ADODB,
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
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls,
  Vcl.Menus;

type
  TPlataformaERPVCLNumeradorLicencaCadastro = class(TForm)
    imgFormulario: TImage;
    pagFormulario: TPageControl;
    tabCadastro: TTabSheet;
    tabAuditoria: TTabSheet;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    lblAtualID: TLabel;
    edtAtualID: TEdit;
    lblInsDtHt: TLabel;
    edtInsLocalDtHr: TEdit;
    lblUpdDtHr: TLabel;
    edtUpdLocalDtHr: TEdit;
    lblUpdContador: TLabel;
    edtUpdContador: TEdit;
    btnGravar: TBitBtn;
    btnMinimizar: TBitBtn;
    btnFechar: TBitBtn;
    btnCancelar: TBitBtn;
    btnAlterar: TBitBtn;
    btnNovo: TBitBtn;
    lblBase: TLabel;
    edtBaseDescricao: TEdit;
    edtBaseID: TEdit;
    lblLicenca: TLabel;
    edtLicencaDescricao: TEdit;
    edtLicencaID: TEdit;
    imgBackground: TImage;
    mnuFormulario: TMainMenu;
    mniFechar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniAlterar: TMenuItem;
    mniExcluir: TMenuItem;
    mniNovo: TMenuItem;
    mniAtualizar: TMenuItem;
    mniCancelar: TMenuItem;
    mniGravar: TMenuItem;
    gbxOpcoes: TGroupBox;
    chkBloqueado: TCheckBox;
    chkAtivo: TCheckBox;
    chkCadastroNovo: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtAtualIDEnter(Sender: TObject);
    procedure edtAtualIDExit(Sender: TObject);
    procedure edtAtualIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtAtualIDKeyPress(Sender: TObject; var Key: Char);
    procedure chkBloqueadoEnter(Sender: TObject);
    procedure chkBloqueadoExit(Sender: TObject);
    procedure chkBloqueadoKeyPress(Sender: TObject; var Key: Char);
    procedure chkAtivoEnter(Sender: TObject);
    procedure chkAtivoExit(Sender: TObject);
    procedure chkAtivoKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure edtLicencaDescricaoClick(Sender: TObject);
    procedure edtBaseDescricaoClick(Sender: TObject);
    procedure edtInsLocalDtHrClick(Sender: TObject);
    procedure edtUpdLocalDtHrClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure mniCancelarClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
    procedure mniGravarClick(Sender: TObject);
    procedure mniAlterarClick(Sender: TObject);
    procedure mniExcluirClick(Sender: TObject);
    procedure mniNovoClick(Sender: TObject);
    procedure mniAtualizarClick(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioControlar(argEditar: Boolean);
    procedure FormularioAtualizar;
    procedure FormularioNovo;

    procedure FormularioPopular(argLicencaID: Integer;
                                argBaseID   : Integer;
                                argCodigo   : string);

    procedure FormularioAlterar;
    procedure FormularioGravar;
    procedure FormularioCancelar;
    procedure FormularioExcluir;
    function  LogDadosGerar: string;
  public
    pubDadosAtualizados: Boolean;
    pubLicencaID       : Integer;
    pubBaseID          : Integer;
    pubCodigo          : string;
  end;

var
  PlataformaERPVCLNumeradorLicencaCadastro: TPlataformaERPVCLNumeradorLicencaCadastro;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_NumeradorLicencaCadastro.pas';

  TAB_CADASTRO : Byte = 0;
  TAB_AUDITORIA: Byte = 1;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas.
  //
  pubDadosAtualizados := False;
  pubLicencaID        := 0;
  pubBaseID           := 0;
  pubCodigo           := '';
 
  //
  // Limpa os componentes do formul�rio.
  //
  FormularioLimpar;

  //
  // Componentes desligados para edi��o.
  //
  FormularioControlar(False);
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormShow(Sender: TObject);
begin
  //
  // Background do formul�rio.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Controla os componentes de exibi��o de cadastro.
  //
  VCLEditClickControlar(edtLicencaDescricao, False);
  VCLEditClickControlar(edtBaseDescricao,    False);
  VCLEditClickControlar(edtInsLocalDtHr,     False);
  VCLEditClickControlar(edtUpdLocalDtHr,     False);
  
  //
  // Se nenhuma chave foi passada ent�o � um novo cadastro.
  //
  if (pubLicencaID = 0) and (pubBaseID = 0) and (pubCodigo = '') then
  begin
    FormularioNovo;
    Exit;
  end;

  //
  // Se foi passada uma chave ent�o popula formul�rio.
  //
  if (pubLicencaID > 0) and (pubBaseID > 0) and (pubCodigo <> '') then
  begin
    FormularioPopular(pubLicencaID, pubBaseID, pubCodigo);
    FormularioControlar(False);
    Exit;
  end;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas op��es do menu.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.mniNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.mniExcluirClick(Sender: TObject);
begin
  FormularioExcluir;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.mniAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.mniCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "c�digo".
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigo) then Exit;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigo) then Exit;
end;

//
// Eventos do componente "ID atual".
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtAtualIDEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtAtualID) then Exit;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtAtualIDKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtAtualIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtAtualIDExit(Sender: TObject);
begin
  if not VCLEditSair(edtAtualID) then Exit;
end;

//
// Eventos do componente "bloqueado".
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.chkBloqueadoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkBloqueado) then Exit;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.chkBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.chkBloqueadoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkBloqueado) then Exit;
end;

//
// Ativo.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.chkAtivoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkAtivo) then Exit;
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.chkAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLNumeradorLicencaCadastro.chkAtivoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkAtivo) then Exit;
end;

//
// Evento de click no t�tulo da licen�a.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtLicencaDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_LicencaCadastroExibir(StringIntegerConverter(edtLicencaID.Text));
end;

//
// Evento de click no t�tulo da base.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtBaseDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_BaseCadastroExibir(StringIntegerConverter(edtBaseID.Text));
end;

//
// Evento de click na data de cria��o.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtInsLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtInsLocalDtHr.Text));
end;

//
// Evento de click na data da �ltima altera��o.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.edtUpdLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtUpdLocalDtHr.Text));
end;

//
// Evento de click no bot�o "novo".
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.btnNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

//
// Evento de click no bot�o "alterar".
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.btnAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

//
// Evento de click no bot�o "gravar".
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no bot�o "minimizar".
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "cancelar".
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.btnCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormularioLimpar;
begin 
  //
  // Posiciona pagecontrole na primeira aba.
  //
  VCLPageControlInicializar(pagFormulario);

  // Limpa componentes da aba "cadastro".
  VCLEditLimpar    (edtCodigo);
  VCLEditLimpar    (edtAtualID);
  VCLCheckBoxLimpar(chkCadastroNovo);
  VCLCheckBoxLimpar(chkBloqueado);
  VCLCheckBoxLimpar(chkAtivo);

  //
  // Limpa componentes da aba "auditoria".
  //
  VCLEditLimpar(edtLicencaID);
  VCLEditLimpar(edtLicencaDescricao);
  VCLEditLimpar(edtBaseID);
  VCLEditLimpar(edtBaseDescricao);
  VCLEditLimpar(edtInsLocalDtHr);
  VCLEditLimpar(edtUpdLocalDtHr);
  VCLEditLimpar(edtUpdContador);
end;

//
// Procedimento para controlar os componentes do formul�rio.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormularioControlar(argEditar: Boolean);
var
  locDadosPopulados: Boolean;
  locIdentificador : string;
begin
  //
  // Determina se existem dados populados no formul�rio.
  //
  locDadosPopulados := (StringTrim(edtCodigo.Text) <> '');

  //
  // Controla os componentes do formul�rio.
  //
  VCLEditControlar(edtCodigo,  argEditar);
  VCLEditControlar(edtAtualID, argEditar);
  gbxOpcoes.Enabled := argEditar;

  //
  // Controla os componentes de exibi��o de cadastro.
  //
  VCLEditClickControlar(edtLicencaDescricao, True);
  VCLEditClickControlar(edtBaseDescricao,    True);
  VCLEditClickControlar(edtInsLocalDtHr,     True);
  VCLEditClickControlar(edtUpdLocalDtHr,     True);

  //
  // Controla os itens de menu do formul�rio.
  //
  mniAtualizar.Visible := (mniAtualizar.Enabled) and (not argEditar) and (locDadosPopulados);
  mniNovo.Visible      := (mniNovo.Enabled)      and (not argEditar);
  mniExcluir.Visible   := (mniExcluir.Enabled)   and (not argEditar) and (locDadosPopulados);
  mniAlterar.Visible   := (mniAlterar.Enabled)   and (not argEditar) and (locDadosPopulados);
  mniGravar.Visible    := (mniGravar.Enabled)    and (argEditar);
  mniCancelar.Visible  := (mniCancelar.Enabled)  and (argEditar);
  mniMinimizar.Visible := (mniMinimizar.Enabled);
  mniFechar.Visible    := (mniFechar.Enabled)    and (not argEditar);

  //
  // Permiss�es de acesso por VCL_DIGITACAO_ALFANUMERICA.
  //
  tabCadastro.TabVisible  := Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_LICENCA_CADASTRO_ABA_CADASTRO');
  tabAuditoria.TabVisible := Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_LICENCA_CADASTRO_ABA_AUDITORIA');
      
  mniAtualizar.Visible := (mniAtualizar.Visible) and (Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_LICENCA_CADASTRO_ATUALIZAR'));
  mniNovo.Visible      := (mniNovo.Visible)      and (Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_LICENCA_CADASTRO_NOVO'));
  mniExcluir.Visible   := (mniExcluir.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_LICENCA_CADASTRO_EXCLUIR'));
  mniAlterar.Visible   := (mniAlterar.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_LICENCA_CADASTRO_ALTERAR'));

  //
  // Bot�es.
  //
  btnNovo.Visible      := (btnNovo.Enabled)      and (mniNovo.Visible);
  btnAlterar.Visible   := (btnAlterar.Enabled)   and (mniAlterar.Visible);
  btnGravar.Visible    := (btnGravar.Enabled)    and (mniGravar.Visible);
  btnMinimizar.Visible := (btnMinimizar.Enabled) and (mniMinimizar.Visible);
  btnCancelar.Visible  := (btnCancelar.Enabled)  and (mniCancelar.Visible);
  btnFechar.Visible    := (btnFechar.Enabled)    and (mniFechar.Visible);

  //
  // Ajusta o t�tulo do formul�rio.
  //
  Self.Caption     := 'Numerador por licen�a';
  locIdentificador := ': ' + edtCodigo.Text;

  if (not locDadosPopulados) and (argEditar) then Self.Caption := Self.Caption + ' - novo cadastro';
  if locDadosPopulados and argEditar         then Self.Caption := Self.Caption + ' - alterando cadastro' + locIdentificador;
  if locDadosPopulados and (not argEditar)   then Self.Caption := Self.Caption + ' - consultando cadastro' + locIdentificador;
end;

//
// Procedimento para atualizar os dados populados nos componentes do formul�rio.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormularioAtualizar;
begin
  //
  // Popula componentes com as informa��es do cadastro.
  //
  FormularioPopular(StringIntegerConverter(edtLicencaID.Text),
                    StringIntegerConverter(edtBaseID.Text),
                    edtCodigo.Text);

  //
  // Controla a exibi��o dos componentes.
  //
  FormularioControlar(False);
end;

//
// Procedimento para iniciar a digita��o de dados de um novo cadastro.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormularioNovo;
begin
  //
  // Limpa os componentes do formul�rio.
  //
  FormularioLimpar;

  //
  // Carrega conte�do dos campos necess�rios.
  //
  edtLicencaID.Text        := IntegerStringConverter(gloLicencaID, True);
  edtLicencaDescricao.Text := gloLicencaDescricao;
  edtBaseID.Text           := IntegerStringConverter(gloBaseID,    True);
  edtBaseDescricao.Text    := gloBaseDescricao;
  chkCadastroNovo.Checked  := True;
  chkAtivo.Checked         := True;

  //
  // Componentes ligados para edi��o.
  //
  FormularioControlar(True);
  
  //
  // Coloca o foco no c�digo.
  //
  VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
end;

//
// Procedimento para popular os componentes com os dados de um cadastro.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormularioPopular(argLicencaID: Integer;
                                                                      argBaseID   : Integer;
                                                                      argCodigo   : string);
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
  ERRO_MENSAGEM    : string = 'Imposs�vel consultar dados do numerador por licen�a!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
begin
  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Limpa os componentes do formul�rio.
  //
  FormularioLimpar;

  //
  // Conex�o ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(Self);

  try
    Plataforma_ERP_ADO_ConexaoAbrir(locADOConnection);
  except
    on locExcecao: Exception do
    begin
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Query.
  //
  locADOQuery                := TADOQuery.Create(Self);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Consulta dados do numerador por licen�a.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                           ');
  locADOQuery.SQL.Add('  [licenca].[licenca_id] AS [licenca_id],                        ');
  locADOQuery.SQL.Add('  [licenca].[descricao]  AS [licenca_descricao],                 ');
  locADOQuery.SQL.Add('  [base].[base_id]       AS [base_id],                           ');
  locADOQuery.SQL.Add('  [base].[descricao]     AS [base_descricao],                    ');
  locADOQuery.SQL.Add('  [numerador_licenca].[codigo],                                  ');
  locADOQuery.SQL.Add('  [numerador_licenca].[atual_id],                                ');
  locADOQuery.SQL.Add('  [numerador_licenca].[bloqueado],                               ');
  locADOQuery.SQL.Add('  [numerador_licenca].[ativo],                                   ');
  locADOQuery.SQL.Add('  [numerador_licenca].[ins_local_dt_hr],                         ');
  locADOQuery.SQL.Add('  [numerador_licenca].[upd_local_dt_hr],                         ');
  locADOQuery.SQL.Add('  [numerador_licenca].[upd_contador]                             ');
  locADOQuery.SQL.Add('FROM                                                             ');
  locADOQuery.SQL.Add('  [numerador_licenca] WITH (NOLOCK)                              ');
  locADOQuery.SQL.Add('  INNER JOIN [licenca] WITH (NOLOCK)                             ');
  locADOQuery.SQL.Add('    ON [licenca].[licenca_id] = [numerador_licenca].[licenca_id] ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                                ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [numerador_licenca].[base_id]          ');
  locADOQuery.SQL.Add('WHERE                                                            ');
  locADOQuery.SQL.Add('  [numerador_licenca].[licenca_id] = :licenca_id AND             ');
  locADOQuery.SQL.Add('  [numerador_licenca].[base_id]    = :base_id    AND             ');
  locADOQuery.SQL.Add('  [numerador_licenca].[codigo]     = :codigo                     ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value := argLicencaID;
  locADOQuery.Parameters.ParamByName('base_id').Value    := argBaseID;
  locADOQuery.Parameters.ParamByName('codigo').Value     := argCodigo;

  //
  // Executa query.
  //
  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [numerador_licenca]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Registro encontrado.
  //
  if locADOQuery.RecordCount >= 0 then
  begin
    //
    // Carrega componentes.
    //
    edtCodigo.Text          := locADOQuery.FieldByName('codigo').AsString;
    edtAtualID.Text         := IntegerStringConverter(locADOQuery.FieldByName('atual_id').AsInteger);
    chkCadastroNovo.Checked := False;
    chkBloqueado.Checked    := StringBooleanConverter(locADOQuery.FieldByName('bloqueado').AsString);
    chkAtivo.Checked        := StringBooleanConverter(locADOQuery.FieldByName('ativo').AsString);

    edtLicencaID.Text        := locADOQuery.FieldByName('licenca_id').AsString;
    edtLicencaDescricao.Text := locADOQuery.FieldByName('licenca_descricao').AsString;
    edtBaseID.Text           := locADOQuery.FieldByName('base_id').AsString;
    edtBaseDescricao.Text    := locADOQuery.FieldByName('base_descricao').AsString;
    edtInsLocalDtHr.Text     := DateTimeStringConverter(locADOQuery.FieldByName('ins_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn');
    edtUpdLocalDtHr.Text     := DateTimeStringConverter(locADOQuery.FieldByName('upd_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn');
    edtUpdContador.Text      := IntegerStringConverter(locADOQuery.FieldByName('upd_contador').AsInteger);
  end; 

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);
  VCLCursorTrocar;
end;

//
// Procedimento para alterar os dados do formul�rio.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormularioAlterar;
begin
  //
  // Componentes ligados para edi��o.
  //
  FormularioControlar(True);

  //
  // Coloca o foco no c�digo.
  //
  VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
end;

//
// Procedimento para gravar os dados do formul�rio.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioGravar';
  ERRO_MENSAGEM    : string = 'Imposs�vel gravar dados do numerador por licen�a!';
var
  locADOConnection           : TADOConnection;
  locADOQuery                : TADOQuery;
  locLogMensagem             : string;

  locInsert                  : Boolean;
  locRegistroAcao            : Byte;
  locRegistroAcaoID          : Integer;
  locNumeradorLicencaLogMsg  : string;
  locNumeradorLicencaLogDados: string;

  locLicencaID               : Integer;
  locBaseID                  : Integer;
  locCodigo                  : string;
  locAtualID                 : Integer;
  locBloqueado               : Boolean;
  locAtivo                   : Boolean;
  locInsLocalDtHr            : TDateTime;
  locUpdLocalDtHr            : TDateTime;
  locUsuarioBaseID           : Integer;
  locUsuarioID               : Integer;
  locUpdContador             : Integer;
  locHostName                : string;
  locUserName                : string;
begin
  //
  // Determina se ser� um insert ou update.
  //
  locInsert := chkCadastroNovo.Checked;

  //
  // Carrega vari�veis com o conte�do dos componentes.
  //
  locLicencaID         := StringIntegerConverter(edtLicencaID.Text);
  locBaseID            := StringIntegerConverter(edtBaseID.Text);
  locCodigo            := StringTrim(edtCodigo.Text);
  locAtualID           := StringIntegerConverter(edtAtualID.Text);
  locBloqueado         := chkBloqueado.Checked;
  locAtivo             := chkAtivo.Checked;
  locUsuarioBaseID     := gloUsuarioBaseID;
  locUsuarioID         := gloUsuarioID;
  locHostName          := HostNameRecuperar;
  locUserName          := UserNameRecuperar;
  locUpdContador       := StringIntegerConverter(edtUpdContador.Text);

  //
  // Consiste as informa��es.
  //
  if locCodigo = '' then
  begin
    VCLConsistenciaExibir('O c�digo do numerador por licen�a deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
    Exit;
  end;

  if locAtualID < 0 then
  begin
    VCLConsistenciaExibir('O ID atual do numerador por licen�a n�o deve ser um n�mero negativo!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtAtualID);
    Exit;
  end;

  //
  // Confirma grava��o com o usu�rio.
  //
  if not VCLQuestionamentoExibir('Deseja realmente gravar estes dados?') then Exit;

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Conex�o ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(Self);

  try
    Plataforma_ERP_ADO_ConexaoAbrir(locADOConnection);
  except
    on locExcecao: Exception do
    begin
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Query.
  //
  locADOQuery                := TADOQuery.Create(Self);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Determina se o c�digo do numerador por licen�a j� existe no banco de dados para um outro registro.
  //
  if locInsert then
  begin
    locADOQuery.Close;
    locADOQuery.SQL.Clear;
    locADOQuery.SQL.Add('SELECT TOP 1                                         ');
    locADOQuery.SQL.Add('  1                                                  ');
    locADOQuery.SQL.Add('FROM                                                 ');
    locADOQuery.SQL.Add('  [numerador_licenca] WITH (NOLOCK)                  ');
    locADOQuery.SQL.Add('WHERE                                                ');
    locADOQuery.SQL.Add('  [numerador_licenca].[licenca_id] = :licenca_id AND ');
    locADOQuery.SQL.Add('  [numerador_licenca].[base_id]    = :base_id    AND ');
    locADOQuery.SQL.Add('  [numerador_licenca].[codigo]     = :codigo         ');

    locADOQuery.Parameters.ParamByName('licenca_id').Value := locLicencaID;
    locADOQuery.Parameters.ParamByName('base_id').Value    := locBaseID;
    locADOQuery.Parameters.ParamByName('codigo').Value     := locCodigo;

    try
      locADOQuery.Open;
    except
      on locExcecao: Exception do
      begin
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar o mesmo c�digo de numerador por licen�a em um outro registro!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
        Exit;
      end;
    end;

    if locADOQuery.RecordCount > 0 then
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'O c�digo "' + locCodigo + '" informado para o numerador por licen�a j� existe em algum outro cadastro!';
      Plataforma_ERP_Logar(False, ERRO_MENSAGEM, locLogMensagem, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem);
      Exit;
    end;
  end;

  //
  // Consiste o contador do update.
  //
  if not locInsert then
  begin
    locADOQuery.Close;
    locADOQuery.SQL.Clear;
    locADOQuery.SQL.Add('SELECT                                               ');
    locADOQuery.SQL.Add('  [numerador_licenca].[upd_contador]                 ');
    locADOQuery.SQL.Add('FROM                                                 ');
    locADOQuery.SQL.Add('  [numerador_licenca] WITH (NOLOCK)                  ');
    locADOQuery.SQL.Add('WHERE                                                ');
    locADOQuery.SQL.Add('  [numerador_licenca].[licenca_id] = :licenca_id AND ');
    locADOQuery.SQL.Add('  [numerador_licenca].[base_id]    = :base_id    AND ');
    locADOQuery.SQL.Add('  [numerador_licenca].[codigo]     = :codigo         ');

    locADOQuery.Parameters.ParamByName('licenca_id').Value := locLicencaID;
    locADOQuery.Parameters.ParamByName('base_id').Value    := locBaseID;
    locADOQuery.Parameters.ParamByName('codigo').Value     := locCodigo;

    try
      locADOQuery.Open;
    except
      on locExcecao: Exception do
      begin
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualiza��es confere na tabela [numerador_licenca]!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
        Exit
      end;
    end;

    if locADOQuery.RecordCount > 0 then
    begin
      if locADOQuery.FieldByName('upd_contador').AsInteger <> locUpdContador then
      begin
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Esse registro sofreu alguma outra altera��o entre a sua consulta e essa grava��o!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE);
        Exit
      end;
    end;
  end;

  //
  // Determina o ID da a��o e a mensagem para o log do registro.
  //
  if locInsert then
  begin
    locRegistroAcao           := REGISTRO_ACAO_CRIACAO;
    locNumeradorLicencaLogMsg := MENSAGEM_REGISTRO_ACAO_CRIADO;
  end
  else
  begin
    locRegistroAcao           := REGISTRO_ACAO_ALTERACAO;
    locNumeradorLicencaLogMsg := MENSAGEM_REGISTRO_ACAO_ALTERADO;
  end;

  try
    locRegistroAcaoID := Plataforma_ERP_RegistroAcaoIDDeterminar(locADOConnection, locRegistroAcao);
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locExcecao.Message);
      Exit
    end;
  end;

  //
  // Inicia transa��o com o banco de dados.
  //
  try
    locADOConnection.BeginTrans;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := ERRO_MENSAGEM_BD_TRANSACAO_INICIAR;
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE, locExcecao.Message);
      Exit
    end;
  end;  

  //
  // Grava dados na tabela numerador_licenca.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;

  if locInsert then
  begin
    //
    // Insere dados.
    //
    locADOQuery.SQL.Add('INSERT INTO [numerador_licenca] (');
    locADOQuery.SQL.Add('  [licenca_id],                  ');
    locADOQuery.SQL.Add('  [base_id],                     ');
    locADOQuery.SQL.Add('  [codigo],                      ');
    locADOQuery.SQL.Add('  [atual_id],                    ');
    locADOQuery.SQL.Add('  [bloqueado],                   ');
    locADOQuery.SQL.Add('  [ativo],                       ');
    locADOQuery.SQL.Add('  [ins_local_dt_hr],             ');
    locADOQuery.SQL.Add('  [ins_server_dt_hr],            ');
    locADOQuery.SQL.Add('  [ins_usuario_base_id],         ');
    locADOQuery.SQL.Add('  [ins_usuario_id],              ');    
    locADOQuery.SQL.Add('  [upd_local_dt_hr],             ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr],            ');
    locADOQuery.SQL.Add('  [upd_usuario_base_id],         ');
    locADOQuery.SQL.Add('  [upd_usuario_id],              ');
    locADOQuery.SQL.Add('  [upd_contador]                 ');  
    locADOQuery.SQL.Add(')                                ');
    locADOQuery.SQL.Add('VALUES (                         ');
    locADOQuery.SQL.Add('  :licenca_id,                   '); // [licenca_id].
    locADOQuery.SQL.Add('  :base_id,                      '); // [base_id].
    locADOQuery.SQL.Add('  :codigo,                       '); // [codigo].
    locADOQuery.SQL.Add('  :atual_id,                     '); // [atual_id].
    locADOQuery.SQL.Add('  :bloqueado,                    '); // [bloqueado].
    locADOQuery.SQL.Add('  :ativo,                        '); // [ativo].
    locADOQuery.SQL.Add('  :local_dt_hr,                  '); // [ins_local_dt_hr].
    locADOQuery.SQL.Add('  GETDATE(),                     '); // [ins_server_dt_hr].
    locADOQuery.SQL.Add('  :usuario_base_id,              '); // [ins_usuario_base_id].
    locADOQuery.SQL.Add('  :usuario_id,                   '); // [ins_usuario_id].
    locADOQuery.SQL.Add('  NULL,                          '); // [upd_local_dt_hr].
    locADOQuery.SQL.Add('  NULL,                          '); // [upd_server_dt_hr].
    locADOQuery.SQL.Add('  NULL,                          '); // [upd_usuario_base_id].
    locADOQuery.SQL.Add('  NULL,                          '); // [upd_usuario_id].
    locADOQuery.SQL.Add('  0                              '); // [upd_contador].
    locADOQuery.SQL.Add(')                                ');
  end
  else
  begin
    //
    // Atualiza dados.
    //
    locADOQuery.SQL.Add('UPDATE                                       ');
    locADOQuery.SQL.Add('  [numerador_licenca]                        ');
    locADOQuery.SQL.Add('SET                                          ');
    locADOQuery.SQL.Add('  [atual_id]            = :atual_id,         ');
    locADOQuery.SQL.Add('  [bloqueado]           = :bloqueado,        ');
    locADOQuery.SQL.Add('  [ativo]               = :ativo,            ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr]     = :local_dt_hr,      ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr]    = GETDATE(),         ');
    locADOQuery.SQL.Add('  [upd_usuario_base_id] = :usuario_base_id,  ');
    locADOQuery.SQL.Add('  [upd_usuario_id]      = :usuario_id,       ');    
    locADOQuery.SQL.Add('  [upd_contador]        = [upd_contador] + 1 ');
    locADOQuery.SQL.Add('WHERE                                        ');
    locADOQuery.SQL.Add('  [licenca_id] = :licenca_id AND             ');
    locADOQuery.SQL.Add('  [base_id]    = :base_id    AND             ');
    locADOQuery.SQL.Add('  [codigo]     = :codigo                     ');
  end;

  //
  // Par�metros.
  //
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('base_id').Value         := locBaseID;
  locADOQuery.Parameters.ParamByName('codigo').Value          := locCodigo;
  locADOQuery.Parameters.ParamByName('atual_id').Value        := locAtualID;
  locADOQuery.Parameters.ParamByName('bloqueado').Value       := BooleanStringConverter(locBloqueado);
  locADOQuery.Parameters.ParamByName('ativo').Value           := BooleanStringConverter(locAtivo);
  locADOQuery.Parameters.ParamByName('local_dt_hr').Value     := Now;  
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value      := locUsuarioID;

  try
    locADOQuery.ExecSQL;
  except
    on locExcecao: Exception do
    begin
      locADOConnection.RollbackTrans;
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [numerador_licenca]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  //
  // Determina o contador de updates atual.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                               ');
  locADOQuery.SQL.Add('  [numerador_licenca].[ins_local_dt_hr],             ');
  locADOQuery.SQL.Add('  [numerador_licenca].[upd_local_dt_hr],             ');
  locADOQuery.SQL.Add('  [numerador_licenca].[upd_contador]                 ');
  locADOQuery.SQL.Add('FROM                                                 ');
  locADOQuery.SQL.Add('  [numerador_licenca]                                ');
  locADOQuery.SQL.Add('WHERE                                                ');
  locADOQuery.SQL.Add('  [numerador_licenca].[licenca_id] = :licenca_id AND ');
  locADOQuery.SQL.Add('  [numerador_licenca].[base_id]    = :base_id    AND ');
  locADOQuery.SQL.Add('  [numerador_licenca].[codigo]     = :codigo         ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value := locLicencaID;
  locADOQuery.Parameters.ParamByName('base_id').Value    := locBaseID;
  locADOQuery.Parameters.ParamByName('codigo').Value     := locCodigo;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOConnection.RollbackTrans;
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o novo contador de updates do registro na tabela [numerador_licenca]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;   
  end;

  locInsLocalDtHr := locADOQuery.FieldByName('ins_local_dt_hr').AsDateTime;
  locUpdLocalDtHr := locADOQuery.FieldByName('upd_local_dt_hr').AsDateTime;
  locUpdContador  := locADOQuery.FieldByName('upd_contador').AsInteger;

  //
  // Log dados.
  //
  locNumeradorLicencaLogDados := LogDadosGerar;

  //
  // Finaliza transa��o com o banco de dados.
  //
  try
    locADOConnection.CommitTrans;
  except
    on locExcecao: Exception do
    begin
      locADOConnection.RollbackTrans;
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := ERRO_MENSAGEM_BD_TRANSACAO_CONFIRMAR;
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE, locExcecao.Message);
      Exit
    end;
  end;

  //
  // Atualiza componentes que sofreram altera��o com a grava��o.
  //
  edtInsLocalDtHr.Text  := DateTimeStringConverter(locInsLocalDtHr, 'dd/mm/yyyy hh:nn');
  edtUpdLocalDtHr.Text  := DateTimeStringConverter(locUpdLocalDtHr, 'dd/mm/yyyy hh:nn');
  edtUpdContador.Text   := IntegerStringConverter(locUpdContador);

  //
  // Componentes desligados para edi��o.
  //
  FormularioControlar(False);

  //
  // Indica que os dados foram atualizados.
  //
  pubDadosAtualizados := True;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);

  //
  // Grava log de ocorr�ncia.
  //  
  try
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, 0, locCodigo, 'numerador_licenca', locNumeradorLicencaLogMsg, locNumeradorLicencaLogDados);
  except
    on locExcecao: Exception do
    begin
      VCLErroExibir(locExcecao.Message);
    end;
  end;

  //
  // Numerador por licen�a gravado!
  //
  VCLInformacaoExibir('Numerador por licen�a gravado com sucesso!');
end;

//
// Procedimento para excluir os dados deste cadastro.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormularioExcluir;
const
  PROCEDIMENTO_NOME: string = 'FormularioExcluir';
  ERRO_MENSAGEM    : string = 'Imposs�vel excluir dados do numerador por licen�a!';
var
  locADOConnection           : TADOConnection;
  locADOQuery                : TADOQuery;
  locLogMensagem             : string;
  locLicencaID               : Integer;
  locBaseID                  : Integer;
  locCodigo                  : string;
  locNumeradorLicencaLogDados: string;
begin
  //
  // Carrega vari�veis com o conte�do dos componentes.
  //
  locLicencaID := StringIntegerConverter(edtLicencaID.Text);
  locBaseID    := StringIntegerConverter(edtBaseID.Text);
  locCodigo    := StringTrim(edtCodigo.Text);

  //
  // Log dados.
  //
  locNumeradorLicencaLogDados := LogDadosGerar;

  //
  // Confirma grava��o com o usu�rio.
  //
  if not VCLQuestionamentoExibir('Deseja realmente excluir estes dados?') then Exit;
  if not VCLQuestionamentoExibir('Tem certeza?') then Exit;

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Conex�o ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(Self);

  try
    Plataforma_ERP_ADO_ConexaoAbrir(locADOConnection);
  except
    on locExcecao: Exception do
    begin
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Query.
  //
  locADOQuery                := TADOQuery.Create(Self);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Inicia transa��o com o banco de dados.
  //
  try
    locADOConnection.BeginTrans;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := ERRO_MENSAGEM_BD_TRANSACAO_INICIAR;
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE, locExcecao.Message);
      Exit
    end;
  end;  

  //
  // Comando SQL para excluir um registro da tabela numerador_licenca.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                                          ');
  locADOQuery.SQL.Add('  [numerador_licenca]                                ');
  locADOQuery.SQL.Add('WHERE                                                ');
  locADOQuery.SQL.Add('  [numerador_licenca].[licenca_id] = :licenca_id AND ');
  locADOQuery.SQL.Add('  [numerador_licenca].[base_id]    = :base_id    AND ');
  locADOQuery.SQL.Add('  [numerador_licenca].[codigo]     = :codigo         ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value := locLicencaID;
  locADOQuery.Parameters.ParamByName('base_id').Value    := locBaseID;
  locADOQuery.Parameters.ParamByName('codigo').Value     := locCodigo;

  try
    locADOQuery.ExecSQL;
  except
    on locExcecao: Exception do
    begin
      locADOConnection.RollbackTrans;
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para deletar os registros na tabela [numerador_licenca]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Finaliza transa��o com o banco de dados.
  //
  try
    locADOConnection.CommitTrans;
  except
    on locExcecao: Exception do
    begin
      locADOConnection.RollbackTrans;
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := ERRO_MENSAGEM_BD_TRANSACAO_CONFIRMAR;
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE, locExcecao.Message);
      Exit
    end;
  end;  

  //
  // Limpa os componentes do formul�rio.
  //
  FormularioLimpar;

  //
  // Desliga os componentes para edi��o e ajusta a visibilidade dos bot�es.
  //
  FormularioControlar(False);

  //
  // Indica que os dados foram atualizados.
  //
  pubDadosAtualizados := True;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);

  //
  // Log de ocorr�ncia.
  //
  try
    Plataforma_ERP_ADO_LogOcorrenciaInserir(REGISTRO_ACAO_EXCLUSAO, 0, locCodigo, 'numerador_licenca', 'Registro exclu�do com sucesso!', locNumeradorLicencaLogDados);
  except
  end;
  VCLInformacaoExibir('Numerador por licen�a exclu�do com sucesso!');
end;

//
// Procedimento para cancelar a edi��o dos dados do formul�rio.
//
procedure TPlataformaERPVCLNumeradorLicencaCadastro.FormularioCancelar;
var
  locLicencaID: Integer;
  locBaseID   : Integer;
  locCodigo   : string;
begin
  //
  // Carrega chave do registro que estava sendo editado.
  //
  locLicencaID := StringIntegerConverter(edtLicencaID.Text);
  locBaseID    := StringIntegerConverter(edtBaseID.Text);
  locCodigo    := StringTrim(edtCodigo.Text);

  //
  // Confirma com o usu�rio.
  //
  if chkCadastroNovo.Checked then
  begin
    if not VCLQuestionamentoExibir('Deseja realmente cancelar a digita��o destes dados?') then Exit;
  end
  else
  begin
    if not VCLQuestionamentoExibir('Deseja realmente cancelar a altera��o destes dados?') then Exit;
  end;

  //
  // Popula somente os dados.
  //
  FormularioPopular(locLicencaID, locBaseID, locCodigo);

  //
  // Componentes desligados para edi��o.
  //
  FormularioControlar(False);
end;

//
// Fun��o para gerar a string de log dos dados.
//
function TPlataformaERPVCLNumeradorLicencaCadastro.LogDadosGerar: string;
begin
  Result := '';
  LogDadosStringDescrever ('Licen�a',                       edtLicencaID.Text,    Result);
  LogDadosStringDescrever ('Base do numerador por licen�a', edtBaseID.Text,       Result);
  LogDadosStringDescrever ('C�digo',                        edtCodigo.Text,       Result);
  LogDadosStringDescrever ('ID atual',                      edtAtualID.Text,      Result);
  LogDadosBooleanDescrever('Bloqueado',                     chkBloqueado.Checked, Result);
  LogDadosBooleanDescrever('Ativo',                         chkAtivo.Checked,     Result);
end;

end.
