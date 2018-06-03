//
// Arquivo..: Plataforma_Framework_Util.pas
// Projeto..: Framework
// Fonte....: Unit
// Cria��o..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Fun��es e procedimentos diversos e �teis.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_Framework_Util;

interface

uses
  System.SysUtils,
  System.DateUtils,
  System.Classes,
  Winapi.Windows;

function UserNameRecuperar: string;

function HostNameRecuperar: string;

implementation

function UserNameRecuperar: string;
var
  locNetUserNameLength: DWord;
begin
  locNetUserNameLength := 50;
  SetLength(Result, locNetUserNameLength);
  GetUserName(pChar(Result), locNetUserNameLength);
  SetLength(Result, StrLen(pChar(Result)));
end;

function HostNameRecuperar: string;
var
  locBuffer: array[0 .. 255] of Char;
  locSize  : DWORD;
begin
  locSize := MAX_COMPUTERNAME_LENGTH + 1;
  GetComputerName(locBuffer, locSize);
  Result := locBuffer;
end;

end.
