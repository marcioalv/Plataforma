unit Plataforma_ERP_VCL_TiposUsuariosFiltro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage;

type
  TPlataformaERPVCLTiposUsuariosFiltro = class(TForm)
    imgFormulario: TImage;
    btnFiltrar: TBitBtn;
    btnFechar: TBitBtn;
    panFormulario: TPanel;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    edtTitulo: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Label6: TLabel;
    ComboBox2: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLTiposUsuariosFiltro: TPlataformaERPVCLTiposUsuariosFiltro;

implementation

{$R *.dfm}

end.
