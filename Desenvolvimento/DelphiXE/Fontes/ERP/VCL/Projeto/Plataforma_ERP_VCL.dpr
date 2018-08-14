program Plataforma_ERP_VCL;

{$R *.dres}

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
  Plataforma_ERP_VCL_TiposUsuariosSelecao in '..\Formularios\Plataforma_ERP_VCL_TiposUsuariosSelecao.pas' {PlataformaERPVCLTiposUsuariosSelecao},
  Plataforma_ERP_VCL_LicencaCadastro in '..\Formularios\Plataforma_ERP_VCL_LicencaCadastro.pas' {PlataformaERPVCLLicencaCadastro},
  Plataforma_ERP_VCL_BaseCadastro in '..\Formularios\Plataforma_ERP_VCL_BaseCadastro.pas' {PlataformaERPVCLBaseCadastro},
  Plataforma_ERP_VCL_TiposUsuariosCodigo in '..\Formularios\Plataforma_ERP_VCL_TiposUsuariosCodigo.pas' {PlataformaERPVCLTiposUsuariosCodigo},
  Plataforma_ERP_VCL_DataExibicao in '..\Formularios\Plataforma_ERP_VCL_DataExibicao.pas' {PlataformaERPVCLDataExibicao},
  Plataforma_ERP_VCL_DataSelecao in '..\Formularios\Plataforma_ERP_VCL_DataSelecao.pas' {PlataformaERPVCLDataSelecao},
  Plataforma_ERP_VCL_UsuarioLista in '..\Formularios\Plataforma_ERP_VCL_UsuarioLista.pas' {PlataformaERPVCLUsuarioLista},
  Plataforma_ERP_VCL_UsuarioFiltro in '..\Formularios\Plataforma_ERP_VCL_UsuarioFiltro.pas' {PlataformaERPVCLUsuarioFiltro},
  Plataforma_ERP_VCL_UsuarioCadastro in '..\Formularios\Plataforma_ERP_VCL_UsuarioCadastro.pas' {PlataformaERPVCLUsuarioCadastro},
  Plataforma_ERP_VCL_UsuarioSenha in '..\Formularios\Plataforma_ERP_VCL_UsuarioSenha.pas' {PlataformaERPVCLUsuarioSenha},
  Plataforma_ERP_VCL_UsuarioLogon in '..\Formularios\Plataforma_ERP_VCL_UsuarioLogon.pas' {PlataformaERPVCLUsuarioLogon},
  Plataforma_ERP_VCL_UsuarioSenhaTrocar in '..\Formularios\Plataforma_ERP_VCL_UsuarioSenhaTrocar.pas' {PlataformaERPVCLUsuarioSenhaTrocar},
  Plataforma_ERP_VCL_PerfilUsuarioLista in '..\Formularios\Plataforma_ERP_VCL_PerfilUsuarioLista.pas' {PlataformaERPVCLPerfilUsuarioLista},
  Plataforma_ERP_VCL_PerfilUsuarioFiltro in '..\Formularios\Plataforma_ERP_VCL_PerfilUsuarioFiltro.pas' {PlataformaERPVCLPerfilUsuarioFiltro},
  Plataforma_ERP_VCL_PerfilUsuarioCadastro in '..\Formularios\Plataforma_ERP_VCL_PerfilUsuarioCadastro.pas' {PlataformaERPVCLPerfilUsuarioCadastro},
  Plataforma_ERP_VCL_RotinaAplicacaoLista in '..\Formularios\Plataforma_ERP_VCL_RotinaAplicacaoLista.pas' {PlataformaERPVCLRotinaAplicacaoLista},
  Plataforma_ERP_VCL_RotinaAplicacaoFiltro in '..\Formularios\Plataforma_ERP_VCL_RotinaAplicacaoFiltro.pas' {PlataformaERPVCLRotinaAplicacaoFiltro},
  Plataforma_ERP_VCL_RotinaAplicacaoCadastro in '..\Formularios\Plataforma_ERP_VCL_RotinaAplicacaoCadastro.pas' {PlataformaERPVCLRotinaAplicacaoCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPlataformaERPVCLMenuPrincipal, PlataformaERPVCLMenuPrincipal);
  Application.CreateForm(TPlataformaERPVCLPerfilUsuarioLista, PlataformaERPVCLPerfilUsuarioLista);
  Application.CreateForm(TPlataformaERPVCLPerfilUsuarioFiltro, PlataformaERPVCLPerfilUsuarioFiltro);
  Application.CreateForm(TPlataformaERPVCLPerfilUsuarioCadastro, PlataformaERPVCLPerfilUsuarioCadastro);
  Application.CreateForm(TPlataformaERPVCLRotinaAplicacaoLista, PlataformaERPVCLRotinaAplicacaoLista);
  Application.CreateForm(TPlataformaERPVCLRotinaAplicacaoFiltro, PlataformaERPVCLRotinaAplicacaoFiltro);
  Application.CreateForm(TPlataformaERPVCLRotinaAplicacaoCadastro, PlataformaERPVCLRotinaAplicacaoCadastro);
  Application.Run;
end.
