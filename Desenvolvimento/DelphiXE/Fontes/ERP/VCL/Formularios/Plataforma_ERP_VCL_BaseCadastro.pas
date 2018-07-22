//
// Arquivo..: Plataforma_ERP_VCL_BaseCadastro.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com o cadastro de bases de dados.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_BaseCadastro;

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
  TPlataformaERPVCLBaseCadastro = class(TForm)
    imgFormulario: TImage;
    pagFormulario: TPageControl;
    tabCadastro: TTabSheet;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    chkBloqueado: TCheckBox;
    chkAtivo: TCheckBox;
    tabAuditoria: TTabSheet;
    lblInsDtHt: TLabel;
    lblUpdDtHr: TLabel;
    lblUpdContador: TLabel;
    edtInsLocalDtHr: TEdit;
    edtUpdLocalDtHr: TEdit;
    edtUpdContador: TEdit;
    btnMinimizar: TBitBtn;
    btnFechar: TBitBtn;
    lblTipoUsuarioID: TLabel;
    edtBaseID: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioControlar(argEditar: Boolean);
    procedure FormularioPopular(argBaseID: Integer);
  public
    pubBaseID: Integer;
  end;

var
  PlataformaERPVCLBaseCadastro: TPlataformaERPVCLBaseCadastro;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_BaseCadastro.pas';

  TAB_CADASTRO : Byte = 0;
  TAB_AUDITORIA: Byte = 1;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLBaseCadastro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públias.
  //
  pubBaseID := 0;

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
procedure TPlataformaERPVCLBaseCadastro.FormShow(Sender: TObject);
begin
  if pubBaseID > 0 then
  begin
    FormularioPopular(pubBaseID);
  end;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLBaseCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLBaseCadastro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLBaseCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLBaseCadastro.FormularioLimpar;
begin
  VCLEditLimpar(edtBaseID);
  VCLEditLimpar(edtCodigo);
  VCLEditLimpar(edtDescricao);
  VCLCheckBoxLimpar(chkBloqueado);
  VCLCheckBoxLimpar(chkAtivo);

  VCLEditLimpar(edtInsLocalDtHr);
  VCLEditLimpar(edtUpdLocalDtHr);
  VCLEditLimpar(edtUpdContador);
end;

//
// Procedimento para controlar os componentes do formulário.
//
procedure TPlataformaERPVCLBaseCadastro.FormularioControlar(argEditar: Boolean);
begin
  //
  // Controla os componentes do formulário.
  //
  VCLEditControlar    (edtBaseID,    argEditar);
  VCLEditControlar    (edtCodigo,    argEditar);
  VCLEditControlar    (edtDescricao, argEditar);
  VCLCheckBoxControlar(chkBloqueado, argEditar);
  VCLCheckBoxControlar(chkAtivo,     argEditar);

  //
  // Controla os botões do formulário.
  //
  btnMinimizar.Visible := True;
  btnFechar.Visible    := (not argEditar);
end;

//
// Procedimento para popular os componentes com os dados de um cadastro.
//
procedure TPlataformaERPVCLBaseCadastro.FormularioPopular(argBaseID: Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
  ERRO_MENSAGEM    : string = 'Impossível consultar dados da base de dados da aplicação!';
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
  locADOQuery.SQL.Add('SELECT                        ');
  locADOQuery.SQL.Add('  [base].[base_id],           ');
  locADOQuery.SQL.Add('  [base].[codigo],            ');
  locADOQuery.SQL.Add('  [base].[descricao],         ');
  locADOQuery.SQL.Add('  [base].[bloqueado],         ');
  locADOQuery.SQL.Add('  [base].[ativo],             ');
  locADOQuery.SQL.Add('  [base].[ins_local_dt_hr],   ');
  locADOQuery.SQL.Add('  [base].[upd_local_dt_hr],   ');
  locADOQuery.SQL.Add('  [base].[upd_contador]       ');
  locADOQuery.SQL.Add('FROM                          ');
  locADOQuery.SQL.Add('  [base] WITH (NOLOCK)        ');
  locADOQuery.SQL.Add('WHERE                         ');
  locADOQuery.SQL.Add('  [base].[base_id] = :base_id ');

  locADOQuery.Parameters.ParamByName('base_id').Value := argBaseID;

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
    edtBaseID.Text       := locADOQuery.FieldByName('base_id').AsString;
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
end;

end.
