//
// Arquivo..: Plataforma_ERP_VCL_Generico.pas
// Projeto..: ERP
// Fonte....: Unit
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Procedimentos e funções genéricas do projeto para componentes VCL.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
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
