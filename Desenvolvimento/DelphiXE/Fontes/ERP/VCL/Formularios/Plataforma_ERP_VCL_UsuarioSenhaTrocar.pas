//
// Arquivo..: Plataforma_ERP_VCL_UsuarioSenhaTrocar.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com os dados para trocar a senha do usuário.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_UsuarioSenhaTrocar;

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
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TPlataformaERPVCLUsuarioSenhaTrocar = class(TForm)
    imgFormulario: TImage;
    imgBackground: TImage;
    btnFechar: TBitBtn;
    btnMinimizar: TBitBtn;
    panFormulario: TPanel;
    lblSenhaNova: TLabel;
    lblSenhaNovaConf: TLabel;
    imgSenhaErrada: TImage;
    imgSenhaCorreta: TImage;
    chkSenhaExibir: TCheckBox;
    edtSenhaNova: TEdit;
    edtSenhaNovaConf: TEdit;
    btnGravar: TBitBtn;
    mnuFormulario: TMainMenu;
    mniGravar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniFechar: TMenuItem;
    lblUsuario: TLabel;
    edtUsuario: TEdit;
    lblSenhaAtual: TLabel;
    edtSenhaAtual: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaNovaEnter(Sender: TObject);
    procedure edtSenhaNovaExit(Sender: TObject);
    procedure edtSenhaNovaKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaNovaConfEnter(Sender: TObject);
    procedure edtSenhaNovaConfExit(Sender: TObject);
    procedure edtSenhaNovaConfKeyPress(Sender: TObject; var Key: Char);
    procedure mniGravarClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkSenhaExibirClick(Sender: TObject);
    procedure edtSenhaNovaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtSenhaNovaConfKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtSenhaAtualEnter(Sender: TObject);
    procedure edtSenhaAtualExit(Sender: TObject);
    procedure edtSenhaAtualKeyPress(Sender: TObject; var Key: Char);
  private
    priLicencaID      : Integer;
    priUsuarioBaseID  : Integer;
    priUsuarioID      : Integer;
    procedure FormularioLimpar;
    procedure FormularioComponentesExibir;
    procedure FormularioControlar;
    procedure FormularioGravar;
  public
    pubClicouFechar   : Boolean;
    pubExigeSenhaAtual: Boolean;
  end;

var
  PlataformaERPVCLUsuarioSenhaTrocar: TPlataformaERPVCLUsuarioSenhaTrocar;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_UsuarioSenhaTrocar.pas';

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.FormCreate(Sender: TObject);
begin
  //
  // Inicialização das variáveis privadas.
  //
  priLicencaID     := gloLicencaID;
  priUsuarioBaseID := gloUsuarioBaseID;
  priUsuarioID     := gloUsuarioID;

  //
  // Inicialização das variáveis públicas.
  //
  pubClicouFechar    := True;
  pubExigeSenhaAtual := False;
end;

//
// Event de exibição do formulário.
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.FormShow(Sender: TObject);
begin
  //
  // Background do formulário.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Limpa componentes do formulário.
  //
  FormularioLimpar;

  //
  // Exibir os componentes do formulário.
  //
  FormularioComponentesExibir;

  //
  // Controlar comportamento dos componentes do formulário.
  //
  FormularioControlar;

  //
  // Foco no componente apropriado.
  //
  if pubExigeSenhaAtual then
    edtSenhaAtual.SetFocus
  else
    edtSenhaNova.SetFocus;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nos itens de menu.
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

procedure TPlataformaERPVCLUsuarioSenhaTrocar.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLUsuarioSenhaTrocar.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "senha atual".
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.edtSenhaAtualEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtSenhaAtual) then Exit;
end;

procedure TPlataformaERPVCLUsuarioSenhaTrocar.edtSenhaAtualKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLUsuarioSenhaTrocar.edtSenhaAtualExit(Sender: TObject);
begin
  if not VCLEditSair(edtSenhaAtual) then Exit;
end;

//
// Eventos do componente "nova senha".
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.edtSenhaNovaEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtSenhaNova) then Exit;
end;

procedure TPlataformaERPVCLUsuarioSenhaTrocar.edtSenhaNovaKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLUsuarioSenhaTrocar.edtSenhaNovaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FormularioControlar;
end;

procedure TPlataformaERPVCLUsuarioSenhaTrocar.edtSenhaNovaExit(Sender: TObject);
begin
  if not VCLEditSair(edtSenhaNova) then Exit;
end;

//
// Eventos do componente "confirmação nova senha".
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.edtSenhaNovaConfEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtSenhaNovaConf) then Exit;
end;


procedure TPlataformaERPVCLUsuarioSenhaTrocar.edtSenhaNovaConfKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLUsuarioSenhaTrocar.edtSenhaNovaConfKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FormularioControlar;
end;

procedure TPlataformaERPVCLUsuarioSenhaTrocar.edtSenhaNovaConfExit(Sender: TObject);
begin
  if not VCLEditSair(edtSenhaNovaConf) then Exit;
end;

//
// Eventos do componente "exibir senha".
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.chkSenhaExibirClick(Sender: TObject);
begin
  FormularioControlar;
end;

//
// Evento de click no botão "gravar".
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os dados do formulário.
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.FormularioLimpar;
begin
  edtUsuario.Text := gloUsuarioNome;
  VCLEditLimpar    (edtSenhaAtual);
  VCLEditLimpar    (edtSenhaNova);
  VCLEditLimpar    (edtSenhaNovaConf);
  VCLCheckBoxLimpar(chkSenhaExibir);
end;

//
// Procedimento para exibir os componentes do formulário conforme o tipo de exibição.
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.FormularioComponentesExibir;
begin
  if not pubExigeSenhaAtual then
  begin
    lblSenhaAtual.Visible := False;
    edtSenhaAtual.Visible := False;

    lblUsuario.Top := lblUsuario.Top + 24;
    edtUsuario.Top := edtUsuario.Top + 24;

    lblSenhaNova.Top := lblSenhaNova.Top - 32;
    edtSenhaNova.Top := edtSenhaNova.Top - 32;

    lblSenhaNovaConf.Top := lblSenhaNovaConf.Top - 32;
    edtSenhaNovaConf.Top := edtSenhaNovaConf.Top - 32;

    imgSenhaErrada.Top  := imgSenhaErrada.Top - 32;
    imgSenhaCorreta.Top := imgSenhaCorreta.Top - 32;

    chkSenhaExibir.Top := chkSenhaExibir.Top - 32;
  end;
end;

//
// Procedimento para controlar o comportamento dos componentes do formulário.
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.FormularioControlar;
begin
  //
  // Nova senha confere com a confirmação?
  //
  imgSenhaErrada.Visible  := False;
  imgSenhaCorreta.Visible := False;

  if (StringTrim(edtSenhaNova.Text) <> '') or (StringTrim(edtSenhaNovaConf.Text) <> '') then
  begin
    if edtSenhaNova.Text = edtSenhaNovaConf.Text then
    begin
      imgSenhaCorreta.Visible := True;
    end
    else
    begin
      imgSenhaErrada.Visible := True;
    end;
  end;

  //
  // Exibir caracteres da senha?
  //
  if not chkSenhaExibir.Checked then
  begin
    edtSenhaAtual.PasswordChar    := '*';
    edtSenhaNova.PasswordChar     := '*';
    edtSenhaNovaConf.PasswordChar := '*';
  end
  else
  begin
    edtSenhaAtual.PasswordChar    := #0;
    edtSenhaNova.PasswordChar     := #0;
    edtSenhaNovaConf.PasswordChar := #0;
  end;
end;

//
// Procedimento para gravar.
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioConfirmar';
  ERRO_MENSAGEM    : string = 'Impossível gravar informações sobre a senha do usuário!';
var
  locADOConnection   : TADOConnection;
  locADOQuery        : TADOQuery;
  locLogMensagem     : string;

  locLicencaID       : Integer;
  locUsuarioBaseID   : Integer;
  locUsuarioID       : Integer;
                     
  locSenhaAtual      : string;
  locSenhaNova       : string;
  locSenhaNovaConf   : string;

  locRegistroAcao    : Byte;
  locRegistroAcaoID  : Integer;
  locUsuarioLogSq    : Integer;
  locUsuarioLogMsg   : string;
  locUsuarioLogDados : string;
  locHostName        : string;
  locUserName        : string;
  locLogUsuarioBaseID: Integer;
  locLogUsuarioID    : Integer;
begin
  //
  // Carrega variáveis com o conteúdo dos componentes.
  //
  locLicencaID        := priLicencaID;
  locUsuarioBaseID    := priUsuarioBaseID;
  locUsuarioID        := priUsuarioID;

  locSenhaAtual       := edtSenhaAtual.Text;
  locSenhaNova        := edtSenhaNova.Text;
  locSenhaNovaConf    := edtSenhaNovaConf.Text;

  locHostName         := HostNameRecuperar;
  locUserName         := UserNameRecuperar;
  locLogUsuarioBaseID := gloBaseID;
  locLogUsuarioID     := gloUsuarioID;

  //
  // A senha não pode ser em branco.
  //
  if (StringTrim(locSenhaNova) = '') and (StringTrim(locSenhaNovaConf) = '') then
  begin
    VCLConsistenciaExibir('Uma nova senha deve obrigatoriamente ser informada!');
    //edtSenha.SetFocus;
    Exit;
  end;

  //
  // A digitação da confirmação da senha deve conferir.
  //
  if locSenhaNova <> locSenhaNovaConf then
  begin
    VCLConsistenciaExibir('A confirmação da nova senha não confere com a primeira digitação!');
    //edtSenha.SetFocus;
    Exit;
  end;

  //
  // Log de dados.
  //
  locUsuarioLogDados := '';
  LogDadosStringDescrever ('Senha', locSenhaNova, locUsuarioLogDados);

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
  // Verifica senha atual do usuário.
  //
  if pubExigeSenhaAtual then
  begin
    locADOQuery.Close;
    locADOQuery.SQL.Clear;
    locADOQuery.SQL.Add('SELECT                                               ');
    locADOQuery.SQL.Add('  [usuario].[senha]                                  ');
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
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para selecionar um registro na tabela [usuario]!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
        Exit
      end;
    end;

    if locADOQuery.RecordCount > 0 then
    begin
      if locADOQuery.FieldByName('senha').AsString <> locSenhaAtual then
      begin
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        VCLConsistenciaExibir('A senha atual informada não confere!');
        edtSenhaAtual.SetFocus;
        Exit;
      end;
    end;
  end;

  //
  // Determina o ID da ação e a mensagem para o log do registro.
  //
  locRegistroAcao  := REGISTRO_ACAO_ALTERACAO;
  locUsuarioLogMsg := 'Troca de senha pelo usuário!';

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

  //
  // Atualiza dados.
  //
  locADOQuery.SQL.Add('UPDATE                                    ');
  locADOQuery.SQL.Add('  [usuario]                               ');
  locADOQuery.SQL.Add('SET                                       ');
  locADOQuery.SQL.Add('  [senha_trocar]     = ''N'',             ');
  locADOQuery.SQL.Add('  [senha]            = :senha,            ');
  locADOQuery.SQL.Add('  [upd_local_dt_hr]  = :local_dt_hr,      ');
  locADOQuery.SQL.Add('  [upd_server_dt_hr] = GETDATE(),         ');
  locADOQuery.SQL.Add('  [upd_contador]     = [upd_contador] + 1 ');
  locADOQuery.SQL.Add('WHERE                                     ');
  locADOQuery.SQL.Add('  [licenca_id]      = :licenca_id      AND ');
  locADOQuery.SQL.Add('  [usuario_base_id] = :usuario_base_id AND ');
  locADOQuery.SQL.Add('  [usuario_id]      = :usuario_id          ');

  //
  // Parâmetros.
  //
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := locLicencaID;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value      := locUsuarioID;
  locADOQuery.Parameters.ParamByName('senha').Value           := locSenhaNova;
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
  // Determina o próximo sequencial da tabela usuario_log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                   ');
  locADOQuery.SQL.Add('  MAX([usuario_log].[usuario_log_sq]) AS [sequencial]    ');
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
    locUsuarioLogSq := locADOQuery.FieldByName('sequencial').AsInteger + 1;
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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, locUsuarioID,  '', 'usuario', locUsuarioLogMsg, locUsuarioLogDados);
  except
    on locExcecao: Exception do
    begin
      VCLErroExibir(locExcecao.Message);
    end;
  end;

  //
  // Configurações de senha atualizadas!
  //
  VCLInformacaoExibir('Troca de senha realizada com sucesso!');

  //
  // Retorna.
  //
  pubClicouFechar := False;
  Close;
end;

end.
