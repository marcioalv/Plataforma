//
// Arquivo..: Plataforma_ERP_VCL_FilialEndereco.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 27/Novembro/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com o cadastro de endere�o da filial.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_FilialEndereco;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.Win.ADODB, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_FilialEndereco.pas';

type
  TPlataformaERPVCLFilialEndereco = class(TForm)
    imgBackground: TImage;
    imgFormulario: TImage;
    btnMinimizar: TBitBtn;
    btnFechar: TBitBtn;
    mnuFormulario: TMainMenu;
    mniAdicional: TMenuItem;
    mniLog: TMenuItem;
    mniCadastroRegimeTributario: TMenuItem;
    mniAtualizar: TMenuItem;
    mniNovo: TMenuItem;
    mniAlterar: TMenuItem;
    mniExcluir: TMenuItem;
    mniGravar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniCancelar: TMenuItem;
    mniFechar: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure FormularioLimpar;

    procedure FormularioPopular(argLicencaID   : Integer;
                                argFilialBaseID: Integer;
                                argFilialID    : Integer);

    procedure FormularioGravar;
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLFilialEndereco: TPlataformaERPVCLFilialEndereco;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLFilialEndereco.FormCreate(Sender: TObject);
begin
  Exit;
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLFilialEndereco.FormShow(Sender: TObject);
begin
  //
  // Background do formul�rio.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Limpa o formul�rio.
  //
  FormularioLimpar;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioLimpar;
begin
  Exit;
end;

//
// Procedimento para popular os componentes com os dados de um cadastro.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioPopular(argLicencaID   : Integer;
                                                            argFilialBaseID: Integer;
                                                            argFilialID    : Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
  ERRO_MENSAGEM    : string = 'Imposs�vel consultar dados do endere�o da filial!';
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
  // Limpa os componentes do formul�rio.
  //
  FormularioLimpar;

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
  // Consulta dados da filial.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                             ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_endereco_seq]                                          ');
  locADOQuery.SQL.Add('FROM                                                                               ');
  locADOQuery.SQL.Add('  [filial_endereco] WITH (NOLOCK)                                                  ');
  locADOQuery.SQL.Add('WHERE                                                                              ');
  locADOQuery.SQL.Add('  [filial_endereco].[licenca_id]     = :licenca_id     AND                         ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_base_id] = :filial_base_id AND                         ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_id]      = :filial_id                                  ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value     := argLicencaID;
  locADOQuery.Parameters.ParamByName('filial_base_id').Value := argFilialBaseID;
  locADOQuery.Parameters.ParamByName('filial_id').Value      := argFilialID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [filial_endereco]!';
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
// Procedimento para gravar os dados do formul�rio.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioGravar';
  ERRO_MENSAGEM    : string = 'Imposs�vel gravar dados do endere�o da filial!';
var
  locADOConnection     : TADOConnection;
  locADOQuery          : TADOQuery;
  locLogMensagem       : string;

  locInsert                : Boolean;
  locRegistroAcao          : Byte;
  locRegistroAcaoID        : Integer;
  locFilialEnderecoLogSq   : Integer;
  locFilialEnderecoLogMsg  : string;
  locFilialEnderecoLogDados: string;

  locLicencaID             : Integer;
  locFilialBaseID          : Integer;
  locFilialID              : Integer;

  locInsLocalDtHr          : TDateTime;
  locUpdLocalDtHr          : TDateTime;
  locUsuarioBaseID         : Integer;
  locUsuarioID             : Integer;
  locUpdContador           : Integer;
  locHostName              : string;
  locUserName              : string;
begin
  //
  // Determina se ser� um insert ou update.
  //
  locInsert := True;

{
  //
  // Carrega vari�veis com o conte�do dos componentes.
  //
  locLicencaID          := StringIntegerConverter(edtLicencaID.Text);
  locFilialBaseID       := StringIntegerConverter(edtFilialBaseID.Text);
  locFilialID           := StringIntegerConverter(edtFilialID.Text);

  locUsuarioBaseID      := gloUsuarioBaseID;
  locUsuarioID          := gloUsuarioID;
  locHostName           := HostNameRecuperar;
  locUserName           := UserNameRecuperar;
  locUpdContador        := StringIntegerConverter(edtUpdContador.Text);

  //
  // Consiste as informa��es.
  //
  if locCodigo = '' then
  begin
    VCLConsistenciaExibir('O c�digo da filial deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
    Exit;
  end;

  if locDescricao = '' then
  begin
    VCLConsistenciaExibir('A descri��o da filial deve ser informada!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtDescricao);
    Exit;
  end;

  if locRazaoSocial = '' then
  begin
    VCLConsistenciaExibir('A raz�o social da filial deve ser informada!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtRazaoSocial);
    Exit;
  end;

  if locFantasia = '' then
  begin
    VCLConsistenciaExibir('O nome de fantasia da filial deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtFantasia);
    Exit;
  end;

  if locCPF_CNPJ = '' then
  begin
    VCLConsistenciaExibir('O CPF/CNPJ da filial deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCPF_CNPJ);
    Exit;
  end;

  if locEmpresaID <= 0 then
  begin
    VCLConsistenciaExibir('A empresa da filial deve ser selecionada!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtRegimeTributarioCodigo); // ARRUMAR!!! AQUI!!!
    Exit;
  end;

  if locRegimeTributarioID <= 0 then
  begin
    VCLConsistenciaExibir('O regime tribut�rio da filial deve ser selecionado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtRegimeTributarioCodigo);
    Exit;
  end;

  //
  // Confirma grava��o com o usu�rio.
  //
  if not VCLQuestionamentoExibir('Deseja realmente gravar estes dados?') then Exit;

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
  // Determina se o c�digo da filial j� existe no banco de dados para um outro registro.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                                      ');
  locADOQuery.SQL.Add('  1                                               ');
  locADOQuery.SQL.Add('FROM                                              ');
  locADOQuery.SQL.Add('  [filial] WITH (NOLOCK)                          ');
  locADOQuery.SQL.Add('WHERE                                             ');
  locADOQuery.SQL.Add('  [filial].[licenca_id]     = :licenca_id     AND ');
  locADOQuery.SQL.Add('  [filial].[filial_base_id] = :filial_base_id AND ');
  locADOQuery.SQL.Add('  [filial].[codigo]         = :codigo         AND ');
  locADOQuery.SQL.Add('  [filial].[filial_id]     <> :filial_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value     := locLicencaID;
  locADOQuery.Parameters.ParamByName('filial_base_id').Value := locFilialBaseID;
  locADOQuery.Parameters.ParamByName('codigo').Value         := locCodigo;
  locADOQuery.Parameters.ParamByName('filial_id').Value      := locFilialID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar o mesmo c�digo da filial em um outro registro!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  if locADOQuery.RecordCount > 0 then
  begin
    locADOQuery.Close;
    FreeAndNil(locADOQuery);
    locADOConnection.Close;
    FreeAndNil(locADOConnection);
    locLogMensagem := 'O c�digo "' + locCodigo + '" informado para a filial j� existe em algum outro cadastro!';
    Plataforma_ERP_Logar(False, ERRO_MENSAGEM, locLogMensagem, FONTE_NOME, PROCEDIMENTO_NOME);
    VCLConsistenciaExibir(ERRO_MENSAGEM, locLogMensagem);
    Exit;
  end;

  //
  // Consiste o contador do update.
  //
  if not locInsert then
  begin
    locADOQuery.Close;
    locADOQuery.SQL.Clear;
    locADOQuery.SQL.Add('SELECT                                            ');
    locADOQuery.SQL.Add('  [filial].[upd_contador]                         ');
    locADOQuery.SQL.Add('FROM                                              ');
    locADOQuery.SQL.Add('  [filial] WITH (NOLOCK)                          ');
    locADOQuery.SQL.Add('WHERE                                             ');
    locADOQuery.SQL.Add('  [filial].[licenca_id]     = :licenca_id     AND ');
    locADOQuery.SQL.Add('  [filial].[filial_base_id] = :filial_base_id AND ');
    locADOQuery.SQL.Add('  [filial].[filial_id]      = :filial_id          ');

    locADOQuery.Parameters.ParamByName('licenca_id').Value     := locLicencaID;
    locADOQuery.Parameters.ParamByName('filial_base_id').Value := locFilialBaseID;
    locADOQuery.Parameters.ParamByName('filial_id').Value      := locFilialID;

    try
      locADOQuery.Open;
    except
      on locExcecao: Exception do
      begin
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualiza��es confere na tabela [filial]!';
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
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE);
        Exit
      end;
    end;
  end;

  //
  // Determina o ID da a��o e a mensagem para o log do registro.
  //
  if locInsert then
  begin
    locRegistroAcao := REGISTRO_ACAO_CRIACAO;
    locFilialLogMsg := MENSAGEM_REGISTRO_ACAO_CRIADO;
  end
  else
  begin
    locRegistroAcao := REGISTRO_ACAO_ALTERACAO;
    locFilialLogMsg := MENSAGEM_REGISTRO_ACAO_ALTERADO;
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
  // Determina o pr�ximo ID da filial.
  //
  if locInsert then
  begin
    try
      locFilialID := Plataforma_ERP_ADO_NumeradorLicencaDeterminar(locADOConnection,
                                                                  locLicencaID,
                                                                  locFilialBaseID,
                                                                  NUMERADOR_FILIAL_ID,
                                                                  locUsuarioBaseID,
                                                                  locUsuarioID);
    except
      on locExcecao: Exception do
      begin
        locADOConnection.RollbackTrans;
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Imposs�vel determinar o pr�ximo numerador para a filial!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
        Exit
      end;
    end;
  end;

  //
  // Grava dados na tabela filial.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;

  if locInsert then
  begin
    //
    // Insere dados.
    //
    locADOQuery.SQL.Add('INSERT INTO [filial] (    ');
    locADOQuery.SQL.Add('  [licenca_id],           ');
    locADOQuery.SQL.Add('  [filial_base_id],       ');
    locADOQuery.SQL.Add('  [filial_id],            ');
    locADOQuery.SQL.Add('  [codigo],               ');
    locADOQuery.SQL.Add('  [descricao],            ');
    locADOQuery.SQL.Add('  [razao_social],         ');
    locADOQuery.SQL.Add('  [fantasia],             ');
    locADOQuery.SQL.Add('  [cpf_cnpj],             ');
    locADOQuery.SQL.Add('  [empresa_base_id],      ');
    locADOQuery.SQL.Add('  [empresa_id],           ');
    locADOQuery.SQL.Add('  [regime_tributario_id], ');
    locADOQuery.SQL.Add('  [bloqueado],            ');
    locADOQuery.SQL.Add('  [ativo],                ');
    locADOQuery.SQL.Add('  [ins_local_dt_hr],      ');
    locADOQuery.SQL.Add('  [ins_server_dt_hr],     ');
    locADOQuery.SQL.Add('  [ins_usuario_base_id],  ');
    locADOQuery.SQL.Add('  [ins_usuario_id],       ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr],      ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr],     ');
    locADOQuery.SQL.Add('  [upd_usuario_base_id],  ');
    locADOQuery.SQL.Add('  [upd_usuario_id],       ');
    locADOQuery.SQL.Add('  [upd_contador]          ');
    locADOQuery.SQL.Add(')                         ');
    locADOQuery.SQL.Add('VALUES (                  ');
    locADOQuery.SQL.Add('  :licenca_id,            '); // [licenca_id].
    locADOQuery.SQL.Add('  :filial_base_id,        '); // [filial_base_id].
    locADOQuery.SQL.Add('  :filial_id,             '); // [filial_id].
    locADOQuery.SQL.Add('  :codigo,                '); // [codigo].
    locADOQuery.SQL.Add('  :descricao,             '); // [descricao].
    locADOQuery.SQL.Add('  :razao_social,          '); // [razao_social].
    locADOQuery.SQL.Add('  :fantasia,              '); // [fantasia].
    locADOQuery.SQL.Add('  :cpf_cnpj,              '); // [cpf_cnpj].
    locADOQuery.SQL.Add('  :empresa_base_id,       '); // [empresa_base_id].
    locADOQuery.SQL.Add('  :empresa_id,            '); // [empresa_id].
    locADOQuery.SQL.Add('  :regime_tributario_id,  '); // [regime_tributario_id].
    locADOQuery.SQL.Add('  :bloqueado,             '); // [bloqueado].
    locADOQuery.SQL.Add('  :ativo,                 '); // [ativo].
    locADOQuery.SQL.Add('  :local_dt_hr,           '); // [ins_local_dt_hr].
    locADOQuery.SQL.Add('  GETDATE(),              '); // [ins_server_dt_hr].
    locADOQuery.SQL.Add('  :usuario_base_id,       '); // [ins_usuario_base_id].
    locADOQuery.SQL.Add('  :usuario_id,            '); // [ins_usuario_id].
    locADOQuery.SQL.Add('  NULL,                   '); // [upd_local_dt_hr].
    locADOQuery.SQL.Add('  NULL,                   '); // [upd_server_dt_hr].
    locADOQuery.SQL.Add('  NULL,                   '); // [upd_usuario_base_id].
    locADOQuery.SQL.Add('  NULL,                   '); // [upd_usuario_id].
    locADOQuery.SQL.Add('  0                       '); // [upd_contador].
    locADOQuery.SQL.Add(')                         ');
  end
  else
  begin
    //
    // Atualiza dados.
    //
    locADOQuery.SQL.Add('UPDATE                                            ');
    locADOQuery.SQL.Add('  [filial]                                        ');
    locADOQuery.SQL.Add('SET                                               ');
    locADOQuery.SQL.Add('  [codigo]               = :codigo,               ');
    locADOQuery.SQL.Add('  [descricao]            = :descricao,            ');
    locADOQuery.SQL.Add('  [razao_social]         = :razao_social,         ');
    locADOQuery.SQL.Add('  [fantasia]             = :fantasia,             ');
    locADOQuery.SQL.Add('  [cpf_cnpj]             = :cpf_cnpj,             ');
    locADOQuery.SQL.Add('  [empresa_base_id]      = :empresa_base_id,      ');
    locADOQuery.SQL.Add('  [empresa_id]           = :empresa_id,           ');
    locADOQuery.SQL.Add('  [regime_tributario_id] = :regime_tributario_id, ');
    locADOQuery.SQL.Add('  [bloqueado]            = :bloqueado,            ');
    locADOQuery.SQL.Add('  [ativo]                = :ativo,                ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr]      = :local_dt_hr,          ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr]     = GETDATE(),             ');
    locADOQuery.SQL.Add('  [upd_usuario_base_id]  = :usuario_base_id,      ');
    locADOQuery.SQL.Add('  [upd_usuario_id]       = :usuario_id,           ');
    locADOQuery.SQL.Add('  [upd_contador]         = [upd_contador] + 1     ');
    locADOQuery.SQL.Add('WHERE                                             ');
    locADOQuery.SQL.Add('  [licenca_id]     = :licenca_id     AND          ');
    locADOQuery.SQL.Add('  [filial_base_id] = :filial_base_id AND          ');
    locADOQuery.SQL.Add('  [filial_id]      = :filial_id                   ');
  end;

  //
  // Par�metros.
  //
  locADOQuery.Parameters.ParamByName('licenca_id').Value           := locLicencaID;
  locADOQuery.Parameters.ParamByName('filial_base_id').Value       := locFilialBaseID;
  locADOQuery.Parameters.ParamByName('filial_id').Value            := locFilialID;
  locADOQuery.Parameters.ParamByName('codigo').Value               := locCodigo;
  locADOQuery.Parameters.ParamByName('descricao').Value            := locDescricao;
  locADOQuery.Parameters.ParamByName('razao_social').Value         := locRazaoSocial;
  locADOQuery.Parameters.ParamByName('fantasia').Value             := locFantasia;
  locADOQuery.Parameters.ParamByName('cpf_cnpj').Value             := locCPF_CNPJ;
  locADOQuery.Parameters.ParamByName('empresa_base_id').Value      := locEmpresaBaseID;
  locADOQuery.Parameters.ParamByName('empresa_id').Value           := locEmpresaID;
  locADOQuery.Parameters.ParamByName('regime_tributario_id').Value := locRegimeTributarioID;
  locADOQuery.Parameters.ParamByName('bloqueado').Value            := BooleanStringConverter(locBloqueado);
  locADOQuery.Parameters.ParamByName('ativo').Value                := BooleanStringConverter(locAtivo);
  locADOQuery.Parameters.ParamByName('local_dt_hr').Value          := Now;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value      := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value           := locUsuarioID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [filial]!';
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
  locADOQuery.SQL.Add('SELECT                                            ');
  locADOQuery.SQL.Add('  [filial].[ins_local_dt_hr],                     ');
  locADOQuery.SQL.Add('  [filial].[upd_local_dt_hr],                     ');
  locADOQuery.SQL.Add('  [filial].[upd_contador]                         ');
  locADOQuery.SQL.Add('FROM                                              ');
  locADOQuery.SQL.Add('  [filial]                                        ');
  locADOQuery.SQL.Add('WHERE                                             ');
  locADOQuery.SQL.Add('  [filial].[licenca_id]     = :licenca_id     AND ');
  locADOQuery.SQL.Add('  [filial].[filial_base_id] = :filial_base_id AND ');
  locADOQuery.SQL.Add('  [filial].[filial_id]      = :filial_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value     := locLicencaID;
  locADOQuery.Parameters.ParamByName('filial_base_id').Value := locFilialBaseID;
  locADOQuery.Parameters.ParamByName('filial_id').Value      := locFilialID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o novo contador de updates do registro na tabela [filial]!';
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
  locFilialLogDados := LogDadosGerar(locFilialID);

  //
  // Determina o pr�ximo sequencial da tabela filial_log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                ');
  locADOQuery.SQL.Add('  MAX([filial_log].[filial_log_sq]) AS [sequencial]   ');
  locADOQuery.SQL.Add('FROM                                                  ');
  locADOQuery.SQL.Add('  [filial_log]                                        ');
  locADOQuery.SQL.Add('WHERE                                                 ');
  locADOQuery.SQL.Add('  [filial_log].[licenca_id]     = :licenca_id     AND ');
  locADOQuery.SQL.Add('  [filial_log].[filial_base_id] = :filial_base_id AND ');
  locADOQuery.SQL.Add('  [filial_log].[filial_id]      = :filial_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value     := locLicencaID;
  locADOQuery.Parameters.ParamByName('filial_base_id').Value := locFilialBaseID;
  locADOQuery.Parameters.ParamByName('filial_id').Value      := locFilialID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o pr�ximo sequencial para o registro na tabela [filial_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  if locADOQuery.RecordCount <= 0 then
  begin
    locFilialLogSq := 1;
  end
  else
  begin
    locFilialLogSq := locADOQuery.FieldByName('sequencial').AsInteger + 1;
  end;

  //
  // Monta SQL para inserir dados na tabela de log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('INSERT INTO [filial_log] ( ');
  locADOQuery.SQL.Add('  [licenca_id],            ');
  locADOQuery.SQL.Add('  [filial_base_id],        ');
  locADOQuery.SQL.Add('  [filial_id],             ');
  locADOQuery.SQL.Add('  [filial_log_sq],         ');
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
  locADOQuery.SQL.Add('  :filial_base_id,         '); // [filial_base_id].
  locADOQuery.SQL.Add('  :filial_id,              '); // [filial_id].
  locADOQuery.SQL.Add('  :filial_log_sq,          '); // [filial_log_sq].
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
  locADOQuery.Parameters.ParamByName('filial_base_id').Value      := locFilialBaseID;
  locADOQuery.Parameters.ParamByName('filial_id').Value           := locFilialID;
  locADOQuery.Parameters.ParamByName('filial_log_sq').Value       := locFilialLogSq;
  locADOQuery.Parameters.ParamByName('log_base_id').Value         := gloBaseID;
  locADOQuery.Parameters.ParamByName('log_local_dt_hr').Value     := Now;
  locADOQuery.Parameters.ParamByName('registro_acao_id').Value    := locRegistroAcaoID;
  locADOQuery.Parameters.ParamByName('host_name').Value           := locHostName;
  locADOQuery.Parameters.ParamByName('user_name').Value           := locUserName;
  locADOQuery.Parameters.ParamByName('log_usuario_base_id').Value := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('log_usuario_id').Value      := locUsuarioID;
  locADOQuery.Parameters.ParamByName('mensagem').Value            := locFilialLogMsg;
  locADOQuery.Parameters.ParamByName('dados').Value               := locFilialLogDados;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir/atualizar o registro na tabela [filial_log]!';
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
  edtFilialID.Text     := IntegerStringConverter(locFilialID);
  edtInsLocalDtHr.Text := DateTimeStringConverter(locInsLocalDtHr, 'dd/mm/yyyy hh:nn');
  edtUpdLocalDtHr.Text := DateTimeStringConverter(locUpdLocalDtHr, 'dd/mm/yyyy hh:nn');
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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, locFilialID, locCodigo, 'filial', locFilialLogMsg, locFilialLogDados);
  except
    on locExcecao: Exception do
    begin
      VCLErroExibir(locExcecao.Message);
    end;
  end;
}

  //
  // Filial gravada!
  //
  VCLInformacaoExibir('Endere�o da fFilial gravado com sucesso!');
end;

end.
