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

procedure PlataformaERPLogar(argCritico: Boolean; argMensagem: string; argExcecao: string = '');

implementation

procedure PlataformaERPLogar(argCritico: Boolean; argMensagem: string; argExcecao: string = '');
var
  locHostName   : string;
  locUserName   : string;
  locAppName    : string;
  locAppHashCode: string;
  locAppUserID  : string;
  locAppUserName: string;
begin
  locHostName    := HostNameRecuperar;
  locUserName    := UserNameRecuperar;
  locAppName     := 'Plataforma_ERP_VCL';
  locAppHashCode := gloAppHashCode;
  locAppUserID   := IntegerStringConverter(gloUsuarioID);
  locAppUserName := gloUsuarioNome;

  gloLocalLog.Write(locHostName, locUserName, locAppName, locAppHashCode, locAppUserID, locAppUserName, argCritico, argMensagem, argExcecao);
end;

end.
