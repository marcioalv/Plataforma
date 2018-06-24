//
// Arquivo..: Plataforma_Framework_VCL.pas
// Projeto..: Framework
// Fonte....: Unit
// Cria��o..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Fun��es e procedimentos diversos e �teis para tratar componentes VCL.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
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
  Vcl.ExtCtrls;

const
  VCL_DIGITACAO_LIVRE           : Byte = 0;
  VCL_DIGITACAO_ALFANUMERICA    : Byte = 1;
  VCL_DIGITACAO_NUMERICA_INTEIRA: Byte = 2;
  VCL_DIGITACAO_NUMERICA_DECIMAL: Byte = 3;
  VCL_DIGITACAO_DINHEIRO        : Byte = 4;
  VCL_DIGITACAO_DATA            : Byte = 5;
  VCL_DIGITACAO_HORA            : Byte = 6;
  VCL_DIGITACAO_CHAVE           : Byte = 7;
  VCL_DIGITACAO_CODIGO          : Byte = 8;

  VCL_MOVIMENTO_SUBIR_TODOS     : Byte = 0;
  VCL_MOVIMENTO_SUBIR           : Byte = 1;
  VCL_MOVIMENTO_DESCER          : Byte = 2;
  VCL_MOVIMENTO_DESCER_TODOS    : Byte = 3;

  VCL_NENHUM_INDICE             : Integer = -1;

/// <summary>
/// Procedimento para trocar o cursor do formul�rio.
/// </summary>
/// <param name="argEspera">
/// Se TRUE ser� exibido o cursor de espera, se FALSE o cursor normal.
/// </param>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
procedure VCLCursorTrocar(argEspera: Boolean = False);

/// <summary>
/// Procedimento para maximizar um formul�rio SDI.
/// </summary>
/// <param name="argFormulario">
/// Formul�rio SDI que ser� centralizado.
/// </param>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
procedure VCLSDIFormularioMaximizar(argFormulario: TForm);

procedure VCLMinimizar;

/// <summary>
/// Fun��o para exibir um formul�rio MDI.
/// </summary>
/// <param name="argNomeFormulario">
/// Nome do formul�rio MDI filho que ser� exibido, sem a letra 'T' inicial de classe.
/// </param>
/// <returns>
/// True se o formul�rio j� estava aberto e s� deveria ser re-exibido ou false se o formul�rio n�o existir.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function VCLMDIFormularioExibir(argNomeFormulario: string): Boolean;

/// <summary>
/// Procedimento para maximizar um formul�rio filho MDI.
/// </summary>
/// <param name="argFormulario">
/// Formul�rio MDI filho que ser� maximizado.
/// </param>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
procedure VCLMDIFormularioMaximizar(argFormulario: TForm);

/// <summary>
/// Procedimento para exibir uma mensagem de consist�ncia ao usu�rio da aplica��o.
/// </summary>
/// <param name="argMensagem">
/// Mensagem de consist�ncia que ser� exibida.
/// </param>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
procedure VCLConsistenciaExibir(argMensagem: string);

/// <summary>
/// Procedimento para exibir uma mensagem de exce��o ao usu�rio da aplica��o.
/// </summary>
/// <param name="argMensagem">
/// Mensagem indicando qual erro ocorreu.
/// </param>
/// <remarks>
/// <param name="argExcecao">
/// Mensagem de exce��o com o erro ocorrido.
/// </param>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
procedure VCLExcecaoExibir(argMensagem: string; argExcecao: string);

/// <summary>
/// Procedimento para limpar um listview.
/// </summary>
/// <param name="argListView">
/// Componente listview que ser� limpo.
/// </param>
/// <remarks>
/// <param name="argExcecao">
/// Mensagem de exce��o com o erro ocorrido.
/// </param>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
procedure VCLListViewLimpar(argListView: TListView);

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

procedure EnterHabilitar(argFormulario: TForm; var argTecla: Char);

procedure VCLDigitacaoHabilitar(argFormulario: TForm; var argTecla: Char; argTipo: Byte);

implementation

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
procedure VCLSDIFormularioMaximizar(argFormulario: TForm);
const
  locCOMPENSACAO: Integer = 10;
begin
  argFormulario.BorderStyle := bsSingle;
//  argFormulario.WindowState := wsMaximized;
  argFormulario.Top         := Screen.WorkAreaTop    + locCOMPENSACAO;
  argFormulario.Left        := Screen.WorkAreaLeft   + locCOMPENSACAO;
  argFormulario.Height      := Screen.WorkAreaHeight - (locCOMPENSACAO * 2);
  argFormulario.Width       := Screen.WorkAreaWidth  - (locCOMPENSACAO * 2);
  argFormulario.BorderIcons := [biSystemMenu];
end;

//
// VCLMinimizar.
//
procedure VCLMinimizar;
begin
  Application.Minimize;
end;

//
// VCLMDIFormularioExibir.
//
function VCLMDIFormularioExibir(argNomeFormulario: string): Boolean;
var
  locContador: Integer;
begin
  for locContador := 0 to (Application.MainForm.MDIChildCount - 1) do
  begin
    if Application.MainForm.MDIChildren[locContador].Name = argNomeFormulario then
    begin
      Application.MainForm.MDIChildren[locContador].Show;
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;

//
// VCLMDIFormularioMaximizar.
//
procedure VCLMDIFormularioMaximizar(argFormulario: TForm);
begin
  argFormulario.Top    := 0;
  argFormulario.Left   := 0;
  argFormulario.Width  := Application.MainForm.ClientWidth  - 4;
  argFormulario.Height := Application.MainForm.ClientHeight - 4;
end;

//
// VCLConsistenciaExibir.
//
procedure VCLConsistenciaExibir(argMensagem: string);
begin
  Application.MessageBox(PChar(argMensagem), 'Consist�ncia', MB_OK + MB_ICONWARNING);
end;

//
// VCLExcecaoExibir.
//
procedure VCLExcecaoExibir(argMensagem: string; argExcecao: string);
var
  locMensagem: string;
begin
  locMensagem := '';

  if argMensagem <> '' then
  begin
    if locMensagem <> '' then locMensagem := locMensagem + #13 + #13;
    locMensagem := locMensagem + argMensagem;
  end;

  if argExcecao <> '' then
  begin
    if locMensagem <> '' then locMensagem := locMensagem + #13 + #13;
    locMensagem := locMensagem + argExcecao;
  end;
  
  Application.MessageBox(PChar(locMensagem), 'Exce��o', MB_OK + MB_ICONERROR);
end;

//
// VCLListViewLimpar.
//
procedure VCLListViewLimpar(argListView: TListView);
begin
  argListView.Items.BeginUpdate;
  argListView.Items.Clear;
  argListView.Items.EndUpdate;
end;

//
// VCLListViewItemPosicionar.
//
procedure VCLListViewItemPosicionar(argComponente: TListView; argIndice: Integer);
begin
  if argComponente.Items.Count = 0 then Exit;

  if argIndice < 0 then argIndice := 0;
  if argIndice > (argComponente.Items.Count - 1) then argIndice := (argComponente.Items.Count - 1);

  argComponente.ItemFocused := argComponente.Items.Item[argIndice];
  argComponente.ItemIndex   := argIndice;
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
  // Tag: 0 - texto, 1 - num�rico e 2 - data.
  //
  locTag := TListView(argComponente).Columns.Items[argIndiceColuna].Tag;

  //
  // Ordena��o pelo caption
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
  // Se n�o houverem linhas ou somente uma �nica ent�o n�o h� nada a fazer..
  //
  if argListView.Items.Count <= 1 then Exit;

  //
  // Se nenhuma linha foi selecionada.
  //
  if argListView.Selected = nil then Exit;

  //
  // Determina o �ndice selecionado.
  //
  locItemIndex := argListView.Selected.Index;

  //
  // Quantidade de colunas.
  //
  locQtdeColunas := argListView.Items.Item[0].SubItems.Count + 1;

  //
  // Armazena informa��es da linha do indice.
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
    // Determina a posi��o final.
    //
    locPosicaoFinal := locItemIndex;
    if argMovimento = VCL_MOVIMENTO_SUBIR_TODOS then locPosicaoFinal := 1;

    for locItemIndex := locItemIndex downto locPosicaoFinal do
    begin
      //
      // Se for o primeiro �ndice ent�o para.
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
    // Determina a posi��o final.
    //
    locPosicaoFinal := locItemIndex;
    if argMovimento = VCL_MOVIMENTO_DESCER_TODOS then locPosicaoFinal := argListView.Items.Count - 2;

    for locItemIndex := locItemIndex to locPosicaoFinal do
    begin
      //
      // Se for o �ltimo �ndice ent�o para.
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
  // Determina o �ndice que ser� removido.
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
  // Digita��o livre.
  //
  if argTipo = VCL_DIGITACAO_LIVRE then Exit;

  //
  // Teclas de controle permitidas em qualquer situa��o.
  //
  if (argTecla = BACKSPACE) or
     (argTecla = ESC)       or
     (argTecla = CTRL)      or
     (argTecla = CTRL_X)    or
     (argTecla = CTRL_C)    or
     (argTecla = CTRL_V) then Exit;

  //
  // Teclas permitidas para a digita��o alfanum�rica, num�rica inteira, num�rica decimal, dinheiro e c�digo.
  //
  if (argTipo = VCL_DIGITACAO_ALFANUMERICA) or
     (argTipo = VCL_DIGITACAO_NUMERICA_INTEIRA) or
     (argTipo = VCL_DIGITACAO_NUMERICA_DECIMAL) or
     (argTipo = VCL_DIGITACAO_DINHEIRO) or
     (argTipo = VCL_DIGITACAO_CODIGO) then
  begin
    if (argTecla = '-') then Exit;
  end;

  //
  // Teclas permitidas para a digita��o alfanum�rica, data e c�digo.
  //
  if (argTipo = VCL_DIGITACAO_ALFANUMERICA) or
     (argTipo = VCL_DIGITACAO_DATA) or
     (argTipo = VCL_DIGITACAO_CODIGO) then
  begin
    if (argTecla = '/') then Exit;
  end;

  //
  // Teclas permitidas para a digita��o alfanum�rica, hora e c�digo.
  //
  if (argTipo = VCL_DIGITACAO_ALFANUMERICA) or
     (argTipo = VCL_DIGITACAO_HORA) or
     (argTipo = VCL_DIGITACAO_CODIGO) then
  begin
    if (argTecla = ':') then Exit;
  end;

  //
  // Teclas permitidas para a digita��o alfanum�rica, num�rica inteira, num�rica decimal, dinheiro, data, hota, c�digo e chave.
  //
  if (argTipo = VCL_DIGITACAO_ALFANUMERICA) or
     (argTipo = VCL_DIGITACAO_NUMERICA_INTEIRA) or
     (argTipo = VCL_DIGITACAO_NUMERICA_DECIMAL) or
     (argTipo = VCL_DIGITACAO_DINHEIRO) or
     (argTipo = VCL_DIGITACAO_DATA) or
     (argTipo = VCL_DIGITACAO_HORA) or
     (argTipo = VCL_DIGITACAO_CODIGO) or
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
  // Teclas permitidas para a digita��o alfanum�rica, c�digo e chave.
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
  // Teclas permitidas somente para a digia��o alfanum�rica.
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

    if (argTecla = '�') or (argTecla = '�') or (argTecla = '�') or (argTecla = '�') or (argTecla = '�') then Exit;
    if (argTecla = '�') or (argTecla = '�') or (argTecla = '�') or (argTecla = '�') or (argTecla = '�') then Exit;

    if (argTecla = '�') then Exit;
    if (argTecla = '�') then Exit;

    if (argTecla = '�') or (argTecla = '�') or (argTecla = '�') or (argTecla = '�') then Exit;
    if (argTecla = '�') or (argTecla = '�') or (argTecla = '�') or (argTecla = '�') then Exit;

    if (argTecla = '�') or (argTecla = '�') or (argTecla = '�') or (argTecla = '�') then Exit;
    if (argTecla = '�') or (argTecla = '�') or (argTecla = '�') or (argTecla = '�') then Exit;

    if (argTecla = '�') or (argTecla = '�') or (argTecla = '�') or (argTecla = '�') or (argTecla = '�') then Exit;
    if (argTecla = '�') or (argTecla = '�') or (argTecla = '�') or (argTecla = '�') or (argTecla = '�') then Exit;

    if (argTecla = '�') or (argTecla = '�') or (argTecla = '�') or (argTecla = '�') then Exit;
    if (argTecla = '�') or (argTecla = '�') or (argTecla = '�') or (argTecla = '�') then Exit;
  end;

  //
  // Nenhuma das teclas permitidas.
  //
  argTecla := #0;
end;

end.