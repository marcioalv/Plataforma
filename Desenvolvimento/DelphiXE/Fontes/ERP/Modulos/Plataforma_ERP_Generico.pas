//
// Arquivo..: Plataforma_ERP_Generico.pas
// Projeto..: ERP
// Fonte....: Unit
// Cria��o..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Fun��es e procedimentos diversos de uso gen�rico da aplica��o de ERP.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_Generico;

interface

uses
  Data.Win.ADODB,
  System.SysUtils,
  Plataforma_Framework_Util,
  Plataforma_ERP_Global;

const
  NUMERADOR_TIPO_USUARIO_ID: string = 'tipo_usuario_id';

// PlataformaERPLogar.
procedure Plataforma_ERP_Logar(argCritico  : Boolean;
                               argMensagem1: string;
                               argMensagem2: string = '';
                               argMensagem3: string = '';
                               argMensagem4: string = '';
                               argMensagem5: string = '';
                               argMensagem6: string = '');

// PlataformaERPADOConnectionInicializar.
procedure Plataforma_ERP_ADO_ConexaoAbrir(argADOConnection: TADOConnection);

// PlataformaERPConexaoADOConsistir.
procedure PlataformaERPConexaoADOConsistir(argADOConnection: TADOConnection);

// PlataformaERPConexaoADONumeradorLicenca.
function PlataformaERPConexaoADONumeradorLicenca(argADOConnection: TADOConnection;
                                                 argBaseID       : Integer;
                                                 argLicencaID    : Integer;
                                                 argCodigo       : string;
                                                 argUsuarioBaseID: Integer;
                                                 argUsuarioID    : Integer): Integer;

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
// PlataformaERPADOConnectionInicializar.
//
procedure Plataforma_ERP_ADO_ConexaoAbrir(argADOConnection: TADOConnection);
const
  PROCEDIMENTO_NOME: string = 'Plataforma_ERP_ADO_ConexaoAbrir';
var
  locLogMsg: string;
begin
  // String de conex�o ADO.
  argADOConnection.ConnectionString  := gloConexaoADOString;

  // Time-out de conex�o.
  argADOConnection.ConnectionTimeout := gloConexaoTimeOut;

  try
    // Abre conex�o com o banco de dados da aplica��o.
    argADOConnection.Open;
  except
    on locExcecao: Exception do
    begin
      locLogMsg := StringConcatenar('Ocorreu um problema ao estabelecer uma conex�o com o banco de dados da aplica��o!', 'Tente novamente!');
      Plataforma_ERP_Logar(True, locLogMsg, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      raise Exception.Create(StringConcatenar(locLogMsg, locExcecao.Message));
    end;
  end;
end;

//
// PlataformaERPADOConexaoConsistir.
//
procedure PlataformaERPConexaoADOConsistir(argADOConnection: TADOConnection);
const
  PROCEDIMENTO_NOME: string = 'PlataformaERPConexaoADOConsistir';
var
  locMsgErro: string;
begin
  // O objeto de conex�o ADO est� instanciado?
  if argADOConnection = nil then
  begin
    locMsgErro := 'O objeto de conex�o ADO com o banco de dados n�o foi instanciado!';
    Plataforma_ERP_Logar(True, locMsgErro, FONTE_NOME, PROCEDIMENTO_NOME);
    raise Exception.Create(locMsgErro);
  end;

  // A conex�o ADO est� estabelecida?
  if not argADOConnection.Connected then
  begin
    locMsgErro := 'A conex�o ADO com o banco de dados n�o foi estabelecida!';
    Plataforma_ERP_Logar(True, locMsgErro, FONTE_NOME, PROCEDIMENTO_NOME);
    raise Exception.Create(locMsgErro);
  end;
end;

//
// PlataformaERPConexaoADONumeradorLicenca.
//
function PlataformaERPConexaoADONumeradorLicenca(argADOConnection: TADOConnection;
                                                 argBaseID       : Integer;
                                                 argLicencaID    : Integer;
                                                 argCodigo       : string;
                                                 argUsuarioBaseID: Integer;
                                                 argUsuarioID    : Integer): Integer;
const
  FUNCAO_NOME: string = 'PlataformaERPConexaoADONumeradorLicenca';
var
  locMsgErro : string;
  locADOQuery: TADOQuery;
begin
  // Consiste o objeto de conex�o ADO.
  try
    PlataformaERPConexaoADOConsistir(argADOConnection);
  except
    on locExcecao: Exception do
    begin
      locMsgErro := 'Imposs�vel determinar o pr�ximo ID para o numerador [' + argCodigo + ']!';
      Plataforma_ERP_Logar(True, locMsgErro, FONTE_NOME, FUNCAO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;
  
  // Instancia e configura o objeto de query ADO com o banco de dados.
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := argADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  // Monta SQL para consistir se o c�digo informado � �nico.
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

  // Passa par�metros.
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

  // Se nenhum registro existir com o c�digo do numerador informado.
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

end.
