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
  Plataforma_Framework_Log,
  Plataforma_ERP_Global,
  Plataforma_ERP_Generico,
  System.SysUtils;

procedure PlataformaERPLogInicializar;

implementation

procedure PlataformaERPLogInicializar;
begin
  gloLocalLog          := TPlataformaFrameworkLog.Create;
  gloLocalLog.FilePath := gloAppPath + '\Log';
  gloLocalLog.FileNameDaily('Plataforma_ERP_VCL');

  PlataformaERPLogar(True, 'Módulo de log inicializado com sucesso!');
end;

end.
