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
  Winapi.Winsock,
  Winapi.Windows;

const
  ENTER       : Char = #13;
  ESC         : Char = #27;
  TAB         : Char = #9;
  BACKSPACE   : Char = #8;
  CTRL        : Char = #17;
  CTRL_C      : Char = #3;
  CTRL_V      : Char = #22;
  CTRL_X      : Char = #24;

  SETA_ABAIXO : Integer = 40;

  F1          : Integer = 112;
  F2          : Integer = 113;
  F3          : Integer = 114;
  F4          : Integer = 115;
  F5          : Integer = 116;
  F6          : Integer = 117;
  F7          : Integer = 118;
  F8          : Integer = 119;
  F9          : Integer = 120;
  F10         : Integer = 121;
  F11         : Integer = 122;
  F12         : Integer = 123;

  JANEIRO     : string = 'Janeiro';
  FEVEREIRO   : string = 'Fevereiro';
  MARCO       : string = 'Março';
  ABRIL       : string = 'Abril';
  MAIO        : string = 'Maio';
  JUNHO       : string = 'Junho';
  JULHO       : string = 'Julho';
  AGOSTO      : string = 'Agosto';
  SETEMBRO    : string = 'Setembro';
  OUTUBRO     : string = 'Outubro';
  NOVEMBRO    : string = 'Novembro';
  DEZEMBRO    : string = 'Dezembro';

  ESQUERDA    : Byte = 0;
  DIREITA     : Byte = 1;

  FLAG_SIM    : string = 'S';
  FLAG_NAO    : string = 'N';
  FLAG_AMBOS  : string = 'A';

  STR_NOVO    : string = 'Novo';

  CONCATENADOR: string = ' => ';

function HostNameRecuperar: string;

function UserNameRecuperar: string;

function FeriadoFixoDeterminar(argData: TDateTime): string;

function PeriodoDeterminar(argData: TDateTime): string;

function DiaSemanaDeterminar(argData: TDateTime): string;

function NomeMesDeterminar(argData: TDateTime): string;

function AmPmDeterminar(argData: TDateTime): string;

function DateTimeHorarioInicial(argData: TDateTime): TDateTime;
                                   
function DateTimeHorarioFinal(argData: TDateTime): TDateTime;

function DriveSerialNumberRecuperar(argDriveLetra: string): Integer;

function StringCadastroIncluir(argTexto: string): string;

function StringConcatenar(argMensagem1: string; argMensagem2: string; argMensagem3: string = ''): string;

function StringConcatenadorEnter(argValor: string): string;

function StringLogDadosDescreverEnter(argValor: string): string;

function StringTrim(argValor: string): string;

function StringLocalizar(argValor: string; argSubString: string): Boolean;

function StringCaracterContar(argValor: string; argCaracter: string): Integer;

function StringSubstituir(argValor: string; argVelho: string; argNovo : string): string;

function StringRemover(argValor: string; argRemover: string): string;

function StringPreencher(argValor: string; argTamanho: Integer; argCaracter: string; argEsquerda: Boolean = True): string;

function StringSeparar(argValor: string; argSeparador: string): TStringList;

function StringAcentosRemover(argValor: string): string;

function StringLikeGerar(argValor: string): string;

function SomenteNumerosValidar(argTexto: string): Boolean;

function SomenteNumerosRetornar(argTexto: string): string;

function FlagSimNaoStringConverter(argTexto: string): string;

function StringIntegerConverter(argValor: string): Integer;

function IntegerStringConverter(argValor: Integer; argZeroVazio: Boolean = False): string;

function StringBooleanConverter(argValor: string): Boolean;

function BooleanStringConverter(argValor: Boolean; argFlag: Boolean = True): string;

function StringDateTimeConverter(argValor: string): TDateTime;

function DateTimeStringConverter(argValor: TDateTime; argFormato: string): string;

function StringDataHoraPersistidaConverter(argDataHora: string): TDateTime;

function StringCurrencyConverter(argValor: string): Currency;

function CurrencyStringConverter(argValor: Currency; argSimboloMoeda: string = 'R$'; argCasasDecimais: Integer = 2; argVazio: Boolean = True; argSeparadorMilhar: Boolean = True): string;

function PathExtrair(argArquivo: string): string;

function PathArquivoExisteDeterminar(argPathArquivo: string): Boolean;

procedure PathCriar(argCaminho: string);

function ListaArquivosRetornar(argCaminho: string; argArquivo: string; argSubPastas: Boolean): TStringList;

function FormatacaoRemover(argValor: string): string;

function CPFFormatar(argCPF: string): string;

function CPFValidar(argCPF: string): boolean;

function CNPJFormatar(argCNPJ: string): string;

function CNPJValidar(argCNPJ : string): Boolean;

function CPFCNPJFormatar(argCPF_CNPJ: string): string;

function CPFCNPJValidar(argCPF_CNPJ: string): Boolean;

function DataFormatar(argData: string): string;

function DataValidar(argData: string): Boolean;

function HorarioFormatar(argHorario: string): string;

function HorarioValidar(argHorario: string): Boolean;

function CurrencyFormatar(argValor: string; argSimboloMoeda: string = 'R$'; argCasasDecimais: Integer = 2; argVazio: Boolean = True; argSeparadorMilhar: Boolean = True) : string;

procedure LogDadosStringDescrever (argCampo: string; argValor: string;  var outRetorno: string);
procedure LogDadosIntegerDescrever(argCampo: string; argValor: Integer; var outRetorno: string);
procedure LogDadosBooleanDescrever(argCampo: string; argValor: Boolean; var outRetorno: string);

function ADOConnectionStringGerar(argServidor  : string;
                                  argInstancia : string;
                                  argPorta     : Integer;
                                  argUsuario   : string;
                                  argSenha     : string;
                                  argBancoDados: string): string;

implementation

//
// HostNameRecuperar.
//
function HostNameRecuperar: string;
var
  locBuffer: array [0..63] of AnsiChar;
  locGInitData: TWSADATA;
begin
  WSAStartup($101, locGInitData);
  GetHostName(locBuffer, SizeOf(locBuffer));
  Result := string(locBuffer);
  WSACleanup;
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
// FeriadoFixoDeterminar.
//
function FeriadoFixoDeterminar(argData: TDateTime): string;
var
  locDia: Integer;
  locMes: Integer;
begin
  locDia := DayOfTheMonth(argData);
  locMes := MonthOfTheYear(argData);

  Result := '';
  
  if (locDia =  1) and (locMes =  1) then Result := 'Confraternização universal';
  if (locDia = 21) and (locMes =  4) then Result := 'Tiradentes';
  if (locDia =  1) and (locMes =  5) then Result := 'Dia do trabalhador';
  if (locDia =  7) and (locMes =  9) then Result := 'Dia da pátria';
  if (locDia = 12) and (locMes = 10) then Result := 'Nossa Senhora Aparecida';
  if (locDia =  2) and (locMes = 11) then Result := 'Finados';
  if (locDia = 15) and (locMEs = 11) then Result := 'Proclamação da república';
  if (locDia = 25) and (locMes = 12) then Result := 'Natal';
end;

//
// PeriodoDeterminar.
//
function PeriodoDeterminar(argData: TDateTime): string;
begin
  if FormatDateTime('hh', argData) < '12' then
    Result := 'Manhã'
  else
    Result := 'Tarde';
end;

//
// DiaSemanaDeterminar.
//
function DiaSemanaDeterminar(argData: TDateTime): string;
var
  locDiaSemana: Word;
begin
  locDiaSemana := DayOfTheWeek(argData);

  Result := '';
  if locDiaSemana = 7 then Result := 'Domingo';
  if locDiaSemana = 1 then Result := 'Segunda-feira';
  if locDiaSemana = 2 then Result := 'Terça-feira';
  if locDiaSemana = 3 then Result := 'Quarta-feira';
  if locDiaSemana = 4 then Result := 'Quinta-feira';
  if locDiaSemana = 5 then Result := 'Sexta-feira';
  if locDiaSemana = 6 then Result := 'Sábado';
end;

//
// NomeMesDeterminar.
//
function NomeMesDeterminar(argData: TDateTime): string;
var
  locMes: Word;
begin
  locMes := MonthOfTheYear(argData);

  Result := '';
  if locMes =  1 then Result := JANEIRO;
  if locMes =  2 then Result := FEVEREIRO;
  if locMes =  3 then Result := MARCO;
  if locMes =  4 then Result := ABRIL;
  if locMes =  5 then Result := MAIO;
  if locMes =  6 then Result := JUNHO;
  if locMes =  7 then Result := JULHO;
  if locMes =  8 then Result := AGOSTO;
  if locMes =  9 then Result := SETEMBRO;
  if locMes = 10 then Result := OUTUBRO;
  if locMes = 11 then Result := NOVEMBRO;
  if locMes = 12 then Result := DEZEMBRO;
end;

//
//
//
function AmPmDeterminar(argData: TDateTime): string;
begin
  if StrToInt(FormatDateTime('hh', Now)) < 12 then
    Result := 'am'
  else
    Result := 'pm';
end;

//
// DateTimeHorarioInicial.
//
function DateTimeHorarioInicial(argData: TDateTime): TDateTime;
var
  locDia: Word;
  locMes: Word;
  locAno: Word;
begin
  locDia := DayOf(argData);
  locMes := MonthOf(argData);
  locAno := YearOf(argData);

  try
    Result := EncodeDateTime(locAno, locMes, locDia, 0, 0, 0, 0);
  except
    Result := 0;
  end;
end;

//
// DateTimeHorarioFinal.
//
function DateTimeHorarioFinal(argData: TDateTime): TDateTime;
var
  locDia: Word;
  locMes: Word;
  locAno: Word;
begin
  locDia := DayOf(argData);
  locMes := MonthOf(argData);
  locAno := YearOf(argData);

  try
    Result := EncodeDateTime(locAno, locMes, locDia, 23, 59, 59, 999);
  except
    Result := 0;
  end;
end;

//
// HDSeriaNumberRecuperar.
//
function DriveSerialNumberRecuperar(argDriveLetra: string): Integer;
var 
  locNotUsed           : DWord;
  locVolumeFlags       : DWord;
  locVolumeSerialNumber: DWord;
begin 
  GetVolumeInformation(PChar(argDriveLetra + ':\'), nil, MAX_PATH, @locVolumeSerialNumber, locNotUsed, locVolumeFlags, nil, 0);
  Result := Abs(locVolumeSerialNumber);
end;

//
// StringCadastroIncluir.
//
function StringCadastroIncluir(argTexto: string): string;
begin
  if argTexto = '' then
    Result := argTexto
  else
    Result := argTexto + '   ' + '›'; // '©';
end;

//
// StringConcatenar.
//
function StringConcatenar(argMensagem1: string; argMensagem2: string; argMensagem3: string = ''): string;
begin
  Result := argMensagem1 + CONCATENADOR + argMensagem2;
  if argMensagem3 <> '' then Result := Result + CONCATENADOR + argMensagem3;
end;

//
// StringConcatenadorEnter.
//
function StringConcatenadorEnter(argValor: string): string;
const
  SEPARADOR: string = '¨';
var
  locStringList: TStringList;
  locContador  : Integer;
begin
  argValor := StringSubstituir(argValor, CONCATENADOR, SEPARADOR);

  locStringList := StringSeparar(argValor, SEPARADOR);

  Result := '';
  for locContador := 0 to (locStringList.Count - 1) do
  begin
    if Result <> '' then Result := Result + #13 + #13;
    Result := Result + locStringList[locContador];
  end;  
end;

//
// StringLogDadosDescreverEnter.
//
function StringLogDadosDescreverEnter(argValor: string): string;
const
  SEPARADOR: string = '¨';
var
  locStringList: TStringList;
  locContador  : Integer;
begin
  argValor := StringSubstituir(argValor, ']; ', SEPARADOR);

  locStringList := StringSeparar(argValor, SEPARADOR);

  Result := '';
  for locContador := 0 to (locStringList.Count - 1) do
  begin
    if Result <> '' then Result := Result + ']' + #13 + #10;
    Result := Result + locStringList[locContador];
  end;  
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
// StringCaracterContar.
//
function StringCaracterContar(argValor: string; argCaracter: string): Integer;
var
  locContador: Integer;
begin
  Result := 0;
  for locContador := 0 to Length(argValor) - 1 do
  begin
    if Copy(argValor, locContador, 1) = argCaracter then Inc(Result);
  end;
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
// StringLikeGerar.
//
function StringLikeGerar(argValor: string): string;
begin
  Result := '%' + StringSubstituir(StringTrim(argValor), ' ', '%') + '%'
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
// FlagSimNaoStringConverter.
//
function FlagSimNaoStringConverter(argTexto: string): string;
begin
  if UpperCase(Copy(argTexto, 1, 1)) = 'S' then
    Result := 'Sim'
  else
    Result := 'Não';
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
// CurrencyStringConverter.
//
function CurrencyStringConverter(argValor: Currency; argSimboloMoeda: string = 'R$'; argCasasDecimais: Integer = 2; argVazio: Boolean = True; argSeparadorMilhar: Boolean = True): string;
var
  locFormatacao: string;
  locContador  : Integer;
begin
  if argSeparadorMilhar then
    locFormatacao := '#,###,###,##0'
  else
    locFormatacao := '#########0';

  if argCasasDecimais > 0 then
  begin
    locFormatacao := locFormatacao + '.';
    for locContador := 1 to argCasasDecimais do locFormatacao := locFormatacao + '0';
  end;

  Result := FormatCurr(locFormatacao, argValor);

  if argSimboloMoeda <> '' then Result := argSimboloMoeda + ' ' + Result;

  if (argVazio) and (argValor = 0) then Result := '';
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
// PathArquivoExisteDeterminar.
//
function PathArquivoExisteDeterminar(argPathArquivo: string): Boolean;
var
  locSearchRec  : TSearchRec;
begin
  Result := False;
  argPathArquivo := PathExtrair(argPathArquivo);
  if FindFirst(argPathArquivo, faAnyFile, locSearchRec) = 0 then
  begin
    Result := True;
  end;
end;

//
// PathCriar.
//
procedure PathCriar(argCaminho: string);
begin
  try
    ForceDirectories(PathExtrair(argCaminho));
  except
    on locErro: Exception do
    begin
      raise Exception.Create(locErro.Message);
    end;
  end;
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
// FormatacaoRemover.
//
function FormatacaoRemover(argValor: string): string;
begin
  Result := StringTrim(argValor);
  
  Result := StringRemover(Result, '.');
  Result := StringRemover(Result, '-');
  Result := StringRemover(Result, '/');
  Result := StringRemover(Result, '\');
  Result := StringRemover(Result, ':');  
end;

//
// CPFFormatar.
//
function CPFFormatar(argCPF: string): string;
begin
  argCPF := FormatacaoRemover(argCPF);
  argCPF := Copy(argCPF, 1, 11);
  argCPF := StringPreencher(argCPF, 11, '0');
  
  Result := Copy(argCPF,  1, 3) + '.' +
            Copy(argCPF,  4, 3) + '.' +
            Copy(argCPF,  7, 3) + '-' +
            Copy(argCPF, 10, 2);
end;

//
// CPFValidar.
//
function CPFValidar(argCPF: string): Boolean;
var
  locContador: Integer;
  locDV      : Integer;
  locModulo  : Integer;
begin
  //
  // Retorno padrão.
  //
  Result := False;

  //
  // Formata o CPF com zeros a esquerda.
  //
  argCPF := FormatacaoRemover(argCPF);
  argCPF := Copy(argCPF, 1, 11);
  argCPF := StringPreencher(argCPF, 11, '0');

  //
  // Se houver algum caracter que seja um número então não é válido.
  //
  if not SomenteNumerosValidar(argCPF) then Exit;

  //
  // Todos os dígitos iguais não é válido.
  //
  if (argCPF = '00000000000') or (argCPF = '11111111111') or
     (argCPF = '22222222222') or (argCPF = '33333333333') or
     (argCPF = '44444444444') or (argCPF = '55555555555') or
     (argCPF = '66666666666') or (argCPF = '77777777777') or
     (argCPF = '88888888888') or (argCPF = '99999999999') then Exit;

  //
  // Calcula o primeiro dígito verificador.
  //
  locDV     := 0;
  locModulo := 2;

  for locContador := 9 downto 1 do
  begin
    locDV := locDV + (StrToInt(argCPF[locContador])) * locModulo;
    Inc(locModulo);
  end;

  locDV := 11 - (locDV mod 11);

  if (locDV = 10) or (locDV = 11) then locDV := 0;

  //
  // Valida o primeiro dígito verificador.
  //
  if StrToInt(argCPF[10]) <> locDV then Exit;

  //
  // Calcula o segundo dígito verificador.
  //
  locDV     := 0;
  locModulo := 2;

  for locContador := 10 downto 1 do
  begin
    locDV := locDV + StrToInt(argCPF[locContador]) * locModulo;
    Inc(locModulo);
  end;

  locDV := 11 - (locDV mod 11);

  if (locDV = 10) or (locDV = 11) then locDV := 0;

  //
  // Valida o segundo dígito verificador.
  //
  if StrToInt(argCPF[11]) <> locDV then Exit;

  //
  // CPF Válido.
  //
  Result := True;
end;

//
// CNPJFormatar.
//
function CNPJFormatar(argCNPJ: string): string;
begin
  argCNPJ := FormatacaoRemover(argCNPJ);
  argCNPJ := Copy(argCNPJ, 1, 14);
  argCNPJ := StringPreencher(argCNPJ, 14, '0');
  
  Result := Copy(argCNPJ,  1, 2) + '.' +
            Copy(argCNPJ,  3, 3) + '.' +
            Copy(argCNPJ,  6, 3) + '/' +
            Copy(argCNPJ,  9, 4) + '-' +
            Copy(argCNPJ, 13, 2);
end;

//
// CNPJValidar.
//
function CNPJValidar(argCNPJ : string): Boolean;
var
  locContador: Integer;
  locDV      : Integer;
  locModulo  : Integer;
begin
  //
  // Retorno padrão.
  //
  Result := False;

  //
  // Formata o CNPJ.
  //
  argCNPJ := FormatacaoRemover(argCNPJ);
  argCNPJ := Copy(argCNPJ, 1, 14);
  argCNPJ := StringPreencher(argCNPJ, 14, '0');

  //
  // Se houver algum caracter que seja um número então não é válido.
  //
  if not SomenteNumerosValidar(argCNPJ) then Exit;

  //
  // Todos os dígitos iguais não é válido.
  //
  if (argCNPJ = '00000000000000') or (argCNPJ = '11111111111111') or
     (argCNPJ = '22222222222222') or (argCNPJ = '33333333333333') or
     (argCNPJ = '44444444444444') or (argCNPJ = '55555555555555') or
     (argCNPJ = '66666666666666') or (argCNPJ = '77777777777777') or
     (argCNPJ = '88888888888888') or (argCNPJ = '99999999999999') then Exit;

  //
  // Calcula o primeiro dígito verificador.
  //
  locDV     := 0;
  locModulo := 2;

  for locContador := 12 downto 1 do
  begin
    if (locModulo = 10) then locModulo := 2;
    locDV  := locDV  + StrToInt(argCNPJ[locContador]) * locModulo;
    Inc(locModulo);
  end;

  locDV := 11 - locDV mod 11;

  if (locDV = 11) or (locDV = 10) then locDV := 0;

  //
  // Valida o primeiro dígito verificado.
  //
  if StrToInt(argCNPJ[13]) <> locDV then Exit;

  //
  // Calcula o segundo dígito verificador.
  //
  locDV     := 0;
  locModulo := 2;

  for locContador := 13 downto 1 do
  begin
    if (locModulo = 10) then locModulo := 2;
    locDV := locDV + StrToInt(argCNPJ[locContador]) * locModulo;
    Inc(locModulo);
  end;

  locDV := 11 - locDV mod 11;

  if (locDV = 11) or (locDV = 10) then locDV := 0;

  //
  // Valida o segundo dígito verificado.
  //
  if StrToInt(argCNPJ[14]) <> locDV then Exit;

  //
  // CNPJ válido.
  //
  Result := True;
end;

//
// CPFCNPJFormatar.
//
function CPFCNPJFormatar(argCPF_CNPJ: string): string;
begin
  argCPF_CNPJ := StringRemover(argCPF_CNPJ, '.');
  argCPF_CNPJ := StringRemover(argCPF_CNPJ, '/');
  argCPF_CNPJ := StringRemover(argCPF_CNPJ, '-');

  if Length(argCPF_CNPJ) <= 11 then
    Result := CPFFormatar(argCPF_CNPJ)
  else
    Result := CNPJFormatar(argCPF_CNPJ);  
end;

//
// CPFCNPJValidar.
//
function CPFCNPJValidar(argCPF_CNPJ: string): Boolean;
begin
  argCPF_CNPJ := StringRemover(argCPF_CNPJ, '.');
  argCPF_CNPJ := StringRemover(argCPF_CNPJ, '/');
  argCPF_CNPJ := StringRemover(argCPF_CNPJ, '-');

  if Length(argCPF_CNPJ) <= 11 then
    Result := CPFValidar(argCPF_CNPJ)
  else
    Result := CNPJValidar(argCPF_CNPJ);  
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
var
  locData: TDateTime;
begin
  Result := False;

  argData := DataFormatar(argData);

  if (argData = '') then Exit;

  // Valida data.
  try
    locData := EncodeDate(StrToInt(Copy(argData, 7, 4)),
                          StrToInt(Copy(argData, 4, 2)),
                          StrToInt(Copy(argData, 1, 2)));
  except
    Exit;
  end;

  // Menor data possível!
  if locData < (Date - 40000) then Exit;

  // Maior data possível!
  if locData > (Date + 40000) then Exit;
  
  // Data OK!
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

//
// CurrencyFormatar.
//
function CurrencyFormatar(argValor: string; argSimboloMoeda: string = 'R$'; argCasasDecimais: Integer = 2; argVazio: Boolean = True; argSeparadorMilhar: Boolean = True) : string;
var
  locVlrCurr: Currency;
begin
  locVlrCurr := StringCurrencyConverter(argValor);
  Result     := CurrencyStringConverter(locVlrCurr, argSimboloMoeda, argCasasDecimais, argVazio, argSeparadorMilhar);
end;

//
// Procedimento LogDescrever!
//
procedure LogDadosStringDescrever(argCampo: string; argValor: string; var outRetorno: string);
begin
  if outRetorno <> '' then outRetorno := outRetorno + '; ';
  outRetorno := outRetorno + argCampo + ': [' + argValor + ']';
end;

procedure LogDadosIntegerDescrever(argCampo: string; argValor: Integer; var outRetorno: string);
begin
  LogDadosStringDescrever(argCampo, IntegerStringConverter(argValor), outRetorno);
end;

procedure LogDadosBooleanDescrever(argCampo: string; argValor: Boolean; var outRetorno: string);
begin
  LogDadosStringDescrever(argCampo, BooleanStringConverter(argValor), outRetorno);
end;

//
// ADOConnectionStringGerar.
//
function ADOConnectionStringGerar(argServidor  : string;                                  
                                  argInstancia : string;
                                  argPorta     : Integer;
                                  argUsuario   : string;
                                  argSenha     : string;
                                  argBancoDados: string): string;
var
  locDriver    : string;
  locEndereco  : string;
  locUsuario   : string;
  locSenha     : string;
  locBancoDados: string;
begin
  //
  // Consistências.
  //
  if StringTrim(argServidor) = '' then
  begin
    raise Exception.Create('O nome do servidor do banco de dados da conexão deve ser informado!');
  end;

  if StringTrim(argUsuario) = '' then
  begin
    raise Exception.Create('O usuário para conexão ao banco de dados deve ser informado!');
  end;

  if StringTrim(argBancoDados) = '' then
  begin
    raise Exception.Create('O nome do banco de dados (catálogo) no servidor deve ser informado!');
  end;

  //
  // Driver.
  //
  locDriver := 'SQLOLEDB.1';

  //
  // Endereço.
  //
  locEndereco := argServidor;

  if argInstancia <> '' then
  begin
    locEndereco := locEndereco + '\' + argInstancia;
  end;

  //
  // Porta.
  //
  if argPorta > 0 then
  begin
    locEndereco := 'tcp:' + locEndereco;
    locEndereco := locEndereco + ',' + IntToStr(argPorta);
  end;

  //
  // Usuário.
  //
  locUsuario := argUsuario;

  //
  // Senha.
  //
  locSenha := argSenha;

  //
  // Banco de dados.
  //
  locBancoDados := argBancoDados;

  //
  // Retorna string de conexão.
  //
  Result := '';

  // Driver.
  if locDriver <> '' then
  begin
    if Result <> '' then Result := Result + ';';
    Result := Result + 'Provider=' + locDriver;
  end;

  // Endereço.
  if locEndereco <> '' then
  begin
    if Result <> '' then Result := Result + ';';
    Result := Result + 'Address=' + locEndereco;
  end;

  // Usuário.
  if locUsuario <> '' then
  begin
    if Result <> '' then Result := Result + ';';
    Result := Result + 'UID=' + locUsuario;
  end;

  // Senha.
  if locSenha <> '' then
  begin
    if Result <> '' then Result := Result + ';';
    Result := Result + 'PWD=' + locSenha;
  end;

  // Banco de dados.
  if locBancoDados <> '' then
  begin
    if Result <> '' then Result := Result + ';';
    Result := Result + 'Database=' + locBancoDados;
  end;

  // Conexão confiável se SQLServer.
  if Result <> '' then Result := Result + ';';  
  Result := Result + 'Trusted_Connection=True';
end;

end.
