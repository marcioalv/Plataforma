//
// Arquivo..: Plataforma_ERP_VCL_FilialCadastro.pas
// Projeto..: ERP
// Fonte....: Formulário VCL
// Criação..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Formulário com o cadastro de filial.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_FilialCadastro;

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
  TPlataformaERPVCLFilialCadastro = class(TForm)
    imgFormulario: TImage;
    pagFormulario: TPageControl;
    tabCadastro: TTabSheet;
    tabAuditoria: TTabSheet;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    lblNome: TLabel;
    edtDescricao: TEdit;
    lblInsDtHt: TLabel;
    edtInsLocalDtHr: TEdit;
    lblUpdDtHr: TLabel;
    edtUpdLocalDtHr: TEdit;
    lblUpdContador: TLabel;
    edtUpdContador: TEdit;
    lblFilialID: TLabel;
    edtFilialID: TEdit;
    lblFilialBase: TLabel;
    edtFilialBaseDescricao: TEdit;
    edtFilialBaseID: TEdit;
    lblLicenca: TLabel;
    edtLicencaDescricao: TEdit;
    edtLicencaID: TEdit;
    lblCodigoCadastrado: TLabel;
    edtCodigoCadastrado: TEdit;
    imgBackground: TImage;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnMinimizar: TBitBtn;
    btnAlterar: TBitBtn;
    btnFechar: TBitBtn;
    btnNovo: TBitBtn;
    btnLog: TBitBtn;
    mnuFormulario: TMainMenu;
    mniFechar: TMenuItem;
    mniCancelar: TMenuItem;
    mniMinimizar: TMenuItem;
    mniGravar: TMenuItem;
    mniAlterar: TMenuItem;
    mniExcluir: TMenuItem;
    mniNovo: TMenuItem;
    mniAtualizar: TMenuItem;
    mniAdicional: TMenuItem;
    gbxOpcoes: TGroupBox;
    chkBloqueado: TCheckBox;
    chkAtivo: TCheckBox;
    mniCadastroRegimeTributario: TMenuItem;
    edtCodigoCadastradoBaseID: TEdit;
    edtCodigoCadastradoID: TEdit;
    mniLog: TMenuItem;
    lblRazaoSocial: TLabel;
    edtRazaoSocial: TEdit;
    tabDados: TTabSheet;
    lblRegimeTributario: TLabel;
    imgRegimeTributarioSelecionar: TImage;
    edtRegimeTributarioCodigo: TEdit;
    edtRegimeTributarioDescricao: TEdit;
    edtRegimeTributarioID: TEdit;
    edtRegimeTributarioBaseID: TEdit;
    lblFantasia: TLabel;
    edtFantasia: TEdit;
    lblCPF_CNPJ: TLabel;
    edtCPF_CNPJ: TEdit;
    lblEmpresa: TLabel;
    edtEmpresaCodigo: TEdit;
    edtEmpresaDescricao: TEdit;
    edtEmpresaBaseID: TEdit;
    edtEmpresaID: TEdit;
    imgEmpresaSelecionar: TImage;
    btnEndereco: TBitBtn;
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
    procedure edtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure chkBloqueadoEnter(Sender: TObject);
    procedure chkBloqueadoExit(Sender: TObject);
    procedure chkBloqueadoKeyPress(Sender: TObject; var Key: Char);
    procedure chkAtivoEnter(Sender: TObject);
    procedure chkAtivoExit(Sender: TObject);
    procedure chkAtivoKeyPress(Sender: TObject; var Key: Char);
    procedure btnLogClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure edtLicencaDescricaoClick(Sender: TObject);
    procedure edtFilialBaseDescricaoClick(Sender: TObject);
    procedure edtInsLocalDtHrClick(Sender: TObject);
    procedure edtUpdLocalDtHrClick(Sender: TObject);
    procedure edtRegimeTributarioCodigoEnter(Sender: TObject);
    procedure edtRegimeTributarioCodigoExit(Sender: TObject);
    procedure edtRegimeTributarioCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtRegimeTributarioCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure imgRegimeTributarioSelecionarClick(Sender: TObject);
    procedure edtRegimeTributarioDescricaoClick(Sender: TObject);
    procedure mniFecharClick(Sender: TObject);
    procedure mniCancelarClick(Sender: TObject);
    procedure mniMinimizarClick(Sender: TObject);
    procedure mniGravarClick(Sender: TObject);
    procedure mniAlterarClick(Sender: TObject);
    procedure mniExcluirClick(Sender: TObject);
    procedure mniNovoClick(Sender: TObject);
    procedure mniAtualizarClick(Sender: TObject);
    procedure mniLogClick(Sender: TObject);
    procedure edtCodigoCadastradoClick(Sender: TObject);
    procedure edtRazaoSocialEnter(Sender: TObject);
    procedure edtRazaoSocialExit(Sender: TObject);
    procedure edtRazaoSocialKeyPress(Sender: TObject; var Key: Char);
    procedure edtFantasiaEnter(Sender: TObject);
    procedure edtFantasiaExit(Sender: TObject);
    procedure edtFantasiaKeyPress(Sender: TObject; var Key: Char);
    procedure edtCPF_CNPJEnter(Sender: TObject);
    procedure edtCPF_CNPJExit(Sender: TObject);
    procedure edtCPF_CNPJKeyPress(Sender: TObject; var Key: Char);
    procedure edtEmpresaCodigoEnter(Sender: TObject);
    procedure edtEmpresaCodigoExit(Sender: TObject);
    procedure edtEmpresaCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtEmpresaCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure imgEmpresaSelecionarClick(Sender: TObject);
    procedure edtEmpresaDescricaoClick(Sender: TObject);
    procedure btnEnderecoClick(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioControlar(argEditar: Boolean);
    procedure FormularioLogExibir;

    procedure FormularioAtualizar;
    procedure FormularioNovo;

    procedure FormularioPopular(argLicencaID   : Integer;
                                argFilialBaseID: Integer;
                                argFilialID    : Integer);

    procedure FormularioAlterar;
    procedure FormularioGravar;
    procedure FormularioCancelar;
    procedure FormularioExcluir;
    procedure FormularioCodigoSugerir;

    function LogDadosGerar(argFilialID: Integer = 0): string;
  public
    pubDadosAtualizados: Boolean;
    pubLicencaID       : Integer;
    pubFilialBaseID    : Integer;
    pubFilialID        : Integer;
  end;

var
  PlataformaERPVCLFilialCadastro: TPlataformaERPVCLFilialCadastro;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico,
  Plataforma_ERP_VCL_FilialEndereco;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_FilialCadastro.pas';

  TAB_CADASTRO : Byte = 0;
  TAB_AUDITORIA: Byte = 1;

//
// Evento de criação do formulário.
//
procedure TPlataformaERPVCLFilialCadastro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis públicas.
  //
  pubDadosAtualizados := False;
  pubLicencaID        := 0;
  pubFilialBaseID     := 0;
  pubFilialID         := 0;
 
  //
  // Limpa os componentes do formulário.
  //
  FormularioLimpar;

  //
  // Componentes desligados para edição.
  //
  FormularioControlar(False);
end;

//
// Evento de exibição do formulário.
//
procedure TPlataformaERPVCLFilialCadastro.FormShow(Sender: TObject);
begin
  //
  // Background do formulário.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);

  //
  // Controla os componentes de exibição de cadastro.
  //
  VCLEditClickControlar(edtCodigoCadastrado,          False);
  VCLEditClickControlar(edtEmpresaDescricao,          False);
  VCLEditClickControlar(edtRegimeTributarioDescricao, False);
  VCLEditClickControlar(edtLicencaDescricao,          False);
  VCLEditClickControlar(edtFilialBaseDescricao,       False);
  VCLEditClickControlar(edtInsLocalDtHr,              False);
  VCLEditClickControlar(edtUpdLocalDtHr,              False);

  //
  // Se nenhuma chave foi passada então é um novo cadastro.
  //
  if (pubLicencaID = 0) and (pubFilialBaseID = 0) and (pubFilialID = 0) then
  begin
    FormularioNovo;
    Exit;
  end;

  //
  // Se foi passada uma chave então popula formulário.
  //
  if (pubLicencaID > 0) and (pubFilialBaseID > 0) and (pubFilialID > 0) then
  begin
    FormularioPopular(pubLicencaID, pubFilialBaseID, pubFilialID);
    FormularioControlar(False);
    Exit;
  end;
end;

//
// Evento de pressionamento de teclas no formulário.
//
procedure TPlataformaERPVCLFilialCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Evento de click nas opções do menu.
//
procedure TPlataformaERPVCLFilialCadastro.mniLogClick(Sender: TObject);
begin
  FormularioLogExibir;
end;

procedure TPlataformaERPVCLFilialCadastro.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

procedure TPlataformaERPVCLFilialCadastro.mniNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

procedure TPlataformaERPVCLFilialCadastro.mniExcluirClick(Sender: TObject);
begin
  FormularioExcluir;
end;

procedure TPlataformaERPVCLFilialCadastro.mniAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

procedure TPlataformaERPVCLFilialCadastro.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

procedure TPlataformaERPVCLFilialCadastro.mniCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

procedure TPlataformaERPVCLFilialCadastro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLFilialCadastro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "código".
//
procedure TPlataformaERPVCLFilialCadastro.edtCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigo) then Exit;
end;

procedure TPlataformaERPVCLFilialCadastro.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLFilialCadastro.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLFilialCadastro.edtCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigo) then Exit;
end;

//
// Evento de click no código sugerido.
//
procedure TPlataformaERPVCLFilialCadastro.edtCodigoCadastradoClick(Sender: TObject);
var
  locFormulario      : TPlataformaERPVCLFilialCadastro;
  locDadosAtualizados: Boolean;
begin
  locFormulario := TPlataformaERPVCLFilialCadastro.Create(Self);

  locFormulario.pubLicencaID     := StringIntegerConverter(edtLicencaID.Text);
  locFormulario.pubFilialBaseID := StringIntegerConverter(edtCodigoCadastradoBaseID.Text);
  locFormulario.pubFilialID     := StringIntegerConverter(edtCodigoCadastradoID.Text);

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
// Eventos do componente "descrição".
//
procedure TPlataformaERPVCLFilialCadastro.edtDescricaoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtDescricao) then Exit;
end;

procedure TPlataformaERPVCLFilialCadastro.edtDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLFilialCadastro.edtDescricaoExit(Sender: TObject);
begin
  if not VCLEditSair(edtDescricao) then Exit;
end;

//
// Eventos do componente "razão social".
//
procedure TPlataformaERPVCLFilialCadastro.edtRazaoSocialEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtRazaoSocial) then Exit;
end;

procedure TPlataformaERPVCLFilialCadastro.edtRazaoSocialKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLFilialCadastro.edtRazaoSocialExit(Sender: TObject);
begin
  if not VCLEditSair(edtRazaoSocial) then Exit;
end;

//
// Eventos do componente "nome de fantasia".
//
procedure TPlataformaERPVCLFilialCadastro.edtFantasiaEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtFantasia) then Exit;
end;

procedure TPlataformaERPVCLFilialCadastro.edtFantasiaKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLFilialCadastro.edtFantasiaExit(Sender: TObject);
begin
  if not VCLEditSair(edtFantasia) then Exit;
end;

//
// Eventos do componente "bloqueado".
//
procedure TPlataformaERPVCLFilialCadastro.chkBloqueadoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkBloqueado) then Exit;
end;

procedure TPlataformaERPVCLFilialCadastro.chkBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLFilialCadastro.chkBloqueadoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkBloqueado) then Exit;
end;

//
// Ativo.
//
procedure TPlataformaERPVCLFilialCadastro.chkAtivoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkAtivo) then Exit;
end;

procedure TPlataformaERPVCLFilialCadastro.chkAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLFilialCadastro.chkAtivoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkAtivo) then Exit;
end;


//
// Eventos do componente "CPF/CNPJ".
//
procedure TPlataformaERPVCLFilialCadastro.edtCPF_CNPJEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCPF_CNPJ) then Exit;
end;

procedure TPlataformaERPVCLFilialCadastro.edtCPF_CNPJKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLFilialCadastro.edtCPF_CNPJExit(Sender: TObject);
begin
  if not VCLEditSair(edtCPF_CNPJ) then Exit;
  if not VCLEditCPFCNPJValidar(edtCPF_CNPJ) then Exit;
end;

//
// Eventos do componente "empresa".
//
procedure TPlataformaERPVCLFilialCadastro.edtEmpresaCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtEmpresaCodigo) then Exit;
end;

procedure TPlataformaERPVCLFilialCadastro.edtEmpresaCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLFilialCadastro.edtEmpresaCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then imgEmpresaSelecionarClick(Sender);
end;

procedure TPlataformaERPVCLFilialCadastro.edtEmpresaCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtEmpresaCodigo) then Exit;

  if not Plataforma_ERP_VCL_EmpresaValidar((edtFilialID.Text = STR_NOVO),
                                           edtLicencaID,
                                           edtEmpresaBaseID,
                                           edtEmpresaID,
                                           edtEmpresaCodigo,
                                           edtEmpresaDescricao) then Exit;
end;

procedure TPlataformaERPVCLFilialCadastro.imgEmpresaSelecionarClick(Sender: TObject);
begin
  if not Plataforma_ERP_VCL_EmpresaSelecionar(edtLicencaID, edtEmpresaBaseID, edtEmpresaID, edtEmpresaCodigo, edtEmpresaDescricao) then Exit;
end;

procedure TPlataformaERPVCLFilialCadastro.edtEmpresaDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_EmpresaExibir(StringIntegerConverter(edtLicencaID.Text),
                                   StringIntegerConverter(edtEmpresaBaseID.Text),
                                   StringIntegerConverter(edtEmpresaID.Text));
end;

//
// Eventos do componente "regime tributário".
//
procedure TPlataformaERPVCLFilialCadastro.edtRegimeTributarioCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtRegimeTributarioCodigo) then Exit;
end;

procedure TPlataformaERPVCLFilialCadastro.edtRegimeTributarioCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLFilialCadastro.edtRegimeTributarioCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then imgRegimeTributarioSelecionarClick(Sender);
end;

procedure TPlataformaERPVCLFilialCadastro.edtRegimeTributarioCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtRegimeTributarioCodigo) then Exit;
  
  if not Plataforma_ERP_VCL_RegimeTributarioValidar((edtFilialID.Text = STR_NOVO),
                                                     edtRegimeTributarioID,
                                                     edtRegimeTributarioCodigo,
                                                     edtRegimeTributarioDescricao) then Exit;
end;

procedure TPlataformaERPVCLFilialCadastro.imgRegimeTributarioSelecionarClick(Sender: TObject);
begin
  if not Plataforma_ERP_VCL_RegimeTributarioSelecionar(edtRegimeTributarioID, edtRegimeTributarioCodigo, edtRegimeTributarioDescricao) then Exit;
end;

procedure TPlataformaERPVCLFilialCadastro.edtRegimeTributarioDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_RegimeTributarioExibir(StringIntegerConverter(edtRegimeTributarioID.Text));
end;

//
// Evento de click no botão "endereço".
//
procedure TPlataformaERPVCLFilialCadastro.btnEnderecoClick(Sender: TObject);
var
  locFormulario: TPlataformaERPVCLFilialEndereco;
begin
  locFormulario := TPlataformaERPVCLFilialEndereco.Create(Self);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Evento de click no título da licença.
//
procedure TPlataformaERPVCLFilialCadastro.edtLicencaDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_LicencaCadastroExibir(StringIntegerConverter(edtLicencaID.Text));
end;

//
// Evento de click no título da base.
//
procedure TPlataformaERPVCLFilialCadastro.edtFilialBaseDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_BaseCadastroExibir(StringIntegerConverter(edtFilialBaseID.Text));
end;

//
// Evento de click na data de criação.
//
procedure TPlataformaERPVCLFilialCadastro.edtInsLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtInsLocalDtHr.Text));
end;

//
// Evento de click na data da última alteração.
//
procedure TPlataformaERPVCLFilialCadastro.edtUpdLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtUpdLocalDtHr.Text));
end;

//
// Evento de click no botão "log alterações".
//
procedure TPlataformaERPVCLFilialCadastro.btnLogClick(Sender: TObject);
begin
  FormularioLogExibir;
end;

//
// Evento de click no botão "novo".
//
procedure TPlataformaERPVCLFilialCadastro.btnNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

//
// Evento de click no botão "alterar".
//
procedure TPlataformaERPVCLFilialCadastro.btnAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

//
// Evento de click no botão "gravar".
//
procedure TPlataformaERPVCLFilialCadastro.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no botão "minimizar".
//
procedure TPlataformaERPVCLFilialCadastro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no botão "cancelar".
//
procedure TPlataformaERPVCLFilialCadastro.btnCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

//
// Evento de click no botão "fechar".
//
procedure TPlataformaERPVCLFilialCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formulário.
//
procedure TPlataformaERPVCLFilialCadastro.FormularioLimpar;
begin 
  //
  // Posiciona pagecontrole na primeira aba.
  //
  VCLPageControlInicializar(pagFormulario);

  // Limpa componentes da aba "cadastro".
  VCLEditLimpar(edtCodigo);
  VCLEditLimpar(edtDescricao);
  VCLEditLimpar(edtRazaoSocial);
  VCLEditLimpar(edtFantasia);
  VCLEditLimpar(edtCPF_CNPJ);

  VCLEditLimpar(edtEmpresaBaseID);
  VCLEditLimpar(edtEmpresaID);
  VCLEditLimpar(edtEmpresaCodigo);
  VCLEditLimpar(edtEmpresaDescricao);

  VCLEditLimpar(edtRegimeTributarioID);
  VCLEditLimpar(edtRegimeTributarioCodigo);
  VCLEditLimpar(edtRegimeTributarioDescricao);

  VCLCheckBoxLimpar(chkBloqueado);
  VCLCheckBoxLimpar(chkAtivo);

  VCLEditLimpar(edtCodigoCadastrado);
  VCLEditLimpar(edtCodigoCadastradoBaseID);
  VCLEditLimpar(edtCodigoCadastradoID);

  //
  // Limpa componentes da aba "auditoria".
  //
  VCLEditLimpar(edtLicencaID);
  VCLEditLimpar(edtLicencaDescricao);
  VCLEditLimpar(edtFilialBaseID);
  VCLEditLimpar(edtFilialBaseDescricao);
  VCLEditLimpar(edtFilialID);
  VCLEditLimpar(edtInsLocalDtHr);
  VCLEditLimpar(edtUpdLocalDtHr);
  VCLEditLimpar(edtUpdContador);
end;

//
// Procedimento para controlar os componentes do formulário.
//
procedure TPlataformaERPVCLFilialCadastro.FormularioControlar(argEditar: Boolean);
var
  locDadosPopulados: Boolean;
  locIdentificador : string;
begin
  //
  // Determina se existem dados populados no formulário.
  //
  locDadosPopulados := (StringIntegerConverter(edtFilialID.Text) > 0);

  //
  // Controla os componentes do formulário.
  //
  VCLEditControlar(edtCodigo,                 argEditar);
  VCLEditControlar(edtDescricao,              argEditar);
  VCLEditControlar(edtRazaoSocial,            argEditar);
  VCLEditControlar(edtFantasia,               argEditar);
  VCLEditControlar(edtCPF_CNPJ,               argEditar);
  VCLEditControlar(edtEmpresaCodigo,          argEditar);
  VCLEditControlar(edtRegimeTributarioCodigo, argEditar);
  gbxOpcoes.Enabled := argEditar;

  //
  // Exibe o último código cadastrado somente se for um novo cadastro.
  //
  lblCodigoCadastrado.Visible := (argEditar) and (not locDadosPopulados);
  edtCodigoCadastrado.Visible := (argEditar) and (not locDadosPopulados);

  //
  // Controla os componentes de exibição de cadastro.
  //
  VCLEditClickControlar(edtEmpresaDescricao,          True);
  VCLEditClickControlar(edtRegimeTributarioDescricao, True);
  VCLEditClickControlar(edtLicencaDescricao,          True);
  VCLEditClickControlar(edtFilialBaseDescricao,       True);
  VCLEditClickControlar(edtInsLocalDtHr,              True);
  VCLEditClickControlar(edtUpdLocalDtHr,              True);

  //
  // Controle os componentes com seleção de dados.
  //
  VCLEditSelecaoControlar(edtEmpresaDescricao,          imgEmpresaSelecionar,          argEditar);
  VCLEditSelecaoControlar(edtRegimeTributarioDescricao, imgRegimeTributarioSelecionar, argEditar);

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

  mniCadastroRegimeTributario.Visible := Plataforma_ERP_UsuarioRotina('ERP_REGIME_TRIBUTARIO_LISTA');

  mniAdicional.Visible := (mniLog.Visible) or
                          (mniCadastroRegimeTributario.Visible);
                          
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
  Self.Caption     := 'Filial';
  locIdentificador := ': ' + edtDescricao.Text;

  if (not locDadosPopulados) and (argEditar) then Self.Caption := Self.Caption + ' - novo cadastro';
  if locDadosPopulados and argEditar         then Self.Caption := Self.Caption + ' - alterando cadastro'   + locIdentificador;
  if locDadosPopulados and (not argEditar)   then Self.Caption := Self.Caption + ' - consultando cadastro' + locIdentificador;
end;

//
// Procedimento para carregar e exibir o log de alterações do registro.
//
procedure TPlataformaERPVCLFilialCadastro.FormularioLogExibir;
const
  PROCEDIMENTO_NOME: string = 'FormularioLogExibir';
  ERRO_MENSAGEM    : string = 'Impossível consultar dados sobre os logs do registro!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
  locLicencaID    : Integer;
  locFilialBaseID : Integer;
  locFilialID     : Integer;
begin
  //
  // Carrega chave do registro.
  //
  locLicencaID    := StringIntegerConverter(edtLicencaID.Text);
  locFilialBaseID := StringIntegerConverter(edtFilialBaseID.Text);
  locFilialID     := StringIntegerConverter(edtFilialID.Text);

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
  locADOQuery.SQL.Add('SELECT                                                                       ');
  locADOQuery.SQL.Add('  [filial_log].[filial_log_sq]       AS [sequencial],                        ');
  locADOQuery.SQL.Add('  [base].[base_id]                   AS [log_base_id],                       ');
  locADOQuery.SQL.Add('  [base].[descricao]                 AS [log_base_descricao],                ');
  locADOQuery.SQL.Add('  [filial_log].[log_local_dt_hr]     AS [log_local_dt_hr],                   ');
  locADOQuery.SQL.Add('  [filial_log].[log_server_dt_hr]    AS [log_server_dt_hr],                  ');
  locADOQuery.SQL.Add('  [registro_acao].[registro_acao_id] AS [registro_acao_id],                  ');
  locADOQuery.SQL.Add('  [registro_acao].[descricao]        AS [registro_acao_descricao],           ');
  locADOQuery.SQL.Add('  [filial_log].[host_name]           AS [host_name],                         ');
  locADOQuery.SQL.Add('  [filial_log].[user_name]           AS [user_name],                         ');
  locADOQuery.SQL.Add('  [usuario].[usuario_base_id]        AS [usuario_base_id],                   ');
  locADOQuery.SQL.Add('  [usuario].[usuario_id]             AS [usuario_id],                        ');
  locADOQuery.SQL.Add('  [usuario].[nome]                   AS [usuario_nome],                      ');
  locADOQuery.SQL.Add('  [filial_log].[mensagem]            AS [mensagem],                          ');
  locADOQuery.SQL.Add('  [filial_log].[dados]               AS [dados]                              ');
  locADOQuery.SQL.Add('FROM                                                                         ');  
  locADOQuery.SQL.Add('  [filial_log] WITH (NOLOCK)                                                 ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                                            ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [filial_log].[log_base_id]                         ');
  locADOQuery.SQL.Add('  INNER JOIN [registro_acao] WITH (NOLOCK)                                   ');
  locADOQuery.SQL.Add('    ON [registro_acao].[registro_acao_id] = [filial_log].[registro_acao_id]  ');
  locADOQuery.SQL.Add('  INNER JOIN [usuario] WITH (NOLOCK)                                         ');
  locADOQuery.SQL.Add('    ON [usuario].[licenca_id]      = [filial_log].[licenca_id]          AND  ');
  locADOQuery.SQL.Add('       [usuario].[usuario_base_id] = [filial_log].[log_usuario_base_id] AND  ');
  locADOQuery.SQL.Add('       [usuario].[usuario_id]      = [filial_log].[log_usuario_id]           ');
  locADOQuery.SQL.Add('WHERE                                                                        ');
  locADOQuery.SQL.Add('  [filial_log].[licenca_id]     = :licenca_id     AND                        ');
  locADOQuery.SQL.Add('  [filial_log].[filial_base_id] = :filial_base_id AND                        ');
  locADOQuery.SQL.Add('  [filial_log].[filial_id]      = :filial_id                                 ');
  locADOQuery.SQL.Add('ORDER BY                                                                     ');
  locADOQuery.SQL.Add('  [filial_log].[filial_log_sq] ASC                                           ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value     := locLicencaID;
  locADOQuery.Parameters.ParamByName('filial_base_id').Value := locFilialBaseID;
  locADOQuery.Parameters.ParamByName('filial_id').Value      := locFilialID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar registros da tabela [filial_log]!';
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
    Plataforma_ERP_VCL_LogRegistroExibir('Filial: ' + edtDescricao.Text, locADOQuery);
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
// Procedimento para atualizar os dados populados nos componentes do formulário.
//
procedure TPlataformaERPVCLFilialCadastro.FormularioAtualizar;
begin
  //
  // Popula componentes com as informações do cadastro.
  //
  FormularioPopular(StringIntegerConverter(edtLicencaID.Text),
                    StringIntegerConverter(edtFilialBaseID.Text),
                    StringIntegerConverter(edtFilialID.Text));

  //
  // Controla a exibição dos componentes.
  //
  FormularioControlar(False);
end;

//
// Procedimento para iniciar a digitação de dados de um novo cadastro.
//
procedure TPlataformaERPVCLFilialCadastro.FormularioNovo;
begin
  //
  // Limpa os componentes do formulário.
  //
  FormularioLimpar;

  //
  // Carrega conteúdo dos campos necessários.
  //
  edtLicencaID.Text           := IntegerStringConverter(gloLicencaID, True);
  edtLicencaDescricao.Text    := gloLicencaDescricao;
  edtFilialBaseID.Text        := IntegerStringConverter(gloBaseID,    True);
  edtFilialBaseDescricao.Text := gloBaseDescricao;
  edtFilialID.Text            := STR_NOVO;
  chkAtivo.Checked            := True;

  //
  // Exibe o último código cadastrado.
  //
  FormularioCodigoSugerir;

  //
  // Componentes ligados para edição.
  //
  FormularioControlar(True);
  
  //
  // Coloca o foco no código.
  //
  VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
end;

//
// Procedimento para popular os componentes com os dados de um cadastro.
//
procedure TPlataformaERPVCLFilialCadastro.FormularioPopular(argLicencaID   : Integer;
                                                            argFilialBaseID: Integer;
                                                            argFilialID    : Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
  ERRO_MENSAGEM    : string = 'Impossível consultar dados da filial!';
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
  // Consulta dados da filial.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                                             ');
  locADOQuery.SQL.Add('  [licenca].[licenca_id],                                                          ');
  locADOQuery.SQL.Add('  [licenca].[descricao] AS [licenca_descricao],                                    ');
  locADOQuery.SQL.Add('  [base].[base_id]      AS [filial_base_id],                                       ');
  locADOQuery.SQL.Add('  [base].[descricao]    AS [filial_base_descricao],                                ');
  locADOQuery.SQL.Add('  [filial].[filial_id],                                                            ');
  locADOQuery.SQL.Add('  [filial].[codigo],                                                               ');
  locADOQuery.SQL.Add('  [filial].[descricao],                                                            ');
  locADOQuery.SQL.Add('  [filial].[razao_social],                                                         ');
  locADOQuery.SQL.Add('  [filial].[fantasia],                                                             ');
  locADOQuery.SQL.Add('  [filial].[cpf_cnpj],                                                             ');
  locADOQuery.SQL.Add('  [empresa].[empresa_base_id] AS [empresa_base_id],                                ');
  locADOQuery.SQL.Add('  [empresa].[empresa_id]      AS [empresa_id],                                     ');
  locADOQuery.SQL.Add('  [empresa].[codigo]          AS [empresa_codigo],                                 ');
  locADOQuery.SQL.Add('  [empresa].[descricao]       AS [empresa_descricao],                              ');
  locADOQuery.SQL.Add('  [regime_tributario].[regime_tributario_id] AS [regime_tributario_id],            ');
  locADOQuery.SQL.Add('  [regime_tributario].[codigo]               AS [regime_tributario_codigo],        ');
  locADOQuery.SQL.Add('  [regime_tributario].[descricao]            AS [regime_tributario_descricao],     ');
  locADOQuery.SQL.Add('  [filial].[bloqueado],                                                            ');
  locADOQuery.SQL.Add('  [filial].[ativo],                                                                ');
  locADOQuery.SQL.Add('  [filial].[ins_local_dt_hr],                                                      ');
  locADOQuery.SQL.Add('  [filial].[upd_local_dt_hr],                                                      ');
  locADOQuery.SQL.Add('  [filial].[upd_contador]                                                          ');
  locADOQuery.SQL.Add('FROM                                                                               ');
  locADOQuery.SQL.Add('  [filial] WITH (NOLOCK)                                                           ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                                                  ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [filial].[filial_base_id]                                ');
  locADOQuery.SQL.Add('  INNER JOIN [licenca] WITH (NOLOCK)                                               ');
  locADOQuery.SQL.Add('    ON [licenca].[licenca_id] = [filial].[licenca_id]                              ');
  locADOQuery.SQL.Add('  INNER JOIN [empresa] WITH (NOLOCK)                                               ');
  locADOQuery.SQL.Add('    ON [empresa].[licenca_id]      = [filial].[licenca_id]      AND                ');
  locADOQuery.SQL.Add('       [empresa].[empresa_base_id] = [filial].[empresa_base_id] AND                ');
  locADOQuery.SQL.Add('       [empresa].[empresa_id]      = [filial].[empresa_id]                         ');
  locADOQuery.SQL.Add('  INNER JOIN [regime_tributario] WITH (NOLOCK)                                     ');
  locADOQuery.SQL.Add('    ON [regime_tributario].[regime_tributario_id]= [filial].[regime_tributario_id] ');
  locADOQuery.SQL.Add('WHERE                                                                              ');
  locADOQuery.SQL.Add('  [filial].[licenca_id]     = :licenca_id     AND                                  ');
  locADOQuery.SQL.Add('  [filial].[filial_base_id] = :filial_base_id AND                                  ');
  locADOQuery.SQL.Add('  [filial].[filial_id]      = :filial_id                                           ');
                                                              
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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [filial]!';
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
    edtCodigo.Text      := locADOQuery.FieldByName('codigo').AsString;
    edtDescricao.Text   := locADOQuery.FieldByName('descricao').AsString;
    edtRazaoSocial.Text := locADOQuery.FieldByName('razao_social').AsString;
    edtFantasia.Text    := locADOQuery.FieldByName('fantasia').AsString;
    edtCPF_CNPJ.Text    := CPFCNPJFormatar(locADOQuery.FieldByName('cpf_cnpj').AsString);

    edtEmpresaBaseID.Text    := locADOQuery.FieldByName('empresa_base_id').AsString;
    edtEmpresaID.Text        := locADOQuery.FieldByName('empresa_id').AsString;
    edtEmpresaCodigo.Text    := locADOQuery.FieldByName('empresa_codigo').AsString;
    edtEmpresaDescricao.Text := locADOQuery.FieldByName('empresa_descricao').AsString;

    edtRegimeTributarioID.Text        := locADOQuery.FieldByName('regime_tributario_id').AsString;
    edtRegimeTributarioCodigo.Text    := locADOQuery.FieldByName('regime_tributario_codigo').AsString;
    edtRegimeTributarioDescricao.Text := locADOQuery.FieldByName('regime_tributario_descricao').AsString;

    chkBloqueado.Checked := StringBooleanConverter(locADOQuery.FieldByName('bloqueado').AsString);
    chkAtivo.Checked     := StringBooleanConverter(locADOQuery.FieldByName('ativo').AsString);

    edtLicencaID.Text           := locADOQuery.FieldByName('licenca_id').AsString;
    edtLicencaDescricao.Text    := locADOQuery.FieldByName('licenca_descricao').AsString;
    edtFilialBaseID.Text        := locADOQuery.FieldByName('filial_base_id').AsString;
    edtFilialBaseDescricao.Text := locADOQuery.FieldByName('filial_base_descricao').AsString;
    edtFilialID.Text            := IntegerStringConverter(locADOQuery.FieldByName('filial_id').AsInteger, True);
    edtInsLocalDtHr.Text        := DateTimeStringConverter(locADOQuery.FieldByName('ins_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn');
    edtUpdLocalDtHr.Text        := DateTimeStringConverter(locADOQuery.FieldByName('upd_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn');
    edtUpdContador.Text         := IntegerStringConverter(locADOQuery.FieldByName('upd_contador').AsInteger);
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
// Procedimento para alterar os dados do formulário.
//
procedure TPlataformaERPVCLFilialCadastro.FormularioAlterar;
begin
  //
  // Componentes ligados para edição.
  //
  FormularioControlar(True);

  //
  // Coloca o foco no código.
  //
  VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
end;

//
// Procedimento para gravar os dados do formulário.
//
procedure TPlataformaERPVCLFilialCadastro.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioGravar';
  ERRO_MENSAGEM    : string = 'Impossível gravar dados da filial!';
var                    
  locADOConnection     : TADOConnection;
  locADOQuery          : TADOQuery;
  locLogMensagem       : string;

  locInsert            : Boolean;
  locRegistroAcao      : Byte;
  locRegistroAcaoID    : Integer;
  locFilialLogSq       : Integer;
  locFilialLogMsg      : string;
  locFilialLogDados    : string;

  locLicencaID         : Integer;
  locFilialBaseID      : Integer;
  locFilialID          : Integer;
  locCodigo            : string;
  locDescricao         : string;
  locRazaoSocial       : string;
  locFantasia          : string;
  locCPF_CNPJ          : string;
  locEmpresaBaseID     : Integer;
  locEmpresaID         : Integer;
  locRegimeTributarioID: Integer;
  locBloqueado         : Boolean;
  locAtivo             : Boolean;
  locInsLocalDtHr      : TDateTime;
  locUpdLocalDtHr      : TDateTime;
  locUsuarioBaseID     : Integer;
  locUsuarioID         : Integer;
  locUpdContador       : Integer;
  locHostName          : string;
  locUserName          : string;
begin
  //
  // Determina se será um insert ou update.
  //
  if edtFilialID.Text = STR_NOVO then
    locInsert := True
  else
    locInsert := False;

  //
  // Carrega variáveis com o conteúdo dos componentes.
  //
  locLicencaID          := StringIntegerConverter(edtLicencaID.Text);
  locFilialBaseID       := StringIntegerConverter(edtFilialBaseID.Text);
  locFilialID           := StringIntegerConverter(edtFilialID.Text);
  locCodigo             := StringTrim(edtCodigo.Text);
  locDescricao          := StringTrim(edtDescricao.Text);
  locRazaoSocial        := StringTrim(edtRazaoSocial.Text);
  locFantasia           := StringTrim(edtFantasia.Text);
  locCPF_CNPJ           := FormatacaoRemover(edtCPF_CNPJ.Text);
  locEmpresaBaseID      := StringIntegerConverter(edtEmpresaBaseID.Text);
  locEmpresaID          := StringIntegerConverter(edtEmpresaID.Text);
  locRegimeTributarioID := StringIntegerConverter(edtRegimeTributarioID.Text);
  locBloqueado          := chkBloqueado.Checked;
  locAtivo              := chkAtivo.Checked;
  locUsuarioBaseID      := gloUsuarioBaseID;
  locUsuarioID          := gloUsuarioID;
  locHostName           := HostNameRecuperar;
  locUserName           := UserNameRecuperar;
  locUpdContador        := StringIntegerConverter(edtUpdContador.Text);

  //
  // Consiste as informações.
  //
  if locCodigo = '' then
  begin
    VCLConsistenciaExibir('O código da filial deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCodigo);
    Exit;
  end;

  if locDescricao = '' then
  begin
    VCLConsistenciaExibir('A descrição da filial deve ser informada!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtDescricao);
    Exit;
  end;

  if locRazaoSocial = '' then
  begin
    VCLConsistenciaExibir('A razão social da filial deve ser informada!');
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
    VCLConsistenciaExibir('O regime tributário da filial deve ser selecionado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtRegimeTributarioCodigo);
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
  // Determina se o código da filial já existe no banco de dados para um outro registro.
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
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar o mesmo código da filial em um outro registro!';
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
    locLogMensagem := 'O código "' + locCodigo + '" informado para a filial já existe em algum outro cadastro!';
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
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualizações confere na tabela [filial]!';
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
  // Determina o próximo ID da filial.
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
        locLogMensagem := 'Impossível determinar o próximo numerador para a filial!';
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
  // Parâmetros.
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
  // Determina o próximo sequencial da tabela filial_log.
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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o próximo sequencial para o registro na tabela [filial_log]!';
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
  edtFilialID.Text     := IntegerStringConverter(locFilialID);
  edtInsLocalDtHr.Text := DateTimeStringConverter(locInsLocalDtHr, 'dd/mm/yyyy hh:nn');
  edtUpdLocalDtHr.Text := DateTimeStringConverter(locUpdLocalDtHr, 'dd/mm/yyyy hh:nn');
  edtUpdContador.Text  := IntegerStringConverter(locUpdContador);

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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, locFilialID, locCodigo, 'filial', locFilialLogMsg, locFilialLogDados);
  except
    on locExcecao: Exception do
    begin
      VCLErroExibir(locExcecao.Message);
    end;
  end;

  //
  // Filial gravada!
  //
  VCLInformacaoExibir('Filial gravada com sucesso!');
end;

//
// Procedimento para excluir os dados deste cadastro.
//
procedure TPlataformaERPVCLFilialCadastro.FormularioExcluir;
const
  PROCEDIMENTO_NOME: string = 'FormularioExcluir';
  ERRO_MENSAGEM    : string = 'Impossível excluir dados da filial!';
var
  locADOConnection : TADOConnection;
  locADOQuery      : TADOQuery;
  locLogMensagem   : string;
  locLicencaID     : Integer;
  locFilialBaseID  : Integer;
  locFilialID      : Integer;
  locFilialLogDados: string;
begin
  //
  // Carrega variáveis com o conteúdo dos componentes.
  //
  locLicencaID    := StringIntegerConverter(edtLicencaID.Text);
  locFilialBaseID := StringIntegerConverter(edtFilialBaseID.Text);
  locFilialID     := StringIntegerConverter(edtFilialID.Text);

  //
  // Log dados.
  //
  locFilialLogDados := LogDadosGerar;

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
  // Deleta registro da tabela filial_log.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                                           ');
  locADOQuery.SQL.Add('  [filial_log]                                        ');
  locADOQuery.SQL.Add('WHERE                                                 ');
  locADOQuery.SQL.Add('  [filial_log].[licenca_id]     = :licenca_id     AND ');
  locADOQuery.SQL.Add('  [filial_log].[filial_base_id] = :filial_base_id AND ');
  locADOQuery.SQL.Add('  [filial_log].[filial_id]      = :filial_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value     := locLicencaID;
  locADOQuery.Parameters.ParamByName('filial_base_id').Value := locFilialBaseID;
  locADOQuery.Parameters.ParamByName('filial_id').Value      := locFilialID;

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
      locLogMensagem := 'Ocorreu algum problema ao executar query para deletar os registros na tabela [filial_log]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Comando SQL para excluir um registro da tabela filial.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('DELETE FROM                                       ');
  locADOQuery.SQL.Add('  [filial]                                        ');
  locADOQuery.SQL.Add('WHERE                                             ');
  locADOQuery.SQL.Add('  [filial].[licenca_id]     = :licenca_id     AND ');
  locADOQuery.SQL.Add('  [filial].[filial_base_id] = :filial_base_id AND ');
  locADOQuery.SQL.Add('  [filial].[filial_id]      = :filial_id          ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value     := locLicencaID;
  locADOQuery.Parameters.ParamByName('filial_base_id').Value := locFilialBaseID;
  locADOQuery.Parameters.ParamByName('filial_id').Value      := locFilialID;

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
      locLogMensagem := 'Ocorreu algum problema ao executar query para deletar os registros na tabela [filial]!';
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
  FormularioLimpar;

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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(REGISTRO_ACAO_EXCLUSAO, locFilialID, edtCodigo.Text, 'filial', 'Registro excluído com sucesso!', locFilialLogDados);
  except
  end;
  VCLInformacaoExibir('Filial excluída com sucesso!');
end;

//
// Procedimento para cancelar a edição dos dados do formulário.
//
procedure TPlataformaERPVCLFilialCadastro.FormularioCancelar;
var
  locLicencaID   : Integer;
  locFilialBaseID: Integer;
  locFilialID    : Integer;
begin
  //
  // Carrega chave do registro que estava sendo editado.
  //
  locLicencaID    := StringIntegerConverter(edtLicencaID.Text);
  locFilialBaseID := StringIntegerConverter(edtFilialBaseID.Text);
  locFilialID     := StringIntegerConverter(edtFilialID.Text);

  //
  // Confirma com o usuário.
  //
  if locFilialID = 0 then
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
  FormularioPopular(locLicencaID, locFilialBaseID, locFilialID);

  //
  // Componentes desligados para edição.
  //
  FormularioControlar(False);
end;

//
// Procedimento par sugerir o próximo código.
//
procedure TPlataformaERPVCLFilialCadastro.FormularioCodigoSugerir;
const
  PROCEDIMENTO_NOME: string = 'FormularioCodigoSugerir';
  ERRO_MENSAGEM    : string = 'Impossível sugerir informações sobre o próximo código da filial!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
  locLicencaID    : Integer;
begin
  //
  // ID da licença.
  //
  locLicencaID := gloLicencaID;

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
  // Consulta dados do código da filial.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                          ');
  locADOQuery.SQL.Add('  [filial].[filial_base_id],          ');
  locADOQuery.SQL.Add('  [filial].[filial_id],               ');
  locADOQuery.SQL.Add('  [filial].[codigo]                   ');
  locADOQuery.SQL.Add('FROM                                  ');
  locADOQuery.SQL.Add('  [filial] WITH (NOLOCK)              ');
  locADOQuery.SQL.Add('WHERE                                 ');
  locADOQuery.SQL.Add('  [filial].[licenca_id] = :licenca_id ');
  locADOQuery.SQL.Add('ORDER BY                              ');
  locADOQuery.SQL.Add('  [filial].[ins_server_dt_hr] DESC,   ');
  locADOQuery.SQL.Add('  [filial].[codigo] DESC              ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value := locLicencaID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar último cadastro na tabela [filial]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Exit;
    end;
  end;

  //
  // Registro encontrado então carrega componentes.
  //
  if locADOQuery.RecordCount > 0 then
  begin
    edtCodigoCadastrado.Text       := locADOQuery.FieldByName('codigo').AsString;
    edtCodigoCadastradoBaseID.Text := IntegerStringConverter(locADOQuery.FieldByName('filial_base_id').AsInteger);
    edtCodigoCadastradoID.Text     := IntegerStringConverter(locADOQuery.FieldByName('filial_id').AsInteger);

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
// Função para gerar a string de log dos dados.
//
function TPlataformaERPVCLFilialCadastro.LogDadosGerar(argFilialID: Integer = 0): string;
var
  locFilialID: Integer;
begin
  if argFilialID <= 0 then
    locFilialID := StringIntegerConverter(edtFilialID.Text)
  else
    locFilialID := argFilialID;

  Result := '';
  LogDadosStringDescrever ('Licença',                     edtLicencaID.Text,                 Result);
  LogDadosStringDescrever ('Base da filial',              edtFilialBaseID.Text,              Result);
  LogDadosIntegerDescrever('ID da filial',                locFilialID,                       Result);
  LogDadosStringDescrever ('Código',                      edtCodigo.Text,                    Result);
  LogDadosStringDescrever ('Descrição',                   edtDescricao.Text,                 Result);
  LogDadosStringDescrever ('Razão social',                edtRazaoSocial.Text,               Result);
  LogDadosStringDescrever ('Fantasia',                    edtFantasia.Text,                  Result);
  LogDadosStringDescrever ('CPF/CNPJ',                    edtCPF_CNPJ.Text,                  Result);
  LogDadosStringDescrever ('Empresa base ID',             edtEmpresaBaseID.Text,             Result);
  LogDadosStringDescrever ('Empresa ID',                  edtEmpresaID.Text,                 Result);
  LogDadosStringDescrever ('Empresa código',              edtEmpresaCodigo.Text,             Result);
  LogDadosStringDescrever ('Empresa descrição',           edtEmpresaDescricao.Text,          Result);
  LogDadosStringDescrever ('Regime tributário ID',        edtRegimeTributarioID.Text,        Result);
  LogDadosStringDescrever ('Regime tributário código',    edtRegimeTributarioCodigo.Text,    Result);
  LogDadosStringDescrever ('Regime tributário descrição', edtRegimeTributarioDescricao.Text, Result);
  LogDadosBooleanDescrever('Bloqueado',                   chkBloqueado.Checked,              Result);
  LogDadosBooleanDescrever('Ativo',                       chkAtivo.Checked,                  Result);
end;

end.
