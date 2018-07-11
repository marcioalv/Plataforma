//
// Arquivo..: Plataforma_ERP_VCL_TiposUsuariosCadastro.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio para exibir o cadastro de um tipo de usu�rio.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_TiposUsuariosCadastro;

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
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls;

type
  TPlataformaERPVCLTiposUsuariosCadastro = class(TForm)
    imgFormulario: TImage;
    btnFechar: TBitBtn;
    btnMinimizar: TBitBtn;
    pagFormulario: TPageControl;
    tabCadastro: TTabSheet;
    tabAuditoria: TTabSheet;
    lblCodigo: TLabel;
    edtCodigo: TEdit;
    lblTitulo: TLabel;
    edtTitulo: TEdit;
    lblTipoUsuarioID: TLabel;
    edtTipoUsuarioID: TEdit;
    chkBloqueado: TCheckBox;
    chkAtivo: TCheckBox;
    lblInsDtHt: TLabel;
    edtInsLocalDtHr: TEdit;
    lblUpdDtHr: TLabel;
    edtUpdLocalDtHr: TEdit;
    lblUpdContador: TLabel;
    edtUpdContador: TEdit;
    btnLog: TButton;
    btnGravar: TBitBtn;
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
    procedure edtTituloEnter(Sender: TObject);
    procedure edtTituloExit(Sender: TObject);
    procedure edtTituloKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtTituloKeyPress(Sender: TObject; var Key: Char);
    procedure chkBloqueadoEnter(Sender: TObject);
    procedure chkBloqueadoExit(Sender: TObject);
    procedure chkBloqueadoKeyPress(Sender: TObject; var Key: Char);
    procedure chkAtivoEnter(Sender: TObject);
    procedure chkAtivoExit(Sender: TObject);
    procedure chkAtivoKeyPress(Sender: TObject; var Key: Char);
    procedure btnLogClick(Sender: TObject);
  private
    procedure FormularioLimpar;

    procedure FormularioLogExibir;

    procedure FormularioPopular(argBaseID       : Integer;
                                argLicencaID    : Integer;
                                argTipoUsuarioID: Integer);

    procedure FormularioGravar;
  public
    { Public declarations }
  end;

var
  PlataformaERPVCLTiposUsuariosCadastro: TPlataformaERPVCLTiposUsuariosCadastro;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_Generico,
  Plataforma_ERP_TipoUsuario;

const
  UNIT_NOME    : string = 'Plataforma_ERP_VCL_TipoUsuariosCadastro.pas';

  TAB_CADASTRO : Byte = 0;
  TAB_AUDITORIA: Byte = 1;

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormCreate(Sender: TObject);
begin
  // Limpa os componentes do formul�rio.
  FormularioLimpar;
end;

//
// Evento de exibi��oi do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormShow(Sender: TObject);
begin
  Exit;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos do componente "C�digo".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.edtCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigo) then Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.edtCodigoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.edtCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigo) then Exit;
end;

//
// Eventos do componente "T�tulo".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.edtTituloEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtTitulo) then Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.edtTituloKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_ALFANUMERICA);
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.edtTituloKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.edtTituloExit(Sender: TObject);
begin
  if not VCLEditSair(edtTitulo) then Exit;
end;

//
// Eventos do componente "Bloqueado".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.chkBloqueadoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkBloqueado) then Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.chkBloqueadoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.chkBloqueadoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkBloqueado) then Exit;
end;

//
// Ativo.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.chkAtivoEnter(Sender: TObject);
begin
  if not VCLCheckBoxEntrar(chkAtivo) then Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.chkAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_LIVRE);
end;

procedure TPlataformaERPVCLTiposUsuariosCadastro.chkAtivoExit(Sender: TObject);
begin
  if not VCLCheckBoxSair(chkAtivo) then Exit;
end;

//
// Evento de click no bot�o "Log altera��es".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.btnLogClick(Sender: TObject);
begin
  FormularioLogExibir;
end;

//
// Evento de click no bot�o "Gravar".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.btnGravarClick(Sender: TObject);
begin
  FormularioGravar;
end;

//
// Evento de click no bot�o "Minimizar".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.btnMinimizarClick(Sender: TObject);
begin
  VCLSDIMinimizar;
end;

//
// Evento de click no bot�o "Fechar".
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormularioLimpar;
begin
  // Posiciona pagecontrole na primeira aba.  
  pagFormulario.ActivePageIndex := TAB_CADASTRO;

  // Limpa componentes da aba "Cadastro".
  VCLEditLimpar(edtTipoUsuarioID);
  VCLEditLimpar(edtCodigo);
  VCLEditLimpar(edtTitulo);
  VCLCheckBoxLimpar(chkBloqueado);
  VCLCheckBoxLimpar(chkAtivo);

  // Limpa componentes da aba "Auditoria".
  VCLEditLimpar(edtInsLocalDtHr);
  VCLEditLimpar(edtUpdLocalDtHr);
  VCLEditLimpar(EdtUpdContador);
end;

//
// FormularioLogExibir.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormularioLogExibir;
begin
  PlataformaERPVCLLogRegistroExibir;
end;

//
// FormularioPopular.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormularioPopular(argBaseID       : Integer;
                                                                   argLicencaID    : Integer;
                                                                   argTipoUsuarioID: Integer);
const
  PROCEDIMENTO_NOME: string = 'FormularioPopular';
var
  locCodigo      : string;
  locTitulo      : string;
  locBloqueado   : Boolean;
  locAtivo       : Boolean;
  locInsLocalDtHr: TDateTime;
  locUpdLocalDtHr: TDateTime;
  locUpdContador : Integer;
begin
  // Troca cursor.
  VCLCursorTrocar(True);

  // Popula dados.
  try
    PlataformaERPTipoUsuarioADOPopular(argBaseID,
                                       argLicencaID,
                                       argTipoUsuarioID,
                                       locCodigo,
                                       locTitulo,
                                       locBloqueado,
                                       locAtivo,
                                       locInsLocalDtHr,
                                       locUpdLocalDtHr,
                                       locUpdContador);
  except
    on locExcecao: Exception do
    begin
      PlataformaERPLogar(True, locExcecao.Message, UNIT_NOME, PROCEDIMENTO_NOME);
      VCLCursorTrocar;
      VCLErroExibir(locExcecao.Message);
      Exit;
    end;
  end;

  // Carrega componentes.
  edtCodigo.Text       := locCodigo;
  edtTitulo.Text       := locTitulo;
  chkBloqueado.Checked := locBloqueado;
  chkAtivo.Checked     := locAtivo;

  edtInsLocalDtHr.Text := DateTimeStringConverter(locInsLocalDtHr, 'dd/mm/yyyy hh:nn:ss.zzz');
  edtUpdLocalDtHr.Text := DateTimeStringConverter(locUpdLocalDtHr, 'dd/mm/yyyy hh:nn:ss.zzz');
  edtUpdContador.Text  := IntegerStringConverter(locUpdContador);

  // Finaliza.
  VCLCursorTrocar;
end;

//
// Procedimento para gravar os dados do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosCadastro.FormularioGravar;
const
  PROCEDIMENTO_NOME: string = 'FormularioGravar';
var
  locBaseID       : Integer;
  locLicencaID    : Integer;
  locTipoUsuarioID: Integer;
  locCodigo       : string;
  locTitulo       : string;
  locBloqueado    : Boolean;
  locAtivo        : Boolean;
  locUsuarioBaseID: Integer;
  locUsuarioID    : Integer;
  locHostName     : string;
  locUserName     : string;
  locUpdContador  : Integer;
begin
  // Carrega vari�veis com os valores dos componentes.
  locBaseID        := gloBaseID;
  locLicencaID     := gloLicencaID;
  locTipoUsuarioID := StringIntegerConverter(edtTipoUsuarioID.Text);
  locCodigo        := StringTrim(edtCodigo.Text);
  locTitulo        := StringTrim(edtTitulo.Text);
  locBloqueado     := chkBloqueado.Checked;
  locAtivo         := chkAtivo.Checked;
  locUsuarioBaseID := gloUsuarioBaseID;
  locUsuarioID     := gloUsuarioID;
  locHostName      := HostNameRecuperar;
  locUserName      := UserNameRecuperar;
  locUpdContador   := StringIntegerConverter(edtUpdContador.Text);

  // Consistir informa��es.

  // Troca cursor.
  VCLCursorTrocar(True);

  // Persiste dados.
  try
    locTipoUsuarioID := PlataformaERPTipoUsuarioADOPersistir(locBaseID,
                                                             locLicencaID,
                                                             locTipoUsuarioID,
                                                             locCodigo,
                                                             locTitulo,
                                                             locBloqueado,
                                                             locAtivo,
                                                             locUsuarioBaseID,
                                                             locUsuarioID,
                                                             locHostName,
                                                             locUserName,
                                                             locUpdContador);
  except
    on locExcecao: Exception do
    begin
      PlataformaERPLogar(True, locExcecao.Message, UNIT_NOME, PROCEDIMENTO_NOME);
      VCLCursorTrocar;
      VCLErroExibir(locExcecao.Message);
      Exit;
    end;
  end;

  // Atualiza o ID do tipo do usu�rio que foi gravado.
  edtTipoUsuarioID.Text := IntegerStringConverter(locTipoUsuarioID);

  // Finaliza.
  VCLCursorTrocar;
  VCLInformacaoExibir('Tipo de usu�rio gravado com sucesso!');
end;

end.
