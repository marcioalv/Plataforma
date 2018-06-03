program Plataforma_ERP_VCL;

uses
  Vcl.Forms,
  Plataforma_ERP_VCL_MenuPrincipal in '..\Formularios\Plataforma_ERP_VCL_MenuPrincipal.pas' {PlataformaERPVCLMenuPrincipal},
  Plataforma_ERP_VCL_AplicativoRotinaCadastro in '..\Formularios\Plataforma_ERP_VCL_AplicativoRotinaCadastro.pas' {PlataformaERPVCLAplicativoRotinaCadastro},
  Plataforma_Framework_Log in '..\..\..\Framework\Plataforma_Framework_Log.pas',
  Plataforma_ERP_Inicializacao in '..\..\Modulos\Plataforma_ERP_Inicializacao.pas',
  Plataforma_ERP_Global in '..\..\Modulos\Plataforma_ERP_Global.pas',
  Plataforma_ERP_Generico in '..\..\Modulos\Plataforma_ERP_Generico.pas',
  Plataforma_Framework_Util in '..\..\..\Framework\Plataforma_Framework_Util.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPlataformaERPVCLMenuPrincipal, PlataformaERPVCLMenuPrincipal);
  Application.Run;
end.
