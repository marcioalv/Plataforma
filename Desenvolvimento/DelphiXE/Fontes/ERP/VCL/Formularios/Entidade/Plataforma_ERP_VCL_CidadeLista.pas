//
// Arquivo..: Plataforma_ERP_VCL_CidadeLista.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 14/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com a lista de cidades cadastrados.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_CidadeLista;

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
  TPlataformaERPVCLCidadeLista = class(TForm)
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
    priFiltroCidadeIDInicial  : Integer;
    priFiltroCidadeIDFinal    : Integer;
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
  PlataformaERPVCLCidadeLista: TPlataformaERPVCLCidadeLista;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico,
  Plataforma_ERP_VCL_CidadeFiltro,
  Plataforma_ERP_VCL_CidadeCadastro;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_CidadeLista.pas';

  LVW_LISTA_CIDADE_ID: Integer = 0;
  LVW_LISTA_CODIGO   : Integer = 1;
  LVW_LISTA_NOME     : Integer = 2;
  LVW_LISTA_BLOQUEADO: Integer = 3;
  LVW_LISTA_ATIVO    : Integer = 4;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLCidadeLista.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis privadas.
  //
  priListViewIndiceColuna    := VCL_NENHUM_INDICE;
  priListViewOrdemAscendente := False;

  priFiltroCodigoInicial   := '';
  priFiltroCodigoFinal     := '';
  priFiltroNome            := '';
  priFiltroBloqueado       := '';
  priFiltroAtivo           := '';
  priFiltroCidadeIDInicial := 0;
  priFiltroCidadeIDFinal   := 0;
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
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLCidadeLista.FormShow(Sender: TObject);
begin
  //
  // Imagem de background.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Controla a exibi��o dos componentes no formul�rio.
  //
  FormularioControlar;

  //
  // Atualiza a lista.
  //
  FormularioAtualizar(VCL_NENHUM_INDICE);
end;

//
// Evento de ativa��o do formul�rio.
//
procedure TPlataformaERPVCLCidadeLista.FormActivate(Sender: TObject);
begin
  VCLListViewColunarDimensionar(lvwLista);

  lblListaQtde.Left := lvwLista.Left;
  lblListaQtde.Top  := (lvwLista.Top + lvwLista.Height) + 8;

  lblListaFiltros.Left := (lvwLista.Left + lvwLista.Width) - lblListaFiltros.Width;
  lblListaFiltros.Top  := (lvwLista.Top + lvwLista.Height) + 8;  

  lvwLista.Refresh;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLCidadeLista.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas op��es do menu.
//
procedure TPlataformaERPVCLCidadeLista.mniLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

procedure TPlataformaERPVCLCidadeLista.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar(VCL_NENHUM_INDICE);
end;

procedure TPlataformaERPVCLCidadeLista.mniNovoClick(Sender: TObject);
begin
  FormularioCadastroExibir(True);
end;

procedure TPlataformaERPVCLCidadeLista.mniSelecionarClick(Sender: TObject);
begin
  FormularioCadastroExibir(False);
end;

procedure TPlataformaERPVCLCidadeLista.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLCidadeLista.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos de controle da lista.
//
procedure TPlataformaERPVCLCidadeLista.lvwListaColumnClick(Sender: TObject; Column: TListColumn);
begin
  VCLListViewColunaClicar(Sender, Column, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLCidadeLista.lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  VCLListViewComparar(Sender, Item1, Item2, Compare, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLCidadeLista.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLCidadeLista.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLCidadeLista.lvwListaDblClick(Sender: TObject);
begin
  FormularioCadastroExibir(False);
end;

procedure TPlataformaERPVCLCidadeLista.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

//
// Evento de click no bot�o "localizar".
//
procedure TPlataformaERPVCLCidadeLista.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no bot�o "novo".
//
procedure TPlataformaERPVCLCidadeLista.btnNovoClick(Sender: TObject);
begin
  FormularioCadastroExibir(True);
end;

//
// Evento de click no bot�o "minimizar".
//
procedure TPlataformaERPVCLCidadeLista.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLCidadeLista.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Controla a exibi��o dos componentes do formul�rio.
//
procedure TPlataformaERPVCLCidadeLista.FormularioControlar;
begin
  //
  // Menu - A��es.
  //
  mniAtualizar.Visible  := Plataforma_ERP_UsuarioRotina('ERP_CIDADE_LISTA_ATUALIZAR');
  mniNovo.Visible       := Plataforma_ERP_UsuarioRotina('ERP_CIDADE_LISTA_NOVO');
  mniSelecionar.Visible := Plataforma_ERP_UsuarioRotina('ERP_CIDADE_LISTA_SELECIONAR');
  mniMinimizar.Visible  := True;
  mniFechar.Visible     := True;

  //
  // Bot�es.
  //
  btnNovo.Visible      := mniNovo.Visible;
  btnMinimizar.Visible := btnMinimizar.Enabled;
  btnFechar.Visible    := btnFechar.Enabled;
end;

//
// Procedimento para localizar registros cadastrados.
//
procedure TPlataformaERPVCLCidadeLista.FormularioLocalizar;
var
  locFormulario     : TPlataformaERPVCLCidadeFiltro;
  locClicouFechar   : Boolean;
  locCodigoInicial  : string;
  locCodigoFinal    : string;
  locNome           : string;
  locBloqueado      : string;
  locAtivo          : string;
  locCidadeIDInicial: Integer;
  locCidadeIDFinal  : Integer;
  locInsDtHrInicial : TDateTime;
  locInsDtHrFinal   : TDateTime;
  locUpdDtHrInicial : TDateTime;
  locUpdDtHrFinal   : TDateTime;
begin
  locFormulario := TPlataformaERPVCLCidadeFiltro.Create(Self);

  locFormulario.pubCodigoInicial   := priFiltroCodigoInicial;
  locFormulario.pubCodigoFinal     := priFiltroCodigoFinal;
  locFormulario.pubNome            := priFiltroNome;
  locFormulario.pubBloqueado       := priFiltroBloqueado;
  locFormulario.pubAtivo           := priFiltroAtivo;
  locFormulario.pubCidadeIDInicial := priFiltroCidadeIDInicial;
  locFormulario.pubCidadeIDFinal   := priFiltroCidadeIDFinal;
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
  locCidadeIDInicial := locFormulario.pubCidadeIDInicial;
  locCidadeIDFinal   := locFormulario.pubCidadeIDFinal;
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
    priFiltroCidadeIDInicial := locCidadeIDInicial;
    priFiltroCidadeIDFinal   := locCidadeIDFinal;
    priFiltroInsDtHrInicial  := locInsDtHrInicial;
    priFiltroInsDtHrFinal    := locInsDtHrFinal;
    priFiltroUpdDtHrInicial  := locUpdDtHrInicial;
    priFiltroUpdDtHrFinal    := locUpdDtHrFinal;

    FormularioAtualizar(VCL_NENHUM_INDICE);
  end;
end;

//
// Procedimento para atualizar a lista do formul�rio.
//
procedure TPlataformaERPVCLCidadeLista.FormularioAtualizar(argIndice: Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioAtualizar';
  ERRO_MENSAGEM    : string = 'Imposs�vel atualizar lista de cidades';
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
  // Conex�o ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(Self);

  // Abre conex�o com o banco de dados da aplica��o.
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
  locADOQuery.SQL.Add('SELECT                                 ');
  locADOQuery.SQL.Add('  [cidade].[cidade_id] AS [cidade_id], ');
  locADOQuery.SQL.Add('  [cidade].[codigo]    AS [codigo],    ');
  locADOQuery.SQL.Add('  [cidade].[nome]      AS [nome],      ');
  locADOQuery.SQL.Add('  [cidade].[bloqueado] AS [bloqueado], ');
  locADOQuery.SQL.Add('  [cidade].[ativo]     AS [ativo]      ');
  locADOQuery.SQL.Add('FROM                                   ');
  locADOQuery.SQL.Add('  [cidade] WITH (NOLOCK)               ');
  locADOQuery.SQL.Add('WHERE                                  ');
  locADOQuery.SQL.Add('  1 = 1                                ');

  //
  // Filtros.
  //
  locFiltros := False;

  if priFiltroCidadeIDInicial > 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cidade].[cidade_id] >= :cidade_id_inicial ');
    locADOQuery.Parameters.ParamByName('cidade_id_inicial').Value := priFiltroCidadeIDInicial;
  end;

  if priFiltroCidadeIDFinal > 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cidade].[cidade_id] <= :cidade_id_final ');
    locADOQuery.Parameters.ParamByName('cidade_id_final').Value := priFiltroCidadeIDFinal;
  end;

  if priFiltroCodigoInicial <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cidade].[codigo] >= :codigo_inicial ');
    locADOQuery.Parameters.ParamByName('codigo_inicial').Value := priFiltroCodigoInicial;
  end;

  if priFiltroCodigoFinal <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cidade].[codigo] <= :codigo_final ');
    locADOQuery.Parameters.ParamByName('codigo_final').Value := priFiltroCodigoFinal;
  end;

  if priFiltroNome <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cidade].[nome] LIKE :nome ');
    locADOQuery.Parameters.ParamByName('nome').Value := StringLikeGerar(priFiltroNome);
  end;
  
  if (priFiltroBloqueado <> '') AND (priFiltroBloqueado <> FLAG_AMBOS) then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cidade].[bloqueado] = :bloqueado ');
    locADOQuery.Parameters.ParamByName('bloqueado').Value := priFiltroBloqueado;
  end;

  if (priFiltroAtivo <> '') AND (priFiltroAtivo <> FLAG_AMBOS) then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cidade].[ativo] = :ativo ');
    locADOQuery.Parameters.ParamByName('ativo').Value := priFiltroAtivo;
  end;

  if priFiltroInsDtHrInicial <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cidade].[ins_local_dt_hr] >= :ins_local_dt_hr_inicial ');
    locADOQuery.Parameters.ParamByName('ins_local_dt_hr_inicial').Value := DateTimeHorarioInicial(priFiltroInsDtHrInicial);
  end;

  if priFiltroInsDtHrFinal <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cidade].[ins_local_dt_hr] <= :ins_local_dt_hr_final ');
    locADOQuery.Parameters.ParamByName('ins_local_dt_hr_final').Value := DateTimeHorarioFinal(priFiltroInsDtHrFinal);
  end;

  if priFiltroUpdDtHrInicial <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cidade].[upd_local_dt_hr] >= :upd_local_dt_hr_inicial ');
    locADOQuery.Parameters.ParamByName('upd_local_dt_hr_inicial').Value := DateTimeHorarioInicial(priFiltroUpdDtHrInicial);
  end;

  if priFiltroUpdDtHrFinal <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [cidade].[upd_local_dt_hr] <= :upd_local_dt_hr_final ');
    locADOQuery.Parameters.ParamByName('upd_local_dt_hr_final').Value := DateTimeHorarioFinal(priFiltroUpdDtHrFinal);
  end;

  //
  // ORDER BY.
  //
  locADOQuery.SQL.Add('ORDER BY                   ');
  locADOQuery.SQL.Add('  [cidade].[cidade_id] ASC ');

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
// Procedimento para exibir o formul�rio de cadastro.
//
procedure TPlataformaERPVCLCidadeLista.FormularioCadastroExibir(argNovo: Boolean);
var
  locFormulario      : TPlataformaERPVCLCidadeCadastro;
  locDadosAtualizados: Boolean;
  locIndice          : Integer;
  locCidadeID        : Integer;
begin
  if argNovo then
  begin
    locIndice := VCL_NENHUM_INDICE;
    locCidadeID := 0;
  end
  else
  begin  
    locIndice := VCLListViewIndiceItemRetornar(lvwLista);
    if locIndice <= VCL_NENHUM_INDICE then Exit;
    locCidadeID := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_CIDADE_ID]);
  end;

  locFormulario := TPlataformaERPVCLCidadeCadastro.Create(Self);

  locFormulario.pubCidadeID := locCidadeID;
  
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