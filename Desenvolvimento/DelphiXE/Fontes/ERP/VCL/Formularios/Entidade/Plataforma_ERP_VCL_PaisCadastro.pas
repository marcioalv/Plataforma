//
// Arquivo..: Plataforma_ERP_VCL_PaisCadastro.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 14/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com o cadastro do país.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_PaisCadastro;

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
  TPlataformaERPVCLPaisCadastro = class(TForm)
    imgFormulario: TImage;
    pagFormulario: TPageControl;
    tabCadastro: TTabSheet;
    tabAuditoria: TTabSheet;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    lblNome: TLabel;
    edtNome: TEdit;
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
    lblPaisID: TLabel;
    edtPaisID: TEdit;
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
    lblCodigoCadastrado: TLabel;
    edtCodigoCadastrado: TEdit;
    edtCodigoCadastradoID: TEdit;
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
    procedure edtNomeEnter(Sender: TObject);
    procedure edtNomeExit(Sender: TObject);
    procedure edtNomeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
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
    procedure edtCodigoCadastradoClick(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioControlar(argEditar: Boolean);
    procedure FormularioAtualizar;
    procedure FormularioNovo;

    procedure FormularioPopular(argPaisID: Integer);

    procedure FormularioAlterar;
    procedure FormularioGravar;
    procedure FormularioCancelar;
    procedure FormularioExcluir;
    procedure FormularioCodigoSugerir;
    function  LogDadosGerar(argPaisID: Integer = 0): string;
  public
    pubDadosAtualizados: Boolean;
    pubPaisID          : Integer;
  end;

var
  PlataformaERPVCLPaisCadastro: TPlataformaERPVCLPaisCadastro;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_PaisCadastro.pas';

  TAB_CADASTRO : Byte = 0;
  TAB_AUDITORIA: Byte = 1;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLPaisCadastro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas.
  //
  pubDadosAtualizados := False;
  pubPaisID           := 0;
 
  //
  // Limpa os componentes do formulário.
  //
  FormularioLimpar;

  //
  // Componentes desligados para edição.
  //
  FormularioControlar(False);
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLPaisCadastro.FormShow(Sender: TObject);
begin
  //
  // Background do formulário.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);
 
  //
  // Se nenhuma chave foi passada então é um novo cadastro.
  //
  if pubPaisID = 0 then
  begin
    FormularioNovo;
    Exit;
  end;

  //
  // Se foi passada uma chave então popula formulário.
  //
  if pubPaisID > 0 then
  begin
    FormularioPopular(pubPaisID);
    FormularioControlar(False);
    Exit;
  end;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLPaisCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLPaisCadastro.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

procedure TPlataformaERPVCLPaisCadastro.mniNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

procedure TPlataformaERPVCLPaisCadastro.mniExcluirClick(Sender: TObject);
begin
  FormularioExcluir;
end;

procedure TPlataformaERPVCLPaisCadastro.mniAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

procedure TPlataformaERPVCLPaisCadastro.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

procedure TPlataformaERPVCLPaisCadastro.mniCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

procedure TPlataformaERPVCLPaisCadastro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLPaisCadastro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "código".
//
procedure TPlataformaERPVCLPaisCadastro.edtCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigo) then Exit;
end;

procedure TPlataformaERPVCLPaisCadastro.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLPaisCadastro.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLPaisCadastro.edtCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigo) then Exit;
end;

//
// Evento de click no código sugerido.
//
procedure TPlataformaERPVCLPaisCadastro.edtCodigoCadastradoClick(Sender: TObject);
var
  locFormulario      : TPlataformaERPVCLPaisCadastro;
  locDadosAtualizados: Boolean;
begin
  locFormulario := TPlataformaERPVCLPaisCadastro.Create(Self);

  locFormulario.pubPaisID := StringIntegerConverter(edtPaisID.Text);

  locFormulario.ShowModal;

  locDadosAtualizados := locFormulario.pubDadosAtualizados;

  locFormulario.Release;
  FreeAndNil(locFormulario);

  if locDadosAtualizados then
  begin
    FormularioCodigoSugerir;
  end;
end;

//
// Eventos do componente "nome".
//
procedure TPlataformaERPVCLPaisCadastro.edtNomeEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtNome) then Exit;
end;

procedure TPlataformaERPVCLPaisCadastro.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLPaisCadastro.edtNomeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLPaisCadastro.edtNomeExit(Sender: TObject);
begin
  if not VCLEditSair(edtNome) then Exit;
end;

//
// Eventos do componente "bloqueado".
//
procedure TPlataformaERPVCLPaisCadastro.chkBloqueadoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkBloqueado) then Exit;
end;

procedure TPlataformaERPVCLPaisCadastro.chkBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLPaisCadastro.chkBloqueadoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkBloqueado) then Exit;
end;

//
// Eventos do componente "ativo".
//
procedure TPlataformaERPVCLPaisCadastro.chkAtivoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkAtivo) then Exit;
end;

procedure TPlataformaERPVCLPaisCadastro.chkAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLPaisCadastro.chkAtivoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkAtivo) then Exit;
end;

//
// Evento de click na data de criação.
//
procedure TPlataformaERPVCLPaisCadastro.edtInsLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtInsLocalDtHr.Text));
end;

//
// Evento de click na data da última alteração.
//
procedure TPlataformaERPVCLPaisCadastro.edtUpdLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtUpdLocalDtHr.Text));
end;

//
// Evento de click no botão "novo".
//
procedure TPlataformaERPVCLPaisCadastro.btnNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

//
// Evento de click no botão "alterar".
//
procedure TPlataformaERPVCLPaisCadastro.btnAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

//
// Evento de click no botão "gravar".
//
procedure TPlataformaERPVCLPaisCadastro.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLPaisCadastro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "cancelar".
//
procedure TPlataformaERPVCLPaisCadastro.btnCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLPaisCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLPaisCadastro.FormularioLimpar;
begin 
  //
  // Posiciona pagecontrole na primeira aba.
  //
  VCLPageControlInicializar(pagFormulario);

  // Limpa componentes da aba "cadastro".
  VCLEditLimpar    (edtCodigo);
  VCLEditLimpar    (edtNome);

  VCLCheckBoxLimpar(chkBloqueado);
  VCLCheckBoxLimpar(chkAtivo);

  VCLEditLimpar(edtCodigoCadastrado);
  VCLEditLimpar(edtCodigoCadastradoID);

  //
  // Limpa componentes da aba "auditoria".
  //
  VCLEditLimpar(edtPaisID);
  VCLEditLimpar(edtInsLocalDtHr);
  VCLEditLimpar(edtUpdLocalDtHr);
  VCLEditLimpar(edtUpdContador);

  //
  // Controla os componentes de exibição de cadastro.
  //
  VCLEditClickControlar(edtCodigoCadastrado, False);
  VCLEditClickControlar(edtInsLocalDtHr,     False);
  VCLEditClickControlar(edtUpdLocalDtHr,     False);  
end;

//
// Procedimento para controlar os componentes do formulário.
//
procedure TPlataformaERPVCLPaisCadastro.FormularioControlar(argEditar: Boolean);
var
  locDadosPopulados: Boolean;
  locIdentificador : string;
begin
  //
  // Determina se existem dados populados no formulário.
  //
  locDadosPopulados := (StringIntegerConverter(edtPaisID.Text) > 0);

  //
  // Controla os componentes do formulário.
  //
  VCLEditControlar(edtCodigo,    argEditar);
  VCLEditControlar(edtNome, argEditar);

  gbxOpcoes.Enabled := argEditar;

  //
  // Exibe o último código cadastrado somente se for um novo cadastro.
  //
  lblCodigoCadastrado.Visible := (argEditar) and (not locDadosPopulados);
  edtCodigoCadastrado.Visible := (argEditar) and (not locDadosPopulados);

  //
  // Controla os componentes de exibição de cadastro.
  //
  VCLEditClickControlar(edtInsLocalDtHr, True);
  VCLEditClickControlar(edtUpdLocalDtHr, True);

  //
  // Controla os itens de menu do formulário.
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
  // Permissões de acesso por usuário.
  //
  tabCadastro.TabVisible  := Plataforma_ERP_UsuarioRotina('ERP_PAIS_CADASTRO_ABA_CADASTRO');
  tabAuditoria.TabVisible := Plataforma_ERP_UsuarioRotina('ERP_PAIS_CADASTRO_ABA_AUDITORIA');
      
  mniAtualizar.Visible := (mniAtualizar.Visible) and (Plataforma_ERP_UsuarioRotina('ERP_PAIS_CADASTRO_ATUALIZAR'));
  mniNovo.Visible      := (mniNovo.Visible)      and (Plataforma_ERP_UsuarioRotina('ERP_PAIS_CADASTRO_NOVO'));
  mniExcluir.Visible   := (mniExcluir.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_PAIS_CADASTRO_EXCLUIR'));
  mniAlterar.Visible   := (mniAlterar.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_PAIS_CADASTRO_ALTERAR'));

  //
  // Botões.
  //
  btnNovo.Visible      := mniNovo.Visible;
  btnAlterar.Visible   := mniAlterar.Visible;
  btnGravar.Visible    := mniGravar.Visible;
  btnMinimizar.Visible := mniMinimizar.Visible;
  btnCancelar.Visible  := mniCancelar.Visible;
  btnFechar.Visible    := mniFechar.Visible;

  //
  // Ajusta o título do formulário.
  //
  Self.Caption     := 'País';
  locIdentificador := ': ' + edtNome.Text;

  if (not locDadosPopulados) and (argEditar) then Self.Caption := Self.Caption + ' - novo cadastro';
  if locDadosPopulados and argEditar         then Self.Caption := Self.Caption + ' - alterando cadastro'   + locIdentificador;
  if locDadosPopulados and (not argEditar)   then Self.Caption := Self.Caption + ' - consultando cadastro' + locIdentificador;
end;

//
// Procedimento para atualizar os dados populados nos componentes do formulário.
//
procedure TPlataformaERPVCLPaisCadastro.FormularioAtualizar;
begin
  //
  // Popula componentes com as informações do cadastro.
  //
  FormularioPopular(StringIntegerConverter(edtPaisID.Text));

  //
  // Controla a exibição dos componentes.
  //
  FormularioControlar(False);
end;

//
// Procedimento para iniciar a digitação de dados de um novo cadastro.
//
procedure TPlataformaERPVCLPaisCadastro.FormularioNovo;
begin
  //
  // Limpa os componentes do formulário.
  //
  FormularioLimpar;

  //
  // Carrega conteúdo dos campos necessários.
  //
  edtPaisID.Text   := STR_NOVO;
  chkAtivo.Checked := True;

  //
  // Exibe o último código cadastrado.
  //
  FormularioCodigoSugerir;

  //
  // Componentes ligados para edição.
  //
  FormularioControlar(True);
  
  //
  // Coloca o foco no código.
  //
  VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
end;

//
// Procedimento para popular os componentes com os dados de um cadastro.
//
procedure TPlataformaERPVCLPaisCadastro.FormularioPopular(argPaisID: Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
  ERRO_MENSAGEM    : string = 'Impossível consultar dados do país!';
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
  // Limpa os componentes do formulário.
  //
  FormularioLimpar;

  //
  // Conexão ao banco de dados.
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
  // Consulta dados do país.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                        ');
  locADOQuery.SQL.Add('  [pais].[pais_id],           ');
  locADOQuery.SQL.Add('  [pais].[codigo],            ');
  locADOQuery.SQL.Add('  [pais].[nome],              ');
  locADOQuery.SQL.Add('  [pais].[bloqueado],         ');
  locADOQuery.SQL.Add('  [pais].[ativo],             ');
  locADOQuery.SQL.Add('  [pais].[ins_local_dt_hr],   ');
  locADOQuery.SQL.Add('  [pais].[upd_local_dt_hr],   ');
  locADOQuery.SQL.Add('  [pais].[upd_contador]       ');  
  locADOQuery.SQL.Add('FROM                          ');
  locADOQuery.SQL.Add('  [pais] WITH (NOLOCK)        ');
  locADOQuery.SQL.Add('WHERE                         ');
  locADOQuery.SQL.Add('  [pais].[pais_id] = :pais_id ');

  locADOQuery.Parameters.ParamByName('pais_id').Value := argPaisID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [pais]!';
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
    edtCodigo.Text := locADOQuery.FieldByName('codigo').AsString;
    edtNome.Text   := locADOQuery.FieldByName('nome').AsString;

    chkBloqueado.Checked := StringBooleanConverter(locADOQuery.FieldByName('bloqueado').AsString);
    chkAtivo.Checked     := StringBooleanConverter(locADOQuery.FieldByName('ativo').AsString);

    edtPaisID.Text       := IntegerStringConverter(locADOQuery.FieldByName('pais_id').AsInteger, True);
    edtInsLocalDtHr.Text := DateTimeStringConverter(locADOQuery.FieldByName('ins_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn:ss');
    edtUpdLocalDtHr.Text := DateTimeStringConverter(locADOQuery.FieldByName('upd_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn:ss');
    edtUpdContador.Text  := IntegerStringConverter(locADOQuery.FieldByName('upd_contador').AsInteger);
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
// Procedimento para alterar os dados do formulário.
//
procedure TPlataformaERPVCLPaisCadastro.FormularioAlterar;
begin
  //
  // Componentes ligados para edição.
  //
  FormularioControlar(True);

  //
  // Coloca o foco no código.
  //
  VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
end;

//
// Procedimento para gravar os dados do formulário.
//
procedure TPlataformaERPVCLPaisCadastro.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioGravar';
  ERRO_MENSAGEM    : string = 'Impossível gravar dados do país!';
var
  locADOConnection : TADOConnection;
  locADOQuery      : TADOQuery;
  locLogMensagem   : string;

  locInsert        : Boolean;
  locRegistroAcao  : Byte;
  locPaisLogSq     : Integer;
  locPaisLogMsg    : string;
  locPaisLogDados  : string;

  locPaisID        : Integer;
  locCodigo        : string;
  locNome          : string;
  locBloqueado     : Boolean;
  locAtivo         : Boolean;
  locInsLocalDtHr  : TDateTime;
  locUpdLocalDtHr  : TDateTime;
  locUsuarioBaseID : Integer;
  locUsuarioID     : Integer;
  locUpdContador   : Integer;
  locHostName      : string;
  locUserName      : string;
begin
  //
  // Determina se será um insert ou update.
  //
  if edtPaisID.Text = STR_NOVO then
    locInsert := True
  else
    locInsert := False;

  //
  // Carrega variáveis com o conteúdo dos componentes.
  //
  locPaisID        := StringIntegerConverter(edtPaisID.Text);
  locCodigo        := StringTrim(edtCodigo.Text);
  locNome          := StringTrim(edtNome.Text);
  locBloqueado     := chkBloqueado.Checked;
  locAtivo         := chkAtivo.Checked;
  locUsuarioBaseID := gloUsuarioBaseID;
  locUsuarioID     := gloUsuarioID;
  locHostName      := HostNameRecuperar;
  locUserName      := UserNameRecuperar;
  locUpdContador   := StringIntegerConverter(edtUpdContador.Text);

  //
  // Consiste as informações.
  //
  if locCodigo = '' then
  begin
    VCLConsistenciaExibir('O código do país deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
    Exit;
  end;

  if locNome = '' then
  begin
    VCLConsistenciaExibir('O nome do país deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtNome);
    Exit;
  end;

  //
  // Confirma gravação com o usuário.
  //
  if not VCLQuestionamentoExibir('Deseja realmente gravar estes dados?') then Exit;

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Conexão ao banco de dados.
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
  // Determina se o código do país já existe no banco de dados para um outro registro.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                      ');
  locADOQuery.SQL.Add('  1                               ');
  locADOQuery.SQL.Add('FROM                              ');
  locADOQuery.SQL.Add('  [pais] WITH (NOLOCK)            ');
  locADOQuery.SQL.Add('WHERE                             ');
  locADOQuery.SQL.Add('  [pais].[codigo]   = :codigo AND ');
  locADOQuery.SQL.Add('  [pais].[pais_id] <> :pais_id    ');

  locADOQuery.Parameters.ParamByName('codigo').Value  := locCodigo;
  locADOQuery.Parameters.ParamByName('pais_id').Value := locPaisID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar o mesmo código de país em um outro registro!';
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
    locLogMensagem := 'O código "' + locCodigo + '" informado para o país já existe em algum outro cadastro!';
    Plataforma_ERP_Logar(False, ERRO_MENSAGEM, locLogMensagem, FONTE_NOME, PROCEDIMENTO_NOME);
    VCLConsistenciaExibir(ERRO_MENSAGEM, locLogMensagem);
    Exit;
  end;

  //
  // Consiste o contador do update.
  //
  if not locInsert then
  begin
    locADOQuery.Close;
    locADOQuery.SQL.Clear;
    locADOQuery.SQL.Add('SELECT                        ');
    locADOQuery.SQL.Add('  [pais].[upd_contador]       ');
    locADOQuery.SQL.Add('FROM                          ');
    locADOQuery.SQL.Add('  [pais] WITH (NOLOCK)        ');
    locADOQuery.SQL.Add('WHERE                         ');
    locADOQuery.SQL.Add('  [pais].[pais_id] = :pais_id ');

    locADOQuery.Parameters.ParamByName('pais_id').Value := locPaisID;

    try
      locADOQuery.Open;
    except
      on locExcecao: Exception do
      begin
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualizações confere na tabela [pais]!';
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
        locLogMensagem := 'Esse registro sofreu alguma outra alteração entre a sua consulta e essa gravação!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE);
        Exit
      end;
    end;
  end;

  //
  // Determina o ID da ação e a mensagem para o log do registro.
  //
  if locInsert then
  begin
    locRegistroAcao := REGISTRO_ACAO_CRIACAO;
    locPaisLogMsg   := MENSAGEM_REGISTRO_ACAO_CRIADO;
  end
  else
  begin
    locRegistroAcao := REGISTRO_ACAO_ALTERACAO;
    locPaisLogMsg   := MENSAGEM_REGISTRO_ACAO_ALTERADO;
  end;

  //
  // Inicia transação com o banco de dados.
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
  // Determina o próximo ID do país.
  //
  if locInsert then
  begin
    try
      locPaisID := Plataforma_ERP_ADO_NumeradorBaseDeterminar(locADOConnection, NUMERADOR_PAIS_ID);
    except
      on locExcecao: Exception do
      begin
        locADOConnection.RollbackTrans;
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Impossível determinar o próximo numerador para o país!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
        Exit
      end;
    end;
  end;

  //
  // Grava dados na tabela país.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;

  if locInsert then
  begin
    //
    // Insere dados.
    //
    locADOQuery.SQL.Add('INSERT INTO [pais] (  ');
    locADOQuery.SQL.Add('  [pais_id],          ');
    locADOQuery.SQL.Add('  [codigo],           ');
    locADOQuery.SQL.Add('  [nome],             ');
    locADOQuery.SQL.Add('  [bloqueado],        ');
    locADOQuery.SQL.Add('  [ativo],            ');
    locADOQuery.SQL.Add('  [ins_local_dt_hr],  ');
    locADOQuery.SQL.Add('  [ins_server_dt_hr], ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr],  ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr], ');
    locADOQuery.SQL.Add('  [upd_contador]      ');
    locADOQuery.SQL.Add(')                     ');
    locADOQuery.SQL.Add('VALUES (              ');
    locADOQuery.SQL.Add('  :pais_id,           '); // [pais_id].
    locADOQuery.SQL.Add('  :codigo,            '); // [codigo].
    locADOQuery.SQL.Add('  :nome,              '); // [nome].
    locADOQuery.SQL.Add('  :bloqueado,         '); // [bloqueado].
    locADOQuery.SQL.Add('  :ativo,             '); // [ativo].
    locADOQuery.SQL.Add('  :local_dt_hr,       '); // [ins_local_dt_hr].
    locADOQuery.SQL.Add('  GETDATE(),          '); // [ins_server_dt_hr].
    locADOQuery.SQL.Add('  NULL,               '); // [upd_local_dt_hr].
    locADOQuery.SQL.Add('  NULL,               '); // [upd_server_dt_hr].
    locADOQuery.SQL.Add('  0                   '); // [upd_contador].
    locADOQuery.SQL.Add(')                     ');
  end
  else
  begin
    //
    // Atualiza dados.
    //
    locADOQuery.SQL.Add('UPDATE                                    ');
    locADOQuery.SQL.Add('  [pais]                                  ');
    locADOQuery.SQL.Add('SET                                       ');
    locADOQuery.SQL.Add('  [codigo]           = :codigo,           ');
    locADOQuery.SQL.Add('  [nome]             = :nome,             ');
    locADOQuery.SQL.Add('  [bloqueado]        = :bloqueado,        ');
    locADOQuery.SQL.Add('  [ativo]            = :ativo,            ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr]  = :local_dt_hr,      ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr] = GETDATE(),         ');
    locADOQuery.SQL.Add('  [upd_contador]     = [upd_contador] + 1 ');
    locADOQuery.SQL.Add('WHERE                                     ');
    locADOQuery.SQL.Add('  [pais_id] = :pais_id                    ');
  end;

  //
  // Parâmetros.
  //
  locADOQuery.Parameters.ParamByName('pais_id').Value     := locPaisID;
  locADOQuery.Parameters.ParamByName('codigo').Value      := locCodigo;
  locADOQuery.Parameters.ParamByName('nome').Value        := locNome;
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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [pais]!';
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
  locADOQuery.SQL.Add('SELECT                        ');
  locADOQuery.SQL.Add('  [pais].[ins_local_dt_hr],   ');
  locADOQuery.SQL.Add('  [pais].[upd_local_dt_hr],   ');
  locADOQuery.SQL.Add('  [pais].[upd_contador]       ');
  locADOQuery.SQL.Add('FROM                          ');
  locADOQuery.SQL.Add('  [pais]                      ');
  locADOQuery.SQL.Add('WHERE                         ');
  locADOQuery.SQL.Add('  [pais].[pais_id] = :pais_id ');

  locADOQuery.Parameters.ParamByName('pais_id').Value := locPaisID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o novo contador de updates do registro na tabela [pais]!';
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
  locPaisLogDados := LogDadosGerar(locPaisID);

  //
  // Finaliza transação com o banco de dados.
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
  // Atualiza componentes que sofreram alteração com a gravação.
  //
  edtPaisID.Text       := IntegerStringConverter(locPaisID);
  edtInsLocalDtHr.Text := DateTimeStringConverter(locInsLocalDtHr, 'dd/mm/yyyy hh:nn:ss');
  edtUpdLocalDtHr.Text := DateTimeStringConverter(locUpdLocalDtHr, 'dd/mm/yyyy hh:nn:ss');
  edtUpdContador.Text  := IntegerStringConverter(locUpdContador);

  //
  // Componentes desligados para edição.
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
  // Grava log de ocorrência.
  //  
  try
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, locPaisID, locCodigo, 'pais', locPaisLogMsg, locPaisLogDados);
  except
    on locExcecao: Exception do
    begin
      VCLErroExibir(locExcecao.Message);
    end;
  end;

  //
  // Pais gravado!
  //
  VCLInformacaoExibir('País gravado com sucesso!');
end;

//
// Procedimento para excluir os dados deste cadastro.
//
procedure TPlataformaERPVCLPaisCadastro.FormularioExcluir;
const
  PROCEDIMENTO_NOME: string = 'FormularioExcluir';
  ERRO_MENSAGEM    : string = 'Impossível excluir dados do país!';
var
  locADOConnection : TADOConnection;
  locADOQuery      : TADOQuery;
  locLogMensagem   : string;
  locPaisID        : Integer;
  locPaisLogDados  : string;
begin
  //
  // Carrega variáveis com o conteúdo dos componentes.
  //
  locPaisID := StringIntegerConverter(edtPaisID.Text);

  //
  // Log dados.
  //
  locPaisLogDados := LogDadosGerar;

  //
  // Confirma gravação com o usuário.
  //
  if not VCLQuestionamentoExibir('Deseja realmente excluir estes dados?') then Exit;
  if not VCLQuestionamentoExibir('Tem certeza?') then Exit;

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Conexão ao banco de dados.
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
  // Inicia transação com o banco de dados.
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
  // Comando SQL para excluir um registro da tabela país.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;                  
  locADOQuery.SQL.Add('DELETE FROM                   ');
  locADOQuery.SQL.Add('  [pais]                      ');
  locADOQuery.SQL.Add('WHERE                         ');
  locADOQuery.SQL.Add('  [pais].[pais_id] = :pais_id ');

  locADOQuery.Parameters.ParamByName('pais_id').Value := locPaisID;

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
      locLogMensagem := 'Ocorreu algum problema ao executar query para deletar os registros na tabela [pais]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Finaliza transação com o banco de dados.
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
  // Limpa os componentes do formulário.
  //
  FormularioLimpar;

  //
  // Desliga os componentes para edição e ajusta a visibilidade dos botões.
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
  // Log de ocorrência.
  //
  try
    Plataforma_ERP_ADO_LogOcorrenciaInserir(REGISTRO_ACAO_EXCLUSAO, locPaisID, edtCodigo.Text, 'pais', 'Registro excluído com sucesso!', locPaisLogDados);
  except
  end;
  VCLInformacaoExibir('País excluído com sucesso!');
end;

//
// Procedimento para cancelar a edição dos dados do formulário.
//
procedure TPlataformaERPVCLPaisCadastro.FormularioCancelar;
var
  locPaisID: Integer;
begin
  //
  // Carrega chave do registro que estava sendo editado.
  //
  locPaisID := StringIntegerConverter(edtPaisID.Text);

  //
  // Confirma com o usuário.
  //
  if locPaisID = 0 then
  begin
    if not VCLQuestionamentoExibir('Deseja realmente cancelar a digitação destes dados?') then Exit;
  end
  else
  begin
    if not VCLQuestionamentoExibir('Deseja realmente cancelar a alteração destes dados?') then Exit;
  end;

  //
  // Popula somente os dados.
  //
  FormularioPopular(locPaisID);

  //
  // Componentes desligados para edição.
  //
  FormularioControlar(False);
end;

//
// Procedimento par sugerir o próximo código.
//
procedure TPlataformaERPVCLPaisCadastro.FormularioCodigoSugerir;
const
  PROCEDIMENTO_NOME: string = 'FormularioCodigoSugerir';
  ERRO_MENSAGEM    : string = 'Impossível sugerir informações sobre o próximo código do país!';
var
  locADOConnection : TADOConnection;
  locADOQuery      : TADOQuery;
  locLogMensagem   : string;
begin
  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Limpa componente.
  //
  VCLEditLimpar(edtCodigoCadastrado);
  VCLEditLimpar(edtCodigoCadastradoID);

  //
  // Conexão ao banco de dados.
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
  // Consulta dados do código do usuário.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                      ');
  locADOQuery.SQL.Add('  [pais].[pais_id],               ');
  locADOQuery.SQL.Add('  [pais].[codigo]                 ');
  locADOQuery.SQL.Add('FROM                              ');
  locADOQuery.SQL.Add('  [pais] WITH (NOLOCK)            ');
  locADOQuery.SQL.Add('ORDER BY                          ');
  locADOQuery.SQL.Add('  [pais].[ins_server_dt_hr] DESC, ');
  locADOQuery.SQL.Add('  [pais].[codigo] DESC            ');

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar último cadastro na tabela [pais]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Registro encontrado então carrega componentes.
  //
  if locADOQuery.RecordCount > 0 then
  begin
    edtCodigoCadastrado.Text   := locADOQuery.FieldByName('codigo').AsString;
    edtCodigoCadastradoID.Text := IntegerStringConverter(locADOQuery.FieldByName('pais_id').AsInteger);

    VCLEditClickControlar(edtCodigoCadastrado, True);
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
// Função para gerar a string de log dos dados.
//
function TPlataformaERPVCLPaisCadastro.LogDadosGerar(argPaisID: Integer = 0): string;
var
  locPaisID: Integer;
begin
  if argPaisID <= 0 then
    locPaisID := StringIntegerConverter(edtPaisID.Text)
  else
    locPaisID := argPaisID;

  Result := '';
  LogDadosIntegerDescrever('ID do pais', locPaisID,            Result);
  LogDadosStringDescrever ('Código',     edtCodigo.Text,       Result);
  LogDadosStringDescrever ('Nome',       edtNome.Text,         Result);
  LogDadosBooleanDescrever('Bloqueado',  chkBloqueado.Checked, Result);
  LogDadosBooleanDescrever('Ativo',      chkAtivo.Checked,     Result);
end;

end.
