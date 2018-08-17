//
// Arquivo..: Plataforma_ERP_VCL_RegistroAcaoLista.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 17/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com a lista de ações com registros cadastradas.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_RegistroAcaoLista;

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
  TPlataformaERPVCLRegistroAcaoLista = class(TForm)
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
  
    priFiltroCodigoInicial        : string;
    priFiltroCodigoFinal          : string;
    priFiltroDescricao            : string;
    priFiltroBloqueado            : string;
    priFiltroAtivo                : string;
    priFiltroRegistroAcaoIDInicial: Integer;
    priFiltroRegistroAcaoIDFinal  : Integer;
    priFiltroInsDtHrInicial       : TDateTime;
    priFiltroInsDtHrFinal         : TDateTime;
    priFiltroUpdDtHrInicial       : TDateTime;
    priFiltroUpdDtHrFinal         : TDateTime;

    procedure FormularioControlar;
    procedure FormularioLocalizar;
    procedure FormularioAtualizar(argIndice: Integer);  
    procedure FormularioCadastroExibir(argNovo: Boolean);
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLRegistroAcaoLista: TPlataformaERPVCLRegistroAcaoLista;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico,
  Plataforma_ERP_VCL_RegistroAcaoFiltro,
  Plataforma_ERP_VCL_RegistroAcaoCadastro;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_RegistroAcaoLista.pas';

  LVW_LISTA_REGISTRO_ACAO_BASE_ID       : Integer = 0;
  LVW_LISTA_REGISTRO_ACAO_BASE_DESCRICAO: Integer = 1;
  LVW_LISTA_REGISTRO_ACAO_ID            : Integer = 2;
  LVW_LISTA_CODIGO                      : Integer = 3;
  LVW_LISTA_DESCRICAO                   : Integer = 4;
  LVW_LISTA_BLOQUEADO                   : Integer = 5;
  LVW_LISTA_ATIVO                       : Integer = 6;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLRegistroAcaoLista.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis privadas.
  //
  priListViewIndiceColuna    := VCL_NENHUM_INDICE;
  priListViewOrdemAscendente := False;
  
  priFiltroCodigoInicial         := '';
  priFiltroCodigoFinal           := '';
  priFiltroDescricao             := '';
  priFiltroBloqueado             := '';
  priFiltroAtivo                 := '';
  priFiltroRegistroAcaoIDInicial := 0;
  priFiltroRegistroAcaoIDFinal   := 0;
  priFiltroInsDtHrInicial        := 0;
  priFiltroInsDtHrFinal          := 0;
  priFiltroUpdDtHrInicial        := 0;
  priFiltroUpdDtHrFinal          := 0;

  //
  // Mensagem para o label de quantidade de registros.
  //
  lblListaQtde.Caption := VCL_MENSAGEM_ATUALIZAR;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLRegistroAcaoLista.FormShow(Sender: TObject);
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
procedure TPlataformaERPVCLRegistroAcaoLista.FormActivate(Sender: TObject);
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
procedure TPlataformaERPVCLRegistroAcaoLista.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLRegistroAcaoLista.mniLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

procedure TPlataformaERPVCLRegistroAcaoLista.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar(VCL_NENHUM_INDICE);
end;

procedure TPlataformaERPVCLRegistroAcaoLista.mniNovoClick(Sender: TObject);
begin
  FormularioCadastroExibir(True);
end;

procedure TPlataformaERPVCLRegistroAcaoLista.mniSelecionarClick(Sender: TObject);
begin
  FormularioCadastroExibir(False);
end;

procedure TPlataformaERPVCLRegistroAcaoLista.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLRegistroAcaoLista.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos de controle da lista.
//
procedure TPlataformaERPVCLRegistroAcaoLista.lvwListaColumnClick(Sender: TObject; Column: TListColumn);
begin
  VCLListViewColunaClicar(Sender, Column, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLRegistroAcaoLista.lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  VCLListViewComparar(Sender, Item1, Item2, Compare, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLRegistroAcaoLista.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLRegistroAcaoLista.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLRegistroAcaoLista.lvwListaDblClick(Sender: TObject);
begin
  FormularioCadastroExibir(False);
end;

procedure TPlataformaERPVCLRegistroAcaoLista.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

//
// Evento de click no botão "localizar".
//
procedure TPlataformaERPVCLRegistroAcaoLista.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no botão "novo".
//
procedure TPlataformaERPVCLRegistroAcaoLista.btnNovoClick(Sender: TObject);
begin
  FormularioCadastroExibir(True);
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLRegistroAcaoLista.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLRegistroAcaoLista.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Controla a exibição dos componentes do formulário.
//
procedure TPlataformaERPVCLRegistroAcaoLista.FormularioControlar;
begin
  //
  // Menu - Ações.
  //
  mniLocalizar.Visible  := (mniLocalizar.Enabled)  and (Plataforma_ERP_UsuarioRotina('ERP_REGISTRO_ACAO_LISTA_LOCALIZAR'));
  mniAtualizar.Visible  := (mniAtualizar.Enabled)  and (Plataforma_ERP_UsuarioRotina('ERP_REGISTRO_ACAO_LISTA_ATUALIZAR'));
  mniNovo.Visible       := (mniNovo.Enabled)       and (Plataforma_ERP_UsuarioRotina('ERP_REGISTRO_ACAO_LISTA_NOVO'));
  mniSelecionar.Visible := (mniSelecionar.Enabled) and (Plataforma_ERP_UsuarioRotina('ERP_REGISTRO_ACAO_LISTA_SELECIONAR'));
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
procedure TPlataformaERPVCLRegistroAcaoLista.FormularioLocalizar;
var
  locFormulario           : TPlataformaERPVCLRegistroAcaoFiltro;
  locClicouFechar         : Boolean;
  locCodigoInicial        : string;
  locCodigoFinal          : string;
  locDescricao            : string;
  locBloqueado            : string;
  locAtivo                : string;
  locRegistroAcaoIDInicial: Integer;
  locRegistroAcaoIDFinal  : Integer;
  locInsDtHrInicial       : TDateTime;
  locInsDtHrFinal         : TDateTime;
  locUpdDtHrInicial       : TDateTime;
  locUpdDtHrFinal         : TDateTime;
begin
  locFormulario := TPlataformaERPVCLRegistroAcaoFiltro.Create(Self);

  locFormulario.pubCodigoInicial         := priFiltroCodigoInicial;
  locFormulario.pubCodigoFinal           := priFiltroCodigoFinal;
  locFormulario.pubDescricao             := priFiltroDescricao;
  locFormulario.pubBloqueado             := priFiltroBloqueado;
  locFormulario.pubAtivo                 := priFiltroAtivo;
  locFormulario.pubRegistroAcaoIDInicial := priFiltroRegistroAcaoIDInicial;
  locFormulario.pubRegistroAcaoIDFinal   := priFiltroRegistroAcaoIDFinal;
  locFormulario.pubInsDtHrInicial        := priFiltroInsDtHrInicial;
  locFormulario.pubInsDtHrFinal          := priFiltroInsDtHrFinal;
  locFormulario.pubUpdDtHrInicial        := priFiltroUpdDtHrInicial;
  locFormulario.pubUpdDtHrFinal          := priFiltroUpdDtHrFinal;
  
  locFormulario.ShowModal;

  locClicouFechar          := locFormulario.pubClicouFechar;
  locCodigoInicial         := locFormulario.pubCodigoInicial;
  locCodigoFinal           := locFormulario.pubCodigoFinal;
  locDescricao             := locFormulario.pubDescricao;
  locBloqueado             := locFormulario.pubBloqueado;
  locAtivo                 := locFormulario.pubAtivo;
  locRegistroAcaoIDInicial := locFormulario.pubRegistroAcaoIDInicial;
  locRegistroAcaoIDFinal   := locFormulario.pubRegistroAcaoIDFinal;
  locInsDtHrInicial        := locFormulario.pubInsDtHrInicial;
  locInsDtHrFinal          := locFormulario.pubInsDtHrFinal;
  locUpdDtHrInicial        := locFormulario.pubUpdDtHrInicial;
  locUpdDtHrFinal          := locFormulario.pubUpdDtHrFinal;
  
  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    priFiltroCodigoInicial         := locCodigoInicial;
    priFiltroCodigoFinal           := locCodigoFinal;
    priFiltroDescricao             := locDescricao;
    priFiltroBloqueado             := locBloqueado;
    priFiltroAtivo                 := locAtivo;
    priFiltroRegistroAcaoIDInicial := locRegistroAcaoIDInicial;
    priFiltroRegistroAcaoIDFinal   := locRegistroAcaoIDFinal;
    priFiltroInsDtHrInicial        := locInsDtHrInicial;
    priFiltroInsDtHrFinal          := locInsDtHrFinal;
    priFiltroUpdDtHrInicial        := locUpdDtHrInicial;
    priFiltroUpdDtHrFinal          := locUpdDtHrFinal;

    FormularioAtualizar(VCL_NENHUM_INDICE);
  end;
end;

//
// Procedimento para atualizar a lista do formulário.
//
procedure TPlataformaERPVCLRegistroAcaoLista.FormularioAtualizar(argIndice: Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioAtualizar';
  ERRO_MENSAGEM    : string = 'Impossível atualizar lista de ações com registros!';
var
  locADOConnection     : TADOConnection;
  locADOQuery          : TADOQuery;
  locRegistroAcaoBaseID: Integer;
  locLogMensagem       : string;
  locListItem          : TListItem;
  locFiltros           : Boolean;
begin
  //
  // ID da base de dados.
  //
  locRegistroAcaoBaseID := gloBaseID;

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
  locADOQuery.SQL.Add('SELECT                                                                  ');
  locADOQuery.SQL.Add('  [base].[base_id]                   AS [registro_acao_base_id],        ');
  locADOQuery.SQL.Add('  [base].[descricao]                 AS [registro_acao_base_descricao], ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_id] AS [registro_acao_id],             ');
  locADOQuery.SQL.Add('  [registro_acao].[codigo]           AS [codigo],                       ');
  locADOQuery.SQL.Add('  [registro_acao].[descricao]        AS [descricao],                    ');
  locADOQuery.SQL.Add('  [registro_acao].[bloqueado]        AS [bloqueado],                    ');
  locADOQuery.SQL.Add('  [registro_acao].[ativo]            AS [ativo]                         ');
  locADOQuery.SQL.Add('FROM                                                                    ');
  locADOQuery.SQL.Add('  [registro_acao] WITH (NOLOCK)                                         ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                                       ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [registro_acao].[registro_acao_base_id]       ');
  locADOQuery.SQL.Add('WHERE                                                                   ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_base_id] = :registro_acao_base_id      ');

  locADOQuery.Parameters.ParamByName('registro_acao_base_id').Value := locRegistroAcaoBaseID;

  //
  // Filtros.
  //
  locFiltros := False;

  if priFiltroRegistroAcaoIDInicial > 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [registro_acao].[registro_acao_id] >= :registro_acao_id_inicial ');
    locADOQuery.Parameters.ParamByName('registro_acao_id_inicial').Value := priFiltroRegistroAcaoIDInicial;
  end;

  if priFiltroRegistroAcaoIDFinal > 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [registro_acao].[registro_acao_id] <= :registro_acao_id_final ');
    locADOQuery.Parameters.ParamByName('registro_acao_id_final').Value := priFiltroRegistroAcaoIDFinal;
  end;

  if priFiltroCodigoInicial <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [registro_acao].[codigo] >= :codigo_inicial ');
    locADOQuery.Parameters.ParamByName('codigo_inicial').Value := priFiltroCodigoInicial;
  end;

  if priFiltroCodigoFinal <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [registro_acao].[codigo] <= :codigo_final ');
    locADOQuery.Parameters.ParamByName('codigo_final').Value := priFiltroCodigoFinal;
  end;

  if priFiltroDescricao <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [registro_acao].[descricao] LIKE :descricao ');
    locADOQuery.Parameters.ParamByName('descricao').Value := StringLikeGerar(priFiltroDescricao);
  end;
  
  if (priFiltroBloqueado <> '') AND (priFiltroBloqueado <> FLAG_AMBOS) then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [registro_acao].[bloqueado] = :bloqueado ');
    locADOQuery.Parameters.ParamByName('bloqueado').Value := priFiltroBloqueado;
  end;

  if (priFiltroAtivo <> '') AND (priFiltroAtivo <> FLAG_AMBOS) then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [registro_acao].[ativo] = :ativo ');
    locADOQuery.Parameters.ParamByName('ativo').Value := priFiltroAtivo;
  end;

  if priFiltroInsDtHrInicial <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [registro_acao].[ins_local_dt_hr] >= :ins_local_dt_hr_inicial ');
    locADOQuery.Parameters.ParamByName('ins_local_dt_hr_inicial').Value := DateTimeHorarioInicial(priFiltroInsDtHrInicial);
  end;

  if priFiltroInsDtHrFinal <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [registro_acao].[ins_local_dt_hr] <= :ins_local_dt_hr_final ');
    locADOQuery.Parameters.ParamByName('ins_local_dt_hr_final').Value := DateTimeHorarioFinal(priFiltroInsDtHrFinal);
  end;

  if priFiltroUpdDtHrInicial <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [registro_acao].[upd_local_dt_hr] >= :upd_local_dt_hr_inicial ');
    locADOQuery.Parameters.ParamByName('upd_local_dt_hr_inicial').Value := DateTimeHorarioInicial(priFiltroUpdDtHrInicial);
  end;

  if priFiltroUpdDtHrFinal <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [registro_acao].[upd_local_dt_hr] <= :upd_local_dt_hr_final ');
    locADOQuery.Parameters.ParamByName('upd_local_dt_hr_final').Value := DateTimeHorarioFinal(priFiltroUpdDtHrFinal);
  end;

  //
  // Order by.
  //  
  locADOQuery.SQL.Add('ORDER BY                          ');
  locADOQuery.SQL.Add('  [registro_acao].[codigo] ASC ');

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar os registros na tabela [registro_acao]!';
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
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('registro_acao_base_id').AsInteger));
      locListItem.SubItems.Add(locADOQuery.FieldByName('registro_acao_base_descricao').AsString);
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('registro_acao_id').AsInteger));
      locListItem.SubItems.Add(locADOQuery.FieldByName('codigo').AsString);
      locListItem.SubItems.Add(locADOQuery.FieldByName('descricao').AsString);
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
procedure TPlataformaERPVCLRegistroAcaoLista.FormularioCadastroExibir(argNovo: Boolean);
var
  locFormulario        : TPlataformaERPVCLRegistroAcaoCadastro;
  locDadosAtualizados  : Boolean;
  locIndice            : Integer;
  locRegistroAcaoBaseID: Integer;
  locRegistroAcaoID    : Integer;
begin
  if argNovo then
  begin
    locIndice             := VCL_NENHUM_INDICE;
    locRegistroAcaoBaseID := 0;
    locRegistroAcaoID     := 0;
  end
  else
  begin  
    locIndice := VCLListViewIndiceItemRetornar(lvwLista);
    if locIndice <= VCL_NENHUM_INDICE then Exit;

    locRegistroAcaoBaseID := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_REGISTRO_ACAO_BASE_ID]);
    locRegistroAcaoID     := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_REGISTRO_ACAO_ID]);
  end;

  locFormulario := TPlataformaERPVCLRegistroAcaoCadastro.Create(Self);

  locFormulario.pubRegistroAcaoBaseID := locRegistroAcaoBaseID;
  locFormulario.pubRegistroAcaoID     := locRegistroAcaoID;
  
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