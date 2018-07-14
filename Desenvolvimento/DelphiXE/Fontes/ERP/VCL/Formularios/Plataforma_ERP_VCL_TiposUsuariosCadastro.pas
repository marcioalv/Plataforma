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
    btnFechar: TBitBtn;
    btnMinimizar: TBitBtn;
    pagFormulario: TPageControl;
    tabCadastro: TTabSheet;
    tabAuditoria: TTabSheet;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    lblTitulo: TLabel;
    edtTitulo: TEdit;
    lblTipoUsuarioID: TLabel;
    edtTipoUsuarioID: TEdit;
    chkBloqueado: TCheckBox;
    chkAtivo: TCheckBox;
    lblInsDtHt: TLabel;
    edtInsLocalDtHr: TEdit;
    lblUpdDtHr: TLabel;
    edtUpdLocalDtHr: TEdit;
    lblUpdContador: TLabel;
    edtUpdContador: TEdit;
    btnLog: TButton;
    btnGravar: TBitBtn;
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
  private
    procedure FormularioLimpar;

    procedure FormularioLogExibir;

    procedure FormularioPopular(argBaseID       : Integer;
                                argLicencaID    : Integer;
                                argTipoUsuarioID: Integer);

    procedure FormularioGravar;
  public
    { Public declarations }
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
  // Limpa os componentes do formulário.
  FormularioLimpar;
end;

//
// Evento de exibiçãoi do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormShow(Sender: TObject);
begin
  Exit;
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
  VCLEditLimpar(edtTipoUsuarioID);
  VCLEditLimpar(edtCodigo);
  VCLEditLimpar(edtTitulo);
  VCLCheckBoxLimpar(chkBloqueado);
  VCLCheckBoxLimpar(chkAtivo);

  // Limpa componentes da aba "Auditoria".
  VCLEditLimpar(edtInsLocalDtHr);
  VCLEditLimpar(edtUpdLocalDtHr);
  VCLEditLimpar(EdtUpdContador);
end;

//
// FormularioLogExibir.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormularioLogExibir;
begin
  //Plataforma_ERP_VCL_LogRegistroExibir;
end;

//
// FormularioPopular.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormularioPopular(argBaseID       : Integer;
                                                                   argLicencaID    : Integer;
                                                                   argTipoUsuarioID: Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
var
  locCodigo      : string;
  locTitulo      : string;
  locBloqueado   : Boolean;
  locAtivo       : Boolean;
  locInsLocalDtHr: TDateTime;
  locUpdLocalDtHr: TDateTime;
  locUpdContador : Integer;
begin
  // Troca cursor.
  VCLCursorTrocar(True);

  // Popula dados.
  try
    PlataformaERPTipoUsuarioADOPopular(argBaseID,
                                       argLicencaID,
                                       argTipoUsuarioID,
                                       locCodigo,
                                       locTitulo,
                                       locBloqueado,
                                       locAtivo,
                                       locInsLocalDtHr,
                                       locUpdLocalDtHr,
                                       locUpdContador);
  except
    on locExcecao: Exception do
    begin
      Plataforma_ERP_Logar(True, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLCursorTrocar;
      VCLErroExibir(locExcecao.Message);
      Exit;
    end;
  end;

  // Carrega componentes.
  edtCodigo.Text       := locCodigo;
  edtTitulo.Text       := locTitulo;
  chkBloqueado.Checked := locBloqueado;
  chkAtivo.Checked     := locAtivo;

  edtInsLocalDtHr.Text := DateTimeStringConverter(locInsLocalDtHr, 'dd/mm/yyyy hh:nn:ss.zzz');
  edtUpdLocalDtHr.Text := DateTimeStringConverter(locUpdLocalDtHr, 'dd/mm/yyyy hh:nn:ss.zzz');
  edtUpdContador.Text  := IntegerStringConverter(locUpdContador);

  // Finaliza.
  VCLCursorTrocar;
end;

//
// Procedimento para gravar os dados do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioGravar';
  ERRO_MENSAGEM    : string = 'Impossível gravar dados do tipo de usuário!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;

  locInsert       : Boolean;

  locBaseID       : Integer;
  locLicencaID    : Integer;
  locTipoUsuarioID: Integer;
  locCodigo       : string;
  locTitulo       : string;
  locBloqueado    : Boolean;
  locAtivo        : Boolean;
  locUsuarioBaseID: Integer;
  locUsuarioID    : Integer;
  locHostName     : string;
  locUserName     : string;
  locUpdContador  : Integer;
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
    locLogMensagem := 'O código do tipo de usuário [' + locCodigo + '] informado já existe em algum outro cadastro!';
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
  // Determinba o próximo ID do tipo de usuário.
  //
  if locInsert then
  begin
    try
      locTipoUsuarioID := PlataformaERPConexaoADONumeradorLicenca(locADOConnection,
                                                                  locBaseID,
                                                                  locLicencaID,
                                                                  NUMERADOR_TIPO_USUARIO_ID,
                                                                  locUsuarioBaseID,
                                                                  locUsuarioID);
    except
      on locExcecao: Exception do
      begin
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
    locADOQuery.SQL.Add('  :ins_local_dt_hr,         '); // ins_local_dt_hr.
    locADOQuery.SQL.Add('  GETDATE(),                '); // ins_server_dt_hr.
    locADOQuery.SQL.Add('  NULL,                     '); // upd_local_dt_hr.
    locADOQuery.SQL.Add('  NULL,                     '); // upd_server_dt_hr.
    locADOQuery.SQL.Add('  0                         '); // upd_contador.
    locADOQuery.SQL.Add(')                           ');
  end
  else
  begin
    //
    // Atualiza dados na tabela.
    //
    locADOQuery.SQL.Add('UPDATE                                    ');
    locADOQuery.SQL.Add('  [tipo_usuario]                          ');
    locADOQuery.SQL.Add('SET                                       ');
    locADOQuery.SQL.Add('  [codigo]           = :codigo,           ');
    locADOQuery.SQL.Add('  [titulo]           = :titulo,           ');
    locADOQuery.SQL.Add('  [bloqueado]        = :bloqueado,        ');
    locADOQuery.SQL.Add('  [ativo]            = :ativo,            ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr]  = :upd_local_dt_hr,  ');
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
  locADOQuery.Parameters.ParamByName('ins_local_dt_hr').Value := Now;

  try
    locADOQuery.ExecSQL;
  except
    on locExcecao: Exception do
    begin
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

    locRegistroAcaoID := PlataformaERPRegistroAcaoCodigoDeterminar(argADOConnection, False, False, True, False);


  // Monta SQL para determinar o próximo sequencial do log.
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

  locADOQuery.Parameters.ParamByName('base_id').Value         := argBaseID;
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := argLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value := argTipoUsuarioID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locMsgErro := 'Ocorreu algum erro ao executar o comando SQL para determinar o próximo sequencial para o registro na tabela [tipo_usuario_log]!';
      Plataforma_ERP_Logar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;

  locSequencial := 1;

  if locADOQuery.RecordCount > 0 then
  begin
    locSequencial := locADOQuery.FieldByName('Sequencial').AsInteger + 1;
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

  locADOQuery.Parameters.ParamByName('base_id').Value             := argBaseID;
  locADOQuery.Parameters.ParamByName('licenca_id').Value          := argLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value     := argTipoUsuarioID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_log_sq').Value := locSequencial;
  locADOQuery.Parameters.ParamByName('log_local_dt_hr').Value     := Now;
  locADOQuery.Parameters.ParamByName('registro_acao_id').Value    := argRegistroAcaoID;
  locADOQuery.Parameters.ParamByName('host_name').Value           := argHostName;
  locADOQuery.Parameters.ParamByName('user_name').Value           := argUserName;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value     := argUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value          := argUsuarioID;
  locADOQuery.Parameters.ParamByName('mensagem').Value            := argMensagem;

  try
    locADOQuery.ExecSQL;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locMsgErro := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [tipo_usuario_log]!';
      Plataforma_ERP_Logar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;











  
 
  // Atualiza o ID do tipo do usuário que foi gravado.
  edtTipoUsuarioID.Text := IntegerStringConverter(locTipoUsuarioID);

  // Finaliza.
  VCLCursorTrocar;
  VCLInformacaoExibir('Tipo de usuário gravado com sucesso!');
end;

end.
