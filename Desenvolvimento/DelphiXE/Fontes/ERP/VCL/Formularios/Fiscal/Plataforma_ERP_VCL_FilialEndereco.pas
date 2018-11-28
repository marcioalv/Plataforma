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
  Data.Win.ADODB, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.Mask;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_FilialEndereco.pas';

  TAB_CADASTRO : Byte = 0;
  TAB_AUDITORIA: Byte = 1;

  LVW_LISTA_SQ      : Integer = 0;
  LVW_LISTA_VIGENCIA: Integer = 1;

type
  TPlataformaERPVCLFilialEndereco = class(TForm)
    imgBackground: TImage;
    imgFormulario: TImage;
    btnMinimizar: TBitBtn;
    btnFechar: TBitBtn;
    mnuFormulario: TMainMenu;
    mniAtualizar: TMenuItem;
    mniNovo: TMenuItem;
    mniAlterar: TMenuItem;
    mniExcluir: TMenuItem;
    mniGravar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniCancelar: TMenuItem;
    mniFechar: TMenuItem;
    panFormulario: TPanel;
    lvwLista: TListView;
    pagFormulario: TPageControl;
    tabCadastro: TTabSheet;
    tabAuditoria: TTabSheet;
    mskVigenciaIniDt: TMaskEdit;
    imgVigenciaFimDtSelecionar: TImage;
    imgVigenciaIniDtSelecionar: TImage;
    mskVigenciaFimDt: TMaskEdit;
    edtSequencial: TEdit;
    lblVigenciaAte: TLabel;
    lblVigencia: TLabel;
    lblSequencial: TLabel;
    lblInsDtHt: TLabel;
    edtInsLocalDtHr: TEdit;
    lblUpdDtHr: TLabel;
    edtUpdLocalDtHr: TEdit;
    lblUpdContador: TLabel;
    edtUpdContador: TEdit;
    btnLog: TBitBtn;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnGravar: TBitBtn;
    mniAdicional: TMenuItem;
    mniLog: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mskVigenciaIniDtEnter(Sender: TObject);
    procedure mskVigenciaIniDtKeyPress(Sender: TObject; var Key: Char);
    procedure mskVigenciaIniDtKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mskVigenciaIniDtExit(Sender: TObject);
    procedure mskVigenciaFimDtEnter(Sender: TObject);
    procedure mskVigenciaFimDtExit(Sender: TObject);
    procedure mskVigenciaFimDtKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mskVigenciaFimDtKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mniGravarClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
    procedure lvwListaSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure mniAtualizarClick(Sender: TObject);
    procedure mniNovoClick(Sender: TObject);
    procedure mniAlterarClick(Sender: TObject);
    procedure mniExcluirClick(Sender: TObject);
    procedure mniCancelarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure mniLogClick(Sender: TObject);
  private
    procedure FormularioLimpar(argLista: Boolean = True;
                               argDados: Boolean = True);

    procedure FormularioControlar(argEditar: Boolean);

    procedure FormularioListaPopular(argLicencaID   : Integer;
                                     argFilialBaseID: Integer;
                                     argFilialID    : Integer);

    procedure FormularioDadosPopular(argLicencaID       : Integer;
                                     argFilialBaseID    : Integer;
                                     argFilialID        : Integer;
                                     argFilialEnderecoSq: Integer);
    procedure FormularioGravar;
  public
    pubDadosAtualizados: Boolean;
    pubLicencaID       : Integer;
    pubFilialBaseID    : Integer;
    pubFilialID        : Integer;
  end;

var
  PlataformaERPVCLFilialEndereco: TPlataformaERPVCLFilialEndereco;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLFilialEndereco.FormCreate(Sender: TObject);
begin
  //
  // Vari�veis p�blicas.
  //
  pubDadosAtualizados := False;
  pubLicencaID        := 0;
  pubFilialBaseID     := 0;
  pubFilialID         := 0;

  //
  // Controla os componentes de exibi��o de cadastro.
  //
  VCLMaskEditClickControlar(mskVigenciaIniDt, False);
  VCLMaskEditClickControlar(mskVigenciaFimDt, False);
  VCLEditClickControlar    (edtInsLocalDtHr,  False);
  VCLEditClickControlar    (edtUpdLocalDtHr,  False);
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

  //
  // Carrega dados.
  //
  if (pubLicencaID > 0) and (pubFilialBaseID > 0) and (pubFilialID > 0) then
  begin
    FormularioListaPopular(pubLicencaID, pubFilialBaseID, pubFilialID);
    FormularioControlar(False);
    Exit;
  end;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLFilialEndereco.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click na op��o de menu "log altera��es".
//
procedure TPlataformaERPVCLFilialEndereco.mniLogClick(Sender: TObject);
begin
  Exit;
end;

//
// Evento de click na op��o de menu "atualizar".
//
procedure TPlataformaERPVCLFilialEndereco.mniAtualizarClick(Sender: TObject);
begin
  FormularioListaPopular(pubLicencaID, pubFilialBaseID, pubFilialID);
end;

//
// Evento de click na op��o de menu "novo".
//
procedure TPlataformaERPVCLFilialEndereco.mniNovoClick(Sender: TObject);
begin
  Exit;
end;

//
// Evento de click na op��o de menu "alterar".
//
procedure TPlataformaERPVCLFilialEndereco.mniAlterarClick(Sender: TObject);
begin
  Exit;
end;

//
// Evento de click na op��o de menu "excluir".
//
procedure TPlataformaERPVCLFilialEndereco.mniExcluirClick(Sender: TObject);
begin
  Exit;
end;

//
// Evento de click na op��o de menu "gravar".
//
procedure TPlataformaERPVCLFilialEndereco.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click na op�ao de menu "minimizar".
//
procedure TPlataformaERPVCLFilialEndereco.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click na op��o de menu "cancelar".
//
procedure TPlataformaERPVCLFilialEndereco.mniCancelarClick(Sender: TObject);
begin
  Exit;
end;

//
// Evento de click na op��o de menu "fechar".
//
procedure TPlataformaERPVCLFilialEndereco.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente lvwLista.
//
procedure TPlataformaERPVCLFilialEndereco.lvwListaSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  locSequencial: Integer;
begin
  locSequencial := StringIntegerConverter(Item.SubItems.Strings[LVW_LISTA_SQ]);

  FormularioDadosPopular(pubLicencaID, pubFilialBaseID, pubFilialID, locSequencial);
end;

//
// Vig�ncia inicial.
//
procedure TPlataformaERPVCLFilialEndereco.mskVigenciaIniDtEnter(Sender: TObject);
begin
  Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.mskVigenciaIniDtKeyPress(Sender: TObject; var Key: Char);
begin
  Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.mskVigenciaIniDtKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.mskVigenciaIniDtExit(Sender: TObject);
begin
  Exit;
end;

//
// Vig�ncia final.
//
procedure TPlataformaERPVCLFilialEndereco.mskVigenciaFimDtEnter(Sender: TObject);
begin
  Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.mskVigenciaFimDtKeyPress(Sender: TObject; var Key: Char);
begin
  Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.mskVigenciaFimDtKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.mskVigenciaFimDtExit(Sender: TObject);
begin
  Exit;
end;

//
// Evento de click no bot�o "novo".
//
procedure TPlataformaERPVCLFilialEndereco.btnNovoClick(Sender: TObject);
begin
  Exit;
end;

//
// Evento de click no bot�o "alterar".
//
procedure TPlataformaERPVCLFilialEndereco.btnAlterarClick(Sender: TObject);
begin
  Exit;
end;

//
// Evento de click no bot�o "gravar".
//
procedure TPlataformaERPVCLFilialEndereco.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no bot�o "minimizar".
//
procedure TPlataformaERPVCLFilialEndereco.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "cancelar".
//
procedure TPlataformaERPVCLFilialEndereco.btnCancelarClick(Sender: TObject);
begin
  Exit;
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLFilialEndereco.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioLimpar(argLista: Boolean = True;
                                                           argDados: Boolean = True);
begin
  if argLista then
  begin
    VCLListViewLimpar(lvwLista);
  end;

  if argDados then
  begin
    VCLEditLimpar    (edtSequencial);
    VCLMaskEditLimpar(mskVigenciaIniDt);
    VCLMaskEditLimpar(mskVigenciaFimDt);

    VCLEditLimpar(edtInsLocalDtHr);
    VCLEditLimpar(edtUpdLocalDtHr);
    VCLEditLimpar(edtUpdContador);
  end;
end;

//
// Procedimento para controlar os componentes do formul�rio.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioControlar(argEditar: Boolean);
var
  locDadosPopulados: Boolean;
begin
  //
  // Determina se existem dados populados no formul�rio.
  //
  locDadosPopulados := (StringIntegerConverter(edtSequencial.Text) > 0);

  //
  // Controla os componentes do formul�rio.
  //
  VCLMaskEditControlar(mskVigenciaIniDt, argEditar);
  VCLMaskEditControlar(mskVigenciaFimDt, argEditar);

  //
  // Controla os componentes de exibi��o de cadastro.
  //
  VCLMaskEditClickControlar(mskVigenciaIniDt, True);
  VCLMaskEditClickControlar(mskVigenciaFimDt, True);
  VCLEditClickControlar    (edtInsLocalDtHr,  True);
  VCLEditClickControlar    (edtUpdLocalDtHr,  True);

  //
  // Controle os componentes com sele��o de dados.
  //
  VCLMaskEditSelecaoControlar(mskVigenciaIniDt, imgVigenciaIniDtSelecionar, argEditar);
  VCLMaskEditSelecaoControlar(mskVigenciaFimDt, imgVigenciaFimDtSelecionar, argEditar);

  //
  // Controla os itens de menu do formul�rio.
  //
  mniLog.Visible       := (not argEditar) and (locDadosPopulados);
  mniAtualizar.Visible := (not argEditar) and (locDadosPopulados);
  mniNovo.Visible      := (not argEditar);
  mniExcluir.Visible   := (not argEditar) and (locDadosPopulados);
  mniAlterar.Visible   := (not argEditar) and (locDadosPopulados);
  mniGravar.Visible    := argEditar;
  mniCancelar.Visible  := argEditar;
  mniMinimizar.Visible := True;
  mniFechar.Visible    := (not argEditar);

  //
  // Permiss�es de acesso por usu�rio.
  //
  tabCadastro.TabVisible  := Plataforma_ERP_UsuarioRotina('ERP_FILIAL_CADASTRO_ABA_CADASTRO');
  tabAuditoria.TabVisible := Plataforma_ERP_UsuarioRotina('ERP_FILIAL_CADASTRO_ABA_AUDITORIA');

  mniAtualizar.Visible := (mniAtualizar.Visible) and (Plataforma_ERP_UsuarioRotina('ERP_FILIAL_CADASTRO_ATUALIZAR'));
  mniNovo.Visible      := (mniNovo.Visible)      and (Plataforma_ERP_UsuarioRotina('ERP_FILIAL_CADASTRO_NOVO'));
  mniExcluir.Visible   := (mniExcluir.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_FILIAL_CADASTRO_EXCLUIR'));
  mniAlterar.Visible   := (mniAlterar.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_FILIAL_CADASTRO_ALTERAR'));

  //
  // Itens do menu adicional.
  //
  mniLog.Visible := (mniLog.Visible) and (Plataforma_ERP_UsuarioRotina('ERP_FILIAL_CADASTRO_LOG'));

  mniAdicional.Visible := (mniLog.Visible);

  //
  // Bot�es.
  //
  btnLog.Visible       := mniLog.Visible;
  btnNovo.Visible      := mniNovo.Visible;
  btnAlterar.Visible   := mniAlterar.Visible;
  btnGravar.Visible    := mniGravar.Visible;
  btnMinimizar.Visible := mniMinimizar.Visible;
  btnCancelar.Visible  := mniCancelar.Visible;
  btnFechar.Visible    := mniFechar.Visible;

  //
  // Ajusta o t�tulo do formul�rio.
  //
  Self.Caption := 'Endere�o da filial';

  if (not locDadosPopulados) and (argEditar) then Self.Caption := Self.Caption + ' - novo cadastro';
  if locDadosPopulados and argEditar         then Self.Caption := Self.Caption + ' - alterando cadastro';
  if locDadosPopulados and (not argEditar)   then Self.Caption := Self.Caption + ' - consultando cadastro';
end;

//
// Procedimento para popular os componentes com os dados de um cadastro.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioListaPopular(argLicencaID   : Integer;
                                                                 argFilialBaseID: Integer;
                                                                 argFilialID    : Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioListaPopular';
  ERRO_MENSAGEM    : string = 'Imposs�vel consultar dados do endere�o da filial para popular a lista!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
  locListItem     : TListItem;
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
  locADOQuery.SQL.Add('  [filial_endereco].[filial_endereco_sq],                                          ');
  locADOQuery.SQL.Add('  [filial_endereco].[vigencia_ini_dt],                                             ');
  locADOQuery.SQL.Add('  [filial_endereco].[vigencia_fim_dt]                                              ');
  locADOQuery.SQL.Add('FROM                                                                               ');
  locADOQuery.SQL.Add('  [filial_endereco] WITH (NOLOCK)                                                  ');
  locADOQuery.SQL.Add('WHERE                                                                              ');
  locADOQuery.SQL.Add('  [filial_endereco].[licenca_id]     = :licenca_id     AND                         ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_base_id] = :filial_base_id AND                         ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_id]      = :filial_id                                  ');
  locADOQuery.SQL.Add('ORDER BY                                                                           ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_endereco_sq] ASC                                       ');

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar os registros da tabela [filial_endereco]!';
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
    lvwLista.Items.BeginUpdate;
    while not locADOQuery.EOF do
    begin
      locListItem         := lvwLista.Items.Add;
      locListItem.Caption := '';
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('filial_endereco_sq').AsInteger));
      locListItem.SubItems.Add(DateTimeStringConverter(locADOQuery.FieldByName('vigencia_ini_dt').AsDateTime, 'dd/mm/yyyy') + ' at� ' + DateTimeStringConverter(locADOQuery.FieldByName('vigencia_fim_dt').AsDateTime, 'dd/mm/yyyy'));

      locADOQuery.Next;
    end;
    lvwLista.Items.EndUpdate;
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
  // Controla a exibi��o dos componentes.
  //
  FormularioControlar(False);
end;

//
// Procedimento para popular os dados do endere�o selecionado.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioDadosPopular(argLicencaID       : Integer;
                                                                 argFilialBaseID    : Integer;
                                                                 argFilialID        : Integer;
                                                                 argFilialEnderecoSq: Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioDadosPopular';
  ERRO_MENSAGEM    : string = 'Imposs�vel consultar dados do endere�o da filial para popular os componentes!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
  locListItem     : TListItem;
begin
  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Limpa os componentes do formul�rio.
  //
  FormularioLimpar(False, True);

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
  locADOQuery.SQL.Add('SELECT                                                         ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_endereco_sq],                      ');
  locADOQuery.SQL.Add('  [filial_endereco].[vigencia_ini_dt],                         ');
  locADOQuery.SQL.Add('  [filial_endereco].[vigencia_fim_dt],                         ');
  locADOQuery.SQL.Add('  [filial_endereco].[ins_local_dt_hr],                         ');
  locADOQuery.SQL.Add('  [filial_endereco].[upd_local_dt_hr],                         ');
  locADOQuery.SQL.Add('  [filial_endereco].[upd_contador]                             ');
  locADOQuery.SQL.Add('FROM                                                           ');
  locADOQuery.SQL.Add('  [filial_endereco] WITH (NOLOCK)                              ');
  locADOQuery.SQL.Add('WHERE                                                          ');
  locADOQuery.SQL.Add('  [filial_endereco].[licenca_id]         = :licenca_id     AND ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_base_id]     = :filial_base_id AND ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_id]          = :filial_id      AND ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_endereco_sq] = :filial_endereco_sq ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value         := argLicencaID;
  locADOQuery.Parameters.ParamByName('filial_base_id').Value     := argFilialBaseID;
  locADOQuery.Parameters.ParamByName('filial_id').Value          := argFilialID;
  locADOQuery.Parameters.ParamByName('filial_endereco_sq').Value := argFilialEnderecoSq;

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
    edtSequencial.Text    := IntegerStringConverter (locADOQuery.FieldByName('filial_endereco_sq').AsInteger);
    mskVigenciaIniDt.Text := DateTimeStringConverter(locADOQuery.FieldByName('vigencia_ini_dt').AsDateTime, 'dd/mm/yyyy');
    mskVigenciaFimDt.Text := DateTimeStringConverter(locADOQuery.FieldByName('vigencia_fim_dt').AsDateTime, 'dd/mm/yyyy');

    edtInsLocalDtHr.Text  := DateTimeStringConverter(locADOQuery.FieldByName('ins_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn:ss');
    edtUpdLocalDtHr.Text  := DateTimeStringConverter(locADOQuery.FieldByName('upd_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn:ss');
    edtUpdContador.Text   := IntegerStringConverter (locADOQuery.FieldByName('upd_contador').AsInteger);
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
  // Controla a exibi��o dos componentes.
  //
  FormularioControlar(False);
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

  locSequencial            : Integer;
  locVigenciaIniDt         : TDateTime;
  locVigenciaFimDt         : TDateTime;

  locInsLocalDtHr          : TDateTime;
  locUpdLocalDtHr          : TDateTime;
  locUsuarioBaseID         : Integer;
  locUsuarioID             : Integer;
  locUpdContador           : Integer;
  locHostName              : string;
  locUserName              : string;
begin
  //
  // Carrega vari�veis com o conte�do dos componentes.
  //
  locLicencaID          := pubLicencaID;
  locFilialBaseID       := pubFilialBaseID;
  locFilialID           := pubFilialID;

  locSequencial         := StringIntegerConverter(edtSequencial.Text);
  locVigenciaIniDt      := StringDateTimeConverter(mskVigenciaIniDt.Text);
  locVigenciaFimDt      := StringDateTimeConverter(mskVigenciaFimDt.Text);

  locUsuarioBaseID      := gloUsuarioBaseID;
  locUsuarioID          := gloUsuarioID;
  locHostName           := HostNameRecuperar;
  locUserName           := UserNameRecuperar;
  locUpdContador        := StringIntegerConverter(edtUpdContador.Text);

  //
  // Determina se ser� um insert ou update.
  //
  locInsert := True;

  if locSequencial > 0 then locInsert := False;

  //
  // Consiste as informa��es.
  //
  if locVigenciaIniDt <= 0 then
  begin
    VCLConsistenciaExibir('A data inicial da vig�ncia deve ser informada!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, mskVigenciaIniDt);
    Exit;
  end;

  if locVigenciaFimDt <= 0 then
  begin
    VCLConsistenciaExibir('A data final da vig�ncia deve ser informada!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, mskVigenciaFimDt);
    Exit;
  end;

  if locVigenciaFimDt < locVigenciaIniDt then
  begin
    VCLConsistenciaExibir('A data final da vig�ncia n�o pode ser anterior a data inicial!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, mskVigenciaIniDt);
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
  // Determina se a vig�ncia do endere�o se mescla com algum outro.
  //
  
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                                                        ');
  locADOQuery.SQL.Add('  1                                                                 ');
  locADOQuery.SQL.Add('FROM                                                                ');
  locADOQuery.SQL.Add('  [filial_endereco] WITH (NOLOCK)                                   ');
  locADOQuery.SQL.Add('WHERE                                                               ');
  locADOQuery.SQL.Add('  [filial_endereco].[licenca_id]          = :licenca_id         AND ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_base_id]      = :filial_base_id     AND ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_id]           = :filial_id          AND ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_endereco_sq] <> :filial_endereco_sq AND ');
  
  locADOQuery.SQL.Add('  (                                                                                                          ');
  locADOQuery.SQL.Add('    (:vigencia_ini_dt BETWEEN [filial_endereco].[vigencia_ini_dt] AND [filial_endereco].[vigencia_fim_dt]) OR');
  locADOQuery.SQL.Add('    (:vigencia_fim_dt BETWEEN [filial_endereco].[vigencia_ini_dt] AND [filial_endereco].[vigencia_fim_dt])   ');
  locADOQuery.SQL.Add('  )                                                                                                          ');
                                                               
  locADOQuery.Parameters.ParamByName('licenca_id').Value         := locLicencaID;
  locADOQuery.Parameters.ParamByName('filial_base_id').Value     := locFilialBaseID;
  locADOQuery.Parameters.ParamByName('filial_id').Value          := locFilialID;
  locADOQuery.Parameters.ParamByName('filial_endereco_sq').Value := locSequencial;
  locADOQuery.Parameters.ParamByName('vigencia_ini_dt').Value    := locVigenciaIniDt;
  locADOQuery.Parameters.ParamByName('vigencia_fim_dt').Value    := locVigenciaFimDt;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar per�odos de vig�ncia mesclados no cadastro da filial!';
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
    locLogMensagem := 'O per�odo de vig�ncia informado para esse endere�o se confunde (mescla) com algum outra j� existente!';
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
    locADOQuery.SQL.Add('SELECT                                                         ');
    locADOQuery.SQL.Add('  [filial_endereco].[upd_contador]                             ');
    locADOQuery.SQL.Add('FROM                                                           ');
    locADOQuery.SQL.Add('  [filial_endereco] WITH (NOLOCK)                              ');
    locADOQuery.SQL.Add('WHERE                                                          ');
    locADOQuery.SQL.Add('  [filial_endereco].[licenca_id]         = :licenca_id     AND ');
    locADOQuery.SQL.Add('  [filial_endereco].[filial_base_id]     = :filial_base_id AND ');
    locADOQuery.SQL.Add('  [filial_endereco].[filial_id]          = :filial_id      AND ');
    locADOQuery.SQL.Add('  [filial_endereco].[filial_endereco_sq] = :filial_endereco_sq ');

    locADOQuery.Parameters.ParamByName('licenca_id').Value         := locLicencaID;
    locADOQuery.Parameters.ParamByName('filial_base_id').Value     := locFilialBaseID;
    locADOQuery.Parameters.ParamByName('filial_id').Value          := locFilialID;
    locADOQuery.Parameters.ParamByName('filial_endereco_sq').Value := locSequencial;

    try
      locADOQuery.Open;
    except
      on locExcecao: Exception do
      begin
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualiza��es confere na tabela [filial_endereco]!';
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
    locRegistroAcao         := REGISTRO_ACAO_CRIACAO;
    locFilialEnderecoLogMsg := MENSAGEM_REGISTRO_ACAO_CRIADO;
  end
  else
  begin
    locRegistroAcao         := REGISTRO_ACAO_ALTERACAO;
    locFilialEnderecoLogMsg := MENSAGEM_REGISTRO_ACAO_ALTERADO;
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
  // Determina o pr�ximo sequencial do endere�o da filial.
  //
  if locInsert then
  begin
    locADOQuery.Close;
    locADOQuery.SQL.Clear;
    locADOQuery.SQL.Add('SELECT                                                         ');
    locADOQuery.SQL.Add('  MAX([filial_endereco].[filial_endereco_sq]) AS [sequencial]  ');
    locADOQuery.SQL.Add('FROM                                                           ');
    locADOQuery.SQL.Add('  [filial_endereco] WITH (NOLOCK)                              ');
    locADOQuery.SQL.Add('WHERE                                                          ');
    locADOQuery.SQL.Add('  [filial_endereco].[licenca_id]     = :licenca_id     AND     ');
    locADOQuery.SQL.Add('  [filial_endereco].[filial_base_id] = :filial_base_id AND     ');
    locADOQuery.SQL.Add('  [filial_endereco].[filial_id]      = :filial_id              ');

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
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar o pr�ximo sequencial na tabela [filial_endereco]!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
        Exit
      end;
    end;

    locSequencial := 0;

    if locADOQuery.RecordCount > 0 then
    begin
      if not locADOQuery.FieldByName('sequencial').IsNull then
      begin
        locSequencial := locADOQuery.FieldByName('sequencial').AsInteger;
      end;
    end;

    Inc(locSequencial);
  end;

  //
  // Grava dados na tabela filial_endereco.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;

  if locInsert then
  begin
    //
    // Insere dados.
    //
    locADOQuery.SQL.Add('INSERT INTO [filial_endereco] ( ');
    locADOQuery.SQL.Add('  [licenca_id],                 ');
    locADOQuery.SQL.Add('  [filial_base_id],             ');
    locADOQuery.SQL.Add('  [filial_id],                  ');
    locADOQuery.SQL.Add('  [filial_endereco_sq],         ');
    locADOQuery.SQL.Add('  [vigencia_ini_dt],            ');
    locADOQuery.SQL.Add('  [vigencia_fim_dt],            ');    
    locADOQuery.SQL.Add('  [ins_local_dt_hr],            ');
    locADOQuery.SQL.Add('  [ins_server_dt_hr],           ');
    locADOQuery.SQL.Add('  [ins_usuario_base_id],        ');
    locADOQuery.SQL.Add('  [ins_usuario_id],             ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr],            ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr],           ');
    locADOQuery.SQL.Add('  [upd_usuario_base_id],        ');
    locADOQuery.SQL.Add('  [upd_usuario_id],             ');
    locADOQuery.SQL.Add('  [upd_contador]                ');
    locADOQuery.SQL.Add(')                               ');
    locADOQuery.SQL.Add('VALUES (                        ');
    locADOQuery.SQL.Add('  :licenca_id,                  '); // [licenca_id].
    locADOQuery.SQL.Add('  :filial_base_id,              '); // [filial_base_id].
    locADOQuery.SQL.Add('  :filial_id,                   '); // [filial_id].
    locADOQuery.SQL.Add('  :filial_endereco_sq,          '); // [filial_endereco_sq].
    locADOQuery.SQL.Add('  :vigencia_ini_dt,             '); // [vigencia_ini_dt].
    locADOQuery.SQL.Add('  :vigencia_fim_dt,             '); // [vigencia_fim_dt].
    locADOQuery.SQL.Add('  :local_dt_hr,                 '); // [ins_local_dt_hr].
    locADOQuery.SQL.Add('  GETDATE(),                    '); // [ins_server_dt_hr].
    locADOQuery.SQL.Add('  :usuario_base_id,             '); // [ins_usuario_base_id].
    locADOQuery.SQL.Add('  :usuario_id,                  '); // [ins_usuario_id].
    locADOQuery.SQL.Add('  NULL,                         '); // [upd_local_dt_hr].
    locADOQuery.SQL.Add('  NULL,                         '); // [upd_server_dt_hr].
    locADOQuery.SQL.Add('  NULL,                         '); // [upd_usuario_base_id].
    locADOQuery.SQL.Add('  NULL,                         '); // [upd_usuario_id].
    locADOQuery.SQL.Add('  0                             '); // [upd_contador].
    locADOQuery.SQL.Add(')                               ');
  end
  else
  begin
    //
    // Atualiza dados.
    //
    locADOQuery.SQL.Add('UPDATE                                       ');
    locADOQuery.SQL.Add('  [filial_endereco]                          ');
    locADOQuery.SQL.Add('SET                                          ');
    locADOQuery.SQL.Add('  [vigencia_ini_dt]     = :vigencia_ini_dt,  ');
    locADOQuery.SQL.Add('  [vigencia_fim_dt]     = :vigencia_fim_dt,  ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr]     = :local_dt_hr,      ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr]    = GETDATE(),         ');
    locADOQuery.SQL.Add('  [upd_usuario_base_id] = :usuario_base_id,  ');
    locADOQuery.SQL.Add('  [upd_usuario_id]      = :usuario_id,       ');
    locADOQuery.SQL.Add('  [upd_contador]        = [upd_contador] + 1 ');
    locADOQuery.SQL.Add('WHERE                                        ');
    locADOQuery.SQL.Add('  [licenca_id]         = :licenca_id     AND ');
    locADOQuery.SQL.Add('  [filial_base_id]     = :filial_base_id AND ');
    locADOQuery.SQL.Add('  [filial_id]          = :filial_id      AND ');
    locADOQuery.SQL.Add('  [filial_endereco_sq] = :filial_endereco_sq ');
  end;

  //
  // Par�metros.
  //
  locADOQuery.Parameters.ParamByName('licenca_id').Value           := locLicencaID;
  locADOQuery.Parameters.ParamByName('filial_base_id').Value       := locFilialBaseID;
  locADOQuery.Parameters.ParamByName('filial_id').Value            := locFilialID;
  locADOQuery.Parameters.ParamByName('filial_endereco_sq').Value   := locSequencial;
  locADOQuery.Parameters.ParamByName('vigencia_ini_dt').Value      := locVigenciaIniDt;
  locADOQuery.Parameters.ParamByName('vigencia_fim_dt').Value      := locVigenciaFimDt;
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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [filial_endereco]!';
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
  locADOQuery.SQL.Add('SELECT                                                     ');
  locADOQuery.SQL.Add('  [filial_endereco].[ins_local_dt_hr],                     ');
  locADOQuery.SQL.Add('  [filial_endereco].[upd_local_dt_hr],                     ');
  locADOQuery.SQL.Add('  [filial_endereco].[upd_contador]                         ');
  locADOQuery.SQL.Add('FROM                                                       ');
  locADOQuery.SQL.Add('  [filial_endereco]                                        ');
  locADOQuery.SQL.Add('WHERE                                                      ');
  locADOQuery.SQL.Add('  [filial_endereco].[licenca_id]     = :licenca_id     AND ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_base_id] = :filial_base_id AND ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_id]      = :filial_id          ');

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
  // --> locFilialLogDados := LogDadosGerar(locFilialID);

  //
  // Determina o pr�ximo sequencial da tabela filial_endereco_log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                ');
  locADOQuery.SQL.Add('  MAX([filial_endereco_log].[filial_endereco_log_sq]) AS [sequencial] ');
  locADOQuery.SQL.Add('FROM                                                                  ');
  locADOQuery.SQL.Add('  [filial_endereco_log]                                               ');
  locADOQuery.SQL.Add('WHERE                                                                 ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[licenca_id]     = :licenca_id     AND        ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[filial_base_id] = :filial_base_id AND        ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[filial_id]      = :filial_id                 ');

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o pr�ximo sequencial para o registro na tabela [filial_endereco_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit
    end;
  end;

  if locADOQuery.RecordCount <= 0 then
  begin
    locFilialEnderecoLogSq := 1;
  end
  else
  begin
    locFilialEnderecoLogSq := locADOQuery.FieldByName('sequencial').AsInteger + 1;
  end;

  //
  // Monta SQL para inserir dados na tabela de log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('INSERT INTO [filial_endereco_log] ( ');
  locADOQuery.SQL.Add('  [licenca_id],                     ');
  locADOQuery.SQL.Add('  [filial_base_id],                 ');
  locADOQuery.SQL.Add('  [filial_id],                      ');
  locADOQuery.SQL.Add('  [filial_endereco_log_sq],         ');
  locADOQuery.SQL.Add('  [log_base_id],                    ');
  locADOQuery.SQL.Add('  [log_local_dt_hr],                ');
  locADOQuery.SQL.Add('  [log_server_dt_hr],               ');
  locADOQuery.SQL.Add('  [registro_acao_id],               ');
  locADOQuery.SQL.Add('  [host_name],                      ');
  locADOQuery.SQL.Add('  [user_name],                      ');
  locADOQuery.SQL.Add('  [log_usuario_base_id],            ');
  locADOQuery.SQL.Add('  [log_usuario_id],                 ');
  locADOQuery.SQL.Add('  [mensagem],                       ');
  locADOQuery.SQL.Add('  [dados]                           ');
  locADOQuery.SQL.Add(')                                   ');
  locADOQuery.SQL.Add('VALUES (                            ');
  locADOQuery.SQL.Add('  :licenca_id,                      '); // [licenca_id].
  locADOQuery.SQL.Add('  :filial_base_id,                  '); // [filial_base_id].
  locADOQuery.SQL.Add('  :filial_id,                       '); // [filial_id].
  locADOQuery.SQL.Add('  :filial_endereco_log_sq,          '); // [filial_endereco_log_sq].
  locADOQuery.SQL.Add('  :log_base_id,                     '); // [log_base_id].
  locADOQuery.SQL.Add('  :log_local_dt_hr,                 '); // [log_local_dt_hr].
  locADOQuery.SQL.Add('  GETDATE(),                        '); // [log_server_dt_hr].
  locADOQuery.SQL.Add('  :registro_acao_id,                '); // [registro_acao_id].
  locADOQuery.SQL.Add('  :host_name,                       '); // [host_name].
  locADOQuery.SQL.Add('  :user_name,                       '); // [user_name].
  locADOQuery.SQL.Add('  :log_usuario_base_id,             '); // [log_usuario_base_id].
  locADOQuery.SQL.Add('  :log_usuario_id,                  '); // [log_usuario_id].
  locADOQuery.SQL.Add('  :mensagem,                        '); // [mensagem].
  locADOQuery.SQL.Add('  :dados                            '); // [dados].
  locADOQuery.SQL.Add(')                                   ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value             := locLicencaID;
  locADOQuery.Parameters.ParamByName('filial_base_id').Value         := locFilialBaseID;
  locADOQuery.Parameters.ParamByName('filial_id').Value              := locFilialID;
  locADOQuery.Parameters.ParamByName('filial_endereco_log_sq').Value := locFilialEnderecoLogSq;
  locADOQuery.Parameters.ParamByName('log_base_id').Value            := gloBaseID;
  locADOQuery.Parameters.ParamByName('log_local_dt_hr').Value        := Now;
  locADOQuery.Parameters.ParamByName('registro_acao_id').Value       := locRegistroAcaoID;
  locADOQuery.Parameters.ParamByName('host_name').Value              := locHostName;
  locADOQuery.Parameters.ParamByName('user_name').Value              := locUserName;
  locADOQuery.Parameters.ParamByName('log_usuario_base_id').Value    := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('log_usuario_id').Value         := locUsuarioID;
  locADOQuery.Parameters.ParamByName('mensagem').Value               := locFilialEnderecoLogMsg;
  locADOQuery.Parameters.ParamByName('dados').Value                  := locFilialEnderecoLogDados;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir/atualizar o registro na tabela [filial_endereco_log]!';
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
  edtSequencial.Text   := IntegerStringConverter(locSequencial);
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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, locFilialID, IntegerStringConverter(locSequencial), 'filial_endereco', locFilialEnderecoLogMsg, locFilialEnderecoLogDados);
  except
    on locExcecao: Exception do
    begin
      VCLErroExibir(locExcecao.Message);
    end;
  end;
  
  //
  // Filial gravada!
  //
  VCLInformacaoExibir('Endere�o da filial gravado com sucesso!');
end;

end.
