//
// Arquivo..: Plataforma_ERP_VCL_Generico.pas
// Projeto..: ERP
// Fonte....: Unit
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Procedimentos e funções genéricas do projeto para componentes VCL.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_VCL_Generico;

interface

uses
  Data.Win.ADODB,
  System.SysUtils,
  Vcl.StdCtrls,
  Vcl.Controls,
  Vcl.ExtCtrls,
  VCL.Mask;

const
  FONTE_NOME: string = 'Plataforma_ERP_VCL_Generico.pas';

//
// Plataforma_ERP_FormularioBackgound.
//
procedure Plataforma_ERP_VCL_FormularioBackground(argComponente: TImage);

//
// Plataforma_ERP_VCL_DataSelecionar.
//
procedure Plataforma_ERP_VCL_DataSelecionar(argComponente: TMaskEdit);

//
// Plataforma_ERP_VCL_DataExibir.
//
procedure Plataforma_ERP_VCL_DataExibir(argData: TDateTime);

//
// Plataforma_ERP_VCL_LogRegistroExibir.
//
procedure Plataforma_ERP_VCL_LogRegistroExibir(argIdentificador: string; var argADOQuery: TADOQuery);

//
// Plataforma_ERP_VCL_BaseCadastroExibir.
//
procedure Plataforma_ERP_VCL_BaseCadastroExibir(argBaseID: Integer);

//
// Plataforma_ERP_VCL_LicencaCadastroExibir.
//
procedure Plataforma_ERP_VCL_LicencaCadastroExibir(argLicencaID: Integer);

//
// Plataforma_ERP_VCL_PerfilUsuarioListaExibir.
//
procedure Plataforma_ERP_VCL_PerfilUsuarioListaExibir;

//
// TIPOS DE USUÁRIOS!
//

//
// Plataforma_ERP_VCL_TipoUsuarioListaExibir.
//
procedure Plataforma_ERP_VCL_TipoUsuarioListaExibir;

//
// Plataforma_ERP_VCL_TipoUsuarioExibir.
//
procedure Plataforma_ERP_VCL_TipoUsuarioExibir(argLicencaID        : Integer;
                                               argTipoUsuarioBaseID: Integer;
                                               argTipoUsuarioID    : Integer);

//
// Plataforma_ERP_VCL_TipoUsuarioValidar.
//
function Plataforma_ERP_VCL_TipoUsuarioValidar(argNovo                : Boolean;
                                               argLicencaID           : TEdit;
                                               argTipoUsuarioBaseID   : TEdit;
                                               argTipoUsuarioID       : TEdit;
                                               argTipoUsuarioCodigo   : TEdit;
                                               argTipoUsuarioDescricao: TEdit): Boolean;

//
// Plataforma_ERP_VCL_TipoUsuarioSelecionar.
//
function Plataforma_ERP_VCL_TipoUsuarioSelecionar(argLicencaID           : TEdit;
                                                  argTipoUsuarioBaseID   : TEdit;
                                                  argTipoUsuarioID       : TEdit;
                                                  argTipoUsuarioCodigo   : TEdit;
                                                  argTipoUsuarioDescricao: TEdit): Boolean;
//
// REGIME TRIBUTÁRIO!
//
                                                  
//
// Plataforma_ERP_VCL_RegimeTributarioListaExibir.
//
procedure Plataforma_ERP_VCL_RegimeTributarioListaExibir;

//
// Plataforma_ERP_VCL_RegimeTributarioExibir.
//
procedure Plataforma_ERP_VCL_RegimeTributarioExibir(argRegimeTributarioID: Integer);

//
// Plataforma_ERP_VCL_RegimeTributarioValidar.
//
function Plataforma_ERP_VCL_RegimeTributarioValidar(argNovo                     : Boolean;
                                                    argRegimeTributarioID       : TEdit;
                                                    argRegimeTributarioCodigo   : TEdit;
                                                    argRegimeTributarioDescricao: TEdit): Boolean;

//
// Plataforma_ERP_VCL_RegimeTributarioSelecionar.
//
function Plataforma_ERP_VCL_RegimeTributarioSelecionar(argRegimeTributarioID       : TEdit;
                                                       argRegimeTributarioCodigo   : TEdit;
                                                       argRegimeTributarioDescricao: TEdit): Boolean;

//
// LOGRADOURO!
//
                                                  
//
// Plataforma_ERP_VCL_LogradouroListaExibir.
//
procedure Plataforma_ERP_VCL_LogradouroListaExibir;

//
// Plataforma_ERP_VCL_LogradouroExibir.
//
procedure Plataforma_ERP_VCL_LogradouroExibir(argLogradouroID: Integer);

//
// Plataforma_ERP_VCL_LogradouroValidar.
//
function Plataforma_ERP_VCL_LogradouroValidar(argNovo               : Boolean;
                                              argLogradouroID       : TEdit;
                                              argLogradouroCodigo   : TEdit;
                                              argLogradouroDescricao: TEdit): Boolean;

//
// Plataforma_ERP_VCL_LogradouroSelecionar.
//
function Plataforma_ERP_VCL_LogradouroSelecionar(argLogradouroID       : TEdit;
                                                 argLogradouroCodigo   : TEdit;
                                                 argLogradouroDescricao: TEdit): Boolean;

//
// PAÍS!
//
                                                  
//
// Plataforma_ERP_VCL_PaisListaExibir.
//
procedure Plataforma_ERP_VCL_PaisListaExibir;

//
// Plataforma_ERP_VCL_PaisExibir.
//
procedure Plataforma_ERP_VCL_PaisExibir(argPaisID: Integer);

//
// Plataforma_ERP_VCL_PaisValidar.
//
function Plataforma_ERP_VCL_PaisValidar(argNovo      : Boolean;
                                        argPaisID    : TEdit;
                                        argPaisCodigo: TEdit;
                                        argPaisNome  : TEdit): Boolean;

//
// Plataforma_ERP_VCL_PaisSelecionar.
//
function Plataforma_ERP_VCL_PaisSelecionar(argPaisID    : TEdit;
                                           argPaisCodigo: TEdit;
                                           argPaisNome  : TEdit): Boolean;

//
// ESTADO!
//
                                                  
//
// Plataforma_ERP_VCL_EstadoListaExibir.
//
procedure Plataforma_ERP_VCL_EstadoListaExibir;

//
// Plataforma_ERP_VCL_EstadoExibir.
//
procedure Plataforma_ERP_VCL_EstadoExibir(argEstadoID: Integer);

//
// Plataforma_ERP_VCL_EstadoValidar.
//
function Plataforma_ERP_VCL_EstadoValidar(argNovo        : Boolean;
                                          argEstadoID    : TEdit;
                                          argEstadoCodigo: TEdit;
                                          argEstadoNome  : TEdit;
                                          argPaisID      : TEdit = nil;
                                          argPaisCodigo  : TEdit = nil;
                                          argPaisNome    : TEdit = nil): Boolean;                                         

//
// Plataforma_ERP_VCL_EstadoSelecionar.
//
function Plataforma_ERP_VCL_EstadoSelecionar(argEstadoID    : TEdit;
                                             argEstadoCodigo: TEdit;
                                             argEstadoNome  : TEdit;
                                             argPaisID      : TEdit = nil;
                                             argPaisCodigo  : TEdit = nil;
                                             argPaisNome    : TEdit = nil): Boolean;                                         

//
// CIDADE!
//
                                                  
//
// Plataforma_ERP_VCL_CidadeListaExibir.
//
procedure Plataforma_ERP_VCL_CidadeListaExibir;

//
// Plataforma_ERP_VCL_CidadeExibir.
//
procedure Plataforma_ERP_VCL_CidadeExibir(argCidadeID: Integer);

//
// Plataforma_ERP_VCL_CidadeValidar.
//
function Plataforma_ERP_VCL_CidadeValidar(argNovo        : Boolean;
                                          argCidadeID    : TEdit;
                                          argCidadeCodigo: TEdit;
                                          argCidadeNome  : TEdit;
                                          argEstadoID    : TEdit = nil;
                                          argEstadoCodigo: TEdit = nil;
                                          argEstadoNome  : TEdit = nil;
                                          argPaisID      : TEdit = nil;
                                          argPaisCodigo  : TEdit = nil;
                                          argPaisNome    : TEdit = nil): Boolean;

//
// Plataforma_ERP_VCL_CidadeSelecionar.
//
function Plataforma_ERP_VCL_CidadeSelecionar(argCidadeID    : TEdit;
                                             argCidadeCodigo: TEdit;
                                             argCidadeNome  : TEdit;
                                             argEstadoID    : TEdit = nil;
                                             argEstadoCodigo: TEdit = nil;
                                             argEstadoNome  : TEdit = nil;
                                             argPaisID      : TEdit = nil;
                                             argPaisCodigo  : TEdit = nil;
                                             argPaisNome    : TEdit = nil): Boolean;

//
// BAIRRO!
//

//
// Plataforma_ERP_VCL_BairroListaExibir.
//
procedure Plataforma_ERP_VCL_BairroListaExibir;

//
// Plataforma_ERP_VCL_BairroExibir.
//
procedure Plataforma_ERP_VCL_BairroExibir(argBairroID: Integer);

//
// Plataforma_ERP_VCL_BairroValidar.
//
function Plataforma_ERP_VCL_BairroValidar(argNovo        : Boolean;
                                          argBairroID    : TEdit;
                                          argBairroCodigo: TEdit;
                                          argBairroNome  : TEdit;
                                          argCidadeID    : TEdit = nil;
                                          argCidadeCodigo: TEdit = nil;
                                          argCidadeNome  : TEdit = nil;
                                          argEstadoID    : TEdit = nil;
                                          argEstadoCodigo: TEdit = nil;
                                          argEstadoNome  : TEdit = nil;
                                          argPaisID      : TEdit = nil;
                                          argPaisCodigo  : TEdit = nil;
                                          argPaisNome    : TEdit = nil): Boolean;

//
// Plataforma_ERP_VCL_BairroSelecionar.
//
function Plataforma_ERP_VCL_BairroSelecionar(argBairroID    : TEdit;
                                             argBairroCodigo: TEdit;
                                             argBairroNome  : TEdit;
                                             argCidadeID    : TEdit = nil;
                                             argCidadeCodigo: TEdit = nil;
                                             argCidadeNome  : TEdit = nil;
                                             argEstadoID    : TEdit = nil;
                                             argEstadoCodigo: TEdit = nil;
                                             argEstadoNome  : TEdit = nil;
                                             argPaisID      : TEdit = nil;
                                             argPaisCodigo  : TEdit = nil;
                                             argPaisNome    : TEdit = nil): Boolean;

//
// CEP!
//
                                                  
//
// Plataforma_ERP_VCL_CEPListaExibir.
//
procedure Plataforma_ERP_VCL_CEPListaExibir;

//
// Plataforma_ERP_VCL_CEPExibir.
//
procedure Plataforma_ERP_VCL_CEPExibir(argCEPID: Integer);

//
// Plataforma_ERP_VCL_CEPValidar.
//
function Plataforma_ERP_VCL_CEPValidar(argCEP                : TEdit;
                                       argEstrangeiro        : TCheckBox;
                                       argGenerico           : TCheckBox;
                                       argLogradouroID       : TEdit;
                                       argLogradouroCodigo   : TEdit;
                                       argLogradouroDescricao: TEdit;
                                       argEndereco           : TEdit;
                                       argBairro             : TEdit;
                                       argCidade             : TEdit;
                                       argEstado             : TEdit;
                                       argPaisID             : TEdit;
                                       argPaisCodigo         : TEdit;
                                       argPaisNome           : TEdit): Boolean;

//
// EMPRESA!
//

//
// Plataforma_ERP_VCL_EmpresaListaExibir.
//
procedure Plataforma_ERP_VCL_EmpresaListaExibir;

//
// Plataforma_ERP_VCL_EmpresaExibir.
//
procedure Plataforma_ERP_VCL_EmpresaExibir(argLicencaID    : Integer;
                                           argEmpresaBaseID: Integer;
                                           argEmpresaID    : Integer);

//
// Plataforma_ERP_VCL_EmpresaValidar.
//
function Plataforma_ERP_VCL_EmpresaValidar(argNovo            : Boolean;
                                           argLicencaID       : TEdit;
                                           argEmpresaBaseID   : TEdit;
                                           argEmpresaID       : TEdit;
                                           argEmpresaCodigo   : TEdit;
                                           argEmpresaDescricao: TEdit): Boolean;

//
// Plataforma_ERP_VCL_EmpresaSelecionar.
//
function Plataforma_ERP_VCL_EmpresaSelecionar(argLicencaID       : TEdit;
                                              argEmpresaBaseID   : TEdit;
                                              argEmpresaID       : TEdit;
                                              argEmpresaCodigo   : TEdit;
                                              argEmpresaDescricao: TEdit): Boolean;

implementation

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_VCL,
  Plataforma_ERP_Generico,
  Plataforma_ERP_Global,
  Plataforma_ERP_VCL_LogRegistroLista,
  Plataforma_ERP_VCL_DataSelecao,
  Plataforma_ERP_VCL_DataExibicao,
  Plataforma_ERP_VCL_BaseCadastro,
  Plataforma_ERP_VCL_LicencaCadastro,
  Plataforma_ERP_VCL_PerfilUsuarioLista,

  Plataforma_ERP_VCL_TiposUsuariosLista,
  Plataforma_ERP_VCL_TiposUsuariosCadastro,
  Plataforma_ERP_VCL_TiposUsuariosCodigo,
  Plataforma_ERP_VCL_TiposUsuariosSelecao,

  Plataforma_ERP_VCL_RegimeTributarioLista,
  Plataforma_ERP_VCL_RegimeTributarioCadastro,
  Plataforma_ERP_VCL_RegimeTributarioSelecao,

  Plataforma_ERP_VCL_LogradouroLista,
  Plataforma_ERP_VCL_LogradouroCadastro,
  Plataforma_ERP_VCL_LogradouroSelecao,

  Plataforma_ERP_VCL_PaisLista,
  Plataforma_ERP_VCL_PaisCadastro,
  Plataforma_ERP_VCL_PaisSelecao,

  Plataforma_ERP_VCL_EstadoLista,
  Plataforma_ERP_VCL_EstadoCadastro,
  Plataforma_ERP_VCL_EstadoSelecao,

  Plataforma_ERP_VCL_CidadeLista,
  Plataforma_ERP_VCL_CidadeCadastro,
  Plataforma_ERP_VCL_CidadeSelecao,

  Plataforma_ERP_VCL_BairroLista,
  Plataforma_ERP_VCL_BairroCadastro,
  Plataforma_ERP_VCL_BairroSelecao,

  Plataforma_ERP_VCL_CEPLista,
  Plataforma_ERP_VCL_CEPCadastro,
  Plataforma_ERP_VCL_CEPSelecao,

  Plataforma_ERP_VCL_EmpresaLista,
  Plataforma_ERP_VCL_EmpresaCadastro,
  Plataforma_ERP_VCL_EmpresaCodigo,
  Plataforma_ERP_VCL_EmpresaSelecao;

//
// Procedimento para configurar a imagem de background padrão dos formulários.
//
procedure Plataforma_ERP_VCL_FormularioBackground(argComponente: TImage);
begin
  argComponente.SendToBack;
  argComponente.Align := alClient;
  argComponente.Picture.Bitmap.LoadFromResourceName(HInstance, 'FORM_BACKGROUND_DEFAULT');
  argComponente.Refresh;
end;

//
// Procedimento para selecionar uma data.
//
procedure Plataforma_ERP_VCL_DataSelecionar(argComponente: TMaskEdit);
var
  locFormulario  : TPlataformaERPVCLDataSelecao;
  locClicouFechar: Boolean;
  locData        : TDateTime;
begin
  locFormulario         := TPlataformaERPVCLDataSelecao.Create(nil);
  locFormulario.pubData := StringDateTimeConverter(argComponente.Text);

  locFormulario.ShowModal;

  locClicouFechar := locFormulario.pubClicouFechar;
  locData         := locFormulario.pubData;

  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    argComponente.Text := DateTimeStringConverter(locData, 'dd/mm/yyyy');
  end;

  VCLMaskEditClickControlar(argComponente, (argComponente.Text <> ''));  
end;

//
// Procedimento para exibir informações sobre uma data.
//
procedure Plataforma_ERP_VCL_DataExibir(argData: TDateTime);
var
  locFormulario: TPlataformaERPVCLDataExibicao;
begin
  if argData <= 0 then Exit;

  locFormulario         := TPlataformaERPVCLDataExibicao.Create(nil);
  locFormulario.pubData := argData;
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para exibir o formulário de lista de logs de um registro.
//
procedure Plataforma_ERP_VCL_LogRegistroExibir(argIdentificador: string; var argADOQuery: TADOQuery);
var
  locFormulario: TPlataformaERPVCLLogRegistroLista;
begin
  locFormulario                  := TPlataformaERPVCLLogRegistroLista.Create(nil);
  locFormulario.pubIdentificador := argIdentificador;
  locFormulario.pubADOQuery      := argADOQuery;
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para exibir um cadastro de licença.
//
procedure Plataforma_ERP_VCL_LicencaCadastroExibir(argLicencaID: Integer);
var
  locFormulario: TPlataformaERPVCLLicencaCadastro;
begin
  if argLicencaID <= 0 then Exit;

  locFormulario              := TPlataformaERPVCLLicencaCadastro.Create(nil);
  locFormulario.pubLicencaID := argLicencaID;
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para exibir um cadastro de base.
//
procedure Plataforma_ERP_VCL_BaseCadastroExibir(argBaseID: Integer);
var
  locFormulario: TPlataformaERPVCLBaseCadastro;
begin
  if argBaseID <= 0 then Exit;

  locFormulario           := TPlataformaERPVCLBaseCadastro.Create(nil);
  locFormulario.pubBaseID := argBaseID;
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para exibir a lista de perfis de usuários cadastrados.
//
procedure Plataforma_ERP_VCL_PerfilUsuarioListaExibir;
var
  locFormulario: TPlataformaERPVCLPerfilUsuarioLista;
begin
  locFormulario := TPlataformaERPVCLPerfilUsuarioLista.Create(nil);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// TIPOS DE USUÁRIOS!
//

//
// Procedimento para exibir a lista de tipos de usuários cadastrados.
//
procedure Plataforma_ERP_VCL_TipoUsuarioListaExibir;
var
  locFormulario: TPlataformaERPVCLTiposUsuariosLista;
begin
  locFormulario := TPlataformaERPVCLTiposUsuariosLista.Create(nil);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para exibir o cadastro de tipo de usuário.
//
procedure Plataforma_ERP_VCL_TipoUsuarioExibir(argLicencaID        : Integer;
                                               argTipoUsuarioBaseID: Integer;
                                               argTipoUsuarioID    : Integer);
var
  locFormulario: TPlataformaERPVCLTiposUsuariosCadastro;
begin
  if argTipoUsuarioID <= 0 then Exit;

  locFormulario := TPlataformaERPVCLTiposUsuariosCadastro.Create(nil);
  locFormulario.pubLicencaID         := argLicencaID;
  locFormulario.pubTipoUsuarioBaseID := argTipoUsuarioBaseID;
  locFormulario.pubTipoUsuarioID     := argTipoUsuarioID;
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para validar um tipo de usuário.
//
function Plataforma_ERP_VCL_TipoUsuarioValidar(argNovo                : Boolean;
                                               argLicencaID           : TEdit;
                                               argTipoUsuarioBaseID   : TEdit;
                                               argTipoUsuarioID       : TEdit;
                                               argTipoUsuarioCodigo   : TEdit;
                                               argTipoUsuarioDescricao: TEdit): Boolean;
const
  PROCEDIMENTO_NOME: string = 'Plataforma_ERP_VCL_TipoUsuarioValidar';
  ERRO_MENSAGEM    : string = 'Impossível validar o tipo de usuário!';
var
  locADOConnection       : TADOConnection;
  locADOQuery            : TADOQuery;
  locLogMensagem         : string;
  locClicouFechar        : Boolean;
  locLicencaID           : Integer;
  locTipoUsuarioBaseID   : Integer;
  locTipoUsuarioID       : Integer;
  locTipoUsuarioCodigo   : string;
  locTipoUsuarioDescricao: string;
  locFormulario          : TPlataformaERPVCLTiposUsuariosCodigo;
begin
  //
  // Retorno padrão.
  //
  Result := False;
  VCLEditClickControlar(argTipoUsuarioDescricao, False);  

  //
  // Carrega variáveis.
  //
  locLicencaID            := StringIntegerConverter(argLicencaID.Text);
  locTipoUsuarioBaseID    := StringIntegerConverter(argTipoUsuarioBaseID.Text);
  locTipoUsuarioID        := StringIntegerConverter(argTipoUsuarioID.Text);
  locTipoUsuarioCodigo    := StringTrim(argTipoUsuarioCodigo.Text);
  locTipoUsuarioDescricao := StringTrim(argTipoUsuarioDescricao.Text);

  //
  // Componente vazio.
  //
  if locTipoUsuarioCodigo = '' then
  begin
    argTipoUsuarioBaseID.Text    := '';
    argTipoUsuarioID.Text        := '';
    argTipoUsuarioDescricao.Text := '';
    Result := True;
    Exit;
  end;

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Conexão ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(nil);

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
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Consulta dados do tipo de usuário.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                          ');
  locADOQuery.SQL.Add('  [base].[base_id]   AS [tipo_usuario_base_id],                 ');
  locADOQuery.SQL.Add('  [base].[descricao] AS [tipo_usuario_base_titulo],             ');
  locADOQuery.SQL.Add('  [tipo_usuario].[licenca_id],                                  ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_id],                             ');
  locADOQuery.SQL.Add('  [tipo_usuario].[codigo],                                      ');
  locADOQuery.SQL.Add('  [tipo_usuario].[descricao],                                   ');
  locADOQuery.SQL.Add('  [tipo_usuario].[bloqueado],                                   ');
  locADOQuery.SQL.Add('  [tipo_usuario].[ativo]                                        ');
  locADOQuery.SQL.Add('FROM                                                            ');
  locADOQuery.SQL.Add('  [tipo_usuario] WITH (NOLOCK)                                  ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                               ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [tipo_usuario].[tipo_usuario_base_id] ');
  locADOQuery.SQL.Add('WHERE                                                           ');
  locADOQuery.SQL.Add('  [tipo_usuario].[licenca_id] = :licenca_id AND                 ');
  locADOQuery.SQL.Add('  [tipo_usuario].[codigo]     = :codigo     AND                 ');
  locADOQuery.SQL.Add('  [tipo_usuario].[ativo]      = ''S''                           ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value := locLicencaID;
  locADOQuery.Parameters.ParamByName('codigo').Value     := locTipoUsuarioCodigo;

  if locTipoUsuarioBaseID > 0 then
  begin
    locADOQuery.SQL.Add(' AND [tipo_usuario].[tipo_usuario_base_id] = :tipo_usuario_base_id ');
    locADOQuery.Parameters.ParamByName('tipo_usuario_base_id').Value := locTipoUsuarioBaseID;
  end;  

  if argNovo then
  begin   
    locADOQuery.SQL.Add(' AND [tipo_usuario].[bloqueado] = ''N'' ');
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
    VCLConsistenciaExibir('Nenhum tipo de usuário encontrado com o código "' + locTipoUsuarioCodigo + '" informado!');
    argTipoUsuarioBaseID.Text    := '';
    argTipoUsuarioID.Text        := '';
    argTipoUsuarioDescricao.Text := '';
    argTipoUsuarioCodigo.SetFocus;
    Exit;
  end;

  //
  // Apenas um registro encontrado.
  //
  if locADOQuery.RecordCount = 1 then
  begin
    argTipoUsuarioBaseID.Text    := IntegerStringConverter(locADOQuery.FieldByName('tipo_usuario_base_id').AsInteger);
    argTipoUsuarioID.Text        := IntegerStringConverter(locADOQuery.FieldByName('tipo_usuario_id').AsInteger);
    argTipoUsuarioCodigo.Text    := locADOQuery.FieldByName('codigo').AsString;
    argTipoUsuarioDescricao.Text := locADOQuery.FieldByName('descricao').AsString;
  end;

  //
  // Vários registros encontrados.
  //
  if locADOQuery.RecordCount > 1 then
  begin
    locFormulario                       := TPlataformaERPVCLTiposUsuariosCodigo.Create(nil);
    locFormulario.pubADOQuery           := locADOQuery;
    locFormulario.pubTipoUsuarioBaseID  := locTipoUsuarioBaseID;
    locFormulario.pubTipoUsuarioID      := locTipoUsuarioID;
    locFormulario.pubCodigo             := locTipoUsuarioCodigo;
    locFormulario.pubDescricao          := locTipoUsuarioDescricao;

    locFormulario.ShowModal;

    locClicouFechar         := locFormulario.pubClicouFechar;
    locTipoUsuarioBaseID    := locFormulario.pubTipoUsuarioBaseID;
    locTipoUsuarioID        := locFormulario.pubTipoUsuarioID;
    locTipoUsuarioCodigo    := locFormulario.pubCodigo;
    locTipoUsuarioDescricao := locFormulario.pubDescricao;

    locFormulario.Release;
    FreeAndNil(locFormulario);

    if locClicouFechar then
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      VCLCursorTrocar;
      argTipoUsuarioCodigo.SetFocus;
      Exit;
    end;

    argTipoUsuarioBaseID.Text    := IntegerStringConverter(locTipoUsuarioBaseID);
    argTipoUsuarioID.Text        := IntegerStringConverter(locTipoUsuarioID);
    argTipoUsuarioCodigo.Text    := locTipoUsuarioCodigo;
    argTipoUsuarioDescricao.Text := locTipoUsuarioDescricao;    
  end;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);

  VCLEditClickControlar(argTipoUsuarioDescricao, True);  
  VCLCursorTrocar;

  Result := True;
end;

//
// Procedimento para selecionar um tipo de usuário.
//
function Plataforma_ERP_VCL_TipoUsuarioSelecionar(argLicencaID           : TEdit;
                                                  argTipoUsuarioBaseID   : TEdit;
                                                  argTipoUsuarioID       : TEdit;
                                                  argTipoUsuarioCodigo   : TEdit;
                                                  argTipoUsuarioDescricao: TEdit): Boolean;
var
  locFormulario          : TPlataformaERPVCLTiposUsuariosSelecao;
  locClicouFechar        : Boolean;
  locTipoUsuarioBaseID   : Integer;
  locTipoUsuarioID       : Integer;
  locTipoUsuarioCodigo   : string;
  locTipoUsuarioDescricao: string;
begin
  Result := False;

  locTipoUsuarioBaseID    := StringIntegerConverter(argTipoUsuarioBaseID.Text);
  locTipoUsuarioID        := StringIntegerConverter(argTipoUsuarioID.Text);
  locTipoUsuarioCodigo    := StringTrim(argTipoUsuarioCodigo.Text);
  locTipoUsuarioDescricao := StringTrim(argTipoUsuarioDescricao.Text);

  locFormulario := TPlataformaERPVCLTiposUsuariosSelecao.Create(nil);

  locFormulario.pubTipoUsuarioBaseID := locTipoUsuarioBaseID;
  locFormulario.pubTipoUsuarioID     := locTipoUsuarioID;
  locFormulario.pubCodigo            := locTipoUsuarioCodigo;
  locFormulario.pubDescricao         := locTipoUsuarioDescricao;
  
  locFormulario.ShowModal;

  locClicouFechar         := locFormulario.pubClicouFechar;
  locTipoUsuarioBaseID    := locFormulario.pubTipoUsuarioBaseID;
  locTipoUsuarioID        := locFormulario.pubTipoUsuarioID;
  locTipoUsuarioCodigo    := locFormulario.pubCodigo;
  locTipoUsuarioDescricao := locFormulario.pubDescricao;
  
  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    argTipoUsuarioBaseID.Text    := IntegerStringConverter(locTipoUsuarioBaseID);
    argTipoUsuarioID.Text        := IntegerStringConverter(locTipoUsuarioID);
    argTipoUsuarioCodigo.Text    := locTipoUsuarioCodigo;
    argTipoUsuarioDescricao.Text := locTipoUsuarioDescricao;
    Result := False;
  end;

  VCLEditClickControlar(argTipoUsuarioDescricao, (argTipoUsuarioDescricao.Text <> ''));  
end;

//
// REGIME TRIBUTÁRIO!
//

//
// Procedimento para exibir a lista de regimes tributários cadastrados.
//
procedure Plataforma_ERP_VCL_RegimeTributarioListaExibir;
var
  locFormulario: TPlataformaERPVCLRegimeTributarioLista;
begin
  locFormulario := TPlataformaERPVCLRegimeTributarioLista.Create(nil);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para exibir o cadastro do regime tributário.
//
procedure Plataforma_ERP_VCL_RegimeTributarioExibir(argRegimeTributarioID: Integer);
var
  locFormulario: TPlataformaERPVCLRegimeTributarioCadastro;
begin
  if argRegimeTributarioID <= 0 then Exit;

  locFormulario                       := TPlataformaERPVCLRegimeTributarioCadastro.Create(nil);
  locFormulario.pubRegimeTributarioID := argRegimeTributarioID;
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para validar um regime tributário.
//
function Plataforma_ERP_VCL_RegimeTributarioValidar(argNovo                     : Boolean;
                                                    argRegimeTributarioID       : TEdit;
                                                    argRegimeTributarioCodigo   : TEdit;
                                                    argRegimeTributarioDescricao: TEdit): Boolean;
const
  PROCEDIMENTO_NOME: string = 'Plataforma_ERP_VCL_RegimeTributarioValidar';
  ERRO_MENSAGEM    : string = 'Impossível validar o regime tributário!';
var
  locADOConnection         : TADOConnection;
  locADOQuery              : TADOQuery;
  locLogMensagem           : string;
  locRegimeTributarioCodigo: string;
begin
  //
  // Retorno padrão.
  //
  Result := False;
  VCLEditClickControlar(argRegimeTributarioDescricao, False);  

  //
  // Carrega variáveis.
  //
  locRegimeTributarioCodigo := StringTrim(argRegimeTributarioCodigo.Text);

  //
  // Componente vazio.
  //
  if locRegimeTributarioCodigo = '' then
  begin
    argRegimeTributarioID.Text        := '';
    argRegimeTributarioDescricao.Text := '';
    Result := True;
    Exit;
  end;

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Conexão ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(nil);

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
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Consulta dados do regime tributário.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                        ');
  locADOQuery.SQL.Add('  [regime_tributario].[regime_tributario_id], ');
  locADOQuery.SQL.Add('  [regime_tributario].[codigo],               ');
  locADOQuery.SQL.Add('  [regime_tributario].[descricao],            ');
  locADOQuery.SQL.Add('  [regime_tributario].[bloqueado],            ');
  locADOQuery.SQL.Add('  [regime_tributario].[ativo]                 ');
  locADOQuery.SQL.Add('FROM                                          ');
  locADOQuery.SQL.Add('  [regime_tributario] WITH (NOLOCK)           ');
  locADOQuery.SQL.Add('WHERE                                         ');
  locADOQuery.SQL.Add('  [regime_tributario].[codigo] = :codigo AND  ');
  locADOQuery.SQL.Add('  [regime_tributario].[ativo]  = ''S''        ');

  locADOQuery.Parameters.ParamByName('codigo').Value := locRegimeTributarioCodigo;

  if argNovo then
  begin   
    locADOQuery.SQL.Add(' AND [regime_tributario].[bloqueado] = ''N'' ');
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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [regime_tributario]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
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
    VCLConsistenciaExibir('Nenhum regime tributário encontrado com o código "' + locRegimeTributarioCodigo + '" informado!');
    argRegimeTributarioID.Text        := '';
    argRegimeTributarioDescricao.Text := '';
    argRegimeTributarioCodigo.SetFocus;
    Exit;
  end;

  //
  // Apenas um registro encontrado.
  //
  if locADOQuery.RecordCount = 1 then
  begin
    argRegimeTributarioID.Text        := IntegerStringConverter(locADOQuery.FieldByName('regime_tributario_id').AsInteger);
    argRegimeTributarioCodigo.Text    := locADOQuery.FieldByName('codigo').AsString;
    argRegimeTributarioDescricao.Text := locADOQuery.FieldByName('descricao').AsString;
  end;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);

  VCLEditClickControlar(argRegimeTributarioDescricao, True);  
  VCLCursorTrocar;

  Result := True;
end;

//
// Procedimento para selecionar um regime tributário.
//
function Plataforma_ERP_VCL_RegimeTributarioSelecionar(argRegimeTributarioID       : TEdit;
                                                       argRegimeTributarioCodigo   : TEdit;
                                                       argRegimeTributarioDescricao: TEdit): Boolean;
var
  locFormulario               : TPlataformaERPVCLRegimeTributarioSelecao;
  locClicouFechar             : Boolean;
  locRegimeTributarioID       : Integer;
  locRegimeTributarioCodigo   : string;
  locRegimeTributarioDescricao: string;
begin
  Result := False;

  locRegimeTributarioID        := StringIntegerConverter(argRegimeTributarioID.Text);
  locRegimeTributarioCodigo    := StringTrim(argRegimeTributarioCodigo.Text);
  locRegimeTributarioDescricao := StringTrim(argRegimeTributarioDescricao.Text);

  locFormulario := TPlataformaERPVCLRegimeTributarioSelecao.Create(nil);

  locFormulario.pubRegimeTributarioID := locRegimeTributarioID;
  locFormulario.pubCodigo             := locRegimeTributarioCodigo;
  locFormulario.pubDescricao          := locRegimeTributarioDescricao;
  
  locFormulario.ShowModal;

  locClicouFechar              := locFormulario.pubClicouFechar;
  locRegimeTributarioID        := locFormulario.pubRegimeTributarioID;
  locRegimeTributarioCodigo    := locFormulario.pubCodigo;
  locRegimeTributarioDescricao := locFormulario.pubDescricao;
  
  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    argRegimeTributarioID.Text        := IntegerStringConverter(locRegimeTributarioID);
    argRegimeTributarioCodigo.Text    := locRegimeTributarioCodigo;
    argRegimeTributarioDescricao.Text := locRegimeTributarioDescricao;
    Result := False;
  end;

  VCLEditClickControlar(argRegimeTributarioDescricao, (argRegimeTributarioDescricao.Text <> ''));  
end;

//
// LOGRADOURO!
//

//
// Procedimento para exibir a lista de logradouros cadastrados.
//
procedure Plataforma_ERP_VCL_LogradouroListaExibir;
var
  locFormulario: TPlataformaERPVCLLogradouroLista;
begin
  locFormulario := TPlataformaERPVCLLogradouroLista.Create(nil);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para exibir o cadastro do logradouro.
//
procedure Plataforma_ERP_VCL_LogradouroExibir(argLogradouroID: Integer);
var
  locFormulario: TPlataformaERPVCLLogradouroCadastro;
begin
  if argLogradouroID <= 0 then Exit;

  locFormulario                 := TPlataformaERPVCLLogradouroCadastro.Create(nil);
  locFormulario.pubLogradouroID := argLogradouroID;
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para validar um logradouro.
//
function Plataforma_ERP_VCL_LogradouroValidar(argNovo               : Boolean;
                                              argLogradouroID       : TEdit;
                                              argLogradouroCodigo   : TEdit;
                                              argLogradouroDescricao: TEdit): Boolean;
const
  PROCEDIMENTO_NOME: string = 'Plataforma_ERP_VCL_LogradouroValidar';
  ERRO_MENSAGEM    : string = 'Impossível validar o logradouro!';
var
  locADOConnection   : TADOConnection;
  locADOQuery        : TADOQuery;
  locLogMensagem     : string;
  locLogradouroCodigo: string;
begin
  //
  // Retorno padrão.
  //
  Result := False;
  VCLEditClickControlar(argLogradouroDescricao, False);  

  //
  // Carrega variáveis.
  //
  locLogradouroCodigo := StringTrim(argLogradouroCodigo.Text);

  //
  // Componente vazio.
  //
  if locLogradouroCodigo = '' then
  begin
    argLogradouroID.Text        := '';
    argLogradouroDescricao.Text := '';
    Result := True;
    Exit;
  end;

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Conexão ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(nil);

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
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Consulta dados do logradouro.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                ');
  locADOQuery.SQL.Add('  [logradouro].[logradouro_id],       ');
  locADOQuery.SQL.Add('  [logradouro].[codigo],              ');
  locADOQuery.SQL.Add('  [logradouro].[descricao],           ');
  locADOQuery.SQL.Add('  [logradouro].[bloqueado],           ');
  locADOQuery.SQL.Add('  [logradouro].[ativo]                ');
  locADOQuery.SQL.Add('FROM                                  ');
  locADOQuery.SQL.Add('  [logradouro] WITH (NOLOCK)          ');
  locADOQuery.SQL.Add('WHERE                                 ');
  locADOQuery.SQL.Add('  [logradouro].[codigo] = :codigo AND ');
  locADOQuery.SQL.Add('  [logradouro].[ativo]  = ''S''       ');

  locADOQuery.Parameters.ParamByName('codigo').Value := locLogradouroCodigo;

  if argNovo then
  begin   
    locADOQuery.SQL.Add(' AND [logradouro].[bloqueado] = ''N'' ');
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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [logradouro]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
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
    VCLConsistenciaExibir('Nenhum logradouro encontrado com o código "' + locLogradouroCodigo + '" informado!');
    argLogradouroID.Text        := '';
    argLogradouroDescricao.Text := '';
    argLogradouroCodigo.SetFocus;
    Exit;
  end;

  //
  // Apenas um registro encontrado.
  //
  if locADOQuery.RecordCount = 1 then
  begin
    argLogradouroID.Text        := IntegerStringConverter(locADOQuery.FieldByName('logradouro_id').AsInteger);
    argLogradouroCodigo.Text    := locADOQuery.FieldByName('codigo').AsString;
    argLogradouroDescricao.Text := locADOQuery.FieldByName('descricao').AsString;
  end;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);

  VCLEditClickControlar(argLogradouroDescricao, True);  
  VCLCursorTrocar;

  Result := True;
end;

//
// Procedimento para selecionar um logradouro.
//
function Plataforma_ERP_VCL_LogradouroSelecionar(argLogradouroID       : TEdit;
                                                 argLogradouroCodigo   : TEdit;
                                                 argLogradouroDescricao: TEdit): Boolean;
var
  locFormulario         : TPlataformaERPVCLLogradouroSelecao;
  locClicouFechar       : Boolean;
  locLogradouroID       : Integer;
  locLogradouroCodigo   : string;
  locLogradouroDescricao: string;
begin
  Result := False;

  locLogradouroID        := StringIntegerConverter(argLogradouroID.Text);
  locLogradouroCodigo    := StringTrim(argLogradouroCodigo.Text);
  locLogradouroDescricao := StringTrim(argLogradouroDescricao.Text);

  locFormulario := TPlataformaERPVCLLogradouroSelecao.Create(nil);

  locFormulario.pubLogradouroID := locLogradouroID;
  locFormulario.pubCodigo       := locLogradouroCodigo;
  locFormulario.pubDescricao    := locLogradouroDescricao;
  
  locFormulario.ShowModal;

  locClicouFechar        := locFormulario.pubClicouFechar;
  locLogradouroID        := locFormulario.pubLogradouroID;
  locLogradouroCodigo    := locFormulario.pubCodigo;
  locLogradouroDescricao := locFormulario.pubDescricao;
  
  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    argLogradouroID.Text        := IntegerStringConverter(locLogradouroID);
    argLogradouroCodigo.Text    := locLogradouroCodigo;
    argLogradouroDescricao.Text := locLogradouroDescricao;
    Result := False;
  end;

  VCLEditClickControlar(argLogradouroDescricao, (argLogradouroDescricao.Text <> ''));  
end;

//
// PAÍS!
//

//
// Procedimento para exibir a lista de países cadastrados.
//
procedure Plataforma_ERP_VCL_PaisListaExibir;
var
  locFormulario: TPlataformaERPVCLPaisLista;
begin
  locFormulario := TPlataformaERPVCLPaisLista.Create(nil);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para exibir o cadastro do país.
//
procedure Plataforma_ERP_VCL_PaisExibir(argPaisID: Integer);
var
  locFormulario: TPlataformaERPVCLPaisCadastro;
begin
  if argPaisID <= 0 then Exit;
  
  locFormulario           := TPlataformaERPVCLPaisCadastro.Create(nil);
  locFormulario.pubPaisID := argPaisID;
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para validar um país.
//
function Plataforma_ERP_VCL_PaisValidar(argNovo      : Boolean;
                                        argPaisID    : TEdit;
                                        argPaisCodigo: TEdit;
                                        argPaisNome  : TEdit): Boolean;
const
  PROCEDIMENTO_NOME: string = 'Plataforma_ERP_VCL_PaisValidar';
  ERRO_MENSAGEM    : string = 'Impossível validar o país!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
  locPaisCodigo   : string;
begin
  //
  // Retorno padrão.
  //
  Result := False;
  VCLEditClickControlar(argPaisNome, False);

  //
  // Carrega variáveis.
  //
  locPaisCodigo := StringTrim(argPaisCodigo.Text);

  //
  // Componente vazio.
  //
  if locPaisCodigo = '' then
  begin
    argPaisID.Text   := '';
    argPaisNome.Text := '';
    Result := True;
    Exit;
  end;

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Conexão ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(nil);

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
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Consulta dados do país.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                          ');
  locADOQuery.SQL.Add('  [pais].[pais_id],             ');
  locADOQuery.SQL.Add('  [pais].[codigo],              ');
  locADOQuery.SQL.Add('  [pais].[nome],                ');
  locADOQuery.SQL.Add('  [pais].[bloqueado],           ');
  locADOQuery.SQL.Add('  [pais].[ativo]                ');
  locADOQuery.SQL.Add('FROM                            ');
  locADOQuery.SQL.Add('  [pais] WITH (NOLOCK)          ');
  locADOQuery.SQL.Add('WHERE                           ');
  locADOQuery.SQL.Add('  [pais].[codigo] = :codigo AND ');
  locADOQuery.SQL.Add('  [pais].[ativo]  = ''S''       ');

  locADOQuery.Parameters.ParamByName('codigo').Value := locPaisCodigo;

  if argNovo then
  begin   
    locADOQuery.SQL.Add(' AND [pais].[bloqueado] = ''N'' ');
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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [pais]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
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
    VCLConsistenciaExibir('Nenhum país encontrado com o código "' + locPaisCodigo + '" informado!');
    argPaisID.Text   := '';
    argPaisNome.Text := '';
    argPaisCodigo.SetFocus;
    Exit;
  end;

  //
  // Apenas um registro encontrado.
  //
  if locADOQuery.RecordCount = 1 then
  begin
    argPaisID.Text     := IntegerStringConverter(locADOQuery.FieldByName('pais_id').AsInteger);
    argPaisCodigo.Text := locADOQuery.FieldByName('codigo').AsString;
    argPaisNome.Text   := locADOQuery.FieldByName('nome').AsString;
  end;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);

  VCLEditClickControlar(argPaisNome, True);
  VCLCursorTrocar;

  Result := True;
end;

//
// Procedimento para selecionar um país.
//
function Plataforma_ERP_VCL_PaisSelecionar(argPaisID    : TEdit;
                                           argPaisCodigo: TEdit;
                                           argPaisNome  : TEdit): Boolean;
var
  locFormulario  : TPlataformaERPVCLPaisSelecao;
  locClicouFechar: Boolean;
  locPaisID      : Integer;
  locPaisCodigo  : string;
  locPaisNome    : string;
begin
  Result := False;

  locPaisID     := StringIntegerConverter(argPaisID.Text);
  locPaisCodigo := StringTrim(argPaisCodigo.Text);
  locPaisNome   := StringTrim(argPaisNome.Text);

  locFormulario := TPlataformaERPVCLPaisSelecao.Create(nil);

  locFormulario.pubPaisID := locPaisID;
  locFormulario.pubCodigo := locPaisCodigo;
  locFormulario.pubNome   := locPaisNome;
  
  locFormulario.ShowModal;

  locClicouFechar := locFormulario.pubClicouFechar;
  locPaisID       := locFormulario.pubPaisID;
  locPaisCodigo   := locFormulario.pubCodigo;
  locPaisNome     := locFormulario.pubNome;
  
  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    argPaisID.Text     := IntegerStringConverter(locPaisID);
    argPaisCodigo.Text := locPaisCodigo;
    argPaisNome.Text   := locPaisNome;
    Result := False;
  end;

  VCLEditClickControlar(argPaisNome, (argPaisNome.Text <> ''));
end;

//
// ESTADO!
//

//
// Procedimento para exibir a lista de estados cadastrados.
//
procedure Plataforma_ERP_VCL_EstadoListaExibir;
var
  locFormulario: TPlataformaERPVCLEstadoLista;
begin
  locFormulario := TPlataformaERPVCLEstadoLista.Create(nil);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para exibir o cadastro do estado.
//
procedure Plataforma_ERP_VCL_EstadoExibir(argEstadoID: Integer);
var
  locFormulario: TPlataformaERPVCLEstadoCadastro;
begin
  if argEstadoID <= 0 then Exit;

  locFormulario             := TPlataformaERPVCLEstadoCadastro.Create(nil);
  locFormulario.pubEstadoID := argEstadoID;
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para validar um estado.
//
function Plataforma_ERP_VCL_EstadoValidar(argNovo        : Boolean;
                                          argEstadoID    : TEdit;
                                          argEstadoCodigo: TEdit;
                                          argEstadoNome  : TEdit;
                                          argPaisID      : TEdit = nil;
                                          argPaisCodigo  : TEdit = nil;
                                          argPaisNome    : TEdit = nil): Boolean;
const
  PROCEDIMENTO_NOME: string = 'Plataforma_ERP_VCL_EstadoValidar';
  ERRO_MENSAGEM    : string = 'Impossível validar o estado!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
  locEstadoCodigo : string;
begin
  //
  // Retorno padrão.
  //
  Result := False;
  VCLEditClickControlar(argEstadoNome, False);  

  //
  // Carrega variáveis.
  //
  locEstadoCodigo := StringTrim(argEstadoCodigo.Text);

  //
  // Componente vazio.
  //
  if locEstadoCodigo = '' then
  begin
    argEstadoID.Text   := '';
    argEstadoNome.Text := '';

    if argPaisID     <> nil then argPaisID.Text     := '';
    if argPaisCodigo <> nil then argPaisCodigo.Text := '';
    if argPaisNome   <> nil then argPaisNome.Text   := '';
    
    Result := True;
    Exit;
  end;

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Conexão ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(nil);

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
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Consulta dados do estado.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                       ');
  locADOQuery.SQL.Add('  [estado].[estado_id],                      ');
  locADOQuery.SQL.Add('  [estado].[codigo],                         ');
  locADOQuery.SQL.Add('  [estado].[nome],                           ');
  locADOQuery.SQL.Add('  [pais].[pais_id] AS [pais_id],             ');
  locADOQuery.SQL.Add('  [pais].[codigo]  AS [pais_codigo],         ');
  locADOQuery.SQL.Add('  [pais].[nome]    AS [pais_nome],           ');
  locADOQuery.SQL.Add('  [estado].[bloqueado],                      ');
  locADOQuery.SQL.Add('  [estado].[ativo]                           ');
  locADOQuery.SQL.Add('FROM                                         ');
  locADOQuery.SQL.Add('  [estado] WITH (NOLOCK)                     ');
  locADOQuery.SQL.Add('  INNER JOIN [pais] WITH (NOLOCK)            ');
  locADOQuery.SQL.Add('    ON [pais].[pais_id] = [estado].[pais_id] ');
  locADOQuery.SQL.Add('WHERE                                        ');
  locADOQuery.SQL.Add('  [estado].[codigo] = :codigo AND            ');
  locADOQuery.SQL.Add('  [estado].[ativo]  = ''S''                  ');

  locADOQuery.Parameters.ParamByName('codigo').Value := locEstadoCodigo;

  if argNovo then
  begin   
    locADOQuery.SQL.Add(' AND [estado].[bloqueado] = ''N'' ');
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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [estado]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
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
    VCLConsistenciaExibir('Nenhum estado encontrado com o código "' + locEstadoCodigo + '" informado!');

    argEstadoID.Text   := '';
    argEstadoNome.Text := '';

    if argPaisID     <> nil then argPaisID.Text     := '';
    if argPaisCodigo <> nil then argPaisCodigo.Text := '';
    if argPaisNome   <> nil then argPaisNome.Text   := '';

    argEstadoCodigo.SetFocus;
    Exit;
  end;

  //
  // Apenas um registro encontrado.
  //
  if locADOQuery.RecordCount = 1 then
  begin
    argEstadoID.Text     := IntegerStringConverter(locADOQuery.FieldByName('estado_id').AsInteger);
    argEstadoCodigo.Text := locADOQuery.FieldByName('codigo').AsString;
    argEstadoNome.Text   := locADOQuery.FieldByName('nome').AsString;

    if argPaisID     <> nil then argPaisID.Text     := IntegerStringConverter(locADOQuery.FieldByName('pais_id').AsInteger);
    if argPaisCodigo <> nil then argPaisCodigo.Text := locADOQuery.FieldByName('pais_codigo').AsString;
    if argPaisNome   <> nil then argPaisNome.Text   := locADOQuery.FieldByName('pais_nome').AsString;
  end;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);

  VCLEditClickControlar(argEstadoNome, True);
  if argPaisNome <> nil then VCLEditClickControlar(argPaisNome, True);
  VCLCursorTrocar;

  Result := True;
end;

//
// Procedimento para selecionar um estado.
//
function Plataforma_ERP_VCL_EstadoSelecionar(argEstadoID    : TEdit;
                                             argEstadoCodigo: TEdit;
                                             argEstadoNome  : TEdit;
                                             argPaisID      : TEdit = nil;
                                             argPaisCodigo  : TEdit = nil;
                                             argPaisNome    : TEdit = nil): Boolean;
var
  locFormulario  : TPlataformaERPVCLEstadoSelecao;
  locClicouFechar: Boolean;
  locEstadoID    : Integer;
  locEstadoCodigo: string;
  locEstadoNome  : string;
  locPaisID      : Integer;
  locPaisCodigo  : string;
  locPaisNome    : string;
begin
  Result := False;

  locEstadoID     := StringIntegerConverter(argEstadoID.Text);
  locEstadoCodigo := StringTrim(argEstadoCodigo.Text);
  locEstadoNome   := StringTrim(argEstadoNome.Text);

  locFormulario := TPlataformaERPVCLEstadoSelecao.Create(nil);

  locFormulario.pubEstadoID := locEstadoID;
  locFormulario.pubCodigo   := locEstadoCodigo;
  locFormulario.pubNome     := locEstadoNome;
  
  locFormulario.ShowModal;

  locClicouFechar := locFormulario.pubClicouFechar;
  locEstadoID     := locFormulario.pubEstadoID;
  locEstadoCodigo := locFormulario.pubCodigo;
  locEstadoNome   := locFormulario.pubNome;
  locPaisID       := locFormulario.pubPaisID;
  locPaisCodigo   := locFormulario.pubPaisCodigo;
  locPaisNome     := locFormulario.pubPaisNome;
  
  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    argEstadoID.Text     := IntegerStringConverter(locEstadoID);
    argEstadoCodigo.Text := locEstadoCodigo;
    argEstadoNome.Text   := locEstadoNome;

    if argPaisID     <> nil then argPaisID.Text     := IntegerStringConverter(locPaisID);
    if argPaisCodigo <> nil then argPaisCodigo.Text := locPaisCodigo;
    if argPaisNome   <> nil then argPaisNome.Text   := locPaisNome;
    
    Result := False;
  end;

  VCLEditClickControlar(argEstadoNome, (argEstadoNome.Text <> ''));  
  if argPaisNome <> nil then VCLEditClickControlar(argPaisNome, (argPaisNome.Text <> ''));  
end;

//
// CIDADE!
//

//
// Procedimento para exibir a lista de cidades cadastrados.
//
procedure Plataforma_ERP_VCL_CidadeListaExibir;
var
  locFormulario: TPlataformaERPVCLCidadeLista;
begin
  locFormulario := TPlataformaERPVCLCidadeLista.Create(nil);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para exibir o cadastro da cidade.
//
procedure Plataforma_ERP_VCL_CidadeExibir(argCidadeID: Integer);
var
  locFormulario: TPlataformaERPVCLCidadeCadastro;
begin
  if argCidadeID <= 0 then Exit;

  locFormulario             := TPlataformaERPVCLCidadeCadastro.Create(nil);
  locFormulario.pubCidadeID := argCidadeID;
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para validar uma cidade.
//
function Plataforma_ERP_VCL_CidadeValidar(argNovo        : Boolean;
                                          argCidadeID    : TEdit;
                                          argCidadeCodigo: TEdit;
                                          argCidadeNome  : TEdit;
                                          argEstadoID    : TEdit = nil;
                                          argEstadoCodigo: TEdit = nil;
                                          argEstadoNome  : TEdit = nil;
                                          argPaisID      : TEdit = nil;
                                          argPaisCodigo  : TEdit = nil;
                                          argPaisNome    : TEdit = nil): Boolean;
const
  PROCEDIMENTO_NOME: string = 'Plataforma_ERP_VCL_CidadeValidar';
  ERRO_MENSAGEM    : string = 'Impossível validar a cidade!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
  locCidadeCodigo : string;
begin
  //
  // Retorno padrão.
  //
  Result := False;
  VCLEditClickControlar(argCidadeNome, False);  

  //
  // Carrega variáveis.
  //
  locCidadeCodigo := StringTrim(argCidadeCodigo.Text);

  //
  // Componente vazio.
  //
  if locCidadeCodigo = '' then
  begin
    argCidadeID.Text   := '';
    argCidadeNome.Text := '';

    if argEstadoID     <> nil then argEstadoID.Text     := '';
    if argEstadoCodigo <> nil then argEstadoCodigo.Text := '';
    if argEstadoNome   <> nil then argEstadoNome.Text   := '';
    if argPaisID       <> nil then argPaisID.Text       := '';
    if argPaisCodigo   <> nil then argPaisCodigo.Text   := '';
    if argPaisNome     <> nil then argPaisNome.Text     := '';

    Result := True;
    Exit;
  end;

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Conexão ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(nil);

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
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Consulta dados da cidade.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                             ');
  locADOQuery.SQL.Add('  [cidade].[cidade_id],                            ');
  locADOQuery.SQL.Add('  [cidade].[codigo],                               ');
  locADOQuery.SQL.Add('  [cidade].[nome],                                 ');
  locADOQuery.SQL.Add('  [estado].[estado_id] AS [estado_id],             ');
  locADOQuery.SQL.Add('  [estado].[codigo]    AS [estado_codigo],         ');
  locADOQuery.SQL.Add('  [estado].[nome]      AS [estado_nome],           ');
  locADOQuery.SQL.Add('  [pais].[pais_id]     AS [pais_id],               ');
  locADOQuery.SQL.Add('  [pais].[codigo]      AS [pais_codigo],           ');
  locADOQuery.SQL.Add('  [pais].[nome]        AS [pais_nome],             ');
  locADOQuery.SQL.Add('  [cidade].[bloqueado],                            ');
  locADOQuery.SQL.Add('  [cidade].[ativo]                                 ');
  locADOQuery.SQL.Add('FROM                                               ');
  locADOQuery.SQL.Add('  [cidade] WITH (NOLOCK)                           ');
  locADOQuery.SQL.Add('  INNER JOIN [estado] WITH (NOLOCK)                ');
  locADOQuery.SQL.Add('    ON [estado].[estado_id] = [cidade].[estado_id] ');
  locADOQuery.SQL.Add('  INNER JOIN [pais] WITH (NOLOCK)                  ');
  locADOQuery.SQL.Add('    ON [pais].[pais_id] = [estado].[pais_id]       ');
  locADOQuery.SQL.Add('WHERE                                              ');
  locADOQuery.SQL.Add('  [cidade].[codigo] = :codigo AND                  ');
  locADOQuery.SQL.Add('  [cidade].[ativo]  = ''S''                        ');

  locADOQuery.Parameters.ParamByName('codigo').Value := locCidadeCodigo;

  if argNovo then
  begin   
    locADOQuery.SQL.Add(' AND [cidade].[bloqueado] = ''N'' ');
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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [cidade]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
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

    VCLConsistenciaExibir('Nenhuma cidade encontrada com o código "' + locCidadeCodigo + '" informado!');

    argCidadeID.Text   := '';
    argCidadeNome.Text := '';

    if argEstadoID     <> nil then argEstadoID.Text     := '';
    if argEstadoCodigo <> nil then argEstadoCodigo.Text := '';
    if argEstadoNome   <> nil then argEstadoNome.Text   := '';
    if argPaisID       <> nil then argPaisID.Text       := '';
    if argPaisCodigo   <> nil then argPaisCodigo.Text   := '';
    if argPaisNome     <> nil then argPaisNome.Text     := '';

    argCidadeCodigo.SetFocus;
    Exit;
  end;

  //
  // Apenas um registro encontrado.
  //
  if locADOQuery.RecordCount = 1 then
  begin
    argCidadeID.Text     := IntegerStringConverter(locADOQuery.FieldByName('cidade_id').AsInteger);
    argCidadeCodigo.Text := locADOQuery.FieldByName('codigo').AsString;
    argCidadeNome.Text   := locADOQuery.FieldByName('nome').AsString;

    if argEstadoID     <> nil then argEstadoID.Text     := IntegerStringConverter(locADOQuery.FieldByName('estado_id').AsInteger);
    if argEstadoCodigo <> nil then argEstadoCodigo.Text := locADOQuery.FieldByName('estado_codigo').AsString;
    if argEstadoNome   <> nil then argEstadoNome.Text   := locADOQuery.FieldByName('estado_nome').AsString;

    if argPaisID       <> nil then argPaisID.Text       := IntegerStringConverter(locADOQuery.FieldByName('pais_id').AsInteger);
    if argPaisCodigo   <> nil then argPaisCodigo.Text   := locADOQuery.FieldByName('pais_codigo').AsString;
    if argPaisNome     <> nil then argPaisNome.Text     := locADOQuery.FieldByName('pais_nome').AsString;
  end;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);

  VCLEditClickControlar(argCidadeNome, True);
  if argEstadoNome <> nil then VCLEditClickControlar(argEstadoNome, True);
  if argPaisNome   <> nil then VCLEditClickControlar(argPaisNome,   True);

  VCLCursorTrocar;

  Result := True;
end;

//
// Procedimento para selecionar uma cidade.
//
function Plataforma_ERP_VCL_CidadeSelecionar(argCidadeID    : TEdit;
                                             argCidadeCodigo: TEdit;
                                             argCidadeNome  : TEdit;
                                             argEstadoID    : TEdit = nil;
                                             argEstadoCodigo: TEdit = nil;
                                             argEstadoNome  : TEdit = nil;
                                             argPaisID      : TEdit = nil;
                                             argPaisCodigo  : TEdit = nil;
                                             argPaisNome    : TEdit = nil): Boolean;
var
  locFormulario  : TPlataformaERPVCLCidadeSelecao;
  locClicouFechar: Boolean;
  locCidadeID    : Integer;
  locCidadeCodigo: string;
  locCidadeNome  : string;
  locEstadoID    : Integer;
  locEstadoCodigo: string;
  locEstadoNome  : string;
  locPaisID      : Integer;
  locPaisCodigo  : string;
  locPaisNome    : string;
begin
  Result := False;

  locCidadeID     := StringIntegerConverter(argCidadeID.Text);
  locCidadeCodigo := StringTrim(argCidadeCodigo.Text);
  locCidadeNome   := StringTrim(argCidadeNome.Text);

  locFormulario := TPlataformaERPVCLCidadeSelecao.Create(nil);

  locFormulario.pubCidadeID := locCidadeID;
  locFormulario.pubCodigo   := locCidadeCodigo;
  locFormulario.pubNome     := locCidadeNome;

  locFormulario.ShowModal;

  locClicouFechar := locFormulario.pubClicouFechar;
  locCidadeID     := locFormulario.pubCidadeID;
  locCidadeCodigo := locFormulario.pubCodigo;
  locCidadeNome   := locFormulario.pubNome;
  locEstadoID     := locFormulario.pubEstadoID;
  locEstadoCodigo := locFormulario.pubEstadoCodigo;
  locEstadoNome   := locFormulario.pubEstadoNome;
  locPaisID       := locFormulario.pubPaisID;
  locPaisCodigo   := locFormulario.pubPaisCodigo;
  locPaisNome     := locFormulario.pubPaisNome;

  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    argCidadeID.Text     := IntegerStringConverter(locCidadeID);
    argCidadeCodigo.Text := locCidadeCodigo;
    argCidadeNome.Text   := locCidadeNome;

    if argEstadoID     <> nil then argEstadoID.Text     := IntegerStringConverter(locEstadoID);
    if argEstadoCodigo <> nil then argEstadoCodigo.Text := locEstadoCodigo;
    if argEstadoNome   <> nil then argEstadoNome.Text   := locEstadoNome;

    if argPaisID     <> nil then argPaisID.Text     := IntegerStringConverter(locPaisID);
    if argPaisCodigo <> nil then argPaisCodigo.Text := locPaisCodigo;
    if argPaisNome   <> nil then argPaisNome.Text   := locPaisNome;

    Result := False;
  end;

  VCLEditClickControlar(argCidadeNome, (argCidadeNome.Text <> ''));
  if argEstadoNome <> nil then VCLEditClickControlar(argEstadoNome, True);
  if argPaisNome   <> nil then VCLEditClickControlar(argPaisNome,   True);
end;

//
// BAIRRO!
//

//
// Procedimento para exibir a lista de bairros cadastrados.
//
procedure Plataforma_ERP_VCL_BairroListaExibir;
var
  locFormulario: TPlataformaERPVCLBairroLista;
begin
  locFormulario := TPlataformaERPVCLBairroLista.Create(nil);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para exibir o cadastro do bairro.
//
procedure Plataforma_ERP_VCL_BairroExibir(argBairroID: Integer);
var
  locFormulario: TPlataformaERPVCLBairroCadastro;
begin
  if argBairroID <= 0 then Exit;

  locFormulario             := TPlataformaERPVCLBairroCadastro.Create(nil);
  locFormulario.pubBairroID := argBairroID;
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para validar um bairro.
//
function Plataforma_ERP_VCL_BairroValidar(argNovo        : Boolean;
                                          argBairroID    : TEdit;
                                          argBairroCodigo: TEdit;
                                          argBairroNome  : TEdit;
                                          argCidadeID    : TEdit = nil;
                                          argCidadeCodigo: TEdit = nil;
                                          argCidadeNome  : TEdit = nil;
                                          argEstadoID    : TEdit = nil;
                                          argEstadoCodigo: TEdit = nil;
                                          argEstadoNome  : TEdit = nil;
                                          argPaisID      : TEdit = nil;
                                          argPaisCodigo  : TEdit = nil;
                                          argPaisNome    : TEdit = nil): Boolean;
const
  PROCEDIMENTO_NOME: string = 'Plataforma_ERP_VCL_BairroValidar';
  ERRO_MENSAGEM    : string = 'Impossível validar o bairro!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
  locBairroCodigo : string;
begin
  //
  // Retorno padrão.
  //
  Result := False;
  VCLEditClickControlar(argBairroNome, False);  

  //
  // Carrega variáveis.
  //
  locBairroCodigo := StringTrim(argBairroCodigo.Text);

  //
  // Componente vazio.
  //
  if locBairroCodigo = '' then
  begin
    argBairroID.Text   := '';
    argBairroNome.Text := '';

    if argCidadeID     <> nil then argCidadeID.Text     := '';
    if argCidadeCodigo <> nil then argCidadeCodigo.Text := '';
    if argCidadeNome   <> nil then argCidadeNome.Text   := '';
    if argEstadoID     <> nil then argEstadoID.Text     := '';
    if argEstadoCodigo <> nil then argEstadoCodigo.Text := '';
    if argEstadoNome   <> nil then argEstadoNome.Text   := '';
    if argPaisID       <> nil then argPaisID.Text       := '';
    if argPaisCodigo   <> nil then argPaisCodigo.Text   := '';
    if argPaisNome     <> nil then argPaisNome.Text     := '';

    Result := True;
    Exit;
  end;

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Conexão ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(nil);

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
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Consulta dados do bairro.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                            ');
  locADOQuery.SQL.Add('  [bairro].[bairro_id],           ');
  locADOQuery.SQL.Add('  [bairro].[codigo],              ');
  locADOQuery.SQL.Add('  [bairro].[nome],                ');
  locADOQuery.SQL.Add('  [bairro].[bloqueado],           ');
  locADOQuery.SQL.Add('  [bairro].[ativo]                ');
  locADOQuery.SQL.Add('FROM                              ');
  locADOQuery.SQL.Add('  [bairro] WITH (NOLOCK)          ');
  locADOQuery.SQL.Add('WHERE                             ');
  locADOQuery.SQL.Add('  [bairro].[codigo] = :codigo AND ');
  locADOQuery.SQL.Add('  [bairro].[ativo]  = ''S''       ');

  locADOQuery.Parameters.ParamByName('codigo').Value := locBairroCodigo;

  if argNovo then
  begin   
    locADOQuery.SQL.Add(' AND [bairro].[bloqueado] = ''N'' ');
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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [bairro]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
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

    VCLConsistenciaExibir('Nenhum bairro encontrado com o código "' + locBairroCodigo + '" informado!');

    argBairroID.Text   := '';
    argBairroNome.Text := '';

    if argCidadeID     <> nil then argCidadeID.Text     := '';
    if argCidadeCodigo <> nil then argCidadeCodigo.Text := '';
    if argCidadeNome   <> nil then argCidadeNome.Text   := '';
    if argEstadoID     <> nil then argEstadoID.Text     := '';
    if argEstadoCodigo <> nil then argEstadoCodigo.Text := '';
    if argEstadoNome   <> nil then argEstadoNome.Text   := '';
    if argPaisID       <> nil then argPaisID.Text       := '';
    if argPaisCodigo   <> nil then argPaisCodigo.Text   := '';
    if argPaisNome     <> nil then argPaisNome.Text     := '';

    argBairroCodigo.SetFocus;
    Exit;
  end;

  //
  // Apenas um registro encontrado.
  //
  if locADOQuery.RecordCount = 1 then
  begin
    argBairroID.Text     := IntegerStringConverter(locADOQuery.FieldByName('bairro_id').AsInteger);
    argBairroCodigo.Text := locADOQuery.FieldByName('codigo').AsString;
    argBairroNome.Text   := locADOQuery.FieldByName('nome').AsString;

    if argCidadeID     <> nil then argCidadeID.Text     := IntegerStringConverter(locADOQuery.FieldByName('cidade_id').AsInteger);
    if argCidadeCodigo <> nil then argCidadeCodigo.Text := locADOQuery.FieldByName('cidade_codigo').AsString;
    if argCidadeNome   <> nil then argCidadeNome.Text   := locADOQuery.FieldByName('cidade_nome').AsString;
    if argEstadoID     <> nil then argEstadoID.Text     := IntegerStringConverter(locADOQuery.FieldByName('estado_id').AsInteger);
    if argEstadoCodigo <> nil then argEstadoCodigo.Text := locADOQuery.FieldByName('estado_codigo').AsString;
    if argEstadoNome   <> nil then argEstadoNome.Text   := locADOQuery.FieldByName('estado_nome').AsString;
    if argPaisID       <> nil then argPaisID.Text       := IntegerStringConverter(locADOQuery.FieldByName('pais_id').AsInteger);
    if argPaisCodigo   <> nil then argPaisCodigo.Text   := locADOQuery.FieldByName('pais_codigo').AsString;
    if argPaisNome     <> nil then argPaisNome.Text     := locADOQuery.FieldByName('pais_nome').AsString;
  end;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);

  VCLEditClickControlar(argBairroNome, True);  
  if argCidadeNome <> nil then VCLEditClickControlar(argCidadeNome, True);
  if argEstadoNome <> nil then VCLEditClickControlar(argEstadoNome, True);
  if argPaisNome   <> nil then VCLEditClickControlar(argPaisNome,   True);
  VCLCursorTrocar;

  Result := True;
end;

//
// Procedimento para selecionar um bairro.
//
function Plataforma_ERP_VCL_BairroSelecionar(argBairroID    : TEdit;
                                             argBairroCodigo: TEdit;
                                             argBairroNome  : TEdit;
                                             argCidadeID    : TEdit = nil;
                                             argCidadeCodigo: TEdit = nil;
                                             argCidadeNome  : TEdit = nil;
                                             argEstadoID    : TEdit = nil;
                                             argEstadoCodigo: TEdit = nil;
                                             argEstadoNome  : TEdit = nil;
                                             argPaisID      : TEdit = nil;
                                             argPaisCodigo  : TEdit = nil;
                                             argPaisNome    : TEdit = nil): Boolean;
var
  locFormulario  : TPlataformaERPVCLBairroSelecao;
  locClicouFechar: Boolean;
  locBairroID    : Integer;
  locBairroCodigo: string;
  locBairroNome  : string;
  locCidadeID    : Integer;
  locCidadeCodigo: string;
  locCidadeNome  : string;
  locEstadoID    : Integer;
  locEstadoCodigo: string;
  locEstadoNome  : string;
  locPaisID      : Integer;
  locPaisCodigo  : string;
  locPaisNome    : string;
begin
  Result := False;

  locBairroID     := StringIntegerConverter(argBairroID.Text);
  locBairroCodigo := StringTrim(argBairroCodigo.Text);
  locBairroNome   := StringTrim(argBairroNome.Text);

  locFormulario := TPlataformaERPVCLBairroSelecao.Create(nil);

  locFormulario.pubBairroID := locBairroID;
  locFormulario.pubCodigo   := locBairroCodigo;
  locFormulario.pubNome     := locBairroNome;
  
  locFormulario.ShowModal;

  locClicouFechar := locFormulario.pubClicouFechar;
  locBairroID     := locFormulario.pubBairroID;
  locBairroCodigo := locFormulario.pubCodigo;
  locBairroNome   := locFormulario.pubNome;
  locCidadeID     := locFormulario.pubCidadeID;
  locCidadeCodigo := locFormulario.pubCidadeCodigo;
  locCidadeNome   := locFormulario.pubCidadeNome;
  locEstadoID     := locFormulario.pubEstadoID;
  locEstadoCodigo := locFormulario.pubEstadoCodigo;
  locEstadoNome   := locFormulario.pubEstadoNome;
  locPaisID       := locFormulario.pubPaisID;
  locPaisCodigo   := locFormulario.pubPaisCodigo;
  locPaisNome     := locFormulario.pubPaisNome;

  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    argBairroID.Text     := IntegerStringConverter(locBairroID);
    argBairroCodigo.Text := locBairroCodigo;
    argBairroNome.Text   := locBairroNome;

    if argCidadeID     <> nil then argCidadeID.Text     := IntegerStringConverter(locCidadeID);
    if argCidadeCodigo <> nil then argCidadeCodigo.Text := locCidadeCodigo;
    if argCidadeNome   <> nil then argCidadeNome.Text   := locCidadeNome;
    if argEstadoID     <> nil then argEstadoID.Text     := IntegerStringConverter(locEstadoID);
    if argEstadoCodigo <> nil then argEstadoCodigo.Text := locEstadoCodigo;
    if argEstadoNome   <> nil then argEstadoNome.Text   := locEstadoNome;
    if argPaisID       <> nil then argPaisID.Text       := IntegerStringConverter(locPaisID);
    if argPaisCodigo   <> nil then argPaisCodigo.Text   := locPaisCodigo;
    if argPaisNome     <> nil then argPaisNome.Text     := locPaisNome;

    Result := False;
  end;

  VCLEditClickControlar(argBairroNome, (argBairroNome.Text <> ''));  
  if argCidadeNome <> nil then VCLEditClickControlar(argCidadeNome, True);
  if argEstadoNome <> nil then VCLEditClickControlar(argEstadoNome, True);
  if argPaisNome   <> nil then VCLEditClickControlar(argPaisNome,   True);
end;

//
// CEP!
//

//
// Procedimento para exibir a lista de CEP's cadastrados.
//
procedure Plataforma_ERP_VCL_CEPListaExibir;
var
  locFormulario: TPlataformaERPVCLCEPLista;
begin
  locFormulario := TPlataformaERPVCLCEPLista.Create(nil);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para exibir o cadastro do cep.
//
procedure Plataforma_ERP_VCL_CEPExibir(argCEPID: Integer);
var
  locFormulario: TPlataformaERPVCLCEPCadastro;
begin
  if argCEPID <= 0 then Exit;

  locFormulario          := TPlataformaERPVCLCEPCadastro.Create(nil);
  locFormulario.pubCEPID := argCEPID;
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para validar um cep.
//
function Plataforma_ERP_VCL_CEPValidar(argCEP                : TEdit;
                                       argEstrangeiro        : TCheckBox;
                                       argGenerico           : TCheckBox;
                                       argLogradouroID       : TEdit;
                                       argLogradouroCodigo   : TEdit;
                                       argLogradouroDescricao: TEdit;                                       
                                       argEndereco           : TEdit;
                                       argBairro             : TEdit;
                                       argCidade             : TEdit;
                                       argEstado             : TEdit;
                                       argPaisID             : TEdit;
                                       argPaisCodigo         : TEdit;
                                       argPaisNome           : TEdit): Boolean;                                       
const
  PROCEDIMENTO_NOME: string = 'Plataforma_ERP_VCL_CEPValidar';
  ERRO_MENSAGEM    : string = 'Impossível validar o CEP!';
var
  locADOConnection: TADOConnection;
  locADOQuery     : TADOQuery;
  locLogMensagem  : string;
  locCEP          : string;
begin
  //
  // Retorno padrão.
  //
  Result := False;
  VCLEditClickControlar(argCEP, False);  

  //
  // Carrega variáveis.
  //
  locCEP := CEPFormatar(argCEP.Text, argEstrangeiro.Checked);

  //
  // Componente vazio.
  //
  if locCEP = '' then
  begin
    VCLCheckBoxLimpar(argGenerico);
    VCLEditLimpar(argEndereco);
    Result := True;
    Exit;
  end;

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Conexão ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(nil);

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
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Consulta dados do cep.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                      ');
  locADOQuery.SQL.Add('  [cep].[cep],                                              ');
  locADOQuery.SQL.Add('  [cep].[estrangeiro],                                      ');
  locADOQuery.SQL.Add('  [cep].[generico],                                         ');
  locADOQuery.SQL.Add('  [logradouro].[logradouro_id] AS [logradouro_id],          ');
  locADOQuery.SQL.Add('  [logradouro].[codigo]        AS [logradouro_codigo],      ');
  locADOQuery.SQL.Add('  [logradouro].[descricao]     AS [logradouro_descricao],   ');    
  locADOQuery.SQL.Add('  [cep].[endereco],                                         ');
  locADOQuery.SQL.Add('  [bairro].[bairro_id]         AS [bairro_id],              ');
  locADOQuery.SQL.Add('  [bairro].[codigo]            AS [bairro_codigo],          ');
  locADOQuery.SQL.Add('  [bairro].[nome]              AS [bairro_nome],            ');
  locADOQuery.SQL.Add('  [cidade].[cidade_id]         AS [cidade_id],              ');
  locADOQuery.SQL.Add('  [cidade].[codigo]            AS [cidade_codigo],          ');
  locADOQuery.SQL.Add('  [cidade].[nome]              AS [cidade_nome],            ');
  locADOQuery.SQL.Add('  [estado].[estado_id]         AS [estado_id],              ');
  locADOQuery.SQL.Add('  [estado].[codigo]            AS [estado_codigo],          ');
  locADOQuery.SQL.Add('  [estado].[nome]              AS [estado_nome],            ');
  locADOQuery.SQL.Add('  [pais].[pais_id]             AS [pais_id],                ');
  locADOQuery.SQL.Add('  [pais].[codigo]              AS [pais_codigo],            ');
  locADOQuery.SQL.Add('  [pais].[nome]                AS [pais_nome]               ');
  locADOQuery.SQL.Add('FROM                                                        ');
  locADOQuery.SQL.Add('  [cep] WITH (NOLOCK)                                       ');
  locADOQuery.SQL.Add('  LEFT OUTER JOIN [logradouro] WITH (NOLOCK)                ');
  locADOQuery.SQL.Add('    ON [logradouro].[logradouro_id] = [cep].[logradouro_id] ');
  locADOQuery.SQL.Add('  LEFT OUTER JOIN [bairro] WITH (NOLOCK)                    ');
  locADOQuery.SQL.Add('    ON [bairro].[bairro_id] = [cep].[bairro_id]             ');
  locADOQuery.SQL.Add('  LEFT OUTER JOIN [cidade] WITH (NOLOCK)                    ');
  locADOQuery.SQL.Add('    ON [cidade].[cidade_id] = [cep].[cidade_id]             ');
  locADOQuery.SQL.Add('  LEFT OUTER JOIN [estado] WITH (NOLOCK)                    ');
  locADOQuery.SQL.Add('    ON [estado].[estado_id] = [cep].[estado_id]             ');
  locADOQuery.SQL.Add('  INNER JOIN [pais] WITH (NOLOCK)                           ');
  locADOQuery.SQL.Add('    ON [pais].[pais_id] = [cep].[pais_id]                   ');
  locADOQuery.SQL.Add('WHERE                                                       ');
  locADOQuery.SQL.Add('  [cep].[cep]       = :cep  AND                             ');
  locADOQuery.SQL.Add('  [cep].[bloqueado] = ''N'' AND                             ');
  locADOQuery.SQL.Add('  [cep].[ativo]     = ''S''                                 ');

  locADOQuery.Parameters.ParamByName('cep').Value := locCEP;


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
  // Nenhum registro encontrado.
  //
  if locADOQuery.RecordCount <= 0 then
  begin
    locADOQuery.Close;
    FreeAndNil(locADOQuery);
    locADOConnection.Close;
    FreeAndNil(locADOConnection);    
    VCLConsistenciaExibir('Nenhum CEP encontrado com o código "' + locCEP + '" informado!');
    VCLCheckBoxLimpar(argGenerico);
    VCLEditLimpar(argEndereco);
    Exit;
  end;

  //
  // Apenas um registro encontrado.
  //
  if locADOQuery.RecordCount = 1 then
  begin
    argCEP.Text                 := locADOQuery.FieldByName('cep').AsString;
    argEstrangeiro.Checked      := StringBooleanConverter(locADOQuery.FieldByName('estrangeiro').AsString);
    argGenerico.Checked         := StringBooleanConverter(locADOQuery.FieldByName('generico').AsString);

    argLogradouroID.Text        := IntegerStringConverter(locADOQuery.FieldByName('logradouro_id').AsInteger);
    argLogradouroCodigo.Text    := locADOQuery.FieldByName('logradouro_codigo').AsString;
    argLogradouroDescricao.Text := locADOQuery.FieldByName('logradouro_descricao').AsString;

    argEndereco.Text            := locADOQuery.FieldByName('endereco').AsString;

    argBairro.Text              := locADOQuery.FieldByName('bairro_nome').AsString;
    argCidade.Text              := locADOQuery.FieldByName('cidade_nome').AsString;
    argEstado.Text              := locADOQuery.FieldByName('estado_nome').AsString;

    argPaisID.Text              := IntegerStringConverter(locADOQuery.FieldByName('pais_id').AsInteger);
    argPaisCodigo.Text          := locADOQuery.FieldByName('pais_codigo').AsString;
    argPaisNome.Text            := locADOQuery.FieldByName('pais_nome').AsString;
  end;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);

  VCLEditClickControlar(argCEP, True);
  VCLCursorTrocar;

  Result := True;
end;

//
// EMPRESA!
//

//
// Procedimento para exibir a lista de empresas cadastradas.
//
procedure Plataforma_ERP_VCL_EmpresaListaExibir;
var
  locFormulario: TPlataformaERPVCLEmpresaLista;
begin
  locFormulario := TPlataformaERPVCLEmpresaLista.Create(nil);
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para exibir o cadastro de empresa.
//
procedure Plataforma_ERP_VCL_EmpresaExibir(argLicencaID    : Integer;
                                           argEmpresaBaseID: Integer;
                                           argEmpresaID    : Integer);
var
  locFormulario: TPlataformaERPVCLEmpresaCadastro;
begin
  if argEmpresaID <= 0 then Exit;

  locFormulario := TPlataformaERPVCLEmpresaCadastro.Create(nil);
  locFormulario.pubLicencaID     := argLicencaID;
  locFormulario.pubEmpresaBaseID := argEmpresaBaseID;
  locFormulario.pubEmpresaID     := argEmpresaID;
  locFormulario.ShowModal;
  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

//
// Procedimento para validar uma empresa.
//
function Plataforma_ERP_VCL_EmpresaValidar(argNovo            : Boolean;
                                           argLicencaID       : TEdit;
                                           argEmpresaBaseID   : TEdit;
                                           argEmpresaID       : TEdit;
                                           argEmpresaCodigo   : TEdit;
                                           argEmpresaDescricao: TEdit): Boolean;
const
  PROCEDIMENTO_NOME: string = 'Plataforma_ERP_VCL_EmpresaValidar';
  ERRO_MENSAGEM    : string = 'Impossível validar a empresa!';
var
  locADOConnection   : TADOConnection;
  locADOQuery        : TADOQuery;
  locLogMensagem     : string;
  locClicouFechar    : Boolean;
  locLicencaID       : Integer;
  locEmpresaBaseID   : Integer;
  locEmpresaID       : Integer;
  locEmpresaCodigo   : string;
  locEmpresaDescricao: string;
  locFormulario      : TPlataformaERPVCLEmpresaCodigo;
begin
  //
  // Retorno padrão.
  //
  Result := False;
  VCLEditClickControlar(argEmpresaDescricao, False);  

  //
  // Carrega variáveis.
  //
  locLicencaID        := StringIntegerConverter(argLicencaID.Text);
  locEmpresaBaseID    := StringIntegerConverter(argEmpresaBaseID.Text);
  locEmpresaID        := StringIntegerConverter(argEmpresaID.Text);
  locEmpresaCodigo    := StringTrim(argEmpresaCodigo.Text);
  locEmpresaDescricao := StringTrim(argEmpresaDescricao.Text);

  //
  // Componente vazio.
  //
  if locEmpresaCodigo = '' then
  begin
    argEmpresaBaseID.Text    := '';
    argEmpresaID.Text        := '';
    argEmpresaDescricao.Text := '';
    Result := True;
    Exit;
  end;

  //
  // Troca cursor.
  //
  VCLCursorTrocar(True);

  //
  // Conexão ao banco de dados.
  //
  locADOConnection := TADOConnection.Create(nil);

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
  locADOQuery                := TADOQuery.Create(nil);
  locADOQuery.Connection     := locADOConnection;
  locADOQuery.CommandTimeout := gloTimeOutNormal;

  //
  // Consulta dados da empresa.
  //
  locADOQuery.Close;
  locADOQuery.SQL.Clear;
  locADOQuery.SQL.Add('SELECT                                                ');
  locADOQuery.SQL.Add('  [base].[base_id]   AS [empresa_base_id],            ');
  locADOQuery.SQL.Add('  [base].[descricao] AS [empresa_base_titulo],        ');
  locADOQuery.SQL.Add('  [empresa].[licenca_id],                             ');
  locADOQuery.SQL.Add('  [empresa].[empresa_id],                             ');
  locADOQuery.SQL.Add('  [empresa].[codigo],                                 ');
  locADOQuery.SQL.Add('  [empresa].[descricao],                              ');
  locADOQuery.SQL.Add('  [empresa].[bloqueado],                              ');
  locADOQuery.SQL.Add('  [empresa].[ativo]                                   ');
  locADOQuery.SQL.Add('FROM                                                  ');
  locADOQuery.SQL.Add('  [empresa] WITH (NOLOCK)                             ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                     ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [empresa].[empresa_base_id] ');
  locADOQuery.SQL.Add('WHERE                                                 ');
  locADOQuery.SQL.Add('  [empresa].[licenca_id] = :licenca_id AND            ');
  locADOQuery.SQL.Add('  [empresa].[codigo]     = :codigo     AND            ');
  locADOQuery.SQL.Add('  [empresa].[ativo]      = ''S''                      ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value := locLicencaID;
  locADOQuery.Parameters.ParamByName('codigo').Value     := locEmpresaCodigo;

  if locEmpresaBaseID > 0 then
  begin
    locADOQuery.SQL.Add(' AND [empresa].[empresa_base_id] = :empresa_base_id ');
    locADOQuery.Parameters.ParamByName('empresa_base_id').Value := locEmpresaBaseID;
  end;

  if argNovo then
  begin
    locADOQuery.SQL.Add(' AND [empresa].[bloqueado] = ''N'' ');
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
      locLogMensagem := 'Ocorreu algum erro ao executar o comando SQL para consultar um registro da tabela [empresa]!';
      Plataforma_ERP_Logar(True, ERRO_MENSAGEM, locLogMensagem, locExcecao.Message, FONTE_NOME, PROCEDIMENTO_NOME);
      VCLErroExibir(ERRO_MENSAGEM, locLogMensagem, locExcecao.Message);
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
    VCLConsistenciaExibir('Nenhuma empresa encontrada com o código "' + locEmpresaCodigo + '" informado!');
    argEmpresaBaseID.Text    := '';
    argEmpresaID.Text        := '';
    argEmpresaDescricao.Text := '';
    argEmpresaCodigo.SetFocus;
    Exit;
  end;

  //
  // Apenas um registro encontrado.
  //
  if locADOQuery.RecordCount = 1 then
  begin
    argEmpresaBaseID.Text    := IntegerStringConverter(locADOQuery.FieldByName('empresa_base_id').AsInteger);
    argEmpresaID.Text        := IntegerStringConverter(locADOQuery.FieldByName('empresa_id').AsInteger);
    argEmpresaCodigo.Text    := locADOQuery.FieldByName('codigo').AsString;
    argEmpresaDescricao.Text := locADOQuery.FieldByName('descricao').AsString;
  end;

  //
  // Vários registros encontrados.
  //
  if locADOQuery.RecordCount > 1 then
  begin
    locFormulario                   := TPlataformaERPVCLEmpresaCodigo.Create(nil);
    locFormulario.pubADOQuery       := locADOQuery;
    locFormulario.pubEmpresaBaseID  := locEmpresaBaseID;
    locFormulario.pubEmpresaID      := locEmpresaID;
    locFormulario.pubCodigo         := locEmpresaCodigo;
    locFormulario.pubDescricao      := locEmpresaDescricao;

    locFormulario.ShowModal;

    locClicouFechar     := locFormulario.pubClicouFechar;
    locEmpresaBaseID    := locFormulario.pubEmpresaBaseID;
    locEmpresaID        := locFormulario.pubEmpresaID;
    locEmpresaCodigo    := locFormulario.pubCodigo;
    locEmpresaDescricao := locFormulario.pubDescricao;

    locFormulario.Release;
    FreeAndNil(locFormulario);

    if locClicouFechar then
    begin
      locADOQuery.Close;
      FreeAndNil(locADOQuery);
      locADOConnection.Close;
      FreeAndNil(locADOConnection);
      VCLCursorTrocar;
      argEmpresaCodigo.SetFocus;
      Exit;
    end;

    argEmpresaBaseID.Text    := IntegerStringConverter(locEmpresaBaseID);
    argEmpresaID.Text        := IntegerStringConverter(locEmpresaID);
    argEmpresaCodigo.Text    := locEmpresaCodigo;
    argEmpresaDescricao.Text := locEmpresaDescricao;
  end;

  //
  // Finaliza.
  //
  locADOQuery.Close;
  FreeAndNil(locADOQuery);
  locADOConnection.Close;
  FreeAndNil(locADOConnection);

  VCLEditClickControlar(argEmpresaDescricao, True);  
  VCLCursorTrocar;

  Result := True;
end;

//
// Procedimento para selecionar uma empresa.
//
function Plataforma_ERP_VCL_EmpresaSelecionar(argLicencaID       : TEdit;
                                              argEmpresaBaseID   : TEdit;
                                              argEmpresaID       : TEdit;
                                              argEmpresaCodigo   : TEdit;
                                              argEmpresaDescricao: TEdit): Boolean;
var
  locFormulario      : TPlataformaERPVCLEmpresaSelecao;
  locClicouFechar    : Boolean;
  locEmpresaBaseID   : Integer;
  locEmpresaID       : Integer;
  locEmpresaCodigo   : string;
  locEmpresaDescricao: string;
begin
  Result := False;

  locEmpresaBaseID    := StringIntegerConverter(argEmpresaBaseID.Text);
  locEmpresaID        := StringIntegerConverter(argEmpresaID.Text);
  locEmpresaCodigo    := StringTrim(argEmpresaCodigo.Text);
  locEmpresaDescricao := StringTrim(argEmpresaDescricao.Text);

  locFormulario := TPlataformaERPVCLEmpresaSelecao.Create(nil);

  locFormulario.pubEmpresaBaseID := locEmpresaBaseID;
  locFormulario.pubEmpresaID     := locEmpresaID;
  locFormulario.pubCodigo        := locEmpresaCodigo;
  locFormulario.pubDescricao     := locEmpresaDescricao;

  locFormulario.ShowModal;

  locClicouFechar     := locFormulario.pubClicouFechar;
  locEmpresaBaseID    := locFormulario.pubEmpresaBaseID;
  locEmpresaID        := locFormulario.pubEmpresaID;
  locEmpresaCodigo    := locFormulario.pubCodigo;
  locEmpresaDescricao := locFormulario.pubDescricao;

  locFormulario.Release;
  FreeAndNil(locFormulario);

  if not locClicouFechar then
  begin
    argEmpresaBaseID.Text    := IntegerStringConverter(locEmpresaBaseID);
    argEmpresaID.Text        := IntegerStringConverter(locEmpresaID);
    argEmpresaCodigo.Text    := locEmpresaCodigo;
    argEmpresaDescricao.Text := locEmpresaDescricao;
    Result := False;
  end;

  VCLEditClickControlar(argEmpresaDescricao, (argEmpresaDescricao.Text <> ''));  
end;

end.
