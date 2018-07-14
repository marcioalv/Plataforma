//
// Arquivo..: Plataforma_ERP_LogRegistro.pas
// Projeto..: ERP
// Fonte....: Unit
// Criação..: 31/Maio/2018
// Autor....: Marcio Alves (marcioalv@yahoo.com.br)
// Descrição: Funções e procedimentos diversos para tratar o log dos registros.
//
// Histórico de alterações:
//   Nenhuma alteração até o momento.
//

unit Plataforma_ERP_LogRegistro;

interface

uses
  Plataforma_ERP_RegistroAcao;

// TPlataforma_ERP_LogRegistro.
type
  TPlataforma_ERP_LogRegistro = record
    LogLocalDtHr      : TDateTime;
    LogServerDtHr     : TDateTime;
    RegistroAcao      : TPlataforma_ERP_RegistroAcao;
    HostName          : string;
    UserName          : string;
    UsuarioBaseID     : Integer;
    UsuarioID         : Integer;
    UsuarioNome       : string;
  end;

// TPlataforma_ERP_LogRegistroLista.
type
  TPlataforma_ERP_LogRegistroLista = array of TPlataforma_ERP_LogRegistro;

// Plataforma_ERP_LogRegistroLimpar.
procedure Plataforma_ERP_LogRegistroLimpar(argLogRegistro: TPlataforma_ERP_LogRegistro);

implementation

//
// Plataforma_ERP_LogRegistroLimpar.
//
procedure Plataforma_ERP_LogRegistroLimpar(argLogRegistro: TPlataforma_ERP_LogRegistro);
begin
  with argLogRegistro do
  begin
    LogLocalDtHr       := 0;
    LogServerDtHr      := 0;
    Plataforma_ERP_RegistroAcaoLimpar(RegistroAcao);
    HostName           := '';
    UserName           := '';
    UsuarioBaseID      := 0;
    UsuarioID          := 0;
    UsuarioNome        := '';
  end;
end;

end.
