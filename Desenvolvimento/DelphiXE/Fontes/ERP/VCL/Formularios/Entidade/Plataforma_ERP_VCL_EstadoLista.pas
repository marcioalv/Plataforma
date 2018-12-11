//
// Arquivo..: Plataforma_ERP_VCL_EstadoLista.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 14/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com a lista de estados cadastrados.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_EstadoLista;

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
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls,
  Vcl.Menus;

type
  TPlataformaERPVCLEstadoLista = class(TForm)
    imgFormulario: TImage;
    panFormulario: TPanel;
    lvwLista: TListView;
    btnFechar: TBitBtn;
    btnMinimizar: TBitBtn;
    btnNovo: TBitBtn;
    pbaProgresso: TProgressBar;
    lblListaQtde: TLabel;
    imgBackground: TImage;
    mnuFormulario: TMainMenu;
    mniAtualizar: TMenuItem;
    mniNovo: TMenuItem;
    mniSelecionar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniFechar: TMenuItem;
    btnLocalizar: TBitBtn;
    mniLocalizar: TMenuItem;
    lblListaFiltros: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaDblClick(Sender: TObject);
    procedure lvwListaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure lvwListaColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure mniFecharClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
    procedure mniSelecionarClick(Sender: TObject);
    procedure mniNovoClick(Sender: TObject);
    procedure mniAtualizarClick(Sender: TObject);
    procedure mniLocalizarClick(Sender: TObject);
  private
    priListViewIndiceColuna   : Integer;
    priListViewOrdemAscendente: Boolean;

    priFiltroCodigoInicial    : string;
    priFiltroCodigoFinal      : string;
    priFiltroNome             : string;
    priFiltroBloqueado        : string;
    priFiltroAtivo            : string;
    priFiltroEstadoIDInicial  : Integer;
    priFiltroEstadoIDFinal    : Integer;
    priFiltroInsDtHrInicial   : TDateTime;
    priFiltroInsDtHrFinal     : TDateTime;
    priFiltroUpdDtHrInicial   : TDateTime;
    priFiltroUpdDtHrFinal     : TDateTime;    
  
    procedure FormularioControlar;
    procedure FormularioLocalizar;
    procedure FormularioAtualizar(argIndice: Integer);  
    procedure FormularioCadastroExibir(argNovo: Boolean);
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLEstadoLista: TPlataformaERPVCLEstadoLista;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico,
  Plataforma_ERP_VCL_EstadoFiltro,
  Plataforma_ERP_VCL_EstadoCadastro;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_EstadoLista.pas';

  LVW_LISTA_ESTADO_ID: Integer = 0;
  LVW_LISTA_CODIGO   : Integer = 1;
  LVW_LISTA_NOME     : Integer = 2;
  LVW_LISTA_BLOQUEADO: Integer = 3;
  LVW_LISTA_ATIVO    : Integer = 4;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLEstadoLista.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis privadas.
  //
  priListViewIndiceColuna    := VCL_NENHUM_INDICE;
  priListViewOrdemAscendente := False;

  priFiltroCodigoInicial   := '';
  priFiltroCodigoFinal     := '';
  priFiltroNome            := '';
  priFiltroBloqueado       := '';
  priFiltroAtivo           := '';
  priFiltroEstadoIDInicial := 0;
  priFiltroEstadoIDFinal   := 0;
  priFiltroInsDtHrInicial  := 0;
  priFiltroInsDtHrFinal    := 0;
  priFiltroUpdDtHrInicial  := 0;
  priFiltroUpdDtHrFinal    := 0;  
  
  //
  // Mensagem para o label de quantidade de registros.
  //
  lblListaQtde.Caption := VCL_MENSAGEM_ATUALIZAR;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLEstadoLista.FormShow(Sender: TObject);
begin
  //
  // Imagem de background.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Controla a exibição dos componentes no formulário.
  //
  FormularioControlar;

  //
  // Atualiza a lista.
  //
  FormularioAtualizar(VCL_NENHUM_INDICE);
end;

//
// Evento de ativação do formulário.
//
procedure TPlataformaERPVCLEstadoLista.FormActivate(Sender: TObject);
begin
  VCLListViewColunarDimensionar(lvwLista);

  lblListaQtde.Left := lvwLista.Left;
  lblListaQtde.Top  := (lvwLista.Top + lvwLista.Height) + 8;

  lblListaFiltros.Left := (lvwLista.Left + lvwLista.Width) - lblListaFiltros.Width;
  lblListaFiltros.Top  := (lvwLista.Top + lvwLista.Height) + 8;  

  lvwLista.Refresh;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLEstadoLista.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLEstadoLista.mniLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

procedure TPlataformaERPVCLEstadoLista.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar(VCL_NENHUM_INDICE);
end;

procedure TPlataformaERPVCLEstadoLista.mniNovoClick(Sender: TObject);
begin
  FormularioCadastroExibir(True);
end;

procedure TPlataformaERPVCLEstadoLista.mniSelecionarClick(Sender: TObject);
begin
  FormularioCadastroExibir(False);
end;

procedure TPlataformaERPVCLEstadoLista.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLEstadoLista.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos de controle da lista.
//
procedure TPlataformaERPVCLEstadoLista.lvwListaColumnClick(Sender: TObject; Column: TListColumn);
begin
  VCLListViewColunaClicar(Sender, Column, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLEstadoLista.lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  VCLListViewComparar(Sender, Item1, Item2, Compare, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLEstadoLista.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLEstadoLista.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLEstadoLista.lvwListaDblClick(Sender: TObject);
begin
  FormularioCadastroExibir(False);
end;

procedure TPlataformaERPVCLEstadoLista.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

//
// Evento de click no botão "localizar".
//
procedure TPlataformaERPVCLEstadoLista.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no botão "novo".
//
procedure TPlataformaERPVCLEstadoLista.btnNovoClick(Sender: TObject);
begin
  FormularioCadastroExibir(True);
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLEstadoLista.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLEstadoLista.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Controla a exibição dos componentes do formulário.
//
procedure TPlataformaERPVCLEstadoLista.FormularioControlar;
begin
  //
  // Menu - Ações.
  //
  mniAtualizar.Visible  := Plataforma_ERP_UsuarioRotina('ERP_ESTADO_LISTA_ATUALIZAR');
  mniNovo.Visible       := Plataforma_ERP_UsuarioRotina('ERP_ESTADO_LISTA_NOVO');
  mniSelecionar.Visible := Plataforma_ERP_UsuarioRotina('ERP_ESTADO_LISTA_SELECIONAR');
  mniMinimizar.Visible  := True;
  mniFechar.Visible     := True;

  //
  // Botões.
  //
  btnNovo.Visible      := mniNovo.Visible;
  btnMinimizar.Visible := btnMinimizar.Enabled;
  btnFechar.Visible    := btnFechar.Enabled;
end;

//
// Procedimento para localizar registros cadastrados.
//
procedure TPlataformaERPVCLEstadoLista.FormularioLocalizar;
var
  locFormulario     : TPlataformaERPVCLEstadoFiltro;
  locClicouFechar   : Boolean;
  locCodigoInicial  : string;
  locCodigoFinal    : string;
  locNome           : string;
  locBloqueado      : string;
  locAtivo          : string;
  locEstadoIDInicial: Integer;
  locEstadoIDFinal  : Integer;
  locInsDtHrInicial : TDateTime;
  locInsDtHrFinal   : TDateTime;
  locUpdDtHrInicial : TDateTime;
  locUpdDtHrFinal   : TDateTime;
begin
  locFormulario := TPlataformaERPVCLEstadoFiltro.Create(Self);

  locFormulario.pubCodigoInicial   := priFiltroCodigoInicial;
  locFormulario.pubCodigoFinal     := priFiltroCodigoFinal;
  locFormulario.pubNome            := priFiltroNome;
  locFormulario.pubBloqueado       := priFiltroBloqueado;
  locFormulario.pubAtivo           := priFiltroAtivo;
  locFormulario.pubEstadoIDInicial := priFiltroEstadoIDInicial;
  locFormulario.pubEstadoIDFinal   := priFiltroEstadoIDFinal;
  locFormulario.pubInsDtHrInicial  := priFiltroInsDtHrInicial;
  locFormulario.pubInsDtHrFinal    := priFiltroInsDtHrFinal;
  locFormulario.pubUpdDtHrInicial  := priFiltroUpdDtHrInicial;
  locFormulario.pubUpdDtHrFinal    := priFiltroUpdDtHrFinal;
  
  locFormulario.ShowModal;

  locClicouFechar    := locFormulario.pubClicouFechar;
  locCodigoInicial   := locFormulario.pubCodigoInicial;
  locCodigoFinal     := locFormulario.pubCodigoFinal;
  locNome            := locFormulario.pubNome;
  locBloqueado       := locFormulario.pubBloqueado;
  locAtivo           := locFormulario.pubAtivo;
  locEstadoIDInicial := locFormulario.pubEstadoIDInicial;
  locEstadoIDFinal   := locFormulario.pubEstadoIDFinal;
  locInsDtHrInicial  := locFormulario.pubInsDtHrInicial;
  locInsDtHrFinal    := locFormulario.pubInsDtHrFinal;
  locUpdDtHrInicial  := locFormulario.pubUpdDtHrInicial;
  locUpdDtHrFinal    := locFormulario.pubUpdDtHrFinal;
  
  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    priFiltroCodigoInicial   := locCodigoInicial;
    priFiltroCodigoFinal     := locCodigoFinal;
    priFiltroNome            := locNome;
    priFiltroBloqueado       := locBloqueado;
    priFiltroAtivo           := locAtivo;
    priFiltroEstadoIDInicial := locEstadoIDInicial;
    priFiltroEstadoIDFinal   := locEstadoIDFinal;
    priFiltroInsDtHrInicial  := locInsDtHrInicial;
    priFiltroInsDtHrFinal    := locInsDtHrFinal;
    priFiltroUpdDtHrInicial  := locUpdDtHrInicial;
    priFiltroUpdDtHrFinal    := locUpdDtHrFinal;

    FormularioAtualizar(VCL_NENHUM_INDICE);
  end;
end;

//
// Procedimento para atualizar a lista do formulário.
//
procedure TPlataformaERPVCLEstadoLista.FormularioAtualizar(argIndice: Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioAtualizar';
  ERRO_MENSAGEM    : string = 'Impossível atualizar lista de estados';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
  locListItem     : TListItem;
  locFiltros      : Boolean;
begin
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

  // Abre conexão com o banco de dados da aplicação.
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
  locADOQuery.SQL.Add('SELECT                                   ');
  locADOQuery.SQL.Add('  [estado].[estado_id]   AS [estado_id], ');
  locADOQuery.SQL.Add('  [estado].[codigo]    AS [codigo],      ');
  locADOQuery.SQL.Add('  [estado].[nome]      AS [nome],        ');
  locADOQuery.SQL.Add('  [estado].[bloqueado] AS [bloqueado],   ');
  locADOQuery.SQL.Add('  [estado].[ativo]     AS [ativo]        ');
  locADOQuery.SQL.Add('FROM                                     ');
  locADOQuery.SQL.Add('  [estado] WITH (NOLOCK)                 ');
  locADOQuery.SQL.Add('WHERE                                    ');
  locADOQuery.SQL.Add('  1 = 1                                  ');

  //
  // Filtros.
  //
  locFiltros := False;

  if priFiltroEstadoIDInicial > 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [estado].[estado_id] >= :estado_id_inicial ');
    locADOQuery.Parameters.ParamByName('estado_id_inicial').Value := priFiltroEstadoIDInicial;
  end;

  if priFiltroEstadoIDFinal > 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [estado].[estado_id] <= :estado_id_final ');
    locADOQuery.Parameters.ParamByName('estado_id_final').Value := priFiltroEstadoIDFinal;
  end;

  if priFiltroCodigoInicial <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [estado].[codigo] >= :codigo_inicial ');
    locADOQuery.Parameters.ParamByName('codigo_inicial').Value := priFiltroCodigoInicial;
  end;

  if priFiltroCodigoFinal <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [estado].[codigo] <= :codigo_final ');
    locADOQuery.Parameters.ParamByName('codigo_final').Value := priFiltroCodigoFinal;
  end;

  if priFiltroNome <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [estado].[nome] LIKE :nome ');
    locADOQuery.Parameters.ParamByName('nome').Value := StringLikeGerar(priFiltroNome);
  end;
  
  if (priFiltroBloqueado <> '') AND (priFiltroBloqueado <> FLAG_AMBOS) then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [estado].[bloqueado] = :bloqueado ');
    locADOQuery.Parameters.ParamByName('bloqueado').Value := priFiltroBloqueado;
  end;

  if (priFiltroAtivo <> '') AND (priFiltroAtivo <> FLAG_AMBOS) then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [estado].[ativo] = :ativo ');
    locADOQuery.Parameters.ParamByName('ativo').Value := priFiltroAtivo;
  end;

  if priFiltroInsDtHrInicial <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [estado].[ins_local_dt_hr] >= :ins_local_dt_hr_inicial ');
    locADOQuery.Parameters.ParamByName('ins_local_dt_hr_inicial').Value := DateTimeHorarioInicial(priFiltroInsDtHrInicial);
  end;

  if priFiltroInsDtHrFinal <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [estado].[ins_local_dt_hr] <= :ins_local_dt_hr_final ');
    locADOQuery.Parameters.ParamByName('ins_local_dt_hr_final').Value := DateTimeHorarioFinal(priFiltroInsDtHrFinal);
  end;

  if priFiltroUpdDtHrInicial <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [estado].[upd_local_dt_hr] >= :upd_local_dt_hr_inicial ');
    locADOQuery.Parameters.ParamByName('upd_local_dt_hr_inicial').Value := DateTimeHorarioInicial(priFiltroUpdDtHrInicial);
  end;

  if priFiltroUpdDtHrFinal <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [estado].[upd_local_dt_hr] <= :upd_local_dt_hr_final ');
    locADOQuery.Parameters.ParamByName('upd_local_dt_hr_final').Value := DateTimeHorarioFinal(priFiltroUpdDtHrFinal);
  end;

  //
  // ORDER BY.
  //
  locADOQuery.SQL.Add('ORDER BY                   ');
  locADOQuery.SQL.Add('  [estado].[estado_id] ASC ');

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar os registros na tabela [estado]!';
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
  if locADOQuery.RecordCount > 0 then
  begin
    lvwLista.Items.BeginUpdate;
    while not locADOQuery.EOF do
    begin
      VCLProgressBarIncrementar(pbaProgresso);
    
      locListItem         := lvwLista.Items.Add;
      locListItem.Caption := '';
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('estado_id').AsInteger));
      locListItem.SubItems.Add(locADOQuery.FieldByName('codigo').AsString);
      locListItem.SubItems.Add(locADOQuery.FieldByName('nome').AsString);
      locListItem.SubItems.Add(FlagSimNaoStringConverter(locADOQuery.FieldByName('bloqueado').AsString));
      locListItem.SubItems.Add(FlagSimNaoStringConverter(locADOQuery.FieldByName('ativo').AsString));

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
  if argIndice = VCL_NENHUM_INDICE then
  begin
    VCLListViewFocar(lvwLista);
  end
  else
  begin
    VCLListViewItemPosicionar(lvwLista, argIndice);
    lvwLista.SetFocus;
  end;
end;

//
// Procedimento para exibir o formulário de cadastro.
//
procedure TPlataformaERPVCLEstadoLista.FormularioCadastroExibir(argNovo: Boolean);
var
  locFormulario      : TPlataformaERPVCLEstadoCadastro;
  locDadosAtualizados: Boolean;
  locIndice          : Integer;
  locEstadoID        : Integer;
begin
  if argNovo then
  begin
    locIndice := VCL_NENHUM_INDICE;
    locEstadoID := 0;
  end
  else
  begin  
    locIndice := VCLListViewIndiceItemRetornar(lvwLista);
    if locIndice <= VCL_NENHUM_INDICE then Exit;
    locEstadoID := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_ESTADO_ID]);
  end;

  locFormulario := TPlataformaERPVCLEstadoCadastro.Create(Self);

  locFormulario.pubEstadoID := locEstadoID;
  
  locFormulario.ShowModal;

  locDadosAtualizados := locFormulario.pubDadosAtualizados;

  locFormulario.Release;
  FreeAndNil(locFormulario);

  if locDadosAtualizados then
  begin
    FormularioAtualizar(locIndice);
  end;
end;

end.