//
// Arquivo..: Plataforma_ERP_Inicializacao.pas
// Projeto..: ERP
// Fonte....: Unit
// Cria��o..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Fun��es e procedimentos diversos para a inicializa��o da aplica��o de ERP.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_Inicializacao;

interface

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_Log,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  System.SysUtils,
  Winapi.Windows;

procedure PlataformaERPHashCodInicializar;
procedure PlataformaERPLogInicializar;
function PlataformaERPUsuarioInicializar: Boolean;

implementation

//
// Procedimento para inicializar o hashcode da aplica��o.
//
procedure PlataformaERPHashCodInicializar;
var
  locMomento  : string;
  locDrive    : string;
  locProcessID: string;
begin
  locMomento   := FormatDateTime('yyyymmddhhnnsszzz', Now);
  locDrive     := IntegerStringConverter(DriveSerialNumberRecuperar(Copy(gloAppPath, 1, 1)));
  locProcessID := IntegerStringConverter(GetCurrentProcessID);

  gloAppHashCode := locMomento + locDrive + locProcessID;
end;

//
// Procedimento para iniciar o mecanismo de log da aplica��o.
//
procedure PlataformaERPLogInicializar;
begin
  gloLocalLog          := TPlataformaFrameworkLog.Create;
  gloLocalLog.FilePath := gloAppPath + '\Log';
  gloLocalLog.FileNameDaily('Plataforma_ERP_VCL');

  PlataformaERPLogar(False, 'M�dulo de log inicializado com sucesso!');
end;

//
// Fun��o para inicializar o usu�rio da aplica��o.
//
function PlataformaERPUsuarioInicializar: Boolean;
begin
  // Inicializa usu�rio.
  gloUsuarioID    := 0;
  gloUsuarioLogon := '';
  gloUsuarioNome  := '';

  // Usu�rio autenticado.
  gloUsuarioID    := 8345;
  gloUsuarioLogon := 'marcio.alves';
  gloUsuarioNome  := 'Marcio Alves';
  Result          := True;
  end;

end.
