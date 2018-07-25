unit Plataforma_ERP_VCL_DataSelecao;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs;

type
  TPlataformaERPVCLDataSelecao = class(TForm)
  private
    { Private declarations }
  public
    pubData        : TDateTime;
    pubClicouFechar: Boolean;
  end;

var
  PlataformaERPVCLDataSelecao: TPlataformaERPVCLDataSelecao;

implementation

{$R *.dfm}

end.
