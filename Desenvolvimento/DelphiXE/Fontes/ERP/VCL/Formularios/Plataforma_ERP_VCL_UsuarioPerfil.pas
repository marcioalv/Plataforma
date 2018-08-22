//
// Arquivo..: Plataforma_ERP_VCL_UsuarioPerfil.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 21/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com a lista de perfis cadastros e selecionados para o usuário.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_UsuarioPerfil;

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
  Vcl.ComCtrls;

type
  TPlataformaERPVCLUsuarioPerfil = class(TForm)
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
    lvwPerfis: TListView;
    pbaProgresso: TProgressBar;
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
    procedure lvwPerfisCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwPerfisCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwPerfisDblClick(Sender: TObject);
    procedure lvwPerfisKeyPress(Sender: TObject; var Key: Char);
    procedure btnTodosSelecionarClick(Sender: TObject);
    procedure btnTodosDeselecionarClick(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioPopular;
    procedure FormularioGravar;
  public
    pubClicouFechar : Boolean;
    pubLicencaID    : Integer;
    pubUsuarioBaseID: Integer;
    pubUsuarioID    : Integer;
    pubUpdContador  : Integer;
  end;

var
  PlataformaERPVCLUsuarioPerfil: TPlataformaERPVCLUsuarioPerfil;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico,
  Plataforma_ERP_VCL_PerfilUsuarioCadastro;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_UsuarioPerfil.pas';

const
  LVW_LICENCA_ID                   : Byte = 0;
  LVW_PERFIL_USUARIO_BASE_ID       : Byte = 1;
  LVW_PERFIL_USUARIO_BASE_DESCRICAO: Byte = 2;
  LVW_PERFIL_USUARIO_ID            : Byte = 3;
  LVW_CODIGO                       : Byte = 4;
  LVW_DESCRICAO                    : Byte = 5;
  LVW_BLOQUEADO                    : Byte = 6;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLUsuarioPerfil.FormCreate(Sender: TObject);
begin
  //
  // Inicialização das variáveis públicas do formulário.
  //
  pubClicouFechar  := True;
  pubLicencaID     := 0;
  pubUsuarioBaseID := 0;
  pubUsuarioID     := 0;
  pubUpdContador   := 0;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLUsuarioPerfil.FormShow(Sender: TObject);
begin
  //
  // Background do formulário.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Popula os dados no formulário.
  //
  FormularioPopular;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLUsuarioPerfil.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLUsuarioPerfil.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

procedure TPlataformaERPVCLUsuarioPerfil.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLUsuarioPerfil.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos de controle do componente "lista de perfis".
//
procedure TPlataformaERPVCLUsuarioPerfil.lvwPerfisCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLUsuarioPerfil.lvwPerfisCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLUsuarioPerfil.lvwPerfisDblClick(Sender: TObject);
var
  locIndice             : Integer;
  locLicencaID          : Integer;
  locPerfilUsuarioBaseID: Integer;
  locPerfilUsuarioID    : Integer;
  locFormulario         : TPlataformaERPVCLPerfilUsuarioCadastro;
  locDadosAtualizados   : Boolean;
begin
  locIndice := VCLListViewIndiceItemRetornar(lvwPerfis);
  if locIndice = VCL_NENHUM_INDICE then Exit;

  locLicencaID           := StringIntegerConverter(lvwPerfis.Items.Item[locIndice].SubItems.Strings[LVW_LICENCA_ID]);
  locPerfilUsuarioBaseID := StringIntegerConverter(lvwPerfis.Items.Item[locIndice].SubItems.Strings[LVW_PERFIL_USUARIO_BASE_ID]);
  locPerfilUsuarioID     := StringIntegerConverter(lvwPerfis.Items.Item[locIndice].SubItems.Strings[LVW_PERFIL_USUARIO_ID]);

  locFormulario                        := TPlataformaERPVCLPerfilUsuarioCadastro.Create(Self);
  locFormulario.pubLicencaID           := locLicencaID;
  locFormulario.pubPerfilUsuarioBaseID := locPerfilUsuarioBaseID;
  locFormulario.pubPerfilUsuarioID     := locPerfilUsuarioID;
  
  locFormulario.ShowModal;

  locDadosAtualizados := locFormulario.pubDadosAtualizados;
  
  locFormulario.Release;
  FreeAndNil(locFormulario);

  if locDadosAtualizados then
  begin
    FormularioPopular;
  end;
end;

procedure TPlataformaERPVCLUsuarioPerfil.lvwPerfisKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ENTER then lvwPerfisDblClick(Sender);
end;

//
// Evento de click no botão "selecionar todos".
//
procedure TPlataformaERPVCLUsuarioPerfil.btnTodosSelecionarClick(Sender: TObject);
begin
  VCLListViewItensMarcar(lvwPerfis, True);
end;

//
// Evento de click no botão "Deselecionar todos".
//
procedure TPlataformaERPVCLUsuarioPerfil.btnTodosDeselecionarClick(Sender: TObject);
begin
  VCLListViewItensMarcar(lvwPerfis, False);
end;

//
// Evento de click no botão "confirmar".
//
procedure TPlataformaERPVCLUsuarioPerfil.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLUsuarioPerfil.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLUsuarioPerfil.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLUsuarioPerfil.FormularioLimpar;
begin
  VCLProgressBarLimpar(pbaProgresso);
  VCLListViewLimpar(lvwPerfis);
end;

//
// Procedimento para carregar os dados no formulário.
//
procedure TPlataformaERPVCLUsuarioPerfil.FormularioPopular;
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
  ERRO_MENSAGEM    : string = 'Impossível consultar dados sobre os perfis do usuário!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
  locListItem     : TListItem;
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
  locADOQuery.SQL.Add('SELECT                                                                                           ');
  locADOQuery.SQL.Add('  [perfil_usuario].[licenca_id],                                                                 ');
  locADOQuery.SQL.Add('  [base].[base_id]   AS [perfil_usuario_base_id],                                                ');
  locADOQuery.SQL.Add('  [base].[descricao] AS [perfil_usuario_base_descricao],                                         ');
  locADOQuery.SQL.Add('  [perfil_usuario].[perfil_usuario_id],                                                          ');
  locADOQuery.SQL.Add('  [perfil_usuario].[codigo],                                                                     ');
  locADOQuery.SQL.Add('  [perfil_usuario].[descricao],                                                                  ');
  locADOQuery.SQL.Add('  [perfil_usuario].[bloqueado],                                                                  ');
  locADOQuery.SQL.Add('  [usuario_perfil].[usuario_perfil_sq]                                                           ');
  locADOQuery.SQL.Add('FROM                                                                                             ');
  locADOQuery.SQL.Add('  [perfil_usuario] WITH (NOLOCK)                                                                 ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                                                                ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [perfil_usuario].[perfil_usuario_base_id]                              ');
  locADOQuery.SQL.Add('  LEFT OUTER JOIN [usuario_perfil] WITH (NOLOCK)                                                 ');
  locADOQuery.SQL.Add('    ON [usuario_perfil].[licenca_id]             = [perfil_usuario].[licenca_id]             AND ');
  locADOQuery.SQL.Add('       [usuario_perfil].[perfil_usuario_base_id] = [perfil_usuario].[perfil_usuario_base_id] AND ');
  locADOQuery.SQL.Add('       [usuario_perfil].[perfil_usuario_id]      = [perfil_usuario].[perfil_usuario_id]      AND ');
  locADOQuery.SQL.Add('       [usuario_perfil].[usuario_base_id]        = :usuario_base_id                          AND ');
  locADOQuery.SQL.Add('       [usuario_perfil].[usuario_id]             = :usuario_id                                   ');
  locADOQuery.SQL.Add('WHERE                                                                                            ');
  locADOQuery.SQL.Add('  [perfil_usuario].[licenca_id] = :licenca_id AND                                                ');
  locADOQuery.SQL.Add('  [perfil_usuario].[ativo]      = ''S''                                                          ');
                                                              
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := pubLicencaID;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value := pubUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value      := pubUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [perfil_usuario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Registro encontrado.
  //
  if locADOQuery.RecordCount >= 0 then
  begin
    VCLProgressBarInicializar(pbaProgresso, locADOQuery.RecordCount);
  
    lvwPerfis.Items.BeginUpdate;
    while not locADOQuery.Eof do
    begin
      VCLProgressBarIncrementar(pbaProgresso);
    
      locListItem         := lvwPerfis.Items.Add;
      locListItem.Checked := (not locADOQuery.FieldByName('usuario_perfil_sq').IsNull);
      locListItem.Caption := '';
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('licenca_id').AsInteger));
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('perfil_usuario_base_id').AsInteger));
      locListItem.SubItems.Add(locADOQuery.FieldByName('perfil_usuario_base_descricao').AsString);
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('perfil_usuario_id').AsInteger));
      locListItem.SubItems.Add(locADOQuery.FieldByName('codigo').AsString);
      locListItem.SubItems.Add(locADOQuery.FieldByName('descricao').AsString);
      locListItem.SubItems.Add(FlagSimNaoStringConverter(locADOQuery.FieldByName('bloqueado').AsString));
    
      locADOQuery.Next;
    end;
    lvwPerfis.Items.EndUpdate;

    VCLProgressBarLimpar(pbaProgresso);
  end;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);
  VCLCursorTrocar;
end;

//
// Procedimento para gravar os dados do formulário.
//
procedure TPlataformaERPVCLUsuarioPerfil.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioConfirmar';
  ERRO_MENSAGEM    : string = 'Impossível confirmar informações sobre os perfis do usuário!';
var
  locADOConnection      : TADOConnection;
  locADOQuery           : TADOQuery;
  locLogMensagem        : string;
  locContador           : Integer;

  locLicencaID          : Integer;
  locUsuarioBaseID      : Integer;
  locUsuarioID          : Integer;
  locSequencial         : Integer;
  locPerfilUsuarioBaseID: Integer;
  locPerfilUsuarioID    : Integer;
                     
  locUpdContador        : Integer;
                     
  locRegistroAcao       : Byte;
  locRegistroAcaoID     : Integer;
  locUsuarioLogSq       : Integer;
  locUsuarioLogMsg      : string;
  locUsuarioLogDados    : string;
  locHostName           : string;
  locUserName           : string;
  locLogUsuarioBaseID   : Integer;
  locLogUsuarioID       : Integer;
begin
  //
  // Carrega variáveis com o conteúdo dos componentes.
  //
  locLicencaID        := pubLicencaID;
  locUsuarioBaseID    := pubUsuarioBaseID;
  locUsuarioID        := pubUsuarioID;
  locUpdContador      := pubUpdContador;

  locHostName         := HostNameRecuperar;
  locUserName         := UserNameRecuperar;
  locLogUsuarioBaseID := gloBaseID;
  locLogUsuarioID     := gloUsuarioID;

  //
  // Confirma gravação com o usuário.
  //
  if not VCLQuestionamentoExibir('Deseja realmente atualizar estes perfis do usuário?') then Exit;

  //
  // Log de dados.
  //
  locUsuarioLogDados := '';
  LogDadosIntegerDescrever('Licenca',         locLicencaID,     locUsuarioLogDados);
  LogDadosIntegerDescrever('Base do usuário', locUsuarioBaseID, locUsuarioLogDados);
  LogDadosIntegerDescrever('ID do usuário',   locUsuarioID,     locUsuarioLogDados);

  locSequencial := 0;
  for locContador := 0 to (lvwPerfis.Items.Count - 1) do
  begin
    if lvwPerfis.Items.Item[locContador].Checked then
    begin
      Inc(locSequencial);      
      locPerfilUsuarioBaseID := StringIntegerConverter(lvwPerfis.Items.Item[locContador].SubItems.Strings[LVW_PERFIL_USUARIO_BASE_ID]);
      locPerfilUsuarioID     := StringIntegerConverter(lvwPerfis.Items.Item[locContador].SubItems.Strings[LVW_PERFIL_USUARIO_ID]);
  
      LogDadosIntegerDescrever('Sequencial',     locSequencial,          locUsuarioLogDados);
      LogDadosIntegerDescrever('Base do perfil', locPerfilUsuarioBaseID, locUsuarioLogDados);
      LogDadosIntegerDescrever('ID do perfil',   locPerfilUsuarioID,     locUsuarioLogDados);
    end;
  end;

  if locSequencial = 0 then
  begin
    LogDadosStringDescrever('perfis selecionados', 'Nenhum perfil foi selecionado!', locUsuarioLogDados);
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
  locADOQuery.SQL.Add('SELECT                                               ');
  locADOQuery.SQL.Add('  [usuario].[upd_contador]                           ');
  locADOQuery.SQL.Add('FROM                                                 ');
  locADOQuery.SQL.Add('  [usuario] WITH (NOLOCK)                            ');
  locADOQuery.SQL.Add('WHERE                                                ');
  locADOQuery.SQL.Add('  [usuario].[licenca_id]      = :licenca_id      AND ');
  locADOQuery.SQL.Add('  [usuario].[usuario_base_id] = :usuario_base_id AND ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id]      = :usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value      := locUsuarioID;

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
  locRegistroAcao  := REGISTRO_ACAO_ALTERACAO;
  locUsuarioLogMsg := 'Perfis de usuário atualizados!';

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
  locADOQuery.SQL.Add('UPDATE                                     ');
  locADOQuery.SQL.Add('  [usuario]                                ');
  locADOQuery.SQL.Add('SET                                        ');
  locADOQuery.SQL.Add('  [upd_local_dt_hr]  = :local_dt_hr,       ');
  locADOQuery.SQL.Add('  [upd_server_dt_hr] = GETDATE(),          ');
  locADOQuery.SQL.Add('  [upd_contador]     = [upd_contador] + 1  ');
  locADOQuery.SQL.Add('WHERE                                      ');
  locADOQuery.SQL.Add('  [licenca_id]      = :licenca_id      AND ');
  locADOQuery.SQL.Add('  [usuario_base_id] = :usuario_base_id AND ');
  locADOQuery.SQL.Add('  [usuario_id]      = :usuario_id          ');

  //
  // Parâmetros.
  //
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value      := locUsuarioID;
  locADOQuery.Parameters.ParamByName('local_dt_hr').Value     := Now;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para atualizar o registro na tabela [usuario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  //
  // Remove todos os perfis cadastrados.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                                ');
  locADOQuery.SQL.Add('  [usuario_perfil]                         ');
  locADOQuery.SQL.Add('WHERE                                      ');
  locADOQuery.SQL.Add('  [licenca_id]      = :licenca_id      AND ');
  locADOQuery.SQL.Add('  [usuario_base_id] = :usuario_base_id AND ');
  locADOQuery.SQL.Add('  [usuario_id]      = :usuario_id          ');

  //
  // Parâmetros.
  //
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value      := locUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para excluir todos os registros na tabela [usuario_perfil]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  //
  // Percorre a lista de perfis para inserir os selecionados.
  //
  locSequencial := 0;
  for locContador := 0 to (lvwPerfis.Items.Count - 1) do
  begin
    if lvwPerfis.Items.Item[locContador].Checked then
    begin
      Inc(locSequencial);      
      locPerfilUsuarioBaseID := StringIntegerConverter(lvwPerfis.Items.Item[locContador].SubItems.Strings[LVW_PERFIL_USUARIO_BASE_ID]);
      locPerfilUsuarioID     := StringIntegerConverter(lvwPerfis.Items.Item[locContador].SubItems.Strings[LVW_PERFIL_USUARIO_ID]);
    
      locADOQuery.Close;
      locADOQuery.SQL.Clear;
      locADOQuery.SQL.Add('INSERT INTO [usuario_perfil] ( ');
      locADOQuery.SQL.Add('  [licenca_id],                ');
      locADOQuery.SQL.Add('  [usuario_base_id],           ');
      locADOQuery.SQL.Add('  [usuario_id],                ');
      locADOQuery.SQL.Add('  [usuario_perfil_sq],         ');
      locADOQuery.SQL.Add('  [perfil_usuario_base_id],    ');
      locADOQuery.SQL.Add('  [perfil_usuario_id]          ');
      locADOQuery.SQL.Add(')                              ');
      locADOQuery.SQL.Add('VALUES (                       ');
      locADOQuery.SQL.Add('  :licenca_id,                 '); // [licenca_id].
      locADOQuery.SQL.Add('  :usuario_base_id,            '); // [usuario_base_id].
      locADOQuery.SQL.Add('  :usuario_id,                 '); // [usuario_id].
      locADOQuery.SQL.Add('  :usuario_perfil_sq,          '); // [usuario_perfil_sq].
      locADOQuery.SQL.Add('  :perfil_usuario_base_id,     '); // [perfil_usuario_base_id].
      locADOQuery.SQL.Add('  :perfil_usuario_id           '); // [perfil_usuario_id].
      locADOQuery.SQL.Add(')                              ');

      locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
      locADOQuery.Parameters.ParamByName('usuario_base_id').Value        := locUsuarioBaseID;
      locADOQuery.Parameters.ParamByName('usuario_id').Value             := locUsuarioID;
      locADOQuery.Parameters.ParamByName('usuario_perfil_sq').Value      := locSequencial;
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
          locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir dados na tabela [usuario_perfil]!';
          Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
          VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
          Exit
        end;
      end;
    end;
  end;

  //
  // Determina o contador de updates atual.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                               ');
  locADOQuery.SQL.Add('  [usuario].[upd_contador]                           ');
  locADOQuery.SQL.Add('FROM                                                 ');
  locADOQuery.SQL.Add('  [usuario]                                          ');
  locADOQuery.SQL.Add('WHERE                                                ');
  locADOQuery.SQL.Add('  [usuario].[licenca_id]      = :licenca_id      AND ');
  locADOQuery.SQL.Add('  [usuario].[usuario_base_id] = :usuario_base_id AND ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id]      = :usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value      := locUsuarioID;

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
  // Determina o próximo sequencial da tabela usuario_log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                   ');
  locADOQuery.SQL.Add('  MAX([usuario_log].[usuario_log_sq]) AS Sequencial      ');
  locADOQuery.SQL.Add('FROM                                                     ');
  locADOQuery.SQL.Add('  [usuario_log]                                          ');
  locADOQuery.SQL.Add('WHERE                                                    ');
  locADOQuery.SQL.Add('  [usuario_log].[licenca_id]      = :licenca_id      AND ');
  locADOQuery.SQL.Add('  [usuario_log].[usuario_base_id] = :usuario_base_id AND ');
  locADOQuery.SQL.Add('  [usuario_log].[usuario_id]      = :usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value      := locUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o próximo sequencial para o registro na tabela [usuario_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  if locADOQuery.RecordCount <= 0 then
  begin
    locUsuarioLogSq := 1;
  end
  else  
  begin
    locUsuarioLogSq := locADOQuery.FieldByName('Sequencial').AsInteger + 1;
  end; 

  //
  // Monta SQL para inserir dados na tabela de log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('INSERT INTO [usuario_log] (');
  locADOQuery.SQL.Add('  [licenca_id],            ');
  locADOQuery.SQL.Add('  [usuario_base_id],       ');
  locADOQuery.SQL.Add('  [usuario_id],            ');
  locADOQuery.SQL.Add('  [usuario_log_sq],        ');
  locADOQuery.SQL.Add('  [log_base_id],           ');
  locADOQuery.SQL.Add('  [log_local_dt_hr],       ');
  locADOQuery.SQL.Add('  [log_server_dt_hr],      ');
  locADOQuery.SQL.Add('  [registro_acao_id],      ');
  locADOQuery.SQL.Add('  [host_name],             ');
  locADOQuery.SQL.Add('  [user_name],             ');
  locADOQuery.SQL.Add('  [log_usuario_base_id],   ');
  locADOQuery.SQL.Add('  [log_usuario_id],        ');
  locADOQuery.SQL.Add('  [mensagem],              ');  
  locADOQuery.SQL.Add('  [dados]                  ');
  locADOQuery.SQL.Add(')                          ');
  locADOQuery.SQL.Add('VALUES (                   ');
  locADOQuery.SQL.Add('  :licenca_id,             '); // [licenca_id].
  locADOQuery.SQL.Add('  :usuario_base_id,        '); // [usuario_base_id].
  locADOQuery.SQL.Add('  :usuario_id,             '); // [usuario_id].
  locADOQuery.SQL.Add('  :usuario_log_sq,         '); // [usuario_log_sq].
  locADOQuery.SQL.Add('  :log_base_id,            '); // [log_base_id].
  locADOQuery.SQL.Add('  :log_local_dt_hr,        '); // [log_local_dt_hr].
  locADOQuery.SQL.Add('  GETDATE(),               '); // [log_server_dt_hr].
  locADOQuery.SQL.Add('  :registro_acao_id,       '); // [registro_acao_id].
  locADOQuery.SQL.Add('  :host_name,              '); // [host_name].
  locADOQuery.SQL.Add('  :user_name,              '); // [user_name].
  locADOQuery.SQL.Add('  :log_usuario_base_id,    '); // [log_usuario_base_id].
  locADOQuery.SQL.Add('  :log_usuario_id,         '); // [log_usuario_id].
  locADOQuery.SQL.Add('  :mensagem,               '); // [mensagem].
  locADOQuery.SQL.Add('  :dados                   '); // [dados].
  locADOQuery.SQL.Add(')                          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value          := locLicencaID;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value     := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value          := locUsuarioID;
  locADOQuery.Parameters.ParamByName('usuario_log_sq').Value      := locUsuarioLogSq;
  locADOQuery.Parameters.ParamByName('log_base_id').Value         := gloBaseID;
  locADOQuery.Parameters.ParamByName('log_local_dt_hr').Value     := Now;
  locADOQuery.Parameters.ParamByName('registro_acao_id').Value    := locRegistroAcaoID;
  locADOQuery.Parameters.ParamByName('host_name').Value           := locHostName;
  locADOQuery.Parameters.ParamByName('user_name').Value           := locUserName;
  locADOQuery.Parameters.ParamByName('log_usuario_base_id').Value := locLogUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('log_usuario_id').Value      := locLogUsuarioID;
  locADOQuery.Parameters.ParamByName('mensagem').Value            := locUsuarioLogMsg;
  locADOQuery.Parameters.ParamByName('dados').Value               := locUsuarioLogDados;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [usuario_log]!';
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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, locUsuarioID, '', 'usuario', locUsuarioLogMsg, locUsuarioLogDados);
  except
    on locExcecao: Exception do
    begin
      VCLErroExibir(locExcecao.Message);
    end;
  end;

  //
  // Configurações de senha atualizadas!
  //
  VCLInformacaoExibir('Perfis de usuário gravados com sucesso!');

  //
  // Retorna.
  //
  pubClicouFechar := False;
  Close;
end;

end.
