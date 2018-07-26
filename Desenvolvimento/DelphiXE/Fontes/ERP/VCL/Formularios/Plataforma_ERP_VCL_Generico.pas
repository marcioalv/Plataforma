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
  Plataforma_Framework_Util,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_LogRegistroLista,
  Plataforma_ERP_VCL_DataSelecao,
  Plataforma_ERP_VCL_DataExibicao,
  Data.Win.ADODB,
  System.SysUtils,
  VCL.Mask;

//
// Plataforma_ERP_VCL_DataSelecionar.
//
procedure Plataforma_ERP_VCL_DataSelecionar(argComponente: TMaskEdit);

//
// Plataforma_ERP_VCL_DataExibir.
//
procedure Plataforma_ERP_VCL_DataExibir(argData: TDateTime);

//
// Plataforma_ERP_VCL_LogRegistroExibir.
//
procedure Plataforma_ERP_VCL_LogRegistroExibir(argIdentificador: string; argADOQuery: TADOQuery);

//
// Plataforma_ERP_VCL_BaseCadastroExibir.
//
procedure Plataforma_ERP_VCL_BaseCadastroExibir(argBaseID: Integer);

//
// Plataforma_ERP_VCL_LicencaCadastroExibir.
//
procedure Plataforma_ERP_VCL_LicencaCadastroExibir(argLicencaID: Integer);

implementation

uses
  Plataforma_ERP_VCL_BaseCadastro,
  Plataforma_ERP_VCL_LicencaCadastro;

//
// Procedimento para selecionar uma data.
//
procedure Plataforma_ERP_VCL_DataSelecionar(argComponente: TMaskEdit);
var
  locFormulario  : TPlataformaERPVCLDataSelecao;
  locClicouFechar: Boolean;
  locData        : TDateTime;
begin
  locFormulario         := TPlataformaERPVCLDataSelecao.Create(nil);
  locFormulario.pubData := StringDateTimeConverter(argComponente.Text);

  locFormulario.ShowModal;

  locClicouFechar := locFormulario.pubClicouFechar;
  locData         := locFormulario.pubData;

  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    argComponente.Text := DateTimeStringConverter(locData, 'dd/mm/yyyy');
  end;
end;

//
// Procedimento para exibir informações sobre uma data.
//
procedure Plataforma_ERP_VCL_DataExibir(argData: TDateTime);
var
  locFormulario: TPlataformaERPVCLDataExibicao;
begin
  if argData <= 0 then Exit;

  locFormulario         := TPlataformaERPVCLDataExibicao.Create(nil);
  locFormulario.pubData := argData;
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para exibir o formulário de lista de logs de um registro.
//
procedure Plataforma_ERP_VCL_LogRegistroExibir(argIdentificador: string; argADOQuery: TADOQuery);
var
  locFormulario: TPlataformaERPVCLLogRegistroLista;
begin
  locFormulario                  := TPlataformaERPVCLLogRegistroLista.Create(nil);
  locFormulario.pubIdentificador := argIdentificador;
  locFormulario.pubADOQuery      := argADOQuery;
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para exibir um cadastro de licença.
//
procedure Plataforma_ERP_VCL_LicencaCadastroExibir(argLicencaID: Integer);
var
  locFormulario: TPlataformaERPVCLLicencaCadastro;
begin
  if argLicencaID <= 0 then Exit;

  locFormulario              := TPlataformaERPVCLLicencaCadastro.Create(nil);
  locFormulario.pubLicencaID := argLicencaID;
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para exibir um cadastro de base.
//
procedure Plataforma_ERP_VCL_BaseCadastroExibir(argBaseID: Integer);
var
  locFormulario: TPlataformaERPVCLBaseCadastro;
begin
  if argBaseID <= 0 then Exit;

  locFormulario           := TPlataformaERPVCLBaseCadastro.Create(nil);
  locFormulario.pubBaseID := argBaseID;
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

end.
