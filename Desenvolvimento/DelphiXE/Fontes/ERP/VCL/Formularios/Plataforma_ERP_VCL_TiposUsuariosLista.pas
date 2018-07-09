//
// Arquivo..: Plataforma_ERP_VCL_TiposUsuariosLista.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário para exibir a lista de tipos de usuários cadastrados.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
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
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosLista.FormCreate(Sender: TObject);
begin
  Exit;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosLista.FormShow(Sender: TObject);
begin
  Exit;
end;

//
// Evento de ativação do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosLista.FormActivate(Sender: TObject);
begin
  // Maximizar formulário.
  VCLSDIMaximizar(Self);
end;

//
// Evento de pressionamento de teclas no formulário.
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
// Evento de click no botão "Atualizar".
//
procedure TPlataformaERPVCLTiposUsuariosLista.btnAtualizarClick(Sender: TObject);
begin
  Exit;
end;

//
// Evento de click no botão "Selecionar".
//
procedure TPlataformaERPVCLTiposUsuariosLista.btnSelecionarClick(Sender: TObject);
begin
  FormularioCadastroExibir;
end;

//
// Evento de click no botão "Minimizar".
//
procedure TPlataformaERPVCLTiposUsuariosLista.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "Fechar".
//
procedure TPlataformaERPVCLTiposUsuariosLista.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para exibir o formulário de cadastro.
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
