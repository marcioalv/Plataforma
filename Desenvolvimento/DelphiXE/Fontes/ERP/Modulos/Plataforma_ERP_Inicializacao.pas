//
// Arquivo..: Plataforma_ERP_Inicializacao.pas
// Projeto..: ERP
// Fonte....: Unit
// Cria��o..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descri��o: Fun��es e procedimentos diversos para a inicializa��o da aplica��o de ERP.
//
// Hist�rico de altera��es:
//   Nenhuma altera��o at� o momento.
//

unit Plataforma_ERP_Inicializacao;

interface

uses
  System.SysUtils,
  Winapi.Windows,
  Vcl.Forms;

procedure Plataforma_ERP_HashCodInicializar;
procedure Plataforma_ERP_LogInicializar;
function  Plataforma_ERP_UsuarioInicializar: Boolean;
function  Plataforma_ERP_UsuarioSenhaTrocaVerificar: Boolean;

implementation

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_Log,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  Plataforma_ERP_VCL_UsuarioLogon,
  Plataforma_ERP_VCL_UsuarioSenhaTrocar;

//
// Procedimento para inicializar o hashcode da aplica��o.
//
procedure Plataforma_ERP_HashCodInicializar;
var
  locMomento  : string;
  locDrive    : string;
  locProcessID: string;
begin
  locMomento   := FormatDateTime('yyyymmddhhnnsszzz', Now);
  locDrive     := IntegerStringConverter(DriveSerialNumberRecuperar(Copy(gloAppPath, 1, 1)));
  locProcessID := IntegerStringConverter(GetCurrentProcessID);

  gloAppHashCode := locMomento + locDrive + locProcessID;
end;

//
// Procedimento para iniciar o mecanismo de log da aplica��o.
//
procedure Plataforma_ERP_LogInicializar;
begin
  gloLocalLog          := TPlataformaFrameworkLog.Create;
  gloLocalLog.FilePath := gloAppPath + '\Log';
  gloLocalLog.FileNameDaily('Plataforma_ERP_VCL');

  Plataforma_ERP_Logar(False, 'M�dulo de log inicializado com sucesso!');
end;

//
// Fun��o para inicializar o usu�rio da aplica��o.
//
function Plataforma_ERP_UsuarioInicializar: Boolean;
var
  locFormulario  : TPlataformaERPVCLUsuarioLogon;
  locClicouFechar: Boolean;
begin
  //
  // Usu�rio n�o autenticado.
  //
  Result := False;

  //
  // Inicializa usu�rio.
  //
  gloUsuarioBaseID  := 0;
  gloUsuarioID      := 0;
  gloUsuarioLogon   := '';
  gloUsuarioNome    := '';
  gloUsuarioRotinas := nil;

  //
  // Exibe formul�rio de logon.
  //
  locFormulario := TPlataformaERPVCLUsuarioLogon.Create(nil);
  locFormulario.ShowModal;
  locClicouFechar := locFormulario.pubClicouFechar;
  locFormulario.Release;
  FreeAndNil(locFormulario);

  //
  // Usu�rio clicou em fechar no formul�rio de logon.
  //
  if locClicouFechar then Exit;

  //
  // Usu�rio deve trocar a senha?
  //
  if not Plataforma_ERP_UsuarioSenhaTrocaVerificar then Exit;
  
  //
  // Lista de rotinas.
  //
  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_LISTA';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_LISTA_LOCALIZAR';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_LISTA_ATUALIZAR';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_LISTA_NOVO';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_LISTA_SELECIONAR';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_FILTRO_CADASTRO'; 

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_FILTRO_AUDITORIA';  

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_CADASTRO';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_CADASTRO_ABA_CADASTRO';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_CADASTRO_ABA_AUDITORIA';  

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_CADASTRO_LOG';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_CADASTRO_ATUALIZAR';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_CADASTRO_LOCALIZAR';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_CADASTRO_NOVO';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_CADASTRO_EXCLUIR';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_CADASTRO_ALTERAR';


  
  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_USUARIO_LISTA';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_USUARIO_LISTA_LOCALIZAR';

    SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_USUARIO_LISTA_ATUALIZAR';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_USUARIO_LISTA_NOVO';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_USUARIO_LISTA_SELECIONAR';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_USUARIO_FILTRO_CADASTRO'; 

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_USUARIO_FILTRO_AUDITORIA';  

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_USUARIO_CADASTRO';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_USUARIO_CADASTRO_ABA_CADASTRO';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_USUARIO_CADASTRO_ABA_AUDITORIA';  

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_USUARIO_CADASTRO_LOG';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_USUARIO_CADASTRO_SENHA';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_USUARIO_CADASTRO_ATUALIZAR';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_USUARIO_CADASTRO_LOCALIZAR';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_USUARIO_CADASTRO_NOVO';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_USUARIO_CADASTRO_EXCLUIR';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_USUARIO_CADASTRO_ALTERAR';

  // Usu�rio autenticado.
  Result := True;
end;

//
// Fun��o para verificar e executar a troca de senha do usu�rio se for o caso.
//
function Plataforma_ERP_UsuarioSenhaTrocaVerificar: Boolean;
var
  locFormulario: TPlataformaERPVCLUsuarioSenhaTrocar;
begin
  Result := False;

  locFormulario := TPlataformaERPVCLUsuarioSenhaTrocar.Create(nil);
  locFormulario.ShowModal;

  Result := (not locFormulario.pubClicouFechar);

  locFormulario.Release;
  FreeAndNil(locFormulario);
end;

end.
