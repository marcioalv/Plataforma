//
// Arquivo..: Plataforma_ERP_VCL_EmpresaLista.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com a lista de empresas cadastradas.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_EmpresaLista;

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
  TPlataformaERPVCLEmpresaLista = class(TForm)
    imgFormulario: TImage;
    panFormulario: TPanel;
    lvwLista: TListView;
    pbaProgresso: TProgressBar;
    lblListaQtde: TLabel;
    lblListaFiltros: TLabel;
    imgBackground: TImage;
    btnFechar: TBitBtn;
    btnMinimizar: TBitBtn;
    btnNovo: TBitBtn;
    btnLocalizar: TBitBtn;
    mnuFormulario: TMainMenu;
    mniFechar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniSelecionar: TMenuItem;
    mniNovo: TMenuItem;
    mniAtualizar: TMenuItem;
    mniLocalizar: TMenuItem;
    mniCadastro: TMenuItem;
    mniCadastroRegimeTributario: TMenuItem;
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
    procedure mniCadastroRegimeTributarioClick(Sender: TObject);
  private
    priListViewIndiceColuna   : Integer;
    priListViewOrdemAscendente: Boolean;
  
    priFiltroCodigoInicial    : string;
    priFiltroCodigoFinal      : string;
    priFiltroDescricao        : string;
    priFiltroBloqueado        : string;
    priFiltroAtivo            : string;
    priFiltroEmpresaIDInicial : Integer;
    priFiltroEmpresaIDFinal   : Integer;
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
  PlataformaERPVCLEmpresaLista: TPlataformaERPVCLEmpresaLista;

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
  FONTE_NOME: string = 'Plataforma_ERP_VCL_EmpresaLista.pas';

  LVW_LISTA_LICENCA_ID            : Integer = 0;
  LVW_LISTA_EMPRESA_BASE_ID       : Integer = 1;
  LVW_LISTA_EMPRESA_BASE_DESCRICAO: Integer = 2;
  LVW_LISTA_EMPRESA_ID            : Integer = 3;
  LVW_LISTA_CODIGO                : Integer = 4;
  LVW_LISTA_DESCRICAO             : Integer = 5;
  LVW_LISTA_BLOQUEADO             : Integer = 6;
  LVW_LISTA_ATIVO                 : Integer = 7;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLEmpresaLista.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis privadas.
  //
  priListViewIndiceColuna    := VCL_NENHUM_INDICE;
  priListViewOrdemAscendente := False;
  
  priFiltroCodigoInicial    := '';
  priFiltroCodigoFinal      := '';
  priFiltroDescricao        := '';
  priFiltroBloqueado        := '';
  priFiltroAtivo            := '';
  priFiltroEmpresaIDInicial := 0;
  priFiltroEmpresaIDFinal   := 0;
  priFiltroInsDtHrInicial   := 0;
  priFiltroInsDtHrFinal     := 0;
  priFiltroUpdDtHrInicial   := 0;
  priFiltroUpdDtHrFinal     := 0;

  //
  // Mensagem para o label de quantidade de registros.
  //
  lblListaQtde.Caption := VCL_MENSAGEM_ATUALIZAR;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLEmpresaLista.FormShow(Sender: TObject);
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
procedure TPlataformaERPVCLEmpresaLista.FormActivate(Sender: TObject);
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
procedure TPlataformaERPVCLEmpresaLista.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click nas opções de menu.
//
procedure TPlataformaERPVCLEmpresaLista.mniCadastroRegimeTributarioClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_RegimeTributarioListaExibir;
end;

procedure TPlataformaERPVCLEmpresaLista.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar(VCL_NENHUM_INDICE);
end;

procedure TPlataformaERPVCLEmpresaLista.mniLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

procedure TPlataformaERPVCLEmpresaLista.mniNovoClick(Sender: TObject);
begin
  FormularioCadastroExibir(True);
end;

procedure TPlataformaERPVCLEmpresaLista.mniSelecionarClick(Sender: TObject);
begin
  FormularioCadastroExibir(False);
end;

procedure TPlataformaERPVCLEmpresaLista.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLEmpresaLista.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos de controle da lista.
//
procedure TPlataformaERPVCLEmpresaLista.lvwListaColumnClick(Sender: TObject; Column: TListColumn);
begin
  VCLListViewColunaClicar(Sender, Column, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLEmpresaLista.lvwListaCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  VCLListViewComparar(Sender, Item1, Item2, Compare, priListViewIndiceColuna, priListViewOrdemAscendente);
end;

procedure TPlataformaERPVCLEmpresaLista.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLEmpresaLista.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLEmpresaLista.lvwListaDblClick(Sender: TObject);
begin
  FormularioCadastroExibir(False);
end;

procedure TPlataformaERPVCLEmpresaLista.lvwListaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwListaDblClick(Sender);
end;

//
// Evento de click no botão "localizar".
//
procedure TPlataformaERPVCLEmpresaLista.btnLocalizarClick(Sender: TObject);
begin
  FormularioLocalizar;
end;

//
// Evento de click no botão "novo".
//
procedure TPlataformaERPVCLEmpresaLista.btnNovoClick(Sender: TObject);
begin
  FormularioCadastroExibir(True);
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLEmpresaLista.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLEmpresaLista.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Controla a exibição dos componentes do formulário.
//
procedure TPlataformaERPVCLEmpresaLista.FormularioControlar;
begin
  //
  // Menu - Cadastros.
  //
  mniCadastroRegimeTributario.Visible   := Plataforma_ERP_UsuarioRotina('ERP_REGIME_TRIBUTARIO_LISTA');

  mniCadastro.Visible := (mniCadastroRegimeTributario.Visible);

  //
  // Menu - ações.
  //
  mniLocalizar.Visible  := Plataforma_ERP_UsuarioRotina('ERP_EMPRESA_LISTA_LOCALIZAR');
  mniAtualizar.Visible  := Plataforma_ERP_UsuarioRotina('ERP_EMPRESA_LISTA_ATUALIZAR');
  mniNovo.Visible       := Plataforma_ERP_UsuarioRotina('ERP_EMPRESA_LISTA_NOVO');
  mniSelecionar.Visible := Plataforma_ERP_UsuarioRotina('ERP_EMPRESA_LISTA_SELECIONAR');
  mniMinimizar.Visible  := True;
  mniFechar.Visible     := True;
                                                       
  //
  // Botões.
  //
  btnLocalizar.Visible  := mniLocalizar.Visible;
  btnNovo.Visible       := mniNovo.Visible;
  btnMinimizar.Visible  := btnMinimizar.Enabled;
  btnFechar.Visible     := btnFechar.Enabled;
end;

//
// Procedimento para localizar registros cadastros.
//
procedure TPlataformaERPVCLEmpresaLista.FormularioLocalizar;
var
  locFormulario      : TPlataformaERPVCLUsuarioFiltro;
  locClicouFechar    : Boolean;
  locCodigoInicial   : string;
  locCodigoFinal     : string;
  locDescricao       : string;
  locBloqueado       : string;
  locAtivo           : string;
  locEmpresaIDInicial: Integer;
  locEmpresaIDFinal  : Integer;
  locInsDtHrInicial  : TDateTime;
  locInsDtHrFinal    : TDateTime;
  locUpdDtHrInicial  : TDateTime;
  locUpdDtHrFinal    : TDateTime;
begin
  locFormulario := TPlataformaERPVCLUsuarioFiltro.Create(Self);

  locFormulario.pubCodigoInicial    := priFiltroCodigoInicial;
  locFormulario.pubCodigoFinal      := priFiltroCodigoFinal;
  locFormulario.pubNome             := priFiltroDescricao;
  locFormulario.pubBloqueado        := priFiltroBloqueado;
  locFormulario.pubAtivo            := priFiltroAtivo;
  locFormulario.pubUsuarioIDInicial := priFiltroEmpresaIDInicial;
  locFormulario.pubUsuarioIDFinal   := priFiltroEmpresaIDFinal;
  locFormulario.pubInsDtHrInicial   := priFiltroInsDtHrInicial;
  locFormulario.pubInsDtHrFinal     := priFiltroInsDtHrFinal;
  locFormulario.pubUpdDtHrInicial   := priFiltroUpdDtHrInicial;
  locFormulario.pubUpdDtHrFinal     := priFiltroUpdDtHrFinal;
  
  locFormulario.ShowModal;

  locClicouFechar     := locFormulario.pubClicouFechar;
  locCodigoInicial    := locFormulario.pubCodigoInicial;
  locCodigoFinal      := locFormulario.pubCodigoFinal;
  locDescricao        := locFormulario.pubNome;
  locBloqueado        := locFormulario.pubBloqueado;
  locAtivo            := locFormulario.pubAtivo;
  locEmpresaIDInicial := locFormulario.pubUsuarioIDInicial;
  locEmpresaIDFinal   := locFormulario.pubUsuarioIDFinal;
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
    priFiltroDescricao        := locDescricao;
    priFiltroBloqueado        := locBloqueado;
    priFiltroAtivo            := locAtivo;
    priFiltroEmpresaIDInicial := locEmpresaIDInicial;
    priFiltroEmpresaIDFinal   := locEmpresaIDFinal;
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
procedure TPlataformaERPVCLEmpresaLista.FormularioAtualizar(argIndice: Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioAtualizar';
  ERRO_MENSAGEM    : string = 'Impossível atualizar lista de empresas!';
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
  locADOQuery.SQL.Add('  [base].[base_id]       AS [empresa_base_id],         ');
  locADOQuery.SQL.Add('  [base].[descricao]     AS [empresa_base_descricao],  ');
  locADOQuery.SQL.Add('  [empresa].[empresa_id] AS [empresa_id],              ');
  locADOQuery.SQL.Add('  [empresa].[descricao]  AS [descricao],               ');
  locADOQuery.SQL.Add('  [empresa].[nome]       AS [nome],                    ');
  locADOQuery.SQL.Add('  [empresa].[bloqueado]  AS [bloqueado],               ');
  locADOQuery.SQL.Add('  [empresa].[ativo]      AS [ativo]                    ');
  locADOQuery.SQL.Add('FROM                                                   ');
  locADOQuery.SQL.Add('  [empresa] WITH (NOLOCK)                              ');
  locADOQuery.SQL.Add('  INNER JOIN [licenca] WITH (NOLOCK)                   ');
  locADOQuery.SQL.Add('    ON [licenca].[licenca_id] = [empresa].[licenca_id] ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                      ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [empresa].[empresa_base_id]  ');
  locADOQuery.SQL.Add('WHERE                                                  ');
  locADOQuery.SQL.Add('  [empresa].[licenca_id] = :licenca_id                 ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value := locLicencaID;  

  //
  // Filtros.
  //
  locFiltros := False;

  if priFiltroEmpresaIDInicial > 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [empresa].[empresa_id] >= :empresa_id_inicial ');
    locADOQuery.Parameters.ParamByName('empresa_id_inicial').Value := priFiltroEmpresaIDInicial;
  end;

  if priFiltroEmpresaIDFinal > 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [empresa].[empresa_id] <= :empresa_id_final ');
    locADOQuery.Parameters.ParamByName('empresa_id_final').Value := priFiltroEmpresaIDFinal;
  end;

  if priFiltroCodigoInicial <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [empresa].[codigo] >= :codigo_inicial ');
    locADOQuery.Parameters.ParamByName('codigo_inicial').Value := priFiltroCodigoInicial;
  end;

  if priFiltroCodigoFinal <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [empresa].[codigo] <= :codigo_final ');
    locADOQuery.Parameters.ParamByName('codigo_final').Value := priFiltroCodigoFinal;
  end;

  if priFiltroDescricao <> '' then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [empresa].[descricao] LIKE :descricao ');
    locADOQuery.Parameters.ParamByName('descricao').Value := StringLikeGerar(priFiltroDescricao);
  end;
  
  if (priFiltroBloqueado <> '') AND (priFiltroBloqueado <> FLAG_AMBOS) then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [empresa].[bloqueado] = :bloqueado ');
    locADOQuery.Parameters.ParamByName('bloqueado').Value := priFiltroBloqueado;
  end;

  if (priFiltroAtivo <> '') AND (priFiltroAtivo <> FLAG_AMBOS) then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [empresa].[ativo] = :ativo ');
    locADOQuery.Parameters.ParamByName('ativo').Value := priFiltroAtivo;
  end;

  if priFiltroInsDtHrInicial <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [empresa].[ins_local_dt_hr] >= :ins_local_dt_hr_inicial ');
    locADOQuery.Parameters.ParamByName('ins_local_dt_hr_inicial').Value := DateTimeHorarioInicial(priFiltroInsDtHrInicial);
  end;

  if priFiltroInsDtHrFinal <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND [empresa].[ins_local_dt_hr] <= :ins_local_dt_hr_final ');
    locADOQuery.Parameters.ParamByName('ins_local_dt_hr_final').Value := DateTimeHorarioFinal(priFiltroInsDtHrFinal);
  end;

  if priFiltroUpdDtHrInicial <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND EXISTS (SELECT TOP 1                                                                 ');
    locADOQuery.SQL.Add('               1                                                                          ');
    locADOQuery.SQL.Add('             FROM                                                                         ');
    locADOQuery.SQL.Add('               [empresa_log] WITH (NOLOCK)                                                ');
    locADOQuery.SQL.Add('               INNER JOIN [registro_acao] WITH (NOLOCK)                                   ');
    locADOQuery.SQL.Add('                 ON [registro_acao].[registro_acao_id] = [empresa_log].[registro_acao_id] ');
    locADOQuery.SQL.Add('             WHERE                                                                        ');
    locADOQuery.SQL.Add('               [empresa_log].[licenca_id]       = [empresa].[licenca_id]      AND         ');
    locADOQuery.SQL.Add('               [empresa_log].[empresa_base_id]  = [empresa].[empresa_base_id] AND         ');
    locADOQuery.SQL.Add('               [empresa_log].[empresa_id]       = [empresa].[empresa_id]      AND         ');
    locADOQuery.SQL.Add('               [empresa_log].[log_local_dt_hr] >= :log_local_dt_hr_inicial    AND         ');
    locADOQuery.SQL.Add('               [registro_acao].[alteracao]      = ''S'')                                  ');
    locADOQuery.Parameters.ParamByName('log_local_dt_hr_inicial').Value := DateTimeHorarioInicial(priFiltroUpdDtHrInicial);
  end;

  if priFiltroUpdDtHrFinal <> 0 then
  begin
    locFiltros := True;
    locADOQuery.SQL.Add(' AND EXISTS (SELECT TOP 1                                                                 ');
    locADOQuery.SQL.Add('               1                                                                          ');
    locADOQuery.SQL.Add('             FROM                                                                         ');
    locADOQuery.SQL.Add('               [empresa_log] WITH (NOLOCK)                                                ');
    locADOQuery.SQL.Add('               INNER JOIN [registro_acao] WITH (NOLOCK)                                   ');
    locADOQuery.SQL.Add('                 ON [registro_acao].[registro_acao_id] = [empresa_log].[registro_acao_id] ');
    locADOQuery.SQL.Add('             WHERE                                                                        ');
    locADOQuery.SQL.Add('               [empresa_log].[licenca_id]       = [empresa].[licenca_id]      AND         ');
    locADOQuery.SQL.Add('               [empresa_log].[empresa_base_id]  = [empresa].[empresa_base_id] AND         ');
    locADOQuery.SQL.Add('               [empresa_log].[empresa_id]       = [empresa].[empresa_id]      AND         ');
    locADOQuery.SQL.Add('               [empresa_log].[log_local_dt_hr] <= :log_local_dt_hr_final      AND         ');
    locADOQuery.SQL.Add('               [registro_acao].[alteracao]      = ''S'')                                  ');
    locADOQuery.Parameters.ParamByName('log_local_dt_hr_final').Value := DateTimeHorarioFinal(priFiltroUpdDtHrFinal);
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
procedure TPlataformaERPVCLEmpresaLista.FormularioCadastroExibir(argNovo: Boolean);
var
  locFormulario      : TPlataformaERPVCLUsuarioCadastro;
  locDadosAtualizados: Boolean;
  locIndice          : Integer;
  locLicencaID       : Integer;
  locEmpresaBaseID   : Integer;
  locEmpresaID       : Integer;
begin
  if argNovo then
  begin
    locIndice        := VCL_NENHUM_INDICE;
    locLicencaID     := 0;
    locEmpresaBaseID := 0;
    locEmpresaID     := 0;
  end
  else
  begin  
    locIndice := VCLListViewIndiceItemRetornar(lvwLista);
    if locIndice <= VCL_NENHUM_INDICE then Exit;

    locLicencaID     := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_LICENCA_ID]);
    locEmpresaBaseID := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_EMPRESA_BASE_ID]);
    locEmpresaID     := StringIntegerConverter(lvwLista.Items.Item[locIndice].SubItems.Strings[LVW_LISTA_EMPRESA_ID]);
  end;

  locFormulario := TPlataformaERPVCLUsuarioCadastro.Create(Self);

  locFormulario.pubLicencaID     := locLicencaID;
  locFormulario.pubUsuarioBaseID := locEmpresaBaseID;
  locFormulario.pubUsuarioID     := locEmpresaID;
  
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