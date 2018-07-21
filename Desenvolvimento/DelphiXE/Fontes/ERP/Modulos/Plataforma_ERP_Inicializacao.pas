//
// Arquivo..: Plataforma_ERP_Inicializacao.pas
// Projeto..: ERP
// Fonte....: Unit
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Funções e procedimentos diversos para a inicialização da aplicação de ERP.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_Inicializacao;

interface

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_Log,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  System.SysUtils,
  Winapi.Windows;

procedure PlataformaERPHashCodInicializar;
procedure PlataformaERPLogInicializar;
function PlataformaERPUsuarioInicializar: Boolean;

implementation

//
// Procedimento para inicializar o hashcode da aplicação.
//
procedure PlataformaERPHashCodInicializar;
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
// Procedimento para iniciar o mecanismo de log da aplicação.
//
procedure PlataformaERPLogInicializar;
begin
  gloLocalLog          := TPlataformaFrameworkLog.Create;
  gloLocalLog.FilePath := gloAppPath + '\Log';
  gloLocalLog.FileNameDaily('Plataforma_ERP_VCL');

  Plataforma_ERP_Logar(False, 'Módulo de log inicializado com sucesso!');
end;

//
// Função para inicializar o usuário da aplicação.
//
function PlataformaERPUsuarioInicializar: Boolean;
begin
  // Inicializa usuário.
  gloUsuarioBaseID  := 0;
  gloUsuarioID      := 0;
  gloUsuarioLogon   := '';
  gloUsuarioNome    := '';
  gloUsuarioRotinas := nil;

  // Usuário autenticado.
  gloUsuarioBaseID := 1;
  gloUsuarioID     := 1;
  gloUsuarioLogon  := 'administrador';
  gloUsuarioNome   := 'Administrador do Sistema';

  // Lista de rotinas.
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
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_CADASTRO';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_CADASTRO_LOG';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_CADASTRO_LOCALIZAR';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_CADASTRO_NOVO';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_CADASTRO_EXCLUIR';

  SetLength(gloUsuarioRotinas, Length(gloUsuarioRotinas) + 1);
  gloUsuarioRotinas[Length(gloUsuarioRotinas) - 1] := 'ERP_TIPO_USUARIO_CADASTRO_ALTERAR';

  // Usuário autenticado.
  Result := True;
end;

end.
