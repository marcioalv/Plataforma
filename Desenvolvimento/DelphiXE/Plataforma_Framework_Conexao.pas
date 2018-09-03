{+------------------------------------------------------------------------------------------------+}
{| Plataforma Tecnologia e Informação Ltda                               CNPJ: 22.508.362/0001-20 |}
{+------------------------------------------------------------------------------------------------+}
{| Projeto: Framework                                                                             |}
{|   Fonte: Plataforma_Framework_Conexao.pas                                                      |}
{+------------------------------------------------------------------------------------------------+}
{| Procedimentos e função para tratar assuntos diversos de conexão ao banco de dados.             |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 23/Fevereiro/2017 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
{| Todos os direitos reservados:                                                                  |}
{| O código fonte com o programa de computador contido nesse arquivo são de propriedade           |}
{| exclusiva da empresa Plataforma Tecnologia e Informação Ltda, e seus direitos autorais são     |}
{| protegidos por lei.                                                                            |}
{| Nenhuma parte pode ser acessada, visualizada, utilizada, modificada, copiada ou transferida    |}
{| sem prévia permissão por escrito da proprietária.                                              |}
{| A violação de qualquer um destes direitos é crime!                                             |}
{+------------------------------------------------------------------------------------------------+}

unit Plataforma_Framework_Conexao;

interface

uses
  Plataforma_Framework_Util,
  System.SysUtils,
  Data.Win.ADODB;

const
  MODO_ACESSO_CLOUD         : string = 'CLOUD';
  MODO_ACESSO_PRIVADO       : string = 'PRIVADO';

  MODO_ACESSO_CLOUD_TITULO  : string = 'Nuvem da Plataforma TI (cloud)';
  MODO_ACESSO_PRIVADO_TITULO: string = 'Conexão privada do cliente';
 
  SGBD_SQL_SERVER           : string = 'SQL_SERVER';
  SGBD_MY_SQL               : string = 'MY_SQL';

  SGBD_SQL_SERVER_TITULO    : string = 'SQL Server';
  SGBD_MY_SQL_TITULO        : string = 'MySQL';

/// <summary>
/// Record para armazenar as configurações de uma conexão ao aplicativo.
/// <summary>
type
  TConexao = record
    Item       : Integer;
    Titulo     : string;
    Modo       : string;
    ChaveCodigo: string;
    ChaveID    : Integer;
    BaseID     : Integer;
    SGBD       : string;
    Driver     : string;
    Servidor   : string;
    Porta      : Integer;
    Instancia  : string;
    Usuario    : string;
    Senha      : string;
    BancoDados : string;
    TimeOut    : Integer;
  end;         

/// <summary>
/// Array representando uma lista de records do tipo TConexao.
/// <summary>
type
  TListaConexoes = array of TConexao;
    
/// <summary>
/// Procedimento para limpar os atributos de um record TConexao.
/// <summary>
/// <param name="argConexao">
/// Variável do tipo TConexao que será limpada.
/// </param>
procedure ConexaoLimpar(var argConexao: TConexao);

/// <summary>
/// Função para gerar uma string de conexão ADO.
/// <summary>
/// <param name="argConexao">
/// Record do tipo TConexao com os dados da conexão.
/// </param>
/// <returns>
/// Retorna uma string de conexão ADO.
/// </returns>
function ADOConexaoStringGerar(argConexao: TConexao): string;

/// <summary>
/// Função para gerar uma string de conexão ADO.
/// <summary>
/// <param name="argSGBD">
/// O tipo do sistema gerenciador de banco de dados, utilizar as constantes:
/// SGBD_SQL_SERVER.
/// SGBD_MY_SQL.
/// </param>
/// <param name="argServidor">
/// Endereço DNS ou TCP/IP do servidor do SGBD.
/// </param>
/// <param name="argPorta">
/// Porta TCP/IP do serviço no servidor.
/// </param>
/// <param name="argInstância">
/// Instância do serviço do SGBD no servidor.
/// </param>
/// <param name="argUsuario">
/// Usuário para conexão ao SGBD.
/// </param>
/// <param name="argSenha">
/// Senha do usuário para conexão ao SGBD.
/// </param>
/// <param name="argBancoDados">
/// Bando de dados (catálogo) no SGBD.
/// </param>
/// <returns>
/// Retorna uma string de conexão ADO.
/// </returns>
function ADOConnectionStringGerar(argSGBD      : string;
                                  argDriver    : string;
                                  argServidor  : string;
                                  argInstancia : string;
                                  argPorta     : Integer;
                                  argUsuario   : string;
                                  argSenha     : string;
                                  argBancoDados: string): string;

/// <summary>
/// Procedimento para testar se uma conexão ADO está OK.
/// <summary>
/// <param name="argConexao">
/// Record TConexao com os dados da conexão.
/// </param>
/// <param name="argSucesso">
/// Parâmetro de retorno que irá indicar se a conexão ocorreu com sucesso ou não.
/// </param>
/// <param name="argMensagem">
/// Parâmetro de retorno que irá conter uma possível mensagem de execução do teste.
/// </param>
procedure ADOConexaoTestar(argConexao     : TConexao;
                           var argSucesso : Boolean;
                           var argMensagem: string);

implementation

{+------------------------------------------------------------------------------------------------+}
{| ConexaoLimpar                                                                                  |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 23/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure ConexaoLimpar(var argConexao: TConexao);
begin
  with argConexao do
  begin
    Item        := 0;
    Titulo      := '';
    Modo        := '';
    ChaveCodigo := '';
    ChaveID     := 0;
    BaseID      := 0;
    SGBD        := '';
    Driver      := '';
    Servidor    := '';
    Porta       := 0;
    Instancia   := '';
    Usuario     := '';
    Senha       := '';
    BancoDados  := '';
    TimeOut     := 0;
  end;
end;

{+-----------------------------------------------------------------------------------------------+}
{| ADOConnectionStringGerar                                                                      |}
{+-----------------------------------------------------------------------------------------------+}
{| Função para gerar uma string de conexão ADO.                                                  |}
{+-----------------------------------------------------------------------------------------------+}
{| Criado em 23/Fevereiro/2018 por Marcio Alves.                                                 |}
{+-----------------------------------------------------------------------------------------------+}
function ADOConnectionStringGerar(argSGBD      : string;
                                  argDriver    : string;
                                  argServidor  : string;                                  
                                  argInstancia : string;
                                  argPorta     : Integer;
                                  argUsuario   : string;
                                  argSenha     : string;
                                  argBancoDados: string): string;
var
  locDriver    : string;
  locEndereco  : string;
  locUsuario   : string;
  locSenha     : string;
  locBancoDados: string;
begin
  //
  // Consistências.
  //
  if StringTrim(argServidor) = '' then
  begin
    raise Exception.Create('O nome do servidor do banco de dados da conexão deve ser informado!');
  end;

  if StringTrim(argUsuario) = '' then
  begin
    raise Exception.Create('O usuário para conexão ao banco de dados deve ser informado!');
  end;

  if StringTrim(argBancoDados) = '' then
  begin
    raise Exception.Create('O nome do banco de dados (catálogo) no servidor deve ser informado!');
  end;

  //
  // Driver.
  //
  if argSGBD = SGBD_SQL_SERVER then
  begin
    locDriver := 'SQLOLEDB.1';
  end;

  if argSGBD = SGBD_MY_SQL then
  begin
    locDriver := argDriver;
  end;

  //
  // Endereço.
  //
  locEndereco := argServidor;

  if argInstancia <> '' then
  begin
    locEndereco := locEndereco + '\' + argInstancia;
  end;

  //
  // Porta.
  //
  if argPorta > 0 then
  begin
    if argSGBD = SGBD_SQL_SERVER then
    begin
      locEndereco := 'tcp:' + locEndereco;
      locEndereco := locEndereco + ',' + IntToStr(argPorta);
    end;
  end;

  //
  // Usuário.
  //
  locUsuario := argUsuario;

  //
  // Senha.
  //
  locSenha := argSenha;

  //
  // Banco de dados.
  //
  locBancoDados := argBancoDados;

  //
  // Retorna string de conexão.
  //
  Result := '';

  // Driver.
  if locDriver <> '' then
  begin
    if Result <> '' then Result := Result + ';';

    if argSGBD = SGBD_SQL_SERVER then
    begin
      Result := Result + 'Provider=' + locDriver;
    end;

    if argSGBD = SGBD_MY_SQL then
    begin
      Result := Result + 'Driver={' + locDriver + '}';
    end;
  end;

  // Endereço.
  if locEndereco <> '' then
  begin
    if Result <> '' then Result := Result + ';';

    if argSGBD = SGBD_SQL_SERVER then
    begin
      Result := Result + 'Address=' + locEndereco;
    end;

    if argSGBD = SGBD_MY_SQL then
    begin
      Result := Result + 'Server=' + locEndereco;
    end;    
  end;

  //
  // Porta.
  //
  if argPorta > 0 then
  begin
    if argSGBD = SGBD_MY_SQL then
    begin
      if Result <> '' then Result := Result + ';';    
      Result := Result + 'Port=' + IntToStr(argPorta);
    end;
  end;  

  // Usuário.
  if locUsuario <> '' then
  begin
    if Result <> '' then Result := Result + ';';

    Result := Result + 'UID=' + locUsuario;
  end;

  // Senha.
  if locSenha <> '' then
  begin
    if Result <> '' then Result := Result + ';';
    Result := Result + 'PWD=' + locSenha;
  end;

  // Banco de dados.
  if locBancoDados <> '' then
  begin
    if Result <> '' then Result := Result + ';';
    Result := Result + 'Database=' + locBancoDados;
  end;

  // Conexão confiável se SQLServer.
  if argSGBD = SGBD_SQL_SERVER then
  begin
    if Result <> '' then Result := Result + ';';  
    Result := Result + 'Trusted_Connection=True';
  END;

  // Opção especial se MySQL.
  if argSGBD = SGBD_MY_SQL then
  begin
    if Result <> '' then Result := Result + ';';  
    Result := Result + 'Option=3';
  END;  
end;

{+-----------------------------------------------------------------------------------------------+}
{| ADOConexaoStringGerar                                                                         |}
{+-----------------------------------------------------------------------------------------------+}
{| Criado em 23/Fevereiro/2018 por Marcio Alves.                                                 |}
{+-----------------------------------------------------------------------------------------------+}
function ADOConexaoStringGerar(argConexao: TConexao): string;
begin
  Result := ADOConnectionStringGerar(argConexao.SGBD,
                                     argConexao.Driver,
                                     argConexao.Servidor,
                                     argConexao.Instancia,
                                     argConexao.Porta,
                                     argConexao.Usuario,
                                     argConexao.Senha,
                                     argConexao.BancoDados);
end;

{+-----------------------------------------------------------------------------------------------+}
{| ADOConexaoTestar                                                                              |}
{+-----------------------------------------------------------------------------------------------+}
{| Criado em 23/Fevereiro/2018 por Marcio Alves.                                                 |}
{+-----------------------------------------------------------------------------------------------+}
procedure ADOConexaoTestar(argConexao     : TConexao;
                           var argSucesso : Boolean;
                           var argMensagem: string);
var
  locADOConexao: TADOConnection;
begin
  //
  // Retorno padrão.
  //
  argSucesso  := False;
  argMensagem := '';

  //
  // Tenta uma conexão.
  //
  locADOConexao := TADOConnection.Create(nil);

  try
    locADOConexao.ConnectionString  := ADOConexaoStringGerar(argConexao);
    locADOConexao.ConnectionTimeout := argConexao.TimeOut;
    locADOConexao.Open;
  except
    on locErro: Exception do
    begin
      argMensagem := locErro.Message;
      Exit;
    end;
  end;

  //
  // Conexão estabelecida com sucesso.
  //
  argSucesso := True;
end;

end.
