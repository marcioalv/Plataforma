unit Plataforma_Framework_Criptografia;

interface

uses
  System.SysUtils,
  System.DateUtils;

//
// TCriptografia.
//
type
  TCriptografia = class
  //
  // Dados privados.
  //
  private
    //
    // Atributo.
    //
    _QuantidadeCaracteres           : Integer;

    _ListaCaracteresOriginal        : array of string;
    _ListaCaracteresCriptografados0 : array of string;
    _ListaCaracteresCriptografados1 : array of string;
    _ListaCaracteresCriptografados2 : array of string;
    _ListaCaracteresCriptografados3 : array of string;
    _ListaCaracteresCriptografados4 : array of string;
    _ListaCaracteresCriptografados5 : array of string;
    _ListaCaracteresCriptografados6 : array of string;
    _ListaCaracteresCriptografados7 : array of string;
    _ListaCaracteresCriptografados8 : array of string;
    _ListaCaracteresCriptografados9 : array of string;

    //
    // Métodos.
    //
    procedure GerarListaCaracteresOriginal;
    procedure GerarListaCaracteresCriptografados0;
    procedure GerarListaCaracteresCriptografados1;
    procedure GerarListaCaracteresCriptografados2;
    procedure GerarListaCaracteresCriptografados3;
    procedure GerarListaCaracteresCriptografados4;
    procedure GerarListaCaracteresCriptografados5;
    procedure GerarListaCaracteresCriptografados6;
    procedure GerarListaCaracteresCriptografados7;
    procedure GerarListaCaracteresCriptografados8;
    procedure GerarListaCaracteresCriptografados9;
    function  GerarNumeroAleatorio(PermiteZero : Boolean) : Integer;
    function  GerarNumeroAleatorio1Digito : Integer;
    function  GerarCaracterCriptografado(Lista : Integer; Caracter : string) : string;
    function  GerarCaracterOriginal(Lista : Integer; Caracter : string) : string;

  //
  // Dados públicos.
  //
  public
    //
    // Construtor/destructor.
    //
    constructor Create;
    destructor Destroy; override;

    //
    // Métodos.
    //
    procedure Limpar;
    function Criptografar(Mensagem : string) : string;
    function Descriptografar(Mensagem : string) : string;
  end;

implementation

{
+------------------------------------------------------------------------------+
| Create                                                                       |
+------------------------------------------------------------------------------+
| Construtor padrão da classe.                                                 |
+------------------------------------------------------------------------------+
}
constructor TCriptografia.Create;
begin
  //
  // Seta quantidade de caracteres.
  //
  _QuantidadeCaracteres := 148;

  //
  // Limpa atributos.
  //
  Limpar;
end;

{
+------------------------------------------------------------------------------+
| Destructor                                                                   |
+------------------------------------------------------------------------------+
| Construtor padrão da classe.                                                 |
+------------------------------------------------------------------------------+
}
destructor TCriptografia.Destroy;
begin
  Limpar;
  inherited;
end;

{
+------------------------------------------------------------------------------+
| Criptografar                                                                 |
+------------------------------------------------------------------------------+
| Método para criptografar uma mensagem.                                       |
+------------------------------------------------------------------------------+
}
function TCriptografia.Criptografar(Mensagem : string) : string;
var
  ListaCriptografia   : Integer;
  Conversao           : string;
  Contador            : Integer;
  QtdeFantasmasInicio : Byte;
  FantasmasInicio     : string;
  QtdeFantasmasFim    : Byte;
  FantasmasFim        : string;
begin
  ListaCriptografia := GerarNumeroAleatorio1Digito;

  Conversao := '';
  for Contador := 1 to Length(Mensagem) do
  begin
    Conversao := Conversao + GerarCaracterCriptografado(ListaCriptografia, Copy(Mensagem, Contador, 1));
  end;

  QtdeFantasmasInicio := GerarNumeroAleatorio(False);
  FantasmasInicio := '';
  for Contador := 1 to (QtdeFantasmasInicio) do
  begin
    FantasmasInicio := FantasmasInicio + _ListaCaracteresOriginal[Random(_QuantidadeCaracteres - 2)];
  end;

  QtdeFantasmasFim := GerarNumeroAleatorio(False);
  FantasmasFim := '';
  for Contador := 1 to (QtdeFantasmasFim) do
  begin
    FantasmasFim := FantasmasFim + _ListaCaracteresOriginal[Random(_QuantidadeCaracteres - 2)];
  end;

  Result := IntToStr(GerarNumeroAleatorio1Digito) +
            IntToStr(ListaCriptografia)           +
            IntToStr(QtdeFantasmasFim)            +
            IntToStr(QtdeFantasmasInicio)         +
            FantasmasInicio                       +
            Conversao                             +
            FantasmasFim;
end;

{
+------------------------------------------------------------------------------+
| Descriptografar                                                              |
+------------------------------------------------------------------------------+
| Método para descriptografar uma mensagem.                                    |
+------------------------------------------------------------------------------+
}
function TCriptografia.Descriptografar(Mensagem : string) : string;
var
  ListaCriptografia   : Integer;
  QtdeFantasmasInicio : Byte;
  QtdeFantasmasFim    : Byte;
  Significativo       : string;
  Contador            : Integer;
  Conversao           : string;
begin
  ListaCriptografia   := StrToIntDef(Copy(Mensagem, 2, 1), 0);
  QtdeFantasmasInicio := StrToIntDef(Copy(Mensagem, 4, 1), 0);
  QtdeFantasmasFim    := StrToIntDef(Copy(Mensagem, 3, 1), 0);

  Significativo := Copy(Mensagem, (QtdeFantasmasInicio + 5), Length(Mensagem) - (QtdeFantasmasInicio + QtdeFantasmasFim + 4));

  Conversao := '';
  for Contador := 1 to Length(Significativo) do
  begin
    Conversao := Conversao + GerarCaracterOriginal(ListaCriptografia, Copy(Significativo, Contador, 1));
  end;

  Result := Conversao;
end;

{
+------------------------------------------------------------------------------+
| GerarListaCaracteresOriginal                                                 |
+------------------------------------------------------------------------------+
| Método para gerar a lista original de caracteres.                            |
| Serve de base para a criptografia.                                           |
+------------------------------------------------------------------------------+
}
procedure TCriptografia.GerarListaCaracteresOriginal;
begin
  _ListaCaracteresOriginal[000] := 'a';
  _ListaCaracteresOriginal[001] := 'b';
  _ListaCaracteresOriginal[002] := 'c';
  _ListaCaracteresOriginal[003] := 'd';
  _ListaCaracteresOriginal[004] := 'e';
  _ListaCaracteresOriginal[005] := 'f';
  _ListaCaracteresOriginal[006] := 'g';
  _ListaCaracteresOriginal[007] := 'h';
  _ListaCaracteresOriginal[008] := 'i';
  _ListaCaracteresOriginal[009] := 'j';
  _ListaCaracteresOriginal[010] := 'k';
  _ListaCaracteresOriginal[011] := 'l';
  _ListaCaracteresOriginal[012] := 'm';
  _ListaCaracteresOriginal[013] := 'n';
  _ListaCaracteresOriginal[014] := 'o';
  _ListaCaracteresOriginal[015] := 'p';
  _ListaCaracteresOriginal[016] := 'q';
  _ListaCaracteresOriginal[017] := 'r';
  _ListaCaracteresOriginal[018] := 's';
  _ListaCaracteresOriginal[019] := 't';
  _ListaCaracteresOriginal[020] := 'u';
  _ListaCaracteresOriginal[021] := 'v';
  _ListaCaracteresOriginal[022] := 'x';
  _ListaCaracteresOriginal[023] := 'w';
  _ListaCaracteresOriginal[024] := 'y';
  _ListaCaracteresOriginal[025] := 'z';
  _ListaCaracteresOriginal[026] := 'ç';

  _ListaCaracteresOriginal[027] := 'á';
  _ListaCaracteresOriginal[028] := 'à';
  _ListaCaracteresOriginal[029] := 'ã';
  _ListaCaracteresOriginal[030] := 'â';
  _ListaCaracteresOriginal[031] := 'ä';

  _ListaCaracteresOriginal[032] := 'é';
  _ListaCaracteresOriginal[033] := 'è';
  _ListaCaracteresOriginal[034] := 'ê';
  _ListaCaracteresOriginal[035] := 'ë';

  _ListaCaracteresOriginal[036] := 'í';
  _ListaCaracteresOriginal[037] := 'ì';
  _ListaCaracteresOriginal[038] := 'î';
  _ListaCaracteresOriginal[039] := 'ï';

  _ListaCaracteresOriginal[040] := 'ó';
  _ListaCaracteresOriginal[041] := 'ò';
  _ListaCaracteresOriginal[042] := 'õ';
  _ListaCaracteresOriginal[043] := 'ô';
  _ListaCaracteresOriginal[044] := 'ö';

  _ListaCaracteresOriginal[045] := 'ú';
  _ListaCaracteresOriginal[046] := 'ù';
  _ListaCaracteresOriginal[047] := 'û';
  _ListaCaracteresOriginal[048] := 'ü';

  _ListaCaracteresOriginal[049] := 'A';
  _ListaCaracteresOriginal[050] := 'B';
  _ListaCaracteresOriginal[051] := 'C';
  _ListaCaracteresOriginal[052] := 'D';
  _ListaCaracteresOriginal[053] := 'E';
  _ListaCaracteresOriginal[054] := 'F';
  _ListaCaracteresOriginal[055] := 'G';
  _ListaCaracteresOriginal[056] := 'H';
  _ListaCaracteresOriginal[057] := 'I';
  _ListaCaracteresOriginal[058] := 'J';
  _ListaCaracteresOriginal[059] := 'K';
  _ListaCaracteresOriginal[060] := 'L';
  _ListaCaracteresOriginal[061] := 'M';
  _ListaCaracteresOriginal[062] := 'N';
  _ListaCaracteresOriginal[063] := 'O';
  _ListaCaracteresOriginal[064] := 'P';
  _ListaCaracteresOriginal[065] := 'Q';
  _ListaCaracteresOriginal[066] := 'R';
  _ListaCaracteresOriginal[067] := 'S';
  _ListaCaracteresOriginal[068] := 'T';
  _ListaCaracteresOriginal[069] := 'U';
  _ListaCaracteresOriginal[070] := 'V';
  _ListaCaracteresOriginal[071] := 'X';
  _ListaCaracteresOriginal[072] := 'W';
  _ListaCaracteresOriginal[073] := 'Y';
  _ListaCaracteresOriginal[074] := 'Z';
  _ListaCaracteresOriginal[075] := 'Ç';

  _ListaCaracteresOriginal[076] := 'Á';
  _ListaCaracteresOriginal[077] := 'À';
  _ListaCaracteresOriginal[078] := 'Ã';
  _ListaCaracteresOriginal[079] := 'Â';
  _ListaCaracteresOriginal[080] := 'Ä';

  _ListaCaracteresOriginal[081] := 'É';
  _ListaCaracteresOriginal[082] := 'È';
  _ListaCaracteresOriginal[083] := 'Ê';
  _ListaCaracteresOriginal[084] := 'Ë';

  _ListaCaracteresOriginal[085] := 'Í';
  _ListaCaracteresOriginal[086] := 'Ì';
  _ListaCaracteresOriginal[087] := 'Î';
  _ListaCaracteresOriginal[088] := 'Ï';

  _ListaCaracteresOriginal[089] := 'Ó';
  _ListaCaracteresOriginal[090] := 'Ò';
  _ListaCaracteresOriginal[091] := 'Õ';
  _ListaCaracteresOriginal[092] := 'Ô';
  _ListaCaracteresOriginal[093] := 'Ö';

  _ListaCaracteresOriginal[094] := 'Ú';
  _ListaCaracteresOriginal[095] := 'Ù';
  _ListaCaracteresOriginal[096] := 'Û';
  _ListaCaracteresOriginal[097] := 'Ü';

  _ListaCaracteresOriginal[098] := '0';
  _ListaCaracteresOriginal[099] := '1';
  _ListaCaracteresOriginal[100] := '2';
  _ListaCaracteresOriginal[101] := '3';
  _ListaCaracteresOriginal[102] := '4';
  _ListaCaracteresOriginal[103] := '5';
  _ListaCaracteresOriginal[104] := '6';
  _ListaCaracteresOriginal[105] := '7';
  _ListaCaracteresOriginal[106] := '8';
  _ListaCaracteresOriginal[107] := '9';

  _ListaCaracteresOriginal[108] := '!';
  _ListaCaracteresOriginal[109] := '@';
  _ListaCaracteresOriginal[110] := '#';
  _ListaCaracteresOriginal[111] := '$';
  _ListaCaracteresOriginal[112] := '%';
  _ListaCaracteresOriginal[113] := '&';
  _ListaCaracteresOriginal[114] := '*';
  _ListaCaracteresOriginal[115] := '(';
  _ListaCaracteresOriginal[116] := ')';
  _ListaCaracteresOriginal[117] := '-';
  _ListaCaracteresOriginal[118] := '_';
  _ListaCaracteresOriginal[119] := '+';
  _ListaCaracteresOriginal[120] := '=';
  _ListaCaracteresOriginal[121] := '"';
  _ListaCaracteresOriginal[122] := '''';
  _ListaCaracteresOriginal[123] := ':';
  _ListaCaracteresOriginal[124] := ';';
  _ListaCaracteresOriginal[125] := '.';
  _ListaCaracteresOriginal[126] := ',';
  _ListaCaracteresOriginal[127] := '<';
  _ListaCaracteresOriginal[128] := '>';
  _ListaCaracteresOriginal[129] := '?';
  _ListaCaracteresOriginal[130] := '/';
  _ListaCaracteresOriginal[131] := '\';
  _ListaCaracteresOriginal[132] := '|';
  _ListaCaracteresOriginal[133] := '{';
  _ListaCaracteresOriginal[134] := '}';
  _ListaCaracteresOriginal[135] := '[';
  _ListaCaracteresOriginal[136] := ']';
  _ListaCaracteresOriginal[137] := '¨';
  _ListaCaracteresOriginal[138] := '¹';
  _ListaCaracteresOriginal[139] := '²';
  _ListaCaracteresOriginal[140] := '³';
  _ListaCaracteresOriginal[141] := '£';
  _ListaCaracteresOriginal[142] := '¢';
  _ListaCaracteresOriginal[143] := '¬';
  _ListaCaracteresOriginal[144] := '§';
  _ListaCaracteresOriginal[145] := 'ª';
  _ListaCaracteresOriginal[146] := 'º';
  _ListaCaracteresOriginal[147] := '°';
end;

{
+------------------------------------------------------------------------------+
| GerarListaCaracteresCriptografados0                                          |
+------------------------------------------------------------------------------+
| Método para gerar a lista 0 de caracteres.                                   |
+------------------------------------------------------------------------------+
}
procedure TCriptografia.GerarListaCaracteresCriptografados0;
var
  Contador : Integer;
  Indice   : Integer;
begin
  Contador := (_QuantidadeCaracteres - 1);
  Indice   := 0;
  while Contador >= 0 do
  begin
    _ListaCaracteresCriptografados0[Indice] := _ListaCaracteresOriginal[Contador];
    Indice   := Indice + 1;
    Contador := Contador - 1;
  end;
end;

{
+------------------------------------------------------------------------------+
| GerarListaCaracteresCriptografados1                                          |
+------------------------------------------------------------------------------+
| Método para gerar a lista 1 de caracteres.                                   |
+------------------------------------------------------------------------------+
}
procedure TCriptografia.GerarListaCaracteresCriptografados1;
var
  Quebra   : Integer;
  Contador : Integer;
  Continua : Boolean;
  Indice   : Integer;
  Controle : Integer;
begin
  Quebra   := 2;
  Controle := -1;
  while True = True do
  begin
    Continua := False;
    for Indice := 0 to (_QuantidadeCaracteres - 1) do
    begin
      if _ListaCaracteresCriptografados1[Indice] = '' then
      begin
        Continua := True;
        Controle := Controle + 1;
        Break;
      end;
    end;
    if not Continua then Break;

    Contador := (_QuantidadeCaracteres - 1) - Controle;
    while Contador >= 0 do
    begin
      _ListaCaracteresCriptografados1[Indice] := _ListaCaracteresOriginal[Contador];
      Indice   := Indice + 1;
      Contador := Contador - Quebra;
    end;
  end;
end;

{
+------------------------------------------------------------------------------+
| GerarListaCaracteresCriptografados2                                          |
+------------------------------------------------------------------------------+
| Método para gerar a lista 2 de caracteres.                                   |
+------------------------------------------------------------------------------+
}
procedure TCriptografia.GerarListaCaracteresCriptografados2;
var
  Quebra   : Integer;
  Contador : Integer;
  Continua : Boolean;
  Indice   : Integer;
  Controle : Integer;
begin
  Quebra   := 3;
  Controle := -1;
  while True = True do
  begin
    Continua := False;
    for Indice := 0 to (_QuantidadeCaracteres - 1) do
    begin
      if _ListaCaracteresCriptografados2[Indice] = '' then
      begin
        Continua := True;
        Controle := Controle + 1;
        Break;
      end;
    end;
    if not Continua then Break;

    Contador := (_QuantidadeCaracteres - 1) - Controle;
    while Contador >= 0 do
    begin
      _ListaCaracteresCriptografados2[Indice] := _ListaCaracteresOriginal[Contador];
      Indice   := Indice + 1;
      Contador := Contador - Quebra;
    end;
  end;
end;

{
+------------------------------------------------------------------------------+
| GerarListaCaracteresCriptografados3                                          |
+------------------------------------------------------------------------------+
| Método para gerar a lista 3 de caracteres.                                   |
+------------------------------------------------------------------------------+
}
procedure TCriptografia.GerarListaCaracteresCriptografados3;
var
  Quebra   : Integer;
  Contador : Integer;
  Continua : Boolean;
  Indice   : Integer;
  Controle : Integer;
begin
  Quebra   := 4;
  Controle := -1;
  while True = True do
  begin
    Continua := False;
    for Indice := 0 to (_QuantidadeCaracteres - 1) do
    begin
      if _ListaCaracteresCriptografados3[Indice] = '' then
      begin
        Continua := True;
        Controle := Controle + 1;
        Break;
      end;
    end;
    if not Continua then Break;

    Contador := (_QuantidadeCaracteres - 1) - Controle;
    while Contador >= 0 do
    begin
      _ListaCaracteresCriptografados3[Indice] := _ListaCaracteresOriginal[Contador];
      Indice   := Indice + 1;
      Contador := Contador - Quebra;
    end;
  end;
end;

{
+------------------------------------------------------------------------------+
| GerarListaCaracteresCriptografados4                                          |
+------------------------------------------------------------------------------+
| Método para gerar a lista 4 de caracteres.                                   |
+------------------------------------------------------------------------------+
}
procedure TCriptografia.GerarListaCaracteresCriptografados4;
var
  Quebra   : Integer;
  Contador : Integer;
  Continua : Boolean;
  Indice   : Integer;
  Controle : Integer;
begin
  Quebra   := 5;
  Controle := -1;
  while True = True do
  begin
    Continua := False;
    for Indice := 0 to (_QuantidadeCaracteres - 1) do
    begin
      if _ListaCaracteresCriptografados4[Indice] = '' then
      begin
        Continua := True;
        Controle := Controle + 1;
        Break;
      end;
    end;
    if not Continua then Break;

    Contador := (_QuantidadeCaracteres - 1) - Controle;
    while Contador >= 0 do
    begin
      _ListaCaracteresCriptografados4[Indice] := _ListaCaracteresOriginal[Contador];
      Indice   := Indice + 1;
      Contador := Contador - Quebra;
    end;
  end;
end;

{
+------------------------------------------------------------------------------+
| GerarListaCaracteresCriptografados5                                          |
+------------------------------------------------------------------------------+
| Método para gerar a lista 5 de caracteres.                                   |
+------------------------------------------------------------------------------+
}
procedure TCriptografia.GerarListaCaracteresCriptografados5;
var
  Quebra   : Integer;
  Contador : Integer;
  Continua : Boolean;
  Indice   : Integer;
  Controle : Integer;
begin
  Quebra   := 6;
  Controle := -1;
  while True = True do
  begin
    Continua := False;
    for Indice := 0 to (_QuantidadeCaracteres - 1) do
    begin
      if _ListaCaracteresCriptografados5[Indice] = '' then
      begin
        Continua := True;
        Controle := Controle + 1;
        Break;
      end;
    end;
    if not Continua then Break;

    Contador := (_QuantidadeCaracteres - 1) - Controle;
    while Contador >= 0 do
    begin
      _ListaCaracteresCriptografados5[Indice] := _ListaCaracteresOriginal[Contador];
      Indice   := Indice + 1;
      Contador := Contador - Quebra;
    end;
  end;
end;

{
+------------------------------------------------------------------------------+
| GerarListaCaracteresCriptografados6                                          |
+------------------------------------------------------------------------------+
| Método para gerar a lista 6 de caracteres.                                   |
+------------------------------------------------------------------------------+
}
procedure TCriptografia.GerarListaCaracteresCriptografados6;
var
  Quebra   : Integer;
  Contador : Integer;
  Continua : Boolean;
  Indice   : Integer;
  Controle : Integer;
begin
  Quebra   := 7;
  Controle := -1;
  while True = True do
  begin
    Continua := False;
    for Indice := 0 to (_QuantidadeCaracteres - 1) do
    begin
      if _ListaCaracteresCriptografados6[Indice] = '' then
      begin
        Continua := True;
        Controle := Controle + 1;
        Break;
      end;
    end;
    if not Continua then Break;

    Contador := (_QuantidadeCaracteres - 1) - Controle;
    while Contador >= 0 do
    begin
      _ListaCaracteresCriptografados6[Indice] := _ListaCaracteresOriginal[Contador];
      Indice   := Indice + 1;
      Contador := Contador - Quebra;
    end;
  end;
end;

{
+------------------------------------------------------------------------------+
| GerarListaCaracteresCriptografados7                                          |
+------------------------------------------------------------------------------+
| Método para gerar a lista 7 de caracteres.                                   |
+------------------------------------------------------------------------------+
}
procedure TCriptografia.GerarListaCaracteresCriptografados7;
var
  Quebra   : Integer;
  Contador : Integer;
  Continua : Boolean;
  Indice   : Integer;
  Controle : Integer;
begin
  Quebra   := 8;
  Controle := -1;
  while True = True do
  begin
    Continua := False;
    for Indice := 0 to (_QuantidadeCaracteres - 1) do
    begin
      if _ListaCaracteresCriptografados7[Indice] = '' then
      begin
        Continua := True;
        Controle := Controle + 1;
        Break;
      end;
    end;
    if not Continua then Break;

    Contador := (_QuantidadeCaracteres - 1) - Controle;
    while Contador >= 0 do
    begin
      _ListaCaracteresCriptografados7[Indice] := _ListaCaracteresOriginal[Contador];
      Indice   := Indice + 1;
      Contador := Contador - Quebra;
    end;
  end;
end;

{
+------------------------------------------------------------------------------+
| GerarListaCaracteresCriptografados8                                          |
+------------------------------------------------------------------------------+
| Método para gerar a lista 8 de caracteres.                                   |
+------------------------------------------------------------------------------+
}
procedure TCriptografia.GerarListaCaracteresCriptografados8;
var
  Quebra   : Integer;
  Contador : Integer;
  Continua : Boolean;
  Indice   : Integer;
  Controle : Integer;
begin
  Quebra   := 9;
  Controle := -1;
  while True = True do
  begin
    Continua := False;
    for Indice := 0 to (_QuantidadeCaracteres - 1) do
    begin
      if _ListaCaracteresCriptografados8[Indice] = '' then
      begin
        Continua := True;
        Controle := Controle + 1;
        Break;
      end;
    end;
    if not Continua then Break;

    Contador := (_QuantidadeCaracteres - 1) - Controle;
    while Contador >= 0 do
    begin
      _ListaCaracteresCriptografados8[Indice] := _ListaCaracteresOriginal[Contador];
      Indice   := Indice + 1;
      Contador := Contador - Quebra;
    end;
  end;
end;

{
+------------------------------------------------------------------------------+
| GerarListaCaracteresCriptografados9                                          |
+------------------------------------------------------------------------------+
| Método para gerar a lista 9 de caracteres.                                   |
+------------------------------------------------------------------------------+
}
procedure TCriptografia.GerarListaCaracteresCriptografados9;
var
  Quebra   : Integer;
  Contador : Integer;
  Continua : Boolean;
  Indice   : Integer;
  Controle : Integer;
begin
  Quebra   := 10;
  Controle := -1;
  while True = True do
  begin
    Continua := False;
    for Indice := 0 to (_QuantidadeCaracteres - 1) do
    begin
      if _ListaCaracteresCriptografados9[Indice] = '' then
      begin
        Continua := True;
        Controle := Controle + 1;
        Break;
      end;
    end;
    if not Continua then Break;

    Contador := (_QuantidadeCaracteres - 1) - Controle;
    while Contador >= 0 do
    begin
      _ListaCaracteresCriptografados9[Indice] := _ListaCaracteresOriginal[Contador];
      Indice   := Indice + 1;
      Contador := Contador - Quebra;
    end;
  end;
end;

{
+------------------------------------------------------------------------------+
| Limpar                                                                       |
+------------------------------------------------------------------------------+
| Método para os atributos da classe.                                          |
+------------------------------------------------------------------------------+
}
procedure TCriptografia.Limpar;
var
  Contador : Integer;
begin
  //
  // Limpa arrays de listas de caracteres.
  //
  _ListaCaracteresOriginal        := nil;
  _ListaCaracteresCriptografados0 := nil;
  _ListaCaracteresCriptografados1 := nil;
  _ListaCaracteresCriptografados2 := nil;
  _ListaCaracteresCriptografados3 := nil;
  _ListaCaracteresCriptografados4 := nil;
  _ListaCaracteresCriptografados5 := nil;
  _ListaCaracteresCriptografados6 := nil;
  _ListaCaracteresCriptografados7 := nil;
  _ListaCaracteresCriptografados8 := nil;
  _ListaCaracteresCriptografados9 := nil;

  //
  // Seta tamanho padrão para a lista de caracteres.
  //
  SetLength(_ListaCaracteresOriginal,        _QuantidadeCaracteres);
  SetLength(_ListaCaracteresCriptografados0, _QuantidadeCaracteres);
  SetLength(_ListaCaracteresCriptografados1, _QuantidadeCaracteres);
  SetLength(_ListaCaracteresCriptografados2, _QuantidadeCaracteres);
  SetLength(_ListaCaracteresCriptografados3, _QuantidadeCaracteres);
  SetLength(_ListaCaracteresCriptografados4, _QuantidadeCaracteres);
  SetLength(_ListaCaracteresCriptografados5, _QuantidadeCaracteres);
  SetLength(_ListaCaracteresCriptografados6, _QuantidadeCaracteres);
  SetLength(_ListaCaracteresCriptografados7, _QuantidadeCaracteres);
  SetLength(_ListaCaracteresCriptografados8, _QuantidadeCaracteres);
  SetLength(_ListaCaracteresCriptografados9, _QuantidadeCaracteres);

  //
  // Limpa cada uma das posições do array.
  //
  for Contador := 0 to (_QuantidadeCaracteres - 1) do
  begin
    _ListaCaracteresOriginal[Contador]        := '';
    _ListaCaracteresCriptografados0[Contador] := '';
    _ListaCaracteresCriptografados1[Contador] := '';
    _ListaCaracteresCriptografados2[Contador] := '';
    _ListaCaracteresCriptografados3[Contador] := '';
    _ListaCaracteresCriptografados4[Contador] := '';
    _ListaCaracteresCriptografados5[Contador] := '';
    _ListaCaracteresCriptografados6[Contador] := '';
    _ListaCaracteresCriptografados7[Contador] := '';
    _ListaCaracteresCriptografados8[Contador] := '';
    _ListaCaracteresCriptografados9[Contador] := '';
  end;

  //
  // Carrega listas.
  //
  GerarListaCaracteresOriginal;
  GerarListaCaracteresCriptografados0;
  GerarListaCaracteresCriptografados1;
  GerarListaCaracteresCriptografados2;
  GerarListaCaracteresCriptografados3;
  GerarListaCaracteresCriptografados4;
  GerarListaCaracteresCriptografados5;
  GerarListaCaracteresCriptografados6;
  GerarListaCaracteresCriptografados7;
  GerarListaCaracteresCriptografados8;
  GerarListaCaracteresCriptografados9;
end;

{
+------------------------------------------------------------------------------+
| GerarNumeroAletorio                                                          |
+------------------------------------------------------------------------------+
| Método para gerar um número aleatório.                                       |
+------------------------------------------------------------------------------+
}
function TCriptografia.GerarNumeroAleatorio(PermiteZero : Boolean) : Integer;
begin
  while True = True do
  begin
    Result := Random(8);

    if (Result = 0) and (not PermiteZero) then
      Continue
    else
      Break;
  end;
end;

{
+------------------------------------------------------------------------------+
| GerarNumeroAletorio1Digito                                                   |
+------------------------------------------------------------------------------+
| Método para gerar um número aleatório entre 0 e 9.                           |
+------------------------------------------------------------------------------+
}
function TCriptografia.GerarNumeroAleatorio1Digito : Integer;
var
  Temporario : string;
  Semente    : Integer;
begin
  Temporario := IntToStr(MilliSecondOf(Now));
  Semente    := StrToInt(Copy(Temporario, Length(Temporario), 1));

  Temporario := IntToStr(Semente * Random(9999));

  Result     := StrToInt(Copy(Temporario, Length(Temporario), 1));
end;

{
+------------------------------------------------------------------------------+
| GerarCaracterCriptografado                                                   |
+------------------------------------------------------------------------------+
| Método para obter um caracter criptografado.                                 |
+------------------------------------------------------------------------------+
}
function TCriptografia.GerarCaracterCriptografado(Lista : Integer; Caracter : string) : string;
var
  Contador  : Integer;
  Encontrou : Boolean;
begin
  Result    := '';
  Encontrou := False;
  for Contador := 0 to (_QuantidadeCaracteres - 1) do
  begin
    if (_ListaCaracteresOriginal[Contador] = Caracter) then
    begin
      if Lista = 0 then Result := _ListaCaracteresCriptografados0[Contador];
      if Lista = 1 then Result := _ListaCaracteresCriptografados1[Contador];
      if Lista = 2 then Result := _ListaCaracteresCriptografados2[Contador];
      if Lista = 3 then Result := _ListaCaracteresCriptografados3[Contador];
      if Lista = 4 then Result := _ListaCaracteresCriptografados4[Contador];
      if Lista = 5 then Result := _ListaCaracteresCriptografados5[Contador];
      if Lista = 6 then Result := _ListaCaracteresCriptografados6[Contador];
      if Lista = 7 then Result := _ListaCaracteresCriptografados7[Contador];
      if Lista = 8 then Result := _ListaCaracteresCriptografados8[Contador];
      if Lista = 9 then Result := _ListaCaracteresCriptografados9[Contador];

      if Result <> '' then Encontrou := True;

      Break;
    end;
  end;
  if (not Encontrou) then Result := Caracter;
end;

{
+------------------------------------------------------------------------------+
| GerarCaracterOriginal                                                        |
+------------------------------------------------------------------------------+
| Método para obter um caracter descriptografado.                              |
+------------------------------------------------------------------------------+
}
function TCriptografia.GerarCaracterOriginal(Lista : Integer; Caracter : string) : string;
var
  Contador  : Integer;
  Encontrou : Boolean;
  Posicao   : string;
begin
  Encontrou := False;
  for Contador := 0 to (_QuantidadeCaracteres - 1) do
  begin
    Posicao := '';
    if Lista = 0 then Posicao := _ListaCaracteresCriptografados0[Contador];
    if Lista = 1 then Posicao := _ListaCaracteresCriptografados1[Contador];
    if Lista = 2 then Posicao := _ListaCaracteresCriptografados2[Contador];
    if Lista = 3 then Posicao := _ListaCaracteresCriptografados3[Contador];
    if Lista = 4 then Posicao := _ListaCaracteresCriptografados4[Contador];
    if Lista = 5 then Posicao := _ListaCaracteresCriptografados5[Contador];
    if Lista = 6 then Posicao := _ListaCaracteresCriptografados6[Contador];
    if Lista = 7 then Posicao := _ListaCaracteresCriptografados7[Contador];
    if Lista = 8 then Posicao := _ListaCaracteresCriptografados8[Contador];
    if Lista = 9 then Posicao := _ListaCaracteresCriptografados9[Contador];

    if (Posicao = Caracter) then
    begin
      Result := _ListaCaracteresOriginal[Contador];
      Encontrou := True;
    end;
  end;
  if (not Encontrou) then Result := Caracter;
end;

end.
