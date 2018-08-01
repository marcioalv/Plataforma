program Plataforma_Icones_VCL;

uses
  Vcl.Forms,
  Plataforma_Icones_VCL_FormularioPrincipal in 'Plataforma_Icones_VCL_FormularioPrincipal.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
