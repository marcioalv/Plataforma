//
// Arquivo..: Plataforma_ERP_VCL_BaseConfiguracao.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 30/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com a configura��o da base de dados.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_BaseConfiguracao;

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
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TPlataformaERPVCLBaseConfiguracao = class(TForm)
    imgFormulario: TImage;
    imgBackground: TImage;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnMinimizar: TBitBtn;
    btnAlterar: TBitBtn;
    btnFechar: TBitBtn;
    mnuFormulario: TMainMenu;
    mniAtualizar: TMenuItem;
    mniAlterar: TMenuItem;
    mniGravar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniCancelar: TMenuItem;
    mniFechar: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    lblInsDtHt: TLabel;
    lblUpdDtHr: TLabel;
    lblUpdContador: TLabel;
    edtInsLocalDtHr: TEdit;
    edtUpdLocalDtHr: TEdit;
    edtUpdContador: TEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLBaseConfiguracao: TPlataformaERPVCLBaseConfiguracao;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_BaseCadastro.pas';

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLBaseConfiguracao.FormShow(Sender: TObject);
begin
  //
  // Background do formul�rio.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);
end;

end.
