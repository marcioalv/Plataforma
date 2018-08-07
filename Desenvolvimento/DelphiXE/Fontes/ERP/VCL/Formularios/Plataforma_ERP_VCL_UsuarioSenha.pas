//
// Arquivo..: Plataforma_ERP_VCL_UsuarioSenha.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com o cadastro de senha do usu�rio.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_UsuarioSenha;

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
  Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Grids, Vcl.Samples.Calendar, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.WinXCtrls;

type
  TPlataformaERPVCLUsuarioSenha = class(TForm)
    Image1: TImage;
    imgBackground: TImage;
    btnFechar: TBitBtn;
    btnMinimizar: TBitBtn;
    panFormulario: TPanel;
    btnConfirmar: TBitBtn;
    mnuFormulario: TMainMenu;
    mniFechar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniConfirmar: TMenuItem;
    chkSenhaExibir: TCheckBox;
    lblSenha: TLabel;
    edtSenha: TEdit;
    edtSenhaConf: TEdit;
    lblSenhaConf: TLabel;
    tswTrocarSenha: TToggleSwitch;
    lblTrocarSenha: TLabel;
    imgSenhaErrada: TImage;
    imgSenhaCorreta: TImage;
    chkExigirSenha: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure tswTrocarSenhaEnter(Sender: TObject);
    procedure tswTrocarSenhaExit(Sender: TObject);
    procedure tswTrocarSenhaClick(Sender: TObject);
    procedure edtSenhaEnter(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaConfEnter(Sender: TObject);
    procedure edtSenhaConfExit(Sender: TObject);
    procedure edtSenhaConfKeyPress(Sender: TObject; var Key: Char);
    procedure chkSenhaExibirEnter(Sender: TObject);
    procedure chkSenhaExibirExit(Sender: TObject);
    procedure chkSenhaExibirKeyPress(Sender: TObject; var Key: Char);
    procedure chkSenhaExibirClick(Sender: TObject);
    procedure edtSenhaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtSenhaConfKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chkExigirSenhaEnter(Sender: TObject);
    procedure chkExigirSenhaExit(Sender: TObject);
    procedure chkExigirSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure chkExigirSenhaClick(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioControlar;
    procedure FormularioConfirmar;
  public
    pubClicouFechar : Boolean;
    pubIDLicenca    : Integer;
    pubUsuarioBaseID: Integer;
    pubUsuarioID    : Integer;
    pubExigirSenha  : Boolean;
    pubTrocarSenha  : Boolean;
  end;

var
  PlataformaERPVCLUsuarioSenha: TPlataformaERPVCLUsuarioSenha;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLUsuarioSenha.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas.
  //
  pubClicouFechar  := False;
  pubIDLicenca     := 0;
  pubUsuarioBaseID := 0;
  pubUsuarioID     := 0;
  pubExigirSenha   := False;
  pubTrocarSenha   := False;
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLUsuarioSenha.FormShow(Sender: TObject);
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
  // Carrega informa��es passadas por par�metro para o formul�rio.
  //
  if (pubIDLicenca <> 0) and (pubUsuarioBaseID <> 0) and (pubUsuarioID <> 0) then
  begin
    chkExigirSenha.Checked := pubExigirSenha;
    VCLToggleSwitchLigar(tswTrocarSenha, pubTrocarSenha);
  end;

  //
  // Controlar exibi��o dos componentes.
  //
  FormularioControlar;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLUsuarioSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos do componente "exigir senha?"
//
procedure TPlataformaERPVCLUsuarioSenha.chkExigirSenhaEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkExigirSenha) then Exit;
end;

procedure TPlataformaERPVCLUsuarioSenha.chkExigirSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLUsuarioSenha.chkExigirSenhaExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkExigirSenha) then Exit;
end;

procedure TPlataformaERPVCLUsuarioSenha.chkExigirSenhaClick(Sender: TObject);
begin
  FormularioControlar;
end;

//
// Eventos do componente "trocar senha?"
//
procedure TPlataformaERPVCLUsuarioSenha.tswTrocarSenhaEnter(Sender: TObject);
begin
  if not VCLToggleSwitchEntrar(tswTrocarSenha) then Exit;
end;

procedure TPlataformaERPVCLUsuarioSenha.tswTrocarSenhaClick(Sender: TObject);
begin
  VCLToggleSwitchValidar(tswTrocarSenha);
end;

procedure TPlataformaERPVCLUsuarioSenha.tswTrocarSenhaExit(Sender: TObject);
begin
  if not VCLToggleSwitchSair(tswTrocarSenha) then Exit;
end;

//
// Eventos do componente "senha".
//
procedure TPlataformaERPVCLUsuarioSenha.edtSenhaEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtSenha) then exit;
end;

procedure TPlataformaERPVCLUsuarioSenha.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLUsuarioSenha.edtSenhaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FormularioControlar;
end;

procedure TPlataformaERPVCLUsuarioSenha.edtSenhaExit(Sender: TObject);
begin
  if not VCLEditSair(edtSenha) then exit;
  FormularioControlar;
end;

//
// Eventos do componente "Confirma��o senha".
//
procedure TPlataformaERPVCLUsuarioSenha.edtSenhaConfEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtSenhaConf) then exit;
end;

procedure TPlataformaERPVCLUsuarioSenha.edtSenhaConfKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLUsuarioSenha.edtSenhaConfKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FormularioControlar;
end;

procedure TPlataformaERPVCLUsuarioSenha.edtSenhaConfExit(Sender: TObject);
begin
  if not VCLEditSair(edtSenhaConf) then exit;
  FormularioControlar;  
end;

//
// Eventos do componente "exibir senha?"
//
procedure TPlataformaERPVCLUsuarioSenha.chkSenhaExibirEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkSenhaExibir) then Exit;
end;

procedure TPlataformaERPVCLUsuarioSenha.chkSenhaExibirKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLUsuarioSenha.chkSenhaExibirClick(Sender: TObject);
begin
  FormularioControlar;
end;

procedure TPlataformaERPVCLUsuarioSenha.chkSenhaExibirExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkSenhaExibir) then Exit;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLUsuarioSenha.FormularioLimpar;
begin
  VCLCheckBoxLimpar(chkExigirSenha);
  VCLToggleSwitchLimpar(tswTrocarSenha);
  VCLEditLimpar    (edtSenha);
  VCLEditLimpar    (edtSenhaConf);  
  VCLCheckBoxLimpar(chkSenhaExibir);
end;

//
// Procedimento para controlar os componentes da tela.
//
procedure TPlataformaERPVCLUsuarioSenha.FormularioControlar;
begin
  //
  // Exigir senha?
  //
  if not chkExigirSenha.Checked then
  begin
    lblTrocarSenha.Font.Color := clGray;
    tswTrocarSenha.Enabled    := False;    
    lblSenha.Font.Color       := lblTrocarSenha.Font.Color;
    edtSenha.Enabled          := False;
    lblSenhaConf.Font.Color   := lblTrocarSenha.Font.Color;    
    edtSenhaConf.Enabled      := False;
    chkSenhaExibir.Enabled    := False;
  end
  else
  begin
    lblTrocarSenha.Font.Color := clWindowText;
    tswTrocarSenha.Enabled    := True;
    lblSenha.Font.Color       := lblTrocarSenha.Font.Color;
    edtSenha.Enabled          := True;    
    lblSenhaConf.Font.Color   := lblTrocarSenha.Font.Color;
    edtSenhaConf.Enabled      := True;
    chkSenhaExibir.Enabled    := True;
  end;

  //
  // Senhas conferem?
  //
  imgSenhaErrada.Visible  := False;
  imgSenhaCorreta.Visible := False;
  
  if (edtSenha.Text <> '') or (edtSenhaConf.Text <> '') then
  begin
    if edtSenha.Text <> edtSenhaConf.Text then
    begin
      imgSenhaErrada.Visible := True;
    end
    else
    begin
      imgSenhaCorreta.Visible := True;
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
procedure TPlataformaERPVCLUsuarioSenha.FormularioConfirmar;
const
  PROCEDIMENTO_NOME: string = 'FormularioConfirmar';
  ERRO_MENSAGEM    : string = 'Imposs�vel confirmar informa��es sobre a senha do usu�rio!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;

  locLicencaID    : Integer;
  locUsuarioBaseID: Integer;
  locUsuarioID    : Integer;

  locUpdContador  : Integer;
begin
{
  //
  // Carrega vari�veis com o conte�do dos componentes.
  //
  locLicencaID     := 1;
  locUsuarioBaseID := 1;
  locUsuarioID     := 1;

  //
  // Consiste as informa��es.
  //


  //
  // Confirma grava��o com o usu�rio.
  //
  if not VCLQuestionamentoExibir('Deseja realmente realizar estas altera��es na senha do usu�rio?') then Exit;

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
  // Consiste o contador do update.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                     ');
  locADOQuery.SQL.Add('  [usuario].[upd_contador]                 ');
  locADOQuery.SQL.Add('FROM                                       ');
  locADOQuery.SQL.Add('  [usuario] WITH (NOLOCK)                  ');
  locADOQuery.SQL.Add('WHERE                                      ');
  locADOQuery.SQL.Add('  [usuario].[licenca_id] = :licenca_id AND ');
  locADOQuery.SQL.Add('  [usuario].[base_id]    = :base_id    AND ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id] = :usuario_id     ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value := locLicencaID;
  locADOQuery.Parameters.ParamByName('base_id').Value    := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value := locUsuarioID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualiza��es confere na tabela [usuario]!';
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
      locLogMensagem := 'Esse registro sofreu alguma outra altera��o entre a sua consulta e essa grava��o!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem);
      Exit
    end;
  end;

  //
  // Determina o ID da a��o e a mensagem para o log do registro.
  //
  if locInsert then
  begin
    locRegistroAcao  := REGISTRO_ACAO_CRIACAO;
    locUsuarioLogMsg := MENSAGEM_REGISTRO_ACAO_CRIADO;
  end
  else
  begin
    locRegistroAcao  := REGISTRO_ACAO_ALTERACAO;
    locUsuarioLogMsg := MENSAGEM_REGISTRO_ACAO_ALTERADO;
  end;

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
  // Determina o pr�ximo ID do usu�rio.
  //
  if locInsert then
  begin
    try
      locUsuarioID := Plataforma_ERP_ADO_NumeradorLicencaDeterminar(locADOConnection,
                                                                    locLicencaID,
                                                                    locBaseID,
                                                                    NUMERADOR_USUARIO_ID,
                                                                    locLogUsuarioBaseID,
                                                                    locLogUsuarioID);
    except
      on locExcecao: Exception do
      begin
        locADOConnection.RollbackTrans;
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Imposs�vel determinar o pr�ximo numerador para o usu�rio!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
        Exit
      end;
    end;
  end;

  //
  // Grava dados na tabela usuario.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;

  if locInsert then
  begin
    //
    // Insere dados.
    //
    locADOQuery.SQL.Add('INSERT INTO [usuario] (   ');
    locADOQuery.SQL.Add('  [licenca_id],           ');
    locADOQuery.SQL.Add('  [base_id],              ');
    locADOQuery.SQL.Add('  [usuario_id],           ');
    locADOQuery.SQL.Add('  [codigo],               ');
    locADOQuery.SQL.Add('  [tipo_usuario_base_id], ');
    locADOQuery.SQL.Add('  [tipo_usuario_id],      ');
    locADOQuery.SQL.Add('  [nome],                 ');
    locADOQuery.SQL.Add('  [logon],                ');
    locADOQuery.SQL.Add('  [automato],             ');
    locADOQuery.SQL.Add('  [administrador],        ');
    locADOQuery.SQL.Add('  [bloqueado],            ');
    locADOQuery.SQL.Add('  [ativo],                ');
    locADOQuery.SQL.Add('  [ins_local_dt_hr],      ');
    locADOQuery.SQL.Add('  [ins_server_dt_hr],     ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr],      ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr],     ');
    locADOQuery.SQL.Add('  [upd_contador]          ');  
    locADOQuery.SQL.Add(')                         ');
    locADOQuery.SQL.Add('VALUES (                  ');
    locADOQuery.SQL.Add('  :licenca_id,            '); // licenca_id.
    locADOQuery.SQL.Add('  :base_id,               '); // base_id.
    locADOQuery.SQL.Add('  :usuario_id,            '); // usuario_id.
    locADOQuery.SQL.Add('  :codigo,                '); // codigo.
    locADOQuery.SQL.Add('  :tipo_usuario_base_id,  '); // tipo_usuario_base_id.
    locADOQuery.SQL.Add('  :tipo_usuario_id,       '); // tipo_usuario_id.
    locADOQuery.SQL.Add('  :nome,                  '); // nome.
    locADOQuery.SQL.Add('  :logon,                 '); // logon.
    locADOQuery.SQL.Add('  :automato,              '); // automato.
    locADOQuery.SQL.Add('  :administrador,         '); // administrador.
    locADOQuery.SQL.Add('  :bloqueado,             '); // bloqueado.
    locADOQuery.SQL.Add('  :ativo,                 '); // ativo.
    locADOQuery.SQL.Add('  :local_dt_hr,           '); // ins_local_dt_hr.
    locADOQuery.SQL.Add('  GETDATE(),              '); // ins_server_dt_hr.
    locADOQuery.SQL.Add('  NULL,                   '); // upd_local_dt_hr.
    locADOQuery.SQL.Add('  NULL,                   '); // upd_server_dt_hr.
    locADOQuery.SQL.Add('  0                       '); // upd_contador.
    locADOQuery.SQL.Add(')                         ');
  end
  else
  begin
    //
    // Atualiza dados.
    //
    locADOQuery.SQL.Add('UPDATE                                            ');
    locADOQuery.SQL.Add('  [usuario]                                       ');
    locADOQuery.SQL.Add('SET                                               ');
    locADOQuery.SQL.Add('  [codigo]               = :codigo,               ');
    locADOQuery.SQL.Add('  [tipo_usuario_base_id] = :tipo_usuario_base_id, ');
    locADOQuery.SQL.Add('  [tipo_usuario_id]      = :tipo_usuario_id,      ');        
    locADOQuery.SQL.Add('  [nome]                 = :nome,                 ');
    locADOQuery.SQL.Add('  [logon]                = :logon,                ');
    locADOQuery.SQL.Add('  [automato]             = :automato,             ');
    locADOQuery.SQL.Add('  [administrador]        = :administrador,        ');
    locADOQuery.SQL.Add('  [bloqueado]            = :bloqueado,            ');
    locADOQuery.SQL.Add('  [ativo]                = :ativo,                ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr]      = :local_dt_hr,          ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr]     = GETDATE(),             ');
    locADOQuery.SQL.Add('  [upd_contador]         = [upd_contador] + 1     ');
    locADOQuery.SQL.Add('WHERE                                             ');
    locADOQuery.SQL.Add('  [licenca_id] = :licenca_id AND                  ');
    locADOQuery.SQL.Add('  [base_id]    = :base_id    AND                  ');
    locADOQuery.SQL.Add('  [usuario_id] = :usuario_id                      ');
  end;

  //
  // Par�metros.
  //
  locADOQuery.Parameters.ParamByName('licenca_id').Value           := locLicencaID;
  locADOQuery.Parameters.ParamByName('base_id').Value              := locBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value           := locUsuarioID;
  locADOQuery.Parameters.ParamByName('codigo').Value               := locCodigo;
  locADOQuery.Parameters.ParamByName('tipo_usuario_base_id').Value := locTipoUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value      := locTipoUsuarioID;
  locADOQuery.Parameters.ParamByName('nome').Value                 := locNome;
  locADOQuery.Parameters.ParamByName('logon').Value                := locLogon;
  locADOQuery.Parameters.ParamByName('automato').Value             := BooleanStringConverter(locAutomato);
  locADOQuery.Parameters.ParamByName('administrador').Value        := BooleanStringConverter(locAdministrador);
  locADOQuery.Parameters.ParamByName('bloqueado').Value            := BooleanStringConverter(locBloqueado);
  locADOQuery.Parameters.ParamByName('ativo').Value                := BooleanStringConverter(locAtivo);
  locADOQuery.Parameters.ParamByName('local_dt_hr').Value          := Now;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [usuario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  //
  // Determina o contador de updates atual.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                     ');
  locADOQuery.SQL.Add('  [usuario].[ins_local_dt_hr],             ');
  locADOQuery.SQL.Add('  [usuario].[upd_local_dt_hr],             ');
  locADOQuery.SQL.Add('  [usuario].[upd_contador]                 ');
  locADOQuery.SQL.Add('FROM                                       ');
  locADOQuery.SQL.Add('  [usuario]                                ');
  locADOQuery.SQL.Add('WHERE                                      ');
  locADOQuery.SQL.Add('  [usuario].[licenca_id] = :licenca_id AND ');
  locADOQuery.SQL.Add('  [usuario].[base_id]    = :base_id    AND ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id] = :usuario_id     ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value := locLicencaID;
  locADOQuery.Parameters.ParamByName('base_id').Value    := locBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value := locUsuarioID;

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

  locInsLocalDtHr := locADOQuery.FieldByName('ins_local_dt_hr').AsDateTime;
  locUpdLocalDtHr := locADOQuery.FieldByName('upd_local_dt_hr').AsDateTime;
  locUpdContador  := locADOQuery.FieldByName('upd_contador').AsInteger;

  //
  // Log dados.
  //
  locUsuarioLogLogDados := LogDadosGerar(locUsuarioID);
  
  //
  // Determina o pr�ximo sequencial da tabela usuario_log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                              ');
  locADOQuery.SQL.Add('  MAX([usuario_log].[usuario_log_sq]) AS Sequencial ');
  locADOQuery.SQL.Add('FROM                                                ');
  locADOQuery.SQL.Add('  [usuario_log]                                     ');
  locADOQuery.SQL.Add('WHERE                                               ');
  locADOQuery.SQL.Add('  [usuario_log].[licenca_id] = :licenca_id AND      ');
  locADOQuery.SQL.Add('  [usuario_log].[base_id]    = :base_id    AND      ');
  locADOQuery.SQL.Add('  [usuario_log].[usuario_id] = :usuario_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value := locLicencaID;
  locADOQuery.Parameters.ParamByName('base_id').Value    := locBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value := locUsuarioID;

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

  // Monta SQL para inserir dados na tabela.
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('INSERT INTO [usuario_log] (');
  locADOQuery.SQL.Add('  [licenca_id],            ');
  locADOQuery.SQL.Add('  [base_id],               ');
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
  locADOQuery.SQL.Add('  :base_id,                '); // base_id.
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
  locADOQuery.Parameters.ParamByName('base_id').Value             := locBaseID;
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
  locADOQuery.Parameters.ParamByName('dados').Value               := locUsuarioLogLogDados;

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
  // Atualiza componentes que sofreram altera��o com a grava��o.
  //
  edtUsuarioID.Text    := IntegerStringConverter(locUsuarioID);
  edtInsLocalDtHr.Text := DateTimeStringConverter(locInsLocalDtHr, 'dd/mm/yyyy hh:nn:ss.zzz');
  edtUpdLocalDtHr.Text := DateTimeStringConverter(locUpdLocalDtHr, 'dd/mm/yyyy hh:nn:ss.zzz');
  edtUpdContador.Text  := IntegerStringConverter(locUpdContador);

  //
  // Componentes desligados para edi��o.
  //
  FormularioControlar(False);

  //
  // Indica que os dados foram atualizados.
  //
  pubDadosAtualizados := True;

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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, locUsuarioID, locUsuarioLogMsg, locUsuarioLogLogDados);
  except
    on locExcecao: Exception do
    begin
      VCLErroExibir(locExcecao.Message);
    end;
  end;

  //
  // Usu�rio gravado!
  //
  VCLInformacaoExibir('Usu�rio gravado com sucesso!');
}  
end;

end.
