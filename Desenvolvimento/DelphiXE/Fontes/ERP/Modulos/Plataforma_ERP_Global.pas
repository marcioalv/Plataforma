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
