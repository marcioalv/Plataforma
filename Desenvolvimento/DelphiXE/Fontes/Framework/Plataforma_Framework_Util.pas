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

/// <summary>
/// Fun��o para retornar o nome do computador ou dispositivo.
/// </summary>
/// <returns>
/// Nome do computador ou dispositivo.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function HostNameRecuperar: string;

/// <summary>
/// Fun��o para retornar o nome do usu�rio que est� logado no computador.
/// </summary>
/// <returns>
/// Nome do usu�rio logado no computador.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function UserNameRecuperar: string;

/// <summary>
/// Fun��o para remover espa�os desnecess�rios em uma string.
/// </summary>
/// <param name="argValor">
/// Valor string que ter� os espa�os desnecess�rios removidos.
/// </param>
/// <returns>
/// String sem espa�os desnecess�rios.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringTrim(argValor: string): string;

/// <summary>
/// Fun��o para localizar uma substring dentro de um valor.
/// </summary>
/// <param name="argValor">
/// String original.
/// </param>
/// <param name="argSubString">
/// Substring que tentar� ser localizado dentro do valor.
/// </param>
/// <returns>
/// True se a substring for localizado ou false se n�o for.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringLocalizar(argValor: string; argSubString: string): Boolean;

/// <summary>
/// Fun��o para substituir uma string velha por uma string nova.
/// </summary>
/// <param name="argValor">
/// String original.
/// </param>
/// <param name="argVelho">
/// Substring velha que ser� localizada.
/// </param>
/// <param name="argNovo">
/// Substring nova que ser� substitu�da.
/// </param>
/// <returns>
/// Nova string com os valores substitu�dos.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringSubstituir(argValor: string; argVelho: string; argNovo : string): string;

/// <summary>
/// Fun��o para remover uma substring de uma string.
/// </summary>
/// <param name="argValor">
/// String original.
/// </param>
/// <param name="argRemover">
/// Substring que ser� removida.
/// </param>
/// <returns>
/// Nova string sem a substring desejada.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringRemover(argValor: string; argRemover: string): string;

/// <summary>
/// Fun��o para preencher uma string com uma determinada quantidade de caracteres a esquerda ou direita.
/// </summary>
/// <param name="argValor">
/// String original.
/// </param>
/// <param name="argTamanho">
/// Tamanho final desejado para o valor.
/// </param>
/// <param name="argCaracter">
/// Caracter que ser� utilizado para o preenchimento.
/// </param>
/// <param name="argEsquerda">
/// Se true o preenchimento ocorrer� ao lado esquerdo do valor se false ao lado direito.
/// </param>
/// <returns>
/// Nova string preenchida.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringPreencher(argValor: string; argTamanho: Integer; argCaracter: string; argEsquerda: Boolean = True): string;

/// <summary>
/// Fun��o para separar uma string em partes.
/// </summary>
/// <param name="argValor">
/// String original.
/// </param>
/// <param name="argSeparador">
/// Caracter que indica onde deve ocorrer a separa��o.
/// </param>
/// <returns>
/// Uma lista de strings com cada parte desejada.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringSeparar(argValor: string; argSeparador: string): TStringList;

/// <summary>
/// Fun��o para remover os acentos de uma string.
/// </summary>
/// <param name="argValor">
/// String original.
/// </param>
/// <returns>
/// Uma string sem caracteres de acentua��o.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringAcentosRemover(argValor: string): string;

/// <summary>
/// Fun��o para validar se em uma string existem somente n�meros.
/// </summary>
/// <param name="argValor">
/// Valor que ser� validado.
/// </param>
/// <returns>
/// True se existirem somente n�meros ou false se existirem outros caracteres al�m de d�gitos.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function SomenteNumerosValidar(argTexto: string): Boolean;

/// <summary>
/// Fun��o para retornar um integer a partir de uma string.
/// </summary>
/// <param name="argValor">
/// Valor string que ser� convertido para um integer.
/// </param>
/// <returns>
/// Integer convertido.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringIntegerConverter(argValor: string): Integer;

/// <summary>
/// Fun��o para retornar uma string a partir de um integer.
/// </summary>
/// <param name="argValor">
/// Valor integer que ser� convertido para uma string.
/// </param>
/// <param name="argZeroVazio">
/// Aplica-se somente se o valor passado em argValor for zero:
/// se false ent�o retorna '0' se true retorna vazio ''.
/// </param>
/// <returns>
/// String convertida.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function IntegerStringConverter(argValor: Integer; argZeroVazio: Boolean = False): string;

/// <summary>
/// Fun��o para retornar um boolean a partir de uma string.
/// </summary>
/// <param name="argValor">
/// Valor string que ser� convertido para um boolean.
/// </param>
/// <returns>
/// Boolean convertido.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringBooleanConverter(argValor: string): Boolean;

/// <summary>
/// Fun��o para retornar uma string a partir de um boolean.
/// </summary>
/// <param name="argValor">
/// Valor boolean que ser� convertido para uma string.
/// </param>
/// <param name="argFlag">
/// Se true retorna 'S' ou 'N' sen�o 'Sim' ou 'N�o'.
/// </param>
/// <returns>
/// String convertida.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function BooleanStringConverter(argValor: Boolean; argFlag: Boolean = True): string;

/// <summary>
/// Fun��o para retornar um datetime a partir de uma string.
/// </summary>
/// <param name="argValor">
/// Valor string que ser� convertido para um datetime.
/// </param>
/// <returns>
/// Datetime convertido.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringDateTimeConverter(argValor: string): TDateTime;

/// <summary>
/// Fun��o para retornar uma string a partir de um datetime.
/// </summary>
/// <param name="argValor">
/// Valor datetime que ser� convertido para uma string.
/// </param>
/// <param name="argFormato">
/// Formato do datetime convertido no padr�o dd mm yy hh nn zzz.
/// </param>
/// <returns>
/// Datetime convertido.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function DateTimeStringConverter(argValor: TDateTime; argFormato: string): string;

/// <summary>
/// Fun��o para retornar um datetime a partir de uma string no formato yyyy-mm-dd hh:nn:ss.zzz.
/// </summary>
/// <param name="argValor">
/// Valor string que ser� convertido para um datetime.
/// </param>
/// <returns>
/// Datetime convertido.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function StringDataHoraPersistidaConverter(argDataHora: string): TDateTime;

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
  // Se um dos par�metros for vazio ent�o o retorno � um array [nil];
  //
  if ((argValor = EmptyStr) or (argSeparador = EmptyStr)) then
  begin
    Exit;
  end;

  //
  // N�o � permitido um StringSeparador com mais de um caracter.
  //
  if (Length(argSeparador) > 1) then
  begin
    raise Exception.Create('O par�metro "argSeperador" deve ter somente um caracter de tamanho');
  end;

  //
  // Percorro o StringBase, e a cada localiza��o do StringSeparador � criada uma linha em
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
  locComAcento: string = '����������������������������';
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
      Result := 'N�o';
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

end.
