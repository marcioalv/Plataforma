{+------------------------------------------------------------------------------------------------+}
{| Plataforma Tecnologia e Informa��o Ltda                               CNPJ: 22.508.362/0001-20 |}
{+------------------------------------------------------------------------------------------------+}
{| Projeto: ERP                                                                                   |}
{|   Fonte: Plataforma_ERP_Principal_Unit_ArquivoInicializacao.pas                                |}
{+------------------------------------------------------------------------------------------------+}
{| Procedimentos e fun��es gen�ricas de conex�o do aplicativo.                                    |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2017 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
{| Todos os direitos reservados:                                                                  |}
{| O c�digo fonte com o programa de computador contido nesse arquivo s�o de propriedade           |}
{| exclusiva da empresa Plataforma Tecnologia e Informa��o Ltda, e seus direitos autorais s�o     |}
{| protegidos por lei.                                                                            |}
{| Nenhuma parte pode ser acessada, visualizada, utilizada, modificada, copiada ou transferida    |}
{| sem pr�via permiss�o por escrito da propriet�ria.                                              |}
{| A viola��o de qualquer um destes direitos � crime!                                             |}
{+------------------------------------------------------------------------------------------------+}

unit Plataforma_ERP_Principal_Unit_ArquivoInicializacao;

interface

uses
  System.SysUtils,
  Plataforma_Framework_Util,
  Plataforma_Framework_Conexao,
  Plataforma_Framework_ArquivoIni,
  Plataforma_ERP_Principal_Unit_Global;

const
  ARQUIVO_INI_ULTIMO_ACESSO_SESSAO               : string = 'ULTIMO_ACESSO';
  ARQUIVO_INI_ULTIMO_ACESSO_CONEXAO_TITULO       : string = 'CONEXAO_TITULO';
  ARQUIVO_INI_ULTIMO_ACESSO_CONEXAO_ITEM         : string = 'CONEXAO_ITEM';  
  ARQUIVO_INI_ULTIMO_ACESSO_LOGON                : string = 'LOGON';
  ARQUIVO_INI_ULTIMO_ACESSO_MEMORIZAR            : string = 'MEMORIZAR';

  ARQUIVO_INI_CONEXAO_GERAL                      : string = 'GERAL';
  ARQUIVI_INI_CONEXAO_GERAL_QUANTIDADE           : string = 'QUANTIDADE_CONEXOES';
  ARQUIVO_INI_CONEXAO_SESSAO                     : string = 'CONEXAO';
  ARQUIVO_INI_CONEXAO_PARAMETRO_ITEM             : string = 'ITEM';
  ARQUIVO_INI_CONEXAO_PARAMETRO_MODO             : string = 'MODO';
  ARQUIVO_INI_CONEXAO_PARAMETRO_CHAVE_CODIGO     : string = 'CHAVE_CODIGO';
  ARQUIVO_INI_CONEXAO_PARAMETRO_CHAVE_ID         : string = 'CHAVE_ID';
  ARQUIVO_INI_CONEXAO_PARAMETRO_BASE_ID          : string = 'BASE_ID';
  ARQUIVO_INI_CONEXAO_PARAMETRO_TITULO           : string = 'TITULO';
  ARQUIVO_INI_CONEXAO_PARAMETRO_SGBD             : string = 'SGBD';
  ARQUIVO_INI_CONEXAO_PARAMETRO_DRIVER           : string = 'DRIVER';
  ARQUIVO_INI_CONEXAO_PARAMETRO_SERVIDOR         : string = 'SERVIDOR';
  ARQUIVO_INI_CONEXAO_PARAMETRO_PORTA            : string = 'PORTA';
  ARQUIVO_INI_CONEXAO_PARAMETRO_INSTANCIA        : string = 'INSTANCIA';
  ARQUIVO_INI_CONEXAO_PARAMETRO_USUARIO          : string = 'USUARIO';
  ARQUIVO_INI_CONEXAO_PARAMETRO_SENHA            : string = 'SENHA';
  ARQUIVO_INI_CONEXAO_PARAMETRO_BANCO_DADOS      : string = 'BANCO_DADOS';
  ARQUIVO_INI_CONEXAO_PARAMETRO_TIME_OUT         : string = 'TIME_OUT';
  ARQUIVO_INI_CONEXAO_PARAMETRO_INS_DT_HR        : string = 'INS_DT_HR';
  ARQUIVO_INI_CONEXAO_PARAMETRO_INS_USER         : string = 'INS_USER';
  ARQUIVO_INI_CONEXAO_PARAMETRO_INS_HOST         : string = 'INS_HOST';

  ARQUIVO_INI_LOGON_USUARIO_GERAL                : string = 'GERAL';
  ARQUIVO_INI_LOGON_USUARIO_GERAL_QUANTIDADE     : string = 'QUANTIDADE_USUARIOS';
  ARQUIVO_INI_LOGON_USUARIO_SESSAO               : string = 'LOGON_USUARIO';
  ARQUIVO_INI_LOGON_USUARIO_PARAMETRO_ITEM       : string = 'ITEM';
  ARQUIVO_INI_LOGON_USUARIO_PARAMETRO_LOGON      : string = 'LOGON';
  ARQUIVO_INI_LOGON_USUARIO_PARAMETRO_INS_DT_HR  : string = 'INS_DT_HR';
  ARQUIVO_INI_LOGON_USUARIO_PARAMETRO_INS_USER   : string = 'INS_USER';
  ARQUIVO_INI_LOGON_USUARIO_PARAMETRO_INS_HOST   : string = 'INS_HOST';

/// <summary>
/// Record para representar um record de logon de usu�rio.
/// </summary>
type
  TLogonUsuario = record
    Item : Integer;
    Logon: string;
  end;

/// <summary>
/// Lista de records do tipo TLogonUsuario.
/// </summary>
type
  TListaLogonsUsuario = array of TLogonUsuario;

  
/// <summary>
/// Procedimento para limpar um record do tipo TLogonUsuario.
/// </summary>
/// <param name="argLogonUsuario">
/// Record do tipo TLogonUsuario que ser� limpo.
/// </param>
procedure LogonUsuarioLimpar(argLogonUsuario: TLogonUsuario);
  
/// <summary>
/// Fun��o para listar todas as conex�es de acesso � aplica��o configuradas.
/// </summary>
/// <param name="argItemInicial">
/// O n�mero do item inicial para pesquisa.
/// </param>
/// <param name="argItemFinal">
/// O n�mero do item final para pesquisa.
/// </param>
/// <param name="argTitulo">
/// O t�tulo da configura��o de conex�o.
/// </param>
/// <returns>
/// Um array de conex�es configuradas (TConexao).
/// </returns>
function ListaConexoesLocaisCarregar(argItemInicial: Integer = 0;
                                     argItemFinal  : Integer = 0;
                                     argTitulo     : string  = ''): TListaConexoes;

/// <summary>
/// Procedimento para gravar uma lista de conex�es de acesso � aplica��o configuradas.
/// </summary>
/// <param name="argListaConexoes">
/// Lista de conex�es que ser�o gravadas.
/// </param>
procedure ListaConexoesLocaisGravar(argListaConexoes: TListaConexoes);

/// <summary>
/// Fun��o para retornar a lista de logons de usu�rio que acessaram o aplicativo nesse computador.
/// </summary>
/// <returns>
/// Um array de logon de usu�rios (TLogonUsuario).
/// </returns>
function ListaLogonsUsuarioCarregar: TListaLogonsUsuario;

/// <summary>
/// Procedimento para gravar um logon de usu�rio no arquivo de configura��o.
/// </summary>
/// <param name="argLogon">
/// Logon do usu�rio que ser� gravado.
/// </param>
/// <returns>
/// Um array de logon de usu�rios (TLogonUsuario).
/// </returns>
procedure LogonUsuarioGravar(argLogon: string);

/// <summary>
/// Procedimento para carregar os dados do �ltimo acesso.
/// </summary>
/// <param name="argConexaoItem">
/// Item da conex�o no �ltimo acesso neste computador.
/// </param>
/// <param name="argConexaoTitulo">
/// T�tulo da conex�o no �ltimo acesso neste computador.
/// </param>
/// <param name="argLogon">
/// Logon do usu�rio no �ltimo acesso neste computador.
/// </param>
procedure UltimoAcessoCarregar(var argConexaoItem  : Integer;
                               var argConexaoTitulo: string;
                               var argLogon        : string;
                               var argMemorizar    : Boolean);

/// <summary>
/// Procedimento para gravar os dados do �ltimo acesso.
/// </summary>
/// <param name="argConexaoItem">
/// Item da conex�o no �ltimo acesso neste computador.
/// </param>
/// <param name="argConexaoTitulo">
/// T�tulo da conex�o no �ltimo acesso neste computador.
/// </param>
/// <param name="argLogon">
/// Logon do usu�rio no �ltimo acesso neste computador.
/// </param>
procedure UltimoAcessoGravar(argConexaoItem  : Integer;
                             argConexaoTitulo: string;
                             argLogon        : string;
                             argMemorizar    : Boolean);

implementation

{+------------------------------------------------------------------------------------------------+}
{| LogonUsuarioLimpar                                                                             |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure LogonUsuarioLimpar(argLogonUsuario: TLogonUsuario);
begin
  with argLogonUsuario do
  begin
    Item  := 0;
    Logon := '';
  end;
end;

{+------------------------------------------------------------------------------------------------+}
{| ListaConexoesLocaisCarregar                                                                    |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
function ListaConexoesLocaisCarregar(argItemInicial: Integer = 0;
                                     argItemFinal  : Integer = 0;
                                     argTitulo     : string  = ''): TListaConexoes;
var
  locQuantidade: Integer;
  locContador  : Integer;
  locSessao    : string;
  locIndice    : Integer;
  locConexao   : TConexao;
begin
  //
  // Inicializa retorno.
  //
  Result := nil;

  //
  // Verifica se o arquivo de configura��o existe na pasta adequada.
  //
  if not PathArquivoExisteDeterminar(gloPathArquivoConfiguracao) then Exit;

  //
  // L� a quantidade de conex�es existente no arquivo de configura��o.
  //
  try
    locQuantidade := ArquivoIniIntegerRecuperar(gloPathArquivoConfiguracao, ARQUIVO_INI_CONEXAO_GERAL, ARQUIVI_INI_CONEXAO_GERAL_QUANTIDADE);
  except
    on locErro: Exception do
    begin
      raise Exception.Create(locErro.Message);
    end;
  end;

  //
  // Inicia la�o para ler cada uma das configura��es de conex�o do arquivo de configura��o.
  //
  for locContador := 0 to (locQuantidade - 1) do
  begin
    //
    // Formata o nome da sess�o.
    //
    locSessao := ARQUIVO_INI_CONEXAO_SESSAO + '_' + StringPreencher(IntegerStringConverter(locContador + 1), 4, '0', ESQUERDA);

    //
    // Carrega os dados da conex�o.
    //
    ConexaoLimpar(locConexao);
    locConexao.Item        := ArquivoIniIntegerRecuperar(gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_ITEM);
    locConexao.Titulo      := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_TITULO);
    locConexao.Modo        := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_MODO);
    locConexao.ChaveCodigo := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_CHAVE_CODIGO);
    locConexao.ChaveID     := ArquivoIniIntegerRecuperar(gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_CHAVE_ID);
    locConexao.BaseID      := ArquivoIniIntegerRecuperar(gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_BASE_ID);
    locConexao.SGBD        := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_SGBD);
    locConexao.Driver      := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_DRIVER);
    locConexao.Servidor    := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_SERVIDOR);
    locConexao.Porta       := ArquivoIniIntegerRecuperar(gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_PORTA);
    locConexao.Instancia   := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_INSTANCIA);
    locConexao.Usuario     := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_USUARIO);
    locConexao.Senha       := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_SENHA);
    locConexao.BancoDados  := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_BANCO_DADOS);
    locConexao.TimeOut     := ArquivoIniIntegerRecuperar(gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_TIME_OUT);

    //
    // Consiste filtros.
    //
    if argItemInicial > 0 then
    begin
      if locConexao.Item < argItemInicial then Continue;
    end;

    if argItemFinal > 0 then
    begin
      if locConexao.Item > argItemFinal then Continue;
    end;

    if argTitulo <> '' then
    begin
      if not StringLocalizar(StringFoneticaDeterminar(locConexao.Titulo), StringFoneticaDeterminar(argTitulo)) then Continue;
    end;

    //
    // Determina o �ndice do array depois que uma nova linha for inserida.
    //
    locIndice := Length(Result);

    //
    // Insere uma nova linha no registro.
    //
    SetLength(Result, locIndice + 1);

    //
    // Popula os campos do registro dessa nova linha do array.
    //
    Result[locIndice] := locConexao;
  end;
end;

{+------------------------------------------------------------------------------------------------+}
{| ListaConexoesLocaisGravar                                                                      |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure ListaConexoesLocaisGravar(argListaConexoes: TListaConexoes);
var
  locQuantidade: Integer;
  locContador  : Integer;
  locSessao    : string;
  locConexao   : TConexao;
begin
  //
  // Se o arquivo de configura��o n�o existir na pasta adequada ent�o cria os diret�rios.
  //
  if not PathArquivoExisteDeterminar(gloPathArquivoConfiguracao) then
  begin
    //
    // Somente os diret�rios est�o sendo criados.
    //
    try
      DiretorioCriar(gloPathConfiguracao);
    except
      on locErro: Exception do
      begin
        raise Exception.Create(locErro.Message);
      end;
    end;
  end;

  //
  // Remove todas as configura��es de conex�o antes de inser�-las.
  //
  try
    locQuantidade := ArquivoIniIntegerRecuperar(gloPathArquivoConfiguracao, ARQUIVO_INI_CONEXAO_GERAL, ARQUIVI_INI_CONEXAO_GERAL_QUANTIDADE);
  except
    on locErro: Exception do
    begin
      raise Exception.Create(locErro.Message);
    end;
  end;

  if locQuantidade > 0 then
  begin
    for locContador := 1 to locQuantidade do
    begin
      locSessao := ARQUIVO_INI_CONEXAO_SESSAO + '_' + StringPreencher(IntegerStringConverter(locContador + 1), 4, '0', ESQUERDA);
      try
        ArquivoIniSessaoExcluir(gloPathArquivoConfiguracao, locSessao);
      except
        on locErro: Exception do
        begin
          raise Exception.Create(locErro.Message);
        end;
      end;
    end;
  end;

  //
  // Determina a quantidade de conex�es na lista.
  //
  locQuantidade := Length(argListaConexoes);

  //
  // Grava a nova quantidade de conex�es existente no arquivo de configura��o.
  //
  try
    ArquivoIniIntegerGravar(gloPathArquivoConfiguracao, ARQUIVO_INI_CONEXAO_GERAL, ARQUIVI_INI_CONEXAO_GERAL_QUANTIDADE, locQuantidade);
  except
    on locErro: Exception do
    begin
      raise Exception.Create(locErro.Message);
    end;
  end;

  //
  // Inicia la�o para gravar cada uma das configura��es de conex�o do arquivo de configura��o.
  //
  for locContador := 0 to (locQuantidade - 1) do
  begin
    //
    // Formata o nome da sess�o.
    //
    locSessao := ARQUIVO_INI_CONEXAO_SESSAO + '_' + StringPreencher(IntegerStringConverter(locContador + 1), 4, '0', ESQUERDA);

    //
    // Carrega os dados da conex�o.
    //
    locConexao := argListaConexoes[locContador];

    //
    // Grava cada uma das conex�es da lista.
    //
    try
      ArquivoIniIntegerGravar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_ITEM,         locConexao.Item);
      ArquivoIniStringGravar  (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_TITULO,       locConexao.Titulo);
      ArquivoIniStringGravar  (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_MODO,         locConexao.Modo);
      ArquivoIniStringGravar  (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_CHAVE_CODIGO, locConexao.ChaveCodigo);
      ArquivoIniIntegerGravar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_CHAVE_ID,     locConexao.ChaveID);
      ArquivoIniIntegerGravar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_BASE_ID,      locConexao.BaseID);
      ArquivoIniStringGravar  (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_SGBD,         locConexao.SGBD);
      ArquivoIniStringGravar  (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_DRIVER,       locConexao.Driver);
      ArquivoIniStringGravar  (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_SERVIDOR,     locConexao.Servidor);
      ArquivoIniIntegerGravar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_PORTA,        locConexao.Porta);
      ArquivoIniStringGravar  (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_INSTANCIA,    locConexao.Instancia);
      ArquivoIniStringGravar  (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_USUARIO,      locConexao.Usuario);
      ArquivoIniStringGravar  (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_SENHA,        locConexao.Senha);
      ArquivoIniStringGravar  (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_BANCO_DADOS,  locConexao.BancoDados);
      ArquivoIniIntegerGravar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_TIME_OUT,     locConexao.TimeOut);
      ArquivoIniDateTimeGravar(gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_INS_DT_HR,    Now);
      ArquivoIniStringGravar  (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_INS_USER,     UserNameRecuperar);
      ArquivoIniStringGravar  (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_INS_HOST,     HostNameRecuperar);
    except
      on locErro: Exception do
      begin
        raise Exception.Create(locErro.Message);
      end;
    end;
  end;
end;

{+------------------------------------------------------------------------------------------------+}
{| ListaLogonsUsuarioLocaisCarregar                                                               |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
function ListaLogonsUsuarioCarregar: TListaLogonsUsuario;
var
  locQuantidade  : Integer;
  locContador    : Integer;
  locSessao      : string;
  locIndice      : Integer;
  locLogonUsuario: TLogonUsuario;
begin
  //
  // Inicializa retorno.
  //
  Result := nil;

  //
  // Verifica se o arquivo de configura��o existe na pasta adequada.
  //
  if not PathArquivoExisteDeterminar(gloPathArquivoConfiguracao) then Exit;

  //
  // L� a quantidade de logon de usu�rio existente no arquivo de configura��o.
  //
  try
    locQuantidade := ArquivoIniIntegerRecuperar(gloPathArquivoConfiguracao, ARQUIVO_INI_LOGON_USUARIO_GERAL, ARQUIVO_INI_LOGON_USUARIO_GERAL_QUANTIDADE);
  except
    on locErro: Exception do
    begin
      raise Exception.Create(locErro.Message);
    end;
  end;

  //
  // Inicia la�o para ler cada um dos logons de usu�rio do arquivo de configura��o.
  //
  for locContador := 0 to (locQuantidade - 1) do
  begin
    //
    // Formata o nome da sess�o.
    //
    locSessao := ARQUIVO_INI_LOGON_USUARIO_SESSAO + '_' + StringPreencher(IntegerStringConverter(locContador + 1), 4, '0', ESQUERDA);

    //
    // Carrega os dados do logon de usu�rio.
    //
    LogonUsuarioLimpar(locLogonUsuario);
    locLogonUsuario.Item  := ArquivoIniIntegerRecuperar(gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_LOGON_USUARIO_PARAMETRO_ITEM);
    locLogonUsuario.Logon := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_LOGON_USUARIO_PARAMETRO_LOGON);

    //
    // Determina o �ndice do array depois que uma nova linha for inserida.
    //
    locIndice := Length(Result);

    //
    // Insere uma nova linha no registro.
    //
    SetLength(Result, locIndice + 1);

    //
    // Popula os campos do registro dessa nova linha do array.
    //
    Result[locIndice] := locLogonUsuario;
  end;
end;

{+------------------------------------------------------------------------------------------------+}
{| LogonUsuarioGravar                                                                             |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure LogonUsuarioGravar(argLogon: string);
var
  locListaAtual  : TListaLogonsUsuario;
  locListaNova   : TListaLogonsUsuario;
  locContador    : Integer;
  locSessao      : string;
  locLogonUsuario: TLogonUsuario;
begin
  //
  // Se o arquivo de configura��o n�o existir na pasta adequada ent�o cria os diret�rios.
  //
  if not PathArquivoExisteDeterminar(gloPathArquivoConfiguracao) then
  begin
    //
    // Somente os diret�rios est�o sendo criados.
    //
    try
      DiretorioCriar(gloPathConfiguracao);
    except
      on locErro: Exception do
      begin
        raise Exception.Create(locErro.Message);
      end;
    end;
  end;

  //
  // Carrega a lista atual de logons de usu�rio.
  //
  try
    locListaAtual := ListaLogonsUsuarioCarregar;
  except
    on locErro: Exception do
    begin
      raise Exception.Create(locErro.Message);
    end;
  end;

  //
  // Percorre a lista atual criando uma nova lista sem o logon passado como par�metro.
  //
  locListaNova := nil;
  for locContador := 0 to (Length(locListaAtual) - 1) do
  begin
    if (locListaAtual[locContador].Logon <> argLogon) then
    begin
      SetLength(locListaNova, Length(locListaNova) + 1);
      locListaNova[Length(locListaNova) - 1].Item  := Length(locListaNova);
      locListaNova[Length(locListaNova) - 1].Logon := locListaAtual[locContador].Logon;
    end;
  end;

  //
  // Insere esse logon por �ltimo na lista.
  //
  SetLength(locListaNova, Length(locListaNova) + 1);
  locListaNova[Length(locListaNova) - 1].Item  := Length(locListaNova);
  locListaNova[Length(locListaNova) - 1].Logon := argLogon;  
 

  //
  // Grava a nova quantidade de logons de usu�rios.
  //
  try
    ArquivoIniIntegerGravar(gloPathArquivoConfiguracao, ARQUIVO_INI_LOGON_USUARIO_GERAL, ARQUIVO_INI_LOGON_USUARIO_GERAL_QUANTIDADE, Length(locListaNova));
  except
    on locErro: Exception do
    begin
      raise Exception.Create(locErro.Message);
    end;
  end;

  //
  // Inicia la�o para gravar cada um dos logons.
  //
  for locContador := 0 to (Length(locListaNova) - 1) do
  begin
    //
    // Formata o nome da sess�o.
    //
    locSessao := ARQUIVO_INI_LOGON_USUARIO_SESSAO + '_' + StringPreencher(IntegerStringConverter(locContador + 1), 4, '0', ESQUERDA);

    //
    // Carrega os dados do logon.
    //
    locLogonUsuario := locListaNova[locContador];

    //
    // Grava cada uma das conex�es da lista.
    //
    try
      ArquivoIniIntegerGravar (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_LOGON_USUARIO_PARAMETRO_ITEM,      locLogonUsuario.Item);
      ArquivoIniStringGravar  (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_LOGON_USUARIO_PARAMETRO_LOGON,     locLogonUsuario.Logon);
      ArquivoIniDateTimeGravar(gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_LOGON_USUARIO_PARAMETRO_INS_DT_HR, Now);
      ArquivoIniStringGravar  (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_LOGON_USUARIO_PARAMETRO_INS_USER,  UserNameRecuperar);
      ArquivoIniStringGravar  (gloPathArquivoConfiguracao, locSessao, ARQUIVO_INI_LOGON_USUARIO_PARAMETRO_INS_HOST,  HostNameRecuperar);
    except
      on locErro: Exception do
      begin
        raise Exception.Create(locErro.Message);
      end;
    end;
  end;
end;

{+------------------------------------------------------------------------------------------------+}
{| UltimoAcessoCarregar                                                                           |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure UltimoAcessoCarregar(var argConexaoItem  : Integer;
                               var argConexaoTitulo: string;
                               var argLogon        : string;
                               var argMemorizar    : Boolean);
begin
  //
  // Limpa vari�veis de retorno.
  //
  argConexaoItem   := 0;
  argConexaoTitulo := '';
  argLogon         := '';
  argMemorizar     := False;

  //
  // Verifica se o arquivo de configura��o existe na pasta adequada.
  //
  if not PathArquivoExisteDeterminar(gloPathArquivoConfiguracao) then Exit;

  //
  // Carrega informa��es.
  //
  try
    argConexaoItem   := ArquivoIniIntegerRecuperar(gloPathArquivoConfiguracao, ARQUIVO_INI_ULTIMO_ACESSO_SESSAO, ARQUIVO_INI_ULTIMO_ACESSO_CONEXAO_ITEM);
    argConexaoTitulo := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, ARQUIVO_INI_ULTIMO_ACESSO_SESSAO, ARQUIVO_INI_ULTIMO_ACESSO_CONEXAO_TITULO);
    argLogon         := ArquivoIniStringRecuperar (gloPathArquivoConfiguracao, ARQUIVO_INI_ULTIMO_ACESSO_SESSAO, ARQUIVO_INI_ULTIMO_ACESSO_LOGON);
    argMemorizar     := ArquivoIniBooleanRecuperar(gloPathArquivoConfiguracao, ARQUIVO_INI_ULTIMO_ACESSO_SESSAO, ARQUIVO_INI_ULTIMO_ACESSO_MEMORIZAR);
  except
    on locErro: Exception do
    begin
      raise Exception.Create(locErro.Message);
    end;
  end;
end;

{+------------------------------------------------------------------------------------------------+}
{| UltimoAcessoGravar                                                                             |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 26/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure UltimoAcessoGravar(argConexaoItem  : Integer;
                             argConexaoTitulo: string;
                             argLogon        : string;
                             argMemorizar    : Boolean);
begin
  //
  // Se o arquivo de configura��o n�o existir na pasta adequada ent�o cria os diret�rios.
  //
  if not PathArquivoExisteDeterminar(gloPathArquivoConfiguracao) then
  begin
    //
    // Somente os diret�rios est�o sendo criados.
    //
    try
      DiretorioCriar(gloPathConfiguracao);
    except
      on locErro: Exception do
      begin
        raise Exception.Create(locErro.Message);
      end;
    end;
  end;

  //
  // Grava informa��es.
  //
  try
    ArquivoIniIntegerGravar(gloPathArquivoConfiguracao, ARQUIVO_INI_ULTIMO_ACESSO_SESSAO, ARQUIVO_INI_ULTIMO_ACESSO_CONEXAO_ITEM,   argConexaoItem);
    ArquivoIniStringGravar (gloPathArquivoConfiguracao, ARQUIVO_INI_ULTIMO_ACESSO_SESSAO, ARQUIVO_INI_ULTIMO_ACESSO_CONEXAO_TITULO, argConexaoTitulo);
    ArquivoIniStringGravar (gloPathArquivoConfiguracao, ARQUIVO_INI_ULTIMO_ACESSO_SESSAO, ARQUIVO_INI_ULTIMO_ACESSO_LOGON,          argLogon);
    ArquivoIniBooleanGravar(gloPathArquivoConfiguracao, ARQUIVO_INI_ULTIMO_ACESSO_SESSAO, ARQUIVO_INI_ULTIMO_ACESSO_MEMORIZAR,      argMemorizar);
  except
    on locErro: Exception do
    begin
      raise Exception.Create(locErro.Message);
    end;
  end;
end;

end.
