//
// Arquivo..: Plataforma_Framework_Util.pas
// Projeto..: Framework
// Fonte....: Unit
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Funções e procedimentos diversos e úteis.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_Framework_Util;

interface

uses
  System.SysUtils,
  System.DateUtils,
  System.Classes,
  Winapi.Windows;

const
  ENTER      : Char = #13;
  ESC        : Char = #27;
  TAB        : Char = #9;
  BACKSPACE  : Char = #8;
  CTRL       : Char = #17;
  CTRL_C     : Char = #3;
  CTRL_V     : Char = #22;
  CTRL_X     : Char = #24;

  SETA_ABAIXO: Integer = 40;

  F1         : Integer = 112;
  F2         : Integer = 113;
  F3         : Integer = 114;
  F4         : Integer = 115;
  F5         : Integer = 116;
  F6         : Integer = 117;
  F7         : Integer = 118;
  F8         : Integer = 119;
  F9         : Integer = 120;
  F10        : Integer = 121;
  F11        : Integer = 122;
  F12        : Integer = 123;

  ESQUERDA   : Byte = 0;
  DIREITA    : Byte = 1;

  FLAG_SIM   : string = 'S';
  FLAG_NAO   : string = 'N';

/// <summary>
/// Função para retornar o nome do computador ou dispositivo.
/// </summary>
/// <returns>
/// Nome do computador ou dispositivo.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function HostNameRecuperar: string;

/// <summary>
/// Função para retornar o nome do usuário que está logado no computador.
/// </summary>
/// <returns>
/// Nome do usuário logado no computador.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function UserNameRecuperar: string;

/// <summary>
/// Função para remover espaços desnecessários em uma string.
/// </summary>
/// <param name="argValor">
/// Valor string que terá os espaços desnecessários removidos.
/// </param>
/// <returns>
/// String sem espaços desnecessários.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringTrim(argValor: string): string;

/// <summary>
/// Função para localizar uma substring dentro de um valor.
/// </summary>
/// <param name="argValor">
/// String original.
/// </param>
/// <param name="argSubString">
/// Substring que tentará ser localizado dentro do valor.
/// </param>
/// <returns>
/// True se a substring for localizado ou false se não for.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringLocalizar(argValor: string; argSubString: string): Boolean;

/// <summary>
/// Função para substituir uma string velha por uma string nova.
/// </summary>
/// <param name="argValor">
/// String original.
/// </param>
/// <param name="argVelho">
/// Substring velha que será localizada.
/// </param>
/// <param name="argNovo">
/// Substring nova que será substituída.
/// </param>
/// <returns>
/// Nova string com os valores substituídos.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringSubstituir(argValor: string; argVelho: string; argNovo : string): string;

/// <summary>
/// Função para remover uma substring de uma string.
/// </summary>
/// <param name="argValor">
/// String original.
/// </param>
/// <param name="argRemover">
/// Substring que será removida.
/// </param>
/// <returns>
/// Nova string sem a substring desejada.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringRemover(argValor: string; argRemover: string): string;

/// <summary>
/// Função para preencher uma string com uma determinada quantidade de caracteres a esquerda ou direita.
/// </summary>
/// <param name="argValor">
/// String original.
/// </param>
/// <param name="argTamanho">
/// Tamanho final desejado para o valor.
/// </param>
/// <param name="argCaracter">
/// Caracter que será utilizado para o preenchimento.
/// </param>
/// <param name="argEsquerda">
/// Se true o preenchimento ocorrerá ao lado esquerdo do valor se false ao lado direito.
/// </param>
/// <returns>
/// Nova string preenchida.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringPreencher(argValor: string; argTamanho: Integer; argCaracter: string; argEsquerda: Boolean = True): string;

/// <summary>
/// Função para separar uma string em partes.
/// </summary>
/// <param name="argValor">
/// String original.
/// </param>
/// <param name="argSeparador">
/// Caracter que indica onde deve ocorrer a separação.
/// </param>
/// <returns>
/// Uma lista de strings com cada parte desejada.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringSeparar(argValor: string; argSeparador: string): TStringList;

/// <summary>
/// Função para remover os acentos de uma string.
/// </summary>
/// <param name="argValor">
/// String original.
/// </param>
/// <returns>
/// Uma string sem caracteres de acentuação.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringAcentosRemover(argValor: string): string;

/// <summary>
/// Função para validar se em uma string existem somente números.
/// </summary>
/// <param name="argValor">
/// Valor que será validado.
/// </param>
/// <returns>
/// True se existirem somente números ou false se existirem outros caracteres além de dígitos.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function SomenteNumerosValidar(argTexto: string): Boolean;

function SomenteNumerosRetornar(argTexto: string): string;

/// <summary>
/// Função para retornar um integer a partir de uma string.
/// </summary>
/// <param name="argValor">
/// Valor string que será convertido para um integer.
/// </param>
/// <returns>
/// Integer convertido.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringIntegerConverter(argValor: string): Integer;

/// <summary>
/// Função para retornar uma string a partir de um integer.
/// </summary>
/// <param name="argValor">
/// Valor integer que será convertido para uma string.
/// </param>
/// <param name="argZeroVazio">
/// Aplica-se somente se o valor passado em argValor for zero:
/// se false então retorna '0' se true retorna vazio ''.
/// </param>
/// <returns>
/// String convertida.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function IntegerStringConverter(argValor: Integer; argZeroVazio: Boolean = False): string;

/// <summary>
/// Função para retornar um boolean a partir de uma string.
/// </summary>
/// <param name="argValor">
/// Valor string que será convertido para um boolean.
/// </param>
/// <returns>
/// Boolean convertido.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringBooleanConverter(argValor: string): Boolean;

/// <summary>
/// Função para retornar uma string a partir de um boolean.
/// </summary>
/// <param name="argValor">
/// Valor boolean que será convertido para uma string.
/// </param>
/// <param name="argFlag">
/// Se true retorna 'S' ou 'N' senão 'Sim' ou 'Não'.
/// </param>
/// <returns>
/// String convertida.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function BooleanStringConverter(argValor: Boolean; argFlag: Boolean = True): string;

/// <summary>
/// Função para retornar um datetime a partir de uma string.
/// </summary>
/// <param name="argValor">
/// Valor string que será convertido para um datetime.
/// </param>
/// <returns>
/// Datetime convertido.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringDateTimeConverter(argValor: string): TDateTime;

/// <summary>
/// Função para retornar uma string a partir de um datetime.
/// </summary>
/// <param name="argValor">
/// Valor datetime que será convertido para uma string.
/// </param>
/// <param name="argFormato">
/// Formato do datetime convertido no padrão dd mm yy hh nn zzz.
/// </param>
/// <returns>
/// Datetime convertido.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function DateTimeStringConverter(argValor: TDateTime; argFormato: string): string;

/// <summary>
/// Função para retornar um datetime a partir de uma string no formato yyyy-mm-dd hh:nn:ss.zzz.
/// </summary>
/// <param name="argValor">
/// Valor string que será convertido para um datetime.
/// </param>
/// <returns>
/// Datetime convertido.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringDataHoraPersistidaConverter(argDataHora: string): TDateTime;

/// <summary>
/// Função para retornar um currency a partir de uma string.
/// </summary>
/// <param name="argValor">
/// Valor string que será convertido para um currency.
/// </param>
/// <returns>
/// String convertido.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringCurrencyConverter(argValor: string): Currency;

/// <summary>
/// Função para extrair o nome do path do arquivo.
/// </summary>
/// <param name="argArquivo">
/// Arquivo completo.
/// </param>
/// <returns>
/// Somente o path de onde o arquivo se encontra.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function PathExtrair(argArquivo: string): string;

/// <summary>
/// Função para retornar uma lista de arquivos conforme um padrão informado.
/// </summary>
/// <param name="argCaminho">
/// Caminho inicial onde a pesquisa será realizada.
/// </param>
/// <param name="argArquivo">
/// Nome do arquivo que está sendo procurado incluindo caracteres máscara.
/// </param>
/// <param name="argSubPastas">
/// Incluir pesquisa em subpastas.
/// </param>
/// <returns>
/// Uma lista de strings com o nome de cada arquivo encontrado.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function ListaArquivosRetornar(argCaminho: string; argArquivo: string; argSubPastas: Boolean): TStringList;

function DataFormatar(argData: string): string;

function DataValidar(argData: string): Boolean;

function HorarioFormatar(argHorario: string): string;

function HorarioValidar(argHorario: string): Boolean;

implementation

//
// HostNameRecuperar.
//
function HostNameRecuperar: string;
var
  locBuffer: array[0 .. 255] of Char;
  locSize  : DWORD;
begin
  locSize := MAX_COMPUTERNAME_LENGTH + 1;
  GetComputerName(locBuffer, locSize);
  Result := locBuffer;
end;

//
// UserNameRecuperar.
//
function UserNameRecuperar: string;
var
  locNetUserNameLength: DWord;
begin
  locNetUserNameLength := 50;
  SetLength(Result, locNetUserNameLength);
  GetUserName(pChar(Result), locNetUserNameLength);
  SetLength(Result, StrLen(pChar(Result)));
end;

//
// StringTrim.
//
function StringTrim(argValor: string): string;
var
  locTamanho : Integer;
  locContador: Integer;
begin
  Result := argValor;
  locTamanho := Length(argValor);

  locContador := 1;
  while locContador <= locTamanho do
  begin
    Result := StringReplace(Result, '  ', ' ', [rfIgnoreCase, rfReplaceAll]);
    Inc(locContador);
  end;

  Result := Trim(Result);
end;

//
// StringLocalizar.
//
function StringLocalizar(argValor    : string;
                         argSubString: string): Boolean;
begin
  if StrPos(PChar(argValor), PChar(argSubString)) = nil then
    Result := False
  else
    Result := True;
end;

//
// StringSubstituir.
//
function StringSubstituir(argValor: string;
                          argVelho: string;
                          argNovo : string): string;
begin
  Result := StringReplace(argValor, argVelho, argNovo, [rfIgnoreCase, rfReplaceAll]);
end;

//
// StringRemover.
//
function StringRemover(argValor  : string;
                       argRemover: string): string;
begin
  Result := StringSubstituir(argValor, argRemover, '');
end;

//
// StringPreencher.
//
function StringPreencher(argValor   : string;
                         argTamanho : Integer;
                         argCaracter: string;
                         argEsquerda: Boolean = True): string;
var
  locTamanhoOriginal: Integer;
  locQtdeCaracteres : Integer;
  locCaracter       : Char;
begin
  Result := '';

  locTamanhoOriginal := Length(argValor);
  locCaracter        := argCaracter[1];

  if (locTamanhoOriginal >= argTamanho) then
  begin
    Result := Copy(argValor, 1, argTamanho);
    Exit;
  end;

  locQtdeCaracteres := (argTamanho - locTamanhoOriginal);

  if argEsquerda then
  begin
    Result := StringOfChar(locCaracter, locQtdeCaracteres) + argValor;
  end
  else
  begin
    Result := argValor + StringOfChar(locCaracter, locQtdeCaracteres);
  end;
end;

//
// StringSeparar.
//
function StringSeparar(argValor    : string;
                       argSeparador: string): TStringList;
var
  locIndex          : Word;
  locStringSeparada : string;
begin
  //
  // Inicializa o array de retorno vazio.
  //
  Result := TStringList.Create;
  Result.Clear;

  //
  // Se um dos parâmetros for vazio então o retorno é um array [nil];
  //
  if ((argValor = EmptyStr) or (argSeparador = EmptyStr)) then
  begin
    Exit;
  end;

  //
  // Não é permitido um StringSeparador com mais de um caracter.
  //
  if (Length(argSeparador) > 1) then
  begin
    raise Exception.Create('O parâmetro "argSeperador" deve ter somente um caracter de tamanho');
  end;

  //
  // Percorro o StringBase, e a cada localização do StringSeparador é criada uma linha em
  // um array.
  //
  locStringSeparada := '';
  for locIndex := 1 to Length(argValor) do
  begin
    if (Copy(argValor, locIndex, 1) = argSeparador) then
    begin
      Result.Add(locStringSeparada);
      locStringSeparada := '';
    end
    else
    begin
      locStringSeparada := locStringSeparada + Copy(argValor, locIndex, 1);
    end;
  end;

  Result.Add(locStringSeparada);
end;

//
// StringAcentosRemover
//
function StringAcentosRemover(argValor: string): string;
const
  locComAcento: string = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
  locSemAcento: string = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
  locContador: Integer;
begin
  Result := EmptyStr;

  for locContador := 1 to Length(argValor) do
  begin
    if Pos(argValor[locContador], locComAcento) <> 0 then
    begin
      argValor[locContador] := locSemAcento[Pos(argValor[locContador], locComAcento)];
    end;
  end;

  Result := argValor;
end;

//
// SomenteNumerosValidar.
//
function SomenteNumerosValidar(argTexto: string): Boolean;
var
  locContador: Integer;
  locCaracter: string;
begin
  Result := True;

  for locContador := 1 to Length(argTexto) do
  begin
    locCaracter := Copy(argTexto, locContador, 1);

    if (locCaracter <> '0') and
       (locCaracter <> '1') and
       (locCaracter <> '2') and
       (locCaracter <> '3') and
       (locCaracter <> '4') and
       (locCaracter <> '5') and
       (locCaracter <> '6') and
       (locCaracter <> '7') and
       (locCaracter <> '8') and
       (locCaracter <> '9') then
    begin
      Result := False;
      Exit;
    end;
  end;
end;

//
// SomenteNumerosRetornar.
//
function SomenteNumerosRetornar(argTexto: string): string;
var
  locContador: Integer;
  locCaracter: string;
begin
  Result := '';

  for locContador := 1 to Length(argTexto) do
  begin
    locCaracter := Copy(argTexto, locContador, 1);

    if (locCaracter = '0') or
       (locCaracter = '1') or
       (locCaracter = '2') or
       (locCaracter = '3') or
       (locCaracter = '4') or
       (locCaracter = '5') or
       (locCaracter = '6') or
       (locCaracter = '7') or
       (locCaracter = '8') or
       (locCaracter = '9') then
    begin
      Result := Result + locCaracter;
    end;
  end;
end;

//
// StringIntegerConverter.
//
function StringIntegerConverter(argValor: string): Integer;
begin
  Result := StrToIntDef(argValor, 0);
end;

//
// IntegerStringConverter.
//
function IntegerStringConverter(argValor: Integer; argZeroVazio: Boolean = False): string;
begin
  if (argValor = 0) and (argZeroVazio) then
  begin
    Result := '';
  end
  else
  begin
    Result := IntToStr(argValor);
  end;
end;

//
// StringBooleanConverter.
//
function StringBooleanConverter(argValor: string): Boolean;
var
  locCaracter: string;
begin
  locCaracter := UpperCase(Copy(argValor, 1, 1));
  if (locCaracter = 'S') or (locCaracter = 'T') or
     (locCaracter = '1') or (locCaracter = 'V') then
  begin
    Result := True;
  end
  else
  begin
    Result := False;
  end;
end;

//
// BooleanStringConverter.
//
function BooleanStringConverter(argValor: Boolean; argFlag: Boolean = True): string;
begin
  if argValor then
  begin
    if argFlag then
    begin
      Result := 'S';
    end
    else
    begin
      Result := 'Sim';
    end;
  end
  else
  begin
    if argFlag then
    begin
      Result := 'N';
    end
    else
    begin
      Result := 'Não';
    end;
  end;
end;

//
// StringDateTimeConverter.
//
function StringDateTimeConverter(argValor: string): TDateTime;
var
  locValor   : string;
  locContador: Integer;
  locCaracter: string;
  locDia     : Integer;
  locMes     : Integer;
  locAno     : Integer;
  locHora    : Integer;
  locMinuto  : Integer;
  locSegundo : Integer;
  locMilesimo: Integer;
begin
  Result := 0;

  locValor := '';
  for locContador := 1 to Length(argValor) do
  begin
    locCaracter := Copy(argValor, locContador, 1);

    if SomenteNumerosValidar(locCaracter) then
    begin
      locValor := locValor + locCaracter;
    end;
  end;

  locDia      := StrToIntDef(Copy(locValor,  1, 2), 0);
  locMes      := StrToIntDef(Copy(locValor,  3, 2), 0);
  locAno      := StrToIntDef(Copy(locValor,  5, 4), 0);
  locHora     := StrToIntDef(Copy(locValor,  9, 2), 0);
  locMinuto   := StrToIntDef(Copy(locValor, 11, 2), 0);
  locSegundo  := StrToIntDef(Copy(locValor, 13, 2), 0);
  locMilesimo := StrToIntDef(Copy(locValor, 15, 3), 0);

  try
    Result := EncodeDateTime(locAno, locMes, locDia, locHora, locMinuto, locSegundo, locMilesimo);
  except
    Exit;
  end;  
end;

//
// DateTimeStringConverter.
//
function DateTimeStringConverter(argValor: TDateTime; argFormato: string): string;
begin
  if argValor = 0 then
  begin
    Result := '';
  end
  else
  begin
    Result := FormatDateTime(argFormato, argValor);
  end;
end;

//
// String persistirda data
//
function StringDataHoraPersistidaConverter(argDataHora: string): TDateTime;
var
  locDia    : string;
  locMes    : string;
  locAno    : string;
  locHorario: String;
begin
  locDia     := Copy(argDataHora,  9,  2);
  locMes     := Copy(argDataHora,  6,  2);
  locAno     := Copy(argDataHora,  1,  4);
  locHorario := Copy(argDataHora, 12, 12);
  Result     := StringDateTimeConverter(locDia + '/' + locMes + '/' + locAno + ' ' + locHorario)
end;

//
// StringCurrencyConverter.
//
function StringCurrencyConverter(argValor: string): Currency;
var
  locValor   : string;
  locContador: Integer;
  locCaracter: string;
begin
  locValor := '';
  for locContador := 1 to Length(argValor) do
  begin
    locCaracter := Copy(argValor, locContador, 1);

    if (SomenteNumerosValidar(locCaracter)) or
       (locCaracter = '.') or
       (locCaracter = ',') or
       (locCaracter = '-') then
    begin
      locValor := locValor + locCaracter;
    end;
  end;

  locValor := StringSubstituir(locValor, '.', '');
  locValor := StringSubstituir(locValor, ',', '');

  Result := StrToCurrDef(locValor, 0.00);
end;

//
// PathExtrair.
//
function PathExtrair(argArquivo: string): string;
begin
  Result := ExtractFilePath(argArquivo);
  Result := Copy(Result, 1, Length(Result) - 1);
end;

//
// ListaArquivosRetornar.
//
function ListaArquivosRetornar(argCaminho: string; argArquivo: string; argSubPastas: Boolean): TStringList;
var
  locPesquisa: TSearchRec;
  locRetorno : Integer;
  locSubPasta: string;
begin
  // Inicializa o array de retorno vazio.
  Result := TStringList.Create;
  Result.Clear;

  // Se não existir um '\' no caminho então insere.
  if Copy(argCaminho, Length(argCaminho), 1) <> '\' then argCaminho := argCaminho + '\';

  // Executa primeira pesquisa.
  try
    locRetorno := FindFirst(argCaminho + '*.*', faAnyFile, locPesquisa);
  except
    on locErro: Exception do
    begin
      raise Exception.Create('Impossível pesquisar informações sobre os arquivos: ' + locErro.Message);
    end;
  end;

  // Percorre a lista de arquivos da primeira pesquisa.
  while locRetorno = 0 do
  begin
    // O arquivo não é uma pasta.
    if (locPesquisa.Attr and faDirectory) <> faDirectory then
    begin
      // Insere nome do arquivo no retorno.
      Result.Add(argCaminho + locPesquisa.Name);
    end
    else
    begin
      // Se for mesmo uma pasta.
      if (locPesquisa.Name <> '.') And (locPesquisa.Name <> '..') then
        // Está definido para pesquisar dentro das subpastas.
        if argSubPastas = True then
        begin
          // Nome correto da subpasta.
          locSubPasta := argCaminho + locPesquisa.Name;

          // Executa pesquisa recursiva na subpasta encontrada.
          try
            ListaArquivosRetornar(locSubPasta, argArquivo, argSubPastas);
          except
            on locErro: exception do
            begin
              System.SysUtils.FindClose(locPesquisa);
              raise Exception.Create(locErro.Message);
            end;
          end;
        end;
    end;

    // Próximo arquivo encontrado.
    locRetorno := FindNext(locPesquisa);
  end;

  // Encerra pesquisa.
  System.SysUtils.FindClose(locPesquisa);
end;

//
// DataFormatar.
//
function DataFormatar(argData: string): string;
const
  locSEPARADOR: string = '/';
var
  locData: string;
begin
  Result  := EmptyStr;

  locData := SomenteNumerosRetornar(argData);

  if Length(locData) = 6 then
  begin
    if Copy(locData, 5, 2) < '35' then
    begin
      locData := Copy(locData, 1, 4) + '20' + Copy(locData, 5, 2);
    end
    else
    begin
      locData := Copy(locData, 1, 4) + '19' + Copy(locData, 5, 2);
    end;
  end;
 
  locData := StringPreencher(locData, 8, '0');

  if locData = '00000000' then Exit;
  
  Result  := Copy(locData, 1, 2) + locSEPARADOR + Copy(locData, 3, 2) + locSEPARADOR + Copy(locData, 5, 4);
end;

//
// DataValidar.
//
function DataValidar(argData: string): Boolean;
begin
  Result := False;

  argData := DataFormatar(argData);

  if (argData = '') then Exit;

  // Valida data.
  try
    EncodeDate(StrToInt(Copy(argData, 7, 4)),
               StrToInt(Copy(argData, 4, 2)),
               StrToInt(Copy(argData, 1, 2)));
  except
    Exit;
  end;

  Result := True;
end;

//
// HorarioFormatar.
//
function HorarioFormatar(argHorario: string): string;
const
  locSEPARADOR: string = ':';
var
  locHorario: string;
begin
  Result  := EmptyStr;

  locHorario := SomenteNumerosRetornar(argHorario);

  locHorario := StringPreencher(locHorario, 4, '0');

  if locHorario = '0000' then Exit;
  
  Result  := Copy(locHorario, 1, 2) + locSEPARADOR + Copy(locHorario, 3, 2);
end;

//
// HorarioValidar.
//
function HorarioValidar(argHorario: string): Boolean;
var
  locHora  : Integer;
  locMinuto: Integer;
begin
  Result := False;

  argHorario := HorarioFormatar(argHorario);

  if (argHorario = '') then Exit;

  locHora   := StringIntegerConverter(Copy(argHorario, 1, 2));
  locMinuto := StringIntegerConverter(Copy(argHorario, 4, 2));

  if (locHora   < 0) or (locHora   > 23) then Exit;
  if (locMinuto < 0) or (locMinuto > 59) then Exit;

  Result := True;
end;

end.
