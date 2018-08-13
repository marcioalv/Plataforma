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
    lblSenha: TLabel;
    lblSenhaConf: TLabel;
    imgSenhaErrada: TImage;
    imgSenhaCorreta: TImage;
    chkSenhaExibir: TCheckBox;
    edtSenha: TEdit;
    edtSenhaConf: TEdit;
    btnConfirmar: TBitBtn;
    mnuFormulario: TMainMenu;
    mniConfirmar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniFechar: TMenuItem;
    Label1: TLabel;
    edtUsuario: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaEnter(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaConfEnter(Sender: TObject);
    procedure edtSenhaConfExit(Sender: TObject);
    procedure edtSenhaConfKeyPress(Sender: TObject; var Key: Char);
    procedure mniConfirmarClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkSenhaExibirClick(Sender: TObject);
    procedure edtSenhaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtSenhaConfKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    priLicencaID    : Integer;
    priUsuarioBaseID: Integer;
    priUsuarioID    : Integer;
    procedure FormularioLimpar;
    procedure FormularioControlar;
    procedure FormularioConfirmar;
  public
    pubClicouFechar: Boolean;
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
  pubClicouFechar := True;
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
  // Controlar comportamento dos componentes do formulário.
  //
  FormularioControlar;

  //
  // Foco no componente apropriado.
  //
  edtSenha.SetFocus;
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
procedure TPlataformaERPVCLUsuarioSenhaTrocar.mniConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
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
// Eventos do componente "senha".
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.edtSenhaEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtSenha) then Exit;
end;

procedure TPlataformaERPVCLUsuarioSenhaTrocar.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLUsuarioSenhaTrocar.edtSenhaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FormularioControlar;
end;

procedure TPlataformaERPVCLUsuarioSenhaTrocar.edtSenhaExit(Sender: TObject);
begin
  if not VCLEditSair(edtSenha) then Exit;
end;

//
// Eventos do componente "confirmação senha".
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.edtSenhaConfEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtSenhaConf) then Exit;
end;


procedure TPlataformaERPVCLUsuarioSenhaTrocar.edtSenhaConfKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLUsuarioSenhaTrocar.edtSenhaConfKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FormularioControlar;
end;

procedure TPlataformaERPVCLUsuarioSenhaTrocar.edtSenhaConfExit(Sender: TObject);
begin
  if not VCLEditSair(edtSenhaConf) then Exit;
end;

//
// Eventos do componente "exibir senha".
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.chkSenhaExibirClick(Sender: TObject);
begin
  FormularioControlar;
end;

//
// Evento de click no botão "confirmar".
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.btnConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
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
  VCLEditLimpar    (edtSenha);
  VCLEditLimpar    (edtSenhaConf);
  VCLCheckBoxLimpar(chkSenhaExibir);
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

  if (StringTrim(edtSenha.Text) <> '') or (StringTrim(edtSenhaConf.Text) <> '') then
  begin
    if edtSenha.Text = edtSenhaConf.Text then
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
    edtSenha.PasswordChar     := '*';
    edtSenhaConf.PasswordChar := '*';
  end
  else
  begin
    edtSenha.PasswordChar     := #0;
    edtSenhaConf.PasswordChar := #0;
  end;
end;

//
// Procedimento para confirmar.
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.FormularioConfirmar;
const
  PROCEDIMENTO_NOME: string = 'FormularioConfirmar';
  ERRO_MENSAGEM    : string = 'Impossível confirmar informações sobre a senha do usuário!';
var
  locADOConnection   : TADOConnection;
  locADOQuery        : TADOQuery;
  locLogMensagem     : string;

  locLicencaID       : Integer;
  locUsuarioBaseID   : Integer;
  locUsuarioID       : Integer;
                     
  locSenha           : string;
  locSenhaConf       : string;

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

  locSenha            := edtSenha.Text;
  locSenhaConf        := edtSenhaConf.Text;

  locHostName         := HostNameRecuperar;
  locUserName         := UserNameRecuperar;
  locLogUsuarioBaseID := gloBaseID;
  locLogUsuarioID     := gloUsuarioID;

  //
  // A senha não pode ser em branco.
  //
  if (StringTrim(locSenha) = '') and (StringTrim(locSenhaConf) = '') then
  begin
    VCLConsistenciaExibir('Uma senha deve obrigatoriamente ser informada!');
    //edtSenha.SetFocus;
    Exit;
  end;

  //
  // A digitação da confirmação da senha deve conferir.
  //
  if locSenha <> locSenhaConf then
  begin
    VCLConsistenciaExibir('A confirmação da senha não confere com a primeira digitação!');
    //edtSenha.SetFocus;
    Exit;
  end;

  //
  // Log de dados.
  //
  locUsuarioLogDados := '';
  LogDadosStringDescrever ('Senha', locSenha, locUsuarioLogDados);

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
  locADOQuery.Parameters.ParamByName('senha').Value           := locSenha;
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
  locADOQuery.SQL.Add('  :licenca_id,             '); // licenca_id.
  locADOQuery.SQL.Add('  :usuario_base_id,        '); // usuario_base_id.
  locADOQuery.SQL.Add('  :usuario_id,             '); // usuario_id.
  locADOQuery.SQL.Add('  :usuario_log_sq,         '); // usuario_log_sq.
  locADOQuery.SQL.Add('  :log_base_id,            '); // log_base_id.
  locADOQuery.SQL.Add('  :log_local_dt_hr,        '); // log_local_dt_hr.
  locADOQuery.SQL.Add('  GETDATE(),               '); // log_server_dt_hr.
  locADOQuery.SQL.Add('  :registro_acao_id,       '); // registro_acao_id.
  locADOQuery.SQL.Add('  :host_name,              '); // host_name.
  locADOQuery.SQL.Add('  :user_name,              '); // user_name.
  locADOQuery.SQL.Add('  :log_usuario_base_id,    '); // log_usuario_base_id.
  locADOQuery.SQL.Add('  :log_usuario_id,         '); // log_usuario_id.
  locADOQuery.SQL.Add('  :mensagem,               '); // mensagem.
  locADOQuery.SQL.Add('  :dados                   '); // dados.
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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, locUsuarioID, locUsuarioLogMsg, locUsuarioLogDados);
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
