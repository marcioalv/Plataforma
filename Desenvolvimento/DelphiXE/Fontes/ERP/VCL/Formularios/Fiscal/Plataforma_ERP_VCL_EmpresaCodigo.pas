//
// Arquivo..: Plataforma_ERP_VCL_EmpresaCodigo.pas
// Projeto..: ERP
// Fonte....: Unit
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário para visualizar empresas com o mesmo código.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_EmpresaCodigo;

interface

uses
  Data.Win.ADODB,
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
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls,
  Vcl.Menus;

type
  TPlataformaERPVCLEmpresaCodigo = class(TForm)
    btnSelecionar: TBitBtn;
    btnFechar: TBitBtn;
    panFormulario: TPanel;
    btnMinimizar: TBitBtn;
    imgFormulario: TImage;
    lvwLista: TListView;
    imgBackground: TImage;
    mnuFormulario: TMainMenu;
    mniFechar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniSelecionar: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaDblClick(Sender: TObject);
    procedure lvwListaKeyPress(Sender: TObject; var Key: Char);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mniFecharClick(Sender: TObject);
    procedure mniSelecionarClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
  private
    procedure FormularioAtualizar;
    procedure FormularioSelecionar;
  public
    pubClicouFechar : Boolean;
    pubADOQuery     : TADOQuery;
    pubLicencaID    : Integer;
    pubEmpresaBaseID: Integer;
    pubEmpresaID    : Integer;
    pubCodigo       : string;
    pubDescricao    : string;
  end;

var
  PlataformaERPVCLEmpresaCodigo: TPlataformaERPVCLEmpresaCodigo;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_VCL_Generico;

const
  LVW_LISTA_LICENCA_ID         : Byte = 0;
  LVW_LISTA_EMPRESA_BASE_ID    : Byte = 1;
  LVW_LISTA_EMPRESA_BASE_TITULO: Byte = 2;
  LVW_LISTA_EMPRESA_ID         : Byte = 3;
  LVW_LISTA_CODIGO             : Byte = 4;
  LVW_LISTA_DESCRICAO          : Byte = 5;
  LVW_LISTA_BLOQUEADO          : Byte = 6;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLEmpresaCodigo.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas do formulário.
  //
  pubClicouFechar  := True;
  pubADOQuery      := nil;
  pubLicencaID     := 0;
  pubEmpresaBaseID := 0;
  pubEmpresaID     := 0;
  pubCodigo        := '';
  pubDescricao     := '';

  //
  // Background do formulário.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);
end;

//
// Evento se exibição do formulário.
//
procedure TPlataformaERPVCLEmpresaCodigo.FormShow(Sender: TObject);
begin
  //
  // Atualiza o formulário.
  //
  FormularioAtualizar;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLEmpresaCodigo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de fechamento do formulário.
//
procedure TPlataformaERPVCLEmpresaCodigo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //
  // Para preservar a memória do sistema o ADOQuery precisa ser destruído.
  //
  FreeAndNil(pubADOQuery);
end;

//
// Eventos de click nas opções de menu.
//
procedure TPlataformaERPVCLEmpresaCodigo.mniSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLEmpresaCodigo.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLEmpresaCodigo.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "Lista".
//
procedure TPlataformaERPVCLEmpresaCodigo.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLEmpresaCodigo.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLEmpresaCodigo.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

procedure TPlataformaERPVCLEmpresaCodigo.lvwListaDblClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

//
// Evento de click no botão "selecionar".
//
procedure TPlataformaERPVCLEmpresaCodigo.btnSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLEmpresaCodigo.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLEmpresaCodigo.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para atualizar a lista.
//
procedure TPlataformaERPVCLEmpresaCodigo.FormularioAtualizar;
var
  locListItem: TListItem;
  locIndice  : Integer;
begin
  //
  // Inicializa posição da query.
  //
  pubADOQuery.Last;
  pubADOQuery.First;

  //
  // Percorre query lendo cada um dos registros.
  //
  locIndice := VCL_NENHUM_INDICE;

  while not pubADOQuery.EOF do
  begin
    //
    // Insere registros no listview.
    //
    locListItem         := lvwLista.Items.Add;
    locListItem.Caption := '';
    locListItem.SubItems.Add(IntegerStringConverter(pubADOQuery.FieldByName('licenca_id').AsInteger));
    locListItem.SubItems.Add(IntegerStringConverter(pubADOQuery.FieldByName('empresa_base_id').AsInteger));
    locListItem.SubItems.Add(pubADOQuery.FieldByName('empresa_base_titulo').AsString);
    locListItem.SubItems.Add(IntegerStringConverter(pubADOQuery.FieldByName('empresa_id').AsInteger));
    locListItem.SubItems.Add(pubADOQuery.FieldByName('codigo').AsString);
    locListItem.SubItems.Add(pubADOQuery.FieldByName('descricao').AsString);
    locListItem.SubItems.Add(FlagSimNaoStringConverter(pubADOQuery.FieldByName('bloqueado').AsString));

    //
    // O foco deve ficar no registro já informado.
    //
    if (pubEmpresaBaseID = pubADOQuery.FieldByName('base_id').AsInteger) and
       (pubEmpresaID     = pubADOQuery.FieldByName('empresa_id').AsInteger) then
    begin
      locIndice := (lvwLista.Items.Count - 1);
    end;

    //
    // Próximo registro.
    //
    pubADOQuery.Next;
  end;
  
  //
  // Finaliza query.
  //
  pubADOQuery.Close;
  FreeAndNil(pubADOQuery);

  //
  // Posiciona foco.
  //
  if locIndice <> VCL_NENHUM_INDICE then
  begin
    VCLListViewItemPosicionar(lvwLista, locIndice);
  end;
  VCLListViewFocar(lvwLista);
end;

//
// Procedimento para confirmar a seleção de uma linha da lista.
//
procedure TPlataformaERPVCLEmpresaCodigo.FormularioSelecionar;
var
  locIndice: Integer;
begin
  locIndice := VCLListViewIndiceItemRetornar(lvwLista);
  if locIndice = VCL_NENHUM_INDICE then Exit;

  pubClicouFechar  := False;
  pubLicencaID     := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_LICENCA_ID]);
  pubEmpresaBaseID := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_EMPRESA_BASE_ID]);
  pubEmpresaID     := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_EMPRESA_ID]);
  pubCodigo        := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_CODIGO];
  pubDescricao     := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_DESCRICAO];
  Close;
end;

end.
