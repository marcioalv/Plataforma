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
  // Consulta dados do tipo de usuário.
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
end;

end.
