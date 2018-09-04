//
// Arquivo..: Plataforma_ERP_VCL_BaseConfiguracao.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 30/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com a configuração da base de dados.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_BaseConfiguracao;

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
  Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TPlataformaERPVCLBaseConfiguracao = class(TForm)
    imgFormulario: TImage;
    imgBackground: TImage;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnMinimizar: TBitBtn;
    btnAlterar: TBitBtn;
    btnFechar: TBitBtn;
    mnuFormulario: TMainMenu;
    mniAtualizar: TMenuItem;
    mniAlterar: TMenuItem;
    mniGravar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniCancelar: TMenuItem;
    mniFechar: TMenuItem;
    panFormulario: TPanel;
    lblBaseID: TLabel;
    edtBaseID: TEdit;
    lblInsDtHt: TLabel;
    lblUpdDtHr: TLabel;
    lblUpdContador: TLabel;
    edtInsLocalDtHr: TEdit;
    edtUpdLocalDtHr: TEdit;
    edtUpdContador: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mniAtualizarClick(Sender: TObject);
    procedure mniAlterarClick(Sender: TObject);
    procedure mniGravarClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
    procedure mniCancelarClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtBaseIDEnter(Sender: TObject);
    procedure edtBaseIDExit(Sender: TObject);
    procedure edtBaseIDKeyPress(Sender: TObject; var Key: Char);
  private
    procedure FormularioLimpar;
    procedure FormularioControlar(argEdicao: Boolean);
    procedure FormularioAtualizar;
    procedure FormularioAlterar;
    procedure FormularioGravar;
    procedure FormularioCancelar;
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLBaseConfiguracao: TPlataformaERPVCLBaseConfiguracao;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_BaseCadastro.pas';

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLBaseConfiguracao.FormShow(Sender: TObject);
begin
  //
  // Background do formulário.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Controlar os componentes do formulário.
  //
  FormularioControlar(False);

  //
  // Exibir dados.
  //
  FormularioAtualizar;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLBaseConfiguracao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click nos itens do menu.
//
procedure TPlataformaERPVCLBaseConfiguracao.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

procedure TPlataformaERPVCLBaseConfiguracao.mniAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

procedure TPlataformaERPVCLBaseConfiguracao.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

procedure TPlataformaERPVCLBaseConfiguracao.mniCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

procedure TPlataformaERPVCLBaseConfiguracao.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLBaseConfiguracao.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "ID da base".
//
procedure TPlataformaERPVCLBaseConfiguracao.edtBaseIDEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtBaseID) then Exit;
end;

procedure TPlataformaERPVCLBaseConfiguracao.edtBaseIDKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLBaseConfiguracao.edtBaseIDExit(Sender: TObject);
begin
  if not VCLEditSair(edtBaseID) then Exit;
end;

//
// Evento de click no botão "alterar".
//
procedure TPlataformaERPVCLBaseConfiguracao.btnAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

//
// Evento de click no botão "gravar".
//
procedure TPlataformaERPVCLBaseConfiguracao.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no botão "cancelar".
//
procedure TPlataformaERPVCLBaseConfiguracao.btnCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLBaseConfiguracao.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLBaseConfiguracao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar o formulário.
//
procedure TPlataformaERPVCLBaseConfiguracao.FormularioLimpar;
begin
  VCLEditLimpar(edtBaseID);
  VCLEditLimpar(edtInsLocalDtHr);
  VCLEditLimpar(edtUpdLocalDtHr);
  VCLEditLimpar(edtUpdContador);
end;

//
// Procedimento para controlar a edição dos componentes do formulário.
//
procedure TPlataformaERPVCLBaseConfiguracao.FormularioControlar(argEdicao: Boolean);
begin
  //
  // Componentes.
  //
  VCLEditControlar(edtBaseID, argEdicao);

  //
  // Itens do menu.
  //
  mniAtualizar.Visible := (not argEdicao);
  mniAlterar.Visible   := (not argEdicao);
  mniGravar.Visible    := argEdicao;
  mniMinimizar.Visible := True;
  mniCancelar.Visible  := argEdicao;
  mniFechar.Visible    := (not argEdicao);

  //
  // Botões.
  //
  btnAlterar.Visible   := mniAlterar.Visible;
  btnGravar.Visible    := mniGravar.Visible;
  btnCancelar.Visible  := mniCancelar.Visible;
  btnMinimizar.Visible := mniMinimizar.Visible;
  btnFechar.Visible    := mniFechar.Visible;
end;

//
// Procedimento para atualizar os componentes do formulário.
//
procedure TPlataformaERPVCLBaseConfiguracao.FormularioAtualizar;
const
  PROCEDIMENTO_NOME: string = 'FormularioAtualizar';
  ERRO_MENSAGEM    : string = 'Impossível consultar dados da configuração da base!';
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
  // Consulta dados da ação em registro.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                ');
  locADOQuery.SQL.Add('  [aplicacao_base].[base_id],         ');
  locADOQuery.SQL.Add('  [aplicacao_base].[ins_local_dt_hr], ');
  locADOQuery.SQL.Add('  [aplicacao_base].[upd_local_dt_hr], ');
  locADOQuery.SQL.Add('  [aplicacao_base].[upd_contador]     ');
  locADOQuery.SQL.Add('FROM                                  ');
  locADOQuery.SQL.Add('  [aplicacao_base] WITH (NOLOCK)      ');

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [aplicacao_base]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Registro encontrado.
  //
  if locADOQuery.RecordCount > 0 then
  begin
    //
    // Carrega componentes.
    //
    edtBaseID.Text := IntegerStringConverter(locADOQuery.FieldByName('base_id').AsInteger, True);
    edtInsLocalDtHr.Text   := DateTimeStringConverter(locADOQuery.FieldByName('ins_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn:ss');
    edtUpdLocalDtHr.Text   := DateTimeStringConverter(locADOQuery.FieldByName('upd_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn:ss');
    edtUpdContador.Text    := IntegerStringConverter(locADOQuery.FieldByName('upd_contador').AsInteger);
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
// Procedimento para altera os dados.
//
procedure TPlataformaERPVCLBaseConfiguracao.FormularioAlterar;
begin
  FormularioControlar(True);
  edtBaseID.SetFocus;
end;

//
// Procedimento para gravar os dados.
//
procedure TPlataformaERPVCLBaseConfiguracao.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioGravar';
  ERRO_MENSAGEM    : string = 'Impossível gravar dados da configuração da base!';
var
  locADOConnection       : TADOConnection;
  locADOQuery            : TADOQuery;
  locLogMensagem         : string;

  locRegistroAcao        : Byte;
  locRegistroAcaoLogMsg  : string;
  locRegistroAcaoLogDados: string;

  locInsert        : Boolean;
  locBaseID        : Integer;
  locUsuarioBaseID : Integer;
  locUsuarioID     : Integer;
  locUpdContador   : Integer;
  locHostName      : string;
  locUserName      : string;
begin
  //
  // Carrega variáveis com o conteúdo dos componentes.
  //
  locBaseID        := StringIntegerConverter(edtBaseID.Text);
  locUsuarioBaseID := gloUsuarioBaseID;
  locUsuarioID     := gloUsuarioID;
  locHostName      := HostNameRecuperar;
  locUserName      := UserNameRecuperar;
  locUpdContador   := StringIntegerConverter(edtUpdContador.Text);

  //
  // Confirma gravação com o usuário.
  //
  if not VCLQuestionamentoExibir('Deseja realmente gravar estes dados?') then Exit;

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
  // Determina se o registro de configuração da base já existe ou não.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                     ');
  locADOQuery.SQL.Add('  1                              ');
  locADOQuery.SQL.Add('FROM                             ');
  locADOQuery.SQL.Add('  [aplicacao_base] WITH (NOLOCK) ');

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para determinar se existe registro na tabela [aplicacao_base]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  if locADOQuery.RecordCount > 0 then
  begin
    locInsert := False;
  end
  else
  begin
    locInsert := True;
  end;

  //
  // Consiste o contador do update.
  //
  if not locInsert then
  begin
    locADOQuery.Close;
    locADOQuery.SQL.Clear;
    locADOQuery.SQL.Add('SELECT                            ');
    locADOQuery.SQL.Add('  [aplicacao_base].[upd_contador] ');
    locADOQuery.SQL.Add('FROM                              ');
    locADOQuery.SQL.Add('  [aplicacao_base] WITH (NOLOCK)  ');

    try
      locADOQuery.Open;
    except
      on locExcecao: Exception do
      begin
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualizações confere na tabela [aplicacao_base]!';
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
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE);
        Exit
      end;
    end;
  end;

  //
  // Determina o ID da ação e a mensagem para o log do registro.
  //
  if locInsert then
  begin
    locRegistroAcao       := REGISTRO_ACAO_CRIACAO;
    locRegistroAcaoLogMsg := MENSAGEM_REGISTRO_ACAO_CRIADO;
  end
  else
  begin
    locRegistroAcao       := REGISTRO_ACAO_ALTERACAO;
    locRegistroAcaoLogMsg := MENSAGEM_REGISTRO_ACAO_ALTERADO;
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
  // Grava dados na tabela base.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;

  if locInsert then
  begin
    //
    // Insere dados.
    //
    locADOQuery.SQL.Add('INSERT INTO [aplicacao_base] ( ');
    locADOQuery.SQL.Add('  [base_id],                   ');
    locADOQuery.SQL.Add('  [ins_local_dt_hr],           ');
    locADOQuery.SQL.Add('  [ins_server_dt_hr],          ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr],           ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr],          ');
    locADOQuery.SQL.Add('  [upd_contador]               ');
    locADOQuery.SQL.Add(')                              ');
    locADOQuery.SQL.Add('VALUES (                       ');
    locADOQuery.SQL.Add('  :base_id,                    '); // [base_id].
    locADOQuery.SQL.Add('  :local_dt_hr,                '); // [ins_local_dt_hr].
    locADOQuery.SQL.Add('  GETDATE(),                   '); // [ins_server_dt_hr].
    locADOQuery.SQL.Add('  NULL,                        '); // [upd_local_dt_hr].
    locADOQuery.SQL.Add('  NULL,                        '); // [upd_server_dt_hr].
    locADOQuery.SQL.Add('  0                            '); // [upd_contador].
    locADOQuery.SQL.Add(')                              ');
  end
  else
  begin
    //
    // Atualiza dados.
    //
    locADOQuery.SQL.Add('UPDATE                                    ');
    locADOQuery.SQL.Add('  [aplicacao_base]                        ');
    locADOQuery.SQL.Add('SET                                       ');
    locADOQuery.SQL.Add('  [base_id]          = :base_id,          ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr]  = :local_dt_hr,      ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr] = GETDATE(),         ');
    locADOQuery.SQL.Add('  [upd_contador]     = [upd_contador] + 1 ');
  end;

  //
  // Parâmetros.
  //
  locADOQuery.Parameters.ParamByName('base_id').Value     := locBaseID;
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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [base]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  //
  // Log dados.
  //
  locRegistroAcaoLogDados := '';
  LogDadosIntegerDescrever('ID base', locBaseID, locRegistroAcaoLogDados);

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
  // Componentes desligados para edição.
  //
  FormularioControlar(False);

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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, locBaseID, '', 'aplicacao_base', locRegistroAcaoLogMsg, locRegistroAcaoLogDados);
  except
    on locExcecao: Exception do
    begin
      VCLErroExibir(locExcecao.Message);
    end;
  end;

  //
  // Atualiza componentes.
  //
  FormularioAtualizar;

  //
  // Base gravada!
  //
  VCLInformacaoExibir('Base gravada com sucesso!');
end;

//
// Procedimento para cancelar a edição dos dados.
//
procedure TPlataformaERPVCLBaseConfiguracao.FormularioCancelar;
begin
  FormularioControlar(False);
  FormularioAtualizar;
end;

end.
