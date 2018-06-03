//
// Arquivo..: Plataforma_ERP_Generico.pas
// Projeto..: ERP
// Fonte....: Unit
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Funções e procedimentos diversos de uso genérico da aplicação de ERP.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
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
