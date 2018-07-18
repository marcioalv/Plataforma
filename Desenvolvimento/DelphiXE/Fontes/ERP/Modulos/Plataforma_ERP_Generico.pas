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
  ERRO_MENSAGEM_TENTE_NOVAMENTE       : string = 'Por favor tente novamente agora!';
  
  ERRO_MENSAGEM_BD_CONEXAO_ABRIR      : string = 'Ocorreu algum problema ao tentar estabelecer uma conexão com o banco de dados da aplicação!';
  ERRO_MENSAGEM_BD_TRANSACAO_INICIAR  : string = 'Ocorreu algum problema ao tentar iniciar uma transação com o banco de dados da aplicação!';
  ERRO_MENSAGEM_BD_TRANSACAO_CONFIRMAR: string = 'Ocorreu algum problema ao tentar confirmar a transação com o banco de dados da aplicação!';

  MENSAGEM_REGISTRO_ACAO_CRIADO       : string = 'Registro criado com sucesso!';
  MENSAGEM_REGISTRO_ACAO_ALTERADO     : string = 'Registro atualizado com sucesso!';

const
  NUMERADOR_TIPO_USUARIO_ID: string = 'tipo_usuario_id';

//
// TPlataforma_ERP_LogRegistro.
//
type
  TPlataforma_ERP_LogRegistro = record
    LicencaID         : Integer;
    Sequencial        : Integer;
    LogBaseID         : Integer;
    LogBaseTitulo     : string;
    LogLocalDtHr      : TDateTime;
    LogServerDtHr     : TDateTime;
    RegistroAcaoID    : Integer;
    RegistroAcaoTitulo: string;
    HostName          : string;
    UserName          : string;
    UsuarioBaseID     : Integer;
    UsuarioID         : Integer;
    UsuarioNome       : string;
    Mensagem          : string;
    Dados             : string;
  end;

//
// TPlataforma_ERP_LogRegistroLista.
//
type
  TPlataforma_ERP_LogRegistroLista = array of TPlataforma_ERP_LogRegistro;

//
// Plataforma_ERP_LogRegistroLimpar.
//
procedure Plataforma_ERP_LogRegistroLimpar(argLogRegistro: TPlataforma_ERP_LogRegistro);

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
procedure Plataforma_ERP_ADO_ConexaoAbrir(argADOConnection: TADOConnection);

//
// Plataforma_ERP_ADO_NumeradorLicencaDeterminar.
//
function Plataforma_ERP_ADO_NumeradorLicencaDeterminar(argADOConnection: TADOConnection;
                                                       argBaseID       : Integer;
                                                       argLicencaID    : Integer;
                                                       argCodigo       : string;
                                                       argUsuarioBaseID: Integer;
                                                       argUsuarioID    : Integer): Integer;

//
// Plataforma_ERP_RegistroAcaoIDDeterminar.
//
function Plataforma_ERP_RegistroAcaoIDDeterminar(argADOConnection: TADOConnection;
                                                 argCriacao      : Boolean;
                                                 argConsulta     : Boolean;
                                                 argAlteracao    : Boolean;
                                                 argExclusao     : Boolean): Integer;

implementation

const
  FONTE_NOME: string = 'Plataforma_ERP_Generico.pas';

//
// Plataforma_ERP_LogRegistroLimpar.
//
procedure Plataforma_ERP_LogRegistroLimpar(argLogRegistro: TPlataforma_ERP_LogRegistro);
begin
  with argLogRegistro do
  begin
    LicencaID          := 0;
    Sequencial         := 0;
    LogBaseID          := 0;
    LogBaseTitulo      := '';
    LogLocalDtHr       := 0;
    LogServerDtHr      := 0;
    RegistroAcaoID     := 0;
    RegistroAcaoTitulo := '';
    HostName           := '';
    UserName           := '';
    UsuarioBaseID      := 0;
    UsuarioID          := 0;
    UsuarioNome        := '';
    Mensagem           := '';
    Dados              := '';
  end;
end;

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
procedure Plataforma_ERP_ADO_ConexaoAbrir(argADOConnection: TADOConnection);
const
  PROCEDIMENTO_NOME: string = 'Plataforma_ERP_ADO_ConexaoAbrir';
var
  locLogMsg: string;
begin
  // String de conexão ADO.
  argADOConnection.ConnectionString  := gloConexaoADOString;

  // Time-out de conexão.
  argADOConnection.ConnectionTimeout := gloConexaoTimeOut;

  try
    // Abre conexão com o banco de dados da aplicação.
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
// Plataforma_ERP_ADO_NumeradorLicencaDeterminar.
//
function Plataforma_ERP_ADO_NumeradorLicencaDeterminar(argADOConnection: TADOConnection;
                                                       argBaseID       : Integer;
                                                       argLicencaID    : Integer;
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
  locADOQuery.SQL.Add('  [numerador_licenca].[base_id]    = :base_id    AND ');
  locADOQuery.SQL.Add('  [numerador_licenca].[licenca_id] = :licenca_id AND ');
  locADOQuery.SQL.Add('  [numerador_licenca].[codigo]     = :codigo         ');

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
    locADOQuery.SQL.Add('  [base_id],                     ');
    locADOQuery.SQL.Add('  [licenca_id],                  ');
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
    locADOQuery.SQL.Add('  :base_id,                      '); // base_id.
    locADOQuery.SQL.Add('  :licenca_id,                   '); // licenca_id.
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

    locADOQuery.Parameters.ParamByName('base_id').Value             := argBaseID;
    locADOQuery.Parameters.ParamByName('licenca_id').Value          := argLicencaID;
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
    locADOQuery.SQL.Add('  [base_id]    = :base_id    AND                ');
    locADOQuery.SQL.Add('  [licenca_id] = :licenca_id AND                ');
    locADOQuery.SQL.Add('  [codigo]     = :codigo                        ');

    locADOQuery.Parameters.ParamByName('base_id').Value             := argBaseID;
    locADOQuery.Parameters.ParamByName('licenca_id').Value          := argLicencaID;
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
                                                 argCriacao      : Boolean;
                                                 argConsulta     : Boolean;
                                                 argAlteracao    : Boolean;
                                                 argExclusao     : Boolean): Integer;
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

  if argCriacao then
    locADOQuery.SQL.Add(' [registro_acao].[criacao]   = ''S'' ');

  if argConsulta then
    locADOQuery.SQL.Add(' [registro_acao].[consulta]  = ''S'' ');

  if argAlteracao then
    locADOQuery.SQL.Add(' [registro_acao].[alteracao] = ''S'' ');

  if argExclusao then
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
