//
// Arquivo..: Plataforma_ERP_VCL_UsuarioSenha.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com o cadastro de senha do usuário.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
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
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Vcl.WinXCtrls;

type
  TPlataformaERPVCLUsuarioSenha = class(TForm)
    imgFormulario: TImage;
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
    tswSenhaTrocar: TToggleSwitch;
    lblSenhaTrocar: TLabel;
    imgSenhaErrada: TImage;
    imgSenhaCorreta: TImage;
    chkSenhaExigir: TCheckBox;
    edtUpdContador: TEdit;
    lblUpdContador: TLabel;
    chkSenhaInformar: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure tswSenhaTrocarEnter(Sender: TObject);
    procedure tswSenhaTrocarExit(Sender: TObject);
    procedure tswSenhaTrocarClick(Sender: TObject);
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
    procedure chkSenhaExigirEnter(Sender: TObject);
    procedure chkSenhaExigirExit(Sender: TObject);
    procedure chkSenhaExigirKeyPress(Sender: TObject; var Key: Char);
    procedure chkSenhaExigirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
    procedure mniConfirmarClick(Sender: TObject);
    procedure chkSenhaInformarEnter(Sender: TObject);
    procedure chkSenhaInformarExit(Sender: TObject);
    procedure chkSenhaInformarKeyPress(Sender: TObject; var Key: Char);
    procedure chkSenhaInformarClick(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioControlar;
    
    procedure FormularioPopular(argLicencaID    : Integer;
                                argUsuarioBaseID: Integer;
                                argUsuarioID    : Integer);

    procedure FormularioConfirmar;
  public
    pubClicouFechar : Boolean;
    pubLicencaID    : Integer;
    pubUsuarioBaseID: Integer;
    pubUsuarioID    : Integer;
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
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLUsuarioSenha.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas.
  //
  pubClicouFechar  := True;
  pubLicencaID     := 0;
  pubUsuarioBaseID := 0;
  pubUsuarioID     := 0;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLUsuarioSenha.FormShow(Sender: TObject);
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
  // Carrega informações passadas por parâmetro para o formulário.
  //
  if (pubLicencaID <> 0) and (pubUsuarioBaseID <> 0) and (pubUsuarioID <> 0) then
  begin
    FormularioPopular(pubLicencaID, pubUsuarioBaseID, pubUsuarioID);
  end;

  //
  // Controlar exibição dos componentes.
  //
  FormularioControlar;

  //
  // Foco no componente apropriado.
  //
  if not chkSenhaExigir.Checked then
  begin
    chkSenhaExigir.SetFocus;
  end
  else
  begin
    if not chkSenhaInformar.Checked then
    begin
      btnFechar.SetFocus;
    end
    else
    begin
      edtSenha.SetFocus;
    end;
  end;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLUsuarioSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas opções do menu.
//
procedure TPlataformaERPVCLUsuarioSenha.mniConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

procedure TPlataformaERPVCLUsuarioSenha.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLUsuarioSenha.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "exigir senha?"
//
procedure TPlataformaERPVCLUsuarioSenha.chkSenhaExigirEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkSenhaExigir) then Exit;
end;

procedure TPlataformaERPVCLUsuarioSenha.chkSenhaExigirKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLUsuarioSenha.chkSenhaExigirExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkSenhaExigir) then Exit;
end;

procedure TPlataformaERPVCLUsuarioSenha.chkSenhaExigirClick(Sender: TObject);
begin
  FormularioControlar;
end;

//
// Eventos do componente "trocar senha?"
//
procedure TPlataformaERPVCLUsuarioSenha.tswSenhaTrocarEnter(Sender: TObject);
begin
  if not VCLToggleSwitchEntrar(tswSenhaTrocar) then Exit;
end;

procedure TPlataformaERPVCLUsuarioSenha.tswSenhaTrocarClick(Sender: TObject);
begin
  VCLToggleSwitchValidar(tswSenhaTrocar);
end;

procedure TPlataformaERPVCLUsuarioSenha.tswSenhaTrocarExit(Sender: TObject);
begin
  if not VCLToggleSwitchSair(tswSenhaTrocar) then Exit;
end;

//
// Eventos do componente "informar nova senha".
//
procedure TPlataformaERPVCLUsuarioSenha.chkSenhaInformarEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkSenhaInformar) then Exit;
end;

procedure TPlataformaERPVCLUsuarioSenha.chkSenhaInformarKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLUsuarioSenha.chkSenhaInformarExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkSenhaInformar) then Exit;
end;

procedure TPlataformaERPVCLUsuarioSenha.chkSenhaInformarClick(Sender: TObject);
begin
  FormularioControlar;

  if chkSenhaInformar.Checked then
  begin
    edtSenha.SetFocus;
  end;
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
// Eventos do componente "Confirmação senha".
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
// Evento de click no botão "confirmar".
//
procedure TPlataformaERPVCLUsuarioSenha.btnConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLUsuarioSenha.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLUsuarioSenha.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLUsuarioSenha.FormularioLimpar;
begin
  VCLEditLimpar(edtUpdContador);
  VCLCheckBoxLimpar(chkSenhaExigir);
  VCLToggleSwitchLimpar(tswSenhaTrocar);
  VCLCheckBoxLimpar(chkSenhaInformar);
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
  if not chkSenhaExigir.Checked then
  begin
    lblSenhaTrocar.Font.Color := clGray;
    tswSenhaTrocar.Enabled    := False;

    chkSenhaInformar.Enabled  := False;
    
    lblSenha.Font.Color       := lblSenhaTrocar.Font.Color;
    edtSenha.Enabled          := False;
    lblSenhaConf.Font.Color   := lblSenhaTrocar.Font.Color;    
    edtSenhaConf.Enabled      := False;
    chkSenhaExibir.Enabled    := False;
  end
  else
  begin
    lblSenhaTrocar.Font.Color := clWindowText;
    tswSenhaTrocar.Enabled    := True;

    chkSenhaInformar.Enabled  := True;

    lblSenha.Font.Color       := lblSenhaTrocar.Font.Color;
    edtSenha.Enabled          := True;    
    lblSenhaConf.Font.Color   := lblSenhaTrocar.Font.Color;
    edtSenhaConf.Enabled      := True;
    chkSenhaExibir.Enabled    := True;
  end;

  //
  // Informar nova senha.
  //
  if (not chkSenhaExigir.Checked) or (not chkSenhaInformar.Checked) then
  begin
    lblSenha.Font.Color       := lblSenhaTrocar.Font.Color;
    edtSenha.Enabled          := False;
    lblSenhaConf.Font.Color   := lblSenhaTrocar.Font.Color;    
    edtSenhaConf.Enabled      := False;
    chkSenhaExibir.Enabled    := False;
  end
  else
  begin
    lblSenha.Font.Color       := lblSenhaTrocar.Font.Color;
    edtSenha.Enabled          := True;    
    lblSenhaConf.Font.Color   := lblSenhaTrocar.Font.Color;
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
// Procedimento para popular os componentes com os dados de um cadastro.
//
procedure TPlataformaERPVCLUsuarioSenha.FormularioPopular(argLicencaID    : Integer;
                                                          argUsuarioBaseID: Integer;
                                                          argUsuarioID    : Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
  ERRO_MENSAGEM    : string = 'Impossível consultar dados sobre a senha do usuário!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
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
  locADOQuery.SQL.Add('SELECT                                               ');
  locADOQuery.SQL.Add('  [usuario].[senha_exigir],                          ');
  locADOQuery.SQL.Add('  [usuario].[senha_trocar],                          ');
  locADOQuery.SQL.Add('  [usuario].[upd_contador]                           ');
  locADOQuery.SQL.Add('FROM                                                 ');
  locADOQuery.SQL.Add('  [usuario] WITH (NOLOCK)                            ');
  locADOQuery.SQL.Add('WHERE                                                ');
  locADOQuery.SQL.Add('  [usuario].[licenca_id]      = :licenca_id      AND ');
  locADOQuery.SQL.Add('  [usuario].[usuario_base_id] = :usuario_base_id AND ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id]      = :usuario_id          ');
                                                              
  locADOQuery.Parameters.ParamByName('licenca_id').Value      := argLicencaID;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value := argUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value      := argUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [usuario]!';
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
    //
    // Carrega componentes.
    //
    edtUpdContador.Text    := IntegerStringConverter(locADOQuery.FieldByName('upd_contador').AsInteger);
    chkSenhaExigir.Checked := StringBooleanConverter(locADOQuery.FieldByName('senha_exigir').AsString);
    VCLToggleSwitchLigar(tswSenhaTrocar, StringBooleanConverter(locADOQuery.FieldByName('senha_trocar').AsString));
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
// Procedimento para confirmar.
//
procedure TPlataformaERPVCLUsuarioSenha.FormularioConfirmar;
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
                     
  locSenhaExigir     : Boolean;
  locSenhaTrocar     : Boolean;
  locSenhaInformar   : Boolean;
  locSenha           : string;
  locSenhaConf       : string;
                     
  locUpdContador     : Integer;
                     
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
  locLicencaID        := pubLicencaID;
  locUsuarioBaseID    := pubUsuarioBaseID;
  locUsuarioID        := pubUsuarioID;

  locSenhaExigir      := chkSenhaExigir.Checked;
  locSenhaTrocar      := VCLToggleSwitchRecuperar(tswSenhaTrocar);
  locSenha            := edtSenha.Text;
  locSenhaConf        := edtSenhaConf.Text;
  locSenhaInformar    := chkSenhaInformar.Checked;

  locUpdContador      := StringIntegerConverter(edtUpdContador.Text);

  locHostName         := HostNameRecuperar;
  locUserName         := UserNameRecuperar;
  locLogUsuarioBaseID := gloBaseID;
  locLogUsuarioID     := gloUsuarioID;

  //
  // Consiste as informações.
  //
  if not locSenhaExigir then
  begin
    locSenhaTrocar := False;
    locSenha       := '';
    locSenhaConf   := '';
  end
  else
  begin
    if locSenhaInformar then
    begin
      //
      // A senha não pode ser em branco.
      //
      if (StringTrim(locSenha) = '') and (StringTrim(locSenhaConf) = '') then
      begin
        VCLConsistenciaExibir('Uma senha deve obrigatoriamente ser informada!');
        edtSenha.SetFocus;
        Exit;
      end;

      //
      // A digitação da confirmação da senha deve conferir.
      //
      if locSenha <> locSenhaConf then
      begin
        VCLConsistenciaExibir('A confirmação da senha não confere com a primeira digitação!');
        edtSenha.SetFocus;
        Exit;
      end;
    end
    else
    begin
      locSenha     := '';
      locSenhaConf := '';
    end;
  end;

  //
  // Confirma gravação com o usuário.
  //
  if not VCLQuestionamentoExibir('Deseja realmente atualizar estas configurações de senha do usuário?') then Exit;

  //
  // Log de dados.
  //
  locUsuarioLogDados := '';
  LogDadosBooleanDescrever('Exigir senha',        locSenhaExigir,   locUsuarioLogDados);
  LogDadosBooleanDescrever('Trocar senha',        locSenhaTrocar,   locUsuarioLogDados);
  LogDadosBooleanDescrever('Informar nova senha', locSenhaInformar, locUsuarioLogDados);
  LogDadosStringDescrever ('Senha',               locSenha,         locUsuarioLogDados);

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
  locUsuarioLogMsg := 'Configurações de senha atualizadas!';

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
  locADOQuery.SQL.Add('  [senha_exigir]     = :senha_exigir,     ');
  locADOQuery.SQL.Add('  [senha_trocar]     = :senha_trocar,     ');

  if locSenhaInformar then
  begin
    locADOQuery.SQL.Add('[senha] = :senha, ');
  end;
  
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
  locADOQuery.Parameters.ParamByName('senha_exigir').Value    := BooleanStringConverter(locSenhaExigir);
  locADOQuery.Parameters.ParamByName('senha_trocar').Value    := BooleanStringConverter(locSenhaTrocar);

  if locSenhaInformar then
  begin
    locADOQuery.Parameters.ParamByName('senha').Value  := locSenha;
  end;

  locADOQuery.Parameters.ParamByName('local_dt_hr').Value := Now;

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

  locUpdContador  := locADOQuery.FieldByName('upd_contador').AsInteger;
  
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
  edtUpdContador.Text := IntegerStringConverter(locUpdContador);

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
  VCLInformacaoExibir('Configurações de senha atualizadas com sucesso!');

  //
  // Retorna.
  //
  pubClicouFechar := False;
  Close;
end;

end.
