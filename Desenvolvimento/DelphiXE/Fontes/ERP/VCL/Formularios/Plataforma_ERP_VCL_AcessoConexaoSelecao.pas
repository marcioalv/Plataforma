
unit Plataforma_ERP_VCL_AcessoConexaoSelecao;

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
  Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.Buttons, Vcl.Imaging.pngimage;

const
  LVW_COLUNA_ITEM  : Integer = 0;
  LVW_COLUNA_TITULO: Integer = 1;

type
  TPlataformaERPVCLAcessoConexaoSelecao = class(TForm)
    panFormulario: TPanel;
    lvwLista: TListView;
    imgFormulario: TImage;
    imgBackground: TImage;
    btnFechar: TBitBtn;
    btnMinimizar: TBitBtn;
    btnSelecionar: TBitBtn;
    mnuFormulario: TMainMenu;
    mniFechar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniSelecionar: TMenuItem;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaDblClick(Sender: TObject);
    procedure lvwListaKeyPress(Sender: TObject; var Key: Char);
    procedure lvwListaColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure btnFecharClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure mniSelecionarClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
  private
    priListViewColuna    : Integer;
    priListViewAscendente: Boolean;
    
    procedure ComponentesLimpar;
    procedure ComponentesControlar;
    procedure FormularioSelecionar;
    procedure FormularioAtualizar;
  public
    pubClicouSair: Boolean;
    pubItem      : Integer;
    pubTitulo    : string;
  end;

var
  PlataformaERPVCLAcessoConexaoSelecao: TPlataformaERPVCLAcessoConexaoSelecao;

implementation

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_VCL_Generico;

{$R *.dfm}

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis privadas do formul�rio.
  //
  priListViewColuna     := 0;
  priListViewAscendente := True;
  
  //
  // Inicializa vari�veis p�blicas.
  //
  pubClicouSair := True;
  pubItem       := 0;
  pubTitulo     := '';
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormShow(Sender: TObject);
begin
  //
  // Background do formul�rio.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Carrega lista de conex�es cadastradas.
  //
  FormularioAtualizar;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nos itens do menu.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.mniSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLAcessoConexaoSelecao.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLAcessoConexaoSelecao.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos da lista.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.lvwListaColumnClick(Sender: TObject; Column: TListColumn);
begin
  VCLListViewColunaClicar(Sender, Column, priListViewColuna, priListViewAscendente);
end;

procedure TPlataformaERPVCLAcessoConexaoSelecao.lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  VCLListViewComparar(Sender, Item1, Item2, Compare, priListViewColuna, priListViewAscendente);
end;

procedure TPlataformaERPVCLAcessoConexaoSelecao.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLAcessoConexaoSelecao.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLAcessoConexaoSelecao.lvwListaDblClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLAcessoConexaoSelecao.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

//
// Evento de click no bot�o "selecionar".
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.btnSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

//
// Evento de click no bot�o "minimizar'.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.ComponentesLimpar;
begin
  VCLListViewLimpar(lvwLista);
  ComponentesControlar;
end;

//
// Procedimento para controlar a exibi��o dos componentes do formul�rio.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.ComponentesControlar;
begin
  mniSelecionar.Visible := (lvwLista.Items.Count > 0);
  btnSelecionar.Visible := mniSelecionar.Visible;
end;

//
// Procedimento para selecionar uma das conex�es configuradas.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormularioSelecionar;
var
  locIndice: Integer;
begin
  //
  // Determina o item da linha selecionada.
  //
  if VCLListViewIndiceItemRetornar(lvwLista) = VCL_NENHUM_INDICE then
  begin
    Exit;
  end;

  locIndice := lvwLista.Selected.Index;

  //
  // Define o valor do item.
  //
  pubItem   := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_ITEM]);
  pubTitulo := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_COLUNA_TITULO];

  //
  // Usu�rio n�o clicou em sair.
  //
  pubClicouSair := False;

  //
  // Fecha formul�rio.
  //
  Close;
end;

//
// Procedimento para atualizar a lista de conex�es configuradas.
//
procedure TPlataformaERPVCLAcessoConexaoSelecao.FormularioAtualizar;
var
  locContador: Integer;
  locListItem: TListItem;
begin
  //
  // Troca o cursor.
  //
  VCLCursorTrocar(True);

  //
  // Limpa componentes.
  //
  ComponentesLimpar;

  //
  // Controla a exibi��o dos componentes.
  //
  ComponentesControlar;

  //
  // Troca o cursor.
  //
  VCLCursorTrocar;

  //
  // Foco no listview.
  //
  VCLListViewFocar(lvwLista);
end;

end.
