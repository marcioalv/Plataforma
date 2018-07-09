//
// Arquivo..: Plataforma_ERP_Generico.pas
// Projeto..: ERP
// Fonte....: Unit
// Cria��o..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Fun��es e procedimentos diversos de uso gen�rico da aplica��o de ERP.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
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
  // O objeto de conex�o ADO est� instanciado?
  if argADOConnection = nil then
  begin
    locMsgErro := 'O objeto de conex�o ADO com o banco de dados n�o foi instanciado!';
    PlataformaERPLogar(True, locMsgErro, UNIT_NOME, PROCEDIMENTO_NOME);
    raise Exception.Create(locMsgErro);
  end;

  // A conex�o ADO est� estabelecida?
  if not argADOConnection.Connected then
  begin
    locMsgErro := 'A conex�o ADO com o banco de dados n�o foi estabelecida!';
    PlataformaERPLogar(True, locMsgErro, UNIT_NOME, PROCEDIMENTO_NOME);
    raise Exception.Create(locMsgErro);
  end;
end;

end.
