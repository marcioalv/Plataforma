{+------------------------------------------------------------------------------------------------+}
{| Plataforma Tecnologia e Informa��o Ltda                               CNPJ: 22.508.362/0001-20 |}
{+------------------------------------------------------------------------------------------------+}
{| Projeto: Framework                                                                             |}
{|   Fonte: Plataforma_Framework_Conexao.pas                                                      |}
{+------------------------------------------------------------------------------------------------+}
{| Procedimentos e fun��o para tratar assuntos diversos de conex�o ao banco de dados.             |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 23/Fevereiro/2017 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
{| Todos os direitos reservados:                                                                  |}
{| O c�digo fonte com o programa de computador contido nesse arquivo s�o de propriedade           |}
{| exclusiva da empresa Plataforma Tecnologia e Informa��o Ltda, e seus direitos autorais s�o     |}
{| protegidos por lei.                                                                            |}
{| Nenhuma parte pode ser acessada, visualizada, utilizada, modificada, copiada ou transferida    |}
{| sem pr�via permiss�o por escrito da propriet�ria.                                              |}
{| A viola��o de qualquer um destes direitos � crime!                                             |}
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
  MODO_ACESSO_PRIVADO_TITULO: string = 'Conex�o privada do cliente';
 
  SGBD_SQL_SERVER           : string = 'SQL_SERVER';
  SGBD_MY_SQL               : string = 'MY_SQL';

  SGBD_SQL_SERVER_TITULO    : string = 'SQL Server';
  SGBD_MY_SQL_TITULO        : string = 'MySQL';

/// <summary>
/// Record para armazenar as configura��es de uma conex�o ao aplicativo.
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
/// Vari�vel do tipo TConexao que ser� limpada.
/// </param>
procedure ConexaoLimpar(var argConexao: TConexao);

/// <summary>
/// Fun��o para gerar uma string de conex�o ADO.
/// <summary>
/// <param name="argConexao">
/// Record do tipo TConexao com os dados da conex�o.
/// </param>
/// <returns>
/// Retorna uma string de conex�o ADO.
/// </returns>
function ADOConexaoStringGerar(argConexao: TConexao): string;

/// <summary>
/// Fun��o para gerar uma string de conex�o ADO.
/// <summary>
/// <param name="argSGBD">
/// O tipo do sistema gerenciador de banco de dados, utilizar as constantes:
/// SGBD_SQL_SERVER.
/// SGBD_MY_SQL.
/// </param>
/// <param name="argServidor">
/// Endere�o DNS ou TCP/IP do servidor do SGBD.
/// </param>
/// <param name="argPorta">
/// Porta TCP/IP do servi�o no servidor.
/// </param>
/// <param name="argInst�ncia">
/// Inst�ncia do servi�o do SGBD no servidor.
/// </param>
/// <param name="argUsuario">
/// Usu�rio para conex�o ao SGBD.
/// </param>
/// <param name="argSenha">
/// Senha do usu�rio para conex�o ao SGBD.
/// </param>
/// <param name="argBancoDados">
/// Bando de dados (cat�logo) no SGBD.
/// </param>
/// <returns>
/// Retorna uma string de conex�o ADO.
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
/// Procedimento para testar se uma conex�o ADO est� OK.
/// <summary>
/// <param name="argConexao">
/// Record TConexao com os dados da conex�o.
/// </param>
/// <param name="argSucesso">
/// Par�metro de retorno que ir� indicar se a conex�o ocorreu com sucesso ou n�o.
/// </param>
/// <param name="argMensagem">
/// Par�metro de retorno que ir� conter uma poss�vel mensagem de execu��o do teste.
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
{| Fun��o para gerar uma string de conex�o ADO.                                                  |}
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
  // Consist�ncias.
  //
  if StringTrim(argServidor) = '' then
  begin
    raise Exception.Create('O nome do servidor do banco de dados da conex�o deve ser informado!');
  end;

  if StringTrim(argUsuario) = '' then
  begin
    raise Exception.Create('O usu�rio para conex�o ao banco de dados deve ser informado!');
  end;

  if StringTrim(argBancoDados) = '' then
  begin
    raise Exception.Create('O nome do banco de dados (cat�logo) no servidor deve ser informado!');
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
  // Endere�o.
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
  // Usu�rio.
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
  // Retorna string de conex�o.
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

  // Endere�o.
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

  // Usu�rio.
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

  // Conex�o confi�vel se SQLServer.
  if argSGBD = SGBD_SQL_SERVER then
  begin
    if Result <> '' then Result := Result + ';';  
    Result := Result + 'Trusted_Connection=True';
  END;

  // Op��o especial se MySQL.
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
  // Retorno padr�o.
  //
  argSucesso  := False;
  argMensagem := '';

  //
  // Tenta uma conex�o.
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
  // Conex�o estabelecida com sucesso.
  //
  argSucesso := True;
end;

end.
