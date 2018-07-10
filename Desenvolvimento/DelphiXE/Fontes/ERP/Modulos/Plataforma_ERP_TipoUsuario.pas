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
  Plataforma_ERP_Generico;

function PlataformaERPTipoUsuarioADOPersistir(argBaseID       : Integer;
                                              argLicencaID    : Integer;
                                              argTipoUsuarioID: Integer;
                                              argCodigo       : string;
                                              argTitulo       : string;
                                              argBloqueado    : Boolean;
                                              argAtivo        : Boolean): Integer;
  
function PlataformaERPTipoUsuarioADOCodigoConsistir(argADOConnection: TADOConnection;
                                                    argBaseID       : Integer;
                                                    argLicencaID    : Integer;
                                                    argCodigo       : string): Boolean;

function PlataformaERPTipoUsuarioADOInsert(argADOConnection: TADOConnection;
                                           argBaseID       : Integer;
                                           argLicencaID    : Integer;
                                           argCodigo       : string;
                                           argTitulo       : string;
                                           argBloqueado    : Boolean;
                                           argAtivo        : Boolean): Integer;

procedure PlataformaERPTipoUsuarioADOUpdate(argADOConnection: TADOConnection;
                                            argBaseID       : Integer;
                                            argLicencaID    : Integer;
                                            argTipoUsuarioID: Integer;
                                            argCodigo       : string;
                                            argTitulo       : string;
                                            argBloqueado    : Boolean;
                                            argAtivo        : Boolean);

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
                                              argAtivo        : Boolean): Integer;
const
  FUNCAO_NOME: string = 'PlataformaERPTipoUsuarioADOCodigoConsistir';
var
  locADOConnection: TADOConnection;
  locMsgErro      : string;
  locADOQuery     : TADOQuery;
begin
  // Instância objeto de conexão.
  locADOConnection                   := TADOConnection.Create(nil);
  locADOConnection.ConnectionTimeout := 1;
  locADOConnection.ConnectionString  := '';

  try
    locADOConnection.Open;
  except
    on locExcecao: Exception do
    begin
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
                                                  argAtivo); 
    except
      on locExcecao: Exception do
      begin
        
      end;
    end;
  end
  else
  begin
    try
      PlataformaERPTipoUsuarioADOUpdate(locADOConnection,
                                        argBaseID,
                                        argLicencaID,
                                        argCodigo,
                                        argTitulo,
                                        argBloqueado,
                                        argAtivo); 
    except
      on locExcecao: Exception do
      begin
      end;
    end;
  
    // Retorna o próximo ID fo tipo do usuário.
    Result := argTipoUsuarioID;
  end;
end;

//
// PlataformaERPTipoUsuarioADOCodigoConsistir.
//
function PlataformaERPTipoUsuarioADOCodigoConsistir(argADOConnection: TADOConnection;
                                                    argBaseID       : Integer;
                                                    argLicencaID    : Integer;
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
  locADOQuery.SQL.Add('SELECT TOP 1                    ');
  locADOQuery.SQL.Add('  1                             ');
  locADOQuery.SQL.Add('FROM                            ');
  locADOQuery.SQL.Add('  [tipo_usuario]                ');
  locADOQuery.SQL.Add('WHERE                           ');
  locADOQuery.SQL.Add('  :base_id    = :base_id    AND ');
  locADOQuery.SQL.Add('  :licenca_id = :licenca_id AND ');
  locADOQuery.SQL.Add('  :codigo     = :codigo         ');

  // Passa parâmetros.
  locADOQuery.Parameters.ParamByName('base_id').Value    := argBaseID;
  locADOQuery.Parameters.ParamByName('licenca_id').Value := argLicencaID;
  locADOQuery.Parameters.ParamByName('codigo').Value     := argCodigo;

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
  if locADOQuery.RecordCount > 0 then
  begin
    Result := True;    
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
                                           argAtivo        : Boolean): Integer;
const
  FUNCAO_NOME: string = 'PlataformaERPTipoUsuarioADOInsert';
var
  locMsgErro      : string;
  locADOQuery     : TADOQuery;
  locTipoUsuarioID: Integer;
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

  // Consiste código único.
  try
    if not PlataformaERPTipoUsuarioADOCodigoConsistir(argADOConnection, argBaseID, argLicencaID, argCodigo) then
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
  
  // Instancia e configura o objeto de query ADO com o banco de dados.
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := argADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  // Próximo ID do tipo do usuário.
  try
    locTipoUsuarioID := PlataformaERPConexaoADONumeradorLicenca(argADOConnection, argBaseID, argLicencaID, NUMERADOR_TIPO_USUARIO_ID);
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
  locADOQuery.SQL.Add('  :ativo                    '); // ativo.
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
  locADOQuery.Parameters.ParamByName('bloqueado').Value       := argBloqueado;
  locADOQuery.Parameters.ParamByName('ativo').Value           := argAtivo;
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
                                            argAtivo        : Boolean);
const
  PROCEDIMENTO_NOME: string = 'PlataformaERPTipoUsuarioADOUpdate';
var
  locMsgErro : string;
  locADOQuery: TADOQuery;
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
  locADOQuery.SQL.Add('UPDATE                                ');
  locADOQuery.SQL.Add('  [tipo_usuario]                      ');
  locADOQuery.SQL.Add('SET                                   ');
  locADOQuery.SQL.Add('  [codigo]           = :codigo,       ');
  locADOQuery.SQL.Add('  [titulo]           = :titulo,       ');
  locADOQuery.SQL.Add('  [bloqueado]        = :bloqueado,    ');
  locADOQuery.SQL.Add('  [ativo]            = :ativo,        ');
  locADOQuery.SQL.Add('  [upd_local_dt_hr]  = :local_dt_hr,  ');
  locADOQuery.SQL.Add('  [upd_server_dt_hr] = GETDATE(),     ');
  locADOQuery.SQL.Add('  [upd_seq]          = [upd_seq] + 1  ');
  locADOQuery.SQL.Add(')                                     ');
  locADOQuery.SQL.Add('WHERE                                 ');
  locADOQuery.SQL.Add('  :base_id         = :base_id    AND  ');
  locADOQuery.SQL.Add('  :licenca_id      = :licenca_id AND  ');
  locADOQuery.SQL.Add('  :tipo_usuario_id = :tipo_usuario_id ');

  // Passa parâmetros.
  locADOQuery.Parameters.ParamByName('base_id').Value         := argBaseID;
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := argLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value := argTipoUsuarioID;
  locADOQuery.Parameters.ParamByName('codigo').Value          := argCodigo;
  locADOQuery.Parameters.ParamByName('titulo').Value          := argTitulo;
  locADOQuery.Parameters.ParamByName('bloqueado').Value       := argBloqueado;
  locADOQuery.Parameters.ParamByName('ativo').Value           := argAtivo;
  locADOQuery.Parameters.ParamByName('local_dt_hr').Value     := Now;

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

  // Finaliza objetos.
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
end;

end.
