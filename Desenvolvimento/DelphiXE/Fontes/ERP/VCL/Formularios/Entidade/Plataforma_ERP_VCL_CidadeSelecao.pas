//
// Arquivo..: Plataforma_ERP_VCL_CidadeSelecao.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com os parâmetros de seleção do cadastro de cidade.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_CidadeSelecao;

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
  TPlataformaERPVCLCidadeSelecao = class(TForm)
    imgFormulario: TImage;
    btnSelecionar: TBitBtn;
    btnFechar: TBitBtn;
    panFormulario: TPanel;
    btnMinimizar: TBitBtn;
    imgBackground: TImage;
    pbaProgresso: TProgressBar;
    mnuFormulario: TMainMenu;
    mniFechar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniAtualizar: TMenuItem;
    mniSelecionar: TMenuItem;
    btnLocalizar: TBitBtn;
    mniLocalizar: TMenuItem;
    lblListaQtde: TLabel;
    lblListaFiltros: TLabel;
    lvwLista: TListView;
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
    procedure mniLocalizarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure lvwListaColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure FormActivate(Sender: TObject);
  private
    priListViewIndiceColuna   : Integer;
    priListViewOrdemAscendente: Boolean;

    priFiltroNome             : string;
 
    procedure FormularioLocalizar;
    procedure FormularioAtualizar;
    procedure FormularioSelecionar;
  public
    pubClicouFechar: Boolean;
    pubNovo        : Boolean;
    pubCidadeID    : Integer;
    pubCodigo      : string;
    pubNome        : string;
    pubEstadoID    : Integer;
    pubEstadoCodigo: string;
    pubEstadoNome  : string;
    pubPaisID      : Integer;
    pubPaisCodigo  : string;
    pubPaisNome    : string;
  end;

var
  PlataformaERPVCLCidadeSelecao: TPlataformaERPVCLCidadeSelecao;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_CidadeSelecaoFiltro;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_CidadeSelecao';

const
  LVW_LISTA_CIDADE_ID    : Integer = 0;
  LVW_LISTA_CODIGO       : Integer = 1;
  LVW_LISTA_NOME         : Integer = 2;
  LVW_LISTA_ESTADO_ID    : Integer = 3;
  LVW_LISTA_ESTADO_CODIGO: Integer = 4;
  LVW_LISTA_ESTADO_NOME  : Integer = 5;
  LVW_LISTA_PAIS_ID      : Integer = 6;
  LVW_LISTA_PAIS_CODIGO  : Integer = 7;
  LVW_LISTA_PAIS_NOME    : Integer = 8;
  LVW_LISTA_BLOQUEADO    : Integer = 9;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLCidadeSelecao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis privadas.
  //
  priListViewIndiceColuna    := VCL_NENHUM_INDICE;
  priListViewOrdemAscendente := False;

  priFiltroNome := '';

  //
  // Inicializa variáveis públicas.
  //
  pubClicouFechar := True;
  pubNovo         := True;
  pubCidadeID     := 0;
  pubCodigo       := '';
  pubNome         := '';
  pubEstadoID     := 0;
  pubEstadoCodigo := '';
  pubEstadoNome   := '';
  pubPaisID       := 0;
  pubPaisCodigo   := '';
  pubPaisNome     := '';

  //
  // Limpa componentes do formulário.
  //
  VCLListViewLimpar(lvwLista);
end;

//
// Evento de ativação do formulário.
//
procedure TPlataformaERPVCLCidadeSelecao.FormActivate(Sender: TObject);
begin
  VCLListViewColunarDimensionar(lvwLista);

  lblListaQtde.Left := lvwLista.Left;
  lblListaQtde.Top  := (lvwLista.Top + lvwLista.Height) + 8;

  lblListaFiltros.Left := (lvwLista.Left + lvwLista.Width) - lblListaFiltros.Width;
  lblListaFiltros.Top  := (lvwLista.Top + lvwLista.Height) + 8;

  lvwLista.Refresh;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLCidadeSelecao.FormShow(Sender: TObject);
begin
  FormularioAtualizar;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLCidadeSelecao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

// 
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLCidadeSelecao.mniLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

procedure TPlataformaERPVCLCidadeSelecao.mniSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLCidadeSelecao.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

procedure TPlataformaERPVCLCidadeSelecao.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLCidadeSelecao.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente listview.
//
procedure TPlataformaERPVCLCidadeSelecao.lvwListaColumnClick(Sender: TObject; Column: TListColumn);
begin
  VCLListViewColunaClicar(Sender, Column, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLCidadeSelecao.lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  VCLListViewComparar(Sender, Item1, Item2, Compare, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLCidadeSelecao.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLCidadeSelecao.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLCidadeSelecao.lvwListaDblClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

procedure TPlataformaERPVCLCidadeSelecao.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

//
// Evento de click no botão "localizar".
//
procedure TPlataformaERPVCLCidadeSelecao.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no botão "confirmar".
//
procedure TPlataformaERPVCLCidadeSelecao.btnSelecionarClick(Sender: TObject);
begin
  FormularioSelecionar;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLCidadeSelecao.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLCidadeSelecao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para localizar registros cadastrados.
//
procedure TPlataformaERPVCLCidadeSelecao.FormularioLocalizar;
var
  locFormulario  : TPlataformaERPVCLCidadeSelecaoFiltro;
  locClicouFechar: Boolean;
  locNome        : string;
begin
  locFormulario := TPlataformaERPVCLCidadeSelecaoFiltro.Create(Self);

  locFormulario.pubNome := priFiltroNome;

  locFormulario.ShowModal;

  locClicouFechar := locFormulario.pubClicouFechar;
  locNome         := locFormulario.pubNome;

  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    priFiltroNome := locNome;

    FormularioAtualizar;
  end;
end;

//
// Procedimento para atualizar a lista do formulário.
//
procedure TPlataformaERPVCLCidadeSelecao.FormularioAtualizar;
const
  PROCEDIMENTO_NOME: string = 'FormularioAtualizar';
  ERRO_MENSAGEM    : string = 'Impossível atualizar lista de cidades!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
  locListItem     : TListItem;
  locIndice       : Integer;
  locFiltros      : Boolean;  
begin
  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);
  lblListaQtde.Caption    := '';
  lblListaFiltros.Visible := False;  

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
  locADOQuery.SQL.Add('SELECT                                             ');
  locADOQuery.SQL.Add('  [cidade].[cidade_id] AS [cidade_id],             ');
  locADOQuery.SQL.Add('  [cidade].[codigo]    AS [codigo],                ');
  locADOQuery.SQL.Add('  [cidade].[nome]      AS [nome],                  ');
  locADOQuery.SQL.Add('  [estado].[estado_id] AS [estado_id],             ');
  locADOQuery.SQL.Add('  [estado].[codigo]    AS [estado_codigo],         ');
  locADOQuery.SQL.Add('  [estado].[nome]      AS [estado_nome],           ');
  locADOQuery.SQL.Add('  [pais].[pais_id]     AS [pais_id],               ');
  locADOQuery.SQL.Add('  [pais].[codigo]      AS [pais_codigo],           ');
  locADOQuery.SQL.Add('  [pais].[nome]        AS [pais_nome],             ');
  locADOQuery.SQL.Add('  [cidade].[bloqueado] AS [bloqueado]              ');
  locADOQuery.SQL.Add('FROM                                               ');
  locADOQuery.SQL.Add('  [cidade] WITH (NOLOCK)                           ');
  locADOQuery.SQL.Add('  INNER JOIN [estado] WITH (NOLOCK)                ');
  locADOQuery.SQL.Add('    ON [estado].[estado_id] = [cidade].[estado_id] ');
  locADOQuery.SQL.Add('  INNER JOIN [pais] WITH (NOLOCK)                  ');
  locADOQuery.SQL.Add('    ON [pais].[pais_id] = [estado].[pais_id]       ');
  locADOQuery.SQL.Add('WHERE                                              ');
  locADOQuery.SQL.Add('  [cidade].[ativo] = ''S''                         ');

  if pubNovo then
  begin
    locADOQuery.SQL.Add(' AND [cidade].[bloqueado] = ''N'' ');
  end;

  //
  // Filtros.
  //
  locFiltros := False;

  if priFiltroNome <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cidade].[nome] LIKE :nome ');
    locADOQuery.Parameters.ParamByName('nome').Value := StringLikeGerar(priFiltroNome);
  end;
 
  //
  // Order by.
  //  
  locADOQuery.SQL.Add('ORDER BY                ');
  locADOQuery.SQL.Add('  [cidade].[codigo] ASC ');


  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar os registros na tabela [cidade]!';
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
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('cidade_id').AsInteger));
      locListItem.SubItems.Add(locADOQuery.FieldByName('codigo').AsString);
      locListItem.SubItems.Add(locADOQuery.FieldByName('nome').AsString);
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('estado_id').AsInteger));
      locListItem.SubItems.Add(locADOQuery.FieldByName('estado_codigo').AsString);
      locListItem.SubItems.Add(locADOQuery.FieldByName('estado_nome').AsString);
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('pais_id').AsInteger));
      locListItem.SubItems.Add(locADOQuery.FieldByName('pais_codigo').AsString);
      locListItem.SubItems.Add(locADOQuery.FieldByName('pais_nome').AsString);
      locListItem.SubItems.Add(FlagSimNaoStringConverter(locADOQuery.FieldByName('bloqueado').AsString));

      if pubCidadeID = locADOQuery.FieldByName('cidade_id').AsInteger then
      begin
        locIndice := (lvwLista.Items.Count - 1);
      end;

      locADOQuery.Next;
    end;
    lvwLista.Items.EndUpdate;
  end;

  //
  // Label de quantidade de linhas no listview.
  //
  VCLListViewQtdeLinhasMensagem(lblListaQtde, lvwLista, locFiltros);
  lblListaFiltros.Visible := locFiltros; 

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
procedure TPlataformaERPVCLCidadeSelecao.FormularioSelecionar;
var
  locIndice: Integer;
begin
  locIndice := VCLListViewIndiceItemRetornar(lvwLista);
  if locIndice = VCL_NENHUM_INDICE then Exit;

  pubClicouFechar := False;
  pubCidadeID     := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_CIDADE_ID]);
  pubCodigo       := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_CODIGO];
  pubNome         := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_NOME];
  
  pubEstadoID     := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_ESTADO_ID]);
  pubEstadoCodigo := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_ESTADO_CODIGO];
  pubEstadoNome   := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_ESTADO_NOME];

  pubPaisID       := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_PAIS_ID]);
  pubPaisCodigo   := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_PAIS_CODIGO];
  pubPaisNome     := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_PAIS_NOME];

  Close;
end;

end.
