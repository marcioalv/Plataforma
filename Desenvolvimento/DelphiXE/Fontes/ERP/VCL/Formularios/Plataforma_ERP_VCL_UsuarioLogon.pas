//
// Arquivo..: Plataforma_ERP_VCL_UsuarioLogon.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário VCL com o logon do usuário à aplicação.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
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
  Plataforma_Framework_Criptografia,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_AcessoConexaoConfiguracao,
  Plataforma_ERP_VCL_AcessoConexaoSelecao;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_UsuarioLogon.pas';

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLUsuarioLogon.FormCreate(Sender: TObject);
begin
  //
  // Inicializa as variáveis privadas.
  //
  priTentativas := 0;
  
  //
  // Inicializa variáveis públicas.
  //
  pubClicouFechar := True;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLUsuarioLogon.FormShow(Sender: TObject);
begin
  FormularioLimpar;
  ConexaoDeterminar;

  edtUsuario.Text := 'marcio.alves';
  edtSenha.Text   := '123';
end;

//
// Evento de pressionamento de teclas no formulário.
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
end;

procedure TPlataformaERPVCLUsuarioLogon.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "usuário".
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
// Eventos de click nos botões.
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
// Evento de click no label de conexão.
//
procedure TPlataformaERPVCLUsuarioLogon.lblConexaoTituloClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLAcessoConexaoSelecao;
begin
  if lblConexaoItem.Caption = '' then
  begin
    mniConexaoBaseDadosClick(Sender);
  end
  else
  begin
    locFormulario := TPlataformaERPVCLAcessoConexaoSelecao.Create(Self);
    locFormulario.ShowModal;
    locFormulario.Release;
    FreeAndNil(locFormulario);
  end;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLUsuarioLogon.FormularioLimpar;
begin
   VCLEditLimpar(edtUsuario);
   VCLEditLimpar(edtSenha);
end;

//
// Procedimento para autenticar o usuário.
//
procedure TPlataformaERPVCLUsuarioLogon.FormularioConfirmar;
const
  PROCEDIMENTO_NOME: string = 'FormularioConfirmar';
  ERRO_MENSAGEM    : string = 'Impossível consultar dados do usuário!';
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
  // Carrega variáveis.
  //
  locLicencaID := gloLicencaID;
  locLogon     := StringTrim(edtUsuario.Text);
  locSenha     := StringTrim(edtSenha.Text);

  //
  // Consistências.
  //
  if locLogon = '' then
  begin
    VCLConsistenciaExibir('O logon do usuário deve ser informado!');
    edtUsuario.SetFocus;
    Exit;
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
  // Consulta dados do usuário.
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
  // O logon informado não existe.
  //
  if locADOQuery.RecordCount <= 0 then
  begin
    locADOQuery.Close;
    FreeAndNil(locADOQuery);
    locADOConnection.Close;
    FreeAndNil(locADOConnection);
    VCLConsistenciaExibir('O logon "' + locLogon + '" não existe no cadastro de usuários da aplicação!');
    TentativasAcessoValidar;
    edtUsuario.SetFocus;
    Exit;
  end;

  //
  // Se houver um único usuário localizado.
  //
  if locADOQuery.RecordCount = 1 then
  begin
    //
    // Se o usuário estiver inativo.
    //
    if not StringBooleanConverter(locADOQuery.FieldByName('ativo').AsString) then
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      VCLConsistenciaExibir('O usuário "' + locLogon + '" não está ativo!');
      TentativasAcessoValidar;
      edtUsuario.SetFocus;
      Exit;
    end;
  end
  else
  begin
    //
    // Se houver mais de um usuário determina quantos ativos.
    //
    locQtdeAtivo := 0;
    while not locADOQuery.EOF do
    begin
      if StringBooleanConverter(locADOQuery.FieldByName('Ativo').AsString) then Inc(locQtdeAtivo);
      locADOQuery.Next;
    end;

    //
    // Se não houver nenhum usuário ativo então cancela acesso.
    //
    if locQtdeAtivo <= 0 then
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      VCLConsistenciaExibir('O usuário "' + locLogon + '" está bloqueado!');
      TentativasAcessoValidar;
      edtUsuario.SetFocus;
      Exit;      
    end;

    //
    // Existe mais de usuário com o mesmo logon e ativo então cancela.
    //
    if locQtdeAtivo > 1 then
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      VCLConsistenciaExibir('Existem vários usuários ativos com o logon "' + locLogon + '" e portanto não é possível determinar sua identidade!');
      TentativasAcessoValidar;
      edtUsuario.SetFocus;
      Exit;      
    end;

    //
    // Existem vários usuários com o mesmo logon mas somente um ativo.
    // Localiza esse usuário novamente para continuar a autenticação.
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
  // Se o usuário estiver bloqueado.
  //
  if StringBooleanConverter(locADOQuery.FieldByName('bloqueado').AsString) then
  begin
    locADOQuery.Close;
    FreeAndNil(locADOQuery);
    locADOConnection.Close;
    FreeAndNil(locADOConnection);
    VCLConsistenciaExibir('O usuário "' + locLogon + '" está bloqueado!');
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
    VCLConsistenciaExibir('A senha informada não confere!');
    TentativasAcessoValidar;
    edtSenha.SetFocus;
    Exit;
  end;

  //
  // Autentica usuário.
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
    VCLConsistenciaExibir('Foram realizadas 3 tentativas de acesso fracassadas!', 'Por segurança o aplicativo será encerrado!');
    Close;
  end;
end;

//
// Procedimento para determinar a conexão à base de dados.
//
procedure TPlataformaERPVCLUsuarioLogon.ConexaoDeterminar;
var
  locConexaoQtde: Integer;
begin
  locConexaoQtde := 2;

  if locConexaoQtde <= 0 then
  begin
    lblConexaoItem.Caption := '';
  
    lblConexaoTitulo.Cursor     := crHandPoint;
    lblConexaoTitulo.Font.Color := RGB(218, 36, 44);
    lblConexaoTitulo.Font.Style := [fsUnderline];
    lblConexaoTitulo.Caption    := 'Nenhuma conexão de acesso à base de dados configurada!';

    edtUsuario.Visible   := False;
    edtSenha.Visible     := False;
    btnConfirmar.Visible := False;
  end;

  if locConexaoQtde = 1 then
  begin
    lblConexaoTitulo.Cursor     := crDefault;
    lblConexaoTitulo.Font.Color := RGB(46, 89, 137);
    lblConexaoTitulo.Font.Style := [];
    lblConexaoTitulo.Caption    := 'Bergerson Produção';

    edtUsuario.Visible   := True;
    edtSenha.Visible     := True;
    btnConfirmar.Visible := True;    
  end;

  if locConexaoQtde >= 2 then
  begin
    lblConexaoTitulo.Cursor     := crHandPoint;
    lblConexaoTitulo.Font.Color := RGB(46, 89, 137);
    lblConexaoTitulo.Font.Style := [fsUnderline];
    lblConexaoTitulo.Caption    := 'Bergerson Produção';

    edtUsuario.Visible   := True;
    edtSenha.Visible     := True;
    btnConfirmar.Visible := True;    
  end;  
end;

end.

