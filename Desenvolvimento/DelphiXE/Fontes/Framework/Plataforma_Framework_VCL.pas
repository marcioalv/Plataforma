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

procedure VCLConsistenciaExibir(argMensagem: string);

procedure VCLExcecaoExibir(argMensagem: string;
                           argExcecao : string);
implementation

procedure VCLConsistenciaExibir(argMensagem: string);
begin
  Application.MessageBox(PChar(argMensagem), 'Consistência', MB_OK + MB_ICONWARNING);
end;

procedure VCLExcecaoExibir(argMensagem: string;
                           argExcecao : string);
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

end.
