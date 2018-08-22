//
// Arquivo..: Plataforma_ERP_Inicializacao.pas
// Projeto..: ERP
// Fonte....: Unit
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Funções e procedimentos diversos para a inicialização da aplicação de ERP.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_Inicializacao;

interface

uses
  Data.Win.ADODB,
  System.SysUtils,
  Winapi.Windows,
  Vcl.Forms;

procedure Plataforma_ERP_HashCodInicializar;
procedure Plataforma_ERP_LogInicializar;
function  Plataforma_ERP_UsuarioInicializar: Boolean;
function  Plataforma_ERP_UsuarioSenhaTrocaVerificar: Boolean;
procedure Plataforma_ERP_UsuarioRotinasPopular;

implementation

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_Log,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_UsuarioLogon,
  Plataforma_ERP_VCL_UsuarioSenhaTrocar;

const
  FONTE_NOME: string = 'Plataforma_ERP_Inicializacao.pas';

//
// Procedimento para inicializar o hashcode da aplicação.
//
procedure Plataforma_ERP_HashCodInicializar;
var
  locMomento  : string;
  locDrive    : string;
  locProcessID: string;
begin
  locMomento   := FormatDateTime('yyyymmddhhnnsszzz', Now);
  locDrive     := IntegerStringConverter(DriveSerialNumberRecuperar(Copy(gloAppPath, 1, 1)));
  locProcessID := IntegerStringConverter(GetCurrentProcessID);

  gloAppHashCode := locMomento + locDrive + locProcessID;
end;

//
// Procedimento para iniciar o mecanismo de log da aplicação.
//
procedure Plataforma_ERP_LogInicializar;
begin
  gloLocalLog          := TPlataformaFrameworkLog.Create;
  gloLocalLog.FilePath := gloAppPath + '\Log';
  gloLocalLog.FileNameDaily('Plataforma_ERP_VCL');

  Plataforma_ERP_Logar(False, 'Módulo de log inicializado com sucesso!');
end;

//
// Função para inicializar o usuário da aplicação.
//
function Plataforma_ERP_UsuarioInicializar: Boolean;
var
  locFormulario  : TPlataformaERPVCLUsuarioLogon;
  locClicouFechar: Boolean;
begin
  //
  // Usuário não autenticado.
  //
  Result := False;

  //
  // Inicializa usuário.
  //
  gloUsuarioBaseID  := 0;
  gloUsuarioID      := 0;
  gloUsuarioLogon   := '';
  gloUsuarioNome    := '';
  gloUsuarioRotinas := nil;

  //
  // Exibe formulário de logon.
  //
  locFormulario := TPlataformaERPVCLUsuarioLogon.Create(nil);
  locFormulario.ShowModal;
  locClicouFechar := locFormulario.pubClicouFechar;
  locFormulario.Release;
  FreeAndNil(locFormulario);

  //
  // Usuário clicou em fechar no formulário de logon.
  //
  if locClicouFechar then Exit;

  //
  // Usuário deve trocar a senha?
  //
  if not Plataforma_ERP_UsuarioSenhaTrocaVerificar then Exit;
  
  //
  // Lista de rotinas.
  //
  Plataforma_ERP_UsuarioRotinasPopular;

  //
  // Usuário autenticado.
  //
  Result := True;
end;

//
// Função para verificar e executar a troca de senha do usuário se for o caso.
//
function Plataforma_ERP_UsuarioSenhaTrocaVerificar: Boolean;
const
  PROCEDIMENTO_NOME: string = 'Plataforma_ERP_UsuarioSenhaTrocaVerificar';
  ERRO_MENSAGEM    : string = 'Impossível recuperar informações sobre uma possível troca de senha do usuário!';
var
  locFormulario   : TPlataformaERPVCLUsuarioSenhaTrocar;
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
  locSenhaTrocar  : Boolean;
begin
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
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      raise Exception.Create(StringConcatenar(ERRO_MENSAGEM, locExcecao.Message));
      Exit;
    end;
  end;

  //
  // Query.
  //
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Consulta dados do usuário.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                               ');
  locADOQuery.SQL.Add('  [usuario].[senha_trocar]                           ');
  locADOQuery.SQL.Add('FROM                                                 ');
  locADOQuery.SQL.Add('  [usuario] WITH (NOLOCK)                            ');
  locADOQuery.SQL.Add('WHERE                                                ');
  locADOQuery.SQL.Add('  [usuario].[licenca_id]      = :licenca_id      AND ');
  locADOQuery.SQL.Add('  [usuario].[usuario_base_id] = :usuario_base_id AND ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id]      = :usuario_id          ');
                                                              
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := gloLicencaID;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value := gloUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value      := gloUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [usuario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      raise Exception.Create(StringConcatenar(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message));
      Exit;
    end;
  end;

  //
  // Registro encontrado.
  //
  locSenhaTrocar := False;
  if locADOQuery.RecordCount > 0 then
  begin
    //
    // Carrega componentes.
    //
    locSenhaTrocar := StringBooleanConverter(locADOQuery.FieldByName('senha_trocar').AsString);
  end; 

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);

  //
  // A senha não deve ser trocada.
  //
  if not locSenhaTrocar then
  begin
    Result := True;
    Exit;
  end;

  //
  // A senha deve ser trocada.
  //
  locFormulario := TPlataformaERPVCLUsuarioSenhaTrocar.Create(nil);
  locFormulario.ShowModal;

  Result := (not locFormulario.pubClicouFechar);

  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para carregar o array de rotinas do usuário.
//
procedure Plataforma_ERP_UsuarioRotinasPopular;
const
  PROCEDIMENTO_NOME: string = 'FormularioConfirmar';
  ERRO_MENSAGEM    : string = 'Impossível recuperar rotinas da aplicação do usuário!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
begin
  //
  // Inicializa array.
  //
  gloUsuarioRotinas := nil;

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
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      raise Exception.Create(StringConcatenar(ERRO_MENSAGEM, locExcecao.Message));
      Exit;
    end;
  end;

  //
  // Query.
  //
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Consulta dados do usuário.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                       ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[chave]                 ');
  locADOQuery.SQL.Add('FROM                                         ');
  locADOQuery.SQL.Add('  [rotina_aplicacao] WITH (NOLOCK)           ');
  locADOQuery.SQL.Add('WHERE                                        ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[bloqueado] = ''N'' AND ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[ativo]     = ''S''     ');
                                                              
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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar registros da tabela [rotina_aplicacao]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      raise Exception.Create(StringConcatenar(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message));
      Exit;
    end;
  end;

  //
  // Posiciona no primeiro registro.
  //
  locADOQuery.Last;
  locADOQuery.First;

  //
  // Registro encontrado.
  //
  if locADOQuery.RecordCount > 0 then
  begin
    while not locADOQuery.EOF do
    begin
      SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
      gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := locADOQuery.FieldByName('chave').AsString;
    
      locADOQuery.Next;
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

end.
