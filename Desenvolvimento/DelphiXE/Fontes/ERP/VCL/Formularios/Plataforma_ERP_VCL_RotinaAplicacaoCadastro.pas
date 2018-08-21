//
// Arquivo..: Plataforma_ERP_VCL_RotinaAplicacaoCadastro.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 14/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com o cadastro da rotina da aplica��o.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_RotinaAplicacaoCadastro;

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
  TPlataformaERPVCLRotinaAplicacaoCadastro = class(TForm)
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
    lblRotinaAplicacaoID: TLabel;
    edtRotinaAplicacaoID: TEdit;
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
    lblChave: TLabel;
    edtChave: TEdit;
    lblRotinaAplicacaoBase: TLabel;
    edtRotinaAplicacaoBaseDescricao: TEdit;
    edtRotinaAplicacaoBaseID: TEdit;
    lblCodigoCadastrado: TLabel;
    edtCodigoCadastrado: TEdit;
    edtCodigoCadastradoID: TEdit;
    edtCodigoCadastradoBaseID: TEdit;
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
    procedure edtChaveEnter(Sender: TObject);
    procedure edtChaveExit(Sender: TObject);
    procedure edtChaveKeyPress(Sender: TObject; var Key: Char);
    procedure edtRotinaAplicacaoBaseDescricaoClick(Sender: TObject);
    procedure edtCodigoCadastradoClick(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioControlar(argEditar: Boolean);
    procedure FormularioAtualizar;
    procedure FormularioNovo;

    procedure FormularioPopular(argRotinaAplicacaoBaseID: Integer; argRotinaAplicacaoID: Integer);

    procedure FormularioAlterar;
    procedure FormularioGravar;
    procedure FormularioCancelar;
    procedure FormularioExcluir;
    procedure FormularioCodigoSugerir;
    function  LogDadosGerar(argRotinaAplicacaoID: Integer = 0): string;
  public
    pubDadosAtualizados     : Boolean;
    pubRotinaAplicacaoBaseID: Integer;
    pubRotinaAplicacaoID    : Integer;
  end;

var
  PlataformaERPVCLRotinaAplicacaoCadastro: TPlataformaERPVCLRotinaAplicacaoCadastro;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_RotinaAplicacaoCadastro.pas';

  TAB_CADASTRO : Byte = 0;
  TAB_AUDITORIA: Byte = 1;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas.
  //
  pubDadosAtualizados      := False;
  pubRotinaAplicacaoBaseID := 0;
  pubRotinaAplicacaoID     := 0;
 
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
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.FormShow(Sender: TObject);
begin
  //
  // Background do formul�rio.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Controla os componentes de exibi��o de cadastro.
  //
  VCLEditClickControlar(edtCodigoCadastrado,             False);
  VCLEditClickControlar(edtRotinaAplicacaoBaseDescricao, False);
  VCLEditClickControlar(edtInsLocalDtHr,                 False);
  VCLEditClickControlar(edtUpdLocalDtHr,                 False);
  
  //
  // Se nenhuma chave foi passada ent�o � um novo cadastro.
  //
  if pubRotinaAplicacaoID = 0 then
  begin
    FormularioNovo;
    Exit;
  end;

  //
  // Se foi passada uma chave ent�o popula formul�rio.
  //
  if pubRotinaAplicacaoID > 0 then
  begin
    FormularioPopular(pubRotinaAplicacaoBaseID, pubRotinaAplicacaoID);
    FormularioControlar(False);
    Exit;
  end;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas op��es do menu.
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

procedure TPlataformaERPVCLRotinaAplicacaoCadastro.mniNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

procedure TPlataformaERPVCLRotinaAplicacaoCadastro.mniExcluirClick(Sender: TObject);
begin
  FormularioExcluir;
end;

procedure TPlataformaERPVCLRotinaAplicacaoCadastro.mniAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

procedure TPlataformaERPVCLRotinaAplicacaoCadastro.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

procedure TPlataformaERPVCLRotinaAplicacaoCadastro.mniCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

procedure TPlataformaERPVCLRotinaAplicacaoCadastro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLRotinaAplicacaoCadastro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Evento de click no componente "base da rotina aplica��o".
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.edtRotinaAplicacaoBaseDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_BaseCadastroExibir(StringIntegerConverter(edtRotinaAplicacaoBaseID.Text));
end;

//
// Eventos do componente "c�digo".
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.edtCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigo) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoCadastro.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLRotinaAplicacaoCadastro.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoCadastro.edtCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigo) then Exit;
end;

//
// Evento de click no c�digo sugerido.
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.edtCodigoCadastradoClick(Sender: TObject);
var
  locFormulario      : TPlataformaERPVCLRotinaAplicacaoCadastro;
  locDadosAtualizados: Boolean;
begin
  locFormulario := TPlataformaERPVCLRotinaAplicacaoCadastro.Create(Self);

  locFormulario.pubRotinaAplicacaoBaseID := StringIntegerConverter(edtCodigoCadastradoBaseID.Text);
  locFormulario.pubRotinaAplicacaoID     := StringIntegerConverter(edtCodigoCadastradoID.Text);

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
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.edtDescricaoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtDescricao) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoCadastro.edtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLRotinaAplicacaoCadastro.edtDescricaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoCadastro.edtDescricaoExit(Sender: TObject);
begin
  if not VCLEditSair(edtDescricao) then Exit;
end;

//
// Eventos do componente "chave".
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.edtChaveEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtChave) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoCadastro.edtChaveKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLRotinaAplicacaoCadastro.edtChaveExit(Sender: TObject);
begin
  if not VCLEditSair(edtChave) then Exit;
end;

//
// Eventos do componente "bloqueado".
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.chkBloqueadoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkBloqueado) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoCadastro.chkBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLRotinaAplicacaoCadastro.chkBloqueadoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkBloqueado) then Exit;
end;

//
// Ativo.
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.chkAtivoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkAtivo) then Exit;
end;

procedure TPlataformaERPVCLRotinaAplicacaoCadastro.chkAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLRotinaAplicacaoCadastro.chkAtivoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkAtivo) then Exit;
end;

//
// Evento de click na data de cria��o.
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.edtInsLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtInsLocalDtHr.Text));
end;

//
// Evento de click na data da �ltima altera��o.
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.edtUpdLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtUpdLocalDtHr.Text));
end;

//
// Evento de click no bot�o "novo".
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.btnNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

//
// Evento de click no bot�o "alterar".
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.btnAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

//
// Evento de click no bot�o "gravar".
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no bot�o "minimizar".
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "cancelar".
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.btnCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.FormularioLimpar;
begin 
  //
  // Posiciona pagecontrole na primeira aba.
  //
  VCLPageControlInicializar(pagFormulario);

  // Limpa componentes da aba "cadastro".
  VCLEditLimpar    (edtCodigo);
  VCLEditLimpar    (edtDescricao);
  VCLEditLimpar    (edtChave);
  VCLCheckBoxLimpar(chkBloqueado);
  VCLCheckBoxLimpar(chkAtivo);

  VCLEditLimpar(edtCodigoCadastrado);
  VCLEditLimpar(edtCodigoCadastradoID);
  VCLEditLimpar(edtCodigoCadastradoBaseID);

  //
  // Limpa componentes da aba "auditoria".
  //
  VCLEditLimpar(edtRotinaAplicacaoBaseID);
  VCLEditLimpar(edtRotinaAplicacaoBaseDescricao);
  VCLEditLimpar(edtRotinaAplicacaoID);
  VCLEditLimpar(edtInsLocalDtHr);
  VCLEditLimpar(edtUpdLocalDtHr);
  VCLEditLimpar(edtUpdContador);
end;

//
// Procedimento para controlar os componentes do formul�rio.
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.FormularioControlar(argEditar: Boolean);
var
  locDadosPopulados: Boolean;
  locIdentificador : string;
begin
  //
  // Determina se existem dados populados no formul�rio.
  //
  locDadosPopulados := (StringIntegerConverter(edtRotinaAplicacaoID.Text) > 0);

  //
  // Controla os componentes do formul�rio.
  //
  VCLEditControlar(edtCodigo,    argEditar);
  VCLEditControlar(edtDescricao, argEditar);
  gbxOpcoes.Enabled := argEditar;

  //
  // Exibe o �ltimo c�digo cadastrado somente se for um novo cadastro.
  //
  lblCodigoCadastrado.Visible := (argEditar) and (not locDadosPopulados);
  edtCodigoCadastrado.Visible := (argEditar) and (not locDadosPopulados);

  //
  // Controla os componentes de exibi��o de cadastro.
  //
  VCLEditClickControlar(edtRotinaAplicacaoBaseDescricao, True);
  VCLEditClickControlar(edtInsLocalDtHr,                 True);
  VCLEditClickControlar(edtUpdLocalDtHr,                 True);

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
  tabCadastro.TabVisible  := Plataforma_ERP_UsuarioRotina('ERP_ROTINA_APLICACAO_CADASTRO_ABA_CADASTRO');
  tabAuditoria.TabVisible := Plataforma_ERP_UsuarioRotina('ERP_ROTINA_APLICACAO_CADASTRO_ABA_AUDITORIA');
      
  mniAtualizar.Visible := (mniAtualizar.Visible) and (Plataforma_ERP_UsuarioRotina('ERP_ROTINA_APLICACAO_CADASTRO_ATUALIZAR'));
  mniNovo.Visible      := (mniNovo.Visible)      and (Plataforma_ERP_UsuarioRotina('ERP_ROTINA_APLICACAO_CADASTRO_NOVO'));
  mniExcluir.Visible   := (mniExcluir.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_ROTINA_APLICACAO_CADASTRO_EXCLUIR'));
  mniAlterar.Visible   := (mniAlterar.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_ROTINA_APLICACAO_CADASTRO_ALTERAR'));

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
  Self.Caption     := 'Rotina aplica��o';
  locIdentificador := ': ' + edtDescricao.Text;

  if (not locDadosPopulados) and (argEditar) then Self.Caption := Self.Caption + ' - novo cadastro';
  if locDadosPopulados and argEditar         then Self.Caption := Self.Caption + ' - alterando cadastro'   + locIdentificador;
  if locDadosPopulados and (not argEditar)   then Self.Caption := Self.Caption + ' - consultando cadastro' + locIdentificador;
end;

//
// Procedimento para atualizar os dados populados nos componentes do formul�rio.
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.FormularioAtualizar;
begin
  //
  // Popula componentes com as informa��es do cadastro.
  //
  FormularioPopular(StringIntegerConverter(edtRotinaAplicacaoBaseID.Text), StringIntegerConverter(edtRotinaAplicacaoID.Text));

  //
  // Controla a exibi��o dos componentes.
  //
  FormularioControlar(False);
end;

//
// Procedimento para iniciar a digita��o de dados de um novo cadastro.
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.FormularioNovo;
begin
  //
  // Limpa os componentes do formul�rio.
  //
  FormularioLimpar;

  //
  // Carrega conte�do dos campos necess�rios.
  //
  edtRotinaAplicacaoBaseID.Text        := IntegerStringConverter(gloBaseID, True);
  edtRotinaAplicacaoBaseDescricao.Text := gloBaseDescricao;  
  edtRotinaAplicacaoID.Text            := STR_NOVO;
  chkAtivo.Checked                     := True;

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
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.FormularioPopular(argRotinaAplicacaoBaseID: Integer; argRotinaAplicacaoID: Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
  ERRO_MENSAGEM    : string = 'Imposs�vel consultar dados da rotina da aplica��o!';
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
  // Consulta dados da rotina da aplica��o.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                          ');
  locADOQuery.SQL.Add('  [base].[base_id]   AS [rotina_aplicacao_base_id],                             ');
  locADOQuery.SQL.Add('  [base].[descricao] AS [rotina_aplicacao_base_descricao],                      ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[rotina_aplicacao_id],                                     ');  
  locADOQuery.SQL.Add('  [rotina_aplicacao].[codigo],                                                  ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[descricao],                                               ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[chave],                                                   ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[bloqueado],                                               ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[ativo],                                                   ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[ins_local_dt_hr],                                         ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[upd_local_dt_hr],                                         ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[upd_contador]                                             ');  
  locADOQuery.SQL.Add('FROM                                                                            ');
  locADOQuery.SQL.Add('  [rotina_aplicacao] WITH (NOLOCK)                                              ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                                               ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [rotina_aplicacao].[rotina_aplicacao_base_id]         ');
  locADOQuery.SQL.Add('WHERE                                                                           ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[rotina_aplicacao_base_id] = :rotina_aplicacao_base_id AND ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[rotina_aplicacao_id]      = :rotina_aplicacao_id          ');

  locADOQuery.Parameters.ParamByName('rotina_aplicacao_base_id').Value := argRotinaAplicacaoBaseID;
  locADOQuery.Parameters.ParamByName('rotina_aplicacao_id').Value      := argRotinaAplicacaoID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [rotina_aplicacao]!';
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
    edtCodigo.Text       := locADOQuery.FieldByName('codigo').AsString;
    edtDescricao.Text    := locADOQuery.FieldByName('descricao').AsString;
    edtChave.Text        := locADOQuery.FieldByName('chave').AsString;
    chkBloqueado.Checked := StringBooleanConverter(locADOQuery.FieldByName('bloqueado').AsString);
    chkAtivo.Checked     := StringBooleanConverter(locADOQuery.FieldByName('ativo').AsString);

    edtRotinaAplicacaoBaseID.Text        := IntegerStringConverter(locADOQuery.FieldByName('rotina_aplicacao_base_id').AsInteger, True);
    edtRotinaAplicacaoBaseDescricao.Text := locADOQuery.FieldByName('rotina_aplicacao_base_descricao').AsString;
  
    edtRotinaAplicacaoID.Text := IntegerStringConverter(locADOQuery.FieldByName('rotina_aplicacao_id').AsInteger, True);
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
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.FormularioAlterar;
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
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioGravar';
  ERRO_MENSAGEM    : string = 'Imposs�vel gravar dados da rotina da aplica��o!';
var
  locADOConnection          : TADOConnection;
  locADOQuery               : TADOQuery;
  locLogMensagem            : string;

  locInsert                 : Boolean;
  locRegistroAcao           : Byte;
  locRotinaAplicacaoLogSq   : Integer;
  locRotinaAplicacaoLogMsg  : string;
  locRotinaAplicacaoLogDados: string;

  locRotinaAplicacaoBaseID: Integer;
  locRotinaAplicacaoID  : Integer;
  locCodigo             : string;
  locDescricao          : string;
  locChave              : string;
  locBloqueado          : Boolean;
  locAtivo              : Boolean;
  locInsLocalDtHr       : TDateTime;
  locUpdLocalDtHr       : TDateTime;
  locUsuarioBaseID      : Integer;
  locUsuarioID          : Integer;
  locUpdContador        : Integer;
  locHostName           : string;
  locUserName           : string;
begin
  //
  // Determina se ser� um insert ou update.
  //
  if edtRotinaAplicacaoID.Text = STR_NOVO then
    locInsert := True
  else
    locInsert := False;

  //
  // Carrega vari�veis com o conte�do dos componentes.
  //
  locRotinaAplicacaoBaseID := StringIntegerConverter(edtRotinaAplicacaoBaseID.Text);
  locRotinaAplicacaoID     := StringIntegerConverter(edtRotinaAplicacaoID.Text);
  locCodigo                := StringTrim(edtCodigo.Text);
  locDescricao             := StringTrim(edtDescricao.Text);
  locChave                 := StringTrim(edtChave.Text);
  locBloqueado             := chkBloqueado.Checked;
  locAtivo                 := chkAtivo.Checked;
  locUsuarioBaseID         := gloUsuarioBaseID;
  locUsuarioID             := gloUsuarioID;
  locHostName              := HostNameRecuperar;
  locUserName              := UserNameRecuperar;
  locUpdContador           := StringIntegerConverter(edtUpdContador.Text);

  //
  // Consiste as informa��es.
  //
  if locCodigo = '' then
  begin
    VCLConsistenciaExibir('O c�digo da rotina da aplica��o deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
    Exit;
  end;

  if locDescricao = '' then
  begin
    VCLConsistenciaExibir('A descri��o da rotina da aplica��o deve ser informada!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtDescricao);
    Exit;
  end;

  if locChave = '' then
  begin
    VCLConsistenciaExibir('A chave da rotina da aplica��o deve ser informada!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtChave);
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
  // Determina se o c�digo da rotina da aplica��o j� existe no banco de dados para um outro registro.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                                                                    ');
  locADOQuery.SQL.Add('  1                                                                             ');
  locADOQuery.SQL.Add('FROM                                                                            ');
  locADOQuery.SQL.Add('  [rotina_aplicacao] WITH (NOLOCK)                                              ');
  locADOQuery.SQL.Add('WHERE                                                                           ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[rotina_aplicacao_base_id] = :rotina_aplicacao_base_id AND ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[codigo]                   = :codigo                   AND ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[rotina_aplicacao_id]     <> :rotina_aplicacao_id          ');

  locADOQuery.Parameters.ParamByName('rotina_aplicacao_base_id').Value := locRotinaAplicacaoBaseID;
  locADOQuery.Parameters.ParamByName('codigo').Value                   := locCodigo;
  locADOQuery.Parameters.ParamByName('rotina_aplicacao_id').Value      := locRotinaAplicacaoID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar o mesmo c�digo de rotina da aplica��o em um outro registro!';
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
    locLogMensagem := 'O c�digo "' + locCodigo + '" informado para a rotina da aplica��o j� existe em algum outro cadastro!';
    Plataforma_ERP_Logar(False, ERRO_MENSAGEM, locLogMensagem, FONTE_NOME, PROCEDIMENTO_NOME);
    VCLConsistenciaExibir(ERRO_MENSAGEM, locLogMensagem);
    Exit;
  end;

  //
  // Determina se a chave da rotina da aplica��o j� existe no banco de dados para um outro registro.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                                                                    ');
  locADOQuery.SQL.Add('  1                                                                             ');
  locADOQuery.SQL.Add('FROM                                                                            ');
  locADOQuery.SQL.Add('  [rotina_aplicacao] WITH (NOLOCK)                                              ');
  locADOQuery.SQL.Add('WHERE                                                                           ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[rotina_aplicacao_base_id] = :rotina_aplicacao_base_id AND ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[chave]                    = :chave                    AND ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[rotina_aplicacao_id]     <> :rotina_aplicacao_id          ');

  locADOQuery.Parameters.ParamByName('rotina_aplicacao_base_id').Value := locRotinaAplicacaoBaseID;
  locADOQuery.Parameters.ParamByName('chave').Value                    := locChave;
  locADOQuery.Parameters.ParamByName('rotina_aplicacao_id').Value      := locRotinaAplicacaoID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar a mesma chave de rotina da aplica��o em um outro registro!';
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
    locLogMensagem := 'A chave "' + locChave + '" informada para a rotina da aplica��o j� existe em algum outro cadastro!';
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
    locADOQuery.SQL.Add('SELECT                                                                          ');
    locADOQuery.SQL.Add('  [rotina_aplicacao].[upd_contador]                                             ');
    locADOQuery.SQL.Add('FROM                                                                            ');
    locADOQuery.SQL.Add('  [rotina_aplicacao] WITH (NOLOCK)                                              ');
    locADOQuery.SQL.Add('WHERE                                                                           ');
    locADOQuery.SQL.Add('  [rotina_aplicacao].[rotina_aplicacao_base_id] = :rotina_aplicacao_base_id AND ');
    locADOQuery.SQL.Add('  [rotina_aplicacao].[rotina_aplicacao_id]      = :rotina_aplicacao_id          ');

    locADOQuery.Parameters.ParamByName('rotina_aplicacao_base_id').Value := locRotinaAplicacaoBaseID;
    locADOQuery.Parameters.ParamByName('rotina_aplicacao_id').Value      := locRotinaAplicacaoID;

    try
      locADOQuery.Open;
    except
      on locExcecao: Exception do
      begin
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualiza��es confere na tabela [rotina_aplicacao]!';
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
    locRegistroAcao          := REGISTRO_ACAO_CRIACAO;
    locRotinaAplicacaoLogMsg := MENSAGEM_REGISTRO_ACAO_CRIADO;
  end
  else
  begin
    locRegistroAcao          := REGISTRO_ACAO_ALTERACAO;
    locRotinaAplicacaoLogMsg := MENSAGEM_REGISTRO_ACAO_ALTERADO;
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
  // Determina o pr�ximo ID da rotina da aplica��o.
  //
  if locInsert then
  begin
    try
      locRotinaAplicacaoID := Plataforma_ERP_ADO_NumeradorBaseDeterminar(locADOConnection,
                                                                         locRotinaAplicacaoBaseID, 
                                                                         NUMERADOR_ROTINA_APLICACAO_ID);
    except
      on locExcecao: Exception do
      begin
        locADOConnection.RollbackTrans;
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Imposs�vel determinar o pr�ximo numerador para a rotina da aplica��o!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
        Exit
      end;
    end;
  end;

  //
  // Grava dados na tabela rotina_aplicacao.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;

  if locInsert then
  begin
    //
    // Insere dados.
    //
    locADOQuery.SQL.Add('INSERT INTO [rotina_aplicacao] (');
    locADOQuery.SQL.Add('  [rotina_aplicacao_base_id],   ');
    locADOQuery.SQL.Add('  [rotina_aplicacao_id],        ');
    locADOQuery.SQL.Add('  [codigo],                     ');
    locADOQuery.SQL.Add('  [descricao],                  ');
    locADOQuery.SQL.Add('  [chave],                      ');
    locADOQuery.SQL.Add('  [bloqueado],                  ');
    locADOQuery.SQL.Add('  [ativo],                      ');
    locADOQuery.SQL.Add('  [ins_local_dt_hr],            ');
    locADOQuery.SQL.Add('  [ins_server_dt_hr],           ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr],            ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr],           ');
    locADOQuery.SQL.Add('  [upd_contador]                ');  
    locADOQuery.SQL.Add(')                               ');
    locADOQuery.SQL.Add('VALUES (                        ');
    locADOQuery.SQL.Add('  :rotina_aplicacao_base_id,    '); // [rotina_aplicacao_base_id].
    locADOQuery.SQL.Add('  :rotina_aplicacao_id,         '); // [rotina_aplicacao_id].
    locADOQuery.SQL.Add('  :codigo,                      '); // [codigo].
    locADOQuery.SQL.Add('  :descricao,                   '); // [descricao].
    locADOQuery.SQL.Add('  :chave,                       '); // [chave].
    locADOQuery.SQL.Add('  :bloqueado,                   '); // [bloqueado].
    locADOQuery.SQL.Add('  :ativo,                       '); // [ativo].
    locADOQuery.SQL.Add('  :local_dt_hr,                 '); // [ins_local_dt_hr].
    locADOQuery.SQL.Add('  GETDATE(),                    '); // [ins_server_dt_hr].
    locADOQuery.SQL.Add('  NULL,                         '); // [upd_local_dt_hr].
    locADOQuery.SQL.Add('  NULL,                         '); // [upd_server_dt_hr].
    locADOQuery.SQL.Add('  0                             '); // [upd_contador].
    locADOQuery.SQL.Add(')                               ');
  end
  else
  begin
    //
    // Atualiza dados.
    //
    locADOQuery.SQL.Add('UPDATE                                                       ');
    locADOQuery.SQL.Add('  [rotina_aplicacao]                                         ');
    locADOQuery.SQL.Add('SET                                                          ');
    locADOQuery.SQL.Add('  [codigo]           = :codigo,                              ');
    locADOQuery.SQL.Add('  [descricao]        = :descricao,                           ');
    locADOQuery.SQL.Add('  [chave]            = :chave,                               ');
    locADOQuery.SQL.Add('  [bloqueado]        = :bloqueado,                           ');
    locADOQuery.SQL.Add('  [ativo]            = :ativo,                               ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr]  = :local_dt_hr,                         ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr] = GETDATE(),                            ');
    locADOQuery.SQL.Add('  [upd_contador]     = [upd_contador] + 1                    ');
    locADOQuery.SQL.Add('WHERE                                                        ');
    locADOQuery.SQL.Add('  [rotina_aplicacao_base_id] = :rotina_aplicacao_base_id AND ');
    locADOQuery.SQL.Add('  [rotina_aplicacao_id]      = :rotina_aplicacao_id          ');
  end;

  //
  // Par�metros.
  //
  locADOQuery.Parameters.ParamByName('rotina_aplicacao_base_id').Value  := locRotinaAplicacaoBaseID;
  locADOQuery.Parameters.ParamByName('rotina_aplicacao_id').Value       := locRotinaAplicacaoID;
  locADOQuery.Parameters.ParamByName('codigo').Value                    := locCodigo;
  locADOQuery.Parameters.ParamByName('descricao').Value                 := locDescricao;
  locADOQuery.Parameters.ParamByName('chave').Value                     := locChave;
  locADOQuery.Parameters.ParamByName('bloqueado').Value                 := BooleanStringConverter(locBloqueado);
  locADOQuery.Parameters.ParamByName('ativo').Value                     := BooleanStringConverter(locAtivo);
  locADOQuery.Parameters.ParamByName('local_dt_hr').Value               := Now;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [rotina_aplicacao]!';
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
  locADOQuery.SQL.Add('SELECT                                                                          ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[ins_local_dt_hr],                                         ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[upd_local_dt_hr],                                         ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[upd_contador]                                             ');
  locADOQuery.SQL.Add('FROM                                                                            ');
  locADOQuery.SQL.Add('  [rotina_aplicacao]                                                            ');
  locADOQuery.SQL.Add('WHERE                                                                           ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[rotina_aplicacao_base_id] = :rotina_aplicacao_base_id AND ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[rotina_aplicacao_id]      = :rotina_aplicacao_id          ');

  locADOQuery.Parameters.ParamByName('rotina_aplicacao_base_id').Value := locRotinaAplicacaoBaseID;
  locADOQuery.Parameters.ParamByName('rotina_aplicacao_id').Value      := locRotinaAplicacaoID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o novo contador de updates do registro na tabela [rotina_aplicacao]!';
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
  locRotinaAplicacaoLogDados := LogDadosGerar(locRotinaAplicacaoID);

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
  edtRotinaAplicacaoID.Text := IntegerStringConverter(locRotinaAplicacaoID);
  edtInsLocalDtHr.Text      := DateTimeStringConverter(locInsLocalDtHr, 'dd/mm/yyyy hh:nn:ss');
  edtUpdLocalDtHr.Text      := DateTimeStringConverter(locUpdLocalDtHr, 'dd/mm/yyyy hh:nn:ss');
  edtUpdContador.Text       := IntegerStringConverter(locUpdContador);

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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, locRotinaAplicacaoID, locCodigo, 'rotina_aplicacao', locRotinaAplicacaoLogMsg, locRotinaAplicacaoLogDados);
  except
    on locExcecao: Exception do
    begin
      VCLErroExibir(locExcecao.Message);
    end;
  end;

  //
  // Rotina da aplica��o gravada!
  //
  VCLInformacaoExibir('Rotina da aplica��o gravada com sucesso!');
end;

//
// Procedimento para excluir os dados deste cadastro.
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.FormularioExcluir;
const
  PROCEDIMENTO_NOME: string = 'FormularioExcluir';
  ERRO_MENSAGEM    : string = 'Imposs�vel excluir dados da rotina da aplica��o!';
var
  locADOConnection          : TADOConnection;
  locADOQuery               : TADOQuery;
  locLogMensagem            : string;
  locRotinaAplicacaoBaseID  : Integer;
  locRotinaAplicacaoID      : Integer;
  locRotinaAplicacaoLogDados: string;
begin
  //
  // Carrega vari�veis com o conte�do dos componentes.
  //
  locRotinaAplicacaoBaseID := StringIntegerConverter(edtRotinaAplicacaoBaseID.Text);
  locRotinaAplicacaoID     := StringIntegerConverter(edtRotinaAplicacaoID.Text);

  //
  // Log dados.
  //
  locRotinaAplicacaoLogDados := LogDadosGerar;

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

{
  //
  // Verifica se existem registros na tabela de usu�rio que impediriam a exclus�o.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                                                                                                      ');
  locADOQuery.SQL.Add('  [perfil_usuario].[descricao]                                                                                    ');
  locADOQuery.SQL.Add('FROM                                                                                                              ');
  locADOQuery.SQL.Add('  [perfil_usuario] WITH (NOLOCK)                                                                                  ');
  locADOQuery.SQL.Add('  INNER JOIN [perfil_usuario_rotina_aplicacao] WITH (NOLOCK)                                                      ');
  locADOQuery.SQL.Add('    ON [perfil_usuario_rotina_aplicacao].[licenca_id]             = [perfil_usuario].[licenca_id]             AND ');
  locADOQuery.SQL.Add('       [perfil_usuario_rotina_aplicacao].[perfil_usuario_base_id] = [perfil_usuario].[perfil_usuario_base_id] AND ');
  locADOQuery.SQL.Add('       [perfil_usuario_rotina_aplicacao].[perfil_usuario_id]      = [perfil_usuario].[perfil_usuario_id]          ');
  locADOQuery.SQL.Add('WHERE                                                                                                             ');
  locADOQuery.SQL.Add('  [perfil_usuario_rotina_aplicacao].[rotina_aplicacao_base_id] = :rotina_aplicacao_base_id AND                    ');
  locADOQuery.SQL.Add('  [perfil_usuario_rotina_aplicacao].[rotina_aplicacao_id]      = :rotina_aplicacao_id                             ');

  locADOQuery.Parameters.ParamByName('rotina_aplicacao_base_id').Value := locRotinaAplicacaoBaseID;
  locADOQuery.Parameters.ParamByName('rotina_aplicacao_id').Value      := locRotinaAplicacaoID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar a query para verificar se a rotina da aplica��o existe para algum outro cadastro!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_TENTE_NOVAMENTE, locExcecao.Message);
      Exit
    end;
  end;

  if locADOQuery.RecordCount > 0 then
  begin
    locLogMensagem := 'Essa rotina da aplica��o existe no cadastro do perfil "' + locADOQuery.FieldByName('nome').AsString + '"!';
    
    locADOQuery.Close;
    FreeAndNil(locADOQuery);
    locADOConnection.Close;
    FreeAndNil(locADOConnection);

    VCLConsistenciaExibir(ERRO_MENSAGEM, locLogMensagem, ERRO_MENSAGEM_CONSISTENCIA_EXCLUSAO);
    Exit;
  end;
}

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
  // Comando SQL para excluir um registro da tabela rotina_aplicacao.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                                                                     ');
  locADOQuery.SQL.Add('  [rotina_aplicacao]                                                            ');
  locADOQuery.SQL.Add('WHERE                                                                           ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[rotina_aplicacao_base_id] = :rotina_aplicacao_base_id AND ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[rotina_aplicacao_id]      = :rotina_aplicacao_id          ');

  locADOQuery.Parameters.ParamByName('rotina_aplicacao_base_id').Value := locRotinaAplicacaoBaseID;
  locADOQuery.Parameters.ParamByName('rotina_aplicacao_id').Value      := locRotinaAplicacaoID;

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
      locLogMensagem := 'Ocorreu algum problema ao executar query para deletar os registros na tabela [rotina_aplicacao]!';
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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(REGISTRO_ACAO_EXCLUSAO, locRotinaAplicacaoID, edtCodigo.Text, 'rotina_aplicacao', 'Registro exclu�do com sucesso!', locRotinaAplicacaoLogDados);
  except
  end;
  VCLInformacaoExibir('Rotina da aplica��o exclu�da com sucesso!');
end;

//
// Procedimento para cancelar a edi��o dos dados do formul�rio.
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.FormularioCancelar;
var
  locRotinaAplicacaoBaseID: Integer;
  locRotinaAplicacaoID    : Integer;
begin
  //
  // Carrega chave do registro que estava sendo editado.
  //
  locRotinaAplicacaoBaseID := StringIntegerConverter(edtRotinaAplicacaoBaseID.Text);
  locRotinaAplicacaoID     := StringIntegerConverter(edtRotinaAplicacaoID.Text);

  //
  // Confirma com o usu�rio.
  //
  if locRotinaAplicacaoID = 0 then
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
  FormularioPopular(locRotinaAplicacaoBaseID, locRotinaAplicacaoID);

  //
  // Componentes desligados para edi��o.
  //
  FormularioControlar(False);
end;

//
// Procedimento par sugerir o pr�ximo c�digo.
//
procedure TPlataformaERPVCLRotinaAplicacaoCadastro.FormularioCodigoSugerir;
const
  PROCEDIMENTO_NOME: string = 'FormularioCodigoSugerir';
  ERRO_MENSAGEM    : string = 'Imposs�vel sugerir informa��es sobre o pr�ximo c�digo da rotina da aplica��o!';
var
  locADOConnection        : TADOConnection;
  locADOQuery             : TADOQuery;
  locLogMensagem          : string;
  locRotinaAplicacaoBaseID: Integer;
begin
  //
  // ID da base.
  //
  locRotinaAplicacaoBaseID := gloBaseID;

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
  locADOQuery.SQL.Add('SELECT TOP 1                                                                ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[rotina_aplicacao_base_id],                            ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[rotina_aplicacao_id],                                 ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[codigo]                                               ');
  locADOQuery.SQL.Add('FROM                                                                        ');
  locADOQuery.SQL.Add('  [rotina_aplicacao] WITH (NOLOCK)                                          ');
  locADOQuery.SQL.Add('WHERE                                                                       ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[rotina_aplicacao_base_id] = :rotina_aplicacao_base_id ');
  locADOQuery.SQL.Add('ORDER BY                                                                    ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[ins_server_dt_hr] DESC,                               ');
  locADOQuery.SQL.Add('  [rotina_aplicacao].[codigo] DESC                                          ');

  locADOQuery.Parameters.ParamByName('rotina_aplicacao_base_id').Value := locRotinaAplicacaoBaseID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar �ltimo cadastro na tabela [rotina_aplicacao]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Registro encontrado ent�o carrega componentes.
  //
  if locADOQuery.RecordCount >= 0 then
  begin
    edtCodigoCadastrado.Text       := locADOQuery.FieldByName('codigo').AsString;
    edtCodigoCadastradoBaseID.Text := IntegerStringConverter(locADOQuery.FieldByName('rotina_aplicacao_base_id').AsInteger);
    edtCodigoCadastradoID.Text     := IntegerStringConverter(locADOQuery.FieldByName('rotina_aplicacao_id').AsInteger);

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
function TPlataformaERPVCLRotinaAplicacaoCadastro.LogDadosGerar(argRotinaAplicacaoID: Integer = 0): string;
var
  locRotinaAplicacaoID: Integer;
begin
  if argRotinaAplicacaoID <= 0 then
    locRotinaAplicacaoID := StringIntegerConverter(edtRotinaAplicacaoID.Text)
  else
    locRotinaAplicacaoID := argRotinaAplicacaoID;

  Result := '';
  LogDadosStringDescrever ('ID da base da rotina da aplica��o', edtRotinaAplicacaoBaseID.Text, Result);
  LogDadosIntegerDescrever('ID da rotina da aplica��o',         locRotinaAplicacaoID,          Result);
  LogDadosStringDescrever ('C�digo',                            edtCodigo.Text,                Result);
  LogDadosStringDescrever ('Descri��o',                         edtDescricao.Text,             Result);
  LogDadosStringDescrever ('Chave',                             edtChave.Text,                 Result);
  LogDadosBooleanDescrever('Bloqueado',                         chkBloqueado.Checked,          Result);
  LogDadosBooleanDescrever('Ativo',                             chkAtivo.Checked,              Result);
end;

end.
