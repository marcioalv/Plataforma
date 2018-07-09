//
// Arquivo..: Plataforma_ERP_VCL_TiposUsuariosCadastro.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio para exibir o cadastro de um tipo de usu�rio.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_TiposUsuariosCadastro;

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
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls;

type
  TPlataformaERPVCLTiposUsuariosCadastro = class(TForm)
    imgFormulario: TImage;
    btnFechar: TBitBtn;
    btnMinimizar: TBitBtn;
    pagFormulario: TPageControl;
    tabCadastro: TTabSheet;
    tabAuditoria: TTabSheet;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    lblTitulo: TLabel;
    edtTitulo: TEdit;
    lblID: TLabel;
    edtID: TEdit;
    chkBloqueado: TCheckBox;
    chkAtivo: TCheckBox;
    lblInsDtHt: TLabel;
    edtInsDtHr: TEdit;
    edtInsUsuarioNome: TEdit;
    lblUpdDtHr: TLabel;
    edtUpdDtHr: TEdit;
    edtUpdUsuarioNome: TEdit;
    lblUpdSeq: TLabel;
    edtUpdSeq: TEdit;
    btnLog: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure chkAtivoClick(Sender: TObject);
  private
    procedure FormularioLimpar;
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLTiposUsuariosCadastro: TPlataformaERPVCLTiposUsuariosCadastro;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL;

const
  TAB_CADASTRO : Byte = 0;
  TAB_AUDITORIA: Byte = 1;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormCreate(Sender: TObject);
begin
  // Limpa os componentes do formul�rio.
  FormularioLimpar;
end;

//
// Evento de exibi��oi do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormShow(Sender: TObject);
begin
  Exit;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click no bot�o "Minimizar".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.chkAtivoClick(Sender: TObject);
begin

end;

//
// Evento de click no bot�o "Fechar".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormularioLimpar;
begin
  // Posiciona pagecontrole na primeira aba.  
  pagFormulario.ActivePageIndex := TAB_CADASTRO;

  // Limpa componentes da aba "Cadastro".
  VCLEditLimpar(edtID);
  VCLEditLimpar(edtCodigo);
  VCLEditLimpar(edtTitulo);
  VCLCheckBoxLimpar(chkBloqueado);
  VCLCheckBoxLimpar(chkAtivo);

  // Limpa componentes da aba "Auditoria".
  VCLEditLimpar(edtInsDtHr);
  VCLEditLimpar(edtInsUsuarioNome);
  VCLEditLimpar(edtUpdDtHr);
  VCLEditLimpar(edtUpdUsuarioNome);
  VCLEditLimpar(EdtUpdSeq);
end;

end.
