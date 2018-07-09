//
// Arquivo..: Plataforma_ERP_VCL_TiposUsuariosLista.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio para exibir a lista de tipos de usu�rios cadastrados.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_TiposUsuariosLista;

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
  Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TPlataformaERPVCLTiposUsuariosLista = class(TForm)
    imgFormulario: TImage;
    panFormulario: TPanel;
    btnAtualizar: TBitBtn;
    lvwLista: TListView;
    btnFechar: TBitBtn;
    btnMinimizar: TBitBtn;
    btnSelecionar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaDblClick(Sender: TObject);
    procedure lvwListaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    procedure FormularioCadastroExibir;
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLTiposUsuariosLista: TPlataformaERPVCLTiposUsuariosLista;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_VCL_TiposUsuariosCadastro;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosLista.FormCreate(Sender: TObject);
begin
  Exit;
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosLista.FormShow(Sender: TObject);
begin
  Exit;
end;

//
// Evento de ativa��o do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosLista.FormActivate(Sender: TObject);
begin
  // Maximizar formul�rio.
  VCLSDIMaximizar(Self);
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosLista.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de controle da lista.
//
procedure TPlataformaERPVCLTiposUsuariosLista.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLTiposUsuariosLista.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLTiposUsuariosLista.lvwListaDblClick(Sender: TObject);
begin
  FormularioCadastroExibir;
end;

procedure TPlataformaERPVCLTiposUsuariosLista.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

//
// Evento de click no bot�o "Atualizar".
//
procedure TPlataformaERPVCLTiposUsuariosLista.btnAtualizarClick(Sender: TObject);
begin
  Exit;
end;

//
// Evento de click no bot�o "Selecionar".
//
procedure TPlataformaERPVCLTiposUsuariosLista.btnSelecionarClick(Sender: TObject);
begin
  FormularioCadastroExibir;
end;

//
// Evento de click no bot�o "Minimizar".
//
procedure TPlataformaERPVCLTiposUsuariosLista.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "Fechar".
//
procedure TPlataformaERPVCLTiposUsuariosLista.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para exibir o formul�rio de cadastro.
//
procedure TPlataformaERPVCLTiposUsuariosLista.FormularioCadastroExibir;
var
  locFormulario: TPlataformaERPVCLTiposUsuariosCadastro;
begin
  locFormulario := TPlataformaERPVCLTiposUsuariosCadastro.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;


end.
