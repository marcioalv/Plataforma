//
// Arquivo..: Plataforma_ERP_VCL_Generico.pas
// Projeto..: ERP
// Fonte....: Unit
// Cria��o..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Procedimentos e fun��es gen�ricas do projeto para componentes VCL.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_Generico;

interface

uses
  System.SysUtils;

procedure PlataformaERPVCLLogRegistroExibir;

implementation

uses
  Plataforma_ERP_VCL_LogRegistroLista;

//
// PlataformaERPLogRegistroExibir.
//
procedure PlataformaERPVCLLogRegistroExibir;
var
  locFormulario: TPlataformaERPVCLLogRegistroLista;
begin
  locFormulario := TPlataformaERPVCLLogRegistroLista.Create(nil);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

end.
