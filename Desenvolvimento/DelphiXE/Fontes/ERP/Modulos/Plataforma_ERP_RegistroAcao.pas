//
// Arquivo..: Plataforma_ERP_RegistroAcao.pas
// Projeto..: ERP
// Fonte....: Unit
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Funções e procedimentos diversos para tratar ações com registros.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_RegistroAcao;

interface

uses
  System.SysUtils,
  Data.Win.ADODB,
  Plataforma_Framework_Util,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico;

const
  UNIT_NOME: string = 'Plataforma_ERP_RegistroAcao.pas'; 

// TPlataforma_ERP_RegistroAcao.
type
  TPlataforma_ERP_RegistroAcao = record
    RegistroAcaoID: Integer;
    Titulo        : string;
    Bloqueado     : Boolean;
    Ativo         : Boolean;
  end;

// Plataforma_ERP_RegistroAcaoLimpar.
procedure Plataforma_ERP_RegistroAcaoLimpar(argRegistroAcao: TPlataforma_ERP_RegistroAcao);  

// PlataformaERPRegistroAcaoCodigoDeterminar.
function PlataformaERPRegistroAcaoCodigoDeterminar(argADOConnection: TADOConnection;
                                                   argCriacao      : Boolean;
                                                   argConsulta     : Boolean;
                                                   argAlteracao    : Boolean;
                                                   argExclusao     : Boolean): Integer;

implementation

//
// Plataforma_ERP_RegistroAcaoLimpar.
//
procedure Plataforma_ERP_RegistroAcaoLimpar(argRegistroAcao: TPlataforma_ERP_RegistroAcao);
begin
  with argRegistroAcao do
  begin
    RegistroAcaoID := 0;
    Titulo         := '';
    Bloqueado      := False;
    Ativo          := False;
  end;
end;

//
// PlataformaERPRegistroAcaoCodigoDeterminar.
//
function PlataformaERPRegistroAcaoCodigoDeterminar(argADOConnection: TADOConnection;
                                                   argCriacao      : Boolean;
                                                   argConsulta     : Boolean;
                                                   argAlteracao    : Boolean;
                                                   argExclusao     : Boolean): Integer;
const
  FUNCAO_NOME: string = 'PlataformaERPRegistroAcaoCodigoDeterminar';
var
  locMsgErro : string;
  locADOQuery: TADOQuery;
begin
  // Valor de retorno padrão.
  Result := 0;

  // Consiste o objeto de conexão ADO.
  try
    PlataformaERPConexaoADOConsistir(argADOConnection);
  except
    on locExcecao: Exception do
    begin
      locMsgErro := 'Impossível consistir o código do tipo de usuário!';
      Plataforma_ERP_Logar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
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
      Plataforma_ERP_Logar(True, locMsgErro, locExcecao.Message, UNIT_NOME, FUNCAO_NOME);
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
