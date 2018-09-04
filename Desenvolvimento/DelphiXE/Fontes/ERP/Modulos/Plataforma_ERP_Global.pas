//
// Arquivo..: Plataforma_ERP_Global.pas
// Projeto..: ERP
// Fonte....: Unit
// Cria��o..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Vari�veis globais da aplica��o de ERP.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
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
