unit Plataforma_Icones_VCL_FormularioPrincipal;

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
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TForm3 = class(TForm)
    shaBackground: TShape;
    btnCorDefinir: TBitBtn;
    imgIcone: TImage;
    BitBtn1: TBitBtn;
    dlgArquivo: TOpenDialog;
    procedure btnCorDefinirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.btnCorDefinirClick(Sender: TObject);
begin
  shaBackground.Brush.Color := RGB(225, 225, 225);
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
var
  locArquivo  : string;
  locExtensao : string;
  locImagemPNG: TPNGImage;
begin
  if not dlgArquivo.Execute then Exit;

  locArquivo  := dlgArquivo.FileName;
  locExtensao := LowerCase(Copy(dlgArquivo.FileName, Length(dlgArquivo.FileName) - 2, 3));

  if locExtensao = 'png' then
  begin
    locImagemPNG := TPNGImage.Create;
    locImagemPNG.LoadFromFile(dlgArquivo.FileName);
  end;
  
  imgIcone.Picture.Graphic := locImagemPNG;

  FreeAndNil(locImagemPNG);
end;

end.
