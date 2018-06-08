//
// Arquivo..: Plataforma_Framework_Log.pas
// Projeto..: Framework
// Fonte....: Unit
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Classe de controle de log de aplicações.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_Framework_Log;

interface

uses
  System.SysUtils;

type
  TPlataformaFrameworkLog = class(TObject)
  private
    priFilePath: string;
    priFileName: string;

    function GetFilePath: string;
    procedure SetFilePath(argFilePath: string);

    function GetFileName: string;
    procedure SetFileName(argFileName: string);

    function GetPathFile: string;

    procedure PathDefine;
    procedure FileDefine(var argTextFile: TextFile);
    procedure FileTerminate(var argTextFile: TextFile);
  public
    constructor Create;
    procedure Clear;
    procedure FileNameDaily(argFileAlias: string);

    property FilePath: string read GetFilePath write SetFilePath;
    property FileName: string read GetFileName write SetFileName;
    property PathFile: string read GetPathFile;

    procedure Write(argHostName   : string;
                    argUserName   : string;
                    argAppName    : string;
                    argAppHashCode: string;
                    argAppUserID  : string;
                    argAppUserName: string;
                    argCritical   : Boolean;
                    argMessage    : string);
  end;

implementation

{ TPlataformaFrameworkLog }

constructor TPlataformaFrameworkLog.Create;
begin
  Clear;
end;

procedure TPlataformaFrameworkLog.Clear;
begin
  priFilePath := '';
  priFileName := '';
end;

function TPlataformaFrameworkLog.GetFilePath: string;
begin
  Result := priFilePath;
end;

procedure TPlataformaFrameworkLog.SetFilePath(argFilePath: string);
begin
  priFilePath := argFilePath;
end;

function TPlataformaFrameworkLog.GetFileName: string;
begin
  Result := priFileName;
end;

procedure TPlataformaFrameworkLog.SetFileName(argFileName: string);
begin
  priFileName := argFileName;
end;

function TPlataformaFrameworkLog.GetPathFile: string;
var
  locFilePath: string;
  locFileName: string;
begin
  if priFilePath = '' then locFilePath := '.';
  if priFileName = '' then locFileName := 'default.log';

  Result := priFilePath + '\' + priFileName;
end;

procedure TPlataformaFrameworkLog.FileNameDaily(argFileAlias: string);
begin
  priFileName := FormatDateTime('yyyy_mm_dd', Now);

  if argFileAlias <> '' then
  begin
    priFileName := priFileName + '_' + argFileAlias;
  end;

  priFileName := priFileName + '.log';
end;

procedure TPlataformaFrameworkLog.PathDefine;
begin
  if DirectoryExists(priFilePath) then Exit;

  try
    ForceDirectories(priFilePath);
  except
    on locErro: Exception do
    begin
      raise Exception.Create('The full path structure for the application log file folder could not be created in [' + GetPathFile + '] because: ' + locErro.Message);
    end;
  end;
end;

procedure TPlataformaFrameworkLog.FileDefine(var argTextFile: TextFile);
var
  locFileExists: Boolean;
begin
  locFileExists := FileExists(GetPathFile);

  try
    AssignFile(argTextFile, GetPathFile);
  except
    on locErro: Exception do
    begin
      raise Exception.Create('The log text file could not be assigned in [' + GetPathFile + '] because: ' + locErro.Message);
    end;
  end;

  if not locFileExists then
  begin
    try
      Rewrite(argTextFile);
    except
      on locErro: Exception do
      begin
        raise Exception.Create('The log text file could not be created in [' + GetPathFile + '] because: ' + locErro.Message);
      end;
    end;    
  end
  else
  begin
    try
      Append(argTextFile);
    except
      on locErro: Exception do
      begin
        raise Exception.Create('The log text file could not be appended in [' + GetPathFile + '] because: ' + locErro.Message);
      end;
    end;    
  end;
end;

procedure TPlataformaFrameworkLog.FileTerminate(var argTextFile: TextFile);
begin
  try
    CloseFile(argTextFile);
  except
    on locErro: Exception do
    begin
      raise Exception.Create('The log text file could not be closed in [' + GetPathFile + '] because: ' + locErro.Message);
    end;
  end;
end;

procedure TPlataformaFrameworkLog.Write(argHostName   : string;
                                        argUserName   : string;
                                        argAppName    : string;
                                        argAppHashCode: string;
                                        argAppUserID  : string;
                                        argAppUserName: string;
                                        argCritical   : Boolean;
                                        argMessage    : string);
var
  locCritical: string;
  locLine    : string;
  locTextFile: TextFile;
begin
  if argCritical then
    locCritical := 'T'
  else
    locCritical := 'F';

  locLine := argHostName                                    + '|' +
             argUserName                                    + '|' +
             argAppName                                     + '|' +
             argAppHashCode                                 + '|' +
             argAppUserID                                   + '|' +
             argAppUserName                                 + '|' +
             locCritical                                    + '|' +
             FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now) + '|' +
             argMessage;

  PathDefine;
  FileDefine(locTextFile);

  try
    Writeln(locTextFile, locLine);
  except
    on locErro: Exception do
    begin
      raise Exception.Create('A new log information line could not be write in [' + GetPathFile + '] because: ' + locErro.Message);
    end;
  end;

  FileTerminate(locTextFile);
end;

end.
