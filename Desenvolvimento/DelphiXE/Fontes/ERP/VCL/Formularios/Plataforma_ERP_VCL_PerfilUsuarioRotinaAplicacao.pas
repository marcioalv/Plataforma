//
// Arquivo..: Plataforma_ERP_VCL_PerfilUsuarioRotinaAplicacao.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 21/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com a seleção de rotinas da aplicação com acesso para esse perfil de usuário.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_PerfilUsuarioRotinaAplicacao;

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
  Vcl.Menus,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls,
  System.ImageList,
  Vcl.ImgList;

type
  TPlataformaERPVCLPerfilUsuarioRotinaAplicacao = class(TForm)
    imgFormulario: TImage;
    imgBackground: TImage;
    btnFechar: TBitBtn;
    btnMinimizar: TBitBtn;
    panFormulario: TPanel;
    btnGravar: TBitBtn;
    mnuFormulario: TMainMenu;
    mniGravar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniFechar: TMenuItem;
    pbaProgresso: TProgressBar;
    tvwRotinas: TTreeView;
    imlIcones: TImageList;
    btnTodosSelecionar: TBitBtn;
    btnTodosDeselecionar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mniGravarClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tvwRotinasDblClick(Sender: TObject);
    procedure btnTodosSelecionarClick(Sender: TObject);
    procedure btnTodosDeselecionarClick(Sender: TObject);
  private
    priListaDados: array of Integer;
    procedure FormularioLimpar;
    procedure FormularioPopular;
    procedure FormularioGravar;
    procedure TreeViewNosAjustar;
    procedure TreeViewNosInferioresAjustar(argTreeNode: TTreeNode);
    procedure TreeViewNosMarcar(argTreeNode: TTreeNode; argMarcar: Boolean);
    procedure TreeViewImagemDeterminar;
  public
    pubClicouFechar       : Boolean;
    pubLicencaID          : Integer;
    pubPerfilUsuarioBaseID: Integer;
    pubPerfilUsuarioID    : Integer;
    pubUpdContador        : Integer;
  end;

var
  PlataformaERPVCLPerfilUsuarioRotinaAplicacao: TPlataformaERPVCLPerfilUsuarioRotinaAplicacao;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_PerfilUsuarioRotinaAplicacao.pas';

const
 ICONE_UNCHECKED: Byte = 0;
 ICONE_CHECKED  : Byte = 1;
 ICONE_PARCIAL  : Byte = 2;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas do formulário.
  //
  pubClicouFechar        := True;
  pubLicencaID           := 0;
  pubPerfilUsuarioBaseID := 0;
  pubPerfilUsuarioID     := 0;
  pubUpdContador         := 0;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.FormShow(Sender: TObject);
begin
  Exit;
end;

//
// Evento de ativação do formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.FormActivate(Sender: TObject);
begin
  Refresh;
  FormularioPopular;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "treeview".
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.tvwRotinasDblClick(Sender: TObject);
var
  locTreeNode: TTreeNode;
begin
  locTreeNode := tvwRotinas.Selected;

  if locTreeNode.getFirstChild = nil then
  begin
    if locTreeNode.ImageIndex = ICONE_CHECKED then
    begin
      VCLTreeViewIconeDeterminar(locTreeNode, ICONE_UNCHECKED);
    end
    else
    begin
      VCLTreeViewIconeDeterminar(locTreeNode, ICONE_CHECKED);
    end;

    TreeViewNosAjustar;
  end;
end;

//
// Evento de click no botão "selecionar todos".
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.btnTodosSelecionarClick(Sender: TObject);
begin
  if tvwRotinas.Selected = nil then Exit;
  TreeViewNosMarcar(tvwRotinas.Selected, True);
  TreeViewImagemDeterminar;
end;

//
// Evento de click no botão "deselecionar todos".
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.btnTodosDeselecionarClick(Sender: TObject);
begin
  if tvwRotinas.Selected = nil then Exit;
  TreeViewNosMarcar(tvwRotinas.Selected, False);
  TreeViewImagemDeterminar;
end;

//
// Evento de click no botão "gravar".
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.FormularioLimpar;
begin
  VCLTreeViewLimpar(tvwRotinas);  
end;
    
//
// Procedimento para popular os componentes do formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.FormularioPopular;
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
  ERRO_MENSAGEM    : string = 'Impossível consultar dados sobre as rotinas do perfil!';
var
  locADOConnection    : TADOConnection;
  locADOQuery         : TADOQuery;
  locLogMensagem      : string;
  locContador         : Integer;
  locIDRotinaAplicacao: Integer;
  locCodigo           : string;
  locDescricao        : string;
  locNivel            : Integer;

  locTreeNodeRaiz     : TTreeNode;
  locTreeNode01       : TTreeNode;
  locTreeNode02       : TTreeNode;
  locTreeNode03       : TTreeNode;
  locTreeNode04       : TTreeNode;
  locTreeNode05       : TTreeNode;
  locTreeNode06       : TTreeNode;
  locTreeNode07       : TTreeNode;
  locTreeNode08       : TTreeNode;
  locTreeNode09       : TTreeNode;
  locTreeNode10       : TTreeNode;
  locTreeNode11       : TTreeNode;
  locTreeNode12       : TTreeNode;
  locTreeNode13       : TTreeNode;
  locTreeNode14       : TTreeNode;
  locTreeNode15       : TTreeNode;
begin
  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Limpa os componentes do formulário.
  //
  FormularioLimpar;

  //
  // Conexão ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(Self);

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
  // Consulta dados do usuário.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                                                                  ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[rotina_aplicacao_id],                                                                             ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[codigo],                                                                                          ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[descricao],                                                                                       ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[bloqueado],                                                                                       ');
  locADOQuery.SQL.Add('  [perfil_usuario_rotina_aplicacao].[perfil_usuario_rotina_aplicacao_sq]                                                ');
  locADOQuery.SQL.Add('FROM                                                                                                                    ');
  locADOQuery.SQL.Add('  [rotina_aplicacao] WITH (NOLOCK)                                                                                      ');
  locADOQuery.SQL.Add('  LEFT OUTER JOIN [perfil_usuario_rotina_aplicacao] WITH (NOLOCK)                                                       ');
  locADOQuery.SQL.Add('    ON [perfil_usuario_rotina_aplicacao].[licenca_id]               = :licenca_id                                   AND ');
  locADOQuery.SQL.Add('       [perfil_usuario_rotina_aplicacao].[perfil_usuario_base_id]   = :perfil_usuario_base_id                       AND ');
  locADOQuery.SQL.Add('       [perfil_usuario_rotina_aplicacao].[perfil_usuario_id]        = :perfil_usuario_id                            AND ');
  locADOQuery.SQL.Add('       [perfil_usuario_rotina_aplicacao].[rotina_aplicacao_id]      = [rotina_aplicacao].[rotina_aplicacao_id]          ');
  locADOQuery.SQL.Add('WHERE                                                                                                                   ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[ativo] = ''S''                                                                                    ');
  locADOQuery.SQL.Add('ORDER BY                                                                                                                ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[codigo] ASC                                                                                       ');
                                                              
  locADOQuery.Parameters.ParamByName('licenca_id').Value             := pubLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := pubPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := pubPerfilUsuarioID;

  //
  // Executa query.
  //
  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [rotina_aplicacao]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Registro encontrado.
  //
  locTreeNodeRaiz := nil;
  locTreeNode01   := nil;
  locTreeNode02   := nil;
  locTreeNode03   := nil;
  locTreeNode04   := nil;
  locTreeNode05   := nil;
  locTreeNode06   := nil;
  locTreeNode07   := nil;
  locTreeNode08   := nil;
  locTreeNode09   := nil;
  locTreeNode10   := nil;
  locTreeNode11   := nil;
  locTreeNode12   := nil;
  locTreeNode13   := nil;
  locTreeNode14   := nil;
  
  if locADOQuery.RecordCount > 0 then
  begin
    VCLProgressBarInicializar(pbaProgresso, locADOQuery.RecordCount);
  
    while not locADOQuery.Eof do
    begin
      VCLProgressBarIncrementar(pbaProgresso);

      //
      // Carrega campos em variáveis.
      //
      locIDRotinaAplicacao := locADOQuery.FieldByName('rotina_aplicacao_id').AsInteger;
      locCodigo            := locADOQuery.FieldByName('codigo').AsString;
      locDescricao         := locADOQuery.FieldByName('descricao').AsString;

      //
      // Insere ID da rotina no array paralelo indicando o ID daquele item da estrutura do treeview.
      //
      SetLength(priListaDados, Length(priListaDados) + 1);
      priListaDados[Length(priListaDados) - 1] := locIDRotinaAplicacao;
      
      //
      // Determina o nível da estrutura de código para inserir no treeview.
      //
      locNivel := StringCaracterContar(locCodigo, '.');

      //
      // Insere nó no treeview.
      //
      if locNivel =  0 then locTreeNodeRaiz := tvwRotinas.Items.Add(nil, locDescricao);
      if locNivel =  1 then locTreeNode01   := tvwRotinas.Items.AddChild(locTreeNodeRaiz, locDescricao);
      if locNivel =  2 then locTreeNode02   := tvwRotinas.Items.AddChild(locTreeNode01,   locDescricao);
      if locNivel =  3 then locTreeNode03   := tvwRotinas.Items.AddChild(locTreeNode02,   locDescricao);
      if locNivel =  4 then locTreeNode04   := tvwRotinas.Items.AddChild(locTreeNode03,   locDescricao);
      if locNivel =  5 then locTreeNode05   := tvwRotinas.Items.AddChild(locTreeNode04,   locDescricao);
      if locNivel =  6 then locTreeNode06   := tvwRotinas.Items.AddChild(locTreeNode05,   locDescricao);
      if locNivel =  7 then locTreeNode07   := tvwRotinas.Items.AddChild(locTreeNode06,   locDescricao);
      if locNivel =  8 then locTreeNode08   := tvwRotinas.Items.AddChild(locTreeNode07,   locDescricao);
      if locNivel =  9 then locTreeNode09   := tvwRotinas.Items.AddChild(locTreeNode08,   locDescricao);
      if locNivel = 10 then locTreeNode10   := tvwRotinas.Items.AddChild(locTreeNode09,   locDescricao);
      if locNivel = 11 then locTreeNode11   := tvwRotinas.Items.AddChild(locTreeNode10,   locDescricao);
      if locNivel = 12 then locTreeNode12   := tvwRotinas.Items.AddChild(locTreeNode11,   locDescricao);
      if locNivel = 13 then locTreeNode13   := tvwRotinas.Items.AddChild(locTreeNode12,   locDescricao);
      if locNivel = 14 then locTreeNode14   := tvwRotinas.Items.AddChild(locTreeNode13,   locDescricao);

      // Trava de segurança para indicar que a estrutra de níveis do código atingiu seu ponto máximo.
      if locNivel = 15 then
      begin
        locTreeNode15 := tvwRotinas.Items.AddChild(locTreeNode14,   locDescricao);
        VCLConsistenciaExibir('Alcançou o último nível programado para as rotinas de aplicação: ' + locTreeNode15.Text);
      end;

      //
      // Determina a imagem apropriada para o treeview.
      //
      if locADOQuery.FieldByName('perfil_usuario_rotina_aplicacao_sq').IsNull then
      begin
        VCLTreeViewIconeDeterminar(tvwRotinas.Items.Item[tvwRotinas.Items.Count - 1], ICONE_UNCHECKED);
      end
      else
      begin
        VCLTreeViewIconeDeterminar(tvwRotinas.Items.Item[tvwRotinas.Items.Count - 1], ICONE_CHECKED);
      end;
      
      //
      // Próxima rotina da aplicação.
      //
      locADOQuery.Next;
    end;

    VCLProgressBarLimpar(pbaProgresso);
  end;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);

  //
  // Imagem apropriada para os níveis inferiores.
  //
  TreeViewImagemDeterminar;

  //
  // Troca cursor.
  //
  VCLCursorTrocar;

  //
  // Foco.
  //
  if tvwRotinas.Items.Count > 0 then
  begin
    tvwRotinas.FullExpand;
    tvwRotinas.Items.Item[0].Selected := True;
    tvwRotinas.SetFocus;
  end;
end;

//
// Procedimento para gravar os dados do formulário.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioConfirmar';
  ERRO_MENSAGEM    : string = 'Impossível confirmar informações sobre as rotinas de acesso do perfil!';
var
  locADOConnection        : TADOConnection;
  locADOQuery             : TADOQuery;
  locLogMensagem          : string;
  locContador             : Integer;

  locLicencaID            : Integer;
  locPerfilUsuarioBaseID  : Integer;
  locPerfilUsuarioID      : Integer;
  locSequencial           : Integer;
  locRotinaAplicacaoID    : Integer;
                     
  locUpdContador          : Integer;
                     
  locRegistroAcao         : Byte;
  locRegistroAcaoID       : Integer;
  locPerfilUsuarioLogSq   : Integer;
  locPerfilUsuarioLogMsg  : string;
  locPerfilUsuarioLogDados: string;
  locHostName             : string;
  locUserName             : string;
  locLogUsuarioBaseID     : Integer;
  locLogUsuarioID         : Integer;
begin
  //
  // Carrega variáveis com o conteúdo dos componentes.
  //
  locLicencaID           := pubLicencaID;
  locPerfilUsuarioBaseID := pubPerfilUsuarioBaseID;
  locPerfilUsuarioID     := pubPerfilUsuarioID;
  locUpdContador         := pubUpdContador;

  locHostName         := HostNameRecuperar;
  locUserName         := UserNameRecuperar;
  locLogUsuarioBaseID := gloBaseID;
  locLogUsuarioID     := gloUsuarioID;

  //
  // Confirma gravação com o usuário.
  //
  if not VCLQuestionamentoExibir('Deseja realmente atualizar estas rotinas de aceso do perfil?') then Exit;

  //
  // Log de dados.
  //
  locPerfilUsuarioLogDados := '';
  LogDadosIntegerDescrever('Licenca',        locLicencaID,           locPerfilUsuarioLogDados);
  LogDadosIntegerDescrever('Base do perfil', locPerfilUsuarioBaseID, locPerfilUsuarioLogDados);
  LogDadosIntegerDescrever('ID do perfil',   locPerfilUsuarioID,     locPerfilUsuarioLogDados);

  locSequencial := 0;
  for locContador := 0 to (tvwRotinas.Items.Count - 1) do
  begin
    if (tvwRotinas.Items.Item[locContador].ImageIndex = ICONE_CHECKED) or
       (tvwRotinas.Items.Item[locContador].ImageIndex = ICONE_PARCIAL) then
    begin
      Inc(locSequencial);
      locRotinaAplicacaoID := priListaDados[locContador];
  
      LogDadosIntegerDescrever('Sequencial',   locSequencial,        locPerfilUsuarioLogDados);
      LogDadosIntegerDescrever('ID da rotina', locRotinaAplicacaoID, locPerfilUsuarioLogDados);
    end;
  end;

  if locSequencial = 0 then
  begin
    LogDadosStringDescrever('Rotinas selecionadas', 'Nenhuma rotina foi selecionada!', locPerfilUsuarioLogDados);
  end;
  
  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Conexão ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(Self);

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
  // Consiste o contador do update.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                    ');
  locADOQuery.SQL.Add('  [perfil_usuario].[upd_contador]                                         ');
  locADOQuery.SQL.Add('FROM                                                                      ');
  locADOQuery.SQL.Add('  [perfil_usuario] WITH (NOLOCK)                                          ');
  locADOQuery.SQL.Add('WHERE                                                                     ');
  locADOQuery.SQL.Add('  [perfil_usuario].[licenca_id]             = :licenca_id             AND ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_base_id] = :perfil_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_id]      = :perfil_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualizações confere na tabela [usuario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  if locADOQuery.RecordCount > 0 then
  begin
    if locADOQuery.FieldByName('upd_contador').AsInteger <> locUpdContador then
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Esse registro sofreu alguma outra alteração entre a sua consulta e essa gravação!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem);
      Exit
    end;
  end;

  //
  // Determina o ID da ação e a mensagem para o log do registro.
  //
  locRegistroAcao        := REGISTRO_ACAO_ALTERACAO;
  locPerfilUsuarioLogMsg := 'Rotinas de acesso do perfil atualizadas!';

  try
    locRegistroAcaoID := Plataforma_ERP_RegistroAcaoIDDeterminar(locADOConnection, locRegistroAcao);
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locExcecao.Message);
      Exit
    end;
  end;

  //
  // Inicia transação com o banco de dados.
  //
  try
    locADOConnection.BeginTrans;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := ERRO_MENSAGEM_BD_TRANSACAO_INICIAR;
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE, locExcecao.Message);
      Exit
    end;
  end;  

  //
  // Grava dados na tabela usuario.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('UPDATE                                                   ');
  locADOQuery.SQL.Add('  [perfil_usuario]                                       ');
  locADOQuery.SQL.Add('SET                                                      ');
  locADOQuery.SQL.Add('  [upd_local_dt_hr]  = :local_dt_hr,                     ');
  locADOQuery.SQL.Add('  [upd_server_dt_hr] = GETDATE(),                        ');
  locADOQuery.SQL.Add('  [upd_contador]     = [upd_contador] + 1                ');
  locADOQuery.SQL.Add('WHERE                                                    ');
  locADOQuery.SQL.Add('  [licenca_id]             = :licenca_id             AND ');
  locADOQuery.SQL.Add('  [perfil_usuario_base_id] = :perfil_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [perfil_usuario_id]      = :perfil_usuario_id          ');

  //
  // Parâmetros.
  //
  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;
  locADOQuery.Parameters.ParamByName('local_dt_hr').Value            := Now;

  try
    locADOQuery.ExecSQL;
  except
    on locExcecao: Exception do
    begin
      locADOConnection.RollbackTrans;
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para atualizar o registro na tabela [perfil]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  //
  // Remove todas as rotinas cadastradas.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                                              ');
  locADOQuery.SQL.Add('  [perfil_usuario_rotina_aplicacao]                      ');
  locADOQuery.SQL.Add('WHERE                                                    ');
  locADOQuery.SQL.Add('  [licenca_id]             = :licenca_id             AND ');
  locADOQuery.SQL.Add('  [perfil_usuario_base_id] = :perfil_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [perfil_usuario_id]      = :perfil_usuario_id          ');

  //
  // Parâmetros.
  //
  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;

  try
    locADOQuery.ExecSQL;
  except
    on locExcecao: Exception do
    begin
      locADOConnection.RollbackTrans;
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para excluir todos os registros na tabela [perfil_usuario_rotina_aplicacao]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  //
  // Percorre a lista de rotinas para inserir as selecionadas.
  //
  VCLProgressBarInicializar(pbaProgresso, tvwRotinas.Items.Count);
  
  locSequencial := 0;
  for locContador := 0 to (tvwRotinas.Items.Count - 1) do
  begin
    VCLProgressBarIncrementar(pbaProgresso);
  
    if (tvwRotinas.Items.Item[locContador].ImageIndex = ICONE_CHECKED) or
       (tvwRotinas.Items.Item[locContador].ImageIndex = ICONE_PARCIAL) then
    begin
      Inc(locSequencial);      
      locRotinaAplicacaoID := priListaDados[locContador];
    
      locADOQuery.Close;
      locADOQuery.SQL.Clear;
      locADOQuery.SQL.Add('INSERT INTO [perfil_usuario_rotina_aplicacao] ( ');
      locADOQuery.SQL.Add('  [licenca_id],                                 ');
      locADOQuery.SQL.Add('  [perfil_usuario_base_id],                     ');
      locADOQuery.SQL.Add('  [perfil_usuario_id],                          ');
      locADOQuery.SQL.Add('  [perfil_usuario_rotina_aplicacao_sq],         ');
      locADOQuery.SQL.Add('  [rotina_aplicacao_id]                         ');
      locADOQuery.SQL.Add(')                                               ');
      locADOQuery.SQL.Add('VALUES (                                        ');
      locADOQuery.SQL.Add('  :licenca_id,                                  '); // [licenca_id].
      locADOQuery.SQL.Add('  :perfil_usuario_base_id,                      '); // [perfil_usuario_base_id].
      locADOQuery.SQL.Add('  :perfil_usuario_id,                           '); // [perfil_usuario_id].
      locADOQuery.SQL.Add('  :perfil_usuario_rotina_aplicacao_sq,          '); // [perfil_usuario_rotina_aplicacao_sq].
      locADOQuery.SQL.Add('  :rotina_aplicacao_id                          '); // [rotina_aplicacao_id].
      locADOQuery.SQL.Add(')                                               ');

      locADOQuery.Parameters.ParamByName('licenca_id').Value                         := locLicencaID;
      locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value             := locPerfilUsuarioBaseID;
      locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value                  := locPerfilUsuarioID;
      locADOQuery.Parameters.ParamByName('perfil_usuario_rotina_aplicacao_sq').Value := locSequencial;
      locADOQuery.Parameters.ParamByName('rotina_aplicacao_id').Value                := locRotinaAplicacaoID;

      
      try
        locADOQuery.ExecSQL;
      except
        on locExcecao: Exception do
        begin
          locADOConnection.RollbackTrans;
          locADOQuery.Close;
          FreeAndNil(locADOQuery);
          locADOConnection.Close;
          FreeAndNil(locADOConnection);
          locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir dados na tabela [perfil_usuario_rotina_aplicacao]!';
          Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
          VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
          Exit
        end;
      end;
    end;
  end;

  VCLProgressBarLimpar(pbaProgresso);

  //
  // Determina o contador de updates atual.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                    ');
  locADOQuery.SQL.Add('  [perfil_usuario].[upd_contador]                                         ');
  locADOQuery.SQL.Add('FROM                                                                      ');
  locADOQuery.SQL.Add('  [perfil_usuario]                                                        ');
  locADOQuery.SQL.Add('WHERE                                                                     ');
  locADOQuery.SQL.Add('  [perfil_usuario].[licenca_id]             = :licenca_id             AND ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_base_id] = :perfil_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_id]      = :perfil_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOConnection.RollbackTrans;
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o novo contador de updates do registro na tabela [usuario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;   
  end;

  locUpdContador := locADOQuery.FieldByName('upd_contador').AsInteger;
  
  //
  // Determina o próximo sequencial da tabela perfil_usuario_log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                        ');
  locADOQuery.SQL.Add('  MAX([perfil_usuario_log].[perfil_usuario_log_sq]) AS [sequencial]           ');
  locADOQuery.SQL.Add('FROM                                                                          ');
  locADOQuery.SQL.Add('  [perfil_usuario_log]                                                        ');
  locADOQuery.SQL.Add('WHERE                                                                         ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[licenca_id]             = :licenca_id             AND ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[perfil_usuario_base_id] = :perfil_usuario_base_id AND ');
  locADOQuery.SQL.Add('  [perfil_usuario_log].[perfil_usuario_id]      = :perfil_usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOConnection.RollbackTrans;
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o próximo sequencial para o registro na tabela [perfil_usuario_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  if locADOQuery.RecordCount <= 0 then
  begin
    locPerfilUsuarioLogSq := 1;
  end
  else  
  begin
    locPerfilUsuarioLogSq := locADOQuery.FieldByName('sequencial').AsInteger + 1;
  end; 

  //
  // Monta SQL para inserir dados na tabela de log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('INSERT INTO [perfil_usuario_log] ( ');
  locADOQuery.SQL.Add('  [licenca_id],                    ');
  locADOQuery.SQL.Add('  [perfil_usuario_base_id],        ');
  locADOQuery.SQL.Add('  [perfil_usuario_id],             ');
  locADOQuery.SQL.Add('  [perfil_usuario_log_sq],         ');
  locADOQuery.SQL.Add('  [log_base_id],                   ');
  locADOQuery.SQL.Add('  [log_local_dt_hr],               ');
  locADOQuery.SQL.Add('  [log_server_dt_hr],              ');
  locADOQuery.SQL.Add('  [registro_acao_id],              ');
  locADOQuery.SQL.Add('  [host_name],                     ');
  locADOQuery.SQL.Add('  [user_name],                     ');
  locADOQuery.SQL.Add('  [log_usuario_base_id],           ');
  locADOQuery.SQL.Add('  [log_usuario_id],                ');
  locADOQuery.SQL.Add('  [mensagem],                      ');  
  locADOQuery.SQL.Add('  [dados]                          ');
  locADOQuery.SQL.Add(')                                  ');
  locADOQuery.SQL.Add('VALUES (                           ');
  locADOQuery.SQL.Add('  :licenca_id,                     '); // [licenca_id].
  locADOQuery.SQL.Add('  :perfil_usuario_base_id,         '); // [perfil_usuario_base_id].
  locADOQuery.SQL.Add('  :perfil_usuario_id,              '); // [perfil_usuario_id].
  locADOQuery.SQL.Add('  :perfil_usuario_log_sq,          '); // [perfil_usuario_log_sq].
  locADOQuery.SQL.Add('  :log_base_id,                    '); // [log_base_id].
  locADOQuery.SQL.Add('  :log_local_dt_hr,                '); // [log_local_dt_hr].
  locADOQuery.SQL.Add('  GETDATE(),                       '); // [log_server_dt_hr].
  locADOQuery.SQL.Add('  :registro_acao_id,               '); // [registro_acao_id].
  locADOQuery.SQL.Add('  :host_name,                      '); // [host_name].
  locADOQuery.SQL.Add('  :user_name,                      '); // [user_name].
  locADOQuery.SQL.Add('  :log_usuario_base_id,            '); // [log_usuario_base_id].
  locADOQuery.SQL.Add('  :log_usuario_id,                 '); // [log_usuario_id].
  locADOQuery.SQL.Add('  :mensagem,                       '); // [mensagem].
  locADOQuery.SQL.Add('  :dados                           '); // [dados].
  locADOQuery.SQL.Add(')                                 ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_base_id').Value := locPerfilUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_id').Value      := locPerfilUsuarioID;
  locADOQuery.Parameters.ParamByName('perfil_usuario_log_sq').Value  := locPerfilUsuarioLogSq;
  locADOQuery.Parameters.ParamByName('log_base_id').Value            := gloBaseID;
  locADOQuery.Parameters.ParamByName('log_local_dt_hr').Value        := Now;
  locADOQuery.Parameters.ParamByName('registro_acao_id').Value       := locRegistroAcaoID;
  locADOQuery.Parameters.ParamByName('host_name').Value              := locHostName;
  locADOQuery.Parameters.ParamByName('user_name').Value              := locUserName;
  locADOQuery.Parameters.ParamByName('log_usuario_base_id').Value    := locLogUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('log_usuario_id').Value         := locLogUsuarioID;
  locADOQuery.Parameters.ParamByName('mensagem').Value               := locPerfilUsuarioLogMsg;
  locADOQuery.Parameters.ParamByName('dados').Value                  := locPerfilUsuarioLogDados;

  try
    locADOQuery.ExecSQL;
  except
    on locExcecao: Exception do
    begin
      locADOConnection.RollbackTrans;
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [perfil_usuario_rotina_aplicacao]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  //
  // Finaliza transação com o banco de dados.
  //
  try
    locADOConnection.CommitTrans;
  except
    on locExcecao: Exception do
    begin
      locADOConnection.RollbackTrans;
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := ERRO_MENSAGEM_BD_TRANSACAO_CONFIRMAR;
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE, locExcecao.Message);
      Exit
    end;
  end;

  //
  // Atualiza componentes que sofreram alteração com a gravação.
  //
  pubUpdContador := locUpdContador;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);

  //
  // Grava log de ocorrência.
  //  
  try
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, locPerfilUsuarioID, '', 'perfil', locPerfilUsuarioLogMsg, locPerfilUsuarioLogDados);
  except
    on locExcecao: Exception do
    begin
      VCLErroExibir(locExcecao.Message);
    end;
  end;

  //
  // Configurações de senha atualizadas!
  //
  VCLInformacaoExibir('Acessos do perfil gravados com sucesso!');

  //
  // Retorna.
  //
  pubClicouFechar := False;
  Close;
end;

//
// Procedure para marcar e desmarcar itens selecionados na TreeView.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.TreeViewNosAjustar;
var
  locContador: Integer;
  locTreeNode: TTreeNode;
begin
  for locContador := 0 to (tvwRotinas.SelectionCount - 1) do
  begin
    locTreeNode := tvwRotinas.Selections[locContador];
    TreeViewNosInferioresAjustar(locTreeNode);
  end;
end;

//
// Ajusta as imagens nos nós inferiores do treeview.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.TreeViewNosInferioresAjustar(argTreeNode: TTreeNode);
var
  locContador          : Integer;
  locEncontrouChecked  : Boolean;
  locEncontrouUnchecked: Boolean;
begin
  argTreeNode := argTreeNode.Parent;

  locEncontrouChecked   := False;
  locEncontrouUnchecked := False;

  if argTreeNode = nil then Exit;

  for locContador := 0 to (argTreeNode.Count - 1) do
  begin
    if (argTreeNode[locContador].ImageIndex = ICONE_UNCHECKED) and (not locEncontrouUnchecked) then
    begin
      locEncontrouUnchecked := True;
    end;

    if (argTreeNode[locContador].ImageIndex = ICONE_CHECKED) and (not locEncontrouChecked) then
    begin
      locEncontrouChecked := True;
    end;

    if (argTreeNode[locContador].ImageIndex = ICONE_PARCIAL) then
    begin
      VCLTreeViewIconeDeterminar(argTreeNode, ICONE_PARCIAL);
      Break;
    end;

    if (argTreeNode[locContador].ImageIndex = ICONE_UNCHECKED) and (not locEncontrouUnchecked) then
    begin
      locEncontrouUnchecked := True;
    end;

    if (argTreeNode[locContador].ImageIndex = ICONE_CHECKED) and (not locEncontrouChecked) then
    begin
      locEncontrouChecked := True;
    end;

    if (locEncontrouChecked) and (locEncontrouUnchecked) then
    begin
      VCLTreeViewIconeDeterminar(argTreeNode, ICONE_PARCIAL);
    end;

    if (locEncontrouChecked) and (not locEncontrouUnchecked) then
    begin
      VCLTreeViewIconeDeterminar(argTreeNode, ICONE_CHECKED);
    end;

    if (not locEncontrouChecked) and (locEncontrouUnchecked) then
    begin
      VCLTreeViewIconeDeterminar(argTreeNode, ICONE_UNCHECKED);
    end;
  end;

  if argTreeNode.Parent <> nil then
  begin
    TreeViewNosInferioresAjustar(argTreeNode);
  end;

  tvwRotinas.Refresh;
  tvwRotinas.Repaint;
end;

//
// Procedimento para marcar ou desmarcar todos os itens do treeview.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.TreeViewNosMarcar(argTreeNode: TTreeNode; argMarcar: Boolean);
var
  locIcone   : Integer;
  locContador: Integer;
begin
  if argMarcar then
    locIcone := ICONE_CHECKED
  else
    locIcone := ICONE_UNCHECKED;

  VCLTreeViewIconeDeterminar(argTreeNode, locIcone);
  
  for locContador := 0 to argTreeNode.Count - 1 do
  begin
    TreeViewNosMarcar(argTreeNode[locContador], argMarcar);
  end;
end;

//
// Construi imagem correta para os níveis inferiores.
//
procedure TPlataformaERPVCLPerfilUsuarioRotinaAplicacao.TreeViewImagemDeterminar;
var
  locContador: Integer;
begin
  tvwRotinas.Items.BeginUpdate;
  VCLProgressBarInicializar(pbaProgresso, tvwRotinas.Items.Count);  
  for locContador := 0 to (tvwRotinas.Items.Count - 1) do
  begin
    VCLProgressBarIncrementar(pbaProgresso);
    if not tvwRotinas.Items.Item[locContador].HasChildren then
    begin
      tvwRotinas.Select(tvwRotinas.Items.Item[locContador]);
      TreeViewNosAjustar;
    end;
  end;
  VCLProgressBarLimpar(pbaProgresso);
  tvwRotinas.Items.EndUpdate;
end;

end.
