//
// Arquivo..: Plataforma_ERP_VCL_LicencaCadastro.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com o cadastro de licenças de uso da aplicação.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_LicencaCadastro;

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
  Vcl.Buttons,
  Vcl.ComCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TPlataformaERPVCLLicencaCadastro = class(TForm)
    imgFormulario: TImage;
    pagFormulario: TPageControl;
    tabCadastro: TTabSheet;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    lblLicencaID: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    chkBloqueado: TCheckBox;
    chkAtivo: TCheckBox;
    edtLicencaID: TEdit;
    tabAuditoria: TTabSheet;
    lblInsDtHt: TLabel;
    lblUpdDtHr: TLabel;
    lblUpdContador: TLabel;
    edtInsLocalDtHr: TEdit;
    edtUpdLocalDtHr: TEdit;
    edtUpdContador: TEdit;
    btnMinimizar: TBitBtn;
    btnFechar: TBitBtn;
    imgBackground: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtInsLocalDtHrClick(Sender: TObject);
    procedure edtUpdLocalDtHrClick(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioControlar(argEditar: Boolean);
    procedure FormularioPopular(argLicencaID: Integer);    
  public
    pubLicencaID: Integer;
  end;

var
  PlataformaERPVCLLicencaCadastro: TPlataformaERPVCLLicencaCadastro;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_LicencaCadastro.pas';

  TAB_CADASTRO : Byte = 0;
  TAB_AUDITORIA: Byte = 1;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLLicencaCadastro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públias.
  //
  pubLicencaID := 0;

  //
  // Limpa o formulário.
  //
  FormularioLimpar;

  //
  // Controla a edição dos componentes.
  //
  FormularioControlar(False);

  //
  // Seleciona a aba correta do pagecontrol.
  //
  pagFormulario.ActivePageIndex := TAB_CADASTRO;
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLLicencaCadastro.FormShow(Sender: TObject);
begin
  //
  // Background do formulário.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Popula formulário.
  //
  if pubLicencaID > 0 then
  begin
    FormularioPopular(pubLicencaID);
  end;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLLicencaCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click no componente "data e hora de criação".
//
procedure TPlataformaERPVCLLicencaCadastro.edtInsLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtInsLocalDtHr.Text));
end;

//
// Evento de click no componente "data e hora da última alteração".
//
procedure TPlataformaERPVCLLicencaCadastro.edtUpdLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtUpdLocalDtHr.Text));
end;

//
// Evento de click no botão "mininizar".
//
procedure TPlataformaERPVCLLicencaCadastro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLLicencaCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLLicencaCadastro.FormularioLimpar;
begin
  VCLEditLimpar(edtLicencaID);
  VCLEditLimpar(edtCodigo);
  VCLEditLimpar(edtDescricao);
  VCLCheckBoxLimpar(chkBloqueado);
  VCLCheckBoxLimpar(chkAtivo);

  VCLEditLimpar(edtInsLocalDtHr);
  VCLEditLimpar(edtUpdLocalDtHr);
  VCLEditLimpar(edtUpdContador);

  VCLEditClickControlar(edtInsLocalDtHr, False);
  VCLEditClickControlar(edtUpdLocalDtHr, False);
end;

//
// Procedimento para controlar os componentes do formulário.
//
procedure TPlataformaERPVCLLicencaCadastro.FormularioControlar(argEditar: Boolean);
begin
  //
  // Controla os componentes do formulário.
  //
  VCLEditControlar    (edtLicencaID, argEditar);
  VCLEditControlar    (edtCodigo,    argEditar);
  VCLEditControlar    (edtDescricao, argEditar);
  VCLCheckBoxControlar(chkBloqueado, argEditar);
  VCLCheckBoxControlar(chkAtivo,     argEditar);

  //
  // Controla os botões do formulário.
  //
  btnMinimizar.Visible := True;
  btnFechar.Visible    := (not argEditar);

  //
  // Controla a exibição dos cadastros.
  //
  VCLEditClickControlar(edtInsLocalDtHr, True);
  VCLEditClickControlar(edtUpdLocalDtHr, True);
end;

//
// Procedimento para popular os componentes com os dados de um cadastro.
//
procedure TPlataformaERPVCLLicencaCadastro.FormularioPopular(argLicencaID: Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
  ERRO_MENSAGEM    : string = 'Impossível consultar dados da licença de uso da aplicação!';
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
  // Consulta dados do tipo de usuário.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                 ');
  locADOQuery.SQL.Add('  [licenca].[licenca_id],              ');
  locADOQuery.SQL.Add('  [licenca].[codigo],                  ');
  locADOQuery.SQL.Add('  [licenca].[descricao],               ');
  locADOQuery.SQL.Add('  [licenca].[bloqueado],               ');
  locADOQuery.SQL.Add('  [licenca].[ativo],                   ');
  locADOQuery.SQL.Add('  [licenca].[ins_local_dt_hr],         ');
  locADOQuery.SQL.Add('  [licenca].[upd_local_dt_hr],         ');
  locADOQuery.SQL.Add('  [licenca].[upd_contador]             ');
  locADOQuery.SQL.Add('FROM                                   ');
  locADOQuery.SQL.Add('  [licenca] WITH (NOLOCK)              ');
  locADOQuery.SQL.Add('WHERE                                  ');
  locADOQuery.SQL.Add('  [licenca].[licenca_id] = :licenca_id ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value := argLicencaID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [base]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Registro encontrado então carrega componentes.
  //
  if locADOQuery.RecordCount >= 0 then
  begin
    edtLicencaID.Text    := locADOQuery.FieldByName('licenca_id').AsString;
    edtCodigo.Text       := locADOQuery.FieldByName('codigo').AsString;
    edtDescricao.Text    := locADOQuery.FieldByName('descricao').AsString;
    chkBloqueado.Checked := StringBooleanConverter(locADOQuery.FieldByName('bloqueado').AsString);
    chkAtivo.Checked     := StringBooleanConverter(locADOQuery.FieldByName('ativo').AsString);

    edtInsLocalDtHr.Text := DateTimeStringConverter(locADOQuery.FieldByName('ins_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn');
    edtUpdLocalDtHr.Text := DateTimeStringConverter(locADOQuery.FieldByName('upd_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn');
    edtUpdContador.Text  := IntegerStringConverter(locADOQuery.FieldByName('upd_contador').AsInteger);
  end;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);
  VCLCursorTrocar;

  //
  // Controla os componentes.
  //
  FormularioControlar(False);
end;

end.
