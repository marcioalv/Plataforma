//
// Arquivo..: Plataforma_ERP_VCL_ColigadaCodigo.pas
// Projeto..: ERP
// Fonte....: Unit
// Cria��o..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio para visualizar coligadas com o mesmo c�digo.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_ColigadaCodigo;

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
  TPlataformaERPVCLColigadaCodigo = class(TForm)
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
    pubClicouFechar  : Boolean;
    pubADOQuery      : TADOQuery;
    pubLicencaID     : Integer;
    pubColigadaBaseID: Integer;
    pubColigadaID    : Integer;
    pubCodigo        : string;
    pubDescricao     : string;
  end;

var
  PlataformaERPVCLColigadaCodigo: TPlataformaERPVCLColigadaCodigo;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_VCL_Generico;

const
  LVW_LISTA_LICENCA_ID          : Byte = 0;
  LVW_LISTA_COLIGADA_BASE_ID    : Byte = 1;
  LVW_LISTA_COLIGADA_BASE_TITULO: Byte = 2;
  LVW_LISTA_COLIGADA_ID         : Byte = 3;
  LVW_LISTA_CODIGO              : Byte = 4;
  LVW_LISTA_DESCRICAO           : Byte = 5;
  LVW_LISTA_BLOQUEADO           : Byte = 6;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLColigadaCodigo.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas do formul�rio.
  //
  pubClicouFechar   := True;
  pubADOQuery       := nil;
  pubLicencaID      := 0;
  pubColigadaBaseID := 0;
  pubColigadaID     := 0;
  pubCodigo         := '';
  pubDescricao      := '';

  //
  // Background do formul�rio.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);
end;

//
// Evento se exibi��o do formul�rio.
//
procedure TPlataformaERPVCLColigadaCodigo.FormShow(Sender: TObject);
begin
  //
  // Atualiza o formul�rio.
  //
  FormularioAtualizar;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLColigadaCodigo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de fechamento do formul�rio.
//
procedure TPlataformaERPVCLColigadaCodigo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //
  // Para preservar a mem�ria do sistema o ADOQuery precisa ser destru�do.
  //
  FreeAndNil(pubADOQuery);
end;

//
// Eventos de click nas op��es de menu.
//
procedure TPlataformaERPVCLColigadaCodigo.mniSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLColigadaCodigo.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLColigadaCodigo.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "Lista".
//
procedure TPlataformaERPVCLColigadaCodigo.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLColigadaCodigo.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLColigadaCodigo.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

procedure TPlataformaERPVCLColigadaCodigo.lvwListaDblClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

//
// Evento de click no bot�o "selecionar".
//
procedure TPlataformaERPVCLColigadaCodigo.btnSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

//
// Evento de click no bot�o "minimizar".
//
procedure TPlataformaERPVCLColigadaCodigo.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLColigadaCodigo.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para atualizar a lista.
//
procedure TPlataformaERPVCLColigadaCodigo.FormularioAtualizar;
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
    locListItem.SubItems.Add(IntegerStringConverter(pubADOQuery.FieldByName('coligada_base_id').AsInteger));
    locListItem.SubItems.Add(pubADOQuery.FieldByName('coligada_base_titulo').AsString);
    locListItem.SubItems.Add(IntegerStringConverter(pubADOQuery.FieldByName('coligada_id').AsInteger));
    locListItem.SubItems.Add(pubADOQuery.FieldByName('codigo').AsString);
    locListItem.SubItems.Add(pubADOQuery.FieldByName('descricao').AsString);
    locListItem.SubItems.Add(FlagSimNaoStringConverter(pubADOQuery.FieldByName('bloqueado').AsString));

    //
    // O foco deve ficar no registro j� informado.
    //
    if (pubColigadaBaseID = pubADOQuery.FieldByName('base_id').AsInteger) and
       (pubColigadaID     = pubADOQuery.FieldByName('coligada_id').AsInteger) then
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
procedure TPlataformaERPVCLColigadaCodigo.FormularioSelecionar;
var
  locIndice: Integer;
begin
  locIndice := VCLListViewIndiceItemRetornar(lvwLista);
  if locIndice = VCL_NENHUM_INDICE then Exit;

  pubClicouFechar   := False;
  pubLicencaID      := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_LICENCA_ID]);
  pubColigadaBaseID := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_COLIGADA_BASE_ID]);
  pubColigadaID     := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_COLIGADA_ID]);
  pubCodigo         := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_CODIGO];
  pubDescricao      := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_DESCRICAO];
  Close;
end;

end.
