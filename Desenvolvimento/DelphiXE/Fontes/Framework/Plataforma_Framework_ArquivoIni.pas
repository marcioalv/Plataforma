
unit Plataforma_Framework_ArquivoIni;

interface

uses
  Plataforma_Framework_Util,
  System.SysUtils,
  System.IniFiles; 

//
// ArquivoIniStringRecuperar.
//
function ArquivoIniStringRecuperar(argArquivo  : string;
                                   argSessao   : string;
                                   argParametro: string): string;

//
// ArquivoIniIntegerRecuperar.
//
function ArquivoIniIntegerRecuperar(argArquivo  : string;
                                    argSessao   : string;
                                    argParametro: string): Integer;

//
// ArquivoIniBooleanRecuperar.
//
function ArquivoIniBooleanRecuperar(argArquivo  : string;
                                    argSessao   : string;
                                    argParametro: string): Boolean;

//
// ArquivoIniDateTimeRecuperar.
//
function ArquivoIniDateTimeRecuperar(argArquivo  : string;
                                     argSessao   : string;
                                     argParametro: string): TDateTime;

//
// ArquivoIniStringGravar.
//
procedure ArquivoIniStringGravar(argArquivo  : string;
                                 argSessao   : string;
                                 argParametro: string;
                                 argValor    : string);
//
// ArquivoIniIntegerGravar.
//
procedure ArquivoIniIntegerGravar(argArquivo  : string;
                                  argSessao   : string;
                                  argParametro: string;
                                  argValor    : Integer);

//
// ArquivoIniBooleanGravar.
//
procedure ArquivoIniBooleanGravar(argArquivo  : string;
                                  argSessao   : string;
                                  argParametro: string;
                                  argValor    : Boolean);

//
// ArquivoIniDateTimeGravar.
//
procedure ArquivoIniDateTimeGravar(argArquivo  : string;
                                   argSessao   : string;
                                   argParametro: string;
                                   argValor    : TDateTime);

//
// ArquivoIniSessaoExcluir.
//
procedure ArquivoIniSessaoExcluir(argArquivo: string;
                                  argSessao : string); 

implementation

//
// Função para retornar uma string de um arquivo ini.
//
function ArquivoIniStringRecuperar(argArquivo  : string;
                                   argSessao   : string;
                                   argParametro: string): string;
var
  locArquivoIni: TIniFile;
begin
  //
  // Retorno padrão.
  //
  Result := '';

  //
  // Abre o arquivo ini.
  //
  try
    locArquivoIni := TIniFile.Create(argArquivo);
  except
    on locErro: Exception do
    begin
      raise Exception.Create(locErro.Message);
      Exit;
    end;
  end;

  //
  // Lê parâmetros.
  //
  try
    Result := locArquivoIni.ReadString(argSessao, argParametro, '');
  except
    on locErro: Exception do
    begin
      FreeAndNil(locArquivoIni);
      raise Exception.Create(locErro.Message);
      Exit;
    end;
  end;

  //
  // Fecha o arquivo ini.
  //
  FreeAndNil(locArquivoIni);
end;

//
// Função para retornar um inteiro de um arquivo ini.
//
function ArquivoIniIntegerRecuperar(argArquivo  : string;
                                    argSessao   : string;
                                    argParametro: string): Integer;
begin
  Result := StringIntegerConverter(ArquivoIniStringRecuperar(argArquivo, argSessao, argParametro));
end;

//
// Função para retornar um boolean de um arquivo ini.
//
function ArquivoIniBooleanRecuperar(argArquivo  : string;
                                    argSessao   : string;
                                    argParametro: string): Boolean;
begin
  Result := StringBooleanConverter(ArquivoIniStringRecuperar(argArquivo, argSessao, argParametro));
end;

//
// Função para retornar um datetime de um arquivo ini.
//
function ArquivoIniDateTimeRecuperar(argArquivo  : string;
                                     argSessao   : string;
                                     argParametro: string): TDateTime;
begin
  Result := StringDataHoraPersistidaConverter(ArquivoIniStringRecuperar(argArquivo, argSessao, argParametro));
end;

//
// Procedimento para gravar um string em um arquivo ini.
//
procedure ArquivoIniStringGravar(argArquivo  : string;
                                 argSessao   : string;
                                 argParametro: string;
                                 argValor    : string);
var
  locArquivoIni: TIniFile;
begin
  //
  // Abre o arquivo ini.
  //
  try
    locArquivoIni := TIniFile.Create(argArquivo);
  except
    on locErro: Exception do
    begin
      raise Exception.Create(locErro.Message);
      Exit;
    end;
  end;

  //
  // Escreve parâmetros.
  //
  try
    locArquivoIni.WriteString(argSessao, argParametro, argValor);
  except
    on locErro: Exception do
    begin
      FreeAndNil(locArquivoIni);
      raise Exception.Create(locErro.Message);
      Exit;
    end;
  end;

  //
  // Finaliza.
  //
  FreeAndNil(locArquivoIni);
end;

//
// Procedimento para gravar um inteiro em um arquivo ini.
//
procedure ArquivoIniIntegerGravar(argArquivo  : string;
                                  argSessao   : string;
                                  argParametro: string;
                                  argValor    : Integer);
begin
  ArquivoIniStringGravar(argArquivo, argSessao, argParametro, IntegerStringConverter(argValor));
end;

//
// Procedimento para gravar um boolean em um arquivo ini.
//
procedure ArquivoIniBooleanGravar(argArquivo  : string;
                                  argSessao   : string;
                                  argParametro: string;
                                  argValor    : Boolean);
begin
  ArquivoIniStringGravar(argArquivo, argSessao, argParametro, BooleanStringConverter(argValor));
end;

//
// Procediment para gravar um datetime em um arquivo ini.
//
procedure ArquivoIniDateTimeGravar(argArquivo  : string;
                                   argSessao   : string;
                                   argParametro: string;
                                   argValor    : TDateTime);
begin
  ArquivoIniStringGravar(argArquivo, argSessao, argParametro, DateTimeStringConverter(argValor, 'yyyy-mm-dd'));
end;

//
// Procedimento para excluir uma sessão de um arquivo ini.
//
procedure ArquivoIniSessaoExcluir(argArquivo: string;
                                  argSessao : string);
var
  locArquivoIni: TIniFile;
begin
  //
  // Abre o arquivo ini.
  //
  try
    locArquivoIni := TIniFile.Create(argArquivo);
  except
    on locErro: Exception do
    begin
      raise Exception.Create(locErro.Message);
      Exit;
    end;
  end;

  //
  // Remove a sessão desejada.
  //
  try
    locArquivoIni.EraseSection(argSessao);
  except
    on locErro: Exception do
    begin
      FreeAndNil(locArquivoIni);
      raise Exception.Create(locErro.Message);
      Exit;
    end;
  end;

  //
  // Finaliza.
  //
  FreeAndNil(locArquivoIni);
end;

end.
