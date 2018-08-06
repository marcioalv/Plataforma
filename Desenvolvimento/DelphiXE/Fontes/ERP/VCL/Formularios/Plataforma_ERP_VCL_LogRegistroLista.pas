//
// Arquivo..: Plataforma_ERP_VCL_LogRegistroLista.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com a lista de logs de um registro.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_LogRegistroLista;

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
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.Menus;

type
  TPlataformaERPVCLLogRegistroLista = class(TForm)
    imgFormulario: TImage;
    panFormulario: TPanel;
    lvwLista: TListView;
    imgBackground: TImage;
    btnFechar: TBitBtn;
    btnMinimizar: TBitBtn;
    btnSelecionar: TBitBtn;
    mnuFormulario: TMainMenu;
    mniFechar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniSelecionar: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaDblClick(Sender: TObject);
    procedure lvwListaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mniMinimizarClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure mniSelecionarClick(Sender: TObject);
  private
    procedure FormularioAtualizar;
    procedure FormularioSelecionar;
  public
    pubIdentificador: string;
    pubADOQuery     : TADOQuery;
  end;

var
  PlataformaERPVCLLogRegistroLista: TPlataformaERPVCLLogRegistroLista;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_VCL_Generico,
  Plataforma_ERP_VCL_LogRegistroExibir;

const
  LVW_LISTA_SEQUENCIAL             : Byte =  0;
  LVW_LISTA_LOG_LOCAL_DT_HR        : Byte =  1;
  LVW_LISTA_LOG_SERVER_DT_HR       : Byte =  2;
  LVW_LISTA_LOG_BASE_ID            : Byte =  3;
  LVW_LISTA_LOG_BASE_DESCRICAO     : Byte =  4;
  LVW_LISTA_REGISTRO_ACAO_ID       : Byte =  5;
  LVW_LISTA_REGISTRO_ACAO_DESCRICAO: Byte =  6;
  LVW_LISTA_HOST_NAME              : Byte =  7;
  LVW_LISTA_USER_NAME              : Byte =  8;
  LVW_LISTA_USUARIO_BASE_ID        : Byte =  9;
  LVW_LISTA_USUARIO_ID             : Byte = 10;
  LVW_LISTA_USUARIO_NOME           : Byte = 11;
  LVW_LISTA_MENSAGEM               : Byte = 12;
  LVW_LISTA_DADOS                  : Byte = 13;
  
//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLLogRegistroLista.FormCreate(Sender: TObject);
begin
  pubIdentificador := '';
  pubADOQuery      := nil;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLLogRegistroLista.FormShow(Sender: TObject);
begin
  //
  // Background do formulário.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Ajusta tamanhos das colunas do listview.
  //
  VCLListViewColunarDimensionar(lvwLista);

  //
  // Atualiza informações do listview.
  //
  FormularioAtualizar;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLLogRegistroLista.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de fechamento do formulário.
//
procedure TPlataformaERPVCLLogRegistroLista.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //
  // Para preservar a memória do sistema o ADOQuery precisa ser destruído.
  //
  //FreeAndNil(pubADOQuery);
end;

//
// Evento de click nas opções do menu.
//
procedure TPlataformaERPVCLLogRegistroLista.mniSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLLogRegistroLista.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLLogRegistroLista.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "lista".
//
procedure TPlataformaERPVCLLogRegistroLista.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLLogRegistroLista.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLLogRegistroLista.lvwListaDblClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLLogRegistroLista.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

//
// Evento de click no botão "Selecionar".
//
procedure TPlataformaERPVCLLogRegistroLista.btnSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

//
// Evento de click no botão "Minimizar".
//
procedure TPlataformaERPVCLLogRegistroLista.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "Fechar".
//
procedure TPlataformaERPVCLLogRegistroLista.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// FormularioAtualizar.
//
procedure TPlataformaERPVCLLogRegistroLista.FormularioAtualizar;
var
  locListItem: TListItem;
begin
  //
  // Título do formulário.
  //
  Self.Caption := 'Exibindo lista de logs de registro';

  if pubIdentificador <> '' then
  begin
    Self.Caption := Self.Caption + ' - ' + pubIdentificador;
  end;

  //
  // Carrega lista.
  //
  pubADOQuery.Last;
  pubADOQuery.First;

  while not pubADOQuery.Eof do
  begin
    locListItem         := lvwLista.Items.Add;
    locListItem.Caption := '';
    locListItem.SubItems.Add(IntegerStringConverter(pubADOQuery.FieldByName('sequencial').AsInteger));
    locListItem.SubItems.Add(DateTimeStringConverter(pubADOQuery.FieldByName('log_local_dt_hr').AsDateTime,  'dd/mm/yyyy hh:nn:ss.zzz'));
    locListItem.SubItems.Add(DateTimeStringConverter(pubADOQuery.FieldByName('log_server_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn:ss.zzz'));
    locListItem.SubItems.Add(IntegerStringConverter(pubADOQuery.FieldByName('log_base_id').AsInteger));
    locListItem.SubItems.Add(pubADOQuery.FieldByName('log_base_descricao').AsString);
    locListItem.SubItems.Add(IntegerStringConverter(pubADOQuery.FieldByName('registro_acao_id').AsInteger));
    locListItem.SubItems.Add(pubADOQuery.FieldByName('registro_acao_descricao').AsString);
    locListItem.SubItems.Add(pubADOQuery.FieldByName('host_name').AsString);
    locListItem.SubItems.Add(pubADOQuery.FieldByName('user_name').AsString);
    locListItem.SubItems.Add(IntegerStringConverter(pubADOQuery.FieldByName('usuario_base_id').AsInteger));
    locListItem.SubItems.Add(IntegerStringConverter(pubADOQuery.FieldByName('usuario_id').AsInteger));
    locListItem.SubItems.Add(pubADOQuery.FieldByName('usuario_nome').AsString);
    locListItem.SubItems.Add(pubADOQuery.FieldByName('mensagem').AsString);
    locListItem.SubItems.Add(pubADOQuery.FieldByName('dados').AsString);

    pubADOQuery.Next;
  end;

  VCLListViewFocar(lvwLista);
end;

//
// Procedimento para selecionar uma das linhas do listview e exibir seus detalhes.
//
procedure TPlataformaERPVCLLogRegistroLista.FormularioSelecionar;
var
  locIndice    : Integer;
  locFormulario: TPlataformaERPVCLLogRegistroExibir;
begin
  locIndice := VCLListViewIndiceItemRetornar(lvwLista);
  if locIndice = VCL_NENHUM_INDICE then Exit;

  locFormulario                          := TPlataformaERPVCLLogRegistroExibir.Create(Self);
  locFormulario.pubIdentificador         := pubIdentificador;
  locFormulario.pubSequencial            := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_SEQUENCIAL]);
  locFormulario.pubLogLocalDtHr          := StringDateTimeConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_LOG_LOCAL_DT_HR]);
  locFormulario.pubLogServerDtHr         := StringDateTimeConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_LOG_SERVER_DT_HR]);
  locFormulario.pubLogBaseID             := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_LOG_BASE_ID]);
  locFormulario.pubLogBaseDescricao      := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_LOG_BASE_DESCRICAO];
  locFormulario.pubRegistroAcaoID        := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_REGISTRO_ACAO_ID]);
  locFormulario.pubRegistroAcaoDescricao := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_REGISTRO_ACAO_DESCRICAO];
  locFormulario.pubHostName              := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_HOST_NAME];
  locFormulario.pubUserName              := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_USER_NAME];
  locFormulario.pubUsuarioBaseID         := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_USUARIO_BASE_ID]);
  locFormulario.pubUsuarioID             := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_USUARIO_ID]);
  locFormulario.pubUsuarioNome           := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_USUARIO_NOME];
  locFormulario.pubMensagem              := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_MENSAGEM];
  locFormulario.pubDados                 := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_DADOS];
  
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

end.
