//
// Arquivo..: Plataforma_ERP_VCL_FilialEndereco.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 27/Novembro/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com o cadastro de endereço da filial.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_FilialEndereco;

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
  Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls,
  Vcl.Mask;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_FilialEndereco.pas';

  TAB_CADASTRO : Byte = 0;
  TAB_AUDITORIA: Byte = 1;

  LVW_LISTA_FILIAL_ENDERECO_SQ: Integer = 0;
  LVW_LISTA_SEQUENCIAL        : Integer = 1;
  LVW_LISTA_VIGENCIA          : Integer = 2;

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
    medVigenciaIniDt: TMaskEdit;
    imgVigenciaFimDtSelecionar: TImage;
    imgVigenciaIniDtSelecionar: TImage;
    medVigenciaFimDt: TMaskEdit;
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
    lblFilialEnderecoSq: TLabel;
    edtFilialEnderecoSq: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure medVigenciaIniDtEnter(Sender: TObject);
    procedure medVigenciaIniDtKeyPress(Sender: TObject; var Key: Char);
    procedure medVigenciaIniDtKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure medVigenciaIniDtExit(Sender: TObject);
    procedure medVigenciaFimDtEnter(Sender: TObject);
    procedure medVigenciaFimDtExit(Sender: TObject);
    procedure medVigenciaFimDtKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure medVigenciaFimDtKeyPress(Sender: TObject; var Key: Char);
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
    procedure btnLogClick(Sender: TObject);
    procedure lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure imgVigenciaIniDtSelecionarClick(Sender: TObject);
    procedure imgVigenciaFimDtSelecionarClick(Sender: TObject);
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

    procedure FormularioLogExibir;

    procedure FormularioNovo;
    
    procedure FormularioAlterar;

    procedure FormularioGravar;
    
    procedure FormularioCancelar;

    procedure FormularioExcluir;

    function LogDadosGerar(argFilialEnderecoSq: Integer = 0;
                           argSequencial      : Integer = 0): string;
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
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLFilialEndereco.FormCreate(Sender: TObject);
begin
  //
  // Variáveis públicas.
  //
  pubDadosAtualizados := False;
  pubLicencaID        := 0;
  pubFilialBaseID     := 0;
  pubFilialID         := 0;

  //
  // Controla os componentes de exibição de cadastro.
  //
  VCLMaskEditClickControlar(medVigenciaIniDt, False);
  VCLMaskEditClickControlar(medVigenciaFimDt, False);
  VCLEditClickControlar    (edtInsLocalDtHr,  False);
  VCLEditClickControlar    (edtUpdLocalDtHr,  False);
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLFilialEndereco.FormShow(Sender: TObject);
begin
  //
  // Background do formulário.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Seleciona a aba principal.
  //
  VCLPageControlInicializar(pagFormulario);

  //
  // Limpa o formulário.
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
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLFilialEndereco.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click na opção de menu "log alterações".
//
procedure TPlataformaERPVCLFilialEndereco.mniLogClick(Sender: TObject);
begin
  FormularioLogExibir;
end;

//
// Evento de click na opção de menu "atualizar".
//
procedure TPlataformaERPVCLFilialEndereco.mniAtualizarClick(Sender: TObject);
begin
  FormularioListaPopular(pubLicencaID, pubFilialBaseID, pubFilialID);
end;

//
// Evento de click na opção de menu "novo".
//
procedure TPlataformaERPVCLFilialEndereco.mniNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

//
// Evento de click na opção de menu "alterar".
//
procedure TPlataformaERPVCLFilialEndereco.mniAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

//
// Evento de click na opção de menu "excluir".
//
procedure TPlataformaERPVCLFilialEndereco.mniExcluirClick(Sender: TObject);
begin
  FormularioExcluir;
end;

//
// Evento de click na opção de menu "gravar".
//
procedure TPlataformaERPVCLFilialEndereco.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click na opçao de menu "minimizar".
//
procedure TPlataformaERPVCLFilialEndereco.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click na opção de menu "cancelar".
//
procedure TPlataformaERPVCLFilialEndereco.mniCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

//
// Evento de click na opção de menu "fechar".
//
procedure TPlataformaERPVCLFilialEndereco.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente lvwLista.
//
procedure TPlataformaERPVCLFilialEndereco.lvwListaCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);
end;

procedure TPlataformaERPVCLFilialEndereco.lvwListaCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  VCLListViewZebrar(Sender, Item);

end;

procedure TPlataformaERPVCLFilialEndereco.lvwListaSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  locFilialEnderecoSq: Integer;
begin
  locFilialEnderecoSq := StringIntegerConverter(Item.SubItems.Strings[LVW_LISTA_FILIAL_ENDERECO_SQ]);

  FormularioDadosPopular(pubLicencaID, pubFilialBaseID, pubFilialID, locFilialEnderecoSq);
end;

//
// Vigência inicial.
//
procedure TPlataformaERPVCLFilialEndereco.medVigenciaIniDtEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medVigenciaIniDt) then Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.medVigenciaIniDtKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLFilialEndereco.medVigenciaIniDtKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medVigenciaIniDt);
end;

procedure TPlataformaERPVCLFilialEndereco.medVigenciaIniDtExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medVigenciaIniDt) then Exit;
  if not VCLMaskEditDataValidar(medVigenciaIniDt) then Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.imgVigenciaIniDtSelecionarClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medVigenciaIniDt);
end;

//
// Vigência final.
//
procedure TPlataformaERPVCLFilialEndereco.medVigenciaFimDtEnter(Sender: TObject);
begin
  if not VCLMaskEditEntrar(medVigenciaFimDt) then Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.medVigenciaFimDtKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_DATA);
end;

procedure TPlataformaERPVCLFilialEndereco.medVigenciaFimDtKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then Plataforma_ERP_VCL_DataSelecionar(medVigenciaFimDt);
end;

procedure TPlataformaERPVCLFilialEndereco.medVigenciaFimDtExit(Sender: TObject);
begin
  if not VCLMaskEditSair(medVigenciaFimDt) then Exit;
  if not VCLMaskEditDataValidar(medVigenciaFimDt) then Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.imgVigenciaFimDtSelecionarClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataSelecionar(medVigenciaFimDt);
end;

//
// Evento de click no botão "log alterações".
//
procedure TPlataformaERPVCLFilialEndereco.btnLogClick(Sender: TObject);
begin
  FormularioLogExibir;
end;

//
// Evento de click no botão "novo".
//
procedure TPlataformaERPVCLFilialEndereco.btnNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

//
// Evento de click no botão "alterar".
//
procedure TPlataformaERPVCLFilialEndereco.btnAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

//
// Evento de click no botão "gravar".
//
procedure TPlataformaERPVCLFilialEndereco.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLFilialEndereco.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "cancelar".
//
procedure TPlataformaERPVCLFilialEndereco.btnCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLFilialEndereco.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formulário.
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
    VCLMaskEditLimpar(medVigenciaIniDt);
    VCLMaskEditLimpar(medVigenciaFimDt);

    VCLEditLimpar(edtFilialEnderecoSq);
    VCLEditLimpar(edtInsLocalDtHr);
    VCLEditLimpar(edtUpdLocalDtHr);
    VCLEditLimpar(edtUpdContador);
  end;
end;

//
// Procedimento para controlar os componentes do formulário.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioControlar(argEditar: Boolean);
var
  locDadosPopulados: Boolean;
begin
  //
  // Determina se existem dados populados no formulário.
  //
  locDadosPopulados := (StringIntegerConverter(edtFilialEnderecoSq.Text) > 0);

  //
  // Controla os componentes do formulário.
  //
  VCLMaskEditControlar(medVigenciaIniDt, argEditar);
  VCLMaskEditControlar(medVigenciaFimDt, argEditar);

  //
  // Controla os componentes de exibição de cadastro.
  //
  VCLMaskEditClickControlar(medVigenciaIniDt, True);
  VCLMaskEditClickControlar(medVigenciaFimDt, True);
  VCLEditClickControlar    (edtInsLocalDtHr,  True);
  VCLEditClickControlar    (edtUpdLocalDtHr,  True);

  //
  // Controle os componentes com seleção de dados.
  //
  VCLMaskEditSelecaoControlar(medVigenciaIniDt, imgVigenciaIniDtSelecionar, argEditar);
  VCLMaskEditSelecaoControlar(medVigenciaFimDt, imgVigenciaFimDtSelecionar, argEditar);

  //
  // Controla os itens de menu do formulário.
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
  // Permissões de acesso por usuário.
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
  // Botões.
  //
  btnLog.Visible       := mniLog.Visible;
  btnNovo.Visible      := mniNovo.Visible;
  btnAlterar.Visible   := mniAlterar.Visible;
  btnGravar.Visible    := mniGravar.Visible;
  btnMinimizar.Visible := mniMinimizar.Visible;
  btnCancelar.Visible  := mniCancelar.Visible;
  btnFechar.Visible    := mniFechar.Visible;

  //
  // Ajusta o título do formulário.
  //
  Self.Caption := 'Endereço da filial';

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
  ERRO_MENSAGEM    : string = 'Impossível consultar dados do endereço da filial para popular a lista!';
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
  // Consulta dados da filial.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                     ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_endereco_sq],                  ');
  locADOQuery.SQL.Add('  [filial_endereco].[sequencial],                          ');
  locADOQuery.SQL.Add('  [filial_endereco].[vigencia_ini_dt],                     ');
  locADOQuery.SQL.Add('  [filial_endereco].[vigencia_fim_dt]                      ');
  locADOQuery.SQL.Add('FROM                                                       ');
  locADOQuery.SQL.Add('  [filial_endereco] WITH (NOLOCK)                          ');
  locADOQuery.SQL.Add('WHERE                                                      ');
  locADOQuery.SQL.Add('  [filial_endereco].[licenca_id]     = :licenca_id     AND ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_base_id] = :filial_base_id AND ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_id]      = :filial_id          ');
  locADOQuery.SQL.Add('ORDER BY                                                   ');
  locADOQuery.SQL.Add('  [filial_endereco].[sequencial] ASC                       ');

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
      locListItem.SubItems.Add(IntegerStringConverter(locADOQuery.FieldByName('sequencial').AsInteger));
      locListItem.SubItems.Add(DateTimeStringConverter(locADOQuery.FieldByName('vigencia_ini_dt').AsDateTime, 'dd/mm/yyyy') + ' até ' + DateTimeStringConverter(locADOQuery.FieldByName('vigencia_fim_dt').AsDateTime, 'dd/mm/yyyy'));

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
  // Controla a exibição dos componentes.
  //
  if lvwLista.Items.Count <= 0 then
  begin
    FormularioControlar(False);
  end
  else
  begin
    VCLListViewItemPosicionar(lvwLista, lvwLista.Items.Count - 1);
    VCLListViewFocar(lvwLista);
  end;
end;

//
// Procedimento para popular os dados do endereço selecionado.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioDadosPopular(argLicencaID       : Integer;
                                                                 argFilialBaseID    : Integer;
                                                                 argFilialID        : Integer;
                                                                 argFilialEnderecoSq: Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioDadosPopular';
  ERRO_MENSAGEM    : string = 'Impossível consultar dados do endereço da filial para popular os componentes!';
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
  FormularioLimpar(False, True);

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
  // Consulta dados da filial.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                         ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_endereco_sq],                      ');
  locADOQuery.SQL.Add('  [filial_endereco].[sequencial],                              ');
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
    edtSequencial.Text    := IntegerStringConverter (locADOQuery.FieldByName('sequencial').AsInteger);
    medVigenciaIniDt.Text := DateTimeStringConverter(locADOQuery.FieldByName('vigencia_ini_dt').AsDateTime, 'dd/mm/yyyy');
    medVigenciaFimDt.Text := DateTimeStringConverter(locADOQuery.FieldByName('vigencia_fim_dt').AsDateTime, 'dd/mm/yyyy');

    edtFilialEnderecoSq.Text := IntegerStringConverter (locADOQuery.FieldByName('filial_endereco_sq').AsInteger);
    edtInsLocalDtHr.Text     := DateTimeStringConverter(locADOQuery.FieldByName('ins_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn:ss');
    edtUpdLocalDtHr.Text     := DateTimeStringConverter(locADOQuery.FieldByName('upd_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn:ss');
    edtUpdContador.Text      := IntegerStringConverter (locADOQuery.FieldByName('upd_contador').AsInteger);
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
  // Controla a exibição dos componentes.
  //
  FormularioControlar(False);
end;

//
// Procedimento para carregar e exibir o log de alterações do registro.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioLogExibir;
const
  PROCEDIMENTO_NOME: string = 'FormularioLogExibir';
  ERRO_MENSAGEM    : string = 'Impossível consultar dados sobre os logs do registro!';
var
  locADOConnection   : TADOConnection;
  locADOQuery        : TADOQuery;
  locLogMensagem     : string;
  locFilialEnderecoSq: Integer;
begin
  //
  // Carrega chave do registro.
  //
  locFilialEnderecoSq := StringIntegerConverter(edtFilialEnderecoSq.Text);

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
  // Consulta dados da filial.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                                ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[filial_endereco_log_sq] AS [sequencial],                           ');
  locADOQuery.SQL.Add('  [base].[base_id]                               AS [log_base_id],                          ');
  locADOQuery.SQL.Add('  [base].[descricao]                             AS [log_base_descricao],                   ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[log_local_dt_hr]        AS [log_local_dt_hr],                      ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[log_server_dt_hr]       AS [log_server_dt_hr],                     ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_id]             AS [registro_acao_id],                     ');
  locADOQuery.SQL.Add('  [registro_acao].[descricao]                    AS [registro_acao_descricao],              ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[host_name]              AS [host_name],                            ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[user_name]              AS [user_name],                            ');
  locADOQuery.SQL.Add('  [usuario].[usuario_base_id]                    AS [usuario_base_id],                      ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id]                         AS [usuario_id],                           ');
  locADOQuery.SQL.Add('  [usuario].[nome]                               AS [usuario_nome],                         ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[mensagem]               AS [mensagem],                             ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[dados]                  AS [dados]                                 ');
  locADOQuery.SQL.Add('FROM                                                                                  ');  
  locADOQuery.SQL.Add('  [filial_endereco_log] WITH (NOLOCK)                                                 ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                                                     ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [filial_endereco_log].[log_base_id]                         ');
  locADOQuery.SQL.Add('  INNER JOIN [registro_acao] WITH (NOLOCK)                                            ');
  locADOQuery.SQL.Add('    ON [registro_acao].[registro_acao_id] = [filial_endereco_log].[registro_acao_id]  ');
  locADOQuery.SQL.Add('  INNER JOIN [usuario] WITH (NOLOCK)                                                  ');
  locADOQuery.SQL.Add('    ON [usuario].[licenca_id]      = [filial_endereco_log].[licenca_id]          AND  ');
  locADOQuery.SQL.Add('       [usuario].[usuario_base_id] = [filial_endereco_log].[log_usuario_base_id] AND  ');
  locADOQuery.SQL.Add('       [usuario].[usuario_id]      = [filial_endereco_log].[log_usuario_id]           ');
  locADOQuery.SQL.Add('WHERE                                                                                 ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[licenca_id]         = :licenca_id     AND                    ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[filial_base_id]     = :filial_base_id AND                    ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[filial_id]          = :filial_id      AND                    ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[filial_endereco_sq] = :filial_endereco_sq                    ');
  locADOQuery.SQL.Add('ORDER BY                                                                              ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[filial_endereco_log_sq] ASC                                                    ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value         := pubLicencaID;
  locADOQuery.Parameters.ParamByName('filial_base_id').Value     := pubFilialBaseID;
  locADOQuery.Parameters.ParamByName('filial_id').Value          := pubFilialID;
  locADOQuery.Parameters.ParamByName('filial_endereco_sq').Value := locFilialEnderecoSq;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar registros da tabela [filial_endereco_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Troca o cursor.
  //
  VCLCursorTrocar;  

  //
  // Exibe formulário.
  //
  if locADOQuery.RecordCount > 0 then
  begin
    Plataforma_ERP_VCL_LogRegistroExibir('Sequencial: ' + edtSequencial.Text, locADOQuery);
  end;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);
end;

//
// Procedimento para um novo cadastro.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioNovo;
begin
  //
  // Limpa os componentes do formulário.
  //
  FormularioLimpar(False, True);

  //
  // Carrega conteúdo dos campos necessários.
  //
  edtFilialEnderecoSq.Text := STR_NOVO;
  edtSequencial.Text       := STR_NOVO;

  //
  // Componentes ligados para edição.
  //
  FormularioControlar(True);
  
  //
  // Coloca o foco na data de vigência inicial.
  //
  VCLPageControlFocar(pagFormulario, TAB_CADASTRO, medVigenciaIniDt);
end;

//
// Procedimento para alterar os dados do formulário.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioAlterar;
begin
  //
  // Componentes ligados para edição.
  //
  FormularioControlar(True);

  //
  // Coloca o foco na data de vigência inicial.
  //
  VCLPageControlFocar(pagFormulario, TAB_CADASTRO, medVigenciaIniDt);
end;

//
// Procedimento para gravar os dados do formulário.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioGravar';
  ERRO_MENSAGEM    : string = 'Impossível gravar dados do endereço da filial!';
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
  locFilialEnderecoSq      : Integer;

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
  // Carrega variáveis com o conteúdo dos componentes.
  //
  locLicencaID        := pubLicencaID;
  locFilialBaseID     := pubFilialBaseID;
  locFilialID         := pubFilialID;
  locFilialEnderecoSq := StringIntegerConverter(edtFilialEnderecoSq.Text);

  locSequencial       := StringIntegerConverter(edtSequencial.Text);
  locVigenciaIniDt    := StringDateTimeConverter(medVigenciaIniDt.Text);
  locVigenciaFimDt    := StringDateTimeConverter(medVigenciaFimDt.Text);

  locUsuarioBaseID    := gloUsuarioBaseID;
  locUsuarioID        := gloUsuarioID;
  locHostName         := HostNameRecuperar;
  locUserName         := UserNameRecuperar;
  locUpdContador      := StringIntegerConverter(edtUpdContador.Text);

  //
  // Determina se será um insert ou update.
  //
  locInsert := True;

  if locFilialEnderecoSq > 0 then locInsert := False;

  //
  // Consiste as informações.
  //
  if locVigenciaIniDt <= 0 then
  begin
    VCLConsistenciaExibir('A data inicial da vigência deve ser informada!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, medVigenciaIniDt);
    Exit;
  end;

  if locVigenciaFimDt <= 0 then
  begin
    VCLConsistenciaExibir('A data final da vigência deve ser informada!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, medVigenciaFimDt);
    Exit;
  end;

  if locVigenciaFimDt < locVigenciaIniDt then
  begin
    VCLConsistenciaExibir('A data final da vigência não pode ser anterior a data inicial!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, medVigenciaIniDt);
    Exit;
  end;

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
  // Determina se a vigência do endereço se mescla com algum outro.
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
  locADOQuery.Parameters.ParamByName('filial_endereco_sq').Value := locFilialEnderecoSq;
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
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar períodos de vigência mesclados no cadastro da filial!';
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
    locLogMensagem := 'O período de vigência informado para esse endereço se confunde (mescla) com algum outra já existente!';
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
    locADOQuery.Parameters.ParamByName('filial_endereco_sq').Value := locFilialEnderecoSq;

    try
      locADOQuery.Open;
    except
      on locExcecao: Exception do
      begin
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualizações confere na tabela [filial_endereco]!';
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
  // Determina o próximo [filial_endereco_sq] do endereço da filial.
  //
  if locInsert then
  begin
    locADOQuery.Close;
    locADOQuery.SQL.Clear;
    locADOQuery.SQL.Add('SELECT                                                                ');
    locADOQuery.SQL.Add('  MAX([filial_endereco].[filial_endereco_sq]) AS [filial_endereco_sq] ');
    locADOQuery.SQL.Add('FROM                                                                  ');
    locADOQuery.SQL.Add('  [filial_endereco] WITH (NOLOCK)                                     ');
    locADOQuery.SQL.Add('WHERE                                                                 ');
    locADOQuery.SQL.Add('  [filial_endereco].[licenca_id]     = :licenca_id     AND            ');
    locADOQuery.SQL.Add('  [filial_endereco].[filial_base_id] = :filial_base_id AND            ');
    locADOQuery.SQL.Add('  [filial_endereco].[filial_id]      = :filial_id                     ');

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
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar o próximo [filial_endereco_sq] na tabela [filial_endereco]!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
        Exit
      end;
    end;

    locFilialEnderecoSq := 0;

    if locADOQuery.RecordCount > 0 then
    begin
      if not locADOQuery.FieldByName('filial_endereco_sq').IsNull then
      begin
        locFilialEnderecoSq := locADOQuery.FieldByName('filial_endereco_sq').AsInteger;
      end;
    end;

    Inc(locFilialEnderecoSq);
  end;

  //
  // Determina o próximo [sequencial] do endereço da filial.
  //
  if locInsert then
  begin
    locADOQuery.Close;
    locADOQuery.SQL.Clear;
    locADOQuery.SQL.Add('SELECT                                                     ');
    locADOQuery.SQL.Add('  MAX([filial_endereco].[sequencial]) AS [sequencial]      ');
    locADOQuery.SQL.Add('FROM                                                       ');
    locADOQuery.SQL.Add('  [filial_endereco] WITH (NOLOCK)                          ');
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
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar o próximo [sequencial] na tabela [filial_endereco]!';
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
    locADOQuery.SQL.Add('  [sequencial],                 ');
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
    locADOQuery.SQL.Add('  :sequencial,                  '); // [sequencial].
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
    locADOQuery.SQL.Add('  [sequencial]          = :sequencial,       ');
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
  // Parâmetros.
  //
  locADOQuery.Parameters.ParamByName('licenca_id').Value         := locLicencaID;
  locADOQuery.Parameters.ParamByName('filial_base_id').Value     := locFilialBaseID;
  locADOQuery.Parameters.ParamByName('filial_id').Value          := locFilialID;
  locADOQuery.Parameters.ParamByName('filial_endereco_sq').Value := locFilialEnderecoSq;
  locADOQuery.Parameters.ParamByName('sequencial').Value         := locSequencial;
  locADOQuery.Parameters.ParamByName('vigencia_ini_dt').Value    := locVigenciaIniDt;
  locADOQuery.Parameters.ParamByName('vigencia_fim_dt').Value    := locVigenciaFimDt;
  locADOQuery.Parameters.ParamByName('local_dt_hr').Value        := Now;
  locADOQuery.Parameters.ParamByName('usuario_base_id').Value    := locUsuarioBaseID;
  locADOQuery.Parameters.ParamByName('usuario_id').Value         := locUsuarioID;

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
  locADOQuery.SQL.Add('SELECT                                                         ');
  locADOQuery.SQL.Add('  [filial_endereco].[ins_local_dt_hr],                         ');
  locADOQuery.SQL.Add('  [filial_endereco].[upd_local_dt_hr],                         ');
  locADOQuery.SQL.Add('  [filial_endereco].[upd_contador]                             ');
  locADOQuery.SQL.Add('FROM                                                           ');
  locADOQuery.SQL.Add('  [filial_endereco]                                            ');
  locADOQuery.SQL.Add('WHERE                                                          ');
  locADOQuery.SQL.Add('  [filial_endereco].[licenca_id]         = :licenca_id     AND ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_base_id]     = :filial_base_id AND ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_id]          = :filial_id      AND ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_endereco_sq] = :filial_endereco_sq ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value         := locLicencaID;
  locADOQuery.Parameters.ParamByName('filial_base_id').Value     := locFilialBaseID;
  locADOQuery.Parameters.ParamByName('filial_id').Value          := locFilialID;
  locADOQuery.Parameters.ParamByName('filial_endereco_sq').Value := locFilialEnderecoSq;

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
  locFilialEnderecoLogDados := LogDadosGerar(locSequencial);

  //
  // Determina o próximo sequencial da tabela filial_endereco_log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                            ');
  locADOQuery.SQL.Add('  MAX([filial_endereco_log].[filial_endereco_log_sq]) AS [filial_endereco_log_sq] ');
  locADOQuery.SQL.Add('FROM                                                                              ');
  locADOQuery.SQL.Add('  [filial_endereco_log]                                                           ');
  locADOQuery.SQL.Add('WHERE                                                                             ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[licenca_id]         = :licenca_id     AND                ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[filial_base_id]     = :filial_base_id AND                ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[filial_id]          = :filial_id      AND                ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[filial_endereco_sq] = :filial_endereco_sq                ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value         := locLicencaID;
  locADOQuery.Parameters.ParamByName('filial_base_id').Value     := locFilialBaseID;
  locADOQuery.Parameters.ParamByName('filial_id').Value          := locFilialID;
  locADOQuery.Parameters.ParamByName('filial_endereco_sq').Value := locFilialEnderecoSq;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o próximo sequencial para o registro na tabela [filial_endereco_log]!';
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
    locFilialEnderecoLogSq := locADOQuery.FieldByName('filial_endereco_log_sq').AsInteger + 1;
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
  locADOQuery.SQL.Add('  [filial_endereco_sq],             ');
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
  locADOQuery.SQL.Add('  :filial_endereco_sq,              '); // [filial_endereco_sq].
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
  locADOQuery.Parameters.ParamByName('filial_endereco_sq').Value     := locFilialEnderecoSq;
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
  edtFilialEnderecoSq.Text := IntegerStringConverter(locFilialEnderecoSq);
  edtSequencial.Text       := IntegerStringConverter(locSequencial);
  edtInsLocalDtHr.Text     := DateTimeStringConverter(locInsLocalDtHr, 'dd/mm/yyyy hh:nn');
  edtUpdLocalDtHr.Text     := DateTimeStringConverter(locUpdLocalDtHr, 'dd/mm/yyyy hh:nn');
  edtUpdContador.Text      := IntegerStringConverter(locUpdContador);

  //
  // Componentes desligados para edição.
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
  // Grava log de ocorrência.
  //
  try
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, locFilialID, IntegerStringConverter(locFilialEnderecoSq), 'filial_endereco', locFilialEnderecoLogMsg, locFilialEnderecoLogDados);
  except
    on locExcecao: Exception do
    begin
      VCLErroExibir(locExcecao.Message);
    end;
  end;
  
  //
  // Filial gravada!
  //
  VCLInformacaoExibir('Endereço da filial gravado com sucesso!');

  //
  // Recarrega lista atualizada.
  //
  FormularioListaPopular(pubLicencaID, pubFilialBaseID, pubFilialID);
end;

//
// Procedimento para cancelar a edição dos dados do formulário.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioCancelar;
begin
  //
  // Confirma com o usuário.
  //
  if StringIntegerConverter(edtFilialEnderecoSq.Text) = 0 then
  begin
    if not VCLQuestionamentoExibir('Deseja realmente cancelar a digitação destes dados?') then Exit;
  end
  else
  begin
    if not VCLQuestionamentoExibir('Deseja realmente cancelar a alteração destes dados?') then Exit;
  end;

  //
  // Popula somente os dados.
  //
  FormularioListaPopular(pubLicencaID, pubFilialBaseID, pubFilialID);

  //
  // Componentes desligados para edição.
  //
  FormularioControlar(False);
end;

//
// Procedimento para excluir os dados deste cadastro.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioExcluir;
const
  PROCEDIMENTO_NOME: string = 'FormularioExcluir';
  ERRO_MENSAGEM    : string = 'Impossível excluir dados do endereço da filial!';
var
  locADOConnection         : TADOConnection;
  locADOQuery              : TADOQuery;
  locLogMensagem           : string;
  locFilialEnderecoSq      : Integer;
  locFilialEnderecoLogDados: string;
begin
  //
  // Carrega variáveis com o conteúdo dos componentes.
  //
  locFilialEnderecoSq := StringIntegerConverter(edtFilialEnderecoSq.Text);

  //
  // Log dados.
  //
  locFilialEnderecoLogDados := LogDadosGerar;

  //
  // Confirma gravação com o usuário.
  //
  if not VCLQuestionamentoExibir('Deseja realmente excluir estes dados?') then Exit;
  if not VCLQuestionamentoExibir('Tem certeza?') then Exit;

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
  // Query.
  //
  locADOQuery                := TADOQuery.Create(Self);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Deleta registro da tabela filial_endereco_log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                                                        ');
  locADOQuery.SQL.Add('  [filial_endereco_log]                                            ');
  locADOQuery.SQL.Add('WHERE                                                              ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[licenca_id]         = :licenca_id     AND ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[filial_base_id]     = :filial_base_id AND ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[filial_id]          = :filial_id      AND ');
  locADOQuery.SQL.Add('  [filial_endereco_log].[filial_endereco_sq] = :filial_endereco_sq ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value         := pubLicencaID;
  locADOQuery.Parameters.ParamByName('filial_base_id').Value     := pubFilialBaseID;
  locADOQuery.Parameters.ParamByName('filial_id').Value          := pubFilialID;
  locADOQuery.Parameters.ParamByName('filial_endereco_sq').Value := locFilialEnderecoSq;

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
      locLogMensagem := 'Ocorreu algum problema ao executar query para deletar os registros na tabela [filial_endereco_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Comando SQL para excluir um registro da tabela filial_endereco.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                                                    ');
  locADOQuery.SQL.Add('  [filial_endereco]                                            ');
  locADOQuery.SQL.Add('WHERE                                                          ');
  locADOQuery.SQL.Add('  [filial_endereco].[licenca_id]         = :licenca_id     AND ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_base_id]     = :filial_base_id AND ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_id]          = :filial_id      AND ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_endereco_sq] = :filial_endereco_sq ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value         := pubLicencaID;
  locADOQuery.Parameters.ParamByName('filial_base_id').Value     := pubFilialBaseID;
  locADOQuery.Parameters.ParamByName('filial_id').Value          := pubFilialID;
  locADOQuery.Parameters.ParamByName('filial_endereco_sq').Value := locFilialEnderecoSq;

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
      locLogMensagem := 'Ocorreu algum problema ao executar query para deletar os registros na tabela [filial_endereco]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Comando SQL para ajustar o sequencial nos registros restantes.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('UPDATE                                                         ');
  locADOQuery.SQL.Add('  [filial_endereco]                                            ');
  locADOQuery.SQL.Add('SET                                                            ');
  locADOQuery.SQL.Add('  [sequencial] = [sequencial] - 1                              ');
  locADOQuery.SQL.Add('WHERE                                                          ');
  locADOQuery.SQL.Add('  [filial_endereco].[licenca_id]         = :licenca_id     AND ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_base_id]     = :filial_base_id AND ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_id]          = :filial_id      AND ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_endereco_sq] > :filial_endereco_sq ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value         := pubLicencaID;
  locADOQuery.Parameters.ParamByName('filial_base_id').Value     := pubFilialBaseID;
  locADOQuery.Parameters.ParamByName('filial_id').Value          := pubFilialID;
  locADOQuery.Parameters.ParamByName('filial_endereco_sq').Value := locFilialEnderecoSq;

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
      locLogMensagem := 'Ocorreu algum problema ao executar query para atualizar o sequencial dos registros na tabela [filial_endereco]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
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
  // Limpa os componentes do formulário.
  //
  FormularioLimpar(False, True);

  //
  // Desliga os componentes para edição e ajusta a visibilidade dos botões.
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
  // Log de ocorrência.
  //
  try
    Plataforma_ERP_ADO_LogOcorrenciaInserir(REGISTRO_ACAO_EXCLUSAO, pubFilialID, IntegerStringConverter(locFilialEnderecoSq), 'filial_endereco', 'Registro excluído com sucesso!', locFilialEnderecoLogDados);
  except
  end;
  VCLInformacaoExibir('Endereço da filial excluído com sucesso!');

  //
  // Recarrega lista atualizada.
  //
  FormularioListaPopular(pubLicencaID, pubFilialBaseID, pubFilialID);
end;

//
// Função para gerar a string de log dos dados.
//
function TPlataformaERPVCLFilialEndereco.LogDadosGerar(argFilialEnderecoSq: Integer = 0;
                                                       argSequencial      : Integer = 0): string;
var
  locFilialEnderecoSq: Integer;
  locSequencial      : Integer;
begin
  if argFilialEnderecoSq <= 0 then
    locFilialEnderecoSq := StringIntegerConverter(edtFilialEnderecoSq.Text)
  else
    locFilialEnderecoSq := argFilialEnderecoSq;

  if argSequencial <= 0 then
    locSequencial := StringIntegerConverter(edtSequencial.Text)
  else
    locSequencial := argSequencial;

  Result := '';
  LogDadosIntegerDescrever('Licença',                pubLicencaID,          Result);
  LogDadosIntegerDescrever('Base da filial',         pubFilialBaseID,       Result);
  LogDadosIntegerDescrever('ID da filial',           pubFilialID,           Result);
  LogDadosIntegerDescrever('Sequencial do endereço', locFilialEnderecoSq,   Result);
  LogDadosIntegerDescrever('Sequencial',             locSequencial,         Result);
  LogDadosStringDescrever ('Vigência inicial',       medVigenciaIniDt.Text, Result);
  LogDadosStringDescrever ('Vigência final',         medVigenciaFimDt.Text, Result);
  
end;

end.
