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
procedure Plataforma_ERP_VCL_LogRegistroExibir(argIdentificador: string; argADOQuery: TADOQuery);

//
// Plataforma_ERP_VCL_BaseCadastroExibir.
//
procedure Plataforma_ERP_VCL_BaseCadastroExibir(argBaseID: Integer);

//
// Plataforma_ERP_VCL_LicencaCadastroExibir.
//
procedure Plataforma_ERP_VCL_LicencaCadastroExibir(argLicencaID: Integer);

//
// Plataforma_ERP_VCL_TipoUsuarioValidar.
//
procedure Plataforma_ERP_VCL_TipoUsuarioValidar(argNovo                : Boolean;
                                                argLicencaID           : TEdit;
                                                argTipoUsuarioBaseID   : TEdit;
                                                argTipoUsuarioID       : TEdit;
                                                argTipoUsuarioCodigo   : TEdit;
                                                argTipoUsuarioDescricao: TEdit);

//
// Plataforma_ERP_VCL_TipoUsuarioSelecionar.
//
procedure Plataforma_ERP_VCL_TipoUsuarioSelecionar(argLicencaID           : TEdit;
                                                   argTipoUsuarioBaseID   : TEdit;
                                                   argTipoUsuarioID       : TEdit;
                                                   argTipoUsuarioCodigo   : TEdit;
                                                   argTipoUsuarioDescricao: TEdit);

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
  Plataforma_ERP_VCL_TiposUsuariosCodigo,
  Plataforma_ERP_VCL_TiposUsuariosSelecao;

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
procedure Plataforma_ERP_VCL_LogRegistroExibir(argIdentificador: string; argADOQuery: TADOQuery);
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
// Procedimento para validar um tipo de usuário.
//
procedure Plataforma_ERP_VCL_TipoUsuarioValidar(argNovo                : Boolean;
                                                argLicencaID           : TEdit;
                                                argTipoUsuarioBaseID   : TEdit;
                                                argTipoUsuarioID       : TEdit;
                                                argTipoUsuarioCodigo   : TEdit;
                                                argTipoUsuarioDescricao: TEdit);
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
  locADOQuery.SQL.Add('SELECT                                             ');
  locADOQuery.SQL.Add('  [base].[base_id],                                ');
  locADOQuery.SQL.Add('  [base].[descricao] AS [base_titulo],             ');
  locADOQuery.SQL.Add('  [tipo_usuario].[licenca_id],                     ');
  locADOQuery.SQL.Add('  [tipo_usuario].[tipo_usuario_id],                ');
  locADOQuery.SQL.Add('  [tipo_usuario].[codigo],                         ');
  locADOQuery.SQL.Add('  [tipo_usuario].[descricao],                      ');
  locADOQuery.SQL.Add('  [tipo_usuario].[bloqueado],                      ');
  locADOQuery.SQL.Add('  [tipo_usuario].[ativo]                           ');
  locADOQuery.SQL.Add('FROM                                               ');
  locADOQuery.SQL.Add('  [tipo_usuario] WITH (NOLOCK)                     ');
  locADOQuery.SQL.Add('  INNER JOIN [base] WITH (NOLOCK)                  ');
  locADOQuery.SQL.Add('    ON [base].[base_id] = [tipo_usuario].[base_id] ');
  locADOQuery.SQL.Add('WHERE                                              ');
  locADOQuery.SQL.Add('  [tipo_usuario].[licenca_id] = :licenca_id AND    ');
  locADOQuery.SQL.Add('  [tipo_usuario].[codigo]     = :codigo     AND    ');
  locADOQuery.SQL.Add('  [tipo_usuario].[ativo]      = ''S''              ');

  locADOQuery.Parameters.ParamByName('licenca_id').Value := locLicencaID;
  locADOQuery.Parameters.ParamByName('codigo').Value     := locTipoUsuarioCodigo;

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
    argTipoUsuarioBaseID.Text    := IntegerStringConverter(locADOQuery.FieldByName('base_id').AsInteger);
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
end;

//
// Procedimento para selecionar um tipo de usuário.
//
procedure Plataforma_ERP_VCL_TipoUsuarioSelecionar(argLicencaID           : TEdit;
                                                   argTipoUsuarioBaseID   : TEdit;
                                                   argTipoUsuarioID       : TEdit;
                                                   argTipoUsuarioCodigo   : TEdit;
                                                   argTipoUsuarioDescricao: TEdit);
var
  locFormulario          : TPlataformaERPVCLTiposUsuariosSelecao;
  locClicouFechar        : Boolean;
  locTipoUsuarioBaseID   : Integer;
  locTipoUsuarioID       : Integer;
  locTipoUsuarioCodigo   : string;
  locTipoUsuarioDescricao: string;
begin
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
  end;
end;

end.
