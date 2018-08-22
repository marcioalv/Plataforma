//
// Arquivo..: Plataforma_ERP_VCL_RegistroAcaoCadastro.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 17/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com o cadastro de a��es com registros.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_RegistroAcaoCadastro;

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
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls,
  Vcl.Menus;

type
  TPlataformaERPVCLRegistroAcaoCadastro = class(TForm)
    imgFormulario: TImage;
    pagFormulario: TPageControl;
    tabCadastro: TTabSheet;
    tabAuditoria: TTabSheet;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    lblDescricao: TLabel;
    edtDescricao: TEdit;
    lblInsDtHt: TLabel;
    edtInsLocalDtHr: TEdit;
    lblUpdDtHr: TLabel;
    edtUpdLocalDtHr: TEdit;
    lblUpdContador: TLabel;
    edtUpdContador: TEdit;
    btnGravar: TBitBtn;
    btnMinimizar: TBitBtn;
    btnFechar: TBitBtn;
    btnCancelar: TBitBtn;
    btnAlterar: TBitBtn;
    btnNovo: TBitBtn;
    lblRegistroAcaoID: TLabel;
    edtRegistroAcaoID: TEdit;
    imgBackground: TImage;
    mnuFormulario: TMainMenu;
    mniFechar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniAlterar: TMenuItem;
    mniExcluir: TMenuItem;
    mniNovo: TMenuItem;
    mniAtualizar: TMenuItem;
    mniCancelar: TMenuItem;
    mniGravar: TMenuItem;
    gbxOpcoes: TGroupBox;
    chkBloqueado: TCheckBox;
    chkAtivo: TCheckBox;
    lblRegistroAcaoBase: TLabel;
    edtRegistroAcaoBaseDescricao: TEdit;
    edtRegistroAcaoBaseID: TEdit;
    lblCodigoCadastrado: TLabel;
    edtCodigoCadastrado: TEdit;
    edtCodigoCadastradoID: TEdit;
    edtCodigoCadastradoBaseID: TEdit;
    gbxTipoAcao: TGroupBox;
    rbtAcaoCriacao: TRadioButton;
    rbtAcaoConsulta: TRadioButton;
    rbtAcaoAlteracao: TRadioButton;
    rbtAcaoExclusao: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescricaoEnter(Sender: TObject);
    procedure edtDescricaoExit(Sender: TObject);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure chkBloqueadoEnter(Sender: TObject);
    procedure chkBloqueadoExit(Sender: TObject);
    procedure chkBloqueadoKeyPress(Sender: TObject; var Key: Char);
    procedure chkAtivoEnter(Sender: TObject);
    procedure chkAtivoExit(Sender: TObject);
    procedure chkAtivoKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure edtInsLocalDtHrClick(Sender: TObject);
    procedure edtUpdLocalDtHrClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure mniCancelarClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
    procedure mniGravarClick(Sender: TObject);
    procedure mniAlterarClick(Sender: TObject);
    procedure mniExcluirClick(Sender: TObject);
    procedure mniNovoClick(Sender: TObject);
    procedure mniAtualizarClick(Sender: TObject);
    procedure edtRegistroAcaoBaseDescricaoClick(Sender: TObject);
    procedure edtCodigoCadastradoClick(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioControlar(argEditar: Boolean);
    procedure FormularioAtualizar;
    procedure FormularioNovo;

    procedure FormularioPopular(argRegistroAcaoBaseID: Integer; argRegistroAcaoID: Integer);

    procedure FormularioAlterar;
    procedure FormularioGravar;
    procedure FormularioCancelar;
    procedure FormularioExcluir;
    procedure FormularioCodigoSugerir;
    function  LogDadosGerar(argRegistroAcaoID: Integer = 0): string;
  public
    pubDadosAtualizados  : Boolean;
    pubRegistroAcaoBaseID: Integer;
    pubRegistroAcaoID    : Integer;
  end;

var
  PlataformaERPVCLRegistroAcaoCadastro: TPlataformaERPVCLRegistroAcaoCadastro;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_RegistroAcaoCadastro.pas';

  TAB_CADASTRO : Byte = 0;
  TAB_AUDITORIA: Byte = 1;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas.
  //
  pubDadosAtualizados   := False;
  pubRegistroAcaoBaseID := 0;
  pubRegistroAcaoID     := 0;
 
  //
  // Limpa os componentes do formul�rio.
  //
  FormularioLimpar;

  //
  // Componentes desligados para edi��o.
  //
  FormularioControlar(False);
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.FormShow(Sender: TObject);
begin
  //
  // Background do formul�rio.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Controla os componentes de exibi��o de cadastro.
  //
  VCLEditClickControlar(edtCodigoCadastrado,          False);
  VCLEditClickControlar(edtRegistroAcaoBaseDescricao, False);
  VCLEditClickControlar(edtInsLocalDtHr,              False);
  VCLEditClickControlar(edtUpdLocalDtHr,              False);
  
  //
  // Se nenhuma chave foi passada ent�o � um novo cadastro.
  //
  if pubRegistroAcaoID = 0 then
  begin
    FormularioNovo;
    Exit;
  end;

  //
  // Se foi passada uma chave ent�o popula formul�rio.
  //
  if pubRegistroAcaoID > 0 then
  begin
    FormularioPopular(pubRegistroAcaoBaseID, pubRegistroAcaoID);
    FormularioControlar(False);
    Exit;
  end;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas op��es do menu.
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

procedure TPlataformaERPVCLRegistroAcaoCadastro.mniNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

procedure TPlataformaERPVCLRegistroAcaoCadastro.mniExcluirClick(Sender: TObject);
begin
  FormularioExcluir;
end;

procedure TPlataformaERPVCLRegistroAcaoCadastro.mniAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

procedure TPlataformaERPVCLRegistroAcaoCadastro.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

procedure TPlataformaERPVCLRegistroAcaoCadastro.mniCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

procedure TPlataformaERPVCLRegistroAcaoCadastro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLRegistroAcaoCadastro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Evento de click no componente "base da a��o em registro".
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.edtRegistroAcaoBaseDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_BaseCadastroExibir(StringIntegerConverter(edtRegistroAcaoBaseID.Text));
end;

//
// Eventos do componente "c�digo".
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.edtCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigo) then Exit;
end;

procedure TPlataformaERPVCLRegistroAcaoCadastro.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLRegistroAcaoCadastro.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLRegistroAcaoCadastro.edtCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigo) then Exit;
end;

//
// Evento de click no c�digo sugerido.
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.edtCodigoCadastradoClick(Sender: TObject);
var
  locFormulario      : TPlataformaERPVCLRegistroAcaoCadastro;
  locDadosAtualizados: Boolean;
begin
  locFormulario := TPlataformaERPVCLRegistroAcaoCadastro.Create(Self);

  locFormulario.pubRegistroAcaoBaseID := StringIntegerConverter(edtCodigoCadastradoBaseID.Text);
  locFormulario.pubRegistroAcaoID     := StringIntegerConverter(edtCodigoCadastradoID.Text);

  locFormulario.ShowModal;

  locDadosAtualizados := locFormulario.pubDadosAtualizados;

  locFormulario.Release;
  FreeAndNil(locFormulario);

  if locDadosAtualizados then
  begin
    FormularioCodigoSugerir;
  end;
end;

//
// Eventos do componente "descri��o".
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.edtDescricaoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtDescricao) then Exit;
end;

procedure TPlataformaERPVCLRegistroAcaoCadastro.edtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLRegistroAcaoCadastro.edtDescricaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLRegistroAcaoCadastro.edtDescricaoExit(Sender: TObject);
begin
  if not VCLEditSair(edtDescricao) then Exit;
end;

//
// Eventos do componente "bloqueado".
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.chkBloqueadoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkBloqueado) then Exit;
end;

procedure TPlataformaERPVCLRegistroAcaoCadastro.chkBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLRegistroAcaoCadastro.chkBloqueadoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkBloqueado) then Exit;
end;

//
// Ativo.
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.chkAtivoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkAtivo) then Exit;
end;

procedure TPlataformaERPVCLRegistroAcaoCadastro.chkAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLRegistroAcaoCadastro.chkAtivoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkAtivo) then Exit;
end;

//
// Evento de click na data de cria��o.
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.edtInsLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtInsLocalDtHr.Text));
end;

//
// Evento de click na data da �ltima altera��o.
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.edtUpdLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtUpdLocalDtHr.Text));
end;

//
// Evento de click no bot�o "novo".
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.btnNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

//
// Evento de click no bot�o "alterar".
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.btnAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

//
// Evento de click no bot�o "gravar".
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no bot�o "minimizar".
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "cancelar".
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.btnCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.FormularioLimpar;
begin 
  //
  // Posiciona pagecontrole na primeira aba.
  //
  VCLPageControlInicializar(pagFormulario);

  // Limpa componentes da aba "cadastro".
  VCLEditLimpar    (edtCodigo);
  VCLEditLimpar    (edtDescricao);

  VCLRadioButtonLimpar(rbtAcaoCriacao);
  VCLRadioButtonLimpar(rbtAcaoConsulta);
  VCLRadioButtonLimpar(rbtAcaoAlteracao);
  VCLRadioButtonLimpar(rbtAcaoExclusao);

  VCLCheckBoxLimpar(chkBloqueado);
  VCLCheckBoxLimpar(chkAtivo);

  VCLEditLimpar(edtCodigoCadastrado);
  VCLEditLimpar(edtCodigoCadastradoID);
  VCLEditLimpar(edtCodigoCadastradoBaseID);

  //
  // Limpa componentes da aba "auditoria".
  //
  VCLEditLimpar(edtRegistroAcaoBaseID);
  VCLEditLimpar(edtRegistroAcaoBaseDescricao);
  VCLEditLimpar(edtRegistroAcaoID);
  VCLEditLimpar(edtInsLocalDtHr);
  VCLEditLimpar(edtUpdLocalDtHr);
  VCLEditLimpar(edtUpdContador);
end;

//
// Procedimento para controlar os componentes do formul�rio.
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.FormularioControlar(argEditar: Boolean);
var
  locDadosPopulados: Boolean;
  locIdentificador : string;
begin
  //
  // Determina se existem dados populados no formul�rio.
  //
  locDadosPopulados := (StringIntegerConverter(edtRegistroAcaoID.Text) > 0);

  //
  // Controla os componentes do formul�rio.
  //
  VCLEditControlar(edtCodigo,    argEditar);
  VCLEditControlar(edtDescricao, argEditar);
  gbxTipoAcao.Enabled := argEditar;
  gbxOpcoes.Enabled   := argEditar;

  //
  // Exibe o �ltimo c�digo cadastrado somente se for um novo cadastro.
  //
  lblCodigoCadastrado.Visible := (argEditar) and (not locDadosPopulados);
  edtCodigoCadastrado.Visible := (argEditar) and (not locDadosPopulados);

  //
  // Controla os componentes de exibi��o de cadastro.
  //
  VCLEditClickControlar(edtRegistroAcaoBaseDescricao, True);
  VCLEditClickControlar(edtInsLocalDtHr,              True);
  VCLEditClickControlar(edtUpdLocalDtHr,              True);

  //
  // Controla os itens de menu do formul�rio.
  //
  mniAtualizar.Visible := (not argEditar) and (locDadosPopulados);
  mniNovo.Visible      := (not argEditar);
  mniExcluir.Visible   := (not argEditar) and (locDadosPopulados);
  mniAlterar.Visible   := (not argEditar) and (locDadosPopulados);
  mniGravar.Visible    := (argEditar);
  mniCancelar.Visible  := (argEditar);
  mniMinimizar.Visible := True;
  mniFechar.Visible    := (not argEditar);

  //
  // Permiss�es de acesso por usu�rio.
  //
  tabCadastro.TabVisible  := Plataforma_ERP_UsuarioRotina('ERP_REGISTRO_ACAO_CADASTRO_ABA_CADASTRO');
  tabAuditoria.TabVisible := Plataforma_ERP_UsuarioRotina('ERP_REGISTRO_ACAO_CADASTRO_ABA_AUDITORIA');
      
  mniAtualizar.Visible := (mniAtualizar.Visible) and (Plataforma_ERP_UsuarioRotina('ERP_REGISTRO_ACAO_CADASTRO_ATUALIZAR'));
  mniNovo.Visible      := (mniNovo.Visible)      and (Plataforma_ERP_UsuarioRotina('ERP_REGISTRO_ACAO_CADASTRO_NOVO'));
  mniExcluir.Visible   := (mniExcluir.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_REGISTRO_ACAO_CADASTRO_EXCLUIR'));
  mniAlterar.Visible   := (mniAlterar.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_REGISTRO_ACAO_CADASTRO_ALTERAR'));

  //
  // Bot�es.
  //
  btnNovo.Visible      := mniNovo.Visible;
  btnAlterar.Visible   := mniAlterar.Visible;
  btnGravar.Visible    := mniGravar.Visible;
  btnMinimizar.Visible := mniMinimizar.Visible;
  btnCancelar.Visible  := mniCancelar.Visible;
  btnFechar.Visible    := mniFechar.Visible;

  //
  // Ajusta o t�tulo do formul�rio.
  //
  Self.Caption     := 'A��o em registro';
  locIdentificador := ': ' + edtDescricao.Text;

  if (not locDadosPopulados) and (argEditar) then Self.Caption := Self.Caption + ' - novo cadastro';
  if locDadosPopulados and argEditar         then Self.Caption := Self.Caption + ' - alterando cadastro'   + locIdentificador;
  if locDadosPopulados and (not argEditar)   then Self.Caption := Self.Caption + ' - consultando cadastro' + locIdentificador;
end;

//
// Procedimento para atualizar os dados populados nos componentes do formul�rio.
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.FormularioAtualizar;
begin
  //
  // Popula componentes com as informa��es do cadastro.
  //
  FormularioPopular(StringIntegerConverter(edtRegistroAcaoBaseID.Text), StringIntegerConverter(edtRegistroAcaoID.Text));

  //
  // Controla a exibi��o dos componentes.
  //
  FormularioControlar(False);
end;

//
// Procedimento para iniciar a digita��o de dados de um novo cadastro.
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.FormularioNovo;
begin
  //
  // Limpa os componentes do formul�rio.
  //
  FormularioLimpar;

  //
  // Carrega conte�do dos campos necess�rios.
  //
  edtRegistroAcaoBaseID.Text        := IntegerStringConverter(gloBaseID, True);
  edtRegistroAcaoBaseDescricao.Text := gloBaseDescricao;  
  edtRegistroAcaoID.Text            := STR_NOVO;
  chkAtivo.Checked                  := True;

  //
  // Exibe o �ltimo c�digo cadastrado.
  //
  FormularioCodigoSugerir;

  //
  // Componentes ligados para edi��o.
  //
  FormularioControlar(True);
  
  //
  // Coloca o foco no c�digo.
  //
  VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
end;

//
// Procedimento para popular os componentes com os dados de um cadastro.
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.FormularioPopular(argRegistroAcaoBaseID: Integer; argRegistroAcaoID: Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
  ERRO_MENSAGEM    : string = 'Imposs�vel consultar dados da a��o em registro!';
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
  // Consulta dados da a��o em registro.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                 ');
  locADOQuery.SQL.Add('  [base].[base_id]   AS [registro_acao_base_id],                       ');
  locADOQuery.SQL.Add('  [base].[descricao] AS [registro_acao_base_descricao],                ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_id],                                  ');  
  locADOQuery.SQL.Add('  [registro_acao].[codigo],                                            ');
  locADOQuery.SQL.Add('  [registro_acao].[descricao],                                         ');
  locADOQuery.SQL.Add('  [registro_acao].[criacao],                                           ');
  locADOQuery.SQL.Add('  [registro_acao].[consulta],                                          ');
  locADOQuery.SQL.Add('  [registro_acao].[alteracao],                                         ');
  locADOQuery.SQL.Add('  [registro_acao].[exclusao],                                          ');
  locADOQuery.SQL.Add('  [registro_acao].[bloqueado],                                         ');
  locADOQuery.SQL.Add('  [registro_acao].[ativo],                                             ');
  locADOQuery.SQL.Add('  [registro_acao].[ins_local_dt_hr],                                   ');
  locADOQuery.SQL.Add('  [registro_acao].[upd_local_dt_hr],                                   ');
  locADOQuery.SQL.Add('  [registro_acao].[upd_contador]                                       ');  
  locADOQuery.SQL.Add('FROM                                                                   ');
  locADOQuery.SQL.Add('  [registro_acao] WITH (NOLOCK)                                        ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                                      ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [registro_acao].[registro_acao_base_id]      ');
  locADOQuery.SQL.Add('WHERE                                                                  ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_base_id] = :registro_acao_base_id AND ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_id]      = :registro_acao_id          ');

  locADOQuery.Parameters.ParamByName('registro_acao_base_id').Value := argRegistroAcaoBaseID;
  locADOQuery.Parameters.ParamByName('registro_acao_id').Value      := argRegistroAcaoID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [registro_acao]!';
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
    edtCodigo.Text       := locADOQuery.FieldByName('codigo').AsString;
    edtDescricao.Text    := locADOQuery.FieldByName('descricao').AsString;

    rbtAcaoCriacao.Checked   := StringBooleanConverter(locADOQuery.FieldByName('criacao').AsString);
    rbtAcaoConsulta.Checked  := StringBooleanConverter(locADOQuery.FieldByName('consulta').AsString);
    rbtAcaoAlteracao.Checked := StringBooleanConverter(locADOQuery.FieldByName('alteracao').AsString);
    rbtAcaoExclusao.Checked  := StringBooleanConverter(locADOQuery.FieldByName('exclusao').AsString);
    
    chkBloqueado.Checked := StringBooleanConverter(locADOQuery.FieldByName('bloqueado').AsString);
    chkAtivo.Checked     := StringBooleanConverter(locADOQuery.FieldByName('ativo').AsString);

    edtRegistroAcaoBaseID.Text        := IntegerStringConverter(locADOQuery.FieldByName('registro_acao_base_id').AsInteger, True);
    edtRegistroAcaoBaseDescricao.Text := locADOQuery.FieldByName('registro_acao_base_descricao').AsString;
  
    edtRegistroAcaoID.Text := IntegerStringConverter(locADOQuery.FieldByName('registro_acao_id').AsInteger, True);
    edtInsLocalDtHr.Text      := DateTimeStringConverter(locADOQuery.FieldByName('ins_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn:ss');
    edtUpdLocalDtHr.Text      := DateTimeStringConverter(locADOQuery.FieldByName('upd_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn:ss');
    edtUpdContador.Text       := IntegerStringConverter(locADOQuery.FieldByName('upd_contador').AsInteger);
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
// Procedimento para alterar os dados do formul�rio.
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.FormularioAlterar;
begin
  //
  // Componentes ligados para edi��o.
  //
  FormularioControlar(True);

  //
  // Coloca o foco no c�digo.
  //
  VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
end;

//
// Procedimento para gravar os dados do formul�rio.
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioGravar';
  ERRO_MENSAGEM    : string = 'Imposs�vel gravar dados da a��o em registro!';
var
  locADOConnection       : TADOConnection;
  locADOQuery            : TADOQuery;
  locLogMensagem         : string;

  locInsert              : Boolean;
  locRegistroAcao        : Byte;
  locRegistroAcaoLogSq   : Integer;
  locRegistroAcaoLogMsg  : string;
  locRegistroAcaoLogDados: string;

  locRegistroAcaoBaseID  : Integer;
  locRegistroAcaoID      : Integer;
  locCodigo              : string;
  locDescricao           : string;
  locCriacao             : Boolean;
  locConsulta            : Boolean;
  locAlteracao           : Boolean;
  locExclusao            : Boolean;
  locBloqueado           : Boolean;
  locAtivo               : Boolean;
  locInsLocalDtHr        : TDateTime;
  locUpdLocalDtHr        : TDateTime;
  locUsuarioBaseID       : Integer;
  locUsuarioID           : Integer;
  locUpdContador         : Integer;
  locHostName            : string;
  locUserName            : string;
begin
  //
  // Determina se ser� um insert ou update.
  //
  if edtRegistroAcaoID.Text = STR_NOVO then
    locInsert := True
  else
    locInsert := False;

  //
  // Carrega vari�veis com o conte�do dos componentes.
  //
  locRegistroAcaoBaseID := StringIntegerConverter(edtRegistroAcaoBaseID.Text);
  locRegistroAcaoID     := StringIntegerConverter(edtRegistroAcaoID.Text);
  locCodigo             := StringTrim(edtCodigo.Text);
  locDescricao          := StringTrim(edtDescricao.Text);
  locCriacao            := rbtAcaoCriacao.Checked;
  locConsulta           := rbtAcaoConsulta.Checked;
  locAlteracao          := rbtAcaoAlteracao.Checked;
  locExclusao           := rbtAcaoExclusao.Checked;
  locBloqueado          := chkBloqueado.Checked;
  locAtivo              := chkAtivo.Checked;
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
    VCLConsistenciaExibir('O c�digo da a��o em registro deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
    Exit;
  end;

  if locDescricao = '' then
  begin
    VCLConsistenciaExibir('A descri��o da a��o em registro deve ser informada!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtDescricao);
    Exit;
  end;

  if (not locCriacao) and (not locConsulta) and (not locAlteracao) and (not locExclusao) then
  begin
    VCLConsistenciaExibir('Um tipo de a��o deve ser selecionado!');
    pagFormulario.ActivePageIndex := TAB_CADASTRO;
    gbxTipoAcao.SetFocus;
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
  // Determina se o c�digo da a��o em registro j� existe no banco de dados para um outro registro.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                                                           ');
  locADOQuery.SQL.Add('  1                                                                    ');
  locADOQuery.SQL.Add('FROM                                                                   ');
  locADOQuery.SQL.Add('  [registro_acao] WITH (NOLOCK)                                        ');
  locADOQuery.SQL.Add('WHERE                                                                  ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_base_id] = :registro_acao_base_id AND ');
  locADOQuery.SQL.Add('  [registro_acao].[codigo]                = :codigo                AND ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_id]     <> :registro_acao_id          ');

  locADOQuery.Parameters.ParamByName('registro_acao_base_id').Value := locRegistroAcaoBaseID;
  locADOQuery.Parameters.ParamByName('codigo').Value                := locCodigo;
  locADOQuery.Parameters.ParamByName('registro_acao_id').Value      := locRegistroAcaoID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar o mesmo c�digo da a��o em registro em um outro registro!';
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
    locLogMensagem := 'O c�digo "' + locCodigo + '" informado para a a��o em registro j� existe em algum outro cadastro!';
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
    locADOQuery.SQL.Add('SELECT                                                                 ');
    locADOQuery.SQL.Add('  [registro_acao].[upd_contador]                                       ');
    locADOQuery.SQL.Add('FROM                                                                   ');
    locADOQuery.SQL.Add('  [registro_acao] WITH (NOLOCK)                                        ');
    locADOQuery.SQL.Add('WHERE                                                                  ');
    locADOQuery.SQL.Add('  [registro_acao].[registro_acao_base_id] = :registro_acao_base_id AND ');
    locADOQuery.SQL.Add('  [registro_acao].[registro_acao_id]      = :registro_acao_id          ');

    locADOQuery.Parameters.ParamByName('registro_acao_base_id').Value := locRegistroAcaoBaseID;
    locADOQuery.Parameters.ParamByName('registro_acao_id').Value      := locRegistroAcaoID;

    try
      locADOQuery.Open;
    except
      on locExcecao: Exception do
      begin
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualiza��es confere na tabela [registro_acao]!';
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
    locRegistroAcao       := REGISTRO_ACAO_CRIACAO;
    locRegistroAcaoLogMsg := MENSAGEM_REGISTRO_ACAO_CRIADO;
  end
  else
  begin
    locRegistroAcao       := REGISTRO_ACAO_ALTERACAO;
    locRegistroAcaoLogMsg := MENSAGEM_REGISTRO_ACAO_ALTERADO;
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
  // Determina o pr�ximo ID da a��o em registro.
  //
  if locInsert then
  begin
    try
      locRegistroAcaoID := Plataforma_ERP_ADO_NumeradorBaseDeterminar(locADOConnection,
                                                                      locRegistroAcaoBaseID, 
                                                                      NUMERADOR_REGISTRO_ACAO_ID);
    except
      on locExcecao: Exception do
      begin
        locADOConnection.RollbackTrans;
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Imposs�vel determinar o pr�ximo numerador para a a��o em registro!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
        Exit
      end;
    end;
  end;

  //
  // Grava dados na tabela registro_acao.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;

  if locInsert then
  begin
    //
    // Insere dados.
    //
    locADOQuery.SQL.Add('INSERT INTO [registro_acao] (');
    locADOQuery.SQL.Add('  [registro_acao_base_id],   ');
    locADOQuery.SQL.Add('  [registro_acao_id],        ');
    locADOQuery.SQL.Add('  [codigo],                  ');
    locADOQuery.SQL.Add('  [descricao],               ');
    locADOQuery.SQL.Add('  [criacao],                 ');
    locADOQuery.SQL.Add('  [consulta],                ');
    locADOQuery.SQL.Add('  [alteracao],               ');
    locADOQuery.SQL.Add('  [exclusao],                ');
    locADOQuery.SQL.Add('  [bloqueado],               ');
    locADOQuery.SQL.Add('  [ativo],                   ');
    locADOQuery.SQL.Add('  [ins_local_dt_hr],         ');
    locADOQuery.SQL.Add('  [ins_server_dt_hr],        ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr],         ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr],        ');
    locADOQuery.SQL.Add('  [upd_contador]             ');  
    locADOQuery.SQL.Add(')                            ');
    locADOQuery.SQL.Add('VALUES (                     ');
    locADOQuery.SQL.Add('  :registro_acao_base_id,    '); // [registro_acao_base_id].
    locADOQuery.SQL.Add('  :registro_acao_id,         '); // [registro_acao_id].
    locADOQuery.SQL.Add('  :codigo,                   '); // [codigo].
    locADOQuery.SQL.Add('  :descricao,                '); // [descricao].
    locADOQuery.SQL.Add('  :criacao,                  '); // [criacao].
    locADOQuery.SQL.Add('  :consulta,                 '); // [consulta].
    locADOQuery.SQL.Add('  :alteracao,                '); // [alteracao].
    locADOQuery.SQL.Add('  :exclusao,                 '); // [exclusao].
    locADOQuery.SQL.Add('  :bloqueado,                '); // [bloqueado].
    locADOQuery.SQL.Add('  :ativo,                    '); // [ativo].
    locADOQuery.SQL.Add('  :local_dt_hr,              '); // [ins_local_dt_hr].
    locADOQuery.SQL.Add('  GETDATE(),                 '); // [ins_server_dt_hr].
    locADOQuery.SQL.Add('  NULL,                      '); // [upd_local_dt_hr].
    locADOQuery.SQL.Add('  NULL,                      '); // [upd_server_dt_hr].
    locADOQuery.SQL.Add('  0                          '); // [upd_contador].
    locADOQuery.SQL.Add(')                            ');
  end
  else
  begin
    //
    // Atualiza dados.
    //
    locADOQuery.SQL.Add('UPDATE                                                 ');
    locADOQuery.SQL.Add('  [registro_acao]                                      ');
    locADOQuery.SQL.Add('SET                                                    ');
    locADOQuery.SQL.Add('  [codigo]           = :codigo,                        ');
    locADOQuery.SQL.Add('  [descricao]        = :descricao,                     ');
    locADOQuery.SQL.Add('  [criacao]          = :criacao,                       ');
    locADOQuery.SQL.Add('  [consulta]         = :consulta,                      ');
    locADOQuery.SQL.Add('  [alteracao]        = :alteracao,                     ');
    locADOQuery.SQL.Add('  [exclusao]         = :exclusao,                      ');
    locADOQuery.SQL.Add('  [bloqueado]        = :bloqueado,                     ');
    locADOQuery.SQL.Add('  [ativo]            = :ativo,                         ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr]  = :local_dt_hr,                   ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr] = GETDATE(),                      ');
    locADOQuery.SQL.Add('  [upd_contador]     = [upd_contador] + 1              ');
    locADOQuery.SQL.Add('WHERE                                                  ');
    locADOQuery.SQL.Add('  [registro_acao_base_id] = :registro_acao_base_id AND ');
    locADOQuery.SQL.Add('  [registro_acao_id]      = :registro_acao_id          ');
  end;

  //
  // Par�metros.
  //
  locADOQuery.Parameters.ParamByName('registro_acao_base_id').Value  := locRegistroAcaoBaseID;
  locADOQuery.Parameters.ParamByName('registro_acao_id').Value       := locRegistroAcaoID;
  locADOQuery.Parameters.ParamByName('codigo').Value                 := locCodigo;
  locADOQuery.Parameters.ParamByName('descricao').Value              := locDescricao;
  locADOQuery.Parameters.ParamByName('criacao').Value                := BooleanStringConverter(locCriacao);
  locADOQuery.Parameters.ParamByName('consulta').Value               := BooleanStringConverter(locConsulta);
  locADOQuery.Parameters.ParamByName('alteracao').Value              := BooleanStringConverter(locAlteracao);
  locADOQuery.Parameters.ParamByName('exclusao').Value               := BooleanStringConverter(locExclusao);
  locADOQuery.Parameters.ParamByName('bloqueado').Value              := BooleanStringConverter(locBloqueado);
  locADOQuery.Parameters.ParamByName('ativo').Value                  := BooleanStringConverter(locAtivo);
  locADOQuery.Parameters.ParamByName('local_dt_hr').Value            := Now;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [registro_acao]!';
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
  locADOQuery.SQL.Add('SELECT                                                                 ');
  locADOQuery.SQL.Add('  [registro_acao].[ins_local_dt_hr],                                   ');
  locADOQuery.SQL.Add('  [registro_acao].[upd_local_dt_hr],                                   ');
  locADOQuery.SQL.Add('  [registro_acao].[upd_contador]                                       ');
  locADOQuery.SQL.Add('FROM                                                                   ');
  locADOQuery.SQL.Add('  [registro_acao]                                                      ');
  locADOQuery.SQL.Add('WHERE                                                                  ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_base_id] = :registro_acao_base_id AND ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_id]      = :registro_acao_id          ');

  locADOQuery.Parameters.ParamByName('registro_acao_base_id').Value := locRegistroAcaoBaseID;
  locADOQuery.Parameters.ParamByName('registro_acao_id').Value      := locRegistroAcaoID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o novo contador de updates do registro na tabela [registro_acao]!';
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
  locRegistroAcaoLogDados := LogDadosGerar(locRegistroAcaoID);

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
  edtRegistroAcaoID.Text := IntegerStringConverter(locRegistroAcaoID);
  edtInsLocalDtHr.Text   := DateTimeStringConverter(locInsLocalDtHr, 'dd/mm/yyyy hh:nn:ss');
  edtUpdLocalDtHr.Text   := DateTimeStringConverter(locUpdLocalDtHr, 'dd/mm/yyyy hh:nn:ss');
  edtUpdContador.Text    := IntegerStringConverter(locUpdContador);

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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, locRegistroAcaoID, locCodigo, 'registro_acao', locRegistroAcaoLogMsg, locRegistroAcaoLogDados);
  except
    on locExcecao: Exception do
    begin
      VCLErroExibir(locExcecao.Message);
    end;
  end;

  //
  // A��o em registro gravada!
  //
  VCLInformacaoExibir('A��o em registro gravada com sucesso!');
end;

//
// Procedimento para excluir os dados deste cadastro.
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.FormularioExcluir;
const
  PROCEDIMENTO_NOME: string = 'FormularioExcluir';
  ERRO_MENSAGEM    : string = 'Imposs�vel excluir dados da a��o em registro!';
var
  locADOConnection       : TADOConnection;
  locADOQuery            : TADOQuery;
  locLogMensagem         : string;
  locRegistroAcaoBaseID  : Integer;
  locRegistroAcaoID      : Integer;
  locRegistroAcaoLogDados: string;
begin
  //
  // Carrega vari�veis com o conte�do dos componentes.
  //
  locRegistroAcaoBaseID := StringIntegerConverter(edtRegistroAcaoBaseID.Text);
  locRegistroAcaoID     := StringIntegerConverter(edtRegistroAcaoID.Text);

  //
  // Log dados.
  //
  locRegistroAcaoLogDados := LogDadosGerar;

  //
  // Confirma grava��o com o usu�rio.
  //
  if not VCLQuestionamentoExibir('Deseja realmente excluir estes dados?') then Exit;
  if not VCLQuestionamentoExibir('Tem certeza?') then Exit;

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
  // Comando SQL para excluir um registro da tabela registro_acao.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                                                            ');
  locADOQuery.SQL.Add('  [registro_acao]                                                      ');
  locADOQuery.SQL.Add('WHERE                                                                  ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_base_id] = :registro_acao_base_id AND ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_id]      = :registro_acao_id          ');

  locADOQuery.Parameters.ParamByName('registro_acao_base_id').Value := locRegistroAcaoBaseID;
  locADOQuery.Parameters.ParamByName('registro_acao_id').Value      := locRegistroAcaoID;

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
      locLogMensagem := 'Ocorreu algum problema ao executar query para deletar os registros na tabela [registro_acao]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
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
  // Limpa os componentes do formul�rio.
  //
  FormularioLimpar;

  //
  // Desliga os componentes para edi��o e ajusta a visibilidade dos bot�es.
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
  // Log de ocorr�ncia.
  //
  try
    Plataforma_ERP_ADO_LogOcorrenciaInserir(REGISTRO_ACAO_EXCLUSAO, locRegistroAcaoID, edtCodigo.Text, 'registro_acao', 'Registro exclu�do com sucesso!', locRegistroAcaoLogDados);
  except
  end;
  VCLInformacaoExibir('A��o em registro exclu�da com sucesso!');
end;

//
// Procedimento para cancelar a edi��o dos dados do formul�rio.
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.FormularioCancelar;
var
  locRegistroAcaoBaseID: Integer;
  locRegistroAcaoID    : Integer;
begin
  //
  // Carrega chave do registro que estava sendo editado.
  //
  locRegistroAcaoBaseID := StringIntegerConverter(edtRegistroAcaoBaseID.Text);
  locRegistroAcaoID     := StringIntegerConverter(edtRegistroAcaoID.Text);

  //
  // Confirma com o usu�rio.
  //
  if locRegistroAcaoID = 0 then
  begin
    if not VCLQuestionamentoExibir('Deseja realmente cancelar a digita��o destes dados?') then Exit;
  end
  else
  begin
    if not VCLQuestionamentoExibir('Deseja realmente cancelar a altera��o destes dados?') then Exit;
  end;

  //
  // Popula somente os dados.
  //
  FormularioPopular(locRegistroAcaoBaseID, locRegistroAcaoID);

  //
  // Componentes desligados para edi��o.
  //
  FormularioControlar(False);
end;

//
// Procedimento par sugerir o pr�ximo c�digo.
//
procedure TPlataformaERPVCLRegistroAcaoCadastro.FormularioCodigoSugerir;
const
  PROCEDIMENTO_NOME: string = 'FormularioCodigoSugerir';
  ERRO_MENSAGEM    : string = 'Imposs�vel sugerir informa��es sobre o pr�ximo c�digo da a��o em registro!';
var
  locADOConnection     : TADOConnection;
  locADOQuery          : TADOQuery;
  locLogMensagem       : string;
  locRegistroAcaoBaseID: Integer;
begin
  //
  // ID da base.
  //
  locRegistroAcaoBaseID := gloBaseID;

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Limpa componente.
  //
  VCLEditLimpar(edtCodigoCadastrado);
  VCLEditLimpar(edtCodigoCadastradoBaseID);
  VCLEditLimpar(edtCodigoCadastradoID);

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
  // Consulta dados do c�digo do usu�rio.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                                                       ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_base_id],                         ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_id],                              ');
  locADOQuery.SQL.Add('  [registro_acao].[codigo]                                         ');
  locADOQuery.SQL.Add('FROM                                                               ');
  locADOQuery.SQL.Add('  [registro_acao] WITH (NOLOCK)                                    ');
  locADOQuery.SQL.Add('WHERE                                                              ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_base_id] = :registro_acao_base_id ');
  locADOQuery.SQL.Add('ORDER BY                                                           ');
  locADOQuery.SQL.Add('  [registro_acao].[ins_server_dt_hr] DESC,                         ');
  locADOQuery.SQL.Add('  [registro_acao].[codigo] DESC                                    ');

  locADOQuery.Parameters.ParamByName('registro_acao_base_id').Value := locRegistroAcaoBaseID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar �ltimo cadastro na tabela [registro_acao]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Registro encontrado ent�o carrega componentes.
  //
  if locADOQuery.RecordCount > 0 then
  begin
    edtCodigoCadastrado.Text       := locADOQuery.FieldByName('codigo').AsString;
    edtCodigoCadastradoBaseID.Text := IntegerStringConverter(locADOQuery.FieldByName('registro_acao_base_id').AsInteger);
    edtCodigoCadastradoID.Text     := IntegerStringConverter(locADOQuery.FieldByName('registro_acao_id').AsInteger);

    VCLEditClickControlar(edtCodigoCadastrado, True);
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
// Fun��o para gerar a string de log dos dados.
//
function TPlataformaERPVCLRegistroAcaoCadastro.LogDadosGerar(argRegistroAcaoID: Integer = 0): string;
var
  locRegistroAcaoID: Integer;
begin
  if argRegistroAcaoID <= 0 then
    locRegistroAcaoID := StringIntegerConverter(edtRegistroAcaoID.Text)
  else
    locRegistroAcaoID := argRegistroAcaoID;

  Result := '';
  LogDadosStringDescrever ('ID da base da a��o em registro', edtRegistroAcaoBaseID.Text, Result);
  LogDadosIntegerDescrever('ID da a��o em registro',         locRegistroAcaoID,          Result);
  LogDadosStringDescrever ('C�digo',                         edtCodigo.Text,                Result);
  LogDadosStringDescrever ('Descri��o',                      edtDescricao.Text,             Result);
  LogDadosBooleanDescrever('Bloqueado',                      chkBloqueado.Checked,          Result);
  LogDadosBooleanDescrever('Ativo',                          chkAtivo.Checked,              Result);
end;

end.
