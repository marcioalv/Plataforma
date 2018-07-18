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
  gloAppHashCode     : string;
  gloAppPath         : string;

  gloLocalLog        : TPlataformaFrameworkLog;

  gloTimeOutNormal   : Integer;

  gloBaseID          : Integer;
  gloBaseCodigo      : string;
  gloBaseTitulo      : string;

  gloLicencaID       : Integer;
  gloLicencaCodigo   : string;
  gloLicencaTitulo   : string;

  gloUsuarioBaseID   : Integer;
  gloUsuarioID       : Integer;
  gloUsuarioLogon    : string;
  gloUsuarioNome     : string;

  gloConexaoADOString: string;
  gloConexaoTimeOut  : Integer;

implementation

end.
