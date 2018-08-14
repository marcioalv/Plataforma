//
// Arquivo..: Plataforma_ERP_VCL_TiposUsuariosLista.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com a lista de tipos de usuários cadastrados.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_TiposUsuariosLista;

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
  TPlataformaERPVCLTiposUsuariosLista = class(TForm)
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
    priListViewIndiceColuna      : Integer;
    priListViewOrdemAscendente   : Boolean;
  
    priFiltroCodigoInicial       : string;
    priFiltroCodigoFinal         : string;
    priFiltroDescricao           : string;
    priFiltroBloqueado           : string;
    priFiltroAtivo               : string;
    priFiltroTipoUsuarioIDInicial: Integer;
    priFiltroTipoUsuarioIDFinal  : Integer;
    priFiltroInsDtHrInicial      : TDateTime;
    priFiltroInsDtHrFinal        : TDateTime;
    priFiltroUpdDtHrInicial      : TDateTime;
    priFiltroUpdDtHrFinal        : TDateTime;

    procedure FormularioControlar;
    procedure FormularioLocalizar;
    procedure FormularioAtualizar(argIndice: Integer);  
    procedure FormularioCadastroExibir(argNovo: Boolean);
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLTiposUsuariosLista: TPlataformaERPVCLTiposUsuariosLista;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico,
  Plataforma_ERP_VCL_TiposUsuariosFiltro,
  Plataforma_ERP_VCL_TiposUsuariosCadastro;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_TiposUsuariosLista.pas';

  LVW_LISTA_LICENCA_ID                 : Integer = 0;
  LVW_LISTA_TIPO_USUARIO_BASE_ID       : Integer = 1;
  LVW_LISTA_TIPO_USUARIO_BASE_DESCRICAO: Integer = 2;
  LVW_LISTA_TIPO_USUARIO_ID            : Integer = 3;
  LVW_LISTA_CODIGO                     : Integer = 4;
  LVW_LISTA_DESCRICAO                  : Integer = 5;
  LVW_LISTA_BLOQUEADO                  : Integer = 6;
  LVW_LISTA_ATIVO                      : Integer = 7;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosLista.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis privadas.
  //
  priListViewIndiceColuna       := VCL_NENHUM_INDICE;
  priListViewOrdemAscendente    := False;
  
  priFiltroCodigoInicial        := '';
  priFiltroCodigoFinal          := '';
  priFiltroDescricao            := '';
  priFiltroBloqueado            := '';
  priFiltroAtivo                := '';
  priFiltroTipoUsuarioIDInicial := 0;
  priFiltroTipoUsuarioIDFinal   := 0;
  priFiltroInsDtHrInicial       := 0;
  priFiltroInsDtHrFinal         := 0;
  priFiltroUpdDtHrInicial       := 0;
  priFiltroUpdDtHrFinal         := 0;

  //
  // Mensagem para o label de quantidade de registros.
  //
  lblListaQtde.Caption := VCL_MENSAGEM_ATUALIZAR;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosLista.FormShow(Sender: TObject);
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
procedure TPlataformaERPVCLTiposUsuariosLista.FormActivate(Sender: TObject);
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
procedure TPlataformaERPVCLTiposUsuariosLista.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLTiposUsuariosLista.mniLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

procedure TPlataformaERPVCLTiposUsuariosLista.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar(VCL_NENHUM_INDICE);
end;

procedure TPlataformaERPVCLTiposUsuariosLista.mniNovoClick(Sender: TObject);
begin
  FormularioCadastroExibir(True);
end;

procedure TPlataformaERPVCLTiposUsuariosLista.mniSelecionarClick(Sender: TObject);
begin
  FormularioCadastroExibir(False);
end;

procedure TPlataformaERPVCLTiposUsuariosLista.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLTiposUsuariosLista.mniFecharClick(Sender: TObject);
begin
  Close;
end;


//
// Eventos de controle da lista.
//
procedure TPlataformaERPVCLTiposUsuariosLista.lvwListaColumnClick(Sender: TObject; Column: TListColumn);
begin
  VCLListViewColunaClicar(Sender, Column, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLTiposUsuariosLista.lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  VCLListViewComparar(Sender, Item1, Item2, Compare, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLTiposUsuariosLista.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLTiposUsuariosLista.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLTiposUsuariosLista.lvwListaDblClick(Sender: TObject);
begin
  FormularioCadastroExibir(False);
end;

procedure TPlataformaERPVCLTiposUsuariosLista.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

//
// Evento de click no botão "localizar".
//
procedure TPlataformaERPVCLTiposUsuariosLista.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no botão "novo".
//
procedure TPlataformaERPVCLTiposUsuariosLista.btnNovoClick(Sender: TObject);
begin
  FormularioCadastroExibir(True);
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLTiposUsuariosLista.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLTiposUsuariosLista.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Controla a exibição dos componentes do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosLista.FormularioControlar;
begin
  //
  // Menu - Ações.
  //
  mniLocalizar.Visible  := (mniLocalizar.Enabled)  and (Plataforma_ERP_UsuarioRotina('ERP_TIPO_USUARIO_LISTA_LOCALIZAR'));
  mniAtualizar.Visible  := (mniAtualizar.Enabled)  and (Plataforma_ERP_UsuarioRotina('ERP_TIPO_USUARIO_LISTA_ATUALIZAR'));
  mniNovo.Visible       := (mniNovo.Enabled)       and (Plataforma_ERP_UsuarioRotina('ERP_TIPO_USUARIO_LISTA_NOVO'));
  mniSelecionar.Visible := (mniSelecionar.Enabled) and (Plataforma_ERP_UsuarioRotina('ERP_TIPO_USUARIO_LISTA_SELECIONAR'));
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
procedure TPlataformaERPVCLTiposUsuariosLista.FormularioLocalizar;
var
  locFormulario          : TPlataformaERPVCLTiposUsuariosFiltro;
  locClicouFechar        : Boolean;
  locCodigoInicial       : string;
  locCodigoFinal         : string;
  locDescricao           : string;
  locBloqueado           : string;
  locAtivo               : string;
  locTipoUsuarioIDInicial: Integer;
  locTipoUsuarioIDFinal  : Integer;
  locInsDtHrInicial      : TDateTime;
  locInsDtHrFinal        : TDateTime;
  locUpdDtHrInicial      : TDateTime;
  locUpdDtHrFinal        : TDateTime;
begin
  locFormulario := TPlataformaERPVCLTiposUsuariosFiltro.Create(Self);

  locFormulario.pubCodigoInicial        := priFiltroCodigoInicial;
  locFormulario.pubCodigoFinal          := priFiltroCodigoFinal;
  locFormulario.pubDescricao            := priFiltroDescricao;
  locFormulario.pubBloqueado            := priFiltroBloqueado;
  locFormulario.pubAtivo                := priFiltroAtivo;
  locFormulario.pubTipoUsuarioIDInicial := priFiltroTipoUsuarioIDInicial;
  locFormulario.pubTipoUsuarioIDFinal   := priFiltroTipoUsuarioIDFinal;
  locFormulario.pubInsDtHrInicial       := priFiltroInsDtHrInicial;
  locFormulario.pubInsDtHrFinal         := priFiltroInsDtHrFinal;
  locFormulario.pubUpdDtHrInicial       := priFiltroUpdDtHrInicial;
  locFormulario.pubUpdDtHrFinal         := priFiltroUpdDtHrFinal;
  
  locFormulario.ShowModal;

  locClicouFechar         := locFormulario.pubClicouFechar;
  locCodigoInicial        := locFormulario.pubCodigoInicial;
  locCodigoFinal          := locFormulario.pubCodigoFinal;
  locDescricao            := locFormulario.pubDescricao;
  locBloqueado            := locFormulario.pubBloqueado;
  locAtivo                := locFormulario.pubAtivo;
  locTipoUsuarioIDInicial := locFormulario.pubTipoUsuarioIDInicial;
  locTipoUsuarioIDFinal   := locFormulario.pubTipoUsuarioIDFinal;
  locInsDtHrInicial       := locFormulario.pubInsDtHrInicial;
  locInsDtHrFinal         := locFormulario.pubInsDtHrFinal;
  locUpdDtHrInicial       := locFormulario.pubUpdDtHrInicial;
  locUpdDtHrFinal         := locFormulario.pubUpdDtHrFinal;
  
  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    priFiltroCodigoInicial        := locCodigoInicial;
    priFiltroCodigoFinal          := locCodigoFinal;
    priFiltroDescricao            := locDescricao;
    priFiltroBloqueado            := locBloqueado;
    priFiltroAtivo                := locAtivo;
    priFiltroTipoUsuarioIDInicial := locTipoUsuarioIDInicial;
    priFiltroTipoUsuarioIDFinal   := locTipoUsuarioIDFinal;
    priFiltroInsDtHrInicial       := locInsDtHrInicial;
    priFiltroInsDtHrFinal         := locInsDtHrFinal;
    priFiltroUpdDtHrInicial       := locUpdDtHrInicial;
    priFiltroUpdDtHrFinal         := locUpdDtHrFinal;

    FormularioAtualizar(VCL_NENHUM_INDICE);
  end;
end;

//
// Procedimento para atualizar a lista do formulário.
//
procedure TPlataformaERPVCLTiposUsuariosLista.FormularioAtualizar(argIndice: Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioAtualizar';
  ERRO_MENSAGEM    : string = 'Impossível atualizar lista de tipos de usuário!';
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
  locADOQuery.SQL.Add('SELECT                                                               ');
  locADOQuery.SQL.Add('  [licenca].[licenca_id]           AS [licenca_id],                  ');
  locADOQuery.SQL.Add('  [base].[base_id]                 AS [tipo_usuario_base_id],        ');
  locADOQuery.SQL.Add('  [base].[descricao]               AS [tipo_usuario_base_descricao], ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_id] AS [tipo_usuario_id],             ');
  locADOQuery.SQL.Add('  [tipo_usuario].[codigo]          AS [codigo],                      ');
  locADOQuery.SQL.Add('  [tipo_usuario].[descricao]       AS [descricao],                   ');
  locADOQuery.SQL.Add('  [tipo_usuario].[bloqueado]       AS [bloqueado],                   ');
  locADOQuery.SQL.Add('  [tipo_usuario].[ativo]           AS [ativo]                        ');
  locADOQuery.SQL.Add('FROM                                                                 ');
  locADOQuery.SQL.Add('  [tipo_usuario] WITH (NOLOCK)                                       ');
  locADOQuery.SQL.Add('  INNER JOIN [licenca] WITH (NOLOCK)                                 ');
  locADOQuery.SQL.Add('    ON [licenca].[licenca_id] = [tipo_usuario].[licenca_id]          ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                                    ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [tipo_usuario].[tipo_usuario_base_id]      ');
  locADOQuery.SQL.Add('WHERE                                                                ');
  locADOQuery.SQL.Add('  [tipo_usuario].[licenca_id] = :licenca_id                          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value := locLicencaID;

  //
  // Filtros.
  //
  locFiltros := False;

  if priFiltroTipoUsuarioIDInicial > 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [tipo_usuario].[tipo_usuario_id] >= :tipo_usuario_id_inicial ');
    locADOQuery.Parameters.ParamByName('tipo_usuario_id_inicial').Value := priFiltroTipoUsuarioIDInicial;
  end;

  if priFiltroTipoUsuarioIDFinal > 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [tipo_usuario].[tipo_usuario_id] <= :tipo_usuario_id_final ');
    locADOQuery.Parameters.ParamByName('tipo_usuario_id_final').Value := priFiltroTipoUsuarioIDFinal;
  end;

  if priFiltroCodigoInicial <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [tipo_usuario].[codigo] >= :codigo_inicial ');
    locADOQuery.Parameters.ParamByName('codigo_inicial').Value := priFiltroCodigoInicial;
  end;

  if priFiltroCodigoFinal <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [tipo_usuario].[codigo] <= :codigo_final ');
    locADOQuery.Parameters.ParamByName('codigo_final').Value := priFiltroCodigoFinal;
  end;

  if priFiltroDescricao <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [tipo_usuario].[descricao] LIKE :descricao ');
    locADOQuery.Parameters.ParamByName('descricao').Value := StringLikeGerar(priFiltroDescricao);
  end;
  
  if (priFiltroBloqueado <> '') AND (priFiltroBloqueado <> FLAG_AMBOS) then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [tipo_usuario].[bloqueado] = :bloqueado ');
    locADOQuery.Parameters.ParamByName('bloqueado').Value := priFiltroBloqueado;
  end;

  if (priFiltroAtivo <> '') AND (priFiltroAtivo <> FLAG_AMBOS) then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [tipo_usuario].[ativo] = :ativo ');
    locADOQuery.Parameters.ParamByName('ativo').Value := priFiltroAtivo;
  end;

  if priFiltroInsDtHrInicial <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [tipo_usuario].[ins_local_dt_hr] >= :ins_local_dt_hr_inicial ');
    locADOQuery.Parameters.ParamByName('ins_local_dt_hr_inicial').Value := DateTimeHorarioInicial(priFiltroInsDtHrInicial);
  end;

  if priFiltroInsDtHrFinal <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [tipo_usuario].[ins_local_dt_hr] <= :ins_local_dt_hr_final ');
    locADOQuery.Parameters.ParamByName('ins_local_dt_hr_final').Value := DateTimeHorarioFinal(priFiltroInsDtHrFinal);
  end;

  if priFiltroUpdDtHrInicial <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND EXISTS (SELECT TOP 1                                                                            ');
    locADOQuery.SQL.Add('               1                                                                                     ');
    locADOQuery.SQL.Add('             FROM                                                                                    ');
    locADOQuery.SQL.Add('               [tipo_usuario_log] WITH (NOLOCK)                                                      ');
    locADOQuery.SQL.Add('               INNER JOIN [registro_acao] WITH (NOLOCK)                                              ');
    locADOQuery.SQL.Add('                 ON [registro_acao].[registro_acao_id] = [tipo_usuario_log].[registro_acao_id]       ');
    locADOQuery.SQL.Add('             WHERE                                                                                   ');
    locADOQuery.SQL.Add('               [tipo_usuario_log].[licenca_id]           = [tipo_usuario].[licenca_id]           AND ');
    locADOQuery.SQL.Add('               [tipo_usuario_log].[tipo_usuario_base_id] = [tipo_usuario].[tipo_usuario_base_id] AND ');
    locADOQuery.SQL.Add('               [tipo_usuario_log].[tipo_usuario_id]      = [tipo_usuario].[tipo_usuario_id]      AND ');
    locADOQuery.SQL.Add('               [tipo_usuario_log].[log_local_dt_hr]     >= :log_local_dt_hr_inicial              AND ');
    locADOQuery.SQL.Add('               [registro_acao].[alteracao]               = ''S'')                                    ');
    locADOQuery.Parameters.ParamByName('log_local_dt_hr_inicial').Value := DateTimeHorarioInicial(priFiltroUpdDtHrInicial);
  end;

  if priFiltroUpdDtHrFinal <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND EXISTS (SELECT TOP 1                                                                            ');
    locADOQuery.SQL.Add('               1                                                                                     ');
    locADOQuery.SQL.Add('             FROM                                                                                    ');
    locADOQuery.SQL.Add('               [tipo_usuario_log] WITH (NOLOCK)                                                      ');
    locADOQuery.SQL.Add('               INNER JOIN [registro_acao] WITH (NOLOCK)                                              ');
    locADOQuery.SQL.Add('                 ON [registro_acao].[registro_acao_id] = [tipo_usuario_log].[registro_acao_id]       ');
    locADOQuery.SQL.Add('             WHERE                                                                                   ');
    locADOQuery.SQL.Add('               [tipo_usuario_log].[licenca_id]           = [tipo_usuario].[licenca_id]           AND ');
    locADOQuery.SQL.Add('               [tipo_usuario_log].[tipo_usuario_base_id] = [tipo_usuario].[tipo_usuario_base_id] AND ');
    locADOQuery.SQL.Add('               [tipo_usuario_log].[tipo_usuario_id]      = [tipo_usuario].[tipo_usuario_id]      AND ');
    locADOQuery.SQL.Add('               [tipo_usuario_log].[log_local_dt_hr]     <= :log_local_dt_hr_final                AND ');
    locADOQuery.SQL.Add('               [registro_acao].[alteracao]               = ''S'')                                    ');
    locADOQuery.Parameters.ParamByName('log_local_dt_hr_final').Value := DateTimeHorarioFinal(priFiltroUpdDtHrFinal);
  end;

  //
  // Order by.
  //  
  locADOQuery.SQL.Add('ORDER BY                      ');
  locADOQuery.SQL.Add('  [tipo_usuario].[codigo] ASC ');

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar os registros na tabela tipo_usuario!';
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
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('tipo_usuario_base_id').AsInteger));
      locListItem.SubItems.Add(locADOQuery.FieldByName('tipo_usuario_base_descricao').AsString);
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('tipo_usuario_id').AsInteger));
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
procedure TPlataformaERPVCLTiposUsuariosLista.FormularioCadastroExibir(argNovo: Boolean);
var
  locFormulario       : TPlataformaERPVCLTiposUsuariosCadastro;
  locDadosAtualizados : Boolean;
  locIndice           : Integer;
  locLicencaID        : Integer;
  locTipoUsuarioBaseID: Integer;
  locTipoUsuarioID    : Integer;
begin
  if argNovo then
  begin
    locIndice            := VCL_NENHUM_INDICE;
    locLicencaID         := 0;
    locTipoUsuarioBaseID := 0;
    locTipoUsuarioID     := 0;
  end
  else
  begin  
    locIndice := VCLListViewIndiceItemRetornar(lvwLista);
    if locIndice <= VCL_NENHUM_INDICE then Exit;

    locLicencaID         := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_LICENCA_ID]);
    locTipoUsuarioBaseID := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_TIPO_USUARIO_BASE_ID]);
    locTipoUsuarioID     := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_TIPO_USUARIO_ID]);
  end;

  locFormulario := TPlataformaERPVCLTiposUsuariosCadastro.Create(Self);

  locFormulario.pubLicencaID         := locLicencaID;
  locFormulario.pubTipoUsuarioBaseID := locTipoUsuarioBaseID;
  locFormulario.pubTipoUsuarioID     := locTipoUsuarioID;
  
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