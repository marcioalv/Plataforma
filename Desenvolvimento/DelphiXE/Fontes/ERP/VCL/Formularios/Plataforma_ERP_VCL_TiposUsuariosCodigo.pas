unit Plataforma_ERP_VCL_TiposUsuariosCodigo;

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
  Vcl.ComCtrls;

type
  TPlataformaERPVCLTiposUsuariosCodigo = class(TForm)
    btnConfirmar: TBitBtn;
    btnFechar: TBitBtn;
    panFormulario: TPanel;
    btnMinimizar: TBitBtn;
    imgFormulario: TImage;
    lvwLista: TListView;
    imgBackground: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaDblClick(Sender: TObject);
    procedure lvwListaKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    procedure FormularioAtualizar;
    procedure FormularioConfirmar;
  public
    pubClicouFechar : Boolean;
    pubADOQuery     : TADOQuery;
    pubBaseID       : Integer;
    pubLicencaID    : Integer;
    pubTipoUsuarioID: Integer;
  end;

var
  PlataformaERPVCLTiposUsuariosCodigo: TPlataformaERPVCLTiposUsuariosCodigo;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL;

const
  LVW_LISTA_BASE_ID        : Byte = 0;
  LVW_LISTA_BASE_TITULO    : Byte = 1;
  LVW_LISTA_LICENCA_ID     : Byte = 2;
  LVW_LISTA_TIPO_USUARIO_ID: Byte = 3;
  LVW_LISTA_CODIGO         : Byte = 4;
  LVW_LISTA_DESCRICAO      : Byte = 5;
  LVW_LISTA_BLOQUEADO      : Byte = 6;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosCodigo.FormCreate(Sender: TObject);
begin
  pubClicouFechar := True;
  pubADOQuery     := nil;
end;

//
// Evento se exibição do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosCodigo.FormShow(Sender: TObject);
begin
  FormularioAtualizar;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLTiposUsuariosCodigo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos do componente "Lista".
//
procedure TPlataformaERPVCLTiposUsuariosCodigo.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLTiposUsuariosCodigo.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLTiposUsuariosCodigo.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

procedure TPlataformaERPVCLTiposUsuariosCodigo.lvwListaDblClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

//
// Evento de click no botão "Confirmar".
//
procedure TPlataformaERPVCLTiposUsuariosCodigo.btnConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

//
// Evento de click no botão "Minimizar".
//
procedure TPlataformaERPVCLTiposUsuariosCodigo.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "Fechar".
//
procedure TPlataformaERPVCLTiposUsuariosCodigo.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para atualizar a lista.
//
procedure TPlataformaERPVCLTiposUsuariosCodigo.FormularioAtualizar;
var
  locListItem: TListItem;
begin
  //
  // Inicializa posição da query.
  //
  pubADOQuery.Last;
  pubADOQuery.First;

  //
  // Percorre query lendo cada um dos registros.
  //
  while not pubADOQuery.EOF do
  begin
    //
    // Insere registros no listview.
    //
    locListItem         := lvwLista.Items.Add;
    locListItem.Caption := '';
    locListItem.SubItems.Add(IntegerStringConverter(pubADOQuery.FieldByName('base_id').AsInteger));
    locListItem.SubItems.Add(pubADOQuery.FieldByName('base_titulo').AsString);
    locListItem.SubItems.Add(IntegerStringConverter(pubADOQuery.FieldByName('licenca_id').AsInteger));
    locListItem.SubItems.Add(IntegerStringConverter(pubADOQuery.FieldByName('tipo_usuario_id').AsInteger));
    locListItem.SubItems.Add(pubADOQuery.FieldByName('codigo').AsString);
    locListItem.SubItems.Add(pubADOQuery.FieldByName('descricao').AsString);
    locListItem.SubItems.Add(FlagSimNaoStringConverter(pubADOQuery.FieldByName('bloqueado').AsString));

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
  VCLListViewFocar(lvwLista);
end;

//
// Procedimento para confirmar a seleção de uma linha da lista.
//
procedure TPlataformaERPVCLTiposUsuariosCodigo.FormularioConfirmar;
var
  locIndice: Integer;
begin
  locIndice := VCLListViewIndiceItemRetornar(lvwLista);
  if locIndice = VCL_NENHUM_INDICE then Exit;

  pubClicouFechar  := False;
  pubBaseID        := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_BASE_ID]);
  pubLicencaID     := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_LICENCA_ID]);
  pubTipoUsuarioID := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_TIPO_USUARIO_ID]);
  Close;
end;

end.
