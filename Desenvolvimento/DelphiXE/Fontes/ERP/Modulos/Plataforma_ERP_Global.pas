//
// Arquivo..: Plataforma_ERP_Global.pas
// Projeto..: ERP
// Fonte....: Unit
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Variáveis globais da aplicação de ERP.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_Global;

interface

uses
  Plataforma_Framework_Log;

const
  ARQUIVO_INI_ULTIMO_ACESSO_SESSAO               : string = 'ULTIMO_ACESSO';
  ARQUIVO_INI_ULTIMO_ACESSO_CONEXAO_ITEM         : string = 'CONEXAO_ITEM';
  ARQUIVO_INI_ULTIMO_ACESSO_USUARIO              : string = 'USUARIO';
  ARQUIVO_INI_ULTIMO_ACESSO_MEMORIZAR            : string = 'MEMORIZAR';

  ARQUIVO_INI_CONEXAO_GERAL                      : string = 'GERAL';
  ARQUIVO_INI_CONEXAO_GERAL_QUANTIDADE           : string = 'QUANTIDADE_CONEXOES';
  ARQUIVO_INI_CONEXAO_SESSAO                     : string = 'CONEXAO';
  ARQUIVO_INI_CONEXAO_PARAMETRO_ITEM             : string = 'ITEM';
  ARQUIVO_INI_CONEXAO_PARAMETRO_TITULO           : string = 'TITULO';
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

var
  gloAppHashCode: string;
  gloAppPath    : string;
  
  gloLocalLog: TPlataformaFrameworkLog;

  gloConfiguracaoArquivo: string;

  gloTimeOutRapido   : Integer;
  gloTimeOutNormal   : Integer;
  gloTimeOutExtendido: Integer;
  gloTimeOutDemorado : Integer;

  gloBaseID       : Integer;
  gloBaseCodigo   : string;
  gloBaseDescricao: string;

  gloLicencaID       : Integer;
  gloLicencaCodigo   : string;
  gloLicencaDescricao: string;

  gloUsuarioBaseID       : Integer;
  gloUsuarioID           : Integer;
  gloUsuarioLogon        : string;
  gloUsuarioNome         : string;
  gloUsuarioAdministrador: Boolean;
  gloUsuarioRotinas      : array of string;

  gloConexaoTitulo    : string;
  gloConexaoServidor  : string;
  gloConexaoPorta     : Integer;
  gloConexaoInstancia : string;
  gloConexaoUsuario   : string;
  gloConexaoSenha     : string;
  gloConexaoBancoDados: string;
  gloConexaoTimeOut   : Integer;
  gloConexaoADOString : string;

implementation

end.
