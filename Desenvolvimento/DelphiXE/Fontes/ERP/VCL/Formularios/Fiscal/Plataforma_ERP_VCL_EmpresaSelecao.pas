//
// Arquivo..: Plataforma_ERP_VCL_EmpresaSelecao.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com os parâmetros de seleção de empresa.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_EmpresaSelecao;

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
  TPlataformaERPVCLEmpresaSelecao = class(TForm)
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
    pubClicouFechar : Boolean;
    pubNovo         : Boolean;
    pubLicencaID    : Integer;
    pubEmpresaBaseID: Integer;
    pubEmpresaID    : Integer;
    pubCodigo       : string;
    pubDescricao    : string;
  end;

var
  PlataformaERPVCLEmpresaSelecao: TPlataformaERPVCLEmpresaSelecao;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_EmpresaCodigo;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_EmpresaSelecao';

const
  LVW_LISTA_LICENCA_ID             : Integer = 0;
  LVW_LISTA_EMPRESA_BASE_ID        : Integer = 1;
  LVW_LISTA_EMPRESA_BASE_DESCRICAO : Integer = 2;
  LVW_LISTA_EMPRESA_ID             : Integer = 3;
  LVW_LISTA_CODIGO                 : Integer = 4;
  LVW_LISTA_DESCRICAO              : Integer = 5;
  LVW_LISTA_BLOQUEADO              : Integer = 6;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLEmpresaSelecao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas.
  //
  pubClicouFechar  := True;
  pubNovo          := True;
  pubLicencaID     := 0;
  pubEmpresaBaseID := 0;
  pubEmpresaID     := 0;
  pubCodigo        := '';
  pubDescricao     := '';

  //
  // Limpa componentes do formulário.
  //
  VCLListViewLimpar(lvwLista);
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLEmpresaSelecao.FormShow(Sender: TObject);
begin
  FormularioAtualizar;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLEmpresaSelecao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

// 
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLEmpresaSelecao.mniSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLEmpresaSelecao.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

procedure TPlataformaERPVCLEmpresaSelecao.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLEmpresaSelecao.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente listview.
//
procedure TPlataformaERPVCLEmpresaSelecao.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLEmpresaSelecao.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLEmpresaSelecao.lvwListaDblClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLEmpresaSelecao.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

//
// Evento de click no botão "Confirmar".
//
procedure TPlataformaERPVCLEmpresaSelecao.btnSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLEmpresaSelecao.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLEmpresaSelecao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para atualizar a lista do formulário.
//
procedure TPlataformaERPVCLEmpresaSelecao.FormularioAtualizar;
const
  PROCEDIMENTO_NOME: string = 'FormularioAtualizar';
  ERRO_MENSAGEM    : string = 'Impossível atualizar lista de empresas!';
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
  locADOQuery.SQL.Add('SELECT                                                 ');
  locADOQuery.SQL.Add('  [licenca].[licenca_id] AS [licenca_id],              ');
  locADOQuery.SQL.Add('  [base].[base_id]       AS [empresa_base_id],         ');
  locADOQuery.SQL.Add('  [base].[descricao]     AS [empresa_base_descricao],  ');
  locADOQuery.SQL.Add('  [empresa].[empresa_id] AS [empresa_id],              ');
  locADOQuery.SQL.Add('  [empresa].[codigo]     AS [codigo],                  ');
  locADOQuery.SQL.Add('  [empresa].[descricao]  AS [descricao],               ');
  locADOQuery.SQL.Add('  [empresa].[bloqueado]  AS [bloqueado]                ');
  locADOQuery.SQL.Add('FROM                                                   ');
  locADOQuery.SQL.Add('  [empresa] WITH (NOLOCK)                              ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                      ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [empresa].[empresa_base_id]  ');
  locADOQuery.SQL.Add('  INNER JOIN [licenca] WITH (NOLOCK)                   ');
  locADOQuery.SQL.Add('    ON [licenca].[licenca_id] = [empresa].[licenca_id] ');
  locADOQuery.SQL.Add('WHERE                                                  ');
  locADOQuery.SQL.Add('  [empresa].[licenca_id] = :licenca_id AND             ');
  locADOQuery.SQL.Add('  [empresa].[ativo]      = ''S''                       ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value := locLicencaID;

  if pubNovo then
  begin
    locADOQuery.SQL.Add(' AND [empresa].[bloqueado] = ''N'' ');
  end;

  //
  // Order by.
  //  
  locADOQuery.SQL.Add('ORDER BY                 ');
  locADOQuery.SQL.Add('  [empresa].[codigo] ASC ');


  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar os registros na tabela [empresa]!';
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
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('empresa_base_id').AsInteger));
      locListItem.SubItems.Add(locADOQuery.FieldByName('empresa_base_descricao').AsString);
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('empresa_id').AsInteger));
      locListItem.SubItems.Add(locADOQuery.FieldByName('codigo').AsString);
      locListItem.SubItems.Add(locADOQuery.FieldByName('descricao').AsString);
      locListItem.SubItems.Add(FlagSimNaoStringConverter(locADOQuery.FieldByName('bloqueado').AsString));

      if (pubEmpresaBaseID = locADOQuery.FieldByName('empresa_base_id').AsInteger) and
         (pubEmpresaID     = locADOQuery.FieldByName('empresa_id').AsInteger) then
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
procedure TPlataformaERPVCLEmpresaSelecao.FormularioSelecionar;
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
