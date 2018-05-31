program Plataforma_ERP_VCL;

uses
  Vcl.Forms,
  Plataforma_ERP_VCL_MenuPrincipal in '..\Formularios\Plataforma_ERP_VCL_MenuPrincipal.pas' {PlataformaERPVCLMenuPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPlataformaERPVCLMenuPrincipal, PlataformaERPVCLMenuPrincipal);
  Application.Run;
end.
