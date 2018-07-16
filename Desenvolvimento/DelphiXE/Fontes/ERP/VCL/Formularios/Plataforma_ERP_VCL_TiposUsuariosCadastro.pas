//                                                                
// Arquivo..: Plataforma_ERP_VCL_TiposUsuariosCadastro.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário para exibir o cadastro de um tipo de usuário.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_TiposUsuariosCadastro;

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
  Vcl.ComCtrls;

type
  TPlataformaERPVCLTiposUsuariosCadastro = class(TForm)
    imgFormulario: TImage;
    pagFormulario: TPageControl;
    tabCadastro: TTabSheet;
    tabAuditoria: TTabSheet;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    lblTitulo: TLabel;
    edtTitulo: TEdit;
    chkBloqueado: TCheckBox;
    chkAtivo: TCheckBox;
    lblInsDtHt: TLabel;
    edtInsLocalDtHr: TEdit;
    lblUpdDtHr: TLabel;
    edtUpdLocalDtHr: TEdit;
    lblUpdContador: TLabel;
    edtUpdContador: TEdit;
    btnLog: TButton;
    btnExcluir: TBitBtn;
    btnLocalizar: TBitBtn;
    btnGravar: TBitBtn;
    btnMinimizar: TBitBtn;
    btnFechar: TBitBtn;
    btnCancelar: TBitBtn;
    btnEditar: TBitBtn;
    btnNovo: TBitBtn;
    lblTipoUsuarioID: TLabel;
    edtTipoUsuarioID: TEdit;
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
    procedure edtTituloEnter(Sender: TObject);
    procedure edtTituloExit(Sender: TObject);
    procedure edtTituloKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtTituloKeyPress(Sender: TObject; var Key: Char);
    procedure chkBloqueadoEnter(Sender: TObject);
    procedure chkBloqueadoExit(Sender: TObject);
    procedure chkBloqueadoKeyPress(Sender: TObject; var Key: Char);
    procedure chkAtivoEnter(Sender: TObject);
    procedure chkAtivoExit(Sender: TObject);
    procedure chkAtivoKeyPress(Sender: TObject; var Key: Char);
    procedure btnLogClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    procedure FormularioLimpar;

    procedure FormularioControlar(argEditar: Boolean);

    procedure FormularioLogExibir;

    procedure FormularioLocalizar;

    procedure FormularioNovo;

    procedure FormularioPopular(argBaseID       : Integer;
                                argLicencaID    : Integer;
                                argTipoUsuarioID: Integer);

    procedure FormularioEditar;

    procedure FormularioGravar;

    procedure FormularioCancelar;

   procedure FormularioExcluir;
  public
    pubBaseID       : Integer;
    pubLicencaID    : Integer;
    pubTipoUsuarioID: Integer;
  end;

var
  PlataformaERPVCLTiposUsuariosCadastro: TPlataformaERPVCLTiposUsuariosCadastro;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico,
  Plataforma_ERP_TipoUsuario;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_TipoUsuariosCadastro.pas';

  TAB_CADASTRO : Byte = 0;
  TAB_AUDITORIA: Byte = 1;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas.
  //
  pubBaseID        := 0;
  pubLicencaID     := 0;
  pubTipoUsuarioID := 0;
  
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
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormShow(Sender: TObject);
begin
  //
  // Se nenhuma chave foi passada então é um novo cadastro.
  //
  if (pubBaseID = 0) and (pubLicencaID = 0) and (pubTipoUsuarioID = 0) then
  begin
    FormularioNovo;
  end;

  //
  // Se foi passada uma chave então popula formulário.
  //
  if (pubBaseID > 0) and (pubLicencaID > 0) and (pubTipoUsuarioID > 0) then
  begin
    FormularioPopular(pubBaseID, pubLicencaID, pubTipoUsuarioID);
  end;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos do componente "Código".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.edtCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigo) then Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.edtCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigo) then Exit;
end;

//
// Eventos do componente "Título".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.edtTituloEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtTitulo) then Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.edtTituloKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.edtTituloKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.edtTituloExit(Sender: TObject);
begin
  if not VCLEditSair(edtTitulo) then Exit;
end;

//
// Eventos do componente "Bloqueado".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.chkBloqueadoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkBloqueado) then Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.chkBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.chkBloqueadoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkBloqueado) then Exit;
end;

//
// Ativo.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.chkAtivoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkAtivo) then Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.chkAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.chkAtivoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkAtivo) then Exit;
end;

//
// Evento de click no botão "Log alterações".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.btnLogClick(Sender: TObject);
begin
  FormularioLogExibir;
end;

//
// Evento de click no botão "Localizar".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no botão "Novo".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.btnNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

//
// Evento de click no botão "Excluir".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.btnExcluirClick(Sender: TObject);
begin
  FormularioExcluir;
end;

//
// Evento de click no botão "Editar".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.btnEditarClick(Sender: TObject);
begin
  FormularioEditar;
end;

//
// Evento de click no botão "Gravar".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no botão "Minimizar".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "Cancelar".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.btnCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

//
// Evento de click no botão "Fechar".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormularioLimpar;
begin
  // Posiciona pagecontrole na primeira aba.  
  pagFormulario.ActivePageIndex := TAB_CADASTRO;

  // Limpa componentes da aba "Cadastro".
  VCLEditLimpar    (edtTipoUsuarioID);
  VCLEditLimpar    (edtCodigo);
  VCLEditLimpar    (edtTitulo);
  VCLCheckBoxLimpar(chkBloqueado);
  VCLCheckBoxLimpar(chkAtivo);

  // Limpa componentes da aba "Auditoria".
  VCLEditLimpar(edtInsLocalDtHr);
  VCLEditLimpar(edtUpdLocalDtHr);
  VCLEditLimpar(EdtUpdContador);
end;

//
// Procedimento para controlar os componentes do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormularioControlar(argEditar: Boolean);
var
  locDadosPopulados: Boolean;
begin
  //
  // Determina se existem dados populados no formulário.
  //
  locDadosPopulados := (edtTipoUsuarioID.Text <> '');

  //
  // Controla os componentes do formulário.
  //
  VCLEditControlar    (edtCodigo,    argEditar);
  VCLEditControlar    (edtTitulo,    argEditar);
  VCLCheckBoxControlar(chkBloqueado, argEditar);
  VCLCheckBoxControlar(chkAtivo,     argEditar);

  //
  // Controla os botões do formulário.
  //
  btnLocalizar.Visible := (not argEditar);
  btnExcluir.Visible   := (not argEditar) and (locDadosPopulados);
  btnEditar.Visible    := (not argEditar) and (locDadosPopulados);
  btnGravar.Visible    := argEditar;
  btnCancelar.Visible  := argEditar;
  btnMinimizar.Visible := True;
  btnFechar.Visible    := (not argEditar);
end;

//
// FormularioLogExibir.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormularioLogExibir;
begin
  //Plataforma_ERP_VCL_LogRegistroExibir;
end;

//
// FormularioLocalizar.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormularioLocalizar;
var
  locBaseID       : Integer;
  locLicencaID    : Integer;
  locTipoUsuarioID: Integer;
begin
  locBaseID        := 1;
  locLicencaID     := 1;
  locTipoUsuarioID := 1;

  FormularioPopular(locBaseID, locLicencaID, locTipoUsuarioID);
end;

//
// FormularioNovo.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormularioNovo;
begin
  //
  // Limpa os componentes do formulário.
  //
  FormularioLimpar;

  //
  // Componentes ligados para edição.
  //
  FormularioControlar(True);

  //
  // Indica que o ID será um novo.
  //
  edtTipoUsuarioID.Text := STR_NOVO;

  //
  // Coloca o foco no código.
  //
  edtCodigo.SetFocus;
end;

//
// FormularioPopular.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormularioPopular(argBaseID       : Integer;
                                                                   argLicencaID    : Integer;
                                                                   argTipoUsuarioID: Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
  ERRO_MENSAGEM    : string = 'Impossível consultar dados do tipo de usuário!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
begin
  // Troca cursor.
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
  // Consulta dados do tipo de usuário.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                      ');
  locADOQuery.SQL.Add('  [base].[base_id],                                         ');
  locADOQuery.SQL.Add('  [base].[codigo] AS [base_codigo],                         ');
  locADOQuery.SQL.Add('  [base].[titulo] AS [base_titulo],                         ');

  locADOQuery.SQL.Add('  [licenca].[licenca_id],                                   ');
  locADOQuery.SQL.Add('  [licenca].[codigo] AS [licenca_codigo],                   ');
  locADOQuery.SQL.Add('  [licenca].[titulo] AS [licenca_titulo],                   ');

  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_id],                         ');  
  locADOQuery.SQL.Add('  [tipo_usuario].[codigo],                                  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[titulo],                                  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[bloqueado],                               ');
  locADOQuery.SQL.Add('  [tipo_usuario].[ativo],                                   ');
  locADOQuery.SQL.Add('  [tipo_usuario].[ins_local_dt_hr],                         ');
  locADOQuery.SQL.Add('  [tipo_usuario].[upd_local_dt_hr],                         ');
  locADOQuery.SQL.Add('  [tipo_usuario].[upd_contador]                             ');  
  locADOQuery.SQL.Add('FROM                                                        ');
  locADOQuery.SQL.Add('  [tipo_usuario]                                            ');
  locADOQuery.SQL.Add('  INNER JOIN [base]                                         ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [tipo_usuario].[base_id]          ');
  locADOQuery.SQL.Add('  INNER JOIN [licenca]                                      ');
  locADOQuery.SQL.Add('    ON [licenca].[licenca_id] = [tipo_usuario].[licenca_id] ');
  locADOQuery.SQL.Add('WHERE                                                       ');
  locADOQuery.SQL.Add('  [tipo_usuario].[base_id]         = :base_id    AND        ');
  locADOQuery.SQL.Add('  [tipo_usuario].[licenca_id]      = :licenca_id AND        ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_id] = :tipo_usuario_id       ');

  locADOQuery.Parameters.ParamByName('base_id').Value         := argBaseID;
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := argLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value := argTipoUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [tipo_usuario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Registro encontrado então carrega componentes.
  //
  if locADOQuery.RecordCount >= 0 then
  begin
    edtTipoUsuarioID.Text := IntegerStringConverter(locADOQuery.FieldByName('tipo_usuario_id').AsInteger);
    edtCodigo.Text        := locADOQuery.FieldByName('codigo').AsString;
    edtTitulo.Text        := locADOQuery.FieldByName('titulo').AsString;
    chkBloqueado.Checked  := StringBooleanConverter(locADOQuery.FieldByName('bloqueado').AsString);
    chkAtivo.Checked      := StringBooleanConverter(locADOQuery.FieldByName('ativo').AsString);
    edtInsLocalDtHr.Text  := DateTimeStringConverter(locADOQuery.FieldByName('ins_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn:ss.zzz');
    edtUpdLocalDtHr.Text  := DateTimeStringConverter(locADOQuery.FieldByName('ins_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn:ss.zzz');
    edtUpdContador.Text   := IntegerStringConverter(locADOQuery.FieldByName('upd_contador').AsInteger);
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
// Procedimento para editar os dados do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormularioEditar;
begin
  //
  // Componentes ligados para edição.
  //
  FormularioControlar(True);

  //
  // Coloca o foco no código.
  //
  edtCodigo.SetFocus;
end;

//
// Procedimento para gravar os dados do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioGravar';
  ERRO_MENSAGEM    : string = 'Impossível gravar dados do tipo de usuário!';
var
  locADOConnection    : TADOConnection;
  locADOQuery         : TADOQuery;
  locLogMensagem      : string;

  locInsert           : Boolean;
  locRegistroAcaoID   : Integer;
  locTipoUsuarioLogSq : Integer;
  locTipoUsuarioLogMsg: string;

  locBaseID           : Integer;
  locLicencaID        : Integer;
  locTipoUsuarioID    : Integer;
  locCodigo           : string;
  locTitulo           : string;
  locBloqueado        : Boolean;
  locAtivo            : Boolean;
  locInsLocalDtHr     : TDateTime;
  locUpdLocalDtHr     : TDateTime;
  locUsuarioBaseID    : Integer;
  locUsuarioID        : Integer;
  locUpdContador      : Integer;
  locHostName         : string;
  locUserName         : string;
begin
  //
  // Carrega variáveis com o conteúdo dos componentes.
  //
  locBaseID        := gloBaseID;
  locLicencaID     := gloLicencaID;
  locTipoUsuarioID := StringIntegerConverter(edtTipoUsuarioID.Text);
  locCodigo        := StringTrim(edtCodigo.Text);
  locTitulo        := StringTrim(edtTitulo.Text);
  locBloqueado     := chkBloqueado.Checked;
  locAtivo         := chkAtivo.Checked;
  locUsuarioBaseID := gloUsuarioBaseID;
  locUsuarioID     := gloUsuarioID;
  locHostName      := HostNameRecuperar;
  locUserName      := UserNameRecuperar;
  locUpdContador   := StringIntegerConverter(edtUpdContador.Text);

  //
  // Determina se a operação será um insert ou update.
  //
  if locTipoUsuarioID = 0 then
    locInsert := True
  else
    locInsert := False;

  //
  // Consiste as informações.
  //

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
  // Determina se o código do tipo do usuário já existe no banco de dados para um outro registro.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                                           ');
  locADOQuery.SQL.Add('  1                                                    ');
  locADOQuery.SQL.Add('FROM                                                   ');
  locADOQuery.SQL.Add('  [tipo_usuario] WITH (NOLOCK)                         ');
  locADOQuery.SQL.Add('WHERE                                                  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[base_id]          = :base_id    AND  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[licenca_id]       = :licenca_id AND  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[codigo]           = :codigo     AND  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_id] <> :tipo_usuario_id ');

  locADOQuery.Parameters.ParamByName('base_id').Value         := locBaseID;
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('codigo').Value          := locCodigo;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value := locTipoUsuarioID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar o mesmo código de tipo de usuário em um outro registro!';
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
    locLogMensagem := 'O código "' + locCodigo + '" informado para o tipo de usuário já existe em algum outro cadastro!';
    Plataforma_ERP_Logar(False, ERRO_MENSAGEM, locLogMensagem, FONTE_NOME, PROCEDIMENTO_NOME);
    VCLErroExibir(ERRO_MENSAGEM, locLogMensagem);
    Exit;
  end;

  //
  // Consiste o contador do update.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                ');
  locADOQuery.SQL.Add('  [tipo_usuario].[upd_contador]                       ');
  locADOQuery.SQL.Add('FROM                                                  ');
  locADOQuery.SQL.Add('  [tipo_usuario]                                      ');
  locADOQuery.SQL.Add('WHERE                                                 ');
  locADOQuery.SQL.Add('  [tipo_usuario].[base_id]         = :base_id    AND  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[licenca_id]      = :licenca_id AND  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_id] = :tipo_usuario_id ');

  locADOQuery.Parameters.ParamByName('base_id').Value         := locBaseID;
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value := locTipoUsuarioID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualizações confere na tabela [tipo_usuario]!';
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
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem);
      Exit
    end;
  end;

  //
  // Determina o ID da ação e a mensagem para o log do registro.
  //
  if locInsert then
  begin
    locRegistroAcaoID    := Plataforma_ERP_RegistroAcaoIDDeterminar(locADOConnection, True, False, False, False);
    locTipoUsuarioLogMsg := MENSAGEM_REGISTRO_ACAO_CRIADO;
  end
  else
  begin
    locRegistroAcaoID    := Plataforma_ERP_RegistroAcaoIDDeterminar(locADOConnection, False, False, True, False);
    locTipoUsuarioLogMsg := MENSAGEM_REGISTRO_ACAO_ALTERADO;
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
      locLogMensagem := 'Ocorreu algum erro ao tentar iniciar uma transação com o banco de dados da aplicação!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE, locExcecao.Message);
      Exit
    end;
  end;  

  // 
  // Determinba o próximo ID do tipo de usuário.
  //
  if locInsert then
  begin
    try
      locTipoUsuarioID := Plataforma_ERP_ADO_NumeradorLicencaDeterminar(locADOConnection,
                                                                        locBaseID,
                                                                        locLicencaID,
                                                                        NUMERADOR_TIPO_USUARIO_ID,
                                                                        locUsuarioBaseID,
                                                                        locUsuarioID);
    except
      on locExcecao: Exception do
      begin
        locADOConnection.RollbackTrans;
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Impossível determinar o próximo numerador para o tipo de usuário!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem);
        Exit
      end;
    end;
  end;

  //
  // Grava dados na tabela tipo_usuario.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;

  if locInsert then
  begin
    //
    // Insere dados.
    //
    locADOQuery.SQL.Add('INSERT INTO [tipo_usuario] (');
    locADOQuery.SQL.Add('  [base_id],                ');
    locADOQuery.SQL.Add('  [licenca_id],             ');
    locADOQuery.SQL.Add('  [tipo_usuario_id],        ');
    locADOQuery.SQL.Add('  [codigo],                 ');
    locADOQuery.SQL.Add('  [titulo],                 ');
    locADOQuery.SQL.Add('  [bloqueado],              ');
    locADOQuery.SQL.Add('  [ativo],                  ');
    locADOQuery.SQL.Add('  [ins_local_dt_hr],        ');
    locADOQuery.SQL.Add('  [ins_server_dt_hr],       ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr],        ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr],       ');
    locADOQuery.SQL.Add('  [upd_contador]            ');  
    locADOQuery.SQL.Add(')                           ');
    locADOQuery.SQL.Add('VALUES (                    ');
    locADOQuery.SQL.Add('  :base_id,                 '); // base_id.
    locADOQuery.SQL.Add('  :licenca_id,              '); // licenca_id.
    locADOQuery.SQL.Add('  :tipo_usuario_id,         '); // tipo_usuario_id.
    locADOQuery.SQL.Add('  :codigo,                  '); // codigo.
    locADOQuery.SQL.Add('  :titulo,                  '); // titulo.
    locADOQuery.SQL.Add('  :bloqueado,               '); // bloqueado.
    locADOQuery.SQL.Add('  :ativo,                   '); // ativo.
    locADOQuery.SQL.Add('  :local_dt_hr,             '); // ins_local_dt_hr.
    locADOQuery.SQL.Add('  GETDATE(),                '); // ins_server_dt_hr.
    locADOQuery.SQL.Add('  NULL,                     '); // upd_local_dt_hr.
    locADOQuery.SQL.Add('  NULL,                     '); // upd_server_dt_hr.
    locADOQuery.SQL.Add('  0                         '); // upd_contador.
    locADOQuery.SQL.Add(')                           ');
  end
  else
  begin
    //
    // Atualiza dados.
    //
    locADOQuery.SQL.Add('UPDATE                                    ');
    locADOQuery.SQL.Add('  [tipo_usuario]                          ');
    locADOQuery.SQL.Add('SET                                       ');
    locADOQuery.SQL.Add('  [codigo]           = :codigo,           ');
    locADOQuery.SQL.Add('  [titulo]           = :titulo,           ');
    locADOQuery.SQL.Add('  [bloqueado]        = :bloqueado,        ');
    locADOQuery.SQL.Add('  [ativo]            = :ativo,            ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr]  = :local_dt_hr,      ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr] = GETDATE(),         ');
    locADOQuery.SQL.Add('  [upd_contador]     = [upd_contador] + 1 ');
    locADOQuery.SQL.Add('WHERE                                     ');
    locADOQuery.SQL.Add('  [base_id]         = :base_id    AND     ');
    locADOQuery.SQL.Add('  [licenca_id]      = :licenca_id AND     ');
    locADOQuery.SQL.Add('  [tipo_usuario_id] = :tipo_usuario_id    ');
  end;

  //
  // Parâmetros.
  //
  locADOQuery.Parameters.ParamByName('base_id').Value         := locBaseID;
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value := locTipoUsuarioID;
  locADOQuery.Parameters.ParamByName('codigo').Value          := locCodigo;
  locADOQuery.Parameters.ParamByName('titulo').Value          := locTitulo;
  locADOQuery.Parameters.ParamByName('bloqueado').Value       := BooleanStringConverter(locBloqueado);
  locADOQuery.Parameters.ParamByName('ativo').Value           := BooleanStringConverter(locAtivo);
  locADOQuery.Parameters.ParamByName('local_dt_hr').Value     := Now;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [tipo_usuario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem);
      Exit
    end;
  end;

  //
  // Determina o contador de updates atual.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                ');
  locADOQuery.SQL.Add('  [tipo_usuario].[ins_local_dt_hr],                   ');
  locADOQuery.SQL.Add('  [tipo_usuario].[upd_local_dt_hr],                   ');
  locADOQuery.SQL.Add('  [tipo_usuario].[upd_contador]                       ');
  locADOQuery.SQL.Add('FROM                                                  ');
  locADOQuery.SQL.Add('  [tipo_usuario]                                      ');
  locADOQuery.SQL.Add('WHERE                                                 ');
  locADOQuery.SQL.Add('  [tipo_usuario].[base_id]         = :base_id    AND  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[licenca_id]      = :licenca_id AND  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_id] = :tipo_usuario_id ');

  locADOQuery.Parameters.ParamByName('base_id').Value         := locBaseID;
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value := locTipoUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o novo contador de updates do registro na tabela [tipo_usuario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem);
      Exit
    end;   
  end;

  locInsLocalDtHr := locADOQuery.FieldByName('ins_local_dt_hr').AsDateTime;
  locUpdLocalDtHr := locADOQuery.FieldByName('upd_local_dt_hr').AsDateTime;
  locUpdContador  := locADOQuery.FieldByName('upd_contador').AsInteger;

  //
  // Determina o próximo sequencial da tabela tipo_usuario_log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                        ');
  locADOQuery.SQL.Add('  MAX([tipo_usuario_log].[tipo_usuario_log_sq]) AS Sequencial ');
  locADOQuery.SQL.Add('FROM                                                          ');
  locADOQuery.SQL.Add('  [tipo_usuario_log]                                          ');
  locADOQuery.SQL.Add('WHERE                                                         ');
  locADOQuery.SQL.Add('  [tipo_usuario_log].[base_id]         = :base_id    AND      ');
  locADOQuery.SQL.Add('  [tipo_usuario_log].[licenca_id]      = :licenca_id AND      ');
  locADOQuery.SQL.Add('  [tipo_usuario_log].[tipo_usuario_id] = :tipo_usuario_id     ');

  locADOQuery.Parameters.ParamByName('base_id').Value         := locBaseID;
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value := locTipoUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o próximo sequencial para o registro na tabela [tipo_usuario_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  if locADOQuery.RecordCount <= 0 then
  begin
    locTipoUsuarioLogSq := 1;
  end
  else  
  begin
    locTipoUsuarioLogSq := locADOQuery.FieldByName('Sequencial').AsInteger + 1;
  end; 

  // Monta SQL para inserir dados na tabela.
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('INSERT INTO [tipo_usuario_log] (');
  locADOQuery.SQL.Add('  [base_id],                    ');
  locADOQuery.SQL.Add('  [licenca_id],                 ');
  locADOQuery.SQL.Add('  [tipo_usuario_id],            ');
  locADOQuery.SQL.Add('  [tipo_usuario_log_sq],        ');
  locADOQuery.SQL.Add('  [log_local_dt_hr],            ');
  locADOQuery.SQL.Add('  [log_server_dt_hr],           ');
  locADOQuery.SQL.Add('  [registro_acao_id],           ');
  locADOQuery.SQL.Add('  [host_name],                  ');
  locADOQuery.SQL.Add('  [user_name],                  ');
  locADOQuery.SQL.Add('  [usuario_base_id],            ');
  locADOQuery.SQL.Add('  [usuario_id],                 ');
  locADOQuery.SQL.Add('  [mensagem]                    ');  
  locADOQuery.SQL.Add(')                               ');
  locADOQuery.SQL.Add('VALUES (                        ');
  locADOQuery.SQL.Add('  :base_id,                     '); // base_id.
  locADOQuery.SQL.Add('  :licenca_id,                  '); // licenca_id.
  locADOQuery.SQL.Add('  :tipo_usuario_id,             '); // tipo_usuario_id.
  locADOQuery.SQL.Add('  :tipo_usuario_log_sq,         '); // tipo_usuario_log_sq.
  locADOQuery.SQL.Add('  :log_local_dt_hr,             '); // log_local_dt_hr.
  locADOQuery.SQL.Add('  GETDATE(),                    '); // log_server_dt_hr.
  locADOQuery.SQL.Add('  :registro_acao_id,            '); // registro_acao_id.
  locADOQuery.SQL.Add('  :host_name,                   '); // host_name.
  locADOQuery.SQL.Add('  :user_name,                   '); // user_name.
  locADOQuery.SQL.Add('  :usuario_base_id,             '); // usuario_base_id.
  locADOQuery.SQL.Add('  :usuario_id,                  '); // usuario_id.
  locADOQuery.SQL.Add('  :mensagem                     '); // mensagem.
  locADOQuery.SQL.Add(')                               ');

  locADOQuery.Parameters.ParamByName('base_id').Value             := locBaseID;
  locADOQuery.Parameters.ParamByName('licenca_id').Value          := locLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value     := locTipoUsuarioID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_log_sq').Value := locTipoUsuarioLogSq;
  locADOQuery.Parameters.ParamByName('log_local_dt_hr').Value     := Now;
  locADOQuery.Parameters.ParamByName('registro_acao_id').Value    := locRegistroAcaoID;
  locADOQuery.Parameters.ParamByName('host_name').Value           := locHostName;
  locADOQuery.Parameters.ParamByName('user_name').Value           := locUserName;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value     := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value          := locUsuarioID;
  locADOQuery.Parameters.ParamByName('mensagem').Value            := locTipoUsuarioLogMsg;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [tipo_usuario_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
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
  // Atualiza componentes que sofreram alteração com a gravação.
  //
  edtTipoUsuarioID.Text := IntegerStringConverter(locTipoUsuarioID);
  edtInsLocalDtHr.Text  := DateTimeStringConverter(locInsLocalDtHr, 'dd/mm/yyyy hh:nn:ss.zzz');
  edtUpdLocalDtHr.Text  := DateTimeStringConverter(locUpdLocalDtHr, 'dd/mm/yyyy hh:nn:ss.zzz');
  edtUpdContador.Text   := IntegerStringConverter(locUpdContador);

  //
  // Componentes desligados para edição.
  //
  FormularioControlar(False);

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);
  VCLInformacaoExibir('Tipo de usuário gravado com sucesso!');
end;

//
// FormularioExcluir.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormularioExcluir;
const
  PROCEDIMENTO_NOME: string = 'FormularioExcluir';
  ERRO_MENSAGEM    : string = 'Impossível excluir dados do tipo de usuário!';
var
  locADOConnection    : TADOConnection;
  locADOQuery         : TADOQuery;
  locLogMensagem      : string;

  locBaseID           : Integer;
  locLicencaID        : Integer;
  locTipoUsuarioID    : Integer;
  locUsuarioBaseID    : Integer;
  locUsuarioID        : Integer;
  locHostName         : string;
  locUserName         : string;
begin
  //
  // Carrega variáveis com o conteúdo dos componentes.
  //
  locBaseID        := 1;
  locLicencaID     := 1;
  locTipoUsuarioID := 1;
  locUsuarioBaseID := gloUsuarioBaseID;
  locUsuarioID     := gloUsuarioID;
  locHostName      := HostNameRecuperar;
  locUserName      := UserNameRecuperar;

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
      locLogMensagem := 'Ocorreu algum erro ao tentar iniciar uma transação com o banco de dados da aplicação!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE, locExcecao.Message);
      Exit
    end;
  end;  

  //
  // Query.
  //
  locADOQuery                := TADOQuery.Create(Self);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Deleta registro da tabela tipo_usuario_log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                                               ');
  locADOQuery.SQL.Add('  [tipo_usuario_log]                                      ');
  locADOQuery.SQL.Add('WHERE                                                     ');
  locADOQuery.SQL.Add('  [tipo_usuario_log].[base_id]         = :base_id    AND  ');
  locADOQuery.SQL.Add('  [tipo_usuario_log].[licenca_id]      = :licenca_id AND  ');
  locADOQuery.SQL.Add('  [tipo_usuario_log].[tipo_usuario_id] = :tipo_usuario_id ');

  locADOQuery.Parameters.ParamByName('base_id').Value         := locBaseID;
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value := locTipoUsuarioID;

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
      locLogMensagem := 'Ocorreu algum problema ao executar query para deletar os registros na tabela tipo_usuario_log!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Determina se o código do tipo do usuário já existe no banco de dados para um outro registro.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                                           ');
  locADOQuery.SQL.Add('  [tipo_usuario]                                      ');
  locADOQuery.SQL.Add('WHERE                                                 ');
  locADOQuery.SQL.Add('  [tipo_usuario].[base_id]         = :base_id    AND  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[licenca_id]      = :licenca_id AND  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_id] = :tipo_usuario_id ');

  locADOQuery.Parameters.ParamByName('base_id').Value         := locBaseID;
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value := locTipoUsuarioID;

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
      locLogMensagem := 'Ocorreu algum problema ao executar query para deletar os registros na tabela tipo_usuario_log!';
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
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);
  VCLInformacaoExibir('Tipo de usuário excluído com sucesso!');
end;

//
// FormularioCancelar.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormularioCancelar;
begin
  //
  // Confirma com o usuário.
  //
  if not VCLQuestionamentoExibir('Deseja realmente cancelar a edição destes dados?') then Exit;

  //
  // Componentes desligados para edição.
  //
  FormularioControlar(False);

  //
  // Popula somente os dados.
  //
  FormularioPopular(1, 1, 1);
end;

end.
