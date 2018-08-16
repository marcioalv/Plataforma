//
// Arquivo..: Plataforma_ERP_VCL_NumeradorBaseLista.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 15/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com a lista de numeradores por base cadastrados.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_NumeradorBaseLista;

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
  TPlataformaERPVCLNumeradorBaseLista = class(TForm)
    imgFormulario: TImage;
    panFormulario: TPanel;
    lvwLista: TListView;
    btnFechar: TBitBtn;
    btnMinimizar: TBitBtn;
    btnNovo: TBitBtn;
    pbaProgresso: TProgressBar;
    btnLocalizar: TBitBtn;
    lblListaQtde: TLabel;
    lblListaFiltros: TLabel;
    imgBackground: TImage;
    mnuFormulario: TMainMenu;
    mniLocalizar: TMenuItem;
    mniAtualizar: TMenuItem;
    mniNovo: TMenuItem;
    mniSelecionar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniFechar: TMenuItem;
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
  
    priFiltroCodigo        : string;
    priFiltroBloqueado     : string;
    priFiltroAtivo         : string;
    priFiltroInsDtHrInicial: TDateTime;
    priFiltroInsDtHrFinal  : TDateTime;
    priFiltroUpdDtHrInicial: TDateTime;
    priFiltroUpdDtHrFinal  : TDateTime;

    procedure FormularioControlar;
    procedure FormularioLocalizar;
    procedure FormularioAtualizar(argIndice: Integer);  
    procedure FormularioCadastroExibir(argNovo: Boolean);
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLNumeradorBaseLista: TPlataformaERPVCLNumeradorBaseLista;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico,
  Plataforma_ERP_VCL_NumeradorBaseFiltro,
  Plataforma_ERP_VCL_NumeradorBaseCadastro;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_NumeradorBaseLista.pas';

  LVW_LISTA_BASE_ID       : Integer = 0;
  LVW_LISTA_BASE_DESCRICAO: Integer = 1;
  LVW_LISTA_CODIGO        : Integer = 2;
  LVW_LISTA_ATUAL_ID      : Integer = 3;
  LVW_LISTA_BLOQUEADO     : Integer = 4;
  LVW_LISTA_ATIVO         : Integer = 5;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLNumeradorBaseLista.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis privadas.
  //
  priListViewIndiceColuna    := VCL_NENHUM_INDICE;
  priListViewOrdemAscendente := False;
  
  priFiltroCodigo         := '';
  priFiltroBloqueado      := '';
  priFiltroAtivo          := '';
  priFiltroInsDtHrInicial := 0;
  priFiltroInsDtHrFinal   := 0;
  priFiltroUpdDtHrInicial := 0;
  priFiltroUpdDtHrFinal   := 0;

  //
  // Mensagem para o label de quantidade de registros.
  //
  lblListaQtde.Caption := VCL_MENSAGEM_ATUALIZAR;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLNumeradorBaseLista.FormShow(Sender: TObject);
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
procedure TPlataformaERPVCLNumeradorBaseLista.FormActivate(Sender: TObject);
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
procedure TPlataformaERPVCLNumeradorBaseLista.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLNumeradorBaseLista.mniLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

procedure TPlataformaERPVCLNumeradorBaseLista.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar(VCL_NENHUM_INDICE);
end;

procedure TPlataformaERPVCLNumeradorBaseLista.mniNovoClick(Sender: TObject);
begin
  FormularioCadastroExibir(True);
end;

procedure TPlataformaERPVCLNumeradorBaseLista.mniSelecionarClick(Sender: TObject);
begin
  FormularioCadastroExibir(False);
end;

procedure TPlataformaERPVCLNumeradorBaseLista.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLNumeradorBaseLista.mniFecharClick(Sender: TObject);
begin
  Close;
end;


//
// Eventos de controle da lista.
//
procedure TPlataformaERPVCLNumeradorBaseLista.lvwListaColumnClick(Sender: TObject; Column: TListColumn);
begin
  VCLListViewColunaClicar(Sender, Column, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLNumeradorBaseLista.lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  VCLListViewComparar(Sender, Item1, Item2, Compare, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLNumeradorBaseLista.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLNumeradorBaseLista.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLNumeradorBaseLista.lvwListaDblClick(Sender: TObject);
begin
  FormularioCadastroExibir(False);
end;

procedure TPlataformaERPVCLNumeradorBaseLista.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

//
// Evento de click no botão "localizar".
//
procedure TPlataformaERPVCLNumeradorBaseLista.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no botão "novo".
//
procedure TPlataformaERPVCLNumeradorBaseLista.btnNovoClick(Sender: TObject);
begin
  FormularioCadastroExibir(True);
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLNumeradorBaseLista.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLNumeradorBaseLista.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Controla a exibição dos componentes do formulário.
//
procedure TPlataformaERPVCLNumeradorBaseLista.FormularioControlar;
begin
  //
  // Menu - Ações.
  //
  mniLocalizar.Visible  := (mniLocalizar.Enabled)  and (Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_BASE_LISTA_LOCALIZAR'));
  mniAtualizar.Visible  := (mniAtualizar.Enabled)  and (Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_BASE_LISTA_ATUALIZAR'));
  mniNovo.Visible       := (mniNovo.Enabled)       and (Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_BASE_LISTA_NOVO'));
  mniSelecionar.Visible := (mniSelecionar.Enabled) and (Plataforma_ERP_UsuarioRotina('ERP_NUMERADOR_BASE_LISTA_SELECIONAR'));
  mniMinimizar.Visible  := (mniMinimizar.Enabled);
  mniFechar.Visible     := (mniFechar.Enabled);

  //
  // Botões.
  //
  btnLocalizar.Visible  := (btnLocalizar.Enabled)  and (mniLocalizar.Visible);
  btnNovo.Visible       := (btnNovo.Enabled)       and (mniNovo.Visible);
  btnMinimizar.Visible  := (btnMinimizar.Enabled);
  btnFechar.Visible     := (btnFechar.Enabled);
end;

//
// Procedimento para localizar registros cadastros.
//
procedure TPlataformaERPVCLNumeradorBaseLista.FormularioLocalizar;
var
  locFormulario    : TPlataformaERPVCLNumeradorBaseFiltro;
  locClicouFechar  : Boolean;
  locCodigo        : string;
  locBloqueado     : string;
  locAtivo         : string;
  locInsDtHrInicial: TDateTime;
  locInsDtHrFinal  : TDateTime;
  locUpdDtHrInicial: TDateTime;
  locUpdDtHrFinal  : TDateTime;
begin
  locFormulario := TPlataformaERPVCLNumeradorBaseFiltro.Create(Self);

  locFormulario.pubCodigo         := priFiltroCodigo;
  locFormulario.pubBloqueado      := priFiltroBloqueado;
  locFormulario.pubAtivo          := priFiltroAtivo;
  locFormulario.pubInsDtHrInicial := priFiltroInsDtHrInicial;
  locFormulario.pubInsDtHrFinal   := priFiltroInsDtHrFinal;
  locFormulario.pubUpdDtHrInicial := priFiltroUpdDtHrInicial;
  locFormulario.pubUpdDtHrFinal   := priFiltroUpdDtHrFinal;
  
  locFormulario.ShowModal;

  locClicouFechar   := locFormulario.pubClicouFechar;
  locCodigo         := locFormulario.pubCodigo;
  locBloqueado      := locFormulario.pubBloqueado;
  locAtivo          := locFormulario.pubAtivo;
  locInsDtHrInicial := locFormulario.pubInsDtHrInicial;
  locInsDtHrFinal   := locFormulario.pubInsDtHrFinal;
  locUpdDtHrInicial := locFormulario.pubUpdDtHrInicial;
  locUpdDtHrFinal   := locFormulario.pubUpdDtHrFinal;
  
  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    priFiltroCodigo         := locCodigo;
    priFiltroBloqueado      := locBloqueado;
    priFiltroAtivo          := locAtivo;
    priFiltroInsDtHrInicial := locInsDtHrInicial;
    priFiltroInsDtHrFinal   := locInsDtHrFinal;
    priFiltroUpdDtHrInicial := locUpdDtHrInicial;
    priFiltroUpdDtHrFinal   := locUpdDtHrFinal;

    FormularioAtualizar(VCL_NENHUM_INDICE);
  end;
end;

//
// Procedimento para atualizar a lista do formulário.
//
procedure TPlataformaERPVCLNumeradorBaseLista.FormularioAtualizar(argIndice: Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioAtualizar';
  ERRO_MENSAGEM    : string = 'Impossível atualizar lista de numeradores por licença!';
var
  locADOConnection : TADOConnection;
  locADOQuery      : TADOQuery;
  locLogMensagem   : string;
  locBaseID        : Integer;
  locListItem      : TListItem;
  locFiltros       : Boolean;
begin
  //
  // ID da base.
  //
  locBaseID := gloBaseID;

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
  locADOQuery.SQL.Add('SELECT                                               ');
  locADOQuery.SQL.Add('  [base].[base_id]             AS [base_id],         ');
  locADOQuery.SQL.Add('  [base].[descricao]           AS [base_descricao],  ');
  locADOQuery.SQL.Add('  [numerador_base].[codigo]    AS [codigo],          ');
  locADOQuery.SQL.Add('  [numerador_base].[atual_id]  AS [atual_id],        ');
  locADOQuery.SQL.Add('  [numerador_base].[bloqueado] AS [bloqueado],       ');
  locADOQuery.SQL.Add('  [numerador_base].[ativo]     AS [ativo]            ');
  locADOQuery.SQL.Add('FROM                                                 ');
  locADOQuery.SQL.Add('  [numerador_base] WITH (NOLOCK)                     ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                    ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [numerador_base].[base_id] ');
  locADOQuery.SQL.Add('WHERE                                                ');
  locADOQuery.SQL.Add('  [numerador_base].[base_id] = :base_id              ');

  locADOQuery.Parameters.ParamByName('base_id').Value := locBaseID;

  //
  // Filtros.
  //
  locFiltros := False;

  if priFiltroCodigo <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [numerador_base].[codigo] LIKE :codigo ');
    locADOQuery.Parameters.ParamByName('codigo').Value := StringLikeGerar(priFiltroCodigo);
  end;

  if (priFiltroBloqueado <> '') AND (priFiltroBloqueado <> FLAG_AMBOS) then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [numerador_base].[bloqueado] = :bloqueado ');
    locADOQuery.Parameters.ParamByName('bloqueado').Value := priFiltroBloqueado;
  end;

  if (priFiltroAtivo <> '') AND (priFiltroAtivo <> FLAG_AMBOS) then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [numerador_base].[ativo] = :ativo ');
    locADOQuery.Parameters.ParamByName('ativo').Value := priFiltroAtivo;
  end;

  if priFiltroInsDtHrInicial <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [numerador_base].[ins_local_dt_hr] >= :ins_local_dt_hr_inicial ');
    locADOQuery.Parameters.ParamByName('ins_local_dt_hr_inicial').Value := DateTimeHorarioInicial(priFiltroInsDtHrInicial);
  end;

  if priFiltroInsDtHrFinal <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [numerador_base].[ins_local_dt_hr] <= :ins_local_dt_hr_final ');
    locADOQuery.Parameters.ParamByName('ins_local_dt_hr_final').Value := DateTimeHorarioFinal(priFiltroInsDtHrFinal);
  end;

  if priFiltroUpdDtHrInicial <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [numerador_base].[upd_local_dt_hr] >= :upd_local_dt_hr_inicial ');
    locADOQuery.Parameters.ParamByName('upd_local_dt_hr_inicial').Value := DateTimeHorarioInicial(priFiltroUpdDtHrInicial);
  end;

  if priFiltroUpdDtHrFinal <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [numerador_base].[upd_local_dt_hr] <= :upd_local_dt_hr_final ');
    locADOQuery.Parameters.ParamByName('upd_local_dt_hr_final').Value := DateTimeHorarioFinal(priFiltroUpdDtHrFinal);
  end;

  //
  // Order by.
  //                                       
  locADOQuery.SQL.Add('ORDER BY                        ');
  locADOQuery.SQL.Add('  [numerador_base].[codigo] ASC ');

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar os registros na tabela [numerador_base]!';
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
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('base_id').AsInteger));
      locListItem.SubItems.Add(locADOQuery.FieldByName('base_descricao').AsString);
      locListItem.SubItems.Add(locADOQuery.FieldByName('codigo').AsString);
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('atual_id').AsInteger, True));
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
procedure TPlataformaERPVCLNumeradorBaseLista.FormularioCadastroExibir(argNovo: Boolean);
var
  locFormulario      : TPlataformaERPVCLNumeradorBaseCadastro;
  locDadosAtualizados: Boolean;
  locIndice          : Integer;
  locBaseID          : Integer;
  locCodigo          : string;
begin
  if argNovo then
  begin
    locIndice    := VCL_NENHUM_INDICE;
    locBaseID    := 0;
    locCodigo    := '';
  end
  else
  begin  
    locIndice := VCLListViewIndiceItemRetornar(lvwLista);
    if locIndice <= VCL_NENHUM_INDICE then Exit;

    locBaseID    := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_BASE_ID]);
    locCodigo    := lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_CODIGO];
  end;

  locFormulario := TPlataformaERPVCLNumeradorBaseCadastro.Create(Self);

  locFormulario.pubBaseID    := locBaseID;
  locFormulario.pubCodigo    := locCodigo;
  
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