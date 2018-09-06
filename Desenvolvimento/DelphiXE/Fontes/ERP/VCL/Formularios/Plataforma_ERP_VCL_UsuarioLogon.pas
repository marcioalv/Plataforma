//
// Arquivo..: Plataforma_ERP_VCL_UsuarioLogon.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio VCL com o logon do usu�rio � aplica��o.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_UsuarioLogon;

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
  Vcl.Imaging.pngimage,
  Vcl.Buttons,
  Vcl.Menus;

type
  TPlataformaERPVCLUsuarioLogon = class(TForm)
    imgUsuario: TImage;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnFechar: TBitBtn;
    btnConfirmar: TBitBtn;
    imgSenha: TImage;
    imgFormulario: TImage;
    Image1: TImage;
    mnuFormulario: TMainMenu;
    mniConfiguracoes: TMenuItem;
    mniPrecisoAjuda: TMenuItem;
    mniAcessar: TMenuItem;
    mniFechar: TMenuItem;
    mniEsqueciSenha: TMenuItem;
    mniNaoSeiLogon: TMenuItem;
    mniConexaoBaseDados: TMenuItem;
    mniLicencaAplicacao: TMenuItem;
    lblConexaoTitulo: TLabel;
    lblConexaoItem: TLabel;
    chkMemorizar: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtUsuarioEnter(Sender: TObject);
    procedure edtUsuarioExit(Sender: TObject);
    procedure edtUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaEnter(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure mniAcessarClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure mniConexaoBaseDadosClick(Sender: TObject);
    procedure lblConexaoTituloClick(Sender: TObject);
  private
    priTentativas: Integer;
    procedure FormularioLimpar;
    procedure FormularioConfirmar;
    procedure TentativasAcessoValidar;
    procedure ConexaoDeterminar;
    procedure DadosConexaoPopular;
    procedure UltimoAcessoPopular;
    procedure UltimoAcessoGravar;
  public
    pubClicouFechar: Boolean;
  end;

var
  PlataformaERPVCLUsuarioLogon: TPlataformaERPVCLUsuarioLogon;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_Framework_ArquivoIni,
  Plataforma_Framework_Criptografia,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_AcessoConexaoConfiguracao,
  Plataforma_ERP_VCL_AcessoConexaoSelecao;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_UsuarioLogon.pas';

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLUsuarioLogon.FormCreate(Sender: TObject);
begin
  //
  // Inicializa as vari�veis privadas.
  //
  priTentativas := 0;
  
  //
  // Inicializa vari�veis p�blicas.
  //
  pubClicouFechar := True;
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLUsuarioLogon.FormShow(Sender: TObject);
begin
  FormularioLimpar;
  UltimoAcessoPopular;
  ConexaoDeterminar;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLUsuarioLogon.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nos itens do menu.
//
procedure TPlataformaERPVCLUsuarioLogon.mniAcessarClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

procedure TPlataformaERPVCLUsuarioLogon.mniConexaoBaseDadosClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLAcessoConexaoConfiguracao;
begin
  locFormulario := TPlataformaERPVCLAcessoConexaoConfiguracao.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);

  DadosConexaoPopular
end;

procedure TPlataformaERPVCLUsuarioLogon.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "usu�rio".
//
procedure TPlataformaERPVCLUsuarioLogon.edtUsuarioEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtUsuario) then Exit;
end;

procedure TPlataformaERPVCLUsuarioLogon.edtUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLUsuarioLogon.edtUsuarioExit(Sender: TObject);
begin
  if not VCLEditSair(edtUsuario) then Exit;
end;

//
// Eventos do componente "senha".
//
procedure TPlataformaERPVCLUsuarioLogon.edtSenhaEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtSenha) then Exit;
end;

procedure TPlataformaERPVCLUsuarioLogon.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLUsuarioLogon.edtSenhaExit(Sender: TObject);
begin
  if not VCLEditSair(edtSenha) then Exit;
end;

//
// Eventos de click nos bot�es.
//
procedure TPlataformaERPVCLUsuarioLogon.btnConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

procedure TPlataformaERPVCLUsuarioLogon.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Evento de click no label de conex�o.
//
procedure TPlataformaERPVCLUsuarioLogon.lblConexaoTituloClick(Sender: TObject);
var
  locFormulario : TPlataformaERPVCLAcessoConexaoSelecao;
  locClicouFechar: Boolean;
  locItem        : Integer;
begin
  if lblConexaoItem.Caption = '' then
  begin
    mniConexaoBaseDadosClick(Sender);
  end
  else
  begin
    locFormulario := TPlataformaERPVCLAcessoConexaoSelecao.Create(Self);
    locFormulario.ShowModal;

    locClicouFechar := locFormulario.pubClicouFechar;
    locItem         := locFormulario.pubItem;

    locFormulario.Release;
    FreeAndNil(locFormulario);

    if not locClicouFechar then
    begin
      lblConexaoItem.Caption := IntToStr(locItem);
      DadosConexaoPopular;
    end;
  end;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLUsuarioLogon.FormularioLimpar;
begin
   VCLEditLimpar(edtUsuario);
   VCLEditLimpar(edtSenha);
end;

//
// Procedimento para autenticar o usu�rio.
//
procedure TPlataformaERPVCLUsuarioLogon.FormularioConfirmar;
const
  PROCEDIMENTO_NOME: string = 'FormularioConfirmar';
  ERRO_MENSAGEM    : string = 'Imposs�vel consultar dados do usu�rio!';
var
  locADOConnection        : TADOConnection;
  locADOQuery             : TADOQuery;
  locCriptografia         : TCriptografia;
  locLogMensagem          : string;
  locLicencaID            : Integer;
  locLogon                : string;
  locSenha                : string;
  locQtdeAtivo            : Integer;
  locSenhaDescriptografada: string;
begin
  //
  // Carrega vari�veis.
  //
  locLicencaID := gloLicencaID;
  locLogon     := StringTrim(edtUsuario.Text);
  locSenha     := StringTrim(edtSenha.Text);

  //
  // Consist�ncias.
  //
  if locLogon = '' then
  begin
    VCLConsistenciaExibir('O logon do usu�rio deve ser informado!');
    edtUsuario.SetFocus;
    Exit;
  end;

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
  // Consulta dados do usu�rio.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                ');
  locADOQuery.SQL.Add('  [usuario].[licenca_id],                             ');
  locADOQuery.SQL.Add('  [base].[base_id]   AS [usuario_base_id],            ');
  locADOQuery.SQL.Add('  [base].[descricao] AS [usuario_base_descricao],     ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id],                             ');
  locADOQuery.SQL.Add('  [usuario].[codigo],                                 ');
  locADOQuery.SQL.Add('  [usuario].[nome],                                   ');
  locADOQuery.SQL.Add('  [usuario].[logon],                                  ');
  locADOQuery.SQL.Add('  [usuario].[senha_exigir],                           ');
  locADOQuery.SQL.Add('  [usuario].[senha_trocar],                           ');
  locADOQuery.SQL.Add('  [usuario].[senha],                                  ');
  locADOQuery.SQL.Add('  [usuario].[administrador],                          ');
  locADOQuery.SQL.Add('  [usuario].[bloqueado],                              ');
  locADOQuery.SQL.Add('  [usuario].[ativo]                                   ');
  locADOQuery.SQL.Add('FROM                                                  ');
  locADOQuery.SQL.Add('  [usuario] WITH (NOLOCK)                             ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                     ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [usuario].[usuario_base_id] ');
  locADOQuery.SQL.Add('WHERE                                                 ');
  locADOQuery.SQL.Add('  [usuario].[licenca_id] = :licenca_id AND            ');
  locADOQuery.SQL.Add('  [usuario].[logon]      = :logon                     ');
                                                              
  locADOQuery.Parameters.ParamByName('licenca_id').Value := locLicencaID;
  locADOQuery.Parameters.ParamByName('logon').Value      := locLogon;

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
  // Incrementa tentativa de acesso.
  //
  Inc(priTentativas);

  //
  // O logon informado n�o existe.
  //
  if locADOQuery.RecordCount <= 0 then
  begin
    locADOQuery.Close;
    FreeAndNil(locADOQuery);
    locADOConnection.Close;
    FreeAndNil(locADOConnection);
    VCLConsistenciaExibir('O logon "' + locLogon + '" n�o existe no cadastro de usu�rios da aplica��o!');
    TentativasAcessoValidar;
    edtUsuario.SetFocus;
    Exit;
  end;

  //
  // Se houver um �nico usu�rio localizado.
  //
  if locADOQuery.RecordCount = 1 then
  begin
    //
    // Se o usu�rio estiver inativo.
    //
    if not StringBooleanConverter(locADOQuery.FieldByName('ativo').AsString) then
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      VCLConsistenciaExibir('O usu�rio "' + locLogon + '" n�o est� ativo!');
      TentativasAcessoValidar;
      edtUsuario.SetFocus;
      Exit;
    end;
  end
  else
  begin
    //
    // Se houver mais de um usu�rio determina quantos ativos.
    //
    locQtdeAtivo := 0;
    while not locADOQuery.EOF do
    begin
      if StringBooleanConverter(locADOQuery.FieldByName('Ativo').AsString) then Inc(locQtdeAtivo);
      locADOQuery.Next;
    end;

    //
    // Se n�o houver nenhum usu�rio ativo ent�o cancela acesso.
    //
    if locQtdeAtivo <= 0 then
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      VCLConsistenciaExibir('O usu�rio "' + locLogon + '" est� bloqueado!');
      TentativasAcessoValidar;
      edtUsuario.SetFocus;
      Exit;      
    end;

    //
    // Existe mais de usu�rio com o mesmo logon e ativo ent�o cancela.
    //
    if locQtdeAtivo > 1 then
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      VCLConsistenciaExibir('Existem v�rios usu�rios ativos com o logon "' + locLogon + '" e portanto n�o � poss�vel determinar sua identidade!');
      TentativasAcessoValidar;
      edtUsuario.SetFocus;
      Exit;      
    end;

    //
    // Existem v�rios usu�rios com o mesmo logon mas somente um ativo.
    // Localiza esse usu�rio novamente para continuar a autentica��o.
    //
    locADOQuery.First;
    locADOQuery.Last;
    
    while not locADOQuery.EOF do
    begin
      if StringBooleanConverter(locADOQuery.FieldByName('Ativo').AsString) then break;
      locADOQuery.Next;
    end;
  end;

  //
  // Se o usu�rio estiver bloqueado.
  //
  if StringBooleanConverter(locADOQuery.FieldByName('bloqueado').AsString) then
  begin
    locADOQuery.Close;
    FreeAndNil(locADOQuery);
    locADOConnection.Close;
    FreeAndNil(locADOConnection);
    VCLConsistenciaExibir('O usu�rio "' + locLogon + '" est� bloqueado!');
    TentativasAcessoValidar;
    edtUsuario.SetFocus;
    Exit;    
  end;

  //
  // Descriptografa senha.
  //
  locCriptografia := TCriptografia.Create;
  locSenhaDescriptografada := locCriptografia.Descriptografar(locADOQuery.FieldByName('senha').AsString);
  FreeAndNil(locCriptografia);

  //
  // Confere as senhas.
  //
  if locSenha <> locSenhaDescriptografada then
  begin
    locADOQuery.Close;
    FreeAndNil(locADOQuery);
    locADOConnection.Close;
    FreeAndNil(locADOConnection);
    VCLConsistenciaExibir('A senha informada n�o confere!');
    TentativasAcessoValidar;
    edtSenha.SetFocus;
    Exit;
  end;

  //
  // Autentica usu�rio.
  //
  gloUsuarioBaseID        := locADOQuery.FieldByName('usuario_base_id').AsInteger;
  gloUsuarioID            := locADOQuery.FieldByName('usuario_id').AsInteger;
  gloUsuarioLogon         := locADOQuery.FieldByName('logon').AsString;
  gloUsuarioNome          := locADOQuery.FieldByName('nome').AsString;
  gloUsuarioAdministrador := StringBooleanConverter(locADOQuery.FieldByName('administrador').AsString);
  
  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);
  VCLCursorTrocar;

  //
  // Memoriza dados do �ltimo acesso.
  //
  UltimoAcessoGravar;

  //
  // Retorna.
  //
  pubClicouFechar := False;
  Close;
end;

//
// Procedimento para validar as tentativas de acesso.
//
procedure TPlataformaERPVCLUsuarioLogon.TentativasAcessoValidar;
begin
  if priTentativas >= 3 then
  begin
    VCLConsistenciaExibir('Foram realizadas 3 tentativas de acesso fracassadas!', 'Por seguran�a o aplicativo ser� encerrado!');
    Close;
  end;
end;

//
// Procedimento para determinar a conex�o � base de dados.
//
procedure TPlataformaERPVCLUsuarioLogon.ConexaoDeterminar;
const
  PROCEDIMENTO_NOME: string = 'ConexaoDeterminar';
  ERRO_MENSAGEM    : string = 'Imposs�vel consultar dados da conex�o � base de dados!';
var
  locLogMensagem: string;
  locConexaoQtde: Integer;
begin
  try
    locConexaoQtde := ArquivoIniIntegerRecuperar(gloConfiguracaoArquivo, ARQUIVO_INI_CONEXAO_GERAL, ARQUIVO_INI_CONEXAO_GERAL_QUANTIDADE);
  except
    on locExcecao: Exception do
    begin
      locLogMensagem := 'Imposs�vel ler informa��es sobre as conex�es de acesso configuradas no arquivo de inicializa��o!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  if locConexaoQtde <= 0 then
  begin
    lblConexaoItem.Caption := '';
  
    lblConexaoTitulo.Cursor     := crHandPoint;
    lblConexaoTitulo.Font.Color := RGB(218, 36, 44);
    lblConexaoTitulo.Font.Style := [fsUnderline];
    lblConexaoTitulo.Caption    := 'Nenhuma conex�o de acesso � base de dados configurada!';

    edtUsuario.Visible   := False;
    edtSenha.Visible     := False;
    btnConfirmar.Visible := False;
  end;

  if locConexaoQtde = 1 then
  begin
    lblConexaoTitulo.Cursor     := crDefault;
    lblConexaoTitulo.Font.Color := RGB(46, 89, 137);
    lblConexaoTitulo.Font.Style := [];

    edtUsuario.Visible   := True;
    edtSenha.Visible     := True;
    btnConfirmar.Visible := True;    
  end;

  if locConexaoQtde >= 2 then
  begin
    lblConexaoTitulo.Cursor     := crHandPoint;
    lblConexaoTitulo.Font.Color := RGB(46, 89, 137);
    lblConexaoTitulo.Font.Style := [fsUnderline];

    edtUsuario.Visible   := True;
    edtSenha.Visible     := True;
    btnConfirmar.Visible := True;    
  end;  
end;

//
// Procedimento para popular os daos da conex�o.
//
procedure TPlataformaERPVCLUsuarioLogon.DadosConexaoPopular;
const
  PROCEDIMENTO_NOME: string = 'DadosConexaoPopular';
  ERRO_MENSAGEM    : string = 'Imposs�vel consultar dados da conex�o � base de dados!';
var
  locLogMensagem : string;
  locSessao      : string;
  locCriptografia: TCriptografia;
begin
  locSessao := ARQUIVO_INI_CONEXAO_SESSAO + '_' + StringPreencher(lblConexaoItem.Caption, 4, '0');
  
  try
    lblConexaoTitulo.Caption := ArquivoIniStringRecuperar(gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_TITULO);

    gloConexaoTitulo     := ArquivoIniStringRecuperar (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_TITULO);
    gloConexaoServidor   := ArquivoIniStringRecuperar (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_SERVIDOR);
    gloConexaoPorta      := ArquivoIniIntegerRecuperar(gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_PORTA);
    gloConexaoInstancia  := ArquivoIniStringRecuperar (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_INSTANCIA);
    gloConexaoUsuario    := ArquivoIniStringRecuperar (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_USUARIO);
    gloConexaoSenha      := ArquivoIniStringRecuperar (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_SENHA);
    gloConexaoBancoDados := ArquivoIniStringRecuperar (gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_BANCO_DADOS);
    gloConexaoTimeOut    := ArquivoIniIntegerRecuperar(gloConfiguracaoArquivo, locSessao, ARQUIVO_INI_CONEXAO_PARAMETRO_TIME_OUT);

    locCriptografia := TCriptografia.Create;
    gloConexaoSenha := locCriptografia.Descriptografar(gloConexaoSenha);
    FreeAndNil(locCriptografia);

    gloConexaoADOString := ADOConnectionStringGerar(gloConexaoServidor, gloConexaoInstancia, gloConexaoPorta, gloConexaoUsuario, gloConexaoSenha, gloConexaoBancoDados);
  except
    on locExcecao: Exception do
    begin
      locLogMensagem := 'Imposs�vel ler informa��es sobre as conex�es de acesso configuradas no arquivo de inicializa��o!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;  
end;

//
// Procedimento para carregar as informa��es sobre o �ltimo acesso.
//
procedure TPlataformaERPVCLUsuarioLogon.UltimoAcessoPopular;
const
  PROCEDIMENTO_NOME: string = 'UltimoAcessoPopular';
  ERRO_MENSAGEM    : string = 'Imposs�vel popular dados sobre o �ltimo acesso!';
var
  locLogMensagem: string;
begin
  //
  // Troca o cursor.
  //
  VCLCursorTrocar(True);

  //
  // Limpa componentes.
  //
  FormularioLimpar;

  //
  // Verifica se o arquivo de configura��o existe na pasta adequada.
  //
  if not FileExists(gloConfiguracaoArquivo) then
  begin
    VCLCursorTrocar;
    Exit;
  end;

  //
  // Par�metros de �ltima conex�o.
  //
  try
    edtUsuario.Text        := ArquivoIniStringRecuperar (gloConfiguracaoArquivo, ARQUIVO_INI_ULTIMO_ACESSO_SESSAO, ARQUIVO_INI_ULTIMO_ACESSO_USUARIO);
    chkMemorizar.Checked   := ArquivoIniBooleanRecuperar(gloConfiguracaoArquivo, ARQUIVO_INI_ULTIMO_ACESSO_SESSAO, ARQUIVO_INI_ULTIMO_ACESSO_MEMORIZAR);
    lblConexaoItem.Caption := ArquivoIniStringRecuperar (gloConfiguracaoArquivo, ARQUIVO_INI_ULTIMO_ACESSO_SESSAO, ARQUIVO_INI_ULTIMO_ACESSO_CONEXAO_ITEM);
  except
    on locExcecao: Exception do
    begin
      locLogMensagem := 'Problemas ao ler a memoriza��o do �ltimo acesso!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Dados da conex�o.
  //
  DadosConexaoPopular;

  //
  // Troca o cursor.
  //
  VCLCursorTrocar;

  //
  // Foco no componente correto.
  //
  if edtUsuario.Text <> '' then edtSenha.SetFocus;
end;

//
// Procedimento para gravar os dados do �ltimo acesso.
//
procedure TPlataformaERPVCLUsuarioLogon.UltimoAcessoGravar;
const
  PROCEDIMENTO_NOME: string = 'UltimoAcessoGravar';
  ERRO_MENSAGEM    : string = 'Imposs�vel gravar dados sobre o �ltimo acesso!';
var
  locLogMensagem: string;
begin
  //
  // O �ltimo acesso deve ser gravado?
  //
  if not chkMemorizar.Checked then Exit;

  //
  // Grava cada uma das conex�es da lista.
  //
  try
    ArquivoIniStringGravar (gloConfiguracaoArquivo, ARQUIVO_INI_ULTIMO_ACESSO_SESSAO, ARQUIVO_INI_ULTIMO_ACESSO_USUARIO,      edtUsuario.Text);
    ArquivoIniBooleanGravar(gloConfiguracaoArquivo, ARQUIVO_INI_ULTIMO_ACESSO_SESSAO, ARQUIVO_INI_ULTIMO_ACESSO_MEMORIZAR,    chkMemorizar.Checked);
    ArquivoIniStringGravar (gloConfiguracaoArquivo, ARQUIVO_INI_ULTIMO_ACESSO_SESSAO, ARQUIVO_INI_ULTIMO_ACESSO_CONEXAO_ITEM, lblConexaoItem.Caption);
  except
    on locExcecao: Exception do
    begin
      locLogMensagem := 'Ocorreu algum problema ao gravar a memoriza��o dos dados do �ltimo acesso!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;
end;

end.

