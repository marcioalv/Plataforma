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
    lblLogradouro: TLabel;
    edtLogradouroCodigo: TEdit;
    edtLogradouroDescricao: TEdit;
    edtLogradouroID: TEdit;
    imgLogradouroSelecionar: TImage;
    lblEndereco: TLabel;
    edtEndereco: TEdit;
    lblNumero: TLabel;
    edtNumero: TEdit;
    lblComplemento: TLabel;
    edtComplemento: TEdit;
    edtBairro: TEdit;
    lblBairro: TLabel;
    lblCidade: TLabel;
    edtCidade: TEdit;
    Label1: TLabel;
    edtEstado: TEdit;
    lblCEP: TLabel;
    edtCEP: TEdit;
    lblPais: TLabel;
    edtPaisCodigo: TEdit;
    edtPaisNome: TEdit;
    edtPaisID: TEdit;
    imgPaisSelecionar: TImage;
    edtBairroCodigo: TEdit;
    edtBairroNome: TEdit;
    edtBairroID: TEdit;
    imgBairroSelecionar: TImage;
    edtCidadeCodigo: TEdit;
    edtCidadeNome: TEdit;
    edtCidadeID: TEdit;
    imgCidadeSelecionar: TImage;
    edtEstadoCodigo: TEdit;
    edtEstadoNome: TEdit;
    edtEstadoID: TEdit;
    gbxEstrangeiro: TGroupBox;
    chkEstrangeiro: TCheckBox;
    chkGenerico: TCheckBox;
    imgEstadoSelecionar: TImage;
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
    procedure edtLogradouroCodigoEnter(Sender: TObject);
    procedure edtLogradouroCodigoExit(Sender: TObject);
    procedure edtLogradouroCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtLogradouroCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure imgLogradouroSelecionarClick(Sender: TObject);
    procedure edtEnderecoEnter(Sender: TObject);
    procedure edtEnderecoExit(Sender: TObject);
    procedure edtEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumeroEnter(Sender: TObject);
    procedure edtNumeroExit(Sender: TObject);
    procedure edtNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure edtComplementoEnter(Sender: TObject);
    procedure edtComplementoExit(Sender: TObject);
    procedure edtComplementoKeyPress(Sender: TObject; var Key: Char);
    procedure edtBairroEnter(Sender: TObject);
    procedure edtBairroExit(Sender: TObject);
    procedure edtBairroKeyPress(Sender: TObject; var Key: Char);
    procedure lblBairroClick(Sender: TObject);
    procedure edtCEPEnter(Sender: TObject);
    procedure edtCEPExit(Sender: TObject);
    procedure edtCEPKeyPress(Sender: TObject; var Key: Char);
    procedure edtCidadeEnter(Sender: TObject);
    procedure edtCidadeExit(Sender: TObject);
    procedure edtCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtEstadoEnter(Sender: TObject);
    procedure edtEstadoExit(Sender: TObject);
    procedure edtEstadoKeyPress(Sender: TObject; var Key: Char);
    procedure edtPaisCodigoEnter(Sender: TObject);
    procedure edtPaisCodigoExit(Sender: TObject);
    procedure edtPaisCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtPaisCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure imgPaisSelecionarClick(Sender: TObject);
    procedure panFormularioClick(Sender: TObject);
    procedure chkEstrangeiroClick(Sender: TObject);
    procedure chkGenericoClick(Sender: TObject);
  private
    procedure FormularioLimpar(argLista: Boolean = True;
                               argDados: Boolean = True);

    procedure FormularioControlar(argEditar: Boolean);

    procedure FormularioComponentesConfigurar;

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
  VCLMaskEditClickControlar(medVigenciaIniDt, False);
  VCLMaskEditClickControlar(medVigenciaFimDt, False);
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
  // Seleciona a aba principal.
  //
  VCLPageControlInicializar(pagFormulario);

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
  FormularioLogExibir;
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
  FormularioNovo;
end;

procedure TPlataformaERPVCLFilialEndereco.panFormularioClick(Sender: TObject);
begin

end;

//
// Evento de click na op��o de menu "alterar".
//
procedure TPlataformaERPVCLFilialEndereco.mniAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

//
// Evento de click na op��o de menu "excluir".
//
procedure TPlataformaERPVCLFilialEndereco.mniExcluirClick(Sender: TObject);
begin
  FormularioExcluir;
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
  FormularioCancelar;
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
// Vig�ncia inicial.
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

procedure TPlataformaERPVCLFilialEndereco.lblBairroClick(Sender: TObject);
begin

end;

//
// Vig�ncia final.
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
// Estrangeiro?
//
procedure TPlataformaERPVCLFilialEndereco.chkEstrangeiroClick(Sender: TObject);
begin
  FormularioComponentesConfigurar;
end;

//
// CEP.
//
procedure TPlataformaERPVCLFilialEndereco.edtCEPEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCEP) then Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.edtCEPKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLFilialEndereco.edtCEPExit(Sender: TObject);
begin
  if not VCLEditSair(edtCEP) then Exit;
  
  if not Plataforma_ERP_VCL_CEPValidar(edtCEP,
                                       chkEstrangeiro,
                                       chkGenerico,
                                       edtLogradouroID,
                                       edtLogradouroCodigo,
                                       edtLogradouroDescricao,
                                       edtEndereco,
                                       edtBairro,
                                       edtCidade,
                                       edtEstado,
                                       edtPaisID,
                                       edtPaisCodigo,
                                       edtPaisNome) then Exit;
end;

//
// Gen�rico?
//
procedure TPlataformaERPVCLFilialEndereco.chkGenericoClick(Sender: TObject);
begin
  FormularioComponentesConfigurar;
end;

//
// Logradouro.
//
procedure TPlataformaERPVCLFilialEndereco.edtLogradouroCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtLogradouroCodigo) then Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.edtLogradouroCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLFilialEndereco.edtLogradouroCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then imgLogradouroSelecionarClick(Sender);
end;

procedure TPlataformaERPVCLFilialEndereco.edtLogradouroCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtLogradouroCodigo) then Exit;

  if not Plataforma_ERP_VCL_LogradouroValidar((edtFilialEnderecoSq.Text = STR_NOVO),
                                              edtLogradouroID,
                                              edtLogradouroCodigo,
                                              edtLogradouroDescricao) then Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.imgLogradouroSelecionarClick(Sender: TObject);
begin
  if not Plataforma_ERP_VCL_LogradouroSelecionar(edtLogradouroID, edtLogradouroCodigo, edtLogradouroDescricao) then Exit;
end;

//
// Endere�o.
//
procedure TPlataformaERPVCLFilialEndereco.edtEnderecoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtEndereco) then Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.edtEnderecoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLFilialEndereco.edtEnderecoExit(Sender: TObject);
begin
  if not VCLEditSair(edtEndereco) then Exit;
end;

//
// N�mero.
//
procedure TPlataformaERPVCLFilialEndereco.edtNumeroEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtNumero) then Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.edtNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLFilialEndereco.edtNumeroExit(Sender: TObject);
begin
  if not VCLEditSair(edtNumero) then Exit;
end;

//
// Complemento.
//
procedure TPlataformaERPVCLFilialEndereco.edtComplementoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtComplemento) then Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.edtComplementoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLFilialEndereco.edtComplementoExit(Sender: TObject);
begin
  if not VCLEditSair(edtComplemento) then Exit;
end;

//
// Bairro.
//
procedure TPlataformaERPVCLFilialEndereco.edtBairroEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtBairro) then Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.edtBairroKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLFilialEndereco.edtBairroExit(Sender: TObject);
begin
  if not VCLEditSair(edtBairro) then Exit;
end;

//
// Cidade.
//
procedure TPlataformaERPVCLFilialEndereco.edtCidadeEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCidade) then Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.edtCidadeKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLFilialEndereco.edtCidadeExit(Sender: TObject);
begin
  if not VCLEditSair(edtCidade) then Exit;
end;

//
// Estado.
//
procedure TPlataformaERPVCLFilialEndereco.edtEstadoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtEstado) then Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.edtEstadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLFilialEndereco.edtEstadoExit(Sender: TObject);
begin
  if not VCLEditSair(edtEstado) then Exit;
end;

//
//
//
procedure TPlataformaERPVCLFilialEndereco.edtPaisCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtPaisCodigo) then Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.edtPaisCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLFilialEndereco.edtPaisCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then imgPaisSelecionarClick(Sender);
end;

procedure TPlataformaERPVCLFilialEndereco.edtPaisCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtPaisCodigo) then Exit;

  if not Plataforma_ERP_VCL_PaisValidar((edtFilialEnderecoSq.Text = STR_NOVO),
                                        edtPaisID,
                                        edtPaisCodigo,
                                        edtPaisNome) then Exit;
end;

procedure TPlataformaERPVCLFilialEndereco.imgPaisSelecionarClick(Sender: TObject);
begin
  if not Plataforma_ERP_VCL_PaisSelecionar(edtPaisID, edtPaisCodigo, edtPaisNome) then Exit;
end;

//
// Evento de click no bot�o "log altera��es".
//
procedure TPlataformaERPVCLFilialEndereco.btnLogClick(Sender: TObject);
begin
  FormularioLogExibir;
end;

//
// Evento de click no bot�o "novo".
//
procedure TPlataformaERPVCLFilialEndereco.btnNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

//
// Evento de click no bot�o "alterar".
//
procedure TPlataformaERPVCLFilialEndereco.btnAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
  FormularioComponentesConfigurar;
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
  FormularioCancelar;
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
    VCLEditLimpar(edtSequencial);
    VCLMaskEditLimpar(medVigenciaIniDt);
    VCLMaskEditLimpar(medVigenciaFimDt);

    VCLCheckBoxLimpar(chkEstrangeiro);
    VCLEditLimpar(edtCEP);
    VCLCheckBoxLimpar(chkGenerico);
    VCLEditLimpar(edtLogradouroID);
    VCLEditLimpar(edtLogradouroCodigo);
    VCLEditLimpar(edtLogradouroDescricao);
    VCLEditLimpar(edtEndereco);
    VCLEditLimpar(edtNumero);
    VCLEditLimpar(edtComplemento);
    VCLEditLimpar(edtBairro);
    VCLEditLimpar(edtBairroID);
    VCLEditLimpar(edtBairroCodigo);
    VCLEditLimpar(edtBairroNome);
    VCLEditLimpar(edtCidade);
    VCLEditLimpar(edtCidadeID);
    VCLEditLimpar(edtCidadeCodigo);
    VCLEditLimpar(edtCidadeNome);
    VCLEditLimpar(edtEstado);
    VCLEditLimpar(edtEstadoID);
    VCLEditLimpar(edtEstadoCodigo);
    VCLEditLimpar(edtEstadoNome);
    VCLEditLimpar(edtPaisID);
    VCLEditLimpar(edtPaisCodigo);
    VCLEditLimpar(EdtPaisNome);

    VCLEditLimpar(edtFilialEnderecoSq);
    VCLEditLimpar(edtInsLocalDtHr);
    VCLEditLimpar(edtUpdLocalDtHr);
    VCLEditLimpar(edtUpdContador);
  end;

  FormularioComponentesConfigurar;
end;

//
// Procedimento para configurar os componentes do formul�rio.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioComponentesConfigurar;
var
  locFormularioEdicao: Boolean;
  locHabilitarPais   : Boolean;
  locExibirSelecoes  : Boolean;
begin
  //
  // O formul�rio est� em edi��o?
  //
  locFormularioEdicao := (not edtCEP.ReadOnly);

  //
  // Deve habilitar o pa�s?
  //
  locHabilitarPais := chkEstrangeiro.Checked;

  //
  // Deve exibir os componentes de sele��o como bairro, cidade e estado?
  //
  locExibirSelecoes := (not locHabilitarPais) and chkGenerico.Checked;

  //
  // Pa�s.
  //
  chkGenerico.Visible := (not locHabilitarPais);

  lblLogradouro.Visible          := (not locHabilitarPais);
  edtLogradouroCodigo.Visible    := (not locHabilitarPais);
  edtLogradouroDescricao.Visible := (not locHabilitarPais);
  VCLEditSelecaoControlar(edtLogradouroDescricao, imgLogradouroSelecionar, (locExibirSelecoes and locFormularioEdicao));

  VCLEditControlar(edtPaisCodigo, (locHabilitarPais and locFormularioEdicao));
  VCLEditSelecaoControlar(edtPaisNome, imgPaisSelecionar, (locHabilitarPais and locFormularioEdicao));

  if locHabilitarPais then
  begin
    edtPaisCodigo.Color := clWindow;
  end
  else
  begin
    edtPaisCodigo.Color := edtPaisNome.Color;
  end;

  //
  // Sele��o de bairro, cidade e estado.
  //
  edtBairro.Visible       := (not locExibirSelecoes);
  edtBairroCodigo.Visible := locExibirSelecoes;
  edtBairroNome.Visible   := locExibirSelecoes;
  VCLEditSelecaoControlar(edtBairroNome, imgBairroSelecionar, (locExibirSelecoes and locFormularioEdicao));

  edtCidade.Visible       := (not locExibirSelecoes);
  edtCidadeCodigo.Visible := locExibirSelecoes;
  edtCidadeNome.Visible   := locExibirSelecoes;
  VCLEditSelecaoControlar(edtCidadeNome, imgCidadeSelecionar, (locExibirSelecoes and locFormularioEdicao));

  edtEstado.Visible       := (not locExibirSelecoes);
  edtEstadoCodigo.Visible := locExibirSelecoes;
  edtEstadoNome.Visible   := locExibirSelecoes;
  VCLEditSelecaoControlar(edtEstadoNome, imgEstadoSelecionar, (locExibirSelecoes and locFormularioEdicao));
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
  locDadosPopulados := (StringIntegerConverter(edtFilialEnderecoSq.Text) > 0);

  //
  // Controla os componentes do formul�rio.
  //
  VCLMaskEditControlar(medVigenciaIniDt,    argEditar);
  VCLMaskEditControlar(medVigenciaFimDt,    argEditar);
  gbxEstrangeiro.Enabled := argEditar;
  VCLEditControlar(edtCEP,              argEditar);
  VCLCheckBoxControlar(chkGenerico,     argEditar);
  VCLEditControlar(edtLogradouroCodigo, argEditar);
  VCLEditControlar(edtEndereco,         argEditar);
  VCLEditControlar(edtNumero,           argEditar);
  VCLEditControlar(edtComplemento,      argEditar);
  VCLEditControlar(edtBairro,           argEditar);
  VCLEditControlar(edtBairroCodigo,     argEditar);
  VCLEditControlar(edtCidade,           argEditar);
  VCLEditControlar(edtCidadeCodigo,     argEditar);
  VCLEditControlar(edtEstado,           argEditar);
  VCLEditControlar(edtEstadoCodigo,     argEditar);

  //
  // Controla os componentes de exibi��o de cadastro.
  //
  VCLMaskEditClickControlar(medVigenciaIniDt,       True);
  VCLMaskEditClickControlar(medVigenciaFimDt,       True);
  VCLEditClickControlar    (edtLogradouroDescricao, True);
  VCLEditClickControlar    (edtPaisNome,            True);
  VCLEditClickControlar    (edtInsLocalDtHr,        True);
  VCLEditClickControlar    (edtUpdLocalDtHr,        True);

  //
  // Controle os componentes com sele��o de dados.
  //
  VCLMaskEditSelecaoControlar(medVigenciaIniDt,       imgVigenciaIniDtSelecionar, argEditar);
  VCLMaskEditSelecaoControlar(medVigenciaFimDt,       imgVigenciaFimDtSelecionar, argEditar);
  VCLEditSelecaoControlar    (edtLogradouroDescricao, imgLogradouroSelecionar,    argEditar);

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
  locADOQuery.SQL.Add('SELECT                                                                  ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_endereco_sq],                               ');
  locADOQuery.SQL.Add('  [filial_endereco].[sequencial],                                       ');
  locADOQuery.SQL.Add('  [filial_endereco].[vigencia_ini_dt],                                  ');
  locADOQuery.SQL.Add('  [filial_endereco].[vigencia_fim_dt],                                  ');
  locADOQuery.SQL.Add('  [filial_endereco].[estrangeiro],                                      ');

  locADOQuery.SQL.Add('  [logradouro].[logradouro_id] AS [logradouro_id],                      ');
  locADOQuery.SQL.Add('  [logradouro].[codigo]        AS [logradouro_codigo],                  ');
  locADOQuery.SQL.Add('  [logradouro].[descricao]     AS [logradouro_descricao],               ');

  locADOQuery.SQL.Add('  [filial_endereco].[endereco],                                         ');
  locADOQuery.SQL.Add('  [filial_endereco].[numero],                                           ');
  locADOQuery.SQL.Add('  [filial_endereco].[complemento],                                      ');
  locADOQuery.SQL.Add('  [filial_endereco].[bairro],                                           ');
  locADOQuery.SQL.Add('  [filial_endereco].[cidade],                                           ');
  locADOQuery.SQL.Add('  [filial_endereco].[estado],                                           ');
  locADOQuery.SQL.Add('  [filial_endereco].[cep],                                              ');
  locADOQuery.SQL.Add('  [filial_endereco].[generico],                                         ');

  locADOQuery.SQL.Add('  [pais].[pais_id] AS [pais_id],                                        ');
  locADOQuery.SQL.Add('  [pais].[codigo]  AS [pais_codigo],                                    ');
  locADOQuery.SQL.Add('  [pais].[nome]    AS [pais_nome],                                      ');

  locADOQuery.SQL.Add('  [filial_endereco].[ins_local_dt_hr],                                  ');
  locADOQuery.SQL.Add('  [filial_endereco].[upd_local_dt_hr],                                  ');
  locADOQuery.SQL.Add('  [filial_endereco].[upd_contador]                                      ');
  locADOQuery.SQL.Add('FROM                                                                    ');
  locADOQuery.SQL.Add('  [filial_endereco] WITH (NOLOCK)                                       ');
  locADOQuery.SQL.Add('  INNER JOIN [logradouro] WITH (NOLOCK)                                 ');
  locADOQuery.SQL.Add('    ON [logradouro].[logradouro_id] = [filial_endereco].[logradouro_id] ');
  locADOQuery.SQL.Add('  INNER JOIN [pais] WITH (NOLOCK)                                       ');
  locADOQuery.SQL.Add('    ON [pais].[pais_id] = [filial_endereco].[pais_id]                   ');
  locADOQuery.SQL.Add('WHERE                                                                   ');
  locADOQuery.SQL.Add('  [filial_endereco].[licenca_id]         = :licenca_id     AND          ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_base_id]     = :filial_base_id AND          ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_id]          = :filial_id      AND          ');
  locADOQuery.SQL.Add('  [filial_endereco].[filial_endereco_sq] = :filial_endereco_sq          ');

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
    edtSequencial.Text       := IntegerStringConverter (locADOQuery.FieldByName('sequencial').AsInteger);
    medVigenciaIniDt.Text    := DateTimeStringConverter(locADOQuery.FieldByName('vigencia_ini_dt').AsDateTime, 'dd/mm/yyyy');
    medVigenciaFimDt.Text    := DateTimeStringConverter(locADOQuery.FieldByName('vigencia_fim_dt').AsDateTime, 'dd/mm/yyyy');
    edtFilialEnderecoSq.Text := IntegerStringConverter (locADOQuery.FieldByName('filial_endereco_sq').AsInteger);
    chkEstrangeiro.Checked   := StringBooleanConverter(locADOQuery.FieldByName('estrangeiro').AsString);
    chkGenerico.Checked      := StringBooleanConverter(locADOQuery.FieldByName('generico').AsString);

    edtLogradouroID.Text        := IntegerStringConverter(locADOQuery.FieldByName('logradouro_id').AsInteger);
    edtLogradouroCodigo.Text    := locADOQuery.FieldByName('logradouro_codigo').AsString;
    edtLogradouroDescricao.Text := locADOQuery.FieldByName('logradouro_descricao').AsString;

    edtEndereco.Text    := locADOQuery.FieldByName('endereco').AsString;
    edtNumero.Text      := locADOQuery.FieldByName('numero').AsString;
    edtComplemento.Text := locADOQuery.FieldByName('complemento').AsString;
    edtBairro.Text      := locADOQuery.FieldByName('bairro').AsString;
    edtCidade.Text      := locADOQuery.FieldByName('cidade').AsString;
    edtEstado.Text      := locADOQuery.FieldByName('estado').AsString;
    edtCEP.Text         := locADOQuery.FieldByName('cep').AsString;

    edtPaisID.Text     := IntegerStringConverter(locADOQuery.FieldByName('pais_id').AsInteger);
    edtPaisCodigo.Text := locADOQuery.FieldByName('pais_codigo').AsString;
    edtPaisNome.Text   := locADOQuery.FieldByName('pais_nome').AsString;

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
  // Controla a exibi��o dos componentes.
  //
  FormularioControlar(False);
end;

//
// Procedimento para carregar e exibir o log de altera��es do registro.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioLogExibir;
const
  PROCEDIMENTO_NOME: string = 'FormularioLogExibir';
  ERRO_MENSAGEM    : string = 'Imposs�vel consultar dados sobre os logs do registro!';
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
  // Exibe formul�rio.
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
  // Limpa os componentes do formul�rio.
  //
  FormularioLimpar(False, True);

  //
  // Carrega conte�do dos campos necess�rios.
  //
  edtFilialEnderecoSq.Text := STR_NOVO;
  edtSequencial.Text       := STR_NOVO;

  //
  // Componentes ligados para edi��o.
  //
  FormularioControlar(True);
  FormularioComponentesConfigurar;
  
  //
  // Coloca o foco na data de vig�ncia inicial.
  //
  VCLPageControlFocar(pagFormulario, TAB_CADASTRO, medVigenciaIniDt);
end;

//
// Procedimento para alterar os dados do formul�rio.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioAlterar;
begin
  //
  // Componentes ligados para edi��o.
  //
  FormularioControlar(True);

  //
  // Coloca o foco na data de vig�ncia inicial.
  //
  VCLPageControlFocar(pagFormulario, TAB_CADASTRO, medVigenciaIniDt);
end;

//
// Procedimento para gravar os dados do formul�rio.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioGravar';
  ERRO_MENSAGEM    : string = 'Imposs�vel gravar dados do endere�o da filial!';
var
  locADOConnection         : TADOConnection;
  locADOQuery              : TADOQuery;
  locLogMensagem           : string;

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
  locEstrangeiro           : Boolean;
  locLogradouroID          : Integer;
  locEndereco              : string;
  locNumero                : string;
  locComplemento           : string;
  locBairro                : string;
  locCidade                : string;
  locEstado                : string;
  locCEP                   : string;
  locGenerico              : Boolean;
  locPaisID                : Integer;

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
  locLicencaID        := pubLicencaID;
  locFilialBaseID     := pubFilialBaseID;
  locFilialID         := pubFilialID;
  locFilialEnderecoSq := StringIntegerConverter(edtFilialEnderecoSq.Text);

  locSequencial       := StringIntegerConverter(edtSequencial.Text);
  locVigenciaIniDt    := StringDateTimeConverter(medVigenciaIniDt.Text);
  locVigenciaFimDt    := StringDateTimeConverter(medVigenciaFimDt.Text);
  locEstrangeiro      := chkEstrangeiro.Checked;
  locLogradouroID     := StringIntegerConverter(edtLogradouroID.Text);
  locEndereco         := StringTrim(edtEndereco.Text);
  locNumero           := StringTrim(edtNumero.Text);
  locComplemento      := StringTrim(edtComplemento.Text);
  locBairro           := StringTrim(edtBairro.Text);
  locCidade           := StringTrim(edtCidade.Text);
  locEstado           := StringTrim(edtEstado.Text);
  locCEP              := StringTrim(edtCEP.Text);
  locGenerico         := chkGenerico.Checked;
  locPaisID           := StringIntegerConverter(edtPaisID.Text);

  locUsuarioBaseID    := gloUsuarioBaseID;
  locUsuarioID        := gloUsuarioID;
  locHostName         := HostNameRecuperar;
  locUserName         := UserNameRecuperar;
  locUpdContador      := StringIntegerConverter(edtUpdContador.Text);

  //
  // Determina se ser� um insert ou update.
  //
  locInsert := True;

  if locFilialEnderecoSq > 0 then locInsert := False;

  //
  // Consiste as informa��es.
  //
  if locVigenciaIniDt <= 0 then
  begin
    VCLConsistenciaExibir('A data inicial da vig�ncia deve ser informada!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, medVigenciaIniDt);
    Exit;
  end;

  if locVigenciaFimDt <= 0 then
  begin
    VCLConsistenciaExibir('A data final da vig�ncia deve ser informada!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, medVigenciaFimDt);
    Exit;
  end;

  if locVigenciaFimDt < locVigenciaIniDt then
  begin
    VCLConsistenciaExibir('A data final da vig�ncia n�o pode ser anterior a data inicial!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, medVigenciaIniDt);
    Exit;
  end;

  if locLogradouroID <= 0 then
  begin
    VCLConsistenciaExibir('Um logradouro deve ser selecionado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtLogradouroCodigo);
    Exit;
  end;

  if locEndereco = '' then
  begin
    VCLConsistenciaExibir('O endere�o deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtEndereco);
    Exit;
  end;

  if locNumero = '' then
  begin
    VCLConsistenciaExibir('O n�mero do endere�o deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtNumero);
    Exit;
  end;

  if locBairro = '' then
  begin
    VCLConsistenciaExibir('O bairro do endere�o deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtBairro);
    Exit;
  end;

  if locCidade = '' then
  begin
    VCLConsistenciaExibir('A cidade do endere�o deve ser informada!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCidade);
    Exit;
  end;

  if locEstado = '' then
  begin
    VCLConsistenciaExibir('O estado do endere�o deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtEstado);
    Exit;
  end;

  if locPaisID <= 0 then
  begin
    VCLConsistenciaExibir('O pa�s do endere�o deve ser selecionado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtPaisCodigo);
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
  // Determina o pr�ximo [filial_endereco_sq] do endere�o da filial.
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
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar o pr�ximo [filial_endereco_sq] na tabela [filial_endereco]!';
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
  // Determina o pr�ximo [sequencial] do endere�o da filial.
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
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar o pr�ximo [sequencial] na tabela [filial_endereco]!';
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
    locADOQuery.SQL.Add('  [estrangeiro],                ');
    locADOQuery.SQL.Add('  [logradouro_id],              ');
    locADOQuery.SQL.Add('  [endereco],                   ');
    locADOQuery.SQL.Add('  [numero],                     ');
    locADOQuery.SQL.Add('  [complemento],                ');
    locADOQuery.SQL.Add('  [bairro],                     ');
    locADOQuery.SQL.Add('  [cidade],                     ');
    locADOQuery.SQL.Add('  [estado],                     ');
    locADOQuery.SQL.Add('  [cep],                        ');
    locADOQuery.SQL.Add('  [generico],                   ');
    locADOQuery.SQL.Add('  [pais_id],                    ');
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
    locADOQuery.SQL.Add('  :estrangeiro,                 '); // [estrangeiro].
    locADOQuery.SQL.Add('  :logradouro_id,               '); // [logradouro_id].
    locADOQuery.SQL.Add('  :endereco,                    '); // [endereco].
    locADOQuery.SQL.Add('  :numero,                      '); // [numero].
    locADOQuery.SQL.Add('  :complemento,                 '); // [complemento].
    locADOQuery.SQL.Add('  :bairro,                      '); // [bairro].
    locADOQuery.SQL.Add('  :cidade,                      '); // [cidade].
    locADOQuery.SQL.Add('  :estado,                      '); // [estado].
    locADOQuery.SQL.Add('  :cep,                         '); // [cep].
    locADOQuery.SQL.Add('  :generico,                    '); // [generico].
    locADOQuery.SQL.Add('  :pais_id,                     '); // [pais_id].
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
    locADOQuery.SQL.Add('  [estrangeiro]         = :estrangeiro,      ');
    locADOQuery.SQL.Add('  [logradouro_id]       = :logradouro_id,    ');
    locADOQuery.SQL.Add('  [endereco]            = :endereco,         ');
    locADOQuery.SQL.Add('  [numero]              = :numero,           ');
    locADOQuery.SQL.Add('  [complemento]         = :complemento,      ');
    locADOQuery.SQL.Add('  [bairro]              = :bairro,           ');
    locADOQuery.SQL.Add('  [cidade]              = :cidade,           ');
    locADOQuery.SQL.Add('  [estado]              = :estado,           ');
    locADOQuery.SQL.Add('  [cep]                 = :cep,              ');
    locADOQuery.SQL.Add('  [generico]            = :generico,         ');
    locADOQuery.SQL.Add('  [pais_id]             = :pais_id,          ');
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
  locADOQuery.Parameters.ParamByName('licenca_id').Value         := locLicencaID;
  locADOQuery.Parameters.ParamByName('filial_base_id').Value     := locFilialBaseID;
  locADOQuery.Parameters.ParamByName('filial_id').Value          := locFilialID;
  locADOQuery.Parameters.ParamByName('filial_endereco_sq').Value := locFilialEnderecoSq;
  locADOQuery.Parameters.ParamByName('sequencial').Value         := locSequencial;
  locADOQuery.Parameters.ParamByName('vigencia_ini_dt').Value    := locVigenciaIniDt;
  locADOQuery.Parameters.ParamByName('vigencia_fim_dt').Value    := locVigenciaFimDt;
  locADOQuery.Parameters.ParamByName('estrangeiro').Value        := BooleanStringConverter(locEstrangeiro);
  locADOQuery.Parameters.ParamByName('logradouro_id').Value      := locLogradouroID;
  locADOQuery.Parameters.ParamByName('endereco').Value           := locEndereco;
  locADOQuery.Parameters.ParamByName('numero').Value             := locNumero;
  locADOQuery.Parameters.ParamByName('complemento').Value        := locComplemento;
  locADOQuery.Parameters.ParamByName('bairro').Value             := locBairro;
  locADOQuery.Parameters.ParamByName('cidade').Value             := locCidade;
  locADOQuery.Parameters.ParamByName('estado').Value             := locEstado;
  locADOQuery.Parameters.ParamByName('cep').Value                := locCEP;
  locADOQuery.Parameters.ParamByName('generico').Value           := BooleanStringConverter(locGenerico);
  locADOQuery.Parameters.ParamByName('pais_id').Value            := locPaisID;
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
  locFilialEnderecoLogDados := LogDadosGerar(locFilialEnderecoSq, locSequencial);

  //
  // Determina o pr�ximo sequencial da tabela filial_endereco_log.
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
  edtFilialEnderecoSq.Text := IntegerStringConverter(locFilialEnderecoSq);
  edtSequencial.Text       := IntegerStringConverter(locSequencial);
  edtInsLocalDtHr.Text     := DateTimeStringConverter(locInsLocalDtHr, 'dd/mm/yyyy hh:nn');
  edtUpdLocalDtHr.Text     := DateTimeStringConverter(locUpdLocalDtHr, 'dd/mm/yyyy hh:nn');
  edtUpdContador.Text      := IntegerStringConverter(locUpdContador);

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
  VCLInformacaoExibir('Endere�o da filial gravado com sucesso!');

  //
  // Recarrega lista atualizada.
  //
  FormularioListaPopular(pubLicencaID, pubFilialBaseID, pubFilialID);
end;

//
// Procedimento para cancelar a edi��o dos dados do formul�rio.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioCancelar;
begin
  //
  // Confirma com o usu�rio.
  //
  if StringIntegerConverter(edtFilialEnderecoSq.Text) = 0 then
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
  FormularioListaPopular(pubLicencaID, pubFilialBaseID, pubFilialID);

  //
  // Componentes desligados para edi��o.
  //
  FormularioControlar(False);
end;

//
// Procedimento para excluir os dados deste cadastro.
//
procedure TPlataformaERPVCLFilialEndereco.FormularioExcluir;
const
  PROCEDIMENTO_NOME: string = 'FormularioExcluir';
  ERRO_MENSAGEM    : string = 'Imposs�vel excluir dados do endere�o da filial!';
var
  locADOConnection         : TADOConnection;
  locADOQuery              : TADOQuery;
  locLogMensagem           : string;
  locFilialEnderecoSq      : Integer;
  locFilialEnderecoLogDados: string;
begin
  //
  // Carrega vari�veis com o conte�do dos componentes.
  //
  locFilialEnderecoSq := StringIntegerConverter(edtFilialEnderecoSq.Text);

  //
  // Log dados.
  //
  locFilialEnderecoLogDados := LogDadosGerar;

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
  FormularioLimpar(False, True);

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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(REGISTRO_ACAO_EXCLUSAO, pubFilialID, IntegerStringConverter(locFilialEnderecoSq), 'filial_endereco', 'Registro exclu�do com sucesso!', locFilialEnderecoLogDados);
  except
  end;
  VCLInformacaoExibir('Endere�o da filial exclu�do com sucesso!');

  //
  // Recarrega lista atualizada.
  //
  FormularioListaPopular(pubLicencaID, pubFilialBaseID, pubFilialID);
end;

//
// Fun��o para gerar a string de log dos dados.
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
  LogDadosIntegerDescrever('Licen�a',                pubLicencaID,                Result);
  LogDadosIntegerDescrever('Base da filial',         pubFilialBaseID,             Result);
  LogDadosIntegerDescrever('ID da filial',           pubFilialID,                 Result);
  LogDadosIntegerDescrever('Sequencial do endere�o', locFilialEnderecoSq,         Result);
  LogDadosIntegerDescrever('Sequencial',             locSequencial,               Result);
  LogDadosStringDescrever ('Vig�ncia inicial',       medVigenciaIniDt.Text,       Result);
  LogDadosStringDescrever ('Vig�ncia final',         medVigenciaFimDt.Text,       Result);
  LogDadosBooleanDescrever('Estrangeiro',            chkEstrangeiro.Checked,      Result);
  LogDadosStringDescrever ('CEP',                    edtCEP.Text,                 Result);
  LogDadosStringDescrever ('ID do logradouro',       edtLogradouroID.Text,        Result);
  LogDadosStringDescrever ('C�digo do logradouro',   edtLogradouroCodigo.Text,    Result);
  LogDadosStringDescrever ('Logradouro',             edtLogradouroDescricao.Text, Result);
  LogDadosStringDescrever ('Endere�o',               edtEndereco.Text,            Result);
  LogDadosStringDescrever ('N�mero',                 edtNumero.Text,              Result);
  LogDadosStringDescrever ('Complemento',            edtComplemento.Text,         Result);
  LogDadosStringDescrever ('Bairro',                 edtBairro.Text,              Result);
  LogDadosStringDescrever ('Cidade',                 edtCidade.Text,              Result);
  LogDadosStringDescrever ('Estado',                 edtEstado.Text,              Result);
  LogDadosStringDescrever ('ID do pa�s',             edtPaisID.Text,              Result);
  LogDadosStringDescrever ('C�digo do pa�s',         edtPaisCodigo.Text,          Result);
  LogDadosStringDescrever ('pa�s',                   edtPaisNome.Text,            Result);
end;

end.
