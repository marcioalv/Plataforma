//
// Arquivo..: Plataforma_Framework_VCL.pas
// Projeto..: Framework
// Fonte....: Unit
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Funções e procedimentos diversos e úteis para tratar componentes VCL.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_Framework_VCL;

interface

uses
  Plataforma_Framework_Util,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Buttons,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Mask;

const
  VCL_DIGITACAO_LIVRE           : Byte = 0;
  VCL_DIGITACAO_ALFANUMERICA    : Byte = 1;
  VCL_DIGITACAO_NUMERICA_INTEIRA: Byte = 2;
  VCL_DIGITACAO_NUMERICA_DECIMAL: Byte = 3;
  VCL_DIGITACAO_DINHEIRO        : Byte = 4;
  VCL_DIGITACAO_DATA            : Byte = 5;
  VCL_DIGITACAO_HORARIO         : Byte = 6;
  VCL_DIGITACAO_CHAVE           : Byte = 7;
  VCL_DIGITACAO_CODIGO          : Byte = 8;

  VCL_MOVIMENTO_SUBIR_TODOS     : Byte = 0;
  VCL_MOVIMENTO_SUBIR           : Byte = 1;
  VCL_MOVIMENTO_DESCER          : Byte = 2;
  VCL_MOVIMENTO_DESCER_TODOS    : Byte = 3;

  VCL_NENHUM_INDICE             : Integer = -1;

//
// Controles do formulário.
// 
procedure VCLCursorTrocar(argEspera: Boolean = False);

procedure VCLSDIMaximizar(argFormulario: TForm);

procedure VCLSDIMinimizar;

//
// Mensagens.
//
procedure VCLInformacaoExibir(argMensagem: string);

procedure VCLConsistenciaExibir(argMensagem1: string;
                                argMensagem2: string = '';
                                argMensagem3: string = '';
                                argMensagem4: string = '';
                                argMensagem5: string = '');

procedure VCLErroExibir(argMensagem1: string;
                        argMensagem2: string = '';
                        argMensagem3: string = '';
                        argMensagem4: string = '';
                        argMensagem5: string = '');

function VCLQuestionamentoExibir(argMensagem1: string;
                                 argMensagem2: string = '';
                                 argNaoDefault: Boolean = True): Boolean;

//
// Digitação.
//
procedure EnterHabilitar(argFormulario: TForm; var argTecla: Char);

procedure VCLDigitacaoHabilitar(argFormulario: TForm; var argTecla: Char; argTipo: Byte);

//
// Limpar componentes.
//
procedure VCLListViewLimpar(argComponente: TListView);
procedure VCLMaskEditLimpar(argComponente: TMaskEdit);
procedure VCLEditLimpar(argComponente: TEdit);
procedure VCLRadioButtonLimpar(argComponente: TRadioButton);
procedure VCLCheckBoxLimpar(argComponente: TCheckBox);
procedure VCLMemoLimpar(argComponente: TMemo);
procedure VCLProgressBarLimpar(argComponente: TProgressBar);

//
// Entrada/Saída componentes.
//
function VCLEditEntrar(argComponente: TEdit): Boolean;
function VCLEditSair(argComponente: TEdit): Boolean;

function VCLMaskEditEntrar(argComponente: TMaskEdit): Boolean;
function VCLMaskEditSair(argComponente: TMaskEdit): Boolean;

function VCLMemoEntrar(argComponente: TMemo): Boolean;
function VCLMemoSair(argComponente: TMemo): Boolean;

function VCLCheckBoxEntrar(argComponente: TCheckBox): Boolean;
function VCLCheckBoxSair(argComponente: TCheckBox): Boolean;

//
// Validações.
//
function VCLMaskEditDataValidar(argComponente: TMaskEdit; argVazio: Boolean = True) : Boolean;

function VCLMaskEditHorarioValidar(argComponente: TMaskEdit; argVazio: Boolean = True) : Boolean;

function VCLEditTextoValidar(argComponente: TEdit; argVazio: Boolean = True) : Boolean;

//
// Específicos para progressbar.
//
procedure VCLProgressBarInicializar(argComponente: TProgressBar; argTamanho: Integer);
procedure VCLProgressBarIncrementar(argComponente: TProgressBar);

//
// Específicos para listview.
//
procedure VCLListViewItemPosicionar(argComponente: TListView; argIndice: Integer);

procedure VCLListViewConteudoPosicionar(argComponente: TListView; argColuna: Integer; argConteudo: string);

procedure VCLListViewFocar(argComponente: TListView);

procedure VCLListViewZebrar(argComponente: TCustomListView; argListItem  : TListItem);

procedure VCLListViewComparar(argComponente: TObject; argListItem1: TListItem; argListItem2: TListItem; var argCompare: Integer; var argIndiceColuna: Integer; var argOrdemAscendente: Boolean);

procedure VCLListViewColunaClicar(argComponente: TObject; argListColumn: TListColumn; var argIndiceColuna: Integer; var argOrdemAscendente: Boolean);

procedure VCLListViewControlar(argComponente: TListView; argHabilitar : Boolean);

procedure VCLListViewSequencializar(argComponente: TListView; argIndiceColuna: Integer);
                              
procedure VCLListViewLinhaMover(argListView: TListView; argMovimento: Byte; argIndiceColunaSequencial: Integer = -1);

procedure VCLListViewItemRemover(argComponente: TListView; argIndiceItemRemover: Integer; argIndiceColunaSequencial: Integer);

function VCLListViewIndiceItemRetornar(argComponente: TListView): Integer;

{*************************************************************************************************}
implementation
{*************************************************************************************************}

//
// VCLCursorTrocar.
//
procedure VCLCursorTrocar(argEspera: Boolean = False);
begin
  if not argEspera then
  begin
    Screen.Cursor := crDefault;
  end
  else
  begin
    Screen.Cursor := crHourGlass;
  end;
end;

//
// VCLSDIFormularioMaximizar.
//
procedure VCLSDIMaximizar(argFormulario: TForm);
const
  locCOMPENSACAO: Integer = 10;
begin
  argFormulario.BorderStyle := bsSingle;
  argFormulario.Top         := Screen.WorkAreaTop    + locCOMPENSACAO;
  argFormulario.Left        := Screen.WorkAreaLeft   + locCOMPENSACAO;
  argFormulario.Height      := Screen.WorkAreaHeight - (locCOMPENSACAO * 2);
  argFormulario.Width       := Screen.WorkAreaWidth  - (locCOMPENSACAO * 2);
  argFormulario.BorderIcons := [biSystemMenu];
end;

//
// VCLSDIMinimizar.
//
procedure VCLSDIMinimizar;
begin
  Application.Minimize;
end;

//
// VCLInformacaoExibir.
//
procedure VCLInformacaoExibir(argMensagem: string);
begin
  VCLCursorTrocar;
  Application.MessageBox(PChar(argMensagem), 'Informação', MB_OK + MB_ICONINFORMATION);
end;

//
// VCLConsistenciaExibir.
//
procedure VCLConsistenciaExibir(argMensagem1: string;
                                argMensagem2: string = '';
                                argMensagem3: string = '';
                                argMensagem4: string = '';
                                argMensagem5: string = '');
var
  locMensagem: string;
begin
  locMensagem := argMensagem1;

  if argMensagem2 <> '' then
  begin
    if locMensagem <> '' then locMensagem := locMensagem + #13 + #13;
    locMensagem := locMensagem + argMensagem2;
  end;

  if argMensagem3 <> '' then
  begin
    if locMensagem <> '' then locMensagem := locMensagem + #13 + #13;
    locMensagem := locMensagem + argMensagem3;
  end;

  if argMensagem4 <> '' then
  begin
    if locMensagem <> '' then locMensagem := locMensagem + #13 + #13;
    locMensagem := locMensagem + argMensagem4;
  end;
  
  if argMensagem5 <> '' then
  begin
    if locMensagem <> '' then locMensagem := locMensagem + #13 + #13;
    locMensagem := locMensagem + argMensagem5;
  end;

  locMensagem := StringConcatenadorEnter(locMensagem);

  VCLCursorTrocar;
  Application.MessageBox(PChar(locMensagem), 'Consistência', MB_OK + MB_ICONWARNING);
end;

//
// VCLErroExibir.
//
procedure VCLErroExibir(argMensagem1: string;
                        argMensagem2: string = '';
                        argMensagem3: string = '';
                        argMensagem4: string = '';
                        argMensagem5: string = '');
var
  locMensagem: string;
begin
  locMensagem := argMensagem1;

  if argMensagem2 <> '' then
  begin
    if locMensagem <> '' then locMensagem := locMensagem + #13 + #13;
    locMensagem := locMensagem + argMensagem2;
  end;

  if argMensagem3 <> '' then
  begin
    if locMensagem <> '' then locMensagem := locMensagem + #13 + #13;
    locMensagem := locMensagem + argMensagem3;
  end;

  if argMensagem4 <> '' then
  begin
    if locMensagem <> '' then locMensagem := locMensagem + #13 + #13;
    locMensagem := locMensagem + argMensagem4;
  end;
  
  if argMensagem5 <> '' then
  begin
    if locMensagem <> '' then locMensagem := locMensagem + #13 + #13;
    locMensagem := locMensagem + argMensagem5;
  end;

  locMensagem := StringConcatenadorEnter(locMensagem);

  VCLCursorTrocar;
  Application.MessageBox(PChar(locMensagem), 'Erro', MB_OK + MB_ICONERROR);
end;

//
// VCLQuestionamentoExibir.
//
function VCLQuestionamentoExibir(argMensagem1: string; argMensagem2: string = ''; argNaoDefault: Boolean = True): Boolean;
var
  locMensagem: string;
  locBotao   : LongInt;
begin
  //
  // Mensagem.
  //
  locMensagem := argMensagem1;

  if argMensagem2 <> '' then
  begin
    locMensagem := locMensagem + #13 + #13 + argMensagem2;
  end;

  //
  // Determina o botão padrão.
  //
  if not argNaoDefault then
  begin
    locBotao := MB_DEFBUTTON1
  end
  else
  begin
    locBotao := MB_DEFBUTTON2;
  end;

  //
  // Exibe mensagem de questionamento.
  //
  VCLCursorTrocar;
  if (Application.MessageBox(Pchar(locMensagem),
                             PChar('Questionamento'),
                             MB_YESNO + MB_ICONQUESTION + locBotao) = IDNO) then
  begin
    Result := False;
  end
  else
  begin
    Result := True;
  end;
end;

//
// VCLListViewLimpar.
//
procedure VCLListViewLimpar(argComponente: TListView);
begin
  argComponente.Items.BeginUpdate;
  argComponente.Items.Clear;
  argComponente.Items.EndUpdate;
end;

//
// VCLMaskEditLimpar.
//
procedure VCLMaskEditLimpar(argComponente: TMaskEdit);
begin
  argComponente.Text := '';
end;

//
// VCLEditLimpar.
//
procedure VCLEditLimpar(argComponente: TEdit);
begin
  argComponente.Text := '';
end;

//
// VCLRadioButtonLimpar.
//
procedure VCLRadioButtonLimpar(argComponente: TRadioButton);
begin
  argComponente.Checked := False;
end;

//
// VCLCheckBoxLimpar.
//
procedure VCLCheckBoxLimpar(argComponente: TCheckBox);
begin
  argComponente.Checked := False;
end;

//
// VCLMemoLimpar.
//
procedure VCLMemoLimpar(argComponente: TMemo);
begin
  argComponente.Lines.Clear;
end;

//
// VCLProgressBarLimpar.
//
procedure VCLProgressBarLimpar(argComponente: TProgressBar);
begin
  argComponente.Min      := 0;
  argComponente.Max      := 0;
  argComponente.Position := 0;
  argComponente.Visible  := False;
end;

//
// EnterHabilitar.
//
procedure EnterHabilitar(argFormulario: TForm; var argTecla: Char);
begin
  if argTecla = ENTER then
  begin
    argFormulario.Perform(WM_NEXTDLGCTL, 0, 0);
    argTecla := #0;
  end;
end;

//
// VCLDigitacaoHabilitar.
//
procedure VCLDigitacaoHabilitar(argFormulario: TForm;
                                var argTecla : Char;
                                argTipo      : Byte);
begin
  //
  // Saldo de campo com a tecla enter.
  //
  if argTecla = ENTER then
  begin
    EnterHabilitar(argFormulario, argTecla);
    Exit;
  end;

  //
  // Digitação livre.
  //
  if argTipo = VCL_DIGITACAO_LIVRE then Exit;

  //
  // Teclas de controle permitidas em qualquer situação.
  //
  if (argTecla = BACKSPACE) or
     (argTecla = ESC)       or
     (argTecla = CTRL)      or
     (argTecla = CTRL_X)    or
     (argTecla = CTRL_C)    or
     (argTecla = CTRL_V) then Exit;

  //
  // Teclas permitidas para a digitação alfanumérica, numérica inteira, numérica decimal, dinheiro e código.
  //
  if (argTipo = VCL_DIGITACAO_ALFANUMERICA)     or
     (argTipo = VCL_DIGITACAO_NUMERICA_INTEIRA) or
     (argTipo = VCL_DIGITACAO_NUMERICA_DECIMAL) or
     (argTipo = VCL_DIGITACAO_DINHEIRO)         or
     (argTipo = VCL_DIGITACAO_CODIGO) then
  begin
    if (argTecla = '-') then Exit;
  end;

  //
  // Teclas permitidas para a digitação alfanumérica, data e código.
  //
  if (argTipo = VCL_DIGITACAO_ALFANUMERICA) or
     (argTipo = VCL_DIGITACAO_DATA)         or
     (argTipo = VCL_DIGITACAO_CODIGO) then
  begin
    if (argTecla = '/') then Exit;
  end;

  //
  // Teclas permitidas para a digitação alfanumérica, horário e código.
  //
  if (argTipo = VCL_DIGITACAO_ALFANUMERICA) or
     (argTipo = VCL_DIGITACAO_HORARIO)      or
     (argTipo = VCL_DIGITACAO_CODIGO) then
  begin
    if (argTecla = ':') then Exit;
  end;

  //
  // Teclas permitidas para a digitação alfanumérica, numérica inteira, numérica decimal, dinheiro, data, hota, código e chave.
  //
  if (argTipo = VCL_DIGITACAO_ALFANUMERICA)     or
     (argTipo = VCL_DIGITACAO_NUMERICA_INTEIRA) or
     (argTipo = VCL_DIGITACAO_NUMERICA_DECIMAL) or
     (argTipo = VCL_DIGITACAO_DINHEIRO)         or
     (argTipo = VCL_DIGITACAO_DATA)             or
     (argTipo = VCL_DIGITACAO_HORARIO)          or
     (argTipo = VCL_DIGITACAO_CODIGO)           or
     (argTipo = VCL_DIGITACAO_CHAVE) then
  begin
    if (argTecla = '0') or
       (argTecla = '1') or
       (argTecla = '2') or
       (argTecla = '3') or
       (argTecla = '4') or
       (argTecla = '5') or
       (argTecla = '6') or
       (argTecla = '7') or
       (argTecla = '8') or
       (argTecla = '9') then Exit;
  end;

  //
  // Teclas permitidas para a digitação alfanumérica, código e chave.
  //
  if (argTipo = VCL_DIGITACAO_ALFANUMERICA) or
     (argTipo = VCL_DIGITACAO_CODIGO) or
     (argTipo = VCL_DIGITACAO_CHAVE) then
  begin
    if (argTecla = 'A') or
       (argTecla = 'B') or
       (argTecla = 'C') or
       (argTecla = 'D') or
       (argTecla = 'E') or
       (argTecla = 'F') or
       (argTecla = 'G') or
       (argTecla = 'H') or
       (argTecla = 'I') or
       (argTecla = 'J') or
       (argTecla = 'K') or
       (argTecla = 'L') or
       (argTecla = 'M') or
       (argTecla = 'N') or
       (argTecla = 'O') or
       (argTecla = 'P') or
       (argTecla = 'Q') or
       (argTecla = 'R') or
       (argTecla = 'S') or
       (argTecla = 'T') or
       (argTecla = 'U') or
       (argTecla = 'V') or
       (argTecla = 'W') or
       (argTecla = 'X') or
       (argTecla = 'Y') or
       (argTecla = 'Z') then Exit;
  end;

  //
  // Teclas permitidas somente para a digiação alfanumérica.
  //
  if argTipo = VCL_DIGITACAO_ALFANUMERICA then
  begin
    if (argTecla = ' ') or
       (argTecla = '_') or
       (argTecla = '.') or
       (argTecla = ',') or
       (argTecla = ';') or
       (argTecla = '|') then Exit;

    if (argTecla = '+') or
       (argTecla = '*') or
       (argTecla = '=') then Exit;

    if (argTecla = '!') or
       (argTecla = '?') or
       (argTecla = '@') or
       (argTecla = '#') or
       (argTecla = '$') or
       (argTecla = '&') then Exit;

    if (argTecla = '[') or (argTecla = ']') or
       (argTecla = '{') or (argTecla = '}') or
       (argTecla = '<') or (argTecla = '>') or
       (argTecla = '(') or (argTecla = ')') or
       (argTecla = '\') or (argTecla = '/') then Exit;

    if (argTecla = 'a') or
       (argTecla = 'b') or
       (argTecla = 'c') or
       (argTecla = 'd') or
       (argTecla = 'e') or
       (argTecla = 'f') or
       (argTecla = 'g') or
       (argTecla = 'h') or
       (argTecla = 'i') or
       (argTecla = 'j') or
       (argTecla = 'k') or
       (argTecla = 'l') or
       (argTecla = 'm') or
       (argTecla = 'n') or
       (argTecla = 'o') or
       (argTecla = 'p') or
       (argTecla = 'q') or
       (argTecla = 'r') or
       (argTecla = 's') or
       (argTecla = 't') or
       (argTecla = 'u') or
       (argTecla = 'v') or
       (argTecla = 'w') or
       (argTecla = 'x') or
       (argTecla = 'y') or
       (argTecla = 'z') then Exit;

    if (argTecla = 'à') or (argTecla = 'á') or (argTecla = 'ã') or (argTecla = 'â') or (argTecla = 'ä') then Exit;
    if (argTecla = 'À') or (argTecla = 'Á') or (argTecla = 'Ã') or (argTecla = 'Â') or (argTecla = 'Ä') then Exit;

    if (argTecla = 'ç') then Exit;
    if (argTecla = 'Ç') then Exit;

    if (argTecla = 'è') or (argTecla = 'é') or (argTecla = 'ê') or (argTecla = 'ë') then Exit;
    if (argTecla = 'È') or (argTecla = 'É') or (argTecla = 'Ê') or (argTecla = 'Ë') then Exit;

    if (argTecla = 'ì') or (argTecla = 'í') or (argTecla = 'î') or (argTecla = 'ï') then Exit;
    if (argTecla = 'Ì') or (argTecla = 'Í') or (argTecla = 'Î') or (argTecla = 'Ï') then Exit;

    if (argTecla = 'ò') or (argTecla = 'ó') or (argTecla = 'õ') or (argTecla = 'ô') or (argTecla = 'ö') then Exit;
    if (argTecla = 'Ò') or (argTecla = 'Ó') or (argTecla = 'Õ') or (argTecla = 'Ô') or (argTecla = 'Ö') then Exit;

    if (argTecla = 'ù') or (argTecla = 'ú') or (argTecla = 'û') or (argTecla = 'ü') then Exit;
    if (argTecla = 'Ù') or (argTecla = 'Ú') or (argTecla = 'Û') or (argTecla = 'Ü') then Exit;
  end;

  //
  // Nenhuma das teclas permitidas.
  //
  argTecla := #0;
end;

//
// VCLEditEntrar.
//
function VCLEditEntrar(argComponente: TEdit): Boolean;
begin
  Result := False;
  if argComponente.Color = clBtnFace then Exit;
  argComponente.Color := RGB(230, 242, 255);
  if argComponente.ReadOnly then Exit;
  Result := True;
end;

//
// VCLEditSair.
//
function VCLEditSair(argComponente: TEdit): Boolean;
begin
  Result := False;
  if argComponente.Color = clBtnFace then Exit;
  argComponente.Color := clWindow;
  if argComponente.ReadOnly then Exit;
  argComponente.Text := StringTrim(argComponente.Text);
  Result := True;
end;

//
// VCLMaskEditEntrar.
//
function VCLMaskEditEntrar(argComponente: TMaskEdit): Boolean;
begin
  Result := False;
  if argComponente.Color = clBtnFace then Exit;
  argComponente.Color := RGB(230, 242, 255);
  if argComponente.ReadOnly then Exit;
  Result := True;
end;

//
// VCLMaskEditSair.
//
function VCLMaskEditSair(argComponente: TMaskEdit): Boolean;
begin
  Result := False;
  if argComponente.Color = clBtnFace then Exit;
  argComponente.Color := clWindow;
  if argComponente.ReadOnly then Exit;
  argComponente.Text := StringTrim(argComponente.Text);
  Result := True;
end;

//
// VCLMemoEntrar.
//
function VCLMemoEntrar(argComponente: TMemo): Boolean;
begin
  Result := False;
  if argComponente.Color = clBtnFace then Exit;
  argComponente.Color := RGB(230, 242, 255);
  if argComponente.ReadOnly then Exit;
  Result := True;
end;

//
// VCLMemoSair.
//
function VCLMemoSair(argComponente: TMemo): Boolean;
begin
  Result := False;
  if argComponente.Color = clBtnFace then Exit;
  argComponente.Color := clWindow;
  if argComponente.ReadOnly then Exit;
  argComponente.Text := StringTrim(argComponente.Text);
  Result := True;
end;

//
// VCLCheckBoxEntrar.
//
function VCLCheckBoxEntrar(argComponente: TCheckBox): Boolean;
begin
  Result := False;
  if argComponente.Color = clBtnFace then Exit;
  argComponente.Color := RGB(230, 242, 255);
  if not argComponente.Enabled then Exit;
  Result := True;
end;

//
// VCLCheckBoxSair.
//
function VCLCheckBoxSair(argComponente: TCheckBox): Boolean;
begin
  Result := False;
  if argComponente.Color = clBtnFace then Exit;
  argComponente.Color := clWindow;
  if not argComponente.Enabled then Exit;
  Result := True;
end;

//
// VCLMaskEditDataValidar.
//
function VCLMaskEditDataValidar(argComponente: TMaskEdit; argVazio: Boolean = True) : Boolean;
var
  locData: String;
begin
  Result := False;

  locData := DataFormatar(argComponente.Text);

  if locData = '' then
  begin
    if (not argVazio) then
    begin
      VCLConsistenciaExibir('Uma data precisa ser informada!');
      argComponente.SetFocus;
    end;
    Exit
  end;

  if not DataValidar(locData) then
  begin
    VCLConsistenciaExibir('A data [' + argComponente.Text + '] informada não é válida!');
    argComponente.Text := '';
    argComponente.SetFocus;
    Result := False;
    Exit;
  end;

  argComponente.Text := locData;
  Result := True;
end;

//
// VCLMaskEditHorarioValidar.
//
function VCLMaskEditHorarioValidar(argComponente: TMaskEdit; argVazio: Boolean = True) : Boolean;
var
  locHorario: String;
begin
  Result := False;

  locHorario := HorarioFormatar(argComponente.Text);

  if locHorario = '' then
  begin
    if (not argVazio) then
    begin
      VCLConsistenciaExibir('Um horário precisa ser informado!');
      argComponente.SetFocus;
    end;
    Exit
  end;

  if not HorarioValidar(locHorario) then
  begin
    VCLConsistenciaExibir('O horário [' + argComponente.Text + '] informado não é válido!');
    argComponente.Text := '';
    argComponente.SetFocus;
    Result := False;
    Exit;
  end;

  argComponente.Text := locHorario;
  Result := True;
end;

//
// VCLEditTextoValidar.
//
function VCLEditTextoValidar(argComponente: TEdit; argVazio: Boolean = True) : Boolean;
begin
  Result := False;

  argComponente.Text := StringTrim(argComponente.Text);
  
  if argComponente.Text = '' then
  begin
    if (not argVazio) then
    begin
      VCLConsistenciaExibir('Um texto precisa ser informado!');
      argComponente.SetFocus;
    end;
    Exit
  end;
  
  Result := True;
end;

//
// VCLProgressBarInicializar.
//
procedure VCLProgressBarInicializar(argComponente: TProgressBar; argTamanho: Integer);
begin
  VCLProgressBarLimpar(argComponente);
  argComponente.Max     := argTamanho;
  argComponente.Visible := True;
end;

//
// VCLProgressBarIncrementar.
//
procedure VCLProgressBarIncrementar(argComponente: TProgressBar);
begin
  argComponente.Position := argComponente.Position + 1;
end;

//
// VCLListViewItemPosicionar.
//
procedure VCLListViewItemPosicionar(argComponente: TListView; argIndice: Integer);
begin
  if argComponente.Items.Count = 0 then Exit;

  if argIndice < 0 then argIndice := 0;
  if argIndice > (argComponente.Items.Count - 1) then argIndice := (argComponente.Items.Count - 1);

  argComponente.ItemIndex   := argIndice;
  argComponente.Items[argIndice].Focused  := True;
  argComponente.Items[argIndice].Selected := True;
  argComponente.Items[argIndice].MakeVisible(False);
end;

//
// VCLListViewConteudoPosicionar.
//
procedure VCLListViewConteudoPosicionar(argComponente: TListView; argColuna: Integer; argConteudo: string);
var
  locContador: Integer;
begin
  for locContador := 0 to (argComponente.Items.Count - 1) do
  begin
    if argComponente.Items.Item[locContador].SubItems.Strings[argColuna] = argConteudo then
    begin
      VCLListViewItemPosicionar(argComponente, locContador);
      Exit;
    end;
  end;
end;

//
// VCLListViewFocar.
//
procedure VCLListViewFocar(argComponente: TListView);
begin
  if argComponente.Items.Count <= 0 then exit;

  if argComponente.Selected = nil then
  begin
    VCLListViewItemPosicionar(argComponente, 0);
  end;

  argComponente.SetFocus;
end;

//
// VCLListViewZebrar.
//
procedure VCLListViewZebrar(argComponente: TCustomListView; argListItem  : TListItem);
begin
  if Odd(argListItem.Index) = True then
  begin
    argComponente.Canvas.Brush.Color := RGB(240, 240, 240);
  end
  else
  begin
    argComponente.Canvas.Brush.Color := RGB(250, 250, 250);
  end;
end;

//
// VCLListViewComparar.
//
procedure VCLListViewComparar(argComponente: TObject; argListItem1: TListItem; argListItem2: TListItem; var argCompare: Integer; var argIndiceColuna: Integer; var argOrdemAscendente: Boolean);
var
  locTag   : Integer;
  locvalor1: string;
  locvalor2: string;
begin
  //
  // Tag: 0 - texto, 1 - numérico e 2 - data.
  //
  locTag := TListView(argComponente).Columns.Items[argIndiceColuna].Tag;

  //
  // Ordenação pelo caption
  //
  if (argIndiceColuna = 0) then
  begin
    if (locTag = 0) then
    begin
      locValor1 := StringAcentosRemover(argListItem1.Caption);
      locValor2 := StringAcentosRemover(argListItem2.Caption);
    end;

    if (locTag = 1) then
    begin
      locValor1 := FormatCurr('000,000,000,000.00', StringCurrencyConverter(argListItem1.Caption));
      locValor2 := FormatCurr('000,000,000,000.00', StringCurrencyConverter(argListItem2.Caption));
    end;

    if (locTag = 2) then
    begin
      locValor1 := FormatDateTime('yyyy/mm/dd hh:nn:ss.zzz', StringDateTimeConverter(argListItem1.Caption));
      locValor2 := FormatDateTime('yyyy/mm/dd hh:nn:ss.zzz', StringDateTimeConverter(argListItem2.Caption));
    end;
  end
  else
  begin
    if (locTag = 0) then
    begin
      locValor1 := StringAcentosRemover(argListItem1.SubItems[argIndiceColuna - 1]);
      locValor2 := StringAcentosRemover(argListItem2.SubItems[argIndiceColuna - 1]);
    end;

    if (locTag = 1) then
    begin
      locValor1 := FormatCurr('000,000,000,000.00', StringCurrencyConverter(argListItem1.SubItems[argIndiceColuna - 1]));
      locValor2 := FormatCurr('000,000,000,000.00', StringCurrencyConverter(argListItem2.SubItems[argIndiceColuna - 1]));
    end;

    if (locTag = 2) then
    begin
      locValor1 := FormatDateTime('yyyy/mm/dd hh:nn:ss.zzz', StringDateTimeConverter(argListItem1.SubItems[argIndiceColuna - 1]));
      locValor2 := FormatDateTime('yyyy/mm/dd hh:nn:ss.zzz', StringDateTimeConverter(argListItem2.SubItems[argIndiceColuna - 1]));
    end;
  end;

  if (argOrdemAscendente) then
  begin
    argCompare := CompareText(locValor1, locValor2);
  end
  else
  begin
    argCompare := CompareText(locValor2, locValor1);
  end;
end;

//
// VCLListViewColunaClicar.
//
procedure VCLListViewColunaClicar(argComponente: TObject; argListColumn: TListColumn; var argIndiceColuna: Integer; var argOrdemAscendente: Boolean);
begin
  if (argIndiceColuna = argListColumn.Index) then
  begin
    //
    // Se a coluna clicada eh a mesma que ja esta, troca a ordem
    //
    argOrdemAscendente := not(argOrdemAscendente);
    TListView(argComponente).AlphaSort;
  end
  else
  begin
    //
    // Sendo a coluna diferente da clicada anteriormente
    //
    argOrdemAscendente := True;
    argIndiceColuna    := argListColumn.Index;
    TListView(argComponente).AlphaSort;
  end;
end;

//
// VCLListViewControlar.
//
procedure VCLListViewControlar(argComponente: TListView; argHabilitar : Boolean);
begin
  argComponente.Enabled := argHabilitar;
end;

//
// VCLListViewSequencializar.
//
procedure VCLListViewSequencializar(argComponente: TListView; argIndiceColuna: Integer);
var
  locContador: Integer;
begin
  for locContador := 0 to (argComponente.Items.Count - 1) do
  begin
    argComponente.Items.Item[locContador].SubItems.Strings[argIndiceColuna] := IntegerStringConverter(locContador + 1);
  end;
end;

//
// VCLListViewLinhaMover.
//
procedure VCLListViewLinhaMover(argListView: TListView; argMovimento: Byte; argIndiceColunaSequencial: Integer = -1);
var
  locItemIndex   : Integer;
  locArray       : array of string;
  locQtdeColunas : Integer;
  locContador    : Integer;
  locPosicaoFinal: Integer;
begin
  //
  // Se não houverem linhas ou somente uma única então não há nada a fazer..
  //
  if argListView.Items.Count <= 1 then Exit;

  //
  // Se nenhuma linha foi selecionada.
  //
  if argListView.Selected = nil then Exit;

  //
  // Determina o índice selecionado.
  //
  locItemIndex := argListView.Selected.Index;

  //
  // Quantidade de colunas.
  //
  locQtdeColunas := argListView.Items.Item[0].SubItems.Count + 1;

  //
  // Armazena informações da linha do indice.
  //
  locArray    := nil;
  locContador := 0;
  while locContador <= (locQtdeColunas - 1) do
  begin
    SetLength(locArray, locContador + 1);

    if locContador = 0 then
    begin
      locArray[Length(locArray) - 1] := argListView.Items.Item[locItemIndex].Caption;
    end
    else
    begin
      locArray[Length(locArray) - 1] := argListView.Items.Item[locItemIndex].SubItems.Strings[locContador - 1];
    end;

    Inc(locContador);
  end;

  //
  // Subir linha.
  //
  if (argMovimento = VCL_MOVIMENTO_SUBIR) or (argMovimento = VCL_MOVIMENTO_SUBIR_TODOS) then
  begin
    //
    // Determina a posição final.
    //
    locPosicaoFinal := locItemIndex;
    if argMovimento = VCL_MOVIMENTO_SUBIR_TODOS then locPosicaoFinal := 1;

    for locItemIndex := locItemIndex downto locPosicaoFinal do
    begin
      //
      // Se for o primeiro índice então para.
      //
      if locItemIndex = 0 then break;

      //
      // Desce os dados da linha acima para baixo.
      //
      locContador := 0;
      while locContador <= (locQtdeColunas - 1) do
      begin
        if locContador = 0 then
        begin
          argListView.Items.Item[locItemIndex].Caption := argListView.Items.Item[locItemIndex - 1].Caption;
        end
        else
        begin
          argListView.Items.Item[locItemIndex].SubItems.Strings[locContador - 1] := argListView.Items.Item[locItemIndex - 1].SubItems.Strings[locContador - 1];
        end;

        Inc(locContador);
      end;

      //
      // Copia os dados do array na linha de cima.
      //
      locContador := 0;
      while locContador <= (locQtdeColunas - 1) do
      begin
        if locContador = 0 then
        begin
          argListView.Items.Item[locItemIndex - 1].Caption := locArray[locContador];
        end
        else
        begin
          argListView.Items.Item[locItemIndex - 1].SubItems.Strings[locContador - 1] := locArray[locContador];
        end;

        Inc(locContador);
      end;

      //
      // Posiciona nova linha no listview.
      //
      VCLListViewItemPosicionar(argListView, locItemIndex - 1);
    end;
  end;

  //
  // Descer linha.
  //
  if (argMovimento = VCL_MOVIMENTO_DESCER) or (argMovimento = VCL_MOVIMENTO_DESCER_TODOS) then
  begin
    //
    // Determina a posição final.
    //
    locPosicaoFinal := locItemIndex;
    if argMovimento = VCL_MOVIMENTO_DESCER_TODOS then locPosicaoFinal := argListView.Items.Count - 2;

    for locItemIndex := locItemIndex to locPosicaoFinal do
    begin
      //
      // Se for o último índice então para.
      //
      if locItemIndex = (argListView.Items.Count - 1) then break;

      //
      // Sobe os dados da linha abaixo para cima.
      //
      locContador := 0;
      while locContador <= (locQtdeColunas - 1) do
      begin
        if locContador = 0 then
        begin
          argListView.Items.Item[locItemIndex].Caption := argListView.Items.Item[locItemIndex + 1].Caption;
        end
        else
        begin
          argListView.Items.Item[locItemIndex].SubItems.Strings[locContador - 1] := argListView.Items.Item[locItemIndex + 1].SubItems.Strings[locContador - 1];
        end;

        Inc(locContador);
      end;

      //
      // Copia os dados do array na linha de cima.
      //
      locContador := 0;
      while locContador <= (locQtdeColunas - 1) do
      begin
        if locContador = 0 then
        begin
          argListView.Items.Item[locItemIndex + 1].Caption := locArray[locContador];
        end
        else
        begin
          argListView.Items.Item[locItemIndex + 1].SubItems.Strings[locContador - 1] := locArray[locContador];
        end;

        Inc(locContador);
      end;

      //
      // Posiciona nova linha no listview.
      //
      VCLListViewItemPosicionar(argListView, locItemIndex + 1);
    end;
  end;

  //
  // Sequencializa.
  //
  if argIndiceColunaSequencial >= 0 then
  begin
    VCLListViewSequencializar(argListView, argIndiceColunaSequencial);
  end;
end;

//
// VCLListViewItemRemover.
//
procedure VCLListViewItemRemover(argComponente: TListView; argIndiceItemRemover: Integer; argIndiceColunaSequencial: Integer);                                 
var
  locIndice: Integer;
begin
  //
  // Determina o índice que será removido.
  //
  if argIndiceItemRemover >= 0 then
  begin
    locIndice := argIndiceItemRemover;
  end
  else
  begin
    if argComponente.Selected = nil then Exit;
    locIndice := argComponente.Selected.Index;
  end;

  //
  // Remove item da lista.
  //
  argComponente.Items.Item[locIndice].Delete;

  //
  // Resequencializa o listview.
  //
  if argIndiceColunaSequencial >= 0 then
  begin
    VCLListViewSequencializar(argComponente, argIndiceColunaSequencial);
  end;

  //
  // Posiciona o foco no listview.
  //
  VCLListViewItemPosicionar(argComponente, locIndice - 1);
  VCLListViewFocar(argComponente);
end;

//
// VCLListViewIndiceItemRetornar.
//
function VCLListViewIndiceItemRetornar(argComponente: TListView): Integer;
var
  locIndice: Integer;
begin
  Result := VCL_NENHUM_INDICE;

  if argComponente.Items.Count <= 0 then
  begin
    VCLConsistenciaExibir('Nenhuma linha na lista para ser selecionada!');
    VCLListViewFocar(argComponente);
    Exit;
  end;

  locIndice := -1;

  if argComponente.Items.Count > 0 then
  begin
    if argComponente.Selected <> nil then
    begin
      locIndice := argComponente.Selected.Index;
    end;
  end;

  if (locIndice < 0) or (locIndice > (argComponente.Items.Count - 1)) then
  begin
    VCLConsistenciaExibir('Uma das linhas da lista deve ser selecionada primeiro!');
    VCLListViewFocar(argComponente);
    Exit;
  end;

  Result := locIndice;
end;

end.
