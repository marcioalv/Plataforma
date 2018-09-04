{+------------------------------------------------------------------------------------------------+}
{| Plataforma Tecnologia e Informação Ltda                               CNPJ: 22.508.362/0001-20 |}
{+------------------------------------------------------------------------------------------------+}
{| Projeto: ERP/VCL                                                                               |}
{|   Fonte: Plataforma_ERP_Principal_VCL_ConexaoTeste.pas                                         |}
{+------------------------------------------------------------------------------------------------+}
{| Formulário para execução do teste de conexão.                                                  |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 12/Março/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
{| Todos os direitos reservados:                                                                  |}
{| O código fonte com o programa de computador contido nesse arquivo são de propriedade           |}
{| exclusiva da empresa Plataforma Tecnologia e Informação Ltda, e seus direitos autorais são     |}
{| protegidos por lei.                                                                            |}
{| Nenhuma parte pode ser acessada, visualizada, utilizada, modificada, copiada ou transferida    |}
{| sem prévia permissão por escrito da proprietária.                                              |}
{| A violação de qualquer um destes direitos é crime!                                             |}
{+------------------------------------------------------------------------------------------------+}

unit Plataforma_ERP_Principal_VCL_ConexaoTeste;

interface

uses
  Plataforma_Framework_Util,
  Plataforma_Framework_Conexao,
  Plataforma_Framework_VCL,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.StdCtrls;

type
  TPlataformaERPPrincipalVCLConexaoTeste = class(TForm)
    panFormulario: TPanel;
    lblMensagem: TLabel;
    timInicializacao: TTimer;
    procedure timInicializacaoTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    priTimeOutGeral: Integer;
  
    /// <summary>
    /// Procedimento para executar o teste da conexão recebida como parâmetro pelo formulário.
    /// </summary>
    procedure TesteExecutar;
  public
    pubConexao: TConexao;
  end;

var
  PlataformaERPPrincipalVCLConexaoTeste: TPlataformaERPPrincipalVCLConexaoTeste;

implementation

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////////////////////////
// ÁREA DE EVENTOS                                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////

{+------------------------------------------------------------------------------------------------+}
{| FormCreate                                                                                     |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de criação do formulário.                                                               |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 12/Março/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLConexaoTeste.FormCreate(Sender: TObject);
begin
  //
  // Inicializa variáveis privadas.
  //
  priTimeOutGeral := 15;

  //
  // Inicializa variáveis públicas.
  //
  ConexaoLimpar(pubConexao);
end;

{+------------------------------------------------------------------------------------------------+}
{| FormShow                                                                                       |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de exibição do formulário.                                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 12/Março/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLConexaoTeste.FormShow(Sender: TObject);
begin
  //
  // Liga timer para iniciar a execução.
  //
  timInicializacao.Enabled := True;
end;

{+------------------------------------------------------------------------------------------------+}
{| FormKeyPress                                                                                   |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de pressionamento de teclas no formulário.                                              |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 12/Março/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLConexaoTeste.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ESC then Close;
end;

{+------------------------------------------------------------------------------------------------+}
{| timInicializacaoTimer                                                                          |}
{+------------------------------------------------------------------------------------------------+}
{| Evento de timer no componente timInicializacao.                                                |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 28/Fevereiro/2018 por Marcio Alves.                                                  |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLConexaoTeste.timInicializacaoTimer(Sender: TObject);
begin
  //
  // Desliga o timer de inicialização pois ele só deve ser executado uma única vez.
  //
  timInicializacao.Enabled := False;

  //
  // Chama teste.
  //
  TesteExecutar;
end;

////////////////////////////////////////////////////////////////////////////////////////////////////
// ÁREA DE PROCEDIMENTOS E FUNÇÕES                                                                //
////////////////////////////////////////////////////////////////////////////////////////////////////

{+------------------------------------------------------------------------------------------------+}
{| TesteExecutar                                                                                  |}
{+------------------------------------------------------------------------------------------------+}
{| Criado em 12/Março/2018 por Marcio Alves.                                                      |}
{+------------------------------------------------------------------------------------------------+}
procedure TPlataformaERPPrincipalVCLConexaoTeste.TesteExecutar;
var
  locSucesso : Boolean;
  locMensagem: string;
begin
  //
  // Muda cursor.
  //
  VCLCursorTrocar(True);

  //
  // Configura o timeout geral para o teste.
  //
  pubConexao.TimeOut := priTimeOutGeral;

  //
  // Executar teste.
  //
  ADOConexaoTestar(pubConexao, locSucesso, locMensagem);

  //
  // Falha no teste.  
  if not locSucesso then
  begin
    VCLCursorTrocar;
    Hide;
    VCLConsistenciaExibir('Não foi possível estabeler uma conexão com os dados informados!', locMensagem);
    Close;
    Exit;
  end;

  //
  // Sucesso no teste.
  //
  VCLCursorTrocar;
  Hide;
  VCLInformacaoExibir('Conexão estabelecida com sucesso!');

  //
  // Fecha formulário.
  //
  Close;
end;

end.
