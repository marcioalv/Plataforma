//
// Arquivo..: Plataforma_ERP_VCL_ColigadaSelecao.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com os parâmetros de seleção de coligada.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_ColigadaSelecao;

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
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls,
  Vcl.Menus;

type
  TPlataformaERPVCLColigadaSelecao = class(TForm)
    imgFormulario: TImage;
    btnSelecionar: TBitBtn;
    btnFechar: TBitBtn;
    panFormulario: TPanel;
    btnMinimizar: TBitBtn;
    imgBackground: TImage;
    lvwLista: TListView;
    pbaProgresso: TProgressBar;
    mnuFormulario: TMainMenu;
    mniFechar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniAtualizar: TMenuItem;
    mniSelecionar: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaDblClick(Sender: TObject);
    procedure lvwListaKeyPress(Sender: TObject; var Key: Char);
    procedure mniFecharClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
    procedure mniAtualizarClick(Sender: TObject);
    procedure mniSelecionarClick(Sender: TObject);
  private
    procedure FormularioAtualizar;
    procedure FormularioSelecionar;
  public
    pubClicouFechar  : Boolean;
    pubNovo          : Boolean;
    pubLicencaID     : Integer;
    pubColigadaBaseID: Integer;
    pubColigadaID    : Integer;
    pubCodigo        : string;
    pubDescricao     : string;
  end;

var
  PlataformaERPVCLColigadaSelecao: TPlataformaERPVCLColigadaSelecao;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_ColigadaCodigo;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_ColigadaSelecao';

const
  LVW_LISTA_LICENCA_ID             : Integer = 0;
  LVW_LISTA_COLIGADA_BASE_ID       : Integer = 1;
  LVW_LISTA_COLIGADA_BASE_DESCRICAO: Integer = 2;
  LVW_LISTA_COLIGADA_ID            : Integer = 3;
  LVW_LISTA_CODIGO                 : Integer = 4;
  LVW_LISTA_DESCRICAO              : Integer = 5;
  LVW_LISTA_BLOQUEADO              : Integer = 6;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLColigadaSelecao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas.
  //
  pubClicouFechar   := True;
  pubNovo           := True;
  pubLicencaID      := 0;
  pubColigadaBaseID := 0;
  pubColigadaID     := 0;
  pubCodigo         := '';
  pubDescricao      := '';

  //
  // Limpa componentes do formulário.
  //
  VCLListViewLimpar(lvwLista);
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLColigadaSelecao.FormShow(Sender: TObject);
begin
  FormularioAtualizar;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLColigadaSelecao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

// 
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLColigadaSelecao.mniSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLColigadaSelecao.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

procedure TPlataformaERPVCLColigadaSelecao.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLColigadaSelecao.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente listview.
//
procedure TPlataformaERPVCLColigadaSelecao.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLColigadaSelecao.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLColigadaSelecao.lvwListaDblClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLColigadaSelecao.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

//
// Evento de click no botão "Confirmar".
//
procedure TPlataformaERPVCLColigadaSelecao.btnSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLColigadaSelecao.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLColigadaSelecao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para atualizar a lista do formulário.
//
procedure TPlataformaERPVCLColigadaSelecao.FormularioAtualizar;
const
  PROCEDIMENTO_NOME: string = 'FormularioAtualizar';
  ERRO_MENSAGEM    : string = 'Impossível atualizar lista de coligadas!';
var
  locADOConnection : TADOConnection;
  locADOQuery      : TADOQuery;
  locLogMensagem   : string;
  locLicencaID     : Integer;
  locListItem      : TListItem;
  locIndice        : Integer;
begin
  //
  // ID da licença.
  //
  locLicencaID := gloLicencaID;

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Limpa listview.
  //
  VCLListViewLimpar(lvwLista);

  //
  // Conexão ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(Self);

  //
  // Abre conexão com o banco de dados da aplicação.
  //
  try
    Plataforma_ERP_ADO_ConexaoAbrir(locADOConnection);
  except
    on locExcecao: Exception do
    begin
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Query.
  //
  locADOQuery                := TADOQuery.Create(Self);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Seleciona dados.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                   ');
  locADOQuery.SQL.Add('  [licenca].[licenca_id]   AS [licenca_id],              ');
  locADOQuery.SQL.Add('  [base].[base_id]         AS [coligada_base_id],        ');
  locADOQuery.SQL.Add('  [base].[descricao]       AS [coligada_base_descricao], ');
  locADOQuery.SQL.Add('  [coligada].[coligada_id] AS [coligada_id],             ');
  locADOQuery.SQL.Add('  [coligada].[codigo]      AS [codigo],                  ');
  locADOQuery.SQL.Add('  [coligada].[descricao]   AS [descricao],               ');
  locADOQuery.SQL.Add('  [coligada].[bloqueado]   AS [bloqueado]                ');
  locADOQuery.SQL.Add('FROM                                                     ');
  locADOQuery.SQL.Add('  [coligada] WITH (NOLOCK)                               ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                        ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [coligada].[coligada_base_id]  ');
  locADOQuery.SQL.Add('  INNER JOIN [licenca] WITH (NOLOCK)                     ');
  locADOQuery.SQL.Add('    ON [licenca].[licenca_id] = [coligada].[licenca_id]  ');
  locADOQuery.SQL.Add('WHERE                                                    ');
  locADOQuery.SQL.Add('  [coligada].[licenca_id] = :licenca_id AND              ');
  locADOQuery.SQL.Add('  [coligada].[ativo]      = ''S''                        ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value := locLicencaID;

  if pubNovo then
  begin
    locADOQuery.SQL.Add(' AND [coligada].[bloqueado] = ''N'' ');
  end;

  //
  // Order by.
  //
  locADOQuery.SQL.Add('ORDER BY                  ');
  locADOQuery.SQL.Add('  [coligada].[codigo] ASC ');


  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar os registros na tabela [coligada]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  locADOQuery.Last;
  locADOQuery.First;

  //
  // Ajusta progressbar.
  //
  VCLProgressBarInicializar(pbaProgresso, locADOQuery.RecordCount);

  //
  // Insere registros no listview.
  //
  locIndice := VCL_NENHUM_INDICE;
  
  if locADOQuery.RecordCount > 0 then
  begin  
    lvwLista.Items.BeginUpdate;
    while not locADOQuery.EOF do
    begin
      VCLProgressBarIncrementar(pbaProgresso);
    
      locListItem         := lvwLista.Items.Add;
      locListItem.Caption := '';
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('licenca_id').AsInteger));
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('coligada_base_id').AsInteger));
      locListItem.SubItems.Add(locADOQuery.FieldByName('coligada_base_descricao').AsString);
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('coligada_id').AsInteger));
      locListItem.SubItems.Add(locADOQuery.FieldByName('codigo').AsString);
      locListItem.SubItems.Add(locADOQuery.FieldByName('descricao').AsString);
      locListItem.SubItems.Add(FlagSimNaoStringConverter(locADOQuery.FieldByName('bloqueado').AsString));

      if (pubColigadaBaseID = locADOQuery.FieldByName('coligada_base_id').AsInteger) and
         (pubColigadaID     = locADOQuery.FieldByName('coligada_id').AsInteger) then
      begin
        locIndice := (lvwLista.Items.Count - 1);
      end;

      locADOQuery.Next;
    end;
    lvwLista.Items.EndUpdate;
  end;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);
  VCLProgressBarLimpar(pbaProgresso);
  VCLCursorTrocar;

  //
  // Foco no item correto da lista.
  //
  if locIndice <> VCL_NENHUM_INDICE then
  begin
    VCLListViewItemPosicionar(lvwLista, locIndice);
  end;
  VCLListViewFocar(lvwLista);
end;

//
// Procedimento para selecionar uma das linhas da lista.
//
procedure TPlataformaERPVCLColigadaSelecao.FormularioSelecionar;
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
