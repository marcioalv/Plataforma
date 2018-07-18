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
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_LogRegistroLista,
  System.SysUtils;

// Plataforma_ERP_VCL_LogRegistroExibir.
procedure Plataforma_ERP_VCL_LogRegistroExibir(argLogRegistroLista: TPlataforma_ERP_LogRegistroLista);

implementation

//
// PlataformaERPLogRegistroExibir.
//
procedure Plataforma_ERP_VCL_LogRegistroExibir(argLogRegistroLista: TPlataforma_ERP_LogRegistroLista);
var
  locFormulario: TPlataformaERPVCLLogRegistroLista;
begin
  locFormulario := TPlataformaERPVCLLogRegistroLista.Create(nil);
  locFormulario.pubLogRegistroLista := argLogRegistroLista;
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

end.
