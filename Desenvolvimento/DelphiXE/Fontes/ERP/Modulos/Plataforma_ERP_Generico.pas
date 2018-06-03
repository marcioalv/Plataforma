//
// Arquivo..: Plataforma_ERP_Generico.pas
// Projeto..: ERP
// Fonte....: Unit
// Cria��o..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Fun��es e procedimentos diversos de uso gen�rico da aplica��o de ERP.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_Generico;

interface

uses
  Plataforma_Framework_Util,
  Plataforma_ERP_Global;

procedure PlataformaERPLogar(argCritico: Boolean; argMensagem: string);

implementation

procedure PlataformaERPLogar(argCritico: Boolean; argMensagem: string);
var
  locDeviceName : string;
  locDeviceUser : string;
  locAppName    : string;
  locAppUserID  : string;
  locAppUserName: string;
begin
  locDeviceName  := HostNameRecuperar;
  locDeviceUser  := UserNameRecuperar;
  locAppName     := 'Plataforma_ERP_VCL';
  locAppUserID   := '1';
  locAppUserName := 'Marcio Alves';

  gloLocalLog.Write(locDeviceName, locDeviceUser, locAppName, locAppUserID, locAppUserName, argCritico, argMensagem);
end;

end.
