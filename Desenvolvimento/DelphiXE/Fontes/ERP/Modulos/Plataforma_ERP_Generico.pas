//
// Arquivo..: Plataforma_ERP_Generico.pas
// Projeto..: ERP
// Fonte....: Unit
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Funções e procedimentos diversos de uso genérico da aplicação de ERP.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_Generico;

interface

uses
  System.SysUtils,
  Data.Win.ADODB,
  Plataforma_Framework_Util,
  Plataforma_ERP_Global;

procedure PlataformaERPLogar(argCritico  : Boolean;
                             argMensagem1: string;
                             argMensagem2: string = '';
                             argMensagem3: string = '';
                             argMensagem4: string = '');

procedure PlataformaERPConexaoADOConsistir(argADOConnection: TADOConnection);

implementation

const
  UNIT_NOME: string = 'Plataforma_ERP_Generico.pas';

//
// PlataformaERPLogar.
//
procedure PlataformaERPLogar(argCritico  : Boolean;
                             argMensagem1: string;
                             argMensagem2: string = '';
                             argMensagem3: string = '';
                             argMensagem4: string = '');
var
  locHostName   : string;
  locUserName   : string;
  locAppName    : string;
  locAppHashCode: string;
  locAppUserID  : string;
  locAppUserName: string;
  locMensagem   : string;
begin
  locHostName    := HostNameRecuperar;
  locUserName    := UserNameRecuperar;
  locAppName     := 'Plataforma_ERP_VCL';
  locAppHashCode := gloAppHashCode;
  locAppUserID   := IntegerStringConverter(gloUsuarioID);
  locAppUserName := gloUsuarioNome;

  locMensagem := argMensagem1;
  if argMensagem2 <> '' then locMensagem := locMensagem + ' -> ' + argMensagem2;
  if argMensagem3 <> '' then locMensagem := locMensagem + ' -> ' + argMensagem3;
  if argMensagem4 <> '' then locMensagem := locMensagem + ' -> ' + argMensagem4;

  gloLocalLog.Write(locHostName, locUserName, locAppName, locAppHashCode, locAppUserID, locAppUserName, argCritico, locMensagem);
end;

//
// PlataformaERPADOConexaoConsistir.
//
procedure PlataformaERPConexaoADOConsistir(argADOConnection: TADOConnection);
const
  PROCEDIMENTO_NOME: string = 'PlataformaERPConexaoADOConsistir';
var
  locMsgErro: string;
begin
  // O objeto de conexão ADO está instanciado?
  if argADOConnection = nil then
  begin
    locMsgErro := 'O objeto de conexão ADO com o banco de dados não foi instanciado!';
    PlataformaERPLogar(True, locMsgErro, UNIT_NOME, PROCEDIMENTO_NOME);
    raise Exception.Create(locMsgErro);
  end;

  // A conexão ADO está estabelecida?
  if not argADOConnection.Connected then
  begin
    locMsgErro := 'A conexão ADO com o banco de dados não foi estabelecida!';
    PlataformaERPLogar(True, locMsgErro, UNIT_NOME, PROCEDIMENTO_NOME);
    raise Exception.Create(locMsgErro);
  end;
end;

end.
