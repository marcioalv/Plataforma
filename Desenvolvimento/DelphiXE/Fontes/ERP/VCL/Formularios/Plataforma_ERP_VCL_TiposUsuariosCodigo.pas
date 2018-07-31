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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure FormularioAtualizar;
    procedure FormularioConfirmar;
  public
    pubClicouFechar     : Boolean;
    pubADOQuery         : TADOQuery;
    pubLicencaID        : Integer;
    pubTipoUsuarioBaseID: Integer;
    pubTipoUsuarioID    : Integer;
    pubCodigo           : string;
    pubDescricao        : string;
  end;

var
  PlataformaERPVCLTiposUsuariosCodigo: TPlataformaERPVCLTiposUsuariosCodigo;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_VCL_Generico;

const
  LVW_LISTA_LICENCA_ID     : Byte = 0;
  LVW_LISTA_BASE_ID        : Byte = 1;
  LVW_LISTA_BASE_TITULO    : Byte = 2;
  LVW_LISTA_TIPO_USUARIO_ID: Byte = 3;
  LVW_LISTA_CODIGO         : Byte = 4;
  LVW_LISTA_DESCRICAO      : Byte = 5;
  LVW_LISTA_BLOQUEADO      : Byte = 6;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosCodigo.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas do formul�rio.
  //
  pubClicouFechar      := True;
  pubADOQuery          := nil;
  pubLicencaID         := 0;
  pubTipoUsuarioBaseID := 0;
  pubTipoUsuarioID     := 0;
  pubCodigo            := '';
  pubDescricao         := '';

  //
  // Background do formul�rio.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);
end;

//
// Evento se exibi��o do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosCodigo.FormShow(Sender: TObject);
begin
  //
  // Atualiza o formul�rio.
  //
  FormularioAtualizar;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosCodigo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de fechamento do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosCodigo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //
  // Para preservar a mem�ria do sistema o ADOQuery precisa ser destru�do.
  //
  FreeAndNil(pubADOQuery);
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
// Evento de click no bot�o "Confirmar".
//
procedure TPlataformaERPVCLTiposUsuariosCodigo.btnConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

//
// Evento de click no bot�o "Minimizar".
//
procedure TPlataformaERPVCLTiposUsuariosCodigo.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "Fechar".
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
  locIndice  : Integer;
begin
  //
  // Inicializa posi��o da query.
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
    locListItem.SubItems.Add(IntegerStringConverter(pubADOQuery.FieldByName('base_id').AsInteger));
    locListItem.SubItems.Add(pubADOQuery.FieldByName('base_titulo').AsString);
    locListItem.SubItems.Add(IntegerStringConverter(pubADOQuery.FieldByName('tipo_usuario_id').AsInteger));
    locListItem.SubItems.Add(pubADOQuery.FieldByName('codigo').AsString);
    locListItem.SubItems.Add(pubADOQuery.FieldByName('descricao').AsString);
    locListItem.SubItems.Add(FlagSimNaoStringConverter(pubADOQuery.FieldByName('bloqueado').AsString));

    //
    // O foco deve ficar no registro j� informado.
    //
    if (pubTipoUsuarioBaseID = pubADOQuery.FieldByName('base_id').AsInteger) and
       (pubTipoUsuarioID     = pubADOQuery.FieldByName('tipo_usuario_id').AsInteger) then
    begin
      locIndice := (lvwLista.Items.Count - 1);
    end;

    //
    // Pr�ximo registro.
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
// Procedimento para confirmar a sele��o de uma linha da lista.
//
procedure TPlataformaERPVCLTiposUsuariosCodigo.FormularioConfirmar;
var
  locIndice: Integer;
begin
  locIndice := VCLListViewIndiceItemRetornar(lvwLista);
  if locIndice = VCL_NENHUM_INDICE then Exit;

  pubClicouFechar      := False;
  pubLicencaID         := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_LICENCA_ID]);
  pubTipoUsuarioBaseID := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_BASE_ID]);
  pubTipoUsuarioID     := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_TIPO_USUARIO_ID]);
  pubCodigo            := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_CODIGO];
  pubDescricao         := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_DESCRICAO];
  Close;
end;

end.
