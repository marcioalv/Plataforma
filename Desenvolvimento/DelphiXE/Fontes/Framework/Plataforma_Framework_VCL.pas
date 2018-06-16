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
/// Fun��o para exibir um formul�rio filho MDI.
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

end.
