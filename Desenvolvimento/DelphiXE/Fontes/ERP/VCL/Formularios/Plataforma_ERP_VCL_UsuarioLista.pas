//
// Arquivo..: Plataforma_ERP_VCL_UsuarioLista.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com a lista de usuários cadastrados.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_UsuarioLista;

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
  Vcl.ComCtrls;

type
  TPlataformaERPVCLUsuarioLista = class(TForm)
    imgFormulario: TImage;
    panFormulario: TPanel;
    btnAtualizar: TBitBtn;
    lvwLista: TListView;
    btnFechar: TBitBtn;
    btnMinimizar: TBitBtn;
    btnSelecionar: TBitBtn;
    btnNovo: TBitBtn;
    pbaProgresso: TProgressBar;
    btnLocalizar: TBitBtn;
    lblListaQtde: TLabel;
    lblListaFiltros: TLabel;
    imgBackground: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaDblClick(Sender: TObject);
    procedure lvwListaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure lvwListaColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
  private
    priListViewIndiceColuna   : Integer;
    priListViewOrdemAscendente: Boolean;
  
    priFiltroCodigoInicial    : string;
    priFiltroCodigoFinal      : string;
    priFiltroNome             : string;
    priFiltroBloqueado        : string;
    priFiltroAtivo            : string;
    priFiltroUsuarioIDInicial : Integer;
    priFiltroUsuarioIDFinal   : Integer;
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
  PlataformaERPVCLUsuarioLista: TPlataformaERPVCLUsuarioLista;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico,
  Plataforma_ERP_VCL_UsuarioFiltro,
  Plataforma_ERP_VCL_UsuarioCadastro;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_UsuarioLista.pas';

  LVW_LISTA_LICENCA_ID    : Integer = 0;
  LVW_LISTA_BASE_ID       : Integer = 1;
  LVW_LISTA_BASE_DESCRICAO: Integer = 2;
  LVW_LISTA_USUARIO_ID    : Integer = 3;
  LVW_LISTA_CODIGO        : Integer = 4;
  LVW_LISTA_NOME          : Integer = 5;
  LVW_LISTA_BLOQUEADO     : Integer = 6;
  LVW_LISTA_ATIVO         : Integer = 7;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLUsuarioLista.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis privadas.
  //
  priListViewIndiceColuna    := VCL_NENHUM_INDICE;
  priListViewOrdemAscendente := False;
  
  priFiltroCodigoInicial     := '';
  priFiltroCodigoFinal       := '';
  priFiltroNome              := '';
  priFiltroBloqueado         := '';
  priFiltroAtivo             := '';
  priFiltroUsuarioIDInicial  := 0;
  priFiltroUsuarioIDFinal    := 0;
  priFiltroInsDtHrInicial    := 0;
  priFiltroInsDtHrFinal      := 0;
  priFiltroUpdDtHrInicial    := 0;
  priFiltroUpdDtHrFinal      := 0;

  //
  // Mensagem para o label de quantidade de registros.
  //
  lblListaQtde.Caption := VCL_MENSAGEM_ATUALIZAR;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLUsuarioLista.FormShow(Sender: TObject);
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
procedure TPlataformaERPVCLUsuarioLista.FormActivate(Sender: TObject);
begin
  VCLListViewColunarDimensionar(lvwLista);

  lblListaQtde.Left := lvwLista.Left;
  lblListaQtde.Top  := (lvwLista.Top + lvwLista.Height) + 8;

  lblListaFiltros.Left := (lvwLista.Left + lvwLista.Width) - lblListaFiltros.Width;
  lblListaFiltros.Top  := (lvwLista.Top + lvwLista.Height) + 8;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLUsuarioLista.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de controle da lista.
//
procedure TPlataformaERPVCLUsuarioLista.lvwListaColumnClick(Sender: TObject; Column: TListColumn);
begin
  VCLListViewColunaClicar(Sender, Column, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLUsuarioLista.lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  VCLListViewComparar(Sender, Item1, Item2, Compare, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLUsuarioLista.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLUsuarioLista.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLUsuarioLista.lvwListaDblClick(Sender: TObject);
begin
  FormularioCadastroExibir(False);
end;

procedure TPlataformaERPVCLUsuarioLista.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

//
// Evento de click no botão "localizar".
//
procedure TPlataformaERPVCLUsuarioLista.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no botão "atualizar".
//
procedure TPlataformaERPVCLUsuarioLista.btnAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar(VCL_NENHUM_INDICE);
end;

//
// Evento de click no botão "novo".
//
procedure TPlataformaERPVCLUsuarioLista.btnNovoClick(Sender: TObject);
begin
  FormularioCadastroExibir(True);
end;

//
// Evento de click no botão "selecionar".
//
procedure TPlataformaERPVCLUsuarioLista.btnSelecionarClick(Sender: TObject);
begin
  FormularioCadastroExibir(False);
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLUsuarioLista.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLUsuarioLista.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Controla a exibição dos componentes do formulário.
//
procedure TPlataformaERPVCLUsuarioLista.FormularioControlar;
begin
  btnLocalizar.Visible  := (btnLocalizar.Visible)  and (Plataforma_ERP_UsuarioRotina('ERP_USUARIO_LISTA_LOCALIZAR'));
  btnAtualizar.Visible  := (btnAtualizar.Visible)  and (Plataforma_ERP_UsuarioRotina('ERP_USUARIO_LISTA_ATUALIZAR'));
  btnNovo.Visible       := (btnNovo.Visible)       and (Plataforma_ERP_UsuarioRotina('ERP_USUARIO_LISTA_NOVO'));
  btnSelecionar.Visible := (btnSelecionar.Visible) and (Plataforma_ERP_UsuarioRotina('ERP_USUARIO_LISTA_SELECIONAR'));
end;

//
// Procedimento para localizar registros cadastros.
//
procedure TPlataformaERPVCLUsuarioLista.FormularioLocalizar;
var
  locFormulario      : TPlataformaERPVCLUsuarioFiltro;
  locClicouFechar    : Boolean;
  locCodigoInicial   : string;
  locCodigoFinal     : string;
  locNome            : string;
  locBloqueado       : string;
  locAtivo           : string;
  locUsuarioIDInicial: Integer;
  locUsuarioIDFinal  : Integer;
  locInsDtHrInicial  : TDateTime;
  locInsDtHrFinal    : TDateTime;
  locUpdDtHrInicial  : TDateTime;
  locUpdDtHrFinal    : TDateTime;
begin
  locFormulario := TPlataformaERPVCLUsuarioFiltro.Create(Self);

  locFormulario.pubCodigoInicial    := priFiltroCodigoInicial;
  locFormulario.pubCodigoFinal      := priFiltroCodigoFinal;
  locFormulario.pubNome             := priFiltroNome;
  locFormulario.pubBloqueado        := priFiltroBloqueado;
  locFormulario.pubAtivo            := priFiltroAtivo;
  locFormulario.pubUsuarioIDInicial := priFiltroUsuarioIDInicial;
  locFormulario.pubUsuarioIDFinal   := priFiltroUsuarioIDFinal;
  locFormulario.pubInsDtHrInicial   := priFiltroInsDtHrInicial;
  locFormulario.pubInsDtHrFinal     := priFiltroInsDtHrFinal;
  locFormulario.pubUpdDtHrInicial   := priFiltroUpdDtHrInicial;
  locFormulario.pubUpdDtHrFinal     := priFiltroUpdDtHrFinal;
  
  locFormulario.ShowModal;

  locClicouFechar     := locFormulario.pubClicouFechar;
  locCodigoInicial    := locFormulario.pubCodigoInicial;
  locCodigoFinal      := locFormulario.pubCodigoFinal;
  locNome             := locFormulario.pubNome;
  locBloqueado        := locFormulario.pubBloqueado;
  locAtivo            := locFormulario.pubAtivo;
  locUsuarioIDInicial := locFormulario.pubUsuarioIDInicial;
  locUsuarioIDFinal   := locFormulario.pubUsuarioIDFinal;
  locInsDtHrInicial   := locFormulario.pubInsDtHrInicial;
  locInsDtHrFinal     := locFormulario.pubInsDtHrFinal;
  locUpdDtHrInicial   := locFormulario.pubUpdDtHrInicial;
  locUpdDtHrFinal     := locFormulario.pubUpdDtHrFinal;
  
  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    priFiltroCodigoInicial    := locCodigoInicial;
    priFiltroCodigoFinal      := locCodigoFinal;
    priFiltroNome             := locNome;
    priFiltroBloqueado        := locBloqueado;
    priFiltroAtivo            := locAtivo;
    priFiltroUsuarioIDInicial := locUsuarioIDInicial;
    priFiltroUsuarioIDFinal   := locUsuarioIDFinal;
    priFiltroInsDtHrInicial   := locInsDtHrInicial;
    priFiltroInsDtHrFinal     := locInsDtHrFinal;
    priFiltroUpdDtHrInicial   := locUpdDtHrInicial;
    priFiltroUpdDtHrFinal     := locUpdDtHrFinal;

    FormularioAtualizar(VCL_NENHUM_INDICE);
  end;
end;

//
// Procedimento para atualizar a lista do formulário.
//
procedure TPlataformaERPVCLUsuarioLista.FormularioAtualizar(argIndice: Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioAtualizar';
  ERRO_MENSAGEM    : string = 'Impossível atualizar lista de usuários!';
var
  locADOConnection : TADOConnection;
  locADOQuery      : TADOQuery;
  locLogMensagem   : string;
  locLicencaID     : Integer;
  locListItem      : TListItem;
  locFiltros       : Boolean;
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
  locADOQuery.SQL.Add('SELECT                                                 ');
  locADOQuery.SQL.Add('  [licenca].[licenca_id] AS [licenca_id],              ');
  locADOQuery.SQL.Add('  [base].[base_id]       AS [base_id],                 ');
  locADOQuery.SQL.Add('  [base].[descricao]     AS [base_descricao],          ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id] AS [usuario_id],              ');
  locADOQuery.SQL.Add('  [usuario].[codigo]     AS [codigo],                  ');
  locADOQuery.SQL.Add('  [usuario].[nome]       AS [nome],                    ');
  locADOQuery.SQL.Add('  [usuario].[bloqueado]  AS [bloqueado],               ');
  locADOQuery.SQL.Add('  [usuario].[ativo]      AS [ativo]                    ');
  locADOQuery.SQL.Add('FROM                                                   ');
  locADOQuery.SQL.Add('  [usuario] WITH (NOLOCK)                              ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                      ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [usuario].[base_id]          ');
  locADOQuery.SQL.Add('  INNER JOIN [licenca] WITH (NOLOCK)                   ');
  locADOQuery.SQL.Add('    ON [licenca].[licenca_id] = [usuario].[licenca_id] ');
  locADOQuery.SQL.Add('WHERE                                                  ');
  locADOQuery.SQL.Add('  [usuario].[licenca_id] = :licenca_id                 ');

  //
  // Filtros.
  //
  locFiltros := False;

  if priFiltroUsuarioIDInicial > 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [usuario].[usuario_id] >= :usuario_id_inicial ');
    locADOQuery.Parameters.ParamByName('usuario_id_inicial').Value := priFiltroUsuarioIDInicial;
  end;

  if priFiltroUsuarioIDFinal > 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [usuario].[usuario_id] <= :usuario_id_final ');
    locADOQuery.Parameters.ParamByName('usuario_id_final').Value := priFiltroUsuarioIDFinal;
  end;

  if priFiltroCodigoInicial <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [usuario].[codigo] >= :codigo_inicial ');
    locADOQuery.Parameters.ParamByName('codigo_inicial').Value := priFiltroCodigoInicial;
  end;

  if priFiltroCodigoFinal <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [usuario].[codigo] <= :codigo_final ');
    locADOQuery.Parameters.ParamByName('codigo_final').Value := priFiltroCodigoFinal;
  end;

  if priFiltroNome <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [usuario].[nome] LIKE :nome ');
    locADOQuery.Parameters.ParamByName('nome').Value := StringLikeGerar(priFiltroNome);
  end;
  
  if (priFiltroBloqueado <> '') AND (priFiltroBloqueado <> FLAG_AMBOS) then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [usuario].[bloqueado] = :bloqueado ');
    locADOQuery.Parameters.ParamByName('bloqueado').Value := priFiltroBloqueado;
  end;

  if (priFiltroAtivo <> '') AND (priFiltroAtivo <> FLAG_AMBOS) then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [usuario].[ativo] = :ativo ');
    locADOQuery.Parameters.ParamByName('ativo').Value := priFiltroAtivo;
  end;

  if priFiltroInsDtHrInicial <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [usuario].[ins_local_dt_hr] >= :ins_local_dt_hr_inicial ');
    locADOQuery.Parameters.ParamByName('ins_local_dt_hr_inicial').Value := DateTimeHorarioInicial(priFiltroInsDtHrInicial);
  end;

  if priFiltroInsDtHrFinal <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [usuario].[ins_local_dt_hr] <= :ins_local_dt_hr_final ');
    locADOQuery.Parameters.ParamByName('ins_local_dt_hr_final').Value := DateTimeHorarioFinal(priFiltroInsDtHrFinal);
  end;

  if priFiltroUpdDtHrInicial <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND EXISTS (SELECT TOP 1                                                                 ');
    locADOQuery.SQL.Add('               1                                                                          ');
    locADOQuery.SQL.Add('             FROM                                                                         ');
    locADOQuery.SQL.Add('               [usuario_log] WITH (NOLOCK)                                                ');
    locADOQuery.SQL.Add('               INNER JOIN [registro_acao] WITH (NOLOCK)                                   ');
    locADOQuery.SQL.Add('                 ON [registro_acao].[registro_acao_id] = [usuario_log].[registro_acao_id] ');
    locADOQuery.SQL.Add('             WHERE                                                                        ');
    locADOQuery.SQL.Add('               [usuario_log].[licenca_id]       = [usuario].[licenca_id]   AND            ');
    locADOQuery.SQL.Add('               [usuario_log].[base_id]          = [usuario].[base_id]      AND            ');
    locADOQuery.SQL.Add('               [usuario_log].[usuario_id]       = [usuario].[usuario_id]   AND            ');
    locADOQuery.SQL.Add('               [usuario_log].[log_local_dt_hr] >= :log_local_dt_hr_inicial AND            ');
    locADOQuery.SQL.Add('               [registro_acao].[alteracao]      = ''S'')                                  ');
    locADOQuery.Parameters.ParamByName('log_local_dt_hr_inicial').Value := DateTimeHorarioInicial(priFiltroUpdDtHrInicial);
  end;

  if priFiltroUpdDtHrFinal <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND EXISTS (SELECT TOP 1                                                                 ');
    locADOQuery.SQL.Add('               1                                                                          ');
    locADOQuery.SQL.Add('             FROM                                                                         ');
    locADOQuery.SQL.Add('               [usuario_log] WITH (NOLOCK)                                                ');
    locADOQuery.SQL.Add('               INNER JOIN [registro_acao] WITH (NOLOCK)                                   ');
    locADOQuery.SQL.Add('                 ON [registro_acao].[registro_acao_id] = [usuario_log].[registro_acao_id] ');
    locADOQuery.SQL.Add('             WHERE                                                                        ');
    locADOQuery.SQL.Add('               [usuario_log].[licenca_id]       = [usuario].[licenca_id] AND              ');
    locADOQuery.SQL.Add('               [usuario_log].[base_id]          = [usuario].[base_id]    AND              ');
    locADOQuery.SQL.Add('               [usuario_log].[usuario_id]       = [usuario].[usuario_id] AND              ');
    locADOQuery.SQL.Add('               [usuario_log].[log_local_dt_hr] <= :log_local_dt_hr_final AND              ');
    locADOQuery.SQL.Add('               [registro_acao].[alteracao]      = ''S'')                                  ');
    locADOQuery.Parameters.ParamByName('log_local_dt_hr_final').Value := DateTimeHorarioFinal(priFiltroUpdDtHrFinal);
  end;

  //
  // Order by.
  //  
  locADOQuery.SQL.Add('ORDER BY                 ');
  locADOQuery.SQL.Add('  [usuario].[codigo] ASC ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value := locLicencaID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar os registros na tabela usuario!';
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
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('licenca_id').AsInteger));
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('base_id').AsInteger));
      locListItem.SubItems.Add(locADOQuery.FieldByName('base_descricao').AsString);
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('usuario_id').AsInteger));
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
procedure TPlataformaERPVCLUsuarioLista.FormularioCadastroExibir(argNovo: Boolean);
var
  locFormulario      : TPlataformaERPVCLUsuarioCadastro;
  locDadosAtualizados: Boolean;
  locIndice          : Integer;
  locBaseID          : Integer;
  locLicencaID       : Integer;
  locUsuarioID       : Integer;
begin
  if argNovo then
  begin
    locIndice    := VCL_NENHUM_INDICE;
    locLicencaID := 0;
    locBaseID    := 0;
    locUsuarioID := 0;
  end
  else
  begin  
    locIndice := VCLListViewIndiceItemRetornar(lvwLista);
    if locIndice <= VCL_NENHUM_INDICE then Exit;

    locLicencaID := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_LICENCA_ID]);
    locBaseID    := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_BASE_ID]);
    locUsuarioID := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_USUARIO_ID]);
  end;

  locFormulario := TPlataformaERPVCLUsuarioCadastro.Create(Self);

  locFormulario.pubLicencaID := locLicencaID;
  locFormulario.pubBaseID    := locBaseID;
  locFormulario.pubUsuarioID := locUsuarioID;
  
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