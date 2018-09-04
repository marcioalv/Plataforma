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

  gloConexaoADOString: string;
  gloConexaoTimeOut  : Integer;

implementation

end.
