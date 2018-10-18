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
  System.DateUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Buttons,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Mask,
  Vcl.WinXCtrls;

const
  VCL_DIGITACAO_LIVRE           : Byte = 0;
  VCL_DIGITACAO_ALFABETICA      : Byte = 1;
  VCL_DIGITACAO_ALFANUMERICA    : Byte = 2;
  VCL_DIGITACAO_NUMERICA_INTEIRA: Byte = 3;
  VCL_DIGITACAO_NUMERICA_DECIMAL: Byte = 4;
  VCL_DIGITACAO_DINHEIRO        : Byte = 5;
  VCL_DIGITACAO_DATA            : Byte = 6;
  VCL_DIGITACAO_HORARIO         : Byte = 7;
  VCL_DIGITACAO_CHAVE           : Byte = 8;
  VCL_DIGITACAO_CODIGO          : Byte = 9;

  VCL_MOVIMENTO_SUBIR_TODOS     : Byte = 0;
  VCL_MOVIMENTO_SUBIR           : Byte = 1;
  VCL_MOVIMENTO_DESCER          : Byte = 2;
  VCL_MOVIMENTO_DESCER_TODOS    : Byte = 3;

  VCL_NENHUM_INDICE             : Integer = -1;

  VCL_MENSAGEM_ATUALIZAR        : string = 'Clique no botão "atualizar" para carregar a lista com os dados cadastrados!';

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
procedure VCLComboBoxLimpar(argComponente: TComboBox);
procedure VCLRadioButtonLimpar(argComponente: TRadioButton);
procedure VCLCheckBoxLimpar(argComponente: TCheckBox);
procedure VCLMemoLimpar(argComponente: TMemo);
procedure VCLProgressBarLimpar(argComponente: TProgressBar);
procedure VCLToggleSwitchLimpar(argComponente: TToggleSwitch);

//
// Controlar componentes.
//
procedure VCLMaskEditControlar(argComponente: TMaskEdit; argLigar: Boolean);
procedure VCLEditControlar(argComponente: TEdit; argLigar: Boolean);
procedure VCLRadioButtonControlar(argComponente: TRadioButton; argLigar: Boolean);
procedure VCLCheckBoxControlar(argComponente: TCheckBox; argLigar: Boolean);
procedure VCLMemoControlar(argComponente: TMemo; argLigar: Boolean);

procedure VCLEditClickControlar(argComponente: TEdit; argLigar: Boolean);
procedure VCLEditSelecaoControlar(argComponente: TEdit; argImage: TImage; argLigar: Boolean);

procedure VCLToggleSwitchLigar(argComponente: TToggleSwitch; argLigar: Boolean);
function  VCLToggleSwitchRecuperar(argComponente: TToggleSwitch): Boolean;

procedure VCLLabelHabilitar(argComponente: TLabel; argLigar: Boolean);
procedure VCLMaskEditHabilitar(argComponente: TMaskEdit; argLigar: Boolean);

//
// Entrada/Saída componentes.
//
function VCLEditEntrar(argComponente: TEdit): Boolean;
function VCLEditSair(argComponente: TEdit): Boolean;

function VCLMaskEditEntrar(argComponente: TMaskEdit): Boolean;
function VCLMaskEditSair(argComponente: TMaskEdit): Boolean;

function VCLMemoEntrar(argComponente: TMemo): Boolean;
function VCLMemoSair(argComponente: TMemo): Boolean;

function VCLComboBoxEntrar(argComponente: TComboBox): Boolean;
function VCLComboBoxSair(argComponente: TComboBox): Boolean;

function VCLCheckBoxEntrar(argComponente: TCheckBox): Boolean;
function VCLCheckBoxSair(argComponente: TCheckBox): Boolean;

function VCLToggleSwitchEntrar(argComponente: TToggleSwitch): Boolean;
function VCLToggleSwitchSair(argComponente: TToggleSwitch): Boolean;

//
// Cargas específicas.
//
procedure VCLComboBoxSimNaoPopular(argComponente: TComboBox; argCompleto: Boolean);
function  VCLComboBoxSimNaoFlagDeterminar(argComponente: TComboBox): string;
procedure VCLComboBoxPopular(argComponente: TComboBox; argValor: string);
procedure VCLComboBoxMesesPopular(argComponente: TComboBox);
procedure VCLComboBoxAnosPopular(argComponente: TComboBox);

//
// Validações.
//
function VCLComboBoxValidar(argComponente: TComboBox): Boolean;

function VCLMaskEditDataValidar(argComponente: TMaskEdit; argVazio: Boolean = True) : Boolean;

function VCLMaskEditHorarioValidar(argComponente: TMaskEdit; argVazio: Boolean = True) : Boolean;

function VCLEditTextoValidar(argComponente: TEdit; argVazio: Boolean = True) : Boolean;

procedure VCLToggleSwitchValidar(argComponente: TToggleSwitch);

//
// Específicos para combobox.
//
procedure VCLComboBoxSelecionar(argComponente: TComboBox; argValor: string);

//
// Específicos para progressbar.
//
procedure VCLProgressBarInicializar(argComponente: TProgressBar; argTamanho: Integer);
procedure VCLProgressBarIncrementar(argComponente: TProgressBar);

//
// PageControl.
//
procedure VCLPageControlInicializar(argComponente: TPageControl);
procedure VCLPageControlFocar(argComponente: TPageControl; argTabIndice: Integer; argControle: TWinControl);

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

procedure VCLListViewQtdeLinhasMensagem(argLabel: TLabel; argListView: TListView; argFiltrosAplicados: Boolean = False);

procedure VCLListViewColunarDimensionar(argComponente: TListView);

procedure VCLListViewItensMarcar(argComponente: TListView; argSelecionar: Boolean);

//
// Específicos para treeview.
//
procedure VCLTreeViewLimpar(argComponente: TTreeView);

procedure VCLTreeViewIconeDeterminar(argTreeNode: TTreeNode; argIconeIndice: Integer);

procedure VCLTreeViewItemPosicionar(argTreeView: TTreeView; argIndice: Integer);


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
  argComponente.Cursor := crHandPoint;
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
  argComponente.Text     := '';
  argComponente.Cursor   := crDefault;
  argComponente.ShowHint := False;
end;

//
// VCLComboBoxLimpar.
//
procedure VCLComboBoxLimpar(argComponente: TComboBox);
begin
  argComponente.Text      := '';
  argComponente.ItemIndex := VCL_NENHUM_INDICE;
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
// VCLToggleSwitchLimpar.
//
procedure VCLToggleSwitchLimpar(argComponente: TToggleSwitch);
begin
  VCLToggleSwitchLigar(argComponente, False);
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
  // Teclas permitidas para a digitação alfabética, alfanumérica, código e chave.
  //
  if (argTipo = VCL_DIGITACAO_ALFABETICA) or
     (argTipo = VCL_DIGITACAO_ALFANUMERICA) or
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
  // Teclas permitidas somente para a digiação alfabética e alfanumérica.
  //
  if (argTipo = VCL_DIGITACAO_CODIGO) or
     (argTipo = VCL_DIGITACAO_ALFABETICA) or
     (argTipo = VCL_DIGITACAO_ALFANUMERICA) then
  begin
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
  // Teclas permitidas somente para a digitação código e alfanumérica.
  //
  if (argTipo = VCL_DIGITACAO_CODIGO) or
     (argTipo = VCL_DIGITACAO_ALFANUMERICA) then
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
  end;

  //
  // Nenhuma das teclas permitidas.
  //
  argTecla := #0;
end;

//
// VCLMaskEditControlar.
//
procedure VCLMaskEditControlar(argComponente: TMaskEdit; argLigar: Boolean);
begin
  argComponente.ReadOnly := (not argLigar);
  argComponente.TabStop  := argLigar;
end;

//
// VCLEditControlar.
//
procedure VCLEditControlar(argComponente: TEdit; argLigar: Boolean);
begin
  argComponente.ReadOnly := (not argLigar);
  argComponente.TabStop  := argLigar;
end;

//
// VCLRadioButtonControlar.
//
procedure VCLRadioButtonControlar(argComponente: TRadioButton; argLigar: Boolean);
begin
  argComponente.Enabled := argLigar;
  argComponente.TabStop := argLigar;
end;

//
// VCLCheckBoxControlar.
//
procedure VCLCheckBoxControlar(argComponente: TCheckBox; argLigar: Boolean);
begin
  argComponente.Enabled := argLigar;
  argComponente.TabStop := argLigar;
end;

//
// VCLMemoControlar.
//
procedure VCLMemoControlar(argComponente: TMemo; argLigar: Boolean);
begin
  argComponente.ReadOnly := (not argLigar);
  argComponente.TabStop  := argLigar;
end;

//
// VCLLabelHabilitar.
//
procedure VCLLabelHabilitar(argComponente: TLabel; argLigar: Boolean);
begin
  if not argLigar then
  begin
    argComponente.Font.Color := clGrayText;
  end
  else
  begin
    argComponente.Font.Color := clBlack;
  end;
end;

//
// VCLMaskEditHabilitar.
//
procedure VCLMaskEditHabilitar(argComponente: TMaskEdit; argLigar: Boolean);
begin
  VCLMaskEditControlar(argComponente, argLigar);

  if not argLigar then
  begin
    argComponente.Font.Color := clGrayText;
  end
  else
  begin
    argComponente.Font.Color := clBlack;
  end;
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
// VCLComboBoxEntrar.
//
function VCLComboBoxEntrar(argComponente: TComboBox): Boolean;
begin
  Result := False;
  if argComponente.Color = clBtnFace then Exit;
  argComponente.Color := RGB(230, 242, 255);
  if not argComponente.Enabled then Exit;
  Result := True;
end;

//
// VCLComboBoxSair.
//
function VCLComboBoxSair(argComponente: TComboBox): Boolean;
begin
  Result := False;
  if argComponente.Color = clBtnFace then Exit;
  argComponente.Color := clWindow;
  if not argComponente.Enabled then Exit;
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
// VCLToggleSwitchEntrar.
//
function VCLToggleSwitchEntrar(argComponente: TToggleSwitch): Boolean;
begin
  Result := False;
  if argComponente.ReadOnly then Exit;
  argComponente.Color := RGB(230, 242, 255);
  if not argComponente.Enabled then Exit;
  Result := True;  
end;

//
// VCLToggleSwitchSair.
//
function VCLToggleSwitchSair(argComponente: TToggleSwitch): Boolean;
begin
  Result := False;
  if argComponente.ReadOnly then Exit;
  argComponente.Color := clWindow;
  if not argComponente.Enabled then Exit;
  Result := True; 
end;

//
// VCLEditClickControlar.
//
procedure VCLEditClickControlar(argComponente: TEdit; argLigar: Boolean);
begin
  if argComponente.Hint = '' then
    argComponente.Hint := 'Clique para exibir informações!';

  argComponente.ShowHint := argLigar;

  if argLigar and (argComponente.Text <> '') then
  begin
    argComponente.Cursor := crHandPoint;
  end
  else
  begin
    argComponente.Cursor := crDefault;
  end;

  argComponente.Refresh;
end;

//
// VCLEditSelecaoControlar.
//
procedure VCLEditSelecaoControlar(argComponente: TEdit; argImage: TImage; argLigar: Boolean);
begin
  if not argLigar then
  begin
    argComponente.Width := (argImage.Left + argImage.Width) - argComponente.Left - 1;
  end
  else
  begin
    argComponente.Width := (argImage.Left - argComponente.Left) - Round(argImage.Width / 2);
  end;

  argImage.Visible := argLigar;
end;

//
// VCLToggleSwitchLigar.
//
procedure VCLToggleSwitchLigar(argComponente: TToggleSwitch; argLigar: Boolean);
begin
  // RGB(192, 57, 43) --> Vermelho.
  // RGB(22, 160, 133) --> Verde.

  if not argLigar then
  begin
    argComponente.State      := tssOff;
    argComponente.FrameColor := RGB(100, 100, 100);
    argComponente.Font.Color := clWindowText;
    argComponente.Font.Style := [];
  end
  else
  begin
    argComponente.State      := tssOn;
    argComponente.FrameColor := RGB(60, 118, 179);
    argComponente.Font.Color := argComponente.FrameColor;
    argComponente.Font.Style := [];
  end;

  argComponente.ThumbColor := argComponente.FrameColor;
end;

//
// VCLToggleSwitchRecuperar.
//
function  VCLToggleSwitchRecuperar(argComponente: TToggleSwitch): Boolean;
begin
  if argComponente.State = tssOn then
    Result := True
  else
    Result := False;
end;

//
// VCLComboBoxSimNaoPopular.
//
procedure VCLComboBoxSimNaoPopular(argComponente: TComboBox; argCompleto: Boolean);
begin
  argComponente.Items.BeginUpdate;
  argComponente.Items.Clear;
  argComponente.Items.Add('Não');
  argComponente.Items.Add('Sim');
  argComponente.Items.Add('Ambos');
  argComponente.Items.EndUpdate;
end;

//
// VCLComboBoxSimNaoFlagDeterminar.
//
function VCLComboBoxSimNaoFlagDeterminar(argComponente: TComboBox): string;
var
  locFlag: string;
begin
  locFlag := Copy(UpperCase(argComponente.Text), 1, 1);

  Result := '';
  if locFlag = FLAG_SIM   then Result := FLAG_SIM;
  if locFlag = FLAG_NAO   then Result := FLAG_NAO;
  if locFlag = FLAG_AMBOS then Result := FLAG_AMBOS;
end;

//
// VCLComboBoxPopular.
//
procedure VCLComboBoxPopular(argComponente: TComboBox; argValor: string);
var
  locContador: integer;
begin
  if argValor = '' then
  begin
    VCLComboBoxLimpar(argComponente);
    Exit;
  end;

  for locContador := 0 to (argComponente.Items.Count - 1) do
  begin
    if UpperCase(argValor) = UpperCase(Copy(argComponente.Items[locContador], 1, Length(argValor))) then
    begin
      argComponente.Text      := argComponente.Items[locContador];
      argComponente.ItemIndex := locContador;
      Exit;
    end;
  end;
end;

//
// VCLComboBoxMesesPopular.
//
procedure VCLComboBoxMesesPopular(argComponente: TComboBox);
begin
  argComponente.Clear;
  argComponente.Items.BeginUpdate;
  argComponente.Items.Add(JANEIRO);
  argComponente.Items.Add(FEVEREIRO);
  argComponente.Items.Add(MARCO);
  argComponente.Items.Add(ABRIL);
  argComponente.Items.Add(MAIO);
  argComponente.Items.Add(JUNHO);
  argComponente.Items.Add(JULHO);
  argComponente.Items.Add(AGOSTO);
  argComponente.Items.Add(SETEMBRO);
  argComponente.Items.Add(OUTUBRO);
  argComponente.Items.Add(NOVEMBRO);
  argComponente.Items.Add(DEZEMBRO);
  argComponente.Items.EndUpdate;
end;

//
// VCLComboBoAnosPopular.
//
procedure VCLComboBoxAnosPopular(argComponente: TComboBox);
var
  locContador: Integer;
begin
  argComponente.Clear;
  argComponente.Items.BeginUpdate;
  for locContador := (YearOf(Date) - 115) to (YearOf(Date) + 30) do
  begin
    argComponente.Items.Add(IntToStr(locContador));
  end;
  argComponente.Items.EndUpdate;  
end;

//
// VCLComboBoxValidar.
//
function VCLComboBoxValidar(argComponente: TComboBox): Boolean;
var
  locTexto    : string;
  locContador : Integer;
  locEncontrou: Boolean;
begin
  locTexto := StringTrim(argComponente.Text);

  if locTexto = '' then
  begin
    VCLComboBoxLimpar(argComponente);
    Result := True;
    Exit;
  end;

  locEncontrou := False;
  for locContador := 0 to (argComponente.Items.Count - 1) do
  begin
    if UpperCase(locTexto) = UpperCase(Copy(argComponente.Items[locContador], 1, Length(locTexto))) then
    begin
      argComponente.Text      := argComponente.Items[locContador];
      argComponente.ItemIndex := locContador;
      locEncontrou            := True;
      Break;
    end;
  end;

  if not locEncontrou then
  begin
    VCLConsistenciaExibir('O valor "' + locTexto + '" informado não existe na lista de seleção disponível!');
    VCLComboBoxLimpar(argComponente);
    argComponente.SetFocus;
    Result := False;
    Exit;
  end;

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
// VCLToggleSwitchValidar.
//
procedure VCLToggleSwitchValidar(argComponente: TToggleSwitch);
var
  locLigar: Boolean;
begin
  if argComponente.State = tssOff then
    locLigar := False
  else
    locLigar := True;

  VCLToggleSwitchLigar(argComponente, locLigar);  
end;

//
// VCLComboBoxSelecionar.
//
procedure VCLComboBoxSelecionar(argComponente: TComboBox; argValor: string);
var
  locContador: Integer;
begin
  VCLComboBoxLimpar(argComponente);
  for locContador := 0 to (argComponente.Items.Count - 1) do
  begin
    if UpperCase(argValor) = UpperCase(Copy(argComponente.Items[locContador], 1, Length(argValor))) then
    begin
      argComponente.Text      := argComponente.Items[locContador];
      argComponente.ItemIndex := locContador;
      Break
    end;
  end;
end;

//
// VCLProgressBarInicializar.
//
procedure VCLProgressBarInicializar(argComponente: TProgressBar; argTamanho: Integer);
begin
  VCLProgressBarLimpar(argComponente);
  argComponente.Max     := argTamanho;
  argComponente.Visible := True;
  argComponente.Refresh;
end;

//
// VCLProgressBarIncrementar.
//
procedure VCLProgressBarIncrementar(argComponente: TProgressBar);
begin
  argComponente.Position := argComponente.Position + 1;
end;

//
// VCLPageControlInicializar.
//
procedure VCLPageControlInicializar(argComponente: TPageControl);
var
  locContador: Integer;
begin
  for locContador := 0 to (argComponente.PageCount - 1) do
  begin
    if argComponente.Pages[locContador].TabVisible then
    begin
      argComponente.ActivePageIndex := locContador;
      Break;
    end;
  end;
end;

//
// VCLPageControlFocar.
//
procedure VCLPageControlFocar(argComponente: TPageControl; argTabIndice: Integer; argControle: TWinControl);
begin
  if argComponente.Pages[argTabIndice].TabVisible then
  begin
    argComponente.ActivePageIndex := argTabIndice;
    argControle.SetFocus;
  end;
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

//
// VCLListViewQtdeLinhasMensagem
//
procedure VCLListViewQtdeLinhasMensagem(argLabel: TLabel; argListView: TListView; argFiltrosAplicados: Boolean = False);
begin
  argLabel.Font.Color := clBlack;

  if argListView.Items.Count <= 0 then
  begin
    argLabel.Font.Color := clRed;
    if not argFiltrosAplicados then
    begin
      argLabel.Caption := 'Nenhum registro cadastrado!';
    end
    else
    begin
      argLabel.Caption := 'Nenhum registro localizado com os filtros informados!';
    end;
  end;

  
  if argListView.Items.Count = 1 then
  begin
    if not argFiltrosAplicados then
    begin
      argLabel.Caption := 'Um único registro localizado!';
    end
    else
    begin
      argLabel.Caption := 'Um único registro localizado com os filtros informados!';
    end;
  end;

  if argListView.Items.Count > 1 then
  begin
    if not argFiltrosAplicados then
    begin
      argLabel.Caption := 'Foram localizados ' + IntegerStringConverter(argListView.Items.Count) + ' registros!';
    end
    else
    begin
      argLabel.Caption := 'Foram localizados ' + IntegerStringConverter(argListView.Items.Count) + ' registros com os filtros informados!';
    end;
  end;  
end;

//
// VCLListViewColunarDimensionar.
//
procedure VCLListViewColunarDimensionar(argComponente: TListView);
var
  locContador    : Integer;
  locTamanhoTotal: Currency;
  locTamanhoAtual: Currency;
  locTamanhoNovo : Currency;
  locPercentual  : Currency;
begin
  //
  // Tamanho total atual.
  //
  locTamanhoTotal := 0;
  for locContador := 0 to (argComponente.Columns.Count - 1) do
  begin
    locTamanhoTotal := locTamanhoTotal + argComponente.Columns[locContador].Width;
  end;

  //
  // Novo tamanho.
  //
  locTamanhoNovo := (argComponente.Width - 25);

  //
  // Define o novo tamanho de cada coluna.
  //
  for locContador := 0 to (argComponente.Columns.Count - 1) do
  begin
    locTamanhoAtual := argComponente.Columns[locContador].Width;
    locPercentual   := ((locTamanhoAtual / locTamanhoTotal) * 100.0000);

    argComponente.Columns[locContador].Width := Round((locTamanhoNovo / 100.0000) * locPercentual);
  end;
end;

//
// VCLListViewItensMarcar.
//
procedure VCLListViewItensMarcar(argComponente: TListView; argSelecionar: Boolean);
var
  locContador: Integer;
begin
  for locContador := 0 to (argComponente.Items.Count - 1) do
  begin
    argComponente.Items.Item[locContador].Checked := argSelecionar;
  end;
end;

//
// VCLTreeViewLimpar.
//
procedure VCLTreeViewLimpar(argComponente: TTreeView);
begin
  argComponente.Cursor := crHandPoint;
  argComponente.Items.BeginUpdate;
  argComponente.Items.Clear;
  argComponente.Items.EndUpdate;
end;

//
// VCLTreeViewIconeDeterminar.
//
procedure VCLTreeViewIconeDeterminar(argTreeNode: TTreeNode; argIconeIndice: Integer);
begin
  argTreeNode.ImageIndex         := argIconeIndice;
  argTreeNode.ExpandedImageIndex := argIconeIndice;
  argTreeNode.SelectedIndex      := argIconeIndice;
end;

//
// VCLTreeViewItemPosicionar.
//
procedure VCLTreeViewItemPosicionar(argTreeView: TTreeView; argIndice: Integer);
begin
  argTreeView.Items.Item[argIndice].Selected := True;
  argTreeView.Items.Item[argIndice].Focused;
  argTreeView.Items.Item[argIndice].MakeVisible;
  argTreeView.SetFocus;
end;

end.
