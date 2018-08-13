//
// Arquivo..: Plataforma_ERP_VCL_UsuarioSenhaTrocar.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com os dados para trocar a senha do usu�rio.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
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
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.FormCreate(Sender: TObject);
begin
  //
  // Inicializa��o das vari�veis privadas.
  //
  priLicencaID     := gloLicencaID;
  priUsuarioBaseID := gloUsuarioBaseID;
  priUsuarioID     := gloUsuarioID;

  //
  // Inicializa��o das vari�veis p�blicas.
  //
  pubClicouFechar := True;
end;

//
// Event de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.FormShow(Sender: TObject);
begin
  //
  // Background do formul�rio.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Limpa componentes do formul�rio.
  //
  FormularioLimpar;

  //
  // Controlar comportamento dos componentes do formul�rio.
  //
  FormularioControlar;

  //
  // Foco no componente apropriado.
  //
  edtSenha.SetFocus;
end;

//
// Evento de pressionamento de teclas no formul�rio.
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
// Eventos do componente "confirma��o senha".
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
// Evento de click no bot�o "confirmar".
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.btnConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

//
// Evento de click no bot�o "minimizar".
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os dados do formul�rio.
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.FormularioLimpar;
begin
  edtUsuario.Text := gloUsuarioNome;
  VCLEditLimpar    (edtSenha);
  VCLEditLimpar    (edtSenhaConf);
  VCLCheckBoxLimpar(chkSenhaExibir);
end;

//
// Procedimento para controlar o comportamento dos componentes do formul�rio.
//
procedure TPlataformaERPVCLUsuarioSenhaTrocar.FormularioControlar;
begin
  //
  // Nova senha confere com a confirma��o?
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
  ERRO_MENSAGEM    : string = 'Imposs�vel confirmar informa��es sobre a senha do usu�rio!';
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
  // Carrega vari�veis com o conte�do dos componentes.
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
  // A senha n�o pode ser em branco.
  //
  if (StringTrim(locSenha) = '') and (StringTrim(locSenhaConf) = '') then
  begin
    VCLConsistenciaExibir('Uma senha deve obrigatoriamente ser informada!');
    //edtSenha.SetFocus;
    Exit;
  end;

  //
  // A digita��o da confirma��o da senha deve conferir.
  //
  if locSenha <> locSenhaConf then
  begin
    VCLConsistenciaExibir('A confirma��o da senha n�o confere com a primeira digita��o!');
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
  // Conex�o ao banco de dados.
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
  // Determina o ID da a��o e a mensagem para o log do registro.
  //
  locRegistroAcao  := REGISTRO_ACAO_ALTERACAO;
  locUsuarioLogMsg := 'Troca de senha pelo usu�rio!';

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
  // Inicia transa��o com o banco de dados.
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
  // Par�metros.
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
  // Determina o pr�ximo sequencial da tabela usuario_log.
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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o pr�ximo sequencial para o registro na tabela [usuario_log]!';
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
  // Finaliza transa��o com o banco de dados.
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
  // Grava log de ocorr�ncia.
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
  // Configura��es de senha atualizadas!
  //
  VCLInformacaoExibir('Troca de senha realizada com sucesso!');

  //
  // Retorna.
  //
  pubClicouFechar := False;
  Close;
end;

end.
