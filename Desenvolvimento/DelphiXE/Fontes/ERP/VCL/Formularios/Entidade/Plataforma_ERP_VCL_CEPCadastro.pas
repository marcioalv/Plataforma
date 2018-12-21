//
// Arquivo..: Plataforma_ERP_VCL_CEPCadastro.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 14/Agosto/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com o cadastro do CEP.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_CEPCadastro;

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
  TPlataformaERPVCLCEPCadastro = class(TForm)
    imgFormulario: TImage;
    pagFormulario: TPageControl;
    tabCadastro: TTabSheet;
    tabAuditoria: TTabSheet;
    lblCEP: TLabel;
    edtCEP: TEdit;
    lblNome: TLabel;
    edtEndereco: TEdit;
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
    lblCEPID: TLabel;
    edtCEPID: TEdit;
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
    lblCEPCadastrado: TLabel;
    edtCEPCadastrado: TEdit;
    edtCEPCadastradoID: TEdit;
    lblComplemento: TLabel;
    edtComplemento: TEdit;
    lblLogradouro: TLabel;
    edtLogradouroCodigo: TEdit;
    edtLogradouroDescricao: TEdit;
    edtLogradouroID: TEdit;
    imgLogradouroSelecionar: TImage;
    lblCidade: TLabel;
    imgCidadeSelecionar: TImage;
    edtCidadeCodigo: TEdit;
    edtCidadeNome: TEdit;
    edtCidadeID: TEdit;
    Label1: TLabel;
    imgBairroSelecionar: TImage;
    edtBairroCodigo: TEdit;
    edtBairroNome: TEdit;
    edtBairroID: TEdit;
    lblEstado: TLabel;
    edtEstadoNome: TEdit;
    edtEstadoID: TEdit;
    lblPais: TLabel;
    edtPaisNome: TEdit;
    edtPaisID: TEdit;
    gbxGenerico: TGroupBox;
    chkGenerico: TCheckBox;
    gbxEstrangeiro: TGroupBox;
    chkEstrangeiro: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure edtCEPEnter(Sender: TObject);
    procedure edtCEPExit(Sender: TObject);
    procedure edtCEPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCEPKeyPress(Sender: TObject; var Key: Char);
    procedure edtEnderecoEnter(Sender: TObject);
    procedure edtEnderecoExit(Sender: TObject);
    procedure edtEnderecoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtEnderecoKeyPress(Sender: TObject; var Key: Char);
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
    procedure edtCEPCadastradoClick(Sender: TObject);
    procedure edtComplementoKeyPress(Sender: TObject; var Key: Char);
    procedure edtComplementoEnter(Sender: TObject);
    procedure edtComplementoExit(Sender: TObject);
    procedure edtLogradouroCodigoExit(Sender: TObject);
    procedure edtLogradouroCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtLogradouroCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtLogradouroCodigoEnter(Sender: TObject);
    procedure imgLogradouroSelecionarClick(Sender: TObject);
    procedure edtLogradouroDescricaoClick(Sender: TObject);
    procedure edtBairroCodigoEnter(Sender: TObject);
    procedure edtBairroCodigoExit(Sender: TObject);
    procedure edtBairroCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtBairroCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure imgBairroSelecionarClick(Sender: TObject);
    procedure edtBairroNomeClick(Sender: TObject);
    procedure edtCidadeCodigoEnter(Sender: TObject);
    procedure edtCidadeCodigoExit(Sender: TObject);
    procedure edtCidadeCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtCidadeCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure imgCidadeSelecionarClick(Sender: TObject);
    procedure edtCidadeNomeClick(Sender: TObject);
    procedure edtEstadoNomeClick(Sender: TObject);
    procedure edtPaisNomeClick(Sender: TObject);
  private
    procedure FormularioLimpar;
    procedure FormularioControlar(argEditar: Boolean);
    procedure FormularioAtualizar;
    procedure FormularioNovo;

    procedure FormularioPopular(argCEPID: Integer);

    procedure FormularioAlterar;
    procedure FormularioGravar;
    procedure FormularioCancelar;
    procedure FormularioExcluir;
    procedure FormularioCEPSugerir;
    function  LogDadosGerar(argCEPID: Integer = 0): string;
  public
    pubDadosAtualizados: Boolean;
    pubCEPID           : Integer;
  end;

var
  PlataformaERPVCLCEPCadastro: TPlataformaERPVCLCEPCadastro;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_CEPCadastro.pas';

  TAB_CADASTRO : Byte = 0;
  TAB_AUDITORIA: Byte = 1;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLCEPCadastro.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas.
  //
  pubDadosAtualizados := False;
  pubCEPID            := 0;
 
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
procedure TPlataformaERPVCLCEPCadastro.FormShow(Sender: TObject);
begin
  //
  // Background do formul�rio.
  //
  Plataforma_ERP_VCL_FormularioBackground(imgBackground);
  
  //
  // Se nenhuma chave foi passada ent�o � um novo cadastro.
  //
  if pubCEPID = 0 then
  begin
    FormularioNovo;
    Exit;
  end;

  //
  // Se foi passada uma chave ent�o popula formul�rio.
  //
  if pubCEPID > 0 then
  begin
    FormularioPopular(pubCEPID);
    FormularioControlar(False);
    Exit;
  end;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLCEPCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos de click nas op��es do menu.
//
procedure TPlataformaERPVCLCEPCadastro.mniAtualizarClick(Sender: TObject);
begin
  FormularioAtualizar;
end;

procedure TPlataformaERPVCLCEPCadastro.mniNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

procedure TPlataformaERPVCLCEPCadastro.mniExcluirClick(Sender: TObject);
begin
  FormularioExcluir;
end;

procedure TPlataformaERPVCLCEPCadastro.mniAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

procedure TPlataformaERPVCLCEPCadastro.mniGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

procedure TPlataformaERPVCLCEPCadastro.mniCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

procedure TPlataformaERPVCLCEPCadastro.mniMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

procedure TPlataformaERPVCLCEPCadastro.mniFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Eventos do componente "CEP".
//
procedure TPlataformaERPVCLCEPCadastro.edtCEPEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCEP) then Exit;
end;

procedure TPlataformaERPVCLCEPCadastro.edtCEPKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLCEPCadastro.edtCEPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLCEPCadastro.edtCEPExit(Sender: TObject);
begin
  if not VCLEditSair(edtCEP) then Exit;
  if not VCLEditCEPValidar(edtCEP, chkEstrangeiro.Checked) then Exit;
end;

//
// Evento de click no c�digo sugerido.
//
procedure TPlataformaERPVCLCEPCadastro.edtCEPCadastradoClick(Sender: TObject);
var
  locFormulario      : TPlataformaERPVCLCEPCadastro;
  locDadosAtualizados: Boolean;
begin
  locFormulario := TPlataformaERPVCLCEPCadastro.Create(Self);

  locFormulario.pubCEPID := StringIntegerConverter(edtCEPID.Text);

  locFormulario.ShowModal;

  locDadosAtualizados := locFormulario.pubDadosAtualizados;

  locFormulario.Release;
  FreeAndNil(locFormulario);

  if locDadosAtualizados then
  begin
    FormularioCEPSugerir;
  end;
end;

//
// Eventos do componente "logradouro".
//
procedure TPlataformaERPVCLCEPCadastro.edtLogradouroCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtLogradouroCodigo) then Exit;
end;

procedure TPlataformaERPVCLCEPCadastro.edtLogradouroCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLCEPCadastro.edtLogradouroCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then imgLogradouroSelecionarClick(Sender);
end;

procedure TPlataformaERPVCLCEPCadastro.edtLogradouroCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtLogradouroCodigo) then Exit;

  if not Plataforma_ERP_VCL_LogradouroValidar((edtCEPID.Text = STR_NOVO),
                                              edtLogradouroID,
                                              edtLogradouroCodigo,
                                              edtLogradouroDescricao) then Exit;
end;

procedure TPlataformaERPVCLCEPCadastro.imgLogradouroSelecionarClick(Sender: TObject);
begin
  if not Plataforma_ERP_VCL_LogradouroSelecionar(edtLogradouroID, edtLogradouroCodigo, edtLogradouroDescricao) then Exit;
end;

procedure TPlataformaERPVCLCEPCadastro.edtLogradouroDescricaoClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_LogradouroExibir(StringIntegerConverter(edtLogradouroID.Text));
end;

//
// Eventos do componente "endere�o".
//
procedure TPlataformaERPVCLCEPCadastro.edtEnderecoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtEndereco) then Exit;
end;

procedure TPlataformaERPVCLCEPCadastro.edtEnderecoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLCEPCadastro.edtEnderecoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLCEPCadastro.edtEnderecoExit(Sender: TObject);
begin
  if not VCLEditSair(edtEndereco) then Exit;
end;

//
// Eventos do componente "complemento".
//
procedure TPlataformaERPVCLCEPCadastro.edtComplementoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtComplemento) then Exit;
end;

procedure TPlataformaERPVCLCEPCadastro.edtComplementoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLCEPCadastro.edtComplementoExit(Sender: TObject);
begin
  if not VCLEditSair(edtComplemento) then Exit
end;

//
// Eventos do componente "bairro".
//
procedure TPlataformaERPVCLCEPCadastro.edtBairroCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtBairroCodigo) then Exit;
end;

procedure TPlataformaERPVCLCEPCadastro.edtBairroCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLCEPCadastro.edtBairroCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then imgBairroSelecionarClick(Sender);
end;

procedure TPlataformaERPVCLCEPCadastro.edtBairroCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtBairroCodigo) then Exit;

  if not Plataforma_ERP_VCL_BairroValidar((edtCEPID.Text = STR_NOVO),
                                          edtBairroID,
                                          edtBairroCodigo,
                                          edtBairroNome,
                                          edtCidadeID,
                                          edtCidadeCodigo,
                                          edtCidadeNome,
                                          edtEstadoID,
                                          nil,
                                          edtEstadoNome,
                                          edtPaisID,
                                          nil,
                                          edtPaisNome) then Exit;
end;

procedure TPlataformaERPVCLCEPCadastro.imgBairroSelecionarClick(Sender: TObject);
begin
  if not Plataforma_ERP_VCL_BairroSelecionar(edtBairroID,
                                             edtBairroCodigo,
                                             edtBairroNome,
                                             edtCidadeID,
                                             edtCidadeCodigo,
                                             edtCidadeNome,
                                             edtEstadoID,
                                             nil,
                                             edtEstadoNome,
                                             edtPaisID,
                                             nil,
                                             edtPaisNome) then Exit;
end;

procedure TPlataformaERPVCLCEPCadastro.edtBairroNomeClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_BairroExibir(StringIntegerConverter(edtBairroID.Text));
end;

//
// Eventos do componente "cidade".
//
procedure TPlataformaERPVCLCEPCadastro.edtCidadeCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCidadeCodigo) then Exit;
end;

procedure TPlataformaERPVCLCEPCadastro.edtCidadeCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLCEPCadastro.edtCidadeCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = F2 then imgCidadeSelecionarClick(Sender);
end;

procedure TPlataformaERPVCLCEPCadastro.edtCidadeCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtCidadeCodigo) then Exit;

  if not Plataforma_ERP_VCL_CidadeValidar((edtCEPID.Text = STR_NOVO),
                                          edtCidadeID,
                                          edtCidadeCodigo,
                                          edtCidadeNome,
                                          edtEstadoID,
                                          nil,
                                          edtEstadoNome,
                                          edtPaisID,
                                          nil,
                                          edtPaisNome) then Exit;
end;

procedure TPlataformaERPVCLCEPCadastro.imgCidadeSelecionarClick(Sender: TObject);
begin
  if not Plataforma_ERP_VCL_CidadeSelecionar(edtCidadeID,
                                             edtCidadeCodigo,
                                             edtCidadeNome,
                                             edtEstadoID,
                                             nil,
                                             edtEstadoNome,
                                             edtPaisID,
                                             nil,
                                             edtPaisNome) then Exit;
end;

procedure TPlataformaERPVCLCEPCadastro.edtCidadeNomeClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_CidadeExibir(StringIntegerConverter(edtCidadeID.Text));
end;

//
// Eventos do componbente "estado".
//
procedure TPlataformaERPVCLCEPCadastro.edtEstadoNomeClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_EstadoExibir(StringIntegerConverter(edtEstadoID.Text));
end;

//
// Eventos do componente "pa�s".
//
procedure TPlataformaERPVCLCEPCadastro.edtPaisNomeClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_PaisExibir(StringIntegerConverter(edtPaisID.Text));
end;

//
// Eventos do componente "bloqueado".
//
procedure TPlataformaERPVCLCEPCadastro.chkBloqueadoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkBloqueado) then Exit;
end;

procedure TPlataformaERPVCLCEPCadastro.chkBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLCEPCadastro.chkBloqueadoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkBloqueado) then Exit;
end;

//
// Eventos do componente "ativo".
//
procedure TPlataformaERPVCLCEPCadastro.chkAtivoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkAtivo) then Exit;
end;

procedure TPlataformaERPVCLCEPCadastro.chkAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLCEPCadastro.chkAtivoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkAtivo) then Exit;
end;

//
// Evento de click na data de cria��o.
//
procedure TPlataformaERPVCLCEPCadastro.edtInsLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtInsLocalDtHr.Text));
end;

//
// Evento de click na data da �ltima altera��o.
//
procedure TPlataformaERPVCLCEPCadastro.edtUpdLocalDtHrClick(Sender: TObject);
begin
  Plataforma_ERP_VCL_DataExibir(StringDateTimeConverter(edtUpdLocalDtHr.Text));
end;

//
// Evento de click no bot�o "novo".
//
procedure TPlataformaERPVCLCEPCadastro.btnNovoClick(Sender: TObject);
begin
  FormularioNovo;
end;

//
// Evento de click no bot�o "alterar".
//
procedure TPlataformaERPVCLCEPCadastro.btnAlterarClick(Sender: TObject);
begin
  FormularioAlterar;
end;

//
// Evento de click no bot�o "gravar".
//
procedure TPlataformaERPVCLCEPCadastro.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no bot�o "minimizar".
//
procedure TPlataformaERPVCLCEPCadastro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "cancelar".
//
procedure TPlataformaERPVCLCEPCadastro.btnCancelarClick(Sender: TObject);
begin
  FormularioCancelar;
end;

//
// Evento de click no bot�o "fechar".
//
procedure TPlataformaERPVCLCEPCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLCEPCadastro.FormularioLimpar;
begin 
  //
  // Posiciona pagecontrole na primeira aba.
  //
  VCLPageControlInicializar(pagFormulario);

  // Limpa componentes da aba "cadastro".
  VCLEditLimpar(edtCEP);
  VCLCheckBoxLimpar(chkEstrangeiro);
  VCLCheckBoxLimpar(chkGenerico);

  VCLEditLimpar(edtLogradouroID);
  VCLEditLimpar(edtLogradouroCodigo);
  VCLEditLimpar(edtLogradouroDescricao);

  VCLEditLimpar(edtEndereco);
  VCLEditLimpar(edtComplemento);

  VCLEditLimpar(edtBairroID);
  VCLEditLimpar(edtBairroCodigo);
  VCLEditLimpar(edtBairroNome);
  
  VCLEditLimpar(edtCidadeID);
  VCLEditLimpar(edtCidadeCodigo);
  VCLEditLimpar(edtCidadeNome);

  VCLEditLimpar(edtEstadoID);
  VCLEditLimpar(edtEstadoNome); 

  VCLEditLimpar(edtPaisID);
  VCLEditLimpar(edtPaisNome); 

  VCLCheckBoxLimpar(chkBloqueado);
  VCLCheckBoxLimpar(chkAtivo);

  VCLEditLimpar(edtCEPCadastrado);
  VCLEditLimpar(edtCEPCadastradoID);

  //
  // Limpa componentes da aba "auditoria".
  //
  VCLEditLimpar(edtCEPID);
  VCLEditLimpar(edtInsLocalDtHr);
  VCLEditLimpar(edtUpdLocalDtHr);
  VCLEditLimpar(edtUpdContador);

  //
  // Controla os componentes de exibi��o de cadastro.
  //
  VCLEditClickControlar(edtCEPCadastrado,       False);
  VCLEditClickControlar(edtLogradouroDescricao, False);
  VCLEditClickControlar(edtBairroNome,          False);
  VCLEditClickControlar(edtCidadeNome,          False);
  VCLEditClickControlar(edtEstadoNome,          False);
  VCLEditClickControlar(edtPaisNome,            False);
  VCLEditClickControlar(edtInsLocalDtHr,        False);
  VCLEditClickControlar(edtUpdLocalDtHr,        False);
end;

//
// Procedimento para controlar os componentes do formul�rio.
//
procedure TPlataformaERPVCLCEPCadastro.FormularioControlar(argEditar: Boolean);
var
  locDadosPopulados: Boolean;
  locIdentificador : string;
begin
  //
  // Determina se existem dados populados no formul�rio.
  //
  locDadosPopulados := (StringIntegerConverter(edtCEPID.Text) > 0);

  //
  // Controla os componentes do formul�rio.
  //
  VCLEditControlar(edtCEP,              argEditar);
  gbxEstrangeiro.Enabled := argEditar;
  gbxGenerico.Enabled    := argEditar;
  VCLEditControlar(edtLogradouroCodigo, argEditar);
  VCLEditControlar(edtEndereco,         argEditar);
  VCLEditControlar(edtComplemento,      argEditar);
  VCLEditControlar(edtBairroCodigo,     argEditar);
  VCLEditControlar(edtCidadeCodigo,     argEditar);
  gbxOpcoes.Enabled := argEditar;

  //
  // Exibe o �ltimo c�digo cadastrado somente se for um novo cadastro.
  //
  lblCEPCadastrado.Visible := (argEditar) and (not locDadosPopulados);
  edtCEPCadastrado.Visible := (argEditar) and (not locDadosPopulados);

  //
  // Controla os componentes de exibi��o de cadastro.
  //
  VCLEditClickControlar(edtLogradouroDescricao, True);
  VCLEditClickControlar(edtBairroNome,          True);
  VCLEditClickControlar(edtCidadeNome,          True);
  VCLEditClickControlar(edtEstadoNome,          True);
  VCLEditClickControlar(edtPaisNome,            True);
  VCLEditClickControlar(edtInsLocalDtHr,        True);
  VCLEditClickControlar(edtUpdLocalDtHr,        True);

  //
  // Controle os componentes com sele��o de dados.
  //
  VCLEditSelecaoControlar(edtLogradouroDescricao, imgLogradouroSelecionar, argEditar);
  VCLEditSelecaoControlar(edtBairroNome,          imgBairroSelecionar,     argEditar);
  VCLEditSelecaoControlar(edtCidadeNome,          imgCidadeSelecionar,     argEditar);
  
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
  tabCadastro.TabVisible  := Plataforma_ERP_UsuarioRotina('ERP_CEP_CADASTRO_ABA_CADASTRO');
  tabAuditoria.TabVisible := Plataforma_ERP_UsuarioRotina('ERP_CEP_CADASTRO_ABA_AUDITORIA');
      
  mniAtualizar.Visible := (mniAtualizar.Visible) and (Plataforma_ERP_UsuarioRotina('ERP_CEP_CADASTRO_ATUALIZAR'));
  mniNovo.Visible      := (mniNovo.Visible)      and (Plataforma_ERP_UsuarioRotina('ERP_CEP_CADASTRO_NOVO'));
  mniExcluir.Visible   := (mniExcluir.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_CEP_CADASTRO_EXCLUIR'));
  mniAlterar.Visible   := (mniAlterar.Visible)   and (Plataforma_ERP_UsuarioRotina('ERP_CEP_CADASTRO_ALTERAR'));

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
  Self.Caption     := 'CEP';
  locIdentificador := ': ' + edtCEP.Text;

  if (not locDadosPopulados) and (argEditar) then Self.Caption := Self.Caption + ' - novo cadastro';
  if locDadosPopulados and argEditar         then Self.Caption := Self.Caption + ' - alterando cadastro'   + locIdentificador;
  if locDadosPopulados and (not argEditar)   then Self.Caption := Self.Caption + ' - consultando cadastro' + locIdentificador;
end;

//
// Procedimento para atualizar os dados populados nos componentes do formul�rio.
//
procedure TPlataformaERPVCLCEPCadastro.FormularioAtualizar;
begin
  //
  // Popula componentes com as informa��es do cadastro.
  //
  FormularioPopular(StringIntegerConverter(edtCEPID.Text));

  //
  // Controla a exibi��o dos componentes.
  //
  FormularioControlar(False);
end;

//
// Procedimento para iniciar a digita��o de dados de um novo cadastro.
//
procedure TPlataformaERPVCLCEPCadastro.FormularioNovo;
begin
  //
  // Limpa os componentes do formul�rio.
  //
  FormularioLimpar;

  //
  // Carrega conte�do dos campos necess�rios.
  //
  edtCEPID.Text    := STR_NOVO;
  chkAtivo.Checked := True;

  //
  // Exibe o �ltimo CEP cadastrado.
  //
  FormularioCEPSugerir;

  //
  // Componentes ligados para edi��o.
  //
  FormularioControlar(True);
  
  //
  // Coloca o foco no c�digo.
  //
  VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCEP);
end;

//
// Procedimento para popular os componentes com os dados de um cadastro.
//
procedure TPlataformaERPVCLCEPCadastro.FormularioPopular(argCEPID: Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
  ERRO_MENSAGEM    : string = 'Imposs�vel consultar dados do CEP!';
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
  // Consulta dados do CEP.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                      ');
  locADOQuery.SQL.Add('  [cep].[cep_id],                                           ');
  locADOQuery.SQL.Add('  [cep].[cep],                                              ');
  locADOQuery.SQL.Add('  [cep].[estrangeiro],                                      ');  
  locADOQuery.SQL.Add('  [cep].[generico],                                         ');  

  locADOQuery.SQL.Add('  [logradouro].[logradouro_id] AS [logradouro_id],          ');
  locADOQuery.SQL.Add('  [logradouro].[codigo]        AS [logradouro_codigo],      ');
  locADOQuery.SQL.Add('  [logradouro].[descricao]     AS [logradouro_descricao],   ');  
  locADOQuery.SQL.Add('  [cep].[endereco],                                         ');
  locADOQuery.SQL.Add('  [cep].[complemento],                                      ');
  locADOQuery.SQL.Add('  [bairro].[bairro_id] AS [bairro_id],                      ');
  locADOQuery.SQL.Add('  [bairro].[codigo]    AS [bairro_codigo],                  ');
  locADOQuery.SQL.Add('  [bairro].[nome]      AS [bairro_nome],                    ');
  locADOQuery.SQL.Add('  [cidade].[cidade_id] AS [cidade_id],                      ');
  locADOQuery.SQL.Add('  [cidade].[codigo]    AS [cidade_codigo],                  ');
  locADOQuery.SQL.Add('  [cidade].[nome]      AS [cidade_nome],                    ');  
  locADOQuery.SQL.Add('  [estado].[estado_id] AS [estado_id],                      ');
  locADOQuery.SQL.Add('  [estado].[nome]      AS [estado_nome],                    ');
  locADOQuery.SQL.Add('  [pais].[pais_id]     AS [pais_id],                        ');
  locADOQuery.SQL.Add('  [pais].[nome]        AS [pais_nome],                      ');
  locADOQuery.SQL.Add('  [cep].[bloqueado],                                        ');
  locADOQuery.SQL.Add('  [cep].[ativo],                                            ');
  locADOQuery.SQL.Add('  [cep].[ins_local_dt_hr],                                  ');
  locADOQuery.SQL.Add('  [cep].[upd_local_dt_hr],                                  ');
  locADOQuery.SQL.Add('  [cep].[upd_contador]                                      ');
  locADOQuery.SQL.Add('FROM                                                        ');
  locADOQuery.SQL.Add('  [cep] WITH (NOLOCK)                                       ');
  locADOQuery.SQL.Add('  LEFT OUTER JOIN [logradouro] WITH (NOLOCK)                ');
  locADOQuery.SQL.Add('    ON [logradouro].[logradouro_id] = [cep].[logradouro_id] ');
  locADOQuery.SQL.Add('  LEFT OUTER JOIN [bairro] WITH (NOLOCK)                    ');
  locADOQuery.SQL.Add('    ON [bairro].[bairro_id] = [cep].[bairro_id]             ');
  locADOQuery.SQL.Add('  LEFT OUTER JOIN [cidade] WITH (NOLOCK)                    ');
  locADOQuery.SQL.Add('    ON [cidade].[cidade_id] = [cep].[cidade_id]             ');
  locADOQuery.SQL.Add('  LEFT OUTER JOIN [estado] WITH (NOLOCK)                    ');
  locADOQuery.SQL.Add('    ON [estado].[estado_id] = [cidade].[estado_id]          ');
  locADOQuery.SQL.Add('  LEFT OUTER JOIN [pais] WITH (NOLOCK)                      ');
  locADOQuery.SQL.Add('    ON [pais].[pais_id] = [estado].[pais_id]                ');
  locADOQuery.SQL.Add('WHERE                                                       ');
  locADOQuery.SQL.Add('  [cep].[cep_id] = :cep_id                                  ');

  locADOQuery.Parameters.ParamByName('cep_id').Value := argCEPID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [cep]!';
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
    edtCEP.Text            := locADOQuery.FieldByName('cep').AsString;
    chkEstrangeiro.Checked := StringBooleanConverter(locADOQuery.FieldByName('estrangeiro').AsString);
    chkGenerico.Checked    := StringBooleanConverter(locADOQuery.FieldByName('generico').AsString);

    edtLogradouroID.Text        := IntegerStringConverter(locADOQuery.FieldByName('logradouro_id').AsInteger);
    edtLogradouroCodigo.Text    := locADOQuery.FieldByName('logradouro_codigo').AsString;
    edtLogradouroDescricao.Text := locADOQuery.FieldByName('logradouro_descricao').AsString;
    
    edtEndereco.Text    := locADOQuery.FieldByName('endereco').AsString;
    edtComplemento.Text := locADOQuery.FieldByName('complemento').AsString;

    edtBairroID.Text     := IntegerStringConverter(locADOQuery.FieldByName('bairro_id').AsInteger);
    edtBairroCodigo.Text := locADOQuery.FieldByName('bairro_codigo').AsString;
    edtBairroNome.Text   := locADOQuery.FieldByName('bairro_nome').AsString;

    edtCidadeID.Text     := IntegerStringConverter(locADOQuery.FieldByName('cidade_id').AsInteger);
    edtCidadeCodigo.Text := locADOQuery.FieldByName('cidade_codigo').AsString;
    edtCidadeNome.Text   := locADOQuery.FieldByName('cidade_nome').AsString;

    edtEstadoID.Text     := IntegerStringConverter(locADOQuery.FieldByName('estado_id').AsInteger);
    edtEstadoNome.Text   := locADOQuery.FieldByName('estado_nome').AsString;

    edtPaisID.Text       := IntegerStringConverter(locADOQuery.FieldByName('pais_id').AsInteger);
    edtPaisNome.Text     := locADOQuery.FieldByName('pais_nome').AsString;

    chkBloqueado.Checked := StringBooleanConverter(locADOQuery.FieldByName('bloqueado').AsString);
    chkAtivo.Checked     := StringBooleanConverter(locADOQuery.FieldByName('ativo').AsString);

    edtCEPID.Text        := IntegerStringConverter(locADOQuery.FieldByName('cep_id').AsInteger, True);
    edtInsLocalDtHr.Text := DateTimeStringConverter(locADOQuery.FieldByName('ins_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn:ss');
    edtUpdLocalDtHr.Text := DateTimeStringConverter(locADOQuery.FieldByName('upd_local_dt_hr').AsDateTime, 'dd/mm/yyyy hh:nn:ss');
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

//
// Procedimento para alterar os dados do formul�rio.
//
procedure TPlataformaERPVCLCEPCadastro.FormularioAlterar;
begin
  //
  // Componentes ligados para edi��o.
  //
  FormularioControlar(True);

  //
  // Coloca o foco no c�digo.
  //
  VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCEP);
end;

//
// Procedimento para gravar os dados do formul�rio.
//
procedure TPlataformaERPVCLCEPCadastro.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioGravar';
  ERRO_MENSAGEM    : string = 'Imposs�vel gravar dados do CEP!';
var
  locADOConnection : TADOConnection;
  locADOQuery      : TADOQuery;
  locLogMensagem   : string;

  locInsert        : Boolean;
  locRegistroAcao  : Byte;
  locCEPLogSq      : Integer;
  locCEPLogMsg     : string;
  locCEPLogDados   : string;

  locCEPID         : Integer;
  locCEP           : string;
  locEstrangeiro   : Boolean;
  locGenerico      : Boolean;
  locLogradouroID  : Integer;
  locEndereco      : string;
  locComplemento   : string;
  locBairroID      : Integer;
  locCidadeID      : Integer;
  locBloqueado     : Boolean;
  locAtivo         : Boolean;
  locInsLocalDtHr  : TDateTime;
  locUpdLocalDtHr  : TDateTime;
  locUsuarioBaseID : Integer;
  locUsuarioID     : Integer;
  locUpdContador   : Integer;
  locHostName      : string;
  locUserName      : string;
begin
  //
  // Determina se ser� um insert ou update.
  //
  if edtCEPID.Text = STR_NOVO then
    locInsert := True
  else
    locInsert := False;

  //
  // Carrega vari�veis com o conte�do dos componentes.
  //
  locCEPID         := StringIntegerConverter(edtCEPID.Text);
  locCEP           := StringTrim(edtCEP.Text);
  locEstrangeiro   := chkEstrangeiro.Checked;
  locGenerico      := chkGenerico.Checked;

  if not locGenerico then
  begin
    locLogradouroID := StringIntegerConverter(edtLogradouroID.Text);
    locEndereco     := StringTrim(edtEndereco.Text);
    locComplemento  := StringTrim(edtComplemento.Text);
    locBairroID     := StringIntegerConverter(edtBairroID.Text);
  end
  else
  begin
    locLogradouroID := 0;
    locEndereco     := '';
    locComplemento  := '';
    locBairroID     := 0;
  end;

  locCidadeID      := StringIntegerConverter(edtCidadeID.Text);
  locBloqueado     := chkBloqueado.Checked;
  locAtivo         := chkAtivo.Checked;
  locUsuarioBaseID := gloUsuarioBaseID;
  locUsuarioID     := gloUsuarioID;
  locHostName      := HostNameRecuperar;
  locUserName      := UserNameRecuperar;
  locUpdContador   := StringIntegerConverter(edtUpdContador.Text);

  //
  // Consiste as informa��es.
  //
  if locCEP = '' then
  begin
    VCLConsistenciaExibir('O c�digo do CEP deve ser informado!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCEP);
    Exit;
  end;

  if not chkGenerico.Checked then
  begin
    if locLogradouroID <= 0 then
    begin
      VCLConsistenciaExibir('Um logradouro para o endere�o deve ser selecionado!');
      VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtLogradouroCodigo);
      Exit;
    end;

    if locEndereco = '' then
    begin
      VCLConsistenciaExibir('O endere�o do CEP deve ser informado!');
      VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtEndereco);
      Exit;
    end;

    if locBairroID <= 0 then
    begin
      VCLConsistenciaExibir('Um bairro para o endere�o deve ser selecionado!');
      VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtBairroCodigo);
      Exit;
    end;
  end;

  if locCidadeID <= 0 then
  begin
    VCLConsistenciaExibir('Uma cidade para o endere�o deve ser selecionada!');
    VCLPageControlFocar(pagFormulario, TAB_CADASTRO, edtCidadeCodigo);
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
  // Determina se o c�digo do CEP j� existe no banco de dados para um outro registro.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT TOP 1                 ');
  locADOQuery.SQL.Add('  1                          ');
  locADOQuery.SQL.Add('FROM                         ');
  locADOQuery.SQL.Add('  [cep] WITH (NOLOCK)        ');
  locADOQuery.SQL.Add('WHERE                        ');
  locADOQuery.SQL.Add('  [cep].[cep]     = :cep AND ');
  locADOQuery.SQL.Add('  [cep].[cep_id] <> :cep_id  ');

  locADOQuery.Parameters.ParamByName('cep').Value    := locCEP;
  locADOQuery.Parameters.ParamByName('cep_id').Value := locCEPID;

  try
    locADOQuery.Open;
  except
    on locExcecao: Exception do
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      locLogMensagem := 'Ocorreu algum problema ao executar query para selecionar o mesmo c�digo do CEP em um outro registro!';
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
    locLogMensagem := 'O c�digo "' + locCEP + '" informado para o CEP j� existe em algum outro cadastro!';
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
    locADOQuery.SQL.Add('SELECT                     ');
    locADOQuery.SQL.Add('  [cep].[upd_contador]     ');
    locADOQuery.SQL.Add('FROM                       ');
    locADOQuery.SQL.Add('  [cep] WITH (NOLOCK)      ');
    locADOQuery.SQL.Add('WHERE                      ');
    locADOQuery.SQL.Add('  [cep].[cep_id] = :cep_id ');

    locADOQuery.Parameters.ParamByName('cep_id').Value := locCEPID;

    try
      locADOQuery.Open;
    except
      on locExcecao: Exception do
      begin
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar se o contador de atualiza��es confere na tabela [cep]!';
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
    locRegistroAcao := REGISTRO_ACAO_CRIACAO;
    locCEPLogMsg    := MENSAGEM_REGISTRO_ACAO_CRIADO;
  end
  else
  begin
    locRegistroAcao := REGISTRO_ACAO_ALTERACAO;
    locCEPLogMsg    := MENSAGEM_REGISTRO_ACAO_ALTERADO;
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
  // Determina o pr�ximo ID do CEP.
  //
  if locInsert then
  begin
    try
      locCEPID := Plataforma_ERP_ADO_NumeradorBaseDeterminar(locADOConnection, NUMERADOR_CEP_ID);
    except
      on locExcecao: Exception do
      begin
        locADOConnection.RollbackTrans;
        locADOQuery.Close;
        FreeAndNil(locADOQuery);
        locADOConnection.Close;
        FreeAndNil(locADOConnection);
        locLogMensagem := 'Imposs�vel determinar o pr�ximo numerador para o CEP!';
        Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
        VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
        Exit
      end;
    end;
  end;

  //
  // Grava dados na tabela CEP.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;

  if locInsert then
  begin
    //
    // Insere dados.
    //
    locADOQuery.SQL.Add('INSERT INTO [cep] (   ');
    locADOQuery.SQL.Add('  [cep_id],           ');
    locADOQuery.SQL.Add('  [cep],              ');
    locADOQuery.SQL.Add('  [estrangeiro],      ');
    locADOQuery.SQL.Add('  [generico],         ');
    locADOQuery.SQL.Add('  [endereco],         ');
    locADOQuery.SQL.Add('  [complemento],      ');    
    locADOQuery.SQL.Add('  [logradouro_id],    ');
    locADOQuery.SQL.Add('  [bairro_id],        ');
    locADOQuery.SQL.Add('  [cidade_id],        ');
    locADOQuery.SQL.Add('  [bloqueado],        ');
    locADOQuery.SQL.Add('  [ativo],            ');
    locADOQuery.SQL.Add('  [ins_local_dt_hr],  ');
    locADOQuery.SQL.Add('  [ins_server_dt_hr], ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr],  ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr], ');
    locADOQuery.SQL.Add('  [upd_contador]      ');
    locADOQuery.SQL.Add(')                     ');
    locADOQuery.SQL.Add('VALUES (              ');
    locADOQuery.SQL.Add('  :cep_id,            '); // [cep_id].
    locADOQuery.SQL.Add('  :cep,               '); // [cep].
    locADOQuery.SQL.Add('  :estrangeiro,       '); // [estrangeiro].
    locADOQuery.SQL.Add('  :generico,          '); // [generico].
    locADOQuery.SQL.Add('  :endereco,          '); // [endereco].
    locADOQuery.SQL.Add('  :complemento,       '); // [complemento].   

    if not locGenerico then
    begin
      locADOQuery.SQL.Add('  :logradouro_id,   '); // [logradouro_id].
      locADOQuery.SQL.Add('  :bairro_id,       '); // [bairro_id].
    end
    else
    begin
      locADOQuery.SQL.Add('  NULL,             '); // [logradouro_id].
      locADOQuery.SQL.Add('  NULL,             '); // [bairro_id].
    end;
    
    locADOQuery.SQL.Add('  :cidade_id,         '); // [cidade_id].
    locADOQuery.SQL.Add('  :bloqueado,         '); // [bloqueado].
    locADOQuery.SQL.Add('  :ativo,             '); // [ativo].
    locADOQuery.SQL.Add('  :local_dt_hr,       '); // [ins_local_dt_hr].
    locADOQuery.SQL.Add('  GETDATE(),          '); // [ins_server_dt_hr].
    locADOQuery.SQL.Add('  NULL,               '); // [upd_local_dt_hr].
    locADOQuery.SQL.Add('  NULL,               '); // [upd_server_dt_hr].
    locADOQuery.SQL.Add('  0                   '); // [upd_contador].
    locADOQuery.SQL.Add(')                     ');
  end                                          
  else
  begin
    //
    // Atualiza dados.
    //
    locADOQuery.SQL.Add('UPDATE                                    ');
    locADOQuery.SQL.Add('  [cep]                                   ');
    locADOQuery.SQL.Add('SET                                       ');
    locADOQuery.SQL.Add('  [cep]              = :cep,              ');
    locADOQuery.SQL.Add('  [estrangeiro]      = :estrangeiro,      ');
    locADOQuery.SQL.Add('  [generico]         = :generico,         ');
    locADOQuery.SQL.Add('  [endereco]         = :endereco,         ');
    locADOQuery.SQL.Add('  [complemento]      = :complemento,      ');

    if not locGenerico then
    begin
      locADOQuery.SQL.Add('  [logradouro_id]    = :logradouro_id,  ');
      locADOQuery.SQL.Add('  [bairro_id]        = :bairro_id,      ');
    end
    else
    begin
      locADOQuery.SQL.Add('  [logradouro_id]    = NULL,            ');
      locADOQuery.SQL.Add('  [bairro_id]        = NULL,            ');
    end;
    
    locADOQuery.SQL.Add('  [cidade_id]        = :cidade_id,        ');
    locADOQuery.SQL.Add('  [bloqueado]        = :bloqueado,        ');
    locADOQuery.SQL.Add('  [ativo]            = :ativo,            ');
    locADOQuery.SQL.Add('  [upd_local_dt_hr]  = :local_dt_hr,      ');
    locADOQuery.SQL.Add('  [upd_server_dt_hr] = GETDATE(),         ');
    locADOQuery.SQL.Add('  [upd_contador]     = [upd_contador] + 1 ');
    locADOQuery.SQL.Add('WHERE                                     ');
    locADOQuery.SQL.Add('  [cep_id] = :cep_id                      ');
  end;

  //
  // Par�metros.
  //
  locADOQuery.Parameters.ParamByName('cep_id').Value        := locCEPID;
  locADOQuery.Parameters.ParamByName('cep').Value           := locCEP;
  locADOQuery.Parameters.ParamByName('estrangeiro').Value   := BooleanStringConverter(locEstrangeiro);
  locADOQuery.Parameters.ParamByName('generico').Value      := BooleanStringConverter(locGenerico);
  locADOQuery.Parameters.ParamByName('endereco').Value      := locEndereco;
  locADOQuery.Parameters.ParamByName('complemento').Value   := locComplemento;  

  if not locGenerico then
  begin
    locADOQuery.Parameters.ParamByName('logradouro_id').Value := locLogradouroID;
    locADOQuery.Parameters.ParamByName('bairro_id').Value     := locBairroID;
  end;
  
  locADOQuery.Parameters.ParamByName('cidade_id').Value     := locCidadeID;
  locADOQuery.Parameters.ParamByName('bloqueado').Value     := BooleanStringConverter(locBloqueado);
  locADOQuery.Parameters.ParamByName('ativo').Value         := BooleanStringConverter(locAtivo);
  locADOQuery.Parameters.ParamByName('local_dt_hr').Value   := Now;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para inserir o registro na tabela [cep]!';
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
  locADOQuery.SQL.Add('SELECT                     ');
  locADOQuery.SQL.Add('  [cep].[ins_local_dt_hr], ');
  locADOQuery.SQL.Add('  [cep].[upd_local_dt_hr], ');
  locADOQuery.SQL.Add('  [cep].[upd_contador]     ');
  locADOQuery.SQL.Add('FROM                       ');
  locADOQuery.SQL.Add('  [cep]                    ');
  locADOQuery.SQL.Add('WHERE                      ');
  locADOQuery.SQL.Add('  [cep].[cep_id] = :cep_id ');

  locADOQuery.Parameters.ParamByName('cep_id').Value := locCEPID;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para determinar o novo contador de updates do registro na tabela [cep]!';
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
  locCEPLogDados := LogDadosGerar(locCEPID);

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
  edtCEPID.Text        := IntegerStringConverter(locCEPID);
  edtInsLocalDtHr.Text := DateTimeStringConverter(locInsLocalDtHr, 'dd/mm/yyyy hh:nn:ss');
  edtUpdLocalDtHr.Text := DateTimeStringConverter(locUpdLocalDtHr, 'dd/mm/yyyy hh:nn:ss');
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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(locRegistroAcao, locCEPID, locCEP, 'cep', locCEPLogMsg, locCEPLogDados);
  except
    on locExcecao: Exception do
    begin
      VCLErroExibir(locExcecao.Message);
    end;
  end;

  //
  // CEP gravado!
  //
  VCLInformacaoExibir('CEP gravado com sucesso!');
end;

//
// Procedimento para excluir os dados deste cadastro.
//
procedure TPlataformaERPVCLCEPCadastro.FormularioExcluir;
const
  PROCEDIMENTO_NOME: string = 'FormularioExcluir';
  ERRO_MENSAGEM    : string = 'Imposs�vel excluir dados do CEP!';
var
  locADOConnection : TADOConnection;
  locADOQuery      : TADOQuery;
  locLogMensagem   : string;
  locCEPID         : Integer;
  locCEPLogDados   : string;
begin
  //
  // Carrega vari�veis com o conte�do dos componentes.
  //
  locCEPID := StringIntegerConverter(edtCEPID.Text);

  //
  // Log dados.
  //
  locCEPLogDados := LogDadosGerar;

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
  // Comando SQL para excluir um registro da tabela cep.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;                  
  locADOQuery.SQL.Add('DELETE FROM                ');
  locADOQuery.SQL.Add('  [cep]                    ');
  locADOQuery.SQL.Add('WHERE                      ');
  locADOQuery.SQL.Add('  [cep].[cep_id] = :cep_id ');

  locADOQuery.Parameters.ParamByName('cep_id').Value := locCEPID;

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
      locLogMensagem := 'Ocorreu algum problema ao executar query para deletar os registros na tabela [cep]!';
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
    Plataforma_ERP_ADO_LogOcorrenciaInserir(REGISTRO_ACAO_EXCLUSAO, locCEPID, edtCEP.Text, 'cep', 'Registro exclu�do com sucesso!', locCEPLogDados);
  except
  end;
  VCLInformacaoExibir('CEP exclu�do com sucesso!');
end;

//
// Procedimento para cancelar a edi��o dos dados do formul�rio.
//
procedure TPlataformaERPVCLCEPCadastro.FormularioCancelar;
var
  locCEPID: Integer;
begin
  //
  // Carrega chave do registro que estava sendo editado.
  //
  locCEPID := StringIntegerConverter(edtCEPID.Text);

  //
  // Confirma com o usu�rio.
  //
  if locCEPID = 0 then
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
  FormularioPopular(locCEPID);

  //
  // Componentes desligados para edi��o.
  //
  FormularioControlar(False);
end;

//
// Procedimento par sugerir o pr�ximo CEP.
//
procedure TPlataformaERPVCLCEPCadastro.FormularioCEPSugerir;
const
  PROCEDIMENTO_NOME: string = 'FormularioCEPSugerir';
  ERRO_MENSAGEM    : string = 'Imposs�vel sugerir informa��es sobre o pr�ximo c�digo do CEP!';
var
  locADOConnection : TADOConnection;
  locADOQuery      : TADOQuery;
  locLogMensagem   : string;
begin
  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Limpa componente.
  //
  VCLEditLimpar(edtCEPCadastrado);
  VCLEditLimpar(edtCEPCadastradoID);

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
  locADOQuery.SQL.Add('SELECT TOP 1                     ');
  locADOQuery.SQL.Add('  [cep].[cep_id],                ');
  locADOQuery.SQL.Add('  [cep].[cep]                    ');
  locADOQuery.SQL.Add('FROM                             ');
  locADOQuery.SQL.Add('  [cep] WITH (NOLOCK)            ');
  locADOQuery.SQL.Add('ORDER BY                         ');
  locADOQuery.SQL.Add('  [cep].[ins_server_dt_hr] DESC, ');
  locADOQuery.SQL.Add('  [cep].[cep] DESC               ');

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar �ltimo cadastro na tabela [cep]!';
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
    edtCEPCadastrado.Text   := locADOQuery.FieldByName('cep').AsString;
    edtCEPCadastradoID.Text := IntegerStringConverter(locADOQuery.FieldByName('cep_id').AsInteger);

    VCLEditClickControlar(edtCEPCadastrado, True);
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
function TPlataformaERPVCLCEPCadastro.LogDadosGerar(argCEPID: Integer = 0): string;
var
  locCEPID: Integer;
begin
  if argCEPID <= 0 then
    locCEPID := StringIntegerConverter(edtCEPID.Text)
  else
    locCEPID := argCEPID;

  Result := '';
  LogDadosIntegerDescrever('ID do CEP',            locCEPID,                    Result);
  LogDadosStringDescrever ('CEP',                  edtCEP.Text,                 Result);
  LogDadosBooleanDescrever('Estrangeiro',          chkEstrangeiro.Checked,      Result);
  LogDadosBooleanDescrever('Generico',             chkGenerico.Checked,         Result);

  LogDadosStringDescrever ('ID do logradouro',     edtLogradouroID.Text,        Result);
  LogDadosStringDescrever ('C�digo do logradouro', edtLogradouroCodigo.Text,    Result);
  LogDadosStringDescrever ('Logradouro',           edtLogradouroDescricao.Text, Result);

  LogDadosStringDescrever ('Endere�o',             edtEndereco.Text,            Result);
  LogDadosStringDescrever ('Complemento',          edtComplemento.Text,         Result);

  LogDadosStringDescrever ('ID do bairro',         edtBairroID.Text,            Result);
  LogDadosStringDescrever ('C�digo do bairro',     edtBairroCodigo.Text,        Result);
  LogDadosStringDescrever ('Bairro',               edtBairroNome.Text,          Result);

  LogDadosStringDescrever ('ID da cidade',         edtCidadeID.Text,            Result);
  LogDadosStringDescrever ('C�digo do cidade',     edtCidadeCodigo.Text,        Result);
  LogDadosStringDescrever ('Cidade',               edtCidadeNome.Text,          Result);

  LogDadosStringDescrever ('ID da estado',         edtEstadoID.Text,            Result);
  LogDadosStringDescrever ('Estado',               edtEstadoNome.Text,          Result);

  LogDadosStringDescrever ('ID do pa�s',           edtPaisID.Text,              Result);
  LogDadosStringDescrever ('Pa�s',                 edtPaisNome.Text,            Result);

  LogDadosBooleanDescrever('Bloqueado',            chkBloqueado.Checked,        Result);
  LogDadosBooleanDescrever('Ativo',                chkAtivo.Checked,            Result);
end;

end.


