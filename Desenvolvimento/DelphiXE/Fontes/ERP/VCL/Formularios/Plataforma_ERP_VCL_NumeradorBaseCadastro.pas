//
// Arquivo..: Plataforma_ERP_VCL_NumeradorBaseCadastro.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 14/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com o cadastro de numeradores por base.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_NumeradorBaseCadastro;

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
  TPlataformaERPVCLNumeradorBaseCadastro = class(TForm)
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

    procedure FormularioPopular(argCodigo: string);

    procedure FormularioAlterar;
    procedure FormularioGravar;
    procedure FormularioCancelar;
    procedure FormularioExcluir;
    function  LogDadosGerar: string;
  public
    pubDadosAtualizados: Boolean;
    pubCodigo          : string;
  end;

var
  PlataformaERPVCLNumeradorBaseCadastro: TPlataformaERPVCLNumeradorBaseCadastro;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_NumeradorBaseCadastro.pas';

  TAB_CADASTRO : Byte = 0;
  TAB_AUDITORIA: Byte = 1;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas.
  //
  pubDadosAtualizados := False;
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
procedure TPlataformaERPVCLNumeradorBaseCadastro.FormShow(Sender: TObject);
begin
  //
  // Background do formul�rio.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Controla os componentes de exibi��o de cadastro.
  //
  VCLEditClickControlar(edtInsLocalDtHr, False);
  VCLEditClickControlar(edtUpdLocalDtHr, False);
  
  //
  // Se nenhuma chave foi passada ent�o � um novo cadastro.
  //
  if (pubCodigo = '') then
  begin
    FormularioNovo;
    Exit;
  end;

  //
  // Se foi passada uma chave ent�o popula formul�rio.
  //
  if (pubCodigo <> '') then
  begin
    FormularioPopular(pubCodigo);
    FormularioControlar(False);
    Exit;
  end;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas op��es do menu.
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

procedure TPlataformaERPVCLNumeradorBaseCadastro.mniNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

procedure TPlataformaERPVCLNumeradorBaseCadastro.mniExcluirClick(Sender: TObject);
begin
  FormularioExcluir;
end;

procedure TPlataformaERPVCLNumeradorBaseCadastro.mniAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

procedure TPlataformaERPVCLNumeradorBaseCadastro.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

procedure TPlataformaERPVCLNumeradorBaseCadastro.mniCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

procedure TPlataformaERPVCLNumeradorBaseCadastro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLNumeradorBaseCadastro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "c�digo".
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.edtCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigo) then Exit;
end;

procedure TPlataformaERPVCLNumeradorBaseCadastro.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLNumeradorBaseCadastro.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLNumeradorBaseCadastro.edtCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigo) then Exit;
end;

//
// Eventos do componente "ID atual".
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.edtAtualIDEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtAtualID) then Exit;
end;

procedure TPlataformaERPVCLNumeradorBaseCadastro.edtAtualIDKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLNumeradorBaseCadastro.edtAtualIDKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLNumeradorBaseCadastro.edtAtualIDExit(Sender: TObject);
begin
  if not VCLEditSair(edtAtualID) then Exit;
end;

//
// Eventos do componente "bloqueado".
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.chkBloqueadoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkBloqueado) then Exit;
end;

procedure TPlataformaERPVCLNumeradorBaseCadastro.chkBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLNumeradorBaseCadastro.chkBloqueadoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkBloqueado) then Exit;
end;

//
// Ativo.
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.chkAtivoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkAtivo) then Exit;
end;

procedure TPlataformaERPVCLNumeradorBaseCadastro.chkAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLNumeradorBaseCadastro.chkAtivoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkAtivo) then Exit;
end;

//
// Evento de click na data de cria��o.
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.edtInsLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtInsLocalDtHr.Text));
end;

//
// Evento de click na data da �ltima altera��o.
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.edtUpdLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtUpdLocalDtHr.Text));
end;

//
// Evento de click no bot�o "novo".
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.btnNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

//
// Evento de click no bot�o "alterar".
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.btnAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

//
// Evento de click no bot�o "gravar".
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no bot�o "minimizar".
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "cancelar".
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.btnCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.FormularioLimpar;
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
  VCLEditLimpar(edtInsLocalDtHr);
  VCLEditLimpar(edtUpdLocalDtHr);
  VCLEditLimpar(edtUpdContador);
end;

//
// Procedimento para controlar os componentes do formul�rio.
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.FormularioControlar(argEditar: Boolean);
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
  VCLEditClickControlar(edtInsLocalDtHr, True);
  VCLEditClickControlar(edtUpdLocalDtHr, True);

  //
  // Controla os itens de menu do formul�rio.
  //
  mniAtualizar.Visible := (not argEditar) and (locDadosPopulados);
  mniNovo.Visible      := (not argEditar);
  mniExcluir.Visible   := (not argEditar) and (locDadosPopulados);
  mniAlterar.Visible   := (not argEditar) and (locDadosPopulados);
  mniGravar.Visible    := (argEditar);
  mniCancelar.Visible  := (argEditar);
  mniMinimizar.Visible := True;
  mniFechar.Visible    := (not argEditar);

  //
  // Permiss�es de acesso por VCL_DIGITACAO_ALFANUMERICA.
  //
  tabCadastro.TabVisible  := Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_BASE_CADASTRO_ABA_CADASTRO');
  tabAuditoria.TabVisible := Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_BASE_CADASTRO_ABA_AUDITORIA');
      
  mniAtualizar.Visible := (mniAtualizar.Visible) and (Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_BASE_CADASTRO_ATUALIZAR'));
  mniNovo.Visible      := (mniNovo.Visible)      and (Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_BASE_CADASTRO_NOVO'));
  mniExcluir.Visible   := (mniExcluir.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_BASE_CADASTRO_EXCLUIR'));
  mniAlterar.Visible   := (mniAlterar.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_BASE_CADASTRO_ALTERAR'));

  //
  // Bot�es.
  //
  btnNovo.Visible      := mniNovo.Visible;
  btnAlterar.Visible   := mniAlterar.Visible;
  btnGravar.Visible    := mniGravar.Visible;
  btnMinimizar.Visible := mniMinimizar.Visible;
  btnCancelar.Visible  := mniCancelar.Visible;
  btnFechar.Visible    := mniFechar.Visible;

  //
  // Ajusta o t�tulo do formul�rio.
  //
  Self.Caption     := 'Numerador por base';
  locIdentificador := ': ' + edtCodigo.Text;

  if (not locDadosPopulados) and (argEditar) then Self.Caption := Self.Caption + ' - novo cadastro';
  if locDadosPopulados and argEditar         then Self.Caption := Self.Caption + ' - alterando cadastro'   + locIdentificador;
  if locDadosPopulados and (not argEditar)   then Self.Caption := Self.Caption + ' - consultando cadastro' + locIdentificador;
end;

//
// Procedimento para atualizar os dados populados nos componentes do formul�rio.
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.FormularioAtualizar;
begin
  //
  // Popula componentes com as informa��es do cadastro.
  //
  FormularioPopular(edtCodigo.Text);

  //
  // Controla a exibi��o dos componentes.
  //
  FormularioControlar(False);
end;

//
// Procedimento para iniciar a digita��o de dados de um novo cadastro.
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.FormularioNovo;
begin
  //
  // Limpa os componentes do formul�rio.
  //
  FormularioLimpar;

  //
  // Carrega conte�do dos campos necess�rios.
  //
  chkCadastroNovo.Checked := True;
  chkAtivo.Checked        := True;

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
procedure TPlataformaERPVCLNumeradorBaseCadastro.FormularioPopular(argCodigo: string);
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
  ERRO_MENSAGEM    : string = 'Imposs�vel consultar dados do numerador por base!';
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
  // Consulta dados do numerador por base.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                ');
  locADOQuery.SQL.Add('  [numerador_base].[codigo],          ');
  locADOQuery.SQL.Add('  [numerador_base].[atual_id],        ');
  locADOQuery.SQL.Add('  [numerador_base].[bloqueado],       ');
  locADOQuery.SQL.Add('  [numerador_base].[ativo],           ');
  locADOQuery.SQL.Add('  [numerador_base].[ins_local_dt_hr], ');
  locADOQuery.SQL.Add('  [numerador_base].[upd_local_dt_hr], ');
  locADOQuery.SQL.Add('  [numerador_base].[upd_contador]     ');
  locADOQuery.SQL.Add('FROM                                  ');
  locADOQuery.SQL.Add('  [numerador_base] WITH (NOLOCK)      ');
  locADOQuery.SQL.Add('WHERE                                 ');
  locADOQuery.SQL.Add('  [numerador_base].[codigo] = :codigo ');

  locADOQuery.Parameters.ParamByName('codigo').Value  := argCodigo;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [numerador_base]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Registro encontrado.
  //
  if locADOQuery.RecordCount > 0 then
  begin
    //
    // Carrega componentes.
    //
    edtCodigo.Text          := locADOQuery.FieldByName('codigo').AsString;
    edtAtualID.Text         := IntegerStringConverter(locADOQuery.FieldByName('atual_id').AsInteger);
    chkCadastroNovo.Checked := False;
    chkBloqueado.Checked    := StringBooleanConverter(locADOQuery.FieldByName('bloqueado').AsString);
    chkAtivo.Checked        := StringBooleanConverter(locADOQuery.FieldByName('ativo').AsString);

    edtInsLocalDtHr.Text    := DateTimeStringConverter(locADOQuery.FieldByName('ins_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn:ss');
    edtUpdLocalDtHr.Text    := DateTimeStringConverter(locADOQuery.FieldByName('upd_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn:ss');
    edtUpdContador.Text     := IntegerStringConverter(locADOQuery.FieldByName('upd_contador').AsInteger);
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
procedure TPlataformaERPVCLNumeradorBaseCadastro.FormularioAlterar;
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
procedure TPlataformaERPVCLNumeradorBaseCadastro.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioGravar';
  ERRO_MENSAGEM    : string = 'Imposs�vel gravar dados do numerador por base!';
var
  locADOConnection        : TADOConnection;
  locADOQuery             : TADOQuery;
  locLogMensagem          : string;

  locInsert               : Boolean;
  locRegistroAcao         : Byte;
  locNumeradorBaseLogMsg  : string;
  locNumeradorBaseLogDados: string;

  locCodigo               : string;
  locAtualID              : Integer;
  locBloqueado            : Boolean;
  locAtivo                : Boolean;
  locInsLocalDtHr         : TDateTime;
  locUpdLocalDtHr         : TDateTime;
  locUpdContador          : Integer;
  locHostName             : string;
  locUserName             : string;
begin
  //
  // Determina se ser� um insert ou update.
  //
  locInsert := chkCadastroNovo.Checked;

  //
  // Carrega vari�veis com o conte�do dos componentes.
  //
  locCodigo      := StringTrim(edtCodigo.Text);
  locAtualID     := StringIntegerConverter(edtAtualID.Text);
  locBloqueado   := chkBloqueado.Checked;
  locAtivo       := chkAtivo.Checked;
  locHostName    := HostNameRecuperar;
  locUserName    := UserNameRecuperar;
  locUpdContador := StringIntegerConverter(edtUpdContador.Text);

  //
  // Consiste as informa��es.
  //
  if locCodigo = '' then
  begin
    VCLConsistenciaExibir('O c�digo do numerador por base deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
    Exit;
  end;

  if locAtualID < 0 then
  begin
    VCLConsistenciaExibir('O ID atual do numerador por base n�o deve ser um n�mero negativo!');
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
  // Determina se o c�digo do numerador por base j� existe no banco de dados para um outro registro.
  //
  if locInsert then
  begin
    locADOQuery.Close;
    locADOQuery.SQL.Clear;
    locADOQuery.SQL.Add('SELECT TOP 1                          ');
    locADOQuery.SQL.Add('  1                                   ');
    locADOQuery.SQL.Add('FROM                                  ');
    locADOQuery.SQL.Add('  [numerador_base] WITH (NOLOCK)      ');
    locADOQuery.SQL.Add('WHERE                                 ');
    locADOQuery.SQL.Add('  [numerador_base].[codigo] = :codigo ');

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
        locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar o mesmo c�digo de numerador por base em um outro registro!';
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
      locLogMensagem := 'O c�digo "' + locCodigo + '" informado para o numerador por base j� existe em algum outro cadastro!';
      Plataforma_ERP_Logar(False, ERRO_MENSAGEM, locLogMensagem, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLConsistenciaExibir(ERRO_MENSAGEM, locLogMensagem);
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
    locADOQuery.SQL.Add('SELECT                                ');
    locADOQuery.SQL.Add('  [numerador_base].[upd_contador]     ');
    locADOQuery.SQL.Add('FROM                                  ');
    locADOQuery.SQL.Add('  [numerador_base] WITH (NOLOCK)      ');
    locADOQuery.SQL.Add('WHERE                                 ');
    locADOQuery.SQL.Add('  [numerador_base].[codigo] = :codigo ');

    locADOQuery.Parameters.ParamByName('codigo').Value := locCodigo;

    try
      locADOQuery.Open;
    except
      on locExcecao: Exception do
      begin
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualiza��es confere na tabela [numerador_base]!';
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
    locRegistroAcao        := REGISTRO_ACAO_CRIACAO;
    locNumeradorBaseLogMsg := MENSAGEM_REGISTRO_ACAO_CRIADO;
  end
  else
  begin
    locRegistroAcao        := REGISTRO_ACAO_ALTERACAO;
    locNumeradorBaseLogMsg := MENSAGEM_REGISTRO_ACAO_ALTERADO;
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
  // Grava dados na tabela numerador_base.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;

  if locInsert then
  begin
    //
    // Insere dados.
    //
    locADOQuery.SQL.Add('INSERT INTO [numerador_base] (');
    locADOQuery.SQL.Add('  [codigo],                   ');
    locADOQuery.SQL.Add('  [atual_id],                 ');
    locADOQuery.SQL.Add('  [bloqueado],                ');
    locADOQuery.SQL.Add('  [ativo],                    ');
    locADOQuery.SQL.Add('  [ins_local_dt_hr],          ');
    locADOQuery.SQL.Add('  [ins_server_dt_hr],         ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr],          ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr],         ');
    locADOQuery.SQL.Add('  [upd_contador]              ');  
    locADOQuery.SQL.Add(')                             ');
    locADOQuery.SQL.Add('VALUES (                      ');
    locADOQuery.SQL.Add('  :codigo,                    '); // [codigo].
    locADOQuery.SQL.Add('  :atual_id,                  '); // [atual_id].
    locADOQuery.SQL.Add('  :bloqueado,                 '); // [bloqueado].
    locADOQuery.SQL.Add('  :ativo,                     '); // [ativo].
    locADOQuery.SQL.Add('  :local_dt_hr,               '); // [ins_local_dt_hr].
    locADOQuery.SQL.Add('  GETDATE(),                  '); // [ins_server_dt_hr].
    locADOQuery.SQL.Add('  NULL,                       '); // [upd_local_dt_hr].
    locADOQuery.SQL.Add('  NULL,                       '); // [upd_server_dt_hr].
    locADOQuery.SQL.Add('  0                           '); // [upd_contador].
    locADOQuery.SQL.Add(')                             ');
  end
  else
  begin
    //
    // Atualiza dados.
    //
    locADOQuery.SQL.Add('UPDATE                                    ');
    locADOQuery.SQL.Add('  [numerador_base]                        ');
    locADOQuery.SQL.Add('SET                                       ');
    locADOQuery.SQL.Add('  [atual_id]         = :atual_id,         ');
    locADOQuery.SQL.Add('  [bloqueado]        = :bloqueado,        ');
    locADOQuery.SQL.Add('  [ativo]            = :ativo,            ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr]  = :local_dt_hr,      ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr] = GETDATE(),         ');
    locADOQuery.SQL.Add('  [upd_contador]     = [upd_contador] + 1 ');
    locADOQuery.SQL.Add('WHERE                                     ');
    locADOQuery.SQL.Add('  [codigo] = :codigo                      ');
  end;

  //
  // Par�metros.
  //
  locADOQuery.Parameters.ParamByName('codigo').Value      := locCodigo;
  locADOQuery.Parameters.ParamByName('atual_id').Value    := locAtualID;
  locADOQuery.Parameters.ParamByName('bloqueado').Value   := BooleanStringConverter(locBloqueado);
  locADOQuery.Parameters.ParamByName('ativo').Value       := BooleanStringConverter(locAtivo);
  locADOQuery.Parameters.ParamByName('local_dt_hr').Value := Now;  

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [numerador_base]!';
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
  locADOQuery.SQL.Add('SELECT                                ');
  locADOQuery.SQL.Add('  [numerador_base].[ins_local_dt_hr], ');
  locADOQuery.SQL.Add('  [numerador_base].[upd_local_dt_hr], ');
  locADOQuery.SQL.Add('  [numerador_base].[upd_contador]     ');
  locADOQuery.SQL.Add('FROM                                  ');
  locADOQuery.SQL.Add('  [numerador_base]                    ');
  locADOQuery.SQL.Add('WHERE                                 ');
  locADOQuery.SQL.Add('  [numerador_base].[codigo] = :codigo ');

  locADOQuery.Parameters.ParamByName('codigo').Value := locCodigo;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o novo contador de updates do registro na tabela [numerador_base]!';
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
  locNumeradorBaseLogDados := LogDadosGerar;

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
  edtInsLocalDtHr.Text  := DateTimeStringConverter(locInsLocalDtHr, 'dd/mm/yyyy hh:nn:ss');
  edtUpdLocalDtHr.Text  := DateTimeStringConverter(locUpdLocalDtHr, 'dd/mm/yyyy hh:nn:ss');
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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, 0, locCodigo, 'numerador_base', locNumeradorBaseLogMsg, locNumeradorBaseLogDados);
  except
    on locExcecao: Exception do
    begin
      VCLErroExibir(locExcecao.Message);
    end;
  end;

  //
  // Numerador por base gravado!
  //
  VCLInformacaoExibir('Numerador por base gravado com sucesso!');
end;

//
// Procedimento para excluir os dados deste cadastro.
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.FormularioExcluir;
const
  PROCEDIMENTO_NOME: string = 'FormularioExcluir';
  ERRO_MENSAGEM    : string = 'Imposs�vel excluir dados do numerador por base!';
var
  locADOConnection        : TADOConnection;
  locADOQuery             : TADOQuery;
  locLogMensagem          : string;
  locCodigo               : string;
  locNumeradorBaseLogDados: string;
begin
  //
  // Carrega vari�veis com o conte�do dos componentes.
  //
  locCodigo := StringTrim(edtCodigo.Text);

  //
  // Log dados.
  //
  locNumeradorBaseLogDados := LogDadosGerar;

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
  // Comando SQL para excluir um registro da tabela numerador_base.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                           ');
  locADOQuery.SQL.Add('  [numerador_base]                    ');
  locADOQuery.SQL.Add('WHERE                                 ');
  locADOQuery.SQL.Add('  [numerador_base].[codigo] = :codigo ');

  locADOQuery.Parameters.ParamByName('codigo').Value := locCodigo;

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
      locLogMensagem := 'Ocorreu algum problema ao executar query para deletar os registros na tabela [numerador_base]!';
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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(REGISTRO_ACAO_EXCLUSAO, 0, locCodigo, 'numerador_base', 'Registro exclu�do com sucesso!', locNumeradorBaseLogDados);
  except
  end;
  VCLInformacaoExibir('Numerador por base exclu�do com sucesso!');
end;

//
// Procedimento para cancelar a edi��o dos dados do formul�rio.
//
procedure TPlataformaERPVCLNumeradorBaseCadastro.FormularioCancelar;
var
  locCodigo: string;
begin
  //
  // Carrega chave do registro que estava sendo editado.
  //
  locCodigo := StringTrim(edtCodigo.Text);

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
  FormularioPopular(locCodigo);

  //
  // Componentes desligados para edi��o.
  //
  FormularioControlar(False);
end;

//
// Fun��o para gerar a string de log dos dados.
//
function TPlataformaERPVCLNumeradorBaseCadastro.LogDadosGerar: string;
begin
  Result := '';
  LogDadosStringDescrever ('C�digo',    edtCodigo.Text,       Result);
  LogDadosStringDescrever ('ID atual',  edtAtualID.Text,      Result);
  LogDadosBooleanDescrever('Bloqueado', chkBloqueado.Checked, Result);
  LogDadosBooleanDescrever('Ativo',     chkAtivo.Checked,     Result);
end;

end.
