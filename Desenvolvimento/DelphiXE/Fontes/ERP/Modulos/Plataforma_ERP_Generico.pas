//
// Arquivo..: Plataforma_ERP_Generico.pas
// Projeto..: ERP
// Fonte....: Unit
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Funções e procedimentos diversos de uso genérico da aplicação de ERP.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_Generico;

interface

uses
  Data.Win.ADODB,
  System.SysUtils,
  Plataforma_Framework_Util,
  Plataforma_ERP_Global;

const
  REGISTRO_ACAO_CRIACAO  : Byte = 0;
  REGISTRO_ACAO_CONSULTA : Byte = 1;
  REGISTRO_ACAO_ALTERACAO: Byte = 2;
  REGISTRO_ACAO_EXCLUSAO : Byte = 3;

const
  ERRO_MENSAGEM_TENTE_NOVAMENTE       : string = 'Por favor tente novamente agora!';
  ERRO_MENSAGEM_CONSISTENCIA_EXCLUSAO : string = 'Você deve alterar lá primeiro, antes de excluir o cadastro aqui!';
  
  ERRO_MENSAGEM_BD_CONEXAO_ABRIR      : string = 'Ocorreu algum problema ao tentar estabelecer uma conexão com o banco de dados da aplicação!';
  ERRO_MENSAGEM_BD_TRANSACAO_INICIAR  : string = 'Ocorreu algum problema ao tentar iniciar uma transação com o banco de dados da aplicação!';
  ERRO_MENSAGEM_BD_TRANSACAO_CONFIRMAR: string = 'Ocorreu algum problema ao tentar confirmar a transação com o banco de dados da aplicação!';

  MENSAGEM_REGISTRO_ACAO_CRIADO       : string = 'Registro criado com sucesso!';
  MENSAGEM_REGISTRO_ACAO_ALTERADO     : string = 'Registro atualizado com sucesso!';

const
  NUMERADOR_PERFIL_USUARIO_ID: string = 'perfil_usuario_id';
  NUMERADOR_TIPO_USUARIO_ID  : string = 'tipo_usuario_id';
  NUMERADOR_USUARIO_ID       : string = 'usuario_id';

//
// PlataformaERPLogar.
//
procedure Plataforma_ERP_Logar(argCritico  : Boolean;
                               argMensagem1: string;
                               argMensagem2: string = '';
                               argMensagem3: string = '';
                               argMensagem4: string = '';
                               argMensagem5: string = '';
                               argMensagem6: string = '');

//
// PlataformaERPUsuarioRotina.
//
function Plataforma_ERP_UsuarioRotina(argRotina: string): Boolean;

//
// Plataforma_ERP_ADO_ConexaoAbrir.
//
procedure Plataforma_ERP_ADO_ConexaoAbrir(var argADOConnection: TADOConnection);

//
// Plataforma_ERP_ADO_LogOcorrenciaInserir.
//
procedure Plataforma_ERP_ADO_LogOcorrenciaInserir(argRegistroAcao: Byte;
                                                  argID          : Integer;
                                                  argMensagem    : string;
                                                  argDados       : string);

//
// Plataforma_ERP_ADO_NumeradorLicencaDeterminar.
//
function Plataforma_ERP_ADO_NumeradorLicencaDeterminar(argADOConnection: TADOConnection;
                                                       argLicencaID    : Integer;
                                                       argBaseID       : Integer;
                                                       argCodigo       : string;
                                                       argUsuarioBaseID: Integer;
                                                       argUsuarioID    : Integer): Integer;

//
// Plataforma_ERP_RegistroAcaoIDDeterminar.
//
function Plataforma_ERP_RegistroAcaoIDDeterminar(argADOConnection: TADOConnection;
                                                 argRegistroAcao : Byte): Integer;

implementation

const
  FONTE_NOME: string = 'Plataforma_ERP_Generico.pas';

//
// PlataformaERPLogar.
//
procedure Plataforma_ERP_Logar(argCritico  : Boolean;
                               argMensagem1: string;
                               argMensagem2: string = '';
                               argMensagem3: string = '';
                               argMensagem4: string = '';
                               argMensagem5: string = '';
                               argMensagem6: string = '');
var
  locHostName   : string;
  locUserName   : string;
  locAppName    : string;
  locAppHashCode: string;
  locAppUserID  : string;
  locAppUserName: string;
  locMensagem   : string;
begin
  locHostName    := HostNameRecuperar;
  locUserName    := UserNameRecuperar;
  locAppName     := 'Plataforma_ERP_VCL';
  locAppHashCode := gloAppHashCode;
  locAppUserID   := IntegerStringConverter(gloUsuarioID);
  locAppUserName := gloUsuarioNome;

  locMensagem := argMensagem1;
  if argMensagem2 <> '' then locMensagem := locMensagem + CONCATENADOR + argMensagem2;
  if argMensagem3 <> '' then locMensagem := locMensagem + CONCATENADOR + argMensagem3;
  if argMensagem4 <> '' then locMensagem := locMensagem + CONCATENADOR + argMensagem4;
  if argMensagem5 <> '' then locMensagem := locMensagem + CONCATENADOR + argMensagem5;
  if argMensagem6 <> '' then locMensagem := locMensagem + CONCATENADOR + argMensagem6;

  gloLocalLog.Write(locHostName, locUserName, locAppName, locAppHashCode, locAppUserID, locAppUserName, argCritico, locMensagem);
end;

//
// Plataforma_ERP_UsuarioRotina.
//
function Plataforma_ERP_UsuarioRotina(argRotina: string): Boolean;
var
  locContador: Integer;
begin
  Result := False;
  for locContador := 0 to (Length(gloUsuarioRotinas) - 1) do
  begin
    if UpperCase(argRotina) = UpperCase(gloUsuarioRotinas[locContador]) then
    begin
      Result := True;
      Break;
    end;
  end;
end;

//
// Plataforma_ERP_ADO_ConexaoAbrir.
//
procedure Plataforma_ERP_ADO_ConexaoAbrir(var argADOConnection: TADOConnection);
const
  PROCEDIMENTO_NOME: string = 'Plataforma_ERP_ADO_ConexaoAbrir';
var
  locLogMsg: string;
begin
  // String de conexão ADO.
  argADOConnection.ConnectionString  := gloConexaoADOString;

  // Time-out de conexão.
  argADOConnection.ConnectionTimeout := gloConexaoTimeOut;

  // Abre conexão com o banco de dados da aplicação.
  try
    argADOConnection.Open;
  except
    on locExcecao: Exception do
    begin
      locLogMsg := StringConcatenar(ERRO_MENSAGEM_BD_CONEXAO_ABRIR, ERRO_MENSAGEM_TENTE_NOVAMENTE);
      Plataforma_ERP_Logar(True, locLogMsg, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      raise Exception.Create(StringConcatenar(locLogMsg, locExcecao.Message));
    end;
  end;
end;

//
// Plataforma_ERP_ADO_LogOcorrenciaInserir.
//
procedure Plataforma_ERP_ADO_LogOcorrenciaInserir(argRegistroAcao: Byte;
                                                  argID          : Integer;
                                                  argMensagem    : string;
                                                  argDados       : string);
const
  PROCEDIMENTO_NOME: string = 'Plataforma_ERP_ADO_LogOcorrenciaIn  serir';
var
  locLogMensagem        : string;
  locADOConnection      : TADOConnection;
  locADOQuery           : TADOQuery;
  locLicencaID          : Integer;
  locHostName           : string;
  locUserName           : string;
  locUsuarioBaseID      : Integer;
  locUsuarioID          : Integer;
  locLogOcorrenciaBaseID: Integer;
  locLogOcorrenciaID    : LongInt;
  locRegistroAcaoID     : Integer;
begin
  //
  // Carrega variáveis locais.
  //
  locLogOcorrenciaBaseID := gloBaseID;
  locLicencaID           := gloLicencaID;
  locHostName            := HostNameRecuperar;
  locUserName            := UserNameRecuperar;
  locUsuarioBaseID       := gloUsuarioBaseID;
  locUsuarioID           := gloUsuarioID;

  //
  // Conexão ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(nil);

  try
    Plataforma_ERP_ADO_ConexaoAbrir(locADOConnection);
  except
    on locExcecao: Exception do
    begin
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      Plataforma_ERP_Logar(True, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      raise Exception.Create(locExcecao.Message);
    end;
  end;

  //
  // Determina o ID do registro da ação.
  //
  try
    locRegistroAcaoID := Plataforma_ERP_RegistroAcaoIDDeterminar(locADOConnection, argRegistroAcao);
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao inserir registro na tabela [log_ocorrencia]!';
      Plataforma_ERP_Logar(True, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      raise Exception.Create(StringConcatenar(locLogMensagem, locExcecao.Message));
    end;
  end;

  //
  // Query.
  //
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Determina o próximo log_ocorrencia_id.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                             ');
  locADOQuery.SQL.Add('  MAX([log_ocorrencia].[log_ocorrencia_id]) AS [log_ocorrencia_id] ');
  locADOQuery.SQL.Add('FROM                                                               ');
  locADOQuery.SQL.Add('  [log_ocorrencia] WITH (NOLOCK)                                   ');
  locADOQuery.SQL.Add('WHERE                                                              ');
  locADOQuery.SQL.Add('  [log_ocorrencia].[log_ocorrencia_base_id] = :base_id             ');

  locADOQuery.Parameters.ParamByName('base_id').Value := locLogOcorrenciaBaseID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para determina o próximo log_ocorrencia_id na tabela [log_ocorrencia]!';
      Plataforma_ERP_Logar(True, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      raise Exception.Create(StringConcatenar(locLogMensagem, locExcecao.Message));
    end;
  end;

  locLogOcorrenciaID := 0;
  
  if locADOQuery.RecordCount > 0 then
  begin
    if not locADOQuery.FieldByName('log_ocorrencia_id').IsNull then
    begin
      locLogOcorrenciaID := locADOQuery.FieldByName('log_ocorrencia_id').AsInteger;
    end;
  end;

  Inc(locLogOcorrenciaID);

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
      Plataforma_ERP_Logar(True, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      raise Exception.Create(StringConcatenar(locLogMensagem, locExcecao.Message));
      Exit
    end;
  end;

  //
  // Insere dados na tabela log_ocorrencia_id.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('INSERT INTO [log_ocorrencia] (');
  locADOQuery.SQL.Add(' log_ocorrencia_base_id,      ');
  locADOQuery.SQL.Add(' log_ocorrencia_id,           ');
  locADOQuery.SQL.Add(' log_licenca_id,              ');
  locADOQuery.SQL.Add(' log_local_dt_hr,             ');
  locADOQuery.SQL.Add(' log_server_dt_hr,            ');
  locADOQuery.SQL.Add(' registro_acao_id,            ');
  locADOQuery.SQL.Add(' host_name,                   ');
  locADOQuery.SQL.Add(' user_name,                   ');
  locADOQuery.SQL.Add(' log_usuario_base_id,         ');
  locADOQuery.SQL.Add(' log_usuario_id,              ');
  locADOQuery.SQL.Add(' id,                          ');
  locADOQuery.SQL.Add(' mensagem,                    ');
  locADOQuery.SQL.Add(' dados                        ');
  locADOQuery.SQL.Add(')                             ');
  locADOQuery.SQL.Add('VALUES (                      ');
  locADOQuery.SQL.Add(' :log_ocorrencia_base_id,     '); // log_ocorrencia_base_id.
  locADOQuery.SQL.Add(' :log_ocorrencia_id,          '); // log_ocorrencia_id.
  locADOQuery.SQL.Add(' :log_licenca_id,             '); // log_licenca_id.
  locADOQuery.SQL.Add(' :log_local_dt_hr,            '); // log_local_dt_hr.
  locADOQuery.SQL.Add(' GETDATE(),                   '); // log_server_dt_hr.
  locADOQuery.SQL.Add(' :registro_acao_id,           '); // registro_acao_id.
  locADOQuery.SQL.Add(' :host_name,                  '); // host_name.
  locADOQuery.SQL.Add(' :user_name,                  '); // user_name.
  locADOQuery.SQL.Add(' :log_usuario_base_id,        '); // log_usuario_base_id.
  locADOQuery.SQL.Add(' :log_usuario_id,             '); // log_usuario_id.
  locADOQuery.SQL.Add(' :id,                         '); // id.
  locADOQuery.SQL.Add(' :mensagem,                   '); // mensagem.
  locADOQuery.SQL.Add(' :dados                       '); // dados.
  locADOQuery.SQL.Add(')                             ');

  locADOQuery.Parameters.ParamByName('log_ocorrencia_base_id').Value := locLogOcorrenciaBaseID;
  locADOQuery.Parameters.ParamByName('log_ocorrencia_id').Value      := locLogOcorrenciaID;
  locADOQuery.Parameters.ParamByName('log_licenca_id').Value         := locLicencaID;
  locADOQuery.Parameters.ParamByName('log_local_dt_hr').Value        := Now;
  locADOQuery.Parameters.ParamByName('registro_acao_id').Value       := locRegistroAcaoID;
  locADOQuery.Parameters.ParamByName('host_name').Value              := locHostName;
  locADOQuery.Parameters.ParamByName('user_name').Value              := locUserName;
  locADOQuery.Parameters.ParamByName('log_usuario_base_id').Value    := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('log_usuario_id').Value         := locUsuarioID;
  locADOQuery.Parameters.ParamByName('id').Value                     := argID;
  locADOQuery.Parameters.ParamByName('mensagem').Value               := argMensagem;
  locADOQuery.Parameters.ParamByName('dados').Value                  := argDados;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [log_ocorrencia]!';
      Plataforma_ERP_Logar(True, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      raise Exception.Create(StringConcatenar(locLogMensagem, locExcecao.Message));
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
      Plataforma_ERP_Logar(True, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      raise Exception.Create(StringConcatenar(locLogMensagem, locLogMensagem));
    end;
  end;  

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);
end;

//
// Plataforma_ERP_ADO_NumeradorLicencaDeterminar.
//
function Plataforma_ERP_ADO_NumeradorLicencaDeterminar(argADOConnection: TADOConnection;
                                                       argLicencaID    : Integer;
                                                       argBaseID       : Integer;
                                                       argCodigo       : string;
                                                       argUsuarioBaseID: Integer;
                                                       argUsuarioID    : Integer): Integer;
const
  FUNCAO_NOME: string = 'Plataforma_ERP_ADO_NumeradorLicencaDeterminar';
var
  locMsgErro : string;
  locADOQuery: TADOQuery;
begin
  
  // Instancia e configura o objeto de query ADO com o banco de dados.
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := argADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  // Monta SQL para consistir se o código informado é único.
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                               ');
  locADOQuery.SQL.Add('  [numerador_licenca].[atual_id]                     ');
  locADOQuery.SQL.Add('FROM                                                 ');
  locADOQuery.SQL.Add('  [numerador_licenca]                                ');
  locADOQuery.SQL.Add('WHERE                                                ');
  locADOQuery.SQL.Add('  [numerador_licenca].[licenca_id] = :licenca_id AND ');
  locADOQuery.SQL.Add('  [numerador_licenca].[base_id]    = :base_id    AND ');
  locADOQuery.SQL.Add('  [numerador_licenca].[codigo]     = :codigo         ');

  // Passa parâmetros.
  locADOQuery.Parameters.ParamByName('licenca_id').Value := argLicencaID;
  locADOQuery.Parameters.ParamByName('base_id').Value    := argBaseID;
  locADOQuery.Parameters.ParamByName('codigo').Value     := argCodigo;

  // Executa query.
  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locMsgErro := 'Ocorreu algum erro ao executar o comando SQL para consultar o ID atual na tabela [numerador_licenca]!';
      Plataforma_ERP_Logar(True, locMsgErro, locExcecao.Message, FONTE_NOME, FUNCAO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;

  // Se nenhum registro existir com o código do numerador informado.
  if locADOQuery.RecordCount <= 0 then
  begin
    // Insere numerador.
    locADOQuery.Close;
    locADOQuery.SQL.Clear;
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
    locADOQuery.SQL.Add('  :licenca_id,                   '); // licenca_id.
    locADOQuery.SQL.Add('  :base_id,                      '); // base_id.
    locADOQuery.SQL.Add('  :codigo,                       '); // codigo.
    locADOQuery.SQL.Add('  :atual_id,                     '); // atual_id.
    locADOQuery.SQL.Add('  :bloqueado,                    '); // bloqueado.
    locADOQuery.SQL.Add('  :ativo,                        '); // ativo.
    locADOQuery.SQL.Add('  :ins_local_dt_hr,              '); // ins_local_dt_hr.
    locADOQuery.SQL.Add('  GETDATE(),                     '); // ins_server_dt_hr.
    locADOQuery.SQL.Add('  :ins_usuario_base_id,          '); // ins_usuario_base_id.
    locADOQuery.SQL.Add('  :ins_usuario_id,               '); // ins_usuario_id.
    locADOQuery.SQL.Add('  :upd_local_dt_hr,              '); // upd_local_dt_hr.
    locADOQuery.SQL.Add('  :upd_server_dt_hr,             '); // upd_server_dt_hr.
    locADOQuery.SQL.Add('  :upd_usuario_base_id,          '); // upd_usuario_base_id.
    locADOQuery.SQL.Add('  :upd_usuario_id,               '); // upd_usuario_id.
    locADOQuery.SQL.Add('  :upd_contador                  '); // upd_contador.
    locADOQuery.SQL.Add(')                                ');

    locADOQuery.Parameters.ParamByName('licenca_id').Value          := argLicencaID;
    locADOQuery.Parameters.ParamByName('base_id').Value             := argBaseID;
    locADOQuery.Parameters.ParamByName('codigo').Value              := argCodigo;
    locADOQuery.Parameters.ParamByName('atual_id').Value            := 1;
    locADOQuery.Parameters.ParamByName('bloqueado').Value           := 'N';
    locADOQuery.Parameters.ParamByName('ativo').Value               := 'S';
    locADOQuery.Parameters.ParamByName('ins_local_dt_hr').Value     := Now;
    locADOQuery.Parameters.ParamByName('ins_usuario_base_id').Value := argUsuarioBaseID;
    locADOQuery.Parameters.ParamByName('ins_usuario_id').Value      := argUsuarioID;
    locADOQuery.Parameters.ParamByName('upd_contador').Value        := 0;

    try
      locADOQuery.ExecSQL;
    except
      on locExcecao: Exception do
      begin
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locMsgErro := 'Ocorreu algum erro ao inserir um registro na tabela [numerador_licenca]!';
        Plataforma_ERP_Logar(True, locMsgErro, locExcecao.Message, FONTE_NOME, FUNCAO_NOME);
        raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
      end;
    end;

    // Primeiro ID do numerador.
    Result := 1;
  end
  else
  begin
    // ID do numerador atual.
    Result := locADOQuery.FieldByName('atual_id').AsInteger + 1;

    // Atualiza o numerador.
    locADOQuery.Close;
    locADOQuery.SQL.Clear;
    locADOQuery.SQL.Add('UPDATE                                          ');
    locADOQuery.SQL.Add('  [numerador_licenca]                           ');
    locADOQuery.SQL.Add('SET                                             ');
    locADOQuery.SQL.Add('  [atual_id]            = :atual_id,            ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr]     = :upd_local_dt_hr,     ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr]    = GETDATE(),            ');
    locADOQuery.SQL.Add('  [upd_usuario_base_id] = :upd_usuario_base_id, ');
    locADOQuery.SQL.Add('  [upd_usuario_id]      = :upd_usuario_id,      ');
    locADOQuery.SQL.Add('  [upd_contador]        = [upd_contador] + 1    ');
    locADOQuery.SQL.Add('WHERE                                           ');
    locADOQuery.SQL.Add('  [licenca_id] = :licenca_id AND                ');
    locADOQuery.SQL.Add('  [base_id]    = :base_id    AND                ');
    locADOQuery.SQL.Add('  [codigo]     = :codigo                        ');

    locADOQuery.Parameters.ParamByName('licenca_id').Value          := argLicencaID;
    locADOQuery.Parameters.ParamByName('base_id').Value             := argBaseID;
    locADOQuery.Parameters.ParamByName('codigo').Value              := argCodigo;
    locADOQuery.Parameters.ParamByName('atual_id').Value            := Result;
    locADOQuery.Parameters.ParamByName('upd_local_dt_hr').Value     := Now;
    locADOQuery.Parameters.ParamByName('upd_usuario_base_id').Value := argUsuarioBaseID;
    locADOQuery.Parameters.ParamByName('upd_usuario_id').Value      := argUsuarioID;

    try
      locADOQuery.ExecSQL;
    except
      on locExcecao: Exception do
      begin
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locMsgErro := 'Ocorreu algum erro ao atualizar um registro na tabela [numerador_licenca]!';
        Plataforma_ERP_Logar(True, locMsgErro, locExcecao.Message, FONTE_NOME, FUNCAO_NOME);
        raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
      end;
    end;    
  end;  

  // Finaliza objetos.
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
end;

//
// Plataforma_ERP_RegistroAcaoIDDeterminar.
//
function Plataforma_ERP_RegistroAcaoIDDeterminar(argADOConnection: TADOConnection;
                                                 argRegistroAcao : Byte): Integer;
const
  FUNCAO_NOME: string = 'Plataforma_ERP_RegistroAcaoIDDeterminar';
var
  locMsgErro : string;
  locADOQuery: TADOQuery;
begin
  // Valor de retorno padrão.
  Result := 0;
  
  // Instancia e configura o objeto de query ADO com o banco de dados.
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := argADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  // Monta SQL para consistir se o código informado é único.
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                         ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_id] ');
  locADOQuery.SQL.Add('FROM                                 ');
  locADOQuery.SQL.Add('  [registro_acao] WITH (NOLOCK)      ');
  locADOQuery.SQL.Add('WHERE                                ');

  if argRegistroAcao = REGISTRO_ACAO_CRIACAO then
    locADOQuery.SQL.Add(' [registro_acao].[criacao]   = ''S'' ');

  if argRegistroAcao = REGISTRO_ACAO_CONSULTA then
    locADOQuery.SQL.Add(' [registro_acao].[consulta]  = ''S'' ');

  if argRegistroAcao = REGISTRO_ACAO_ALTERACAO then
    locADOQuery.SQL.Add(' [registro_acao].[alteracao] = ''S'' ');

  if argRegistroAcao = REGISTRO_ACAO_EXCLUSAO then
    locADOQuery.SQL.Add(' [registro_acao].[exclusao]  = ''S'' ');

  // Executa query.
  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locMsgErro := 'Ocorreu algum erro ao executar o comando SQL para consultar o ID da ação no registro na tabela [registro_acao]!';
      Plataforma_ERP_Logar(True, locMsgErro, locExcecao.Message, FONTE_NOME, FUNCAO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;

  // Retorna código.
  if locADOQuery.RecordCount > 0 then
  begin
    Result := locADOQuery.FieldByName('registro_acao_id').AsInteger;
  end;

  // Finaliza objetos.
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
end;

end.
