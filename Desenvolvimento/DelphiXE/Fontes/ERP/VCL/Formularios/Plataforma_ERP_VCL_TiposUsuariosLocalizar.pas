//
// Arquivo..: Plataforma_ERP_VCL_TiposUsuariosLocalizar.pas
// Projeto..: ERP
// Fonte....: Formul�rio VCL
// Cria��o..: 05/Julho/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Formul�rio com os par�metros de localiza��o de cadastro de tipo de usu�rio.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_VCL_TiposUsuariosLocalizar;

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
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TPlataformaERPVCLTiposUsuariosLocalizar = class(TForm)
    imgFormulario: TImage;
    btnConfirmar: TBitBtn;
    btnFechar: TBitBtn;
    panFormulario: TPanel;
    lblCodigo: TLabel;
    lblID: TLabel;
    edtCodigo: TEdit;
    edtTipoUsuarioID: TEdit;
    btnMinimizar: TBitBtn;
    btnLimpar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtTipoUsuarioIDEnter(Sender: TObject);
    procedure edtTipoUsuarioIDExit(Sender: TObject);
    procedure edtTipoUsuarioIDKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    procedure FormularioLimpar;    
    procedure FormularioConfirmar;
    function TipoUsuarioLocalizar: Boolean;
  public
    pubClicouFechar : Boolean;
    pubBaseID       : Integer;
    pubLicencaID    : Integer;
    pubTipoUsuarioID: Integer;
  end;

var
  PlataformaERPVCLTiposUsuariosLocalizar: TPlataformaERPVCLTiposUsuariosLocalizar;

implementation

{$R *.dfm}

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_TiposUsuariosSelecao;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_TiposUsuariosLocalizar';

//
// Evento de cria��o do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosLocalizar.FormCreate(Sender: TObject);
begin
  //
  // Inicializa vari�veis p�blicas.
  //
  pubClicouFechar  := True;
  pubBaseID        := 1;
  pubLicencaID     := 1;
  pubTipoUsuarioID := 1;

  //
  // Limpa componentes do formul�rio.
  //
  FormularioLimpar;
end;

//
// Evento de exibi��o do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosLocalizar.FormShow(Sender: TObject);
begin
  Exit;
end;

//
// Evento de pressionamento de teclas no formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosLocalizar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

//
// Eventos do componente "ID do tipo de usu�rio".
//
procedure TPlataformaERPVCLTiposUsuariosLocalizar.edtTipoUsuarioIDEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtTipoUsuarioID) then Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosLocalizar.edtTipoUsuarioIDKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_NUMERICA_INTEIRA);
end;

procedure TPlataformaERPVCLTiposUsuariosLocalizar.edtTipoUsuarioIDExit(Sender: TObject);
begin
  if not VCLEditSair(edtTipoUsuarioID) then Exit;
end;

//
// Eventos do componente "c�digo".
//
procedure TPlataformaERPVCLTiposUsuariosLocalizar.edtCodigoEnter(Sender: TObject);
begin
  if not VCLEditEntrar(edtCodigo) then Exit;
end;

procedure TPlataformaERPVCLTiposUsuariosLocalizar.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  VCLDigitacaoHabilitar(Self, Key, VCL_DIGITACAO_CODIGO);
end;

procedure TPlataformaERPVCLTiposUsuariosLocalizar.edtCodigoExit(Sender: TObject);
begin
  if not VCLEditSair(edtCodigo) then Exit;
end;

//
// Evento de click no bot�o "Confirmar".
//
procedure TPlataformaERPVCLTiposUsuariosLocalizar.btnConfirmarClick(Sender: TObject);
begin
  FormularioConfirmar;
end;

//
// Evento de click no bot�o "Fechar".
//
procedure TPlataformaERPVCLTiposUsuariosLocalizar.btnFecharClick(Sender: TObject);
begin
  Close;
end;

//
// Procedimento para limpar os componentes do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosLocalizar.FormularioLimpar;
begin
  VCLEditLimpar(edtTipoUsuarioID);
  VCLEditLimpar(edtCodigo);
end;

//
// Procedimento para confirmar os par�metros do formul�rio.
//
procedure TPlataformaERPVCLTiposUsuariosLocalizar.FormularioConfirmar;
begin
  if not TipoUsuarioLocalizar then Exit;
  pubClicouFechar  := False;
  Close; 
end;

//
// Procedimento para localizar o tipo do usu�rio.
//
function TPlataformaERPVCLTiposUsuariosLocalizar.TipoUsuarioLocalizar: Boolean;
const
  PROCEDIMENTO_NOME: string = 'TipoUsuarioLocalizar';
  ERRO_MENSAGEM    : string = 'Imposs�vel localizar tipo de usu�rio!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
  locClicouFechar : Boolean;
  locBaseID       : Integer;
  locLicencaID    : Integer;
  locTipoUsuarioID: Integer;
  locCodigo       : string;
  locFormulario   : TPlataformaERPVCLTiposUsuariosSelecao;
begin
  //
  // ID da licen�a.
  //
  locLicencaID := gloLicencaID;

  //
  // ID do tipo do usu�rio.
  //
  locTipoUsuarioID := StringIntegerConverter(edtTipoUsuarioID.Text);
  locCodigo        := StringTrim(edtCodigo.Text);

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
      Result := False;
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
  // Consulta dados do tipo de usu�rio.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                      ');
  locADOQuery.SQL.Add('  [base].[base_id],                                         ');
  locADOQuery.SQL.Add('  [base].[titulo] AS [base_titulo],                         ');
  locADOQuery.SQL.Add('  [tipo_usuario].[licenca_id],                              ');  
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_id],                         ');  
  locADOQuery.SQL.Add('  [tipo_usuario].[codigo],                                  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[titulo],                                  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[bloqueado],                               ');
  locADOQuery.SQL.Add('  [tipo_usuario].[ativo]                                    ');
  locADOQuery.SQL.Add('FROM                                                        ');
  locADOQuery.SQL.Add('  [tipo_usuario] WITH (NOLOCK)                              ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                           ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [tipo_usuario].[base_id]          ');
  locADOQuery.SQL.Add('WHERE                                                       ');
  locADOQuery.SQL.Add('  [tipo_usuario].[licenca_id] = :licenca_id                 ');
  locADOQuery.Parameters.ParamByName('licenca_id').Value := locLicencaID;

  if locTipoUsuarioID > 0 then
  begin  
    locADOQuery.SQL.Add(' AND [tipo_usuario].[tipo_usuario_id] = :tipo_usuario_id ');
    locADOQuery.Parameters.ParamByName('tipo_usuario_id').Value := locTipoUsuarioID;
  end;

  if locCodigo <> '' then
  begin  
    locADOQuery.SQL.Add(' AND [tipo_usuario].[codigo] LIKE :codigo');
    locADOQuery.Parameters.ParamByName('codigo').Value := StringLikeGerar(locCodigo);
  end;

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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [tipo_usuario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
      Result := False;
      Exit;
    end;
  end;

  //
  // Nenhum registro encontrado.
  //
  if locADOQuery.RecordCount <= 0 then
  begin
    locADOQuery.Close;
    FreeAndNil(locADOQuery);
    locADOConnection.Close;
    FreeAndNil(locADOConnection);
    VCLConsistenciaExibir('Nenhum tipo de usu�rio encontrado!');
    Result := False;
    Exit;
  end;

  //
  // Apenas um registro encontrado.
  //
  if locADOQuery.RecordCount = 1 then
  begin
    pubBaseID        := locADOQuery.FieldByName('base_id').AsInteger;
    pubLicencaID     := locADOQuery.FieldByName('licenca_id').AsInteger;
    pubTipoUsuarioID := locADOQuery.FieldByName('tipo_usuario_id').AsInteger;
  end;

  //
  // V�rios registros encontrados.
  //
  if locADOQuery.RecordCount > 1 then
  begin
    locFormulario             := TPlataformaERPVCLTiposUsuariosSelecao.Create(Self);
    locFormulario.pubADOQuery := locADOQuery;
    locFormulario.ShowModal;

    locClicouFechar  := locFormulario.pubClicouFechar;
    locBaseID        := locFormulario.pubBaseID;
    locLicencaID     := locFormulario.pubLicencaID;
    locTipoUsuarioID := locFormulario.pubTipoUsuarioID;

    locFormulario.Release;
    FreeAndNil(locFormulario);

    if locClicouFechar then
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      VCLCursorTrocar;
      Result := False;
      Exit;
    end;

    pubBaseID        := locBaseID;
    pubLicencaID     := locLicencaID;
    pubTipoUsuarioID := locTipoUsuarioID;
  end;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);
  VCLCursorTrocar;
  Result := True;
end;

end.
