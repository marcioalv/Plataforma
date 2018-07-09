//
// Arquivo..: Plataforma_ERP_TipoUsuario.pas
// Projeto..: ERP
// Fonte....: Unit de procedimentos e fun��es.
// Cria��o..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Procedimentos e fun��es diversas para tipos de usu�rio.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_TipoUsuario;

interface

uses
  Data.Win.ADODB,
  System.SysUtils,
  Plataforma_Framework_Util,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico;

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
                                            argTipoUsuarioID: Integer;
                                            argBaseID       : Integer;
                                            argLicencaID    : Integer;
                                            argCodigo       : string;
                                            argTitulo       : string;
                                            argBloqueado    : Boolean;
                                            argAtivo        : Boolean);

implementation

const
  UNIT_NOME: string = 'Plataforma_ERP_TipoUsuario.pas';

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
  // Valor de retorno padr�o.
  Result := False;

  // Consiste o objeto de conex�o ADO.
  try
    PlataformaERPConexaoADOConsistir(argADOConnection);
  except
    on locExcecao: Exception do
    begin
      locMsgErro := 'Imposs�vel consistir o c�digo do tipo de usu�rio!';
      PlataformaERPLogar(True, locMsgErro, UNIT_NOME, FUNCAO_NOME);
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
  locADOQuery.SQL.Add('SELECT TOP 1                          ');
  locADOQuery.SQL.Add('  1                                   ');
  locADOQuery.SQL.Add('FROM                                  ');
  locADOQuery.SQL.Add('  [tipo_usuario]                      ');
  locADOQuery.SQL.Add('WHERE                                 ');
  locADOQuery.SQL.Add('  :base_id         = :base_id    AND  ');
  locADOQuery.SQL.Add('  :licenca_id      = :licenca_id AND  ');
  locADOQuery.SQL.Add('  :tipo_usuario_id = :tipo_usuario_id ');

  // Passa par�metros.
  locADOQuery.Parameters.ParamByName('base_id').Value         := argBaseID;
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := argLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value := locTipoUsuarioID;
  locADOQuery.Parameters.ParamByName('codigo').Value          := argCodigo;

  // Executa query.
  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locMsgErro := 'Ocorreu algum erro ao executar o comando SQL para consultar se um c�digo existe na tabela [tipo_usuario]!';
      PlataformaERPLogar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;

  // O c�digo j� existe na tabela.
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
  // Valor de retorno padr�o.
  Result := 0;

  // Consiste o objeto de conex�o ADO.
  try
    PlataformaERPConexaoADOConsistir(argADOConnection);
  except
    on locExcecao: Exception do
    begin
      locMsgErro := 'Imposs�vel inserir registro de tipo de usu�rio na base de dados da aplica��o!';
      PlataformaERPLogar(True, locMsgErro, UNIT_NOME, FUNCAO_NOME);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;

  // Consiste c�digo �nico.
  try
    if not PlataformaERPTipoUsuarioADOCodigoConsistir(argADOConnection, argBaseID, argLicencaID, argCodigo) then
    begin
      locMsgErro := 'O c�digo do tipo de usu�rio informado j� existe em algum outro cadastro!';
      PlataformaERPLogar(False, 
      raise Exception.Create(locMsgErro,);
    end;
  except
    on locExcecao: Exception do
    begin
      
    end;
  end; 
  
  // Instancia e configura o objeto de query ADO com o banco de dados.
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := argADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  // Pr�ximo ID do tipo do usu�rio.
  locTipoUsuarioID := 0;

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
  locADOQuery.SQL.Add('  [upd_seq]                 ');  
  locADOQuery.SQL.Add(')                           ');
  locADOQuery.SQL.Add('VALUES (                    ');
  locADOQuery.SQL.Add('  :base_id,                 '); // base_id.
  locADOQuery.SQL.Add('  :licenca_id,              '); // licenca_id.
  locADOQuery.SQL.Add('  :tipo_usuario_id,         '); // tipo_usuario_id.
  locADOQuery.SQL.Add('  :codigo,                  '); // codigo.
  locADOQuery.SQL.Add('  :titulo,                  '); // titulo.
  locADOQuery.SQL.Add('  :bloqueado,               '); // bloqueado.
  locADOQuery.SQL.Add('  :ativo                    '); // ativo.
  locADOQuery.SQL.Add('  :local_dt_hr,             '); // ins_local_dt_hr.
  locADOQuery.SQL.Add('  GETDATE(),                '); // ins_server_dt_hr.
  locADOQuery.SQL.Add('  NULL,                     '); // upd_local_dt_hr.
  locADOQuery.SQL.Add('  NULL,                     '); // upd_server_dt_hr.
  locADOQuery.SQL.Add('  NULL                      '); // upd_seq.
  locADOQuery.SQL.Add(')                           ');

  // Passa par�metros.
  locADOQuery.Parameters.ParamByName('base_id').Value         := argBaseID;
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := argLicencaID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value := locTipoUsuarioID;
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
      locMsgErro := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [tipo_usuario]!';
      PlataformaERPLogar(True, locMsgErro, locExcecao.Message);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;

  // Finaliza objetos.
  locADOQuery.Close;
  FreeAndNil(locADOQuery);

  // Retorna o ID do tipo do usu�rio que foi inserido.
  Result := locTipoUsuarioID;
end;

//
// PlataformaERPTipoUsuarioADOUpdate.
//
procedure PlataformaERPTipoUsuarioADOUpdate(argADOConnection: TADOConnection;
                                            argTipoUsuarioID: Integer;
                                            argBaseID       : Integer;
                                            argLicencaID    : Integer;
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
  // Consiste o objeto de conex�o ADO.
  try
    PlataformaERPConexaoADOConsistir(argADOConnection);
  except
    on locExcecao: Exception do
    begin
      locMsgErro := 'Imposs�vel atualizar registro de tipo de usu�rio na base de dados da aplica��o!';
      PlataformaERPLogar(True, locMsgErro, UNIT_NOME, PROCEDIMENTO_NOME);
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

  // Passa par�metros.
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
      PlataformaERPLogar(True, locMsgErro, locExcecao.Message);
      raise Exception.Create(StringConcatenar(locMsgErro, locExcecao.Message));
    end;
  end;

  // Finaliza objetos.
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
end;

end.
