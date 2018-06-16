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
  Vcl.ExtCtrls;

/// <summary>
/// Procedimento para trocar o cursor do formulário.
/// </summary>
/// <param name="argEspera">
/// Se TRUE será exibido o cursor de espera, se FALSE o cursor normal.
/// </param>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
procedure VCLCursorTrocar(argEspera: Boolean = False);

/// <summary>
/// Função para exibir um formulário filho MDI.
/// </summary>
/// <param name="argNomeFormulario">
/// Nome do formulário MDI filho que será exibido, sem a letra 'T' inicial de classe.
/// </param>
/// <returns>
/// True se o formulário já estava aberto e só deveria ser re-exibido ou false se o formulário não existir.
/// </returns>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
function VCLMDIFormularioExibir(argNomeFormulario: string): Boolean;

/// <summary>
/// Procedimento para maximizar um formulário filho MDI.
/// </summary>
/// <param name="argFormulario">
/// Formulário MDI filho que será maximizado.
/// </param>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
procedure VCLMDIFormularioMaximizar(argFormulario: TForm);

/// <summary>
/// Procedimento para exibir uma mensagem de consistência ao usuário da aplicação.
/// </summary>
/// <param name="argMensagem">
/// Mensagem de consistência que será exibida.
/// </param>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
procedure VCLConsistenciaExibir(argMensagem: string);

/// <summary>
/// Procedimento para exibir uma mensagem de exceção ao usuário da aplicação.
/// </summary>
/// <param name="argMensagem">
/// Mensagem indicando qual erro ocorreu.
/// </param>
/// <remarks>
/// <param name="argExcecao">
/// Mensagem de exceção com o erro ocorrido.
/// </param>
/// <remarks>
/// Criado em 31/Maio/2018 por Marcio Alves (marcioalv@yahoo.com.br)
/// </remarks>
procedure VCLExcecaoExibir(argMensagem: string; argExcecao: string);

/// <summary>
/// Procedimento para limpar um listview.
/// </summary>
/// <param name="argListView">
/// Componente listview que será limpo.
/// </param>
/// <remarks>
/// <param name="argExcecao">
/// Mensagem de exceção com o erro ocorrido.
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
  Application.MessageBox(PChar(argMensagem), 'Consistência', MB_OK + MB_ICONWARNING);
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
  
  Application.MessageBox(PChar(locMensagem), 'Exceção', MB_OK + MB_ICONERROR);
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
