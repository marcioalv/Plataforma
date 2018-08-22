unit Plataforma_ERP_VCL_PerfilUsuarioRotinaAplicacao;

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
  Vcl.Menus,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls;

type
  TPlataformaERPVCLPerfilUsuarioRotinaAplicacao = class(TForm)
    imgFormulario: TImage;
    imgBackground: TImage;
    btnFechar: TBitBtn;
    btnMinimizar: TBitBtn;
    panFormulario: TPanel;
    btnGravar: TBitBtn;
    mnuFormulario: TMainMenu;
    mniGravar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniFechar: TMenuItem;
    pbaProgresso: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mniGravarClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioPopular;
    procedure FormularioGravar;
  public
    pubClicouFechar       : Boolean;
    pubLicencaID          : Integer;
    pubPerfilUsuarioBaseID: Integer;
    pubPerfilUsuarioID    : Integer;
    pubUpdContador        : Integer;
  end;

var
  PlataformaERPVCLPerfilUsuarioRotinaAplicacao: TPlataformaERPVCLPerfilUsuarioRotinaAplicacao;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_PerfilUsuarioRotinaAplicacao.pas';

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas do formulário.
  //
  pubClicouFechar        := True;
  pubLicencaID           := 0;
  pubPerfilUsuarioBaseID := 0;
  pubPerfilUsuarioID     := 0;
  pubUpdContador         := 0;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.FormShow(Sender: TObject);
begin
  Exit;
end;

//
// Evento de ativação do formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.FormActivate(Sender: TObject);
begin
  Refresh;
  FormularioPopular;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Evento de click no botão "gravar".
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.FormularioLimpar;
begin
  Exit;
end;
    
//
// Procedimento para popular os componentes do formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.FormularioPopular;
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
  ERRO_MENSAGEM    : string = 'Impossível consultar dados sobre as rotinas do perfil!';
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
  // Consulta dados do usuário.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                                                                  ');
  locADOQuery.SQL.Add('  [base].[base_id]   AS [rotina_aplicacao_base_id],                                                                     ');
  locADOQuery.SQL.Add('  [base].[descricao] AS [rotina_aplicacao_base_descricao],                                                              ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[rotina_aplicacao_id],                                                                             ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[codigo],                                                                                          ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[descricao],                                                                                       ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[bloqueado],                                                                                       ');
  locADOQuery.SQL.Add('  [perfil_usuario_rotina_aplicacao].[perfil_usuario_rotina_aplicacao_sq]                                                ');
  locADOQuery.SQL.Add('FROM                                                                                                                    ');
  locADOQuery.SQL.Add('  [rotina_aplicacao] WITH (NOLOCK)                                                                                      ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                                                                                       ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [rotina_aplicacao].[rotina_aplicacao_base_id]                                                 ');
  locADOQuery.SQL.Add('  LEFT OUTER JOIN [perfil_usuario_rotina_aplicacao] WITH (NOLOCK)                                                       ');
  locADOQuery.SQL.Add('    ON [perfil_usuario_rotina_aplicacao].[licenca_id]               = :licenca_id                                   AND ');
  locADOQuery.SQL.Add('       [perfil_usuario_rotina_aplicacao].[perfil_usuario_base_id]   = :perfil_usuario_base_id                       AND ');
  locADOQuery.SQL.Add('       [perfil_usuario_rotina_aplicacao].[perfil_usuario_id]        = :perfil_usuario_id                            AND ');
  locADOQuery.SQL.Add('       [perfil_usuario_rotina_aplicacao].[rotina_aplicacao_base_id] = [rotina_aplicacao].[rotina_aplicacao_base_id] AND ');
  locADOQuery.SQL.Add('       [perfil_usuario_rotina_aplicacao].[rotina_aplicacao_id]      = [rotina_aplicacao].[rotina_aplicacao_id]          ');
  locADOQuery.SQL.Add('WHERE                                                                                                                   ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[ativo] = ''S''                                                                                    ');
                                                              
  locADOQuery.Parameters.ParamByName('licenca_id').Value             := pubLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := pubPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := pubPerfilUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [rotina_aplicacao]!';
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
    VCLProgressBarInicializar(pbaProgresso, locADOQuery.RecordCount);
  
    while not locADOQuery.Eof do
    begin
      VCLProgressBarIncrementar(pbaProgresso);
  
      locADOQuery.Next;
    end;

    VCLProgressBarLimpar(pbaProgresso);
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
// Procedimento para gravar os dados do formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioConfirmar';
  ERRO_MENSAGEM    : string = 'Impossível confirmar informações sobre as rotinas de acesso do perfil!';
var
  locADOConnection        : TADOConnection;
  locADOQuery             : TADOQuery;
  locLogMensagem          : string;
  locContador             : Integer;

  locLicencaID            : Integer;
  locPerfilUsuarioBaseID  : Integer;
  locPerfilUsuarioID      : Integer;
  locSequencial           : Integer;
  locRotinaAplicacaoBaseID: Integer;
  locRotinaAplicacaoID    : Integer;
                     
  locUpdContador          : Integer;
                     
  locRegistroAcao         : Byte;
  locRegistroAcaoID       : Integer;
  locPerfilUsuarioLogSq   : Integer;
  locPerfilUsuarioLogMsg  : string;
  locPerfilUsuarioLogDados: string;
  locHostName             : string;
  locUserName             : string;
  locLogUsuarioBaseID     : Integer;
  locLogUsuarioID         : Integer;
begin
  //
  // Carrega variáveis com o conteúdo dos componentes.
  //
  locLicencaID           := pubLicencaID;
  locPerfilUsuarioBaseID := pubPerfilUsuarioBaseID;
  locPerfilUsuarioID     := pubPerfilUsuarioID;
  locUpdContador         := pubUpdContador;

  locHostName         := HostNameRecuperar;
  locUserName         := UserNameRecuperar;
  locLogUsuarioBaseID := gloBaseID;
  locLogUsuarioID     := gloUsuarioID;

  //
  // Confirma gravação com o usuário.
  //
  if not VCLQuestionamentoExibir('Deseja realmente atualizar estas rotinas de aceso do perfil?') then Exit;

  //
  // Log de dados.
  //
  locPerfilUsuarioLogDados := '';
  LogDadosIntegerDescrever('Licenca',        locLicencaID,           locPerfilUsuarioLogDados);
  LogDadosIntegerDescrever('Base do perfil', locPerfilUsuarioBaseID, locPerfilUsuarioLogDados);
  LogDadosIntegerDescrever('ID do perfil',   locPerfilUsuarioID,     locPerfilUsuarioLogDados);

  locSequencial := 0;
  for locContador := 0 to -1 do
  begin
    if True then
    begin
      Inc(locSequencial);      
      locRotinaAplicacaoBaseID := StringIntegerConverter('1');
      locRotinaAplicacaoID     := StringIntegerConverter('1');
  
      LogDadosIntegerDescrever('Sequencial',     locSequencial,            locPerfilUsuarioLogDados);
      LogDadosIntegerDescrever('Base da rotina', locRotinaAplicacaoBaseID, locPerfilUsuarioLogDados);
      LogDadosIntegerDescrever('ID da rotina',   locRotinaAplicacaoID,     locPerfilUsuarioLogDados);
    end;
  end;

  if locSequencial = 0 then
  begin
    LogDadosStringDescrever('Rotinas selecionadas', 'Nenhuma rotina foi selecionada!', locPerfilUsuarioLogDados);
  end;
  
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
  // Consiste o contador do update.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                    ');
  locADOQuery.SQL.Add('  [perfil_usuario].[upd_contador]                                         ');
  locADOQuery.SQL.Add('FROM                                                                      ');
  locADOQuery.SQL.Add('  [perfil_usuario] WITH (NOLOCK)                                          ');
  locADOQuery.SQL.Add('WHERE                                                                     ');
  locADOQuery.SQL.Add('  [perfil_usuario].[licenca_id]             = :licenca_id             AND ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_base_id] = :perfil_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_id]      = :perfil_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualizações confere na tabela [usuario]!';
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
  locRegistroAcao        := REGISTRO_ACAO_ALTERACAO;
  locPerfilUsuarioLogMsg := 'Rotinas de acesso do perfil atualizadas!';

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
  // Grava dados na tabela usuario.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('UPDATE                                                   ');
  locADOQuery.SQL.Add('  [perfil_usuario]                                       ');
  locADOQuery.SQL.Add('SET                                                      ');
  locADOQuery.SQL.Add('  [upd_local_dt_hr]  = :local_dt_hr,                     ');
  locADOQuery.SQL.Add('  [upd_server_dt_hr] = GETDATE(),                        ');
  locADOQuery.SQL.Add('  [upd_contador]     = [upd_contador] + 1                ');
  locADOQuery.SQL.Add('WHERE                                                    ');
  locADOQuery.SQL.Add('  [licenca_id]             = :licenca_id             AND ');
  locADOQuery.SQL.Add('  [perfil_usuario_base_id] = :perfil_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [perfil_usuario_id]      = :perfil_usuario_id          ');

  //
  // Parâmetros.
  //
  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;
  locADOQuery.Parameters.ParamByName('local_dt_hr').Value            := Now;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para atualizar o registro na tabela [perfil]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  //
  // Remove todas as rotinas cadastradas.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                                              ');
  locADOQuery.SQL.Add('  [perfil_usuario_rotina_aplicacao]                      ');
  locADOQuery.SQL.Add('WHERE                                                    ');
  locADOQuery.SQL.Add('  [licenca_id]             = :licenca_id             AND ');
  locADOQuery.SQL.Add('  [perfil_usuario_base_id] = :perfil_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [perfil_usuario_id]      = :perfil_usuario_id          ');

  //
  // Parâmetros.
  //
  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para excluir todos os registros na tabela [perfil_usuario_rotina_aplicacao]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  //
  // Percorre a lista de rotinas para inserir as selecionadas.
  //
  locSequencial := 0;
  for locContador := 0 to -1 do
  begin
    if True then
    begin
      Inc(locSequencial);      
      locRotinaAplicacaoBaseID := StringIntegerConverter('1');
      locRotinaAplicacaoID     := StringIntegerConverter('1');
    
      locADOQuery.Close;
      locADOQuery.SQL.Clear;
      locADOQuery.SQL.Add('INSERT INTO [perfil_usuario_rotina_aplicacao] ( ');
      locADOQuery.SQL.Add('  [licenca_id],                                 ');
      locADOQuery.SQL.Add('  [perfil_usuario_base_id],                     ');
      locADOQuery.SQL.Add('  [perfil_usuario_id],                          ');
      locADOQuery.SQL.Add('  [perfil_usuario_rotina_aplicacao_sq],         ');
      locADOQuery.SQL.Add('  [rotina_aplicacao_base_id],                   ');
      locADOQuery.SQL.Add('  [rotina_aplicacao_id]                         ');
      locADOQuery.SQL.Add(')                                               ');
      locADOQuery.SQL.Add('VALUES (                                        ');
      locADOQuery.SQL.Add('  :licenca_id,                                  '); // [licenca_id].
      locADOQuery.SQL.Add('  :perfil_usuario_base_id,                      '); // [perfil_usuario_base_id].
      locADOQuery.SQL.Add('  :perfil_usuario_id,                           '); // [perfil_usuario_id].
      locADOQuery.SQL.Add('  :perfil_usuario_rotina_aplicacao_sq,          '); // [perfil_usuario_rotina_aplicacao_sq].
      locADOQuery.SQL.Add('  :rotina_aplicacao_base_id,                    '); // [rotina_aplicacao_base_id].
      locADOQuery.SQL.Add('  :rotina_aplicacao_id                          '); // [rotina_aplicacao_id].
      locADOQuery.SQL.Add(')                                               ');

      locADOQuery.Parameters.ParamByName('licenca_id').Value                         := locLicencaID;
      locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value             := locPerfilUsuarioBaseID;
      locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value                  := locPerfilUsuarioID;
      locADOQuery.Parameters.ParamByName('perfil_usuario_rotina_aplicacao_sq').Value := locSequencial;
      locADOQuery.Parameters.ParamByName('rotina_aplicacao_base_id').Value           := locRotinaAplicacaoBaseID;
      locADOQuery.Parameters.ParamByName('rotina_aplicacao_id').Value                := locRotinaAplicacaoID;

      
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
          locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir dados na tabela [perfil_usuario_rotina_aplicacao]!';
          Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
          VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
          Exit
        end;
      end;
    end;
  end;

  //
  // Determina o contador de updates atual.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                    ');
  locADOQuery.SQL.Add('  [perfil_usuario].[upd_contador]                                         ');
  locADOQuery.SQL.Add('FROM                                                                      ');
  locADOQuery.SQL.Add('  [perfil_usuario]                                                        ');
  locADOQuery.SQL.Add('WHERE                                                                     ');
  locADOQuery.SQL.Add('  [perfil_usuario].[licenca_id]             = :licenca_id             AND ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_base_id] = :perfil_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_id]      = :perfil_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o novo contador de updates do registro na tabela [usuario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;   
  end;

  locUpdContador := locADOQuery.FieldByName('upd_contador').AsInteger;
  
  //
  // Determina o próximo sequencial da tabela perfil_usuario_log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                        ');
  locADOQuery.SQL.Add('  MAX([perfil_usuario_log].[perfil_usuario_log_sq]) AS [sequencial]           ');
  locADOQuery.SQL.Add('FROM                                                                          ');
  locADOQuery.SQL.Add('  [perfil_usuario_log]                                                        ');
  locADOQuery.SQL.Add('WHERE                                                                         ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[licenca_id]             = :licenca_id             AND ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[perfil_usuario_base_id] = :perfil_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[perfil_usuario_id]      = :perfil_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o próximo sequencial para o registro na tabela [perfil_usuario_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  if locADOQuery.RecordCount <= 0 then
  begin
    locPerfilUsuarioLogSq := 1;
  end
  else  
  begin
    locPerfilUsuarioLogSq := locADOQuery.FieldByName('sequencial').AsInteger + 1;
  end; 

  //
  // Monta SQL para inserir dados na tabela de log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('INSERT INTO [perfil_usuario_log] ( ');
  locADOQuery.SQL.Add('  [licenca_id],                    ');
  locADOQuery.SQL.Add('  [perfil_usuario_base_id],        ');
  locADOQuery.SQL.Add('  [perfil_usuario_id],             ');
  locADOQuery.SQL.Add('  [perfil_usuario_log_sq],         ');
  locADOQuery.SQL.Add('  [log_base_id],                   ');
  locADOQuery.SQL.Add('  [log_local_dt_hr],               ');
  locADOQuery.SQL.Add('  [log_server_dt_hr],              ');
  locADOQuery.SQL.Add('  [registro_acao_id],              ');
  locADOQuery.SQL.Add('  [host_name],                     ');
  locADOQuery.SQL.Add('  [user_name],                     ');
  locADOQuery.SQL.Add('  [log_usuario_base_id],           ');
  locADOQuery.SQL.Add('  [log_usuario_id],                ');
  locADOQuery.SQL.Add('  [mensagem],                      ');  
  locADOQuery.SQL.Add('  [dados]                          ');
  locADOQuery.SQL.Add(')                                  ');
  locADOQuery.SQL.Add('VALUES (                           ');
  locADOQuery.SQL.Add('  :licenca_id,                     '); // [licenca_id].
  locADOQuery.SQL.Add('  :perfil_usuario_base_id,         '); // [perfil_usuario_base_id].
  locADOQuery.SQL.Add('  :perfil_usuario_id,              '); // [perfil_usuario_id].
  locADOQuery.SQL.Add('  :perfil_usuario_log_sq,          '); // [perfil_usuario_log_sq].
  locADOQuery.SQL.Add('  :log_base_id,                    '); // [log_base_id].
  locADOQuery.SQL.Add('  :log_local_dt_hr,                '); // [log_local_dt_hr].
  locADOQuery.SQL.Add('  GETDATE(),                       '); // [log_server_dt_hr].
  locADOQuery.SQL.Add('  :registro_acao_id,               '); // [registro_acao_id].
  locADOQuery.SQL.Add('  :host_name,                      '); // [host_name].
  locADOQuery.SQL.Add('  :user_name,                      '); // [user_name].
  locADOQuery.SQL.Add('  :log_usuario_base_id,            '); // [log_usuario_base_id].
  locADOQuery.SQL.Add('  :log_usuario_id,                 '); // [log_usuario_id].
  locADOQuery.SQL.Add('  :mensagem,                       '); // [mensagem].
  locADOQuery.SQL.Add('  :dados                           '); // [dados].
  locADOQuery.SQL.Add(')                                 ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_log_sq').Value  := locPerfilUsuarioLogSq;
  locADOQuery.Parameters.ParamByName('log_base_id').Value            := gloBaseID;
  locADOQuery.Parameters.ParamByName('log_local_dt_hr').Value        := Now;
  locADOQuery.Parameters.ParamByName('registro_acao_id').Value       := locRegistroAcaoID;
  locADOQuery.Parameters.ParamByName('host_name').Value              := locHostName;
  locADOQuery.Parameters.ParamByName('user_name').Value              := locUserName;
  locADOQuery.Parameters.ParamByName('log_usuario_base_id').Value    := locLogUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('log_usuario_id').Value         := locLogUsuarioID;
  locADOQuery.Parameters.ParamByName('mensagem').Value               := locPerfilUsuarioLogMsg;
  locADOQuery.Parameters.ParamByName('dados').Value                  := locPerfilUsuarioLogDados;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [perfil_usuario_rotina_aplicacao]!';
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
  pubUpdContador := locUpdContador;

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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, locPerfilUsuarioID, '', 'perfil', locPerfilUsuarioLogMsg, locPerfilUsuarioLogDados);
  except
    on locExcecao: Exception do
    begin
      VCLErroExibir(locExcecao.Message);
    end;
  end;

  //
  // Configurações de senha atualizadas!
  //
  VCLInformacaoExibir('Acessos do perfil gravados com sucesso!');

  //
  // Retorna.
  //
  pubClicouFechar := False;
  Close;
end;

end.
