program Plataforma_ERP_VCL;

uses
  Vcl.Forms,
  Plataforma_ERP_VCL_MenuPrincipal in '..\Formularios\Plataforma_ERP_VCL_MenuPrincipal.pas' {PlataformaERPVCLMenuPrincipal},
  Plataforma_ERP_VCL_AplicativoRotinaCadastro in '..\Formularios\Plataforma_ERP_VCL_AplicativoRotinaCadastro.pas' {PlataformaERPVCLAplicativoRotinaCadastro},
  Plataforma_Framework_Log in '..\..\..\Framework\Plataforma_Framework_Log.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPlataformaERPVCLMenuPrincipal, PlataformaERPVCLMenuPrincipal);
  Application.Run;
end.
