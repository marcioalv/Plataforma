//                                                                   
// Arquivo..: Plataforma_ERP_TipoUsuario.pas
// Projeto..: ERP
// Fonte....: Unit de procedimentos e funções.
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Procedimentos e funções diversas para tipos de usuário.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_TipoUsuario;

interface

uses
  Data.Win.ADODB,
  System.SysUtils,
  Plataforma_Framework_Util,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_RegistroAcao;

function PlataformaERPTipoUsuarioADOPersistir(argBaseID       : Integer;
                                              argLicencaID    : Integer;
                                              argTipoUsuarioID: Integer;
                                              argCodigo       : string;
                                              argTitulo       : string;
                                              argBloqueado    : Boolean;
                                              argAtivo        : Boolean;
                                              argUsuarioBaseID: Integer;
                                              argUsuarioID    : Integer;
                                              argHostName     : string;
                                              argUserName     : string;
                                              argUpdContador  : Integer): Integer;
  
function PlataformaERPTipoUsuarioADOCodigoConsistir(argADOConnection: TADOConnection;
                                                    argBaseID       : Integer;
                                                    argLicencaID    : Integer;
                                                    argTipoUsuarioID: Integer;
                                                    argCodigo       : string): Boolean;

function PlataformaERPTipoUsuarioADOUpdContadorConsistir(argADOConnection: TADOConnection;
                                                         argBaseID       : Integer;
                                                         argLicencaID    : Integer;
                                                         argTipoUsuarioID: Integer;
                                                         argUpdContador  : Integer): Boolean;

function PlataformaERPTipoUsuarioADOInsert(argADOConnection: TADOConnection;
                                           argBaseID       : Integer;
                                           argLicencaID    : Integer;
                                           argCodigo       : string;
                                           argTitulo       : string;
                                           argBloqueado    : Boolean;
                                           argAtivo        : Boolean;
                                           argUsuarioBaseID: Integer;
                                           argUsuarioID    : Integer;
                                           argHostName     : string;
                                           argUserName     : string): Integer;

procedure PlataformaERPTipoUsuarioADOUpdate(argADOConnection: TADOConnection;
                                            argBaseID       : Integer;
                                            argLicencaID    : Integer;
                                            argTipoUsuarioID: Integer;
                                            argCodigo       : string;
                                            argTitulo       : string;
                                            argBloqueado    : Boolean;
                                            argAtivo        : Boolean;
                                            argUsuarioBaseID: Integer;                                            
                                            argUsuarioID    : Integer;
                                            argHostName     : string;
                                            argUserName     : string);

procedure PlataformaERPTipoUsuarioLogADOInsert(argADOConnection : TADOConnection;
                                               argBaseID        : Integer;
                                               argLicencaID     : Integer;
                                               argTipoUsuarioID : Integer;
                                               argRegistroAcaoID: Integer;
                                               argMensagem      : string;
                                               argUsuarioBaseID : Integer;
                                               argUsuarioID     : Integer;
                                               argHostName      : string;
                                               argUserName      : string);

implementation

const
  UNIT_NOME: string = 'Plataforma_ERP_TipoUsuario.pas';

//
// PlataformaERPTipoUsuarioADOPersistir.
//
function PlataformaERPTipoUsuarioADOPersistir(argBaseID       : Integer;
                                              argLicencaID    : Integer;
                                              argTipoUsuarioID: Integer;
                                              argCodigo       : string;
                                              argTitulo       : string;
                                              argBloqueado    : Boolean;
                                              argAtivo        : Boolean;
                                              argUsuarioBaseID: Integer;                                              
                                              argUsuarioID    : Integer;
                                              argHostName     : string;
                                              argUserName     : string;
                                              argUpdContador  : Integer): Integer;
const
  FUNCAO_NOME: string = 'PlataformaERPTipoUsuarioADOPersistir';
var
  locADOConnection: TADOConnection;
  locMsgErro      : string;
begin
  // Instância objeto de conexão.
  locADOConnection                   := TADOConnection.Create(nil);
  locADOConnection.ConnectionTimeout := gloConexaoTimeOut;
  locADOConnection.ConnectionString  := gloConexaoADOString;

  try
    locADOConnection.Open;
  except
    on locExcecao: Exception do
    begin
      locMsgErro := StringConcatenar('Impossível se conectar ao servidor de banco de dados da aplicação!', 'Tente novamente!');
      PlataformaERPLogar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;

  // Consiste código único.
  try
    if not PlataformaERPTipoUsuarioADOCodigoConsistir(locADOConnection,
                                                      argBaseID,
                                                      argLicencaID,
                                                      argTipoUsuarioID,
                                                      argCodigo) then
    begin
      locMsgErro := 'O código do tipo de usuário [' + argCodigo + '] informado já existe em algum outro cadastro!';
      PlataformaERPLogar(False, locMsgErro, UNIT_NOME, FUNCAO_NOME);
      raise Exception.Create(locMsgErro);
    end;
  except
    on locExcecao: Exception do
    begin
      locMsgErro := 'Ocorreu algum erro ao tentar determinar se o código do tipo do usuário já existe para um outro cadastro!';
      PlataformaERPLogar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;

  // Consiste contador de atualizações.
  try
    if not PlataformaERPTipoUsuarioADOUpdContadorConsistir(locADOConnection,
                                                           argBaseID,
                                                           argLicencaID,
                                                           argTipoUsuarioID,
                                                           argUpdContador) then
    begin
      locMsgErro := StringConcatenar('Esse registro sofreu alguma outra alteração entre a sua consulta e essa gravação!', 'Impossível continuar!', 'Tente novamente!');
      PlataformaERPLogar(False, locMsgErro, UNIT_NOME, FUNCAO_NOME);
      raise Exception.Create(locMsgErro);
    end;
  except
    on locExcecao: Exception do
    begin
      locMsgErro := 'Ocorreu algum erro ao tentar determinar se o registro do tipo de usuário sofreu outras alterações anteriores!';
      PlataformaERPLogar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;

  // Insere ou atualiza registro.
  if argTipoUsuarioID = 0 then
  begin
    try
      Result := PlataformaERPTipoUsuarioADOInsert(locADOConnection,
                                                  argBaseID,
                                                  argLicencaID,
                                                  argCodigo,
                                                  argTitulo,
                                                  argBloqueado,
                                                  argAtivo,
                                                  argUsuarioBaseID,
                                                  argUsuarioID,
                                                  argHostName,
                                                  argUserName);
    except
      on locExcecao: Exception do
      begin
        locMsgErro := 'Impossível inserir dados sobre o tipo do usuário!';
        PlataformaERPLogar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
        raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
      end;
    end;
  end
  else
  begin
    try
      PlataformaERPTipoUsuarioADOUpdate(locADOConnection,
                                        argBaseID,
                                        argLicencaID,
                                        argTipoUsuarioID,
                                        argCodigo,
                                        argTitulo,
                                        argBloqueado,
                                        argAtivo,
                                        argUsuarioBaseID,
                                        argUsuarioID,
                                        argHostName,
                                        argUserName); 
    except
      on locExcecao: Exception do
      begin
        locMsgErro := 'Impossível atualizar dados sobre o tipo do usuário!';
        PlataformaERPLogar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
        raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
      end;
    end;
  
    // Retorna o próximo ID do tipo do usuário.
    Result := argTipoUsuarioID;
  end;
end;

//
// PlataformaERPTipoUsuarioADOCodigoConsistir.
//
function PlataformaERPTipoUsuarioADOCodigoConsistir(argADOConnection: TADOConnection;
                                                    argBaseID       : Integer;
                                                    argLicencaID    : Integer;
                                                    argTipoUsuarioID: Integer;
                                                    argCodigo       : string): Boolean;
const
  FUNCAO_NOME: string = 'PlataformaERPTipoUsuarioADOCodigoConsistir';
var
  locMsgErro : string;
  locADOQuery: TADOQuery;
begin
  // Valor de retorno padrão.
  Result := False;

  // Consiste o objeto de conexão ADO.
  try
    PlataformaERPConexaoADOConsistir(argADOConnection);
  except
    on locExcecao: Exception do
    begin
      locMsgErro := 'Impossível consistir o código do tipo de usuário!';
      PlataformaERPLogar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;
  
  // Instancia e configura o objeto de query ADO com o banco de dados.
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := argADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  // Monta SQL para consistir se o código informado é único.
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                                           ');
  locADOQuery.SQL.Add('  1                                                    ');
  locADOQuery.SQL.Add('FROM                                                   ');
  locADOQuery.SQL.Add('  [tipo_usuario]                                       ');
  locADOQuery.SQL.Add('WHERE                                                  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[base_id]          = :base_id    AND  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[licenca_id]       = :licenca_id AND  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[codigo]           = :codigo     AND  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_id] <> :tipo_usuario_id ');

  // Passa parâmetros.
  locADOQuery.Parameters.ParamByName('base_id').Value         := argBaseID;
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := argLicencaID;
  locADOQuery.Parameters.ParamByName('codigo').Value          := argCodigo;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value := argTipoUsuarioID;

  // Executa query.
  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locMsgErro := 'Ocorreu algum erro ao executar o comando SQL para consultar se um código existe na tabela [tipo_usuario]!';
      PlataformaERPLogar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;

  // O código já existe na tabela.
  if locADOQuery.RecordCount <= 0 then
  begin
    Result := True;
  end;

  // Finaliza objetos.
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
end;

//
// PlataformaERPTipoUsuarioADOUpdContadorConsistir.
//
function PlataformaERPTipoUsuarioADOUpdContadorConsistir(argADOConnection: TADOConnection;
                                                         argBaseID       : Integer;
                                                         argLicencaID    : Integer;
                                                         argTipoUsuarioID: Integer;
                                                         argUpdContador  : Integer): Boolean;
const
  FUNCAO_NOME: string = 'PlataformaERPTipoUsuarioADOUpdContadorConsistir';
var
  locMsgErro : string;
  locADOQuery: TADOQuery;
begin
  // Valor de retorno padrão.
  Result := True;

  // Consiste o objeto de conexão ADO.
  try
    PlataformaERPConexaoADOConsistir(argADOConnection);
  except
    on locExcecao: Exception do
    begin
      locMsgErro := 'Impossível consistir o código o contador de atualizações!';
      PlataformaERPLogar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;
  
  // Instancia e configura o objeto de query ADO com o banco de dados.
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := argADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  // Monta SQL para consistir se o código informado é único.
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

  // Passa parâmetros.
  locADOQuery.Parameters.ParamByName('base_id').Value         := argBaseID;
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := argLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value := argTipoUsuarioID;

  // Executa query.
  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locMsgErro := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualizações confere na tabela [tipo_usuario]!';
      PlataformaERPLogar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;

  // O código já existe na tabela.
  if locADOQuery.RecordCount > 0 then
  begin
    if locADOQuery.FieldByName('upd_contador').AsInteger <> argUpdContador then
    begin
      Result := False;
    end;
  end;

  // Finaliza objetos.
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
end;

//
// PlataformaERPTipoUsuarioADOInsert.
//
function PlataformaERPTipoUsuarioADOInsert(argADOConnection: TADOConnection;
                                           argBaseID       : Integer;
                                           argLicencaID    : Integer;
                                           argCodigo       : string;
                                           argTitulo       : string;
                                           argBloqueado    : Boolean;
                                           argAtivo        : Boolean;
                                           argUsuarioBaseID: Integer;                                           
                                           argUsuarioID    : Integer;
                                           argHostName     : string;
                                           argUserName     : string): Integer;                                           
const
  FUNCAO_NOME: string = 'PlataformaERPTipoUsuarioADOInsert';
var
  locMsgErro       : string;
  locADOQuery      : TADOQuery;
  locTipoUsuarioID : Integer;
  locRegistroAcaoID: Integer;
begin
  // Consiste o objeto de conexão ADO.
  try
    PlataformaERPConexaoADOConsistir(argADOConnection);
  except
    on locExcecao: Exception do
    begin
      locMsgErro := 'Impossível inserir registro de tipo de usuário na base de dados da aplicação!';
      PlataformaERPLogar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;
  
  // Instancia e configura o objeto de query ADO com o banco de dados.
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := argADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  // Próximo ID do tipo do usuário.
  try
    locTipoUsuarioID := PlataformaERPConexaoADONumeradorLicenca(argADOConnection, argBaseID, argLicencaID, NUMERADOR_TIPO_USUARIO_ID, argUsuarioBaseID, argUsuarioID);
  except
    on locExcecao: Exception do
    begin
      locMsgErro := 'Impossível determinar o próximo numerador para o tipo do usuário!';
      PlataformaERPLogar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;

  // Monta SQL para inserir dados na tabela.
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
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

  // Passa parâmetros.
  locADOQuery.Parameters.ParamByName('base_id').Value         := argBaseID;
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := argLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value := locTipoUsuarioID;
  locADOQuery.Parameters.ParamByName('codigo').Value          := argCodigo;
  locADOQuery.Parameters.ParamByName('titulo').Value          := argTitulo;
  locADOQuery.Parameters.ParamByName('bloqueado').Value       := BooleanStringConverter(argBloqueado);
  locADOQuery.Parameters.ParamByName('ativo').Value           := BooleanStringConverter(argAtivo);
  locADOQuery.Parameters.ParamByName('ins_local_dt_hr').Value := Now;

  // Executa query.
  try
    locADOQuery.ExecSQL;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locMsgErro := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [tipo_usuario]!';
      PlataformaERPLogar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;

  // Log de inserção do registro.
  try
    locRegistroAcaoID := PlataformaERPRegistroAcaoCodigoDeterminar(argADOConnection, True, False, False, False);
  
    PlataformaERPTipoUsuarioLogADOInsert(argADOConnection,
                                         argBaseID,
                                         argLicencaID,
                                         locTipoUsuarioID,
                                         locRegistroAcaoID,
                                         'Tipo de usuário criado com sucesso!',
                                         argUsuarioBaseID,
                                         argUsuarioID,
                                         argHostName,
                                         argUserName);
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locMsgErro := 'Impossível inserir o log de inserção do registro!';
      PlataformaERPLogar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;

  // Finaliza objetos.
  locADOQuery.Close;
  FreeAndNil(locADOQuery);

  // Retorna o ID do tipo do usuário que foi inserido.
  Result := locTipoUsuarioID;
end;

//
// PlataformaERPTipoUsuarioADOUpdate.
//
procedure PlataformaERPTipoUsuarioADOUpdate(argADOConnection: TADOConnection;
                                            argBaseID       : Integer;
                                            argLicencaID    : Integer;
                                            argTipoUsuarioID: Integer;
                                            argCodigo       : string;
                                            argTitulo       : string;
                                            argBloqueado    : Boolean;
                                            argAtivo        : Boolean;
                                            argUsuarioBaseID: Integer;
                                            argUsuarioID    : Integer;
                                            argHostName     : string;
                                            argUserName     : string);
const
  PROCEDIMENTO_NOME: string = 'PlataformaERPTipoUsuarioADOUpdate';
var
  locMsgErro       : string;
  locADOQuery      : TADOQuery;
  locTipoUsuarioID : Integer;
  locRegistroAcaoID: Integer;
begin
  // Consiste o objeto de conexão ADO.
  try
    PlataformaERPConexaoADOConsistir(argADOConnection);
  except
    on locExcecao: Exception do
    begin
      locMsgErro := 'Impossível atualizar registro de tipo de usuário na base de dados da aplicação!';
      PlataformaERPLogar(True, locMsgErro, locExcecao.Message, UNIT_NOME, PROCEDIMENTO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;

  // Instancia e configura o objeto de query ADO com o banco de dados.
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := argADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  // Monta SQL para atualizar dados na tabela.
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
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

  // Passa parâmetros.
  locADOQuery.Parameters.ParamByName('base_id').Value         := argBaseID;
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := argLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value := argTipoUsuarioID;
  locADOQuery.Parameters.ParamByName('codigo').Value          := argCodigo;
  locADOQuery.Parameters.ParamByName('titulo').Value          := argTitulo;
  locADOQuery.Parameters.ParamByName('bloqueado').Value       := BooleanStringConverter(argBloqueado);
  locADOQuery.Parameters.ParamByName('ativo').Value           := BooleanStringConverter(argAtivo);
  locADOQuery.Parameters.ParamByName('upd_local_dt_hr').Value := Now;

  // Executa query.
  try
    locADOQuery.ExecSQL;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locMsgErro := 'Ocorreu algum erro ao executar o comando SQL para atualizar o registro na tabela [tipo_usuario]!';
      PlataformaERPLogar(True, locMsgErro, locExcecao.Message, UNIT_NOME, PROCEDIMENTO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;

  // Log de inserção do registro.
  try
    locRegistroAcaoID := PlataformaERPRegistroAcaoCodigoDeterminar(argADOConnection, False, False, True, False);

    PlataformaERPTipoUsuarioLogADOInsert(argADOConnection,
                                         argBaseID,
                                         argLicencaID,
                                         argTipoUsuarioID,
                                         locRegistroAcaoID,
                                         'Tipo de usuário alterado com sucesso!',
                                         argUsuarioBaseID,
                                         argUsuarioID,
                                         argHostName,
                                         argUserName);
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locMsgErro := 'Impossível inserir o log de inserção do registro!';
      PlataformaERPLogar(True, locMsgErro, locExcecao.Message, UNIT_NOME, PROCEDIMENTO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;

  // Finaliza objetos.
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
end;

//
// PlataformaERPTipoUsuarioLogADOInsert.
//
procedure PlataformaERPTipoUsuarioLogADOInsert(argADOConnection : TADOConnection;
                                               argBaseID        : Integer;
                                               argLicencaID     : Integer;
                                               argTipoUsuarioID : Integer;
                                               argRegistroAcaoID: Integer;
                                               argMensagem      : string;                                               
                                               argUsuarioBaseID : Integer;
                                               argUsuarioID     : Integer;
                                               argHostName      : string;
                                               argUserName      : string);
const
  FUNCAO_NOME: string = 'PlataformaERPTipoUsuarioLogADOInsert';
var
  locMsgErro   : string;
  locADOQuery  : TADOQuery;
  locSequencial: Integer;
begin
  // Consiste o objeto de conexão ADO.
  try
    PlataformaERPConexaoADOConsistir(argADOConnection);
  except
    on locExcecao: Exception do
    begin
      locMsgErro := 'Impossível inserir registro de log do tipo de usuário na base de dados da aplicação!';
      PlataformaERPLogar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;

  // Instancia e configura o objeto de query ADO com o banco de dados.
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := argADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

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
      PlataformaERPLogar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
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
      PlataformaERPLogar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;

  // Finaliza objetos.
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
end;

end.
