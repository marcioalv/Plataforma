program Plataforma_ERP_VCL;

uses
  Vcl.Forms,
  Plataforma_ERP_VCL_MenuPrincipal in '..\Formularios\Plataforma_ERP_VCL_MenuPrincipal.pas' {PlataformaERPVCLMenuPrincipal},
  Plataforma_ERP_VCL_AplicativoRotinaCadastro in '..\Formularios\Plataforma_ERP_VCL_AplicativoRotinaCadastro.pas' {PlataformaERPVCLAplicativoRotinaCadastro},
  Plataforma_Framework_Log in '..\..\..\Framework\Plataforma_Framework_Log.pas',
  Plataforma_ERP_Inicializacao in '..\..\Modulos\Plataforma_ERP_Inicializacao.pas',
  Plataforma_ERP_Global in '..\..\Modulos\Plataforma_ERP_Global.pas',
  Plataforma_ERP_Generico in '..\..\Modulos\Plataforma_ERP_Generico.pas',
  Plataforma_Framework_Util in '..\..\..\Framework\Plataforma_Framework_Util.pas',
  Plataforma_ERP_VCL_LogLocalLista in '..\Formularios\Plataforma_ERP_VCL_LogLocalLista.pas' {PlataformaERPVCLLogLocalLista},
  Plataforma_Framework_VCL in '..\..\..\Framework\Plataforma_Framework_VCL.pas',
  Plataforma_ERP_VCL_LogLocalDetalhe in '..\Formularios\Plataforma_ERP_VCL_LogLocalDetalhe.pas' {PlataformaERPVCLLogLocalDetalhe},
  Plataforma_ERP_VCL_LogLocalArquivoSelecao in '..\Formularios\Plataforma_ERP_VCL_LogLocalArquivoSelecao.pas' {PlataformaERPVCLLogLocalArquivoSelecao},
  Plataforma_ERP_VCL_LogLocalFiltro in '..\Formularios\Plataforma_ERP_VCL_LogLocalFiltro.pas' {PlataformaERPVCLLogLocalFiltro},
  Vcl.Themes,
  Vcl.Styles,
  Plataforma_ERP_VCL_LogLocalLocalizar in '..\Formularios\Plataforma_ERP_VCL_LogLocalLocalizar.pas' {PlataformaERPVCLLogLocalLocalizar},
  Plataforma_ERP_VCL_TiposUsuariosLista in '..\Formularios\Plataforma_ERP_VCL_TiposUsuariosLista.pas' {PlataformaERPVCLTiposUsuariosLista},
  Plataforma_ERP_VCL_TiposUsuariosCadastro in '..\Formularios\Plataforma_ERP_VCL_TiposUsuariosCadastro.pas' {PlataformaERPVCLTiposUsuariosCadastro},
  Plataforma_ERP_VCL_LogRegistroExibir in '..\Formularios\Plataforma_ERP_VCL_LogRegistroExibir.pas' {PlataformaERPVCLLogRegistroExibir},
  Plataforma_ERP_VCL_LogRegistroLista in '..\Formularios\Plataforma_ERP_VCL_LogRegistroLista.pas' {PlataformaERPVCLLogRegistroLista},
  Plataforma_ERP_VCL_Generico in '..\Formularios\Plataforma_ERP_VCL_Generico.pas',
  Plataforma_ERP_VCL_TiposUsuariosFiltro in '..\Formularios\Plataforma_ERP_VCL_TiposUsuariosFiltro.pas' {PlataformaERPVCLTiposUsuariosFiltro},
  Plataforma_ERP_VCL_TiposUsuariosLocalizar in '..\Formularios\Plataforma_ERP_VCL_TiposUsuariosLocalizar.pas' {PlataformaERPVCLTiposUsuariosLocalizar},
  Plataforma_ERP_VCL_LicencaCadastro in '..\Formularios\Plataforma_ERP_VCL_LicencaCadastro.pas' {PlataformaERPVCLLicencaCadastro},
  Plataforma_ERP_VCL_BaseCadastro in '..\Formularios\Plataforma_ERP_VCL_BaseCadastro.pas' {PlataformaERPVCLBaseCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPlataformaERPVCLMenuPrincipal, PlataformaERPVCLMenuPrincipal);
  Application.Run;
end.
